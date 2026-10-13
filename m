Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3B5275AA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904672; cv=none; b=b0J+RxFkFFyGD2yrCS+MJ98d7lOYFQtL2bDjTzc951NcpC4O9i6Qa5Ixh7JGTl6Y9UvT+bCS3W19swfTHc7sf4gx5ezLyh5bsovLcWBw9v7GINEM9THNtiWYaWLD92ZjjzB4I6D8LXrwqlKYHv4+PkHHcYiTlEXwZqUaht3xR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904672; c=relaxed/simple;
	bh=0tWuVn0M/rJf1SgDZY6aPd7ienFVDqKzCJFXKqoyc8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rD2ac8t6uOgdwgpnt5Ty+osQ+DNtiVBG7xiwQ2RuZpjAdgOzBT6EPBWqfSfdgsrfw4xIZXSQ9imSIAy30vFKq9uEzfu7G1m6x3NCjtr9TcOjejfoWb0DQ/PzUNMINzXRGa2dAzevjQznipB9bX75VXkDW9Ghng1Et0hKjTDrX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JUAcR9uJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JUAcR9uJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1af482519so6106785e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904668; x=1792509468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=JUAcR9uJmijUOnaWmlKC3ApaOc3YjqjDLlg1MIrngEt6jD5C5kW2bLNxArnbw6BdTU
         TBhMgoYjqnbFlCSN7+udzkmTFSFjyXwETWxs/fuMg7c5zaGxXXeffkIFYwxR7J3pIl3R
         841p9P4rnEScPhzjMA1KHhNUWkRfgdVu1pSaISri5A0q/P4FYcbQEKFb//ZbHkORRLF0
         xtmsDGu6OgtaMALE2a+g1ZcolKCr1q/U+qH7kUJw4dfzf6G0UrP9bRzqYZw39HFdnl0M
         pUvgV+TltyYhkUbchB67kE+wah42PI2hpJe144SbVLo3967EtHbV9hbVEfTiKJHqMn7F
         ikJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904668; x=1792509468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=IlNdkZ32pOTT6P46Mn1pWuZlqsaVX+AdPHlU7+T6FXCJYDlLI1H+AF0PbBruO3gyqp
         bFbL3XFlVvzzkRnJ18mYldDfFn13E2T9NnCDlD3PV8BZvJmz86iHuKym4dGpH/l15j+6
         8bT3Vtvlq4wNF6ROH4vq7Qa/T3HD/56JtCjFocs2s6KoIzsYP54eQCOtN4zhR53BdZ49
         uJygMLSdtyenlsPWnhFO3fD2qQhtonWeN8k1KBg3hSKr0T8/SS0//y7lucJAOViBlPO8
         xJmQZKLBqE5llquRhuqJaUBqDYmCMkVj+5al2yyaKN1lKIavfZPFfbKYBVE8OLc+SqK4
         h7iA==
X-Forwarded-Encrypted: i=1; AKwUvBxFFRDp04QQU1SclWqJTJyH+TgAybsCWet110sL3sDbYQXKjGlrYfhxfemIgqgMZOKutNDIrOYpiYas@vger.kernel.org
X-Gm-Message-State: AFq9FYLHHzjSL3vEkxihlXEKC6iIes82gFkFKgZEnRXYdS2I31eFs8Lp
	r8WgADjX1HYVGGb0/dG0FBgmLoHJlebqayk1qh3ta+7eNIzfbiGwOBvwaIQweiq2t/Q=
X-Gm-Gg: AYBFou0haLdZCntYfvkLbe7EVJtALF6TkUK6kkpT5U8rUkT1vJ/1L+zBPzX66cJwy9x
	L2QcdbuK/KrXdvvDX+qxliIVz4cdWbYiU5+1IhkLoobrQye/HrD8B54xxbebYV9nxCluWRy4kdt
	V8Hbm8+PWrCLWMrZluXpOfMXUwRT3o+K+aztTsvMxbj9erbvBrU/bHvdRNLae3IHsuCoEI7BOD2
	1eiwLXU5r8YNba3neeMtLBgeORZpcBzmH0wdfkBznfSufWP2CdpKEz7dCX9i/uBZvEP5xWjmo6I
	uo3OuLTK2HE0VxwBwmKV0BonjusjHEc0JIkivpd21gEyqC2fcM588A5gGp5XuQb7uY4E+TyVyPq
	HTlaaU5AoOhltFHY77dXL8HYh5CvsGZBKC5Qfe7LQGwdtDzx/P7H/T9Y1zoiwyoBt1dQWseCMCf
	y0HkIJmUTFcA6ifAPoWH+OPejjYq2HXHlEKjUj80PzEJkpab2BNmuyJFNQjjOsEha3lB9LUHzfG
	l7SPnRF77eb6xppKInEJFbLi7gnXREEIRF+5yznGN87IoM/BQ==
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id 5b1f17b1804b1-4a18eb4483bmr266434315e9.2.1791904668231;
        Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:07 +0100
Subject: [PATCH v2 08/13] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-8-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..7c4a7a980084 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

