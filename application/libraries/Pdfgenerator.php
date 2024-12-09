<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Ensure that the Dompdf namespace is properly loaded
use Dompdf\Dompdf;

class Pdfgenerator {

    public function __construct()
    {
        // Automatically load Dompdf class if not already loaded
        if (!class_exists('Dompdf')) {
            // Adjust the path to the Composer autoload file
            require_once(APPPATH . 'vendor/autoload.php'); // Use Composer's autoload file
        }
    }

    // Generate PDF from HTML
    public function generate($html, $filename = '', $stream = TRUE, $paper = 'A4', $orientation = "portrait") 
    {
        // Initialize Dompdf
        $dompdf = new Dompdf();
        $dompdf->loadHtml($html);
        $dompdf->setPaper($paper, $orientation);
        $dompdf->render();

        // Output PDF
        if ($stream) {
            // Display PDF in browser
            $dompdf->stream($filename . ".pdf", array("Attachment" => 0)); // Attachment: 0 means open in browser, 1 means download
        } else {
            // Return PDF file content
            return $dompdf->output();
        }
    }
}
