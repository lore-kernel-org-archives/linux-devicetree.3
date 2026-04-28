Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623452550D5
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336503; cv=none; b=Xikhmctpmw7mDiXzzn+i3ZhaeQ27km1nQhxxqestBL/uGdJ48Xe7UG2oS40eS/vs/Xccikuk4akyPfQ7sMjMQ/Xr9s0OP/ggcYp0cgWBLyCsVp7flmwyrArKXKAlfppeR+7p1b4cwTFNWlJSgVf6OuUSQR4f1yseEQpLhrlifOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336503; c=relaxed/simple;
	bh=rnQ8gYqfg3VcZrsJCID13f+y34VFNvtq00wytYkBBIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0HFPPjlGWrO5oqCQObSKUsbBf7N5JDihqpdz15+vZ14bBrAgcqmksFviIc1ZKbHGBXXd/EzxUedP60p1zVswC71GCigv+iZ9kcNd/vvpzD1mDaXn5wA1QSc4bjiFqg+wUcPSaQNzl5sEBrd7l6Jv56f2Kou/vb8xonhy1eGB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3sNtlG7; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3sNtlG7"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c637089ccso2206080c88.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336499; x=1777941299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSBYSXEFJRNW+sJYFCS/2LiY/S8V/Mf0mXkr4u/MCNQ=;
        b=l3sNtlG7s/upvOqwXMsT1mfqtzncd7S824Ha0DgLkcK5MxMJGQNwLKrhzU3z0FAvs1
         2CUjew2y/lilvYmpIExKXGOcvtbdSPFdroD+KgEMQZQnUalikwKB7PoN1ODLh2h+7IRx
         cvczhZVNr612rpAEGodMWqvIOrXMhEyNzrH/wqeoRjf5JnXvvQqX4UlNGHWbs3tfu/G/
         3X7mccURaaee2GZ/3JbkpwpM+eOCzX71g94AtjBBLuDCvk92vrA9PcGnMJWELn7H9gbR
         dcqwRvjVQP1w1i3fUS+dZfQ+dEsCbCG2yWjXwhY7oNKtsAIqppl072FppIrFbgtEEqiU
         J27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336499; x=1777941299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSBYSXEFJRNW+sJYFCS/2LiY/S8V/Mf0mXkr4u/MCNQ=;
        b=VTzxB9wwAWabPjIuQ/ZUsSFihbU8N5fQkrAx9VFqxKcy/O6RIEZLTp49Pk4aHG0W4O
         cWWPfw5F+RJ+/2uBuqC4z4opEii1szA7hFBjwkysnFuSRIRfcezCyP8DnueTcu143KhH
         8kL69WQ+8sgSmnORKSa8PNufz+ge10sXgGfSZrCkZFH5r/atdf7yrzSDawWOotXKEx+z
         ugC1tByPMeSs0FTUbRTPzvAzzQFnIFh7bP3zJSeQ5Rf/APLYL9ujge905Y9u5w4JDNjT
         y07V1SbHW1HBODhyoQtcuLO/nilIFzrmP77/6Iptnd84P3XGOx9IhvK3H35A4OLeJakp
         rrXg==
X-Forwarded-Encrypted: i=1; AFNElJ9aCo8hvbGyJVxARMxjx+I9chyIgDvJKNtqTn6RRIRsOT+A7On33NAl2udMGr8pJb2qBFeJRDtO+tRu@vger.kernel.org
X-Gm-Message-State: AOJu0YwcdX0FvMjqq1Aooi/eeeG26ZRZkja88oX7xPL8+lWrfunYPRqt
	xmh3farrCpYUqVc72exoYeAkyYy6BMAHhNaPTk3iqBiQ/qJGnaw9wTlc
X-Gm-Gg: AeBDieuuGCauZuuXpAOjv6U7p8DcZTbRwHX9kmVEwaBc3HbBMnV7DYYKrg/NDl8Yq2c
	phkpNVnrB8v7/5P2dMk/0eUA42gLutLHY8Q4W8GQ0jFaslRNYv+OSR/qsVT9opGbDUlDvjD40gn
	QuM2/yquZ3CId//lm+4HdXfHEse5X7qby7AVA6SqL4fT0/QgVVZP7uVpKPPjGlcot5dLO6CchnN
	yOHf8/mpNHuE9DD/5Kn6D+bGm13jR4Vd8QT90LkiEiPMGK50dw6GJJVCAH111gCa2/IMlgL+72O
	f6y+aaCOgG10ohgW9d2QLQyCHOxp5Xj3nSc1Qz/JT1At89UblFFBzmDoG5XqXKgaT6Y9X/lZE6O
	QnfBrAy08K7Yar4kFVppIFCOLA7/TknCYbXJei28BJJLZRxkSMktV2YnFG3WMIYxmesebgPdxOO
	IJ/K7K0BpUk01N8M5ZNYMtRVHf1USOdCU=
X-Received: by 2002:a05:7022:628e:b0:12b:fc21:874d with SMTP id a92af1059eb24-12ddd9c73a0mr474432c88.19.1777336499321;
        Mon, 27 Apr 2026 17:34:59 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:59 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v1 RESEND 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue, 28 Apr 2026 08:34:10 +0800
Message-ID: <20260428003412.322032-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add shutdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 01284a506e0b..0296120a8fdf 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  shutdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0

