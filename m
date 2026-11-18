Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011565;
	b=u4aMvWDoiY00HIuDOQski96kXEYTeESEp7OuJRw+ufVFbr2X5dhl5Gb2TRxs1wdMyCbT
	 msPVG3wyPtSKwfHF8J4hiib777v+1H+fP02kzuvi0aFmm3KtjT/XgLA4jSf67Ot5lKZxp
	 ANofmE2U1ENZoocK69Pl6tx8Wm18qTe4gqHp4EySfgxy/lXW8NFDUUnql57CA7K73Iq7T
	 kAtFazFkLw3vgFEkVqsZmPvR/fonMLrYNRPZ8FZv3GwL3h80cX3SW7Q7p4BWYKOMKwKOs
	 lHcMmMaMxpqqQQSky0uqYT+k0qdZmrNm4BXJ+6PiI0kBRZM3VOWEPHsCAKjyMJn7zTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011565;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Ghqi8if3Bs1YW0S7JoLfzeRAWiWoPJXcZKJAFnFQ6PM=;
	b=E6Uf+lbUVfHyhZn1uINodAehjiEwQE0Ewdx1F4R2ND0q5orqVSFByO6f4PIsdMCqx6ha
	 XVHQYlBET8rYZAQnjkqSPZ8pmIlnnGeJgYEoXJeWLeWnrRKed2kz+Tniq9A+TSAnHuFLG
	 QJBh8ksJK4F33he6AJ7HMeZL4DiXM18seDJcH84idoC110/Ja3G/3QaNWWuP1VQv7C4UR
	 lTbfFGM3m1/FrL65B/pGSw1XC/IevAe4LQ/pfYHjOLG6dOJ45nbu4af5g/ZFimx4oIDFG
	 wILxEPyEPbpcEogqLerYF/dr+fhSggmaHm1B1ya3CiSTDcFmGu+Hr26PdplOkvE8Z/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pIZK346X;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAC60A260F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAAC60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pIZK346X
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9KmHjtdnXwXJ1w3kCzrUC66exrS1n7IIqBjE+hCq/yE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795011557; v=1; x=1795616357;
 b=pIZK346XxOkXizfuJqsQPLb5LyslAxxVomOAP2Hs5ITu+ybEVumrQtMdKTCGiBBcBnF3WRsO
 QVC9neDuMMlXZ0jxIO/PCCHylSGkx8RZr9JY9Tk/BGpI7nLWAQI49jepXyKMQ4a33N0IYuiFKnL
 RoyEyaFlefbBio1bcqXyuTYs=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0787a3dd2c003c2f;
	Wed, 18 Nov 2026 14:19:17 +0000
X-Mizu-Trace-ID: 0787a3dd2c003c2f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 16:19:11 +0200
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
	Salih Erim <salih.erim@amd.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: Support ROHM BD79111
Message-ID: <f69b996cc07fad1712871fb8b0436c71abd435b9.1795009599.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1795009599.git.mazziesaccount@gmail.com>
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
	protocol="application/pgp-signature"; boundary="KnfmTtM03YGVjooE"
Content-Disposition: inline
In-Reply-To: <cover.1795009599.git.mazziesaccount@gmail.com>

--KnfmTtM03YGVjooE
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

---

Note, I had to change the 'root-level' additionalProperties: false to
unevaluatedProperties: false in order to allow the properties in the new
allOf:
  - if:
     ...

section. It seems to me this is what a few other bindings in IIO do, but
I suppose it makes this "less strict". Well, since I am terrible with
writing bindings, I'd better point this out and ask if it's ok, or if
there are better way(s) to handle this?
---
 .../bindings/iio/adc/rohm,bd79112.yaml        | 72 +++++++++++++------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml b/=
Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
index aa8b07c3fac1..4f105124ee6f 100644
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
@@ -37,23 +40,6 @@ properties:
   "#size-cells":
     const: 0
=20
-patternProperties:
-  "^channel@([0-9]|[12][0-9]|3[01])$":
-    type: object
-    $ref: /schemas/iio/adc/adc.yaml#
-    description: Represents ADC channel. Omitted channels' inputs are GPIO=
s.
-
-    properties:
-      reg:
-        description: AIN pin number
-        minimum: 0
-        maximum: 31
-
-    required:
-      - reg
-
-    additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -62,7 +48,49 @@ required:
   - spi-cpha
   - spi-cpol
=20
-additionalProperties: false
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rohm,bd79112
+    then:
+      patternProperties:
+        "^channel@([0-9]|[12][0-9]|3[01])$":
+          type: object
+          $ref: /schemas/iio/adc/adc.yaml#
+          description: Represents ADC channel. Omitted channels' inputs ar=
e GPIOs.
+
+          properties:
+            reg:
+              description: AIN pin number
+              minimum: 0
+              maximum: 31
+
+          required:
+            - reg
+
+          additionalProperties: false
+    else:
+      # BD79111 has only 16 channels
+      patternProperties:
+        "^channel@([0-9]|1[0-5])$":
+          type: object
+          $ref: /schemas/iio/adc/adc.yaml#
+          description: Represents ADC channel. Omitted channels' inputs ar=
e GPIOs.
+
+          properties:
+            reg:
+              description: AIN pin number
+              minimum: 0
+              maximum: 15
+
+          required:
+            - reg
+
+          additionalProperties: false
=20
 examples:
   - |
--=20
2.56.1


--KnfmTtM03YGVjooE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmr9s98ACgkQeFA3/03a
ocV6twgAsWdB8QQP52f5xj3Jq+eNA6bXmVFPSzcKLM4cSRONcMW7HVOPq8Uh65c1
2oxUnO3GgsPL1n5P6w2h3CiqvNN7c64W7VnVDbM+AfpeAot0/jJYmDzZ5yqjZ4Sy
952GvITt0EyQTmNaW7245Q+IzV6cKmTmmfTH8JJOBe+GQbXhfhSfhXR2aLQA62af
eCFyEjV9pUCwb3/PLGTx60wcnJZ27wwM2HdK5lwyJ7aSU7RfKEjqsJJgHRcCMjCD
lBZie0PbOgiHTnXFUvJ1m30KoaEIK5TJkXYH/Toj/ZQv3ws+1Temfdwfjp8YKGkp
3a0PAltOTJ6q1rWtNNyOTi+MYSqtYA==
=w+r8
-----END PGP SIGNATURE-----

--KnfmTtM03YGVjooE--
