Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93147ECE8
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992853; cv=none; b=G+lTiT5OZOOIaBOt2/jt8E5hSd7YrR/H0ARiG2cL+gAM0Zdb5HWlHrA43YpOgnZ1MhqzJ0nbB1SlTlcqrzuLUnBUzjV1cCgOQoo6N/CSFVTY7ST+sML/zcqliPrT0WjScg25QT3VSQuaNWcyn6FY/6Yybx1BGyV+WeKvyVcRue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992853; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzkECqXQiDiYESoXyQFM6UAy3bfKtWC2QZ7CMfaHmImLG+BUlxtUf7hrLvdw8R5iOFB+Cw84oa9V9VSml5cHT2ujavn9Zx6fxP3E88KMO4+pxkSOke0yijkx+jotRBqSH1r8k3ytBJDMdCw149K2cJ7KKOf4BQX8RAdlqRzIWe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFahGCvn; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFahGCvn"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12dfee30612so3349956c88.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992852; x=1778597652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=hFahGCvnLxN32J58cZGlvUKcFbS1cHifSNSI3xU79CfcqaoZsqGQe3XbHZEGdAHOhv
         wUjBb4rLSbyiZmzy/BMnifXGir1WR2CYXAwFMJxaZBjCYNtwY+6mowNuFuhD2UqrW3Uw
         Rz2T0eCb45fgxOjxAaXQI1quh82GUb3nBXeX5pboE3P16fHLshuXb7gM7R3GCqsitHEH
         8P8cx769ZgfpN58oTdm98JeIK90Afe+MExOSfkI5HUXQO5+SEl1Srwm4YqnP3gGm1Q1y
         MfraYfP7QQ2avslYCL7AH6+ytHKS8TTT502SK3rDmPE3T/FZyriy5/eKW5Zx3kkCiEaL
         Dm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992852; x=1778597652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=XBRSgRhXV1C3o7eVSoOu6w0bpbexU7l7XE1xKzLqSY7+sTFqWzhBqUlLwUBKX74WTN
         5Zf5Pmvz2MQEb3CscHr5110xnxAn3YqvqLwkCEuW+AdO+DFHcATcskzDs2BdWMuOJrXE
         quc4qfk0wLCyAboimxfVSBfIPVe4AJU8J5uDO1NdogClRbpTXuLA2KVyisIgQzOTm3J0
         +bwWomL6foi9/KovSrUYo8mjJfKSGpZFMeawJBx4vyv/fOCIB/ypkMoWQQFZEoOnXVON
         F++1B1cMQK5c1EhwVOr88Iq60sR1MDebjyP11YbiTt2J9cSZmtsrNX2IieTtw2jIw/gv
         drSA==
X-Forwarded-Encrypted: i=1; AFNElJ9zqLh27tPAF2OL5CfIpGof5duPcknAXP+4NCd7BSMXMHEDYJZhcd9FS5/MBZjqnyjTOIHhnsbcWjKz@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzkc3oYAPuDM9YTThodPiwiBHvYjZ9SNPVgSzFOThcAQD0UT4
	zCVxSarwp2yWToRDDqRMUMN4/GALT5BfICmbrqCGjBLat1m6cxTyk0tF
X-Gm-Gg: AeBDieuC6HfZvmsvhyD9EvgVvtqN1eaLW944HY/pi4wgb23HcL03OuAErkJo5KSAND/
	j6o2sVwpIK0btjZBvEpFZODDnNiPPU+W/6NW5dw/zoiZqMptObm0CJ2XQ9TLu91wR6nc/SCLL3b
	2dTHHjY88bjvQL/BfhoSxQbN1AdLkC05XAGsu5XZ5JduKVapXFxcmywmt7zMD8qP/VhwBsm7TlH
	+RGy11VdiJMxyWngtfSa0Cmva0KohdlTXmdSllqZ9nwcDuhP1DGaQHhx8bF8MdfJhPmeFaNGPzN
	RM2nOqFC61GVnkIJU/lv5vK6C+hKFzl06kNoIyqz5cPDJOic/s+hSUOflpxefn5O1eqyCHBiB4E
	Hm6hTch38DY5zCfw7y3Gz4KGWZxdv6RzQ8SfW3ZbKLuSonqsdTwOfGpxFeSjHPtXWY0ZT8lkpi3
	Dn6cnyirrtsUUQ932DBlNbVFNqQBzNa3vhlXv/Emk73Q==
X-Received: by 2002:a05:693c:2b0d:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-2efb9f7e8c7mr6665716eec.26.1777992851627;
        Tue, 05 May 2026 07:54:11 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:11 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue,  5 May 2026 22:53:51 +0800
Message-ID: <20260505145354.1267095-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index cb4741dee12e..25ce67940c88 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
@@ -116,6 +140,7 @@ allOf:
           contains:
             enum:
               - issi,is31fl3236
+              - issi,is31fl3236a
     then:
       patternProperties:
         "^led@([1-9])+$":
-- 
2.53.0

