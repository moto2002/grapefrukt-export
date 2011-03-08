/*
Copyright 2011 Martin Jonasson, grapefrukt games. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
      conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
      of conditions and the following disclaimer in the documentation and/or other materials
      provided with the distribution.

THIS SOFTWARE IS PROVIDED BY grapefrukt games "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL grapefrukt games OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the
authors and should not be interpreted as representing official policies, either expressed
or implied, of grapefrukt games.
*/

package com.grapefrukt.exporter.extractors {
	import com.grapefrukt.exporter.textures.FontSheet;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Martin Jonasson (m@grapefrukt.com)
	 */
	
	public class FontExtractor {
		
		private static const DEFAULT_CHARS:String = "! \"#$%&'()*+,-./" + 
													"0123456789:;<=>?" + 
													"@ABCDEFGHIJKLMNO" + 
													"PQRSTUVWXY>[\\]^_" + 
													"ïabcdefghijklmno" + 
													"pqrstuvwxyzäÄöÖ " + 
													"åÅ";
		
		public static function extract(textFormat:TextFormat, characters:String = "", referenceChar:String = "M", cols:int = 16):FontSheet {
			var sprite:Sprite = new Sprite;
			sprite.name = textFormat.font.toLowerCase();
			
			if (characters == "") characters = DEFAULT_CHARS;
			var chars:Array = characters.split("");
			
			var count:int = 0;
			for each(var char:String in chars) {
				var text:TextField = new TextField;
				text.name = char;
				text.autoSize = TextFieldAutoSize.LEFT;
				text.defaultTextFormat = textFormat;
				text.text = char;
				sprite.addChild(text);
			}
			
			var fontSheet:FontSheet = TextureExtractor.extract(sprite, null, false, FontSheet) as FontSheet;
			fontSheet.merge();
			
			return fontSheet;
		}
		
	}

}