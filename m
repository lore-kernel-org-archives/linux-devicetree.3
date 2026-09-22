Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94919C54E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035606; cv=none; b=hclxzp1TXlf9TagPi3yFgz2vUknY4RHz9jQhC0VobXHTKngPfqQmlhmAyOFO2XMoyjT4okRZRokGcx+LmxegIAgQaWHNZaaEZKhBBAluatLnkjCo4ugqqmD+CDRwq5fkpuLOMwEEiqLASZutdQzJ9VMLDnfLylHMTwMSrNl4sgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035606; c=relaxed/simple;
	bh=5k9VLU6OvtrGZi0gO1yZy16OfwqfrZmQwujeqIifWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRujug1a+uvjnFPS2hWDvjARcagKnnBLPJIwTDQ4XtPy8mh+n1159HNlPWiGZFKbKajOApODQV/MN1tbMgmLDszbJsRZW4XbuLkf1WalJxQMNNEBrd4BSmym1kBDyyAqivBOwKYyZu1ZcJ00i8ty2up1wCYLPXYrKf/gWoOuv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbQMCghw; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbQMCghw"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b9cb8883ecso342563eaf.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035603; x=1790640403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=pbQMCghwx775sfAFPnsvmRs0g6TDSRTGlRw2ADjh6A0dOLXoXIZgW9BiELmqATO17h
         MzV01OiR5dd9zZc00gYmfEDuDGEj/59+w0wfDSoEqWdN6nSJN902MNF1kuRKKb4g2G9o
         lPK9BSx8gJalKTetqlhcBYmxShB/xDxxnn0VVeA5JOP9VPZyZmgtC2/ALZ3KfXYnE71Y
         ESDrXXq5QRVwuN0+bBWG5ToL5WKqwfNSqYPunAw+NMTnGyyRudFvuO2TYGG28Z5FWWSQ
         7dXg8lYacrAcBVfNd00a3Gx4H/aZzHwnHnhiCz5P/Lsjs/9tOka3ZxCNvfzjiydJgxut
         x/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035603; x=1790640403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=qXuv12Z5HlYxlroWEd0VfYewFCDVaA3hTl055AwzOCl9J5w1VKhrVTiTJdpTOZhwEG
         vpI00DNe5N6o667zmO+GWwn4eYk1Q9qYrRJi77rQjcSFelp/ic+h35+/IKSf0c+Ng0Nv
         BeeMvK9gYqGmTj6LsiVvNt18IZGf9w8I9DfFlu0oNhYvzrViocaxCKKrZGenUAOvlhUo
         ZIRI+N65toK8XT2Al147ushX3AS2f1t+8SPHPjVPXRXYzbfaMS8o8jK2GC6jv93g5JUx
         sppgyg17mJ2P/XSHlSRWGra2OzbYiTTxjhC57FCSO9keCEXDLigLikmYWV6Jq2Vr1tEs
         j5iw==
X-Forwarded-Encrypted: i=1; AKwUvBzKk+zE0YExksixHSyJU4s8vgZLneOZtcB6VstcS8kazzrZs7/83wEhZ3JcWetjvjxkC+nDnttKg8zG@vger.kernel.org
X-Gm-Message-State: AFuF++nYfoUQRoJ6qSCEeDUNIA5SMMCoPQgtOSes4v9WMdWhA1X5VICy
	kXPBRG3SXw9Qsxm6WJFuMgtf84m5Li3RqhHYkuB9caXAgIoPZ7SsFgJg
X-Gm-Gg: AYBFou0/69AbwrRTfzqqgJ7j5LDFknsOEgtqRq7bZmh+JTAcMMYn+6thUwFjm5YMayI
	F5Z0joUnSi5siN2StfKiyGRX4Db357iMvkmQ0jkGvkOgWKCnaD2u99JiVJHbmE3VzQeBY66aK1A
	OdydAORK12ACz03ZW9jN5bRL/+N97cwIYV5duqmui5krfOYUEVC6wmMt2X9Jgo/KxIGqoo+jcGQ
	7EFqkiPacadGNKkePuAxpcUYCx8TzKNwG8tNHDX10DZ85Kff+iySY3K7XcFlJ962IG8keg3jw5W
	TNs2HyoErnYz687YddE95bMlXpUJ84t+Yuc4unu5f4VnmkhDTXfFClJAep5/9b2OKgXDEJjuMxW
	BLvepAyCkSpw9T/SM0nb7S7Oqj5/CRHKCt+dwYygzfdrGgQtUJqp+nyqFIHFQDF9yFOEpBwrJf5
	Vzrf1GGlg5M5GufGof220JTickYHaIU/IhV9+L+A52PTaGnLSch0d3nf6vLRqZDh2Fu1ENqxmQQ
	EdK1vej4lyZ7JdzjxS11F6+pwLlopU9F4DiJ4HVics2xDED7cCrExrFNhLz+FKjTWoYB9DJXwj6
	7CpC1URLBav/RCnCm0WrFQAZwLkBJMkEiiqhaDxoLuSkiW/YYsgRRr4S6Uf2dlWDdtkjNk2Rj9q
	07zIiZZAD8LrxK0StFRoW
X-Received: by 2002:a05:6820:179b:b0:6b1:a146:1297 with SMTP id 006d021491bc7-6d157d893ddmr1041226eaf.1.1790035603341;
        Mon, 21 Sep 2026 17:06:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:30 -0600
Subject: [PATCH v9 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-1-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
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

