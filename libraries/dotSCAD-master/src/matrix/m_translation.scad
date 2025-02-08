/**
* m_translation.scad
*
* @copyright Justin Lin, 2019
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-m_translation.html
*
**/

use <matrix/_impl/_m_translation_impl.scad>;

function m_translation(v) = _m_translation_impl(v);