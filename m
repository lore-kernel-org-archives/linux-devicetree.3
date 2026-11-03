Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695237;
	b=gc++hAujQsyWQqxNjoZT8aNu85GhLNKkVoHEDrBwtYFOR7T1vQKExVzirZhUBK38WwaP
	 aKGF9K3kV47Xzi8O/Nf8De+YxDVePQo7OPAbWmMY6FFo7TsiRlTljFi4DeduHTpN5TSph
	 Wg74DJL+BOcGr0rc2NO0mrN8XRCz4k1/QtD2sPb2RgRHKwfg3NGTJaG2brX2jMfzP8Wlc
	 iNsn2m7t87Qz1ZokEF8SjM3w62RDdWHOkKPpshpZrXS77uoQiin8h4FbMwST5bBg7P+co
	 F8HoK2920qBDZje5h3GOmEsl7HBxeRxhlC6tzEOU7682HWI3xz/qGtQJvxM0hL9gCJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=AcmGuz+NFYqKE4bfH0JF7wAo3T1IACjpByyIqfHnDdYDZvd/A294nP0CnsB8QCz/vYgK
	 9qekxFwPpkD8EKo5aUsOyOJOKBwHb7AmgAfpwCt6J51BwSUHbyYpdPtdqu+XZkpbkhO85
	 uaygiiqsP1uia7vFIpTNrrdCP81Hb0gk+ircqIaB1C5WuRoR1AGATvGFqd2GC590KhQTW
	 PoweZjJI7HHcgM9RfU2FkY/IDQ9Cj3/aS9BSAnque5UYdfviKqkE/otJKPH/SjsGMM0X6
	 3KQCYRiDIbpdXWApGWs7xEJD/4ecjvR99xgDuq2UZnoJ9XPzHVE46V8JKPmnCe0pBbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9614606A97D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9614606A97D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-706113e92f9so2172731eaf.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695235; x=1794300035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=gmRIarE9Q49e3N+eyYDYeIXbSWIUOWqXSi/WRTjOsafRsqRgrmitK+Katzb2O5y9uh
         pve7zQeiIP65hLlCihVpiyH7V80U8w4C73mL7cFjlA2pUEYKqCOGLlXlT00mDh/zaxfX
         tP+Usw2C3yV511it/eB6j08OlEGr3GNziSPj9TH9Zd4MhBUkmbkD3AeZVUYK/rotwd71
         vqXDz52/NBq+Jc0sHuMfLZs70hzrhSDd86ZtW8OXOMNpdsSx/kg+Plgq4L2jFrUDnQqA
         ZuqBxx0NO9hY8aEHuiweq3a4Gj693iYyPaNki0+Ft46GntbZmF7A+Il4V8znqbc+27Yb
         S2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695235; x=1794300035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=YRPWuWjk5hL8CYghCzyOwzVlLpV8E2vZyGT+PVXdqMZnzzkVnKDuYgZgMoTpnlKdcP
         4/yWWBld23CDVV8eFyxgPM4VCaYwDVwOxK741BnUGrQc63bcMkqW9TO7vARKYckufK/L
         tfxMc+TA+7MKGDMxvxq/yn+7CPQwGnWiEQGKyKNm9BdwZ9ABNFMbqu4dXyqJ0GmT69hd
         uWaSX/MMuzIoIJFgTVaNYHI0XUuAbQWuAJlznS6o7uNQM9eXlM05EVdarQW5odU4DhTz
         7UQ96pCUlYQHpBfJi/qELqnOcqMLnWIqowbZTmSd9MpHIdDzau9ADgo/kEAV+xs8xETZ
         WPXA==
X-Forwarded-Encrypted: i=1; AKwUvByYBMby6LHIa4lZnrbLR4izHdmZKEeY5omlN6SUE51J4aEZ83EervUTitQ8Z6qN1QD0w83VOjK2qqUJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8u1JVWb+xxApiYY+/FjdneDuiOgCrM0CbrJt+4gYZiBDJYOG3A
	T1HDPeF2//NK61lO2aRGkF/oKMI1nZx6q8YKi1VQXacfx/Hfo49lKqCB
X-Gm-Gg: AYBFou3ZqiMlDdhh5wtPjgHTDw76/8/x7KoDVYOsfYLGvhXbFiWaYikdFNudEscPHVX
	047iwRHW3nk0aPO2QwdnrsC1iW2jDnWna4eTmKIfjnmveZa62DYARfGcpb6170KXTm0vj/f/tm6
	rWZ+i791Bl8kOcuOenDo4MIuOpIorcmNaIxdXaVrnCOsTap19krIqTQqbuUY5htSGO3ZRQU1MPo
	tKJ3esdXFufF9wgbuqz9PZW7BBEtIz0TCZHUHTYfuS9tUCqA2QdheFJXMvMGtfiStC9IRWtve7K
	Mx5YfMUAhWN/kgNoi5O6d+nPks/6XWzqDFerEYyD4DxjSOF42c5yMNJ1xGfD+tzh+9jDlFU3NFT
	xqy2jAmV5vDIyJLr7maxBNBouLYKbFUpNBmOn/dTN1nZZgejMv2x0Ewk7MLpNtCdGOJRI3n8gG6
	mYXKfTx9/oiomZPQ7lgMVTL1dP8HfWI4s35rsq43EQOSEUnVKU4Ah2I82jfMzh5GFn9qd9QlQrW
	/F6BpV88Ta6n1JaahDoL2zdZlOi7s29eqdbgy0TTyF60L+lVWKamzbFm2BgiQqqtw0fLg+kPkC9
	C4xbDsc64+ahSfaPmVq1znwmXDAKTicL6xJ346cfjtyLwV581FZSUAcTx2+56JRYKnHSK9M/jap
	lb4hJmHPTEeqd/3cp3ts8BDA6NMBJ91dcs3yz6J6Y7k22kaO6FiGmooy2SeH10AUYoFxkgU4cjO
	GZDIh8Ou+5uGmbWzwIIjQ0WGc5iOhdDvdJwbzVzYF5QVvxUN/zINM=
X-Received: by 2002:a05:6820:a50f:10b0:6ff:3c41:8153 with SMTP id 006d021491bc7-714f299c8cfmr4772331eaf.54.1793695235466;
        Tue, 03 Nov 2026 00:40:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:26 -0700
Subject: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
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
Message-Id: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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

