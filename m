Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820306;
	b=efJaBCBLlFSb4OwQUInBMM0n4BvERibst8AZx8/t/+l6t6uP+UugzvazK7APsgHHsLjr
	 c7QOpyfD0wF44AhlK4uy+hoseHHPUq1qBRCwJhuFt4YlovVRld7vaqbxMz9qZ3yLHzWuN
	 ZLPKqr79bz254S2CooEH2/KWlMYkYocphGgvOUhBZDNCmK8p9aH3xU7zkoJh9Mq24K1nl
	 J/4WB5xWY/G1b0bQuGNQ5EhGL2aBZoKW3q6eYWVI6zgVyBIOvkGuEgia3g0qj3VMIAN67
	 lRHj59xoK1rMag29SHWebOp3msWz5ZaorSeqyX9wTwYlgrpiKfvHib4GgbOUdaJ9EDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=dF89HPHzCNqQGbXjPU5xC4NuPYNafe6o17PgxPfwNqwg2To7LDspYlZnVjW3ffmmmyxU
	 ZpS0NZMm2xeEysCrxJsnd+qjB7hk0WURpF9unGy7B+HYDFa8A8wVKNnxwHNn5+a8F4jII
	 LdTNTtNYxS+9wVJrF7pCBrH/G9gH+EFkzjc2GQqq9aNh0DJGv6hKBxxk1RqZt38nanFrx
	 M8oZOr30epw6Ij0KpJdScWGcmSJTVm67taZ0mkcDkB9wniZFCSnX+ULaTxgtr8FhsV2Xs
	 FPvrOyxig8XKl84T9xUB6qUifnqdP7Rg9yEHjOKYzjQV9HTwWWuIdwA2JMaGnhPSQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AF607F28B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629AF607F28B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8256106635eso521223a34.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820304; x=1794425104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=G3d0Ev0PzTKoH9/qkmm1xdyYMItYLtR9472uuxqYDGGE3DTSJDpNdW5KhoxyxluyOn
         bDJ4RdQtvjttKH/Jbe621LTmeAdFhbfq5FcDRI2p0aBcOl62R2c3QdLw0jIgQFq8BkYa
         Rw3733tFokoCWR1RpQc6qIPQix/VVjjpj2qYOOfwn24mnZ/6oHTcvUVoWxyp9r3HFDfM
         khvKJVKxfAdrC2gtj+aFX0JLL+N5mtIOaKAl6tOPQkT3XTwNru6mxU5tsDFZV4NGMFl3
         TIBDEUtPsj1WwMA8a8H21JNq9F1B/R8FDGAFaPj76P08+TiGta82bulTdIFbVzc2KRgs
         Rdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820304; x=1794425104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=Dc8mg+EIPSQT2Si+vHj2Nw8jk33vTwcThGARHwYalYldGoA6ff/GH3ac9V+qkRTZTv
         8TrsbV/9TLC7zIfXHEyO4XcZHxsE4HqNtXsZrgsWdPAxqKbJXyp8gjbXEeyeWkQwoF/K
         /SUKHAUOlH8p6zALQVKH1o3wJRsW2JtzOpRea7R9iPhvb7QvZ2nMjVo8GyJgzbMVBzCk
         y2RrPM8zPZpzjRrIoeYhWEryUyxy+cSpa0rOxpNqfG7JNjs8XIEB2qILBrzsHlOVqGlL
         bCtCuaQrv5ZTZuqPKAebZZOPNNQl5hqB8rhWcwB0JZ7fFIvGBGpzA3qzFUfFH0egKYyN
         gE1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPExqiP6wES6Z1gGBBeOVlTV24s3aTlBM2qaIeoO8I15vXBaKFIC/CGXCSIhhnYnycHVxiUNn1Hcr5@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzpDErz4KO3osiJvDaMqk38sO8jEa2zJCU3flhMc5LdjQs6Gr
	N+QFbtEyRBO26Rymra5j/CbLXCM1Y0ihCllq80CJNcjnpoVWncuLFhrj
X-Gm-Gg: AYBFou0HJHP+A2qH9fx1bGCbCyCzhppCEJEfBqhbVj1ZvE5zIDW5rajuHKxyUy7s/+0
	0j/bdjsZbJOG5YZ03RvlXwhY94y3eEUqtG2ByiAe+UGdZe1OA6w2L8O16ZK4T4IaJRm+4IeeoAR
	7jd42/f8W9JeKZhAtMY8TwTUALya+8qCBRn3IxXeXZ1qffnY3jmLGi1ASgPBARTMSQChVfxro7P
	7pITOyH/U4Q97J9nMqQ7SUn8SrDsmytUOgCNZGSa8o9lSVDuUcfVoge3ktKCsKQgrvC04PNz5SV
	U17jrcfksZWoXhIcMskRE1fGwwxFNHBDWENc1Dz1MIKvwS1RvmI8y3Pcd2R/hVyozcmAF10va6q
	db/rccQTqZP0EfRJngKc3EHVetKAY7AvH63OSq+0/JB8naGOJ5LKOqeDVOcpUHwqnuxcMyAZjbs
	rnjc3uBFOZwhFz1ovw93olm817YnFbc9wMSyEky2bH5SdAawq/BVfi+XgojEnP0J6ySLNqcwjb+
	z4oIVxBWC+l98rHpyxAzlJnMXGMjXESPsZCFtPjCK2iKXlkhQ6DRcarOU29jZmdnF3502533/J/
	2SKFBJZYPp50theHe3BYU2TMXWKsXUtw9drHFJT6s4Jx5eV0AI/WpmffpfnNuso36u3UDvfzTWb
	i2E+2Z0WTadMxzGkqC2nIgJYwFI+S2cT0d0cRPZgsrZGkljvQSRyPPZAYRFiQsVUivi6iiZc8Hm
	Dk72eGC01Xao9caWQugxnLlo4puLtgOcFO4f3LAlIwX138l/nRd6ZvL6wNDibEcbyM9XNho+cKa
	TU=
X-Received: by 2002:a05:6808:50a1:b0:539:596f:6623 with SMTP id 5614622812f47-5640de36536mr13164089b6e.64.1793820304255;
        Wed, 04 Nov 2026 11:25:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:51 -0700
Subject: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0

