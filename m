Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421959;
	b=Nrh4sYa6nf4Sw/oXshCMRiU8uUMID+i652f8jY35wKL7hJBqH/Q0Fwvma1YuZD5tYgb1
	 RkTKUiUv/RORo9vO8TxCGRGAP1jPuiMmRn7KOOuP//Thc3VjgLvHTTAEGoVrJTIkUMpkK
	 dFakdB61bP11ewtlDyooctXVkPXgErXmWRfiXUxle3CgjGHZcuZ8iXGepfDYrdsDChwxw
	 yUMjiH7JJRE0hM2cYDXdYxUuk/4MagTrBzhHGblt/6RxSFUthcSiIa1n31zGS2iM2R7h6
	 CPWWsdJjfWP2WkJWlguyENc0tU1ayn38RfYTVpYIYBim8yxNRSy0UuVoKUtyOowQd0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kMwNhIuC2YlcL171wo+XyDF8jZlForwDkSr7ngqU/QA=;
	b=GL52Ups0qlVu6Ao4jZsux419P6Qsr6J/hG0Tsrk1UOXyVt1doI7UZ1BXooL+b6wPPhna
	 7fXocmFpl/Lq+HjASUGcM53SO2VE1hRmf4GT1eYah+rswE4GdHk2br+/8ftgmbbrAR5FR
	 Z7xVCmKkeW/WNrl10QrAu8MuYkFRqUvlO0blenQ3tP/Kf5kc4UlG4o8E6fl16oN3z9QFh
	 kyjCIRQ/sHmbhds4YQEcfD2XJ4lRJhZbwjZYH/0JMzhnjeElhCb5yky7QYpBy+BY48MTy
	 /orCUzqo2O9e36pqghG+x/hdrd32NTvlP7alELlHoQXk5twqeW5bJ0E91et9LYDVSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fvaJWcmt;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B4606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fvaJWcmt
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OfOwvOHvkBpohcgTPdiVb5bdoAeeSI8pBm+R/aMqz6c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795421956; v=1; x=1796026756;
 b=fvaJWcmtsknFMwRhzn/mUBQUufACoJBK8jdhzQaeyXmFs4ycJk0FmJUpORjOdt6v04NeQKIk
 0hq9p3uOqt41AftwLwMZ7ZisVevInkQ7uncceXZnLsrCgQLBi/nQ8hq8cDGgxJ2nfDotEoxkd9S
 Rkrvbz2TurPVL0aMBn1iPk84=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 794c4746cfecb259;
	Mon, 23 Nov 2026 08:19:16 +0000
X-Mizu-Trace-ID: 794c4746cfecb259
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 10:19:08 +0200
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Radu Sabau <radu.sabau@analog.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: iio: Support ROHM BD79111
Message-ID: <6e76f5f0cc28d7e981a037e703435e1688409aa6.1795421473.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1795421473.git.mazziesaccount@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tgEaR3Vp78LrHKNc"
Content-Disposition: inline
In-Reply-To: <cover.1795421473.git.mazziesaccount@gmail.com>

--tgEaR3Vp78LrHKNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

ROHM BD79111 is very similar to the BD79112. Both are ADC/GPIO devices,
where pins can be configured to be either used as GPIO or ADC inputs.
ADCs are 12-bit SAR ADCs and GPIOs support input/output but not being IRQ
sources.

The main difference is amount of channels/GPIOs. The BD79112 has 32 pins
for this use, the BD79111 has 16. Furthermore, the BD79111 data-sheet
promises 0.5 MSPS sample rate with maximum of 10 MHz SPI clock,  whereas
the BD79112 data-sheet mentioned 1MSPS rate with maximum of 20 MHz SPI
clock.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Revision history:
v2 =3D>
 - No changes
---
 .../bindings/iio/adc/rohm,bd79112.yaml        | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml b/=
Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
index aa8b07c3fac1..a0fd87716611 100644
--- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
@@ -4,18 +4,21 @@
 $id: http://devicetree.org/schemas/iio/adc/rohm,bd79112.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
=20
-title: ROHM BD79112 ADC/GPO
+title: ROHM BD79111 and BD79112 ADC/GPIO
=20
 maintainers:
   - Matti Vaittinen <mazziesaccount@gmail.com>
=20
 description: |
-  The ROHM BD79112 is a 12-bit, 32-channel, SAR ADC. ADC input pins can be
-  also configured as general purpose inputs/outputs. SPI should use MODE 3.
+  The ROHM BD79112 is a 12-bit, 32-channel, SAR ADC. The ROHM BD79111 is
+  a 12-bit, 16-channel, SAR ADC. ADC input pins can be also configured as
+  general purpose inputs/outputs. SPI should use MODE 3.
=20
 properties:
   compatible:
-    const: rohm,bd79112
+    enum:
+      - rohm,bd79111
+      - rohm,bd79112
=20
   reg:
     maxItems: 1
@@ -45,7 +48,9 @@ patternProperties:
=20
     properties:
       reg:
-        description: AIN pin number
+        description:
+          AIN pin number. The BD79111 has pins 0 - 15, the BD79112 has pins
+          0 - 31.
         minimum: 0
         maximum: 31
=20
@@ -64,6 +69,20 @@ required:
=20
 additionalProperties: false
=20
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rohm,bd79111
+    then:
+      patternProperties:
+        "^channel@([0-9]|1[0-5])$":
+          properties:
+            reg:
+              maximum: 15
+        "^channel@(1[6-9]|2[0-9]|3[01])$": false
+
 examples:
   - |
     spi {
--=20
2.56.1


--tgEaR3Vp78LrHKNc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmsD9vwACgkQeFA3/03a
ocXBiggApdlslXHrBZkMCl6AvScV1KsvDURL6o6YTiCGNyBw1YMYckBRx9ga9lLP
bTYuuXkeGcgwnZYO6z97HZi4wrF5L2TNjdaT/8mPvS55vphD3ph5onV1uxzPDkk5
CPdwL9MSqHG25CipDbL3fYLIht2nxfENQSUirZdFDXtY4WD+KbllGkQ3AEcW7yPH
YMxeolxNM/t4SYk575x1Dt1trBFlKDEOC6V7MDl9nrPRLd0gpeFkQBpo1erktpaq
UP96Wd2//EMwlatShhmZSIe6cKgFJu0iB+o9E3xQgk8mO/15d0Gs0EXxsHNvfKex
/SgGYK/GpyDkhM2PS/htQxshPswfBw==
=o0Cq
-----END PGP SIGNATURE-----

--tgEaR3Vp78LrHKNc--
