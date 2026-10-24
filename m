Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883662;
	b=sOda71Ss7myl2acYY9QFSbWTxgS8fxI7hTjzGo/qoYK+BqVmsohB4bpkbtjp7EBBwh6B
	 HfXLnl3W8f02oFNi5seZuHdiDTT+OemiOQNgyhVnH1PEjPf0qf8TymOsCOuvWOd2q3U91
	 Yd/J7ZL8WbsJKhsOxseRAlA5XCzHf40rmNy5VfwTlidYu0DpyCIUr7S8By7/0Uzuxgzh7
	 Mg0cf+F7R/BB6ugELhR+J0cjY70gYO6IvXRpaRLmv4JVfidM2c3YdUEw+Ic4NDkIESJz9
	 5AaQiufmIu/bvB6l6xdGx3EBV9MESXU8DJvEw7NNDQPY6ik+PC/AagPpkwXHb1KoMrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
	b=1cJT5kKNEcsUi5xOvEsYcYwqwach3OCOUMB564xpdoa8kmwhFsxCjl/AXvkKff7PLv6M
	 4bF7CsAR7aYOmQNGwmhoFW4sL9QKaltSaLVDhIvuMSa9lWj0UJ3O2aPew5PHMcLW/N246
	 D88TM+mY45oSrp+IsRyjtk9S1iS71dN3KG7mGkBFXGxCxVj4nDgjxQnmZCiiP8FsbQuuE
	 VYoMWpsSR30jOnphLy28JPDSTP1doJ8w7scAIN7bcW83QqLfNhrpbA+JkgNCdlpqyicPF
	 cc86R686N1a6eiAOS3vaxlzEARqIrqxKibOvJbb5cYic2u9hzzukJeP/VCECkfNr82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewMIEmbs;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F2606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60F2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewMIEmbs
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so682378e0c.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883661; x=1793488461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
        b=ewMIEmbsu9tOqj6iGT5IHVKFXdOvdSfNHrxKvbkbMeMT+n458VGwTw14rQNtJQ8/pd
         Ms7VQTQo5EjIbuZGAcXQ7o7di0Y944dfVi5jQl3GUHXWG5i2p/LavU6E56m5vvLR7RqN
         nk24TpKD4r00Lu080elWDjOFWOp9NMCEWs7k/nyFyIbECBGtDk/3jKnChnSSBMMLyDPk
         Zaju8bPvKTCLsgznD5yvnyp+5r0XF9RiUWAkB/Mq01JevH9LLrS/cC+0pbew+1EDo/zk
         V0niDYl3//VFtyAKCup3p8rShId7LnjwEBGVCXCFbtdEAil4N3aYmNmt1OIC+lUmnG1Q
         vzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883661; x=1793488461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
        b=xOprsd56SzEh1HyaRLalz89AwRFyWecKyesw67TY9vlWP+ABA8/CQoHo+kxNpChLx6
         677TI+q0zsm+r7UUeWRw0F25pa1s8MsTaQAcY0AohAowkaiqQ7/6B+989YR7LefFW2NQ
         XqERfLcVrR3t7ztTvljUFRZ7qGlSm6jIlHB/RcpjFv4uetIc0fNB0gkmgu3AyLdgJ7Q4
         PF8Q82+9Thbh0xorY6u6NozcUQ8h0b5J5gbl1t/SkNchSb9n22bSCZg43SZOdME/SbqD
         Gi0+A0c+tQ44fFZfWHfrpBHiB+G7wG6mpcqBx6fV0nOF6En1rQ+Xbr4bkZPNQBlZVPQc
         hGMg==
X-Forwarded-Encrypted: i=1; AKwUvBzq3EnW302Mw+tgTs6n0gsFXGIoLu5Jl/gOrxfy/82t0ksJhxxXiFlmv7IKfuliBBR9CFlkJZxaO/NJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJV8mcLlSjdPGGGzhrdUyNMokgQtTu/ASEJJKP58yJxC1c2urGE
	MTLM8lbyPfotaEqcbXmw+3bfj1Z42Jusp0xawRMzBahkBzNiAsL7LAfq
X-Gm-Gg: AYBFou3cUVep/BCgJCVWyuECOX1HfQ5q+i0KnYIKBLe3AFYCJMDnLq2WpdCeDQqBeq0
	ZVENCBSgUGcCmzyX9TK0BuEKN+5ArtbpWs9p93waXJQyRmY7zVeE09RnEG0W/5s8Np3D2LGLPy/
	uQDPtwc2GF4o4uX5bsU1fmL5w1p7peYVjv1iTUegOqJJy9mYXyc4jWFt4NgiDxbygLsgPeIrz0F
	bEIgPjWwv/rfhTauvu3V2CChNGuLNvzI5+MC/+ViMzu/YaBbZeympGPiKFI7/7+HLfd6XK0f3Wf
	uHsAux79dkK/dEAkk5PJf55xbPD6Qh9ByCzjtIa64++DGdj9XAjZWJaZAGmelyr1MsvGP8ZPhcN
	Frf73t+mW7Q+jbqivrQmxqZJr3nA3wjO6H65DjQjNtCI1753t4kyc7uJ4VJOhGBJplbG6JDAR1k
	PWH3su0+xDA0H0aCMbjIPxHtw/Fqn6kFfh6gcF6EpPOFMkOz+P9vpjDzXSbY/GPdTfSj7N8s3i0
	3P/vXt8i7ANzS0JXvfbpPq5ibyc8OHCVVYBZ5ERThRU24PPr1AAH8J1p+6Zi+zYmh4/+8O7YeAy
	odi3
X-Received: by 2002:a05:6102:a4c:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7ce5cd7de50mr813317137.22.1792883660690;
        Sat, 24 Oct 2026 16:14:20 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:19 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: iio: adc: ti,ads1298: add ADS1299
Date: Sat, 24 Oct 2026 20:13:34 -0300
Message-ID: <20261024231335.280955-6-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024231335.280955-1-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADS1299 is an 8-channel, 24-bit biopotential ADC for EEG with the
register map of the ADS129x. It differs in its gains, data rates and
ID layout, and has a fixed 4.5 V internal reference. The ADS1299-4 and
ADS1299-6 are the same part with four and six channels.

TI sells the 8-channel part as plain ADS1299, so ti,ads1299 names it,
and it is the fallback for ti,ads1299-4 and ti,ads1299-6: the channel
count can be read from the ID register. The ADS1299 is not compatible
with the ADS1298, so ti,ads1298 is not a fallback for it.

In the same way, give each ADS129x part a compatible, with ti,ads1298 as
the fallback: the ID register tells the parts apart, by family and
channel count. ti,ads1298 alone remains valid, so existing device trees
are not affected.

Both families have a digital supply, DVDD, and an active-low power-down
pin, PWDN, which the binding did not describe. Add them, both optional.

Add myself as a maintainer of the binding, next to Mike.

Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 .../bindings/iio/adc/ti,ads1298.yaml          | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
index afcc683db..c88f0dd95 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
@@ -4,19 +4,36 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1298.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments' ads1298 medical ADC chips
+title: Texas Instruments' ads1298 and ads1299 medical ADC chips
 
 description: |
-  Datasheet at: https://www.ti.com/product/ADS1298
-  Bindings for this chip aren't complete.
+  Datasheets at: https://www.ti.com/product/ADS1298
+  and https://www.ti.com/product/ADS1299
+  Bindings for these chips aren't complete.
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
+  - Stephan Costa Barros <stephanbrrs8@gmail.com>
 
 properties:
   compatible:
-    enum:
-      - ti,ads1298
+    oneOf:
+      - enum:
+          - ti,ads1298
+          - ti,ads1299
+      - items:
+          - enum:
+              - ti,ads1294
+              - ti,ads1294r
+              - ti,ads1296
+              - ti,ads1296r
+              - ti,ads1298r
+          - const: ti,ads1298
+      - items:
+          - enum:
+              - ti,ads1299-4
+              - ti,ads1299-6
+          - const: ti,ads1299
 
   reg:
     maxItems: 1
@@ -26,15 +43,25 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  powerdown-gpios:
+    description:
+      Active low GPIO connected to the PWDN pin. While it is asserted, the
+      device is powered down.
+    maxItems: 1
+
   avdd-supply:
     description:
       Analog power supply, voltage between AVDD and AVSS. When providing a
       symmetric +/- 2.5V, the regulator should report 5V.
 
+  dvdd-supply:
+    description: Digital power supply, voltage between DVDD and DGND.
+
   vref-supply:
     description:
-      Optional reference voltage. If omitted, internal reference is used,
-      which is 2.4V when analog supply is below 4.4V, 4V otherwise.
+      Optional reference voltage. If omitted, internal reference is used.
+      On the ads129x, it is 2.4V when analog supply is below 4.4V, 4V
+      otherwise. On the ads1299, it is 4.5V.
 
   clocks:
     description: Optional 2.048 MHz external source clock on CLK pin
-- 
2.43.0

