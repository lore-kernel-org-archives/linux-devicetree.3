Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1774518DB2A
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634964; cv=none; b=D3QHc3rtigHYixld8pIAqWqJZWecBP8aNwXhLN5weu6yZriwIfeds8Ghc3crl2QlaZ2ugQHD67wZFLici88ILDrDgTouvwvJw+AwcjsFaXtnFMFRjEBCvtKYZ6bH/tTTGNKF9NfJdTZjVq5sVg6pYw4Dr457ofzQZ+Avg/Qw0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634964; c=relaxed/simple;
	bh=kae2qHBRa5XzByJ+4Ye/LdxWgVzEorPmWuGEr09VyJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjV5hjrUSzUbmdngXaCta/rNkqrbvzl5u7D3p1y9Dai7nkUR1Q/ubDWHcdEUGWqTnFX15X5TklUtym7jUoSJfL6dwDby/psuL22leP8INQCYAQN2l3crp1xmIzipTrqkAU1HmPONpV3KFkng4Yzfr4+iiiuRGMwYlXijedcbmGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXe8rdnt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXe8rdnt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83d5bbef760so3665633b3a.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779634962; x=1780239762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoiT8IYepSKo2QhTEPkIsSFyPIneXYe8NAvRmZW3bG0=;
        b=pXe8rdnt8o5F5sPHnSau/tUK1JtCNtXJBilDTxXDzV9l3ABgqo2Uk4B8jVMuIUYCsG
         5NxZU1Dgsho7FPqMAC2RE8TxEQ0spF11FyrLIspVlY10AQ8Tpq23caljS4gHIFb5P7oQ
         wc4hLS5Nanc55xPUA/kXsuQReCVZ49pW3MWcUfqO3GWZ7V+qI108qWcmx+vgUI+ipTf5
         58SiZ/457gTCmb1SSLlO/QuVP1EFCqyZr1bo1UY+XF9NwkReOEfTotUDmq90wrWGIrnb
         XffyGHxCLdaJaf5HC5abV0T4lq8tPNq8Y49bLUOgCRXZMNHogiZsmqhFTwMCodnOspXh
         I7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779634962; x=1780239762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoiT8IYepSKo2QhTEPkIsSFyPIneXYe8NAvRmZW3bG0=;
        b=TXBuaUmPDrz3ENqaM0Qb/y/C51bFpekkR2ZZ9PTvUTjRjjFUSzumZw1AcxyBumDeHv
         ipoBAXI51Ti7fQiU/1GEG1ie7+GdBgw8BuBN0YgXhGDFf+Gxaiiu6DyMcIitWfrExkCZ
         iQ58qwnrdv04aniuOuteEq8H4mGTxtqSDDErJznXrTi2++1NZ2eqCcuaicQLfzWVRVTx
         xqUeETIf6Blyh6xrVFX8Pe6a92cS2d9qRLMGO9WipCJOpgrCHfwZwAorM+Q/sgMroEsj
         RKiJLR8VDBVT1PumjtLqSNKXX37S2UT48Qn62TGAu0Lmyl15xTbKhfHA0lWkFCappjTg
         r+9A==
X-Forwarded-Encrypted: i=1; AFNElJ+L2DtjJVzJ9BGe0sMUPfrmpkjo/JCgog/FKNIpO/AuJCS0WviXRozcjy8SXf2mrUipSE3V5TjVrc4H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1O7+20Wh8lJMKKrMG7bpwVU9lbNKamCcsW4mprGMCAAWJEUi
	X9fjUBo2/W9uzoW3raCU2U4rhn+yOkajKtfHtesKYVcIYmodJIugRxgK
X-Gm-Gg: Acq92OEVVZhXI6P0BMseCEPfKiEcuzHKKxUtBLZchamRUjrBypGA5/3QyShq7lld+PB
	ulLSVLCbZKlIJHUa7GJi4+E8fSUaj6gnTFyGqgyQ7pF/OtwFvHDJy4ZmEVU28N9CyOePZgCo5JV
	5mjG+v54WZwcS5OAsEs7rwj03gVR3ZWH9ZM7T8hgwIghTope0eGhteml6VGT6mb6HgQeHwsTB9F
	VC5nprIHEs9g0MRMZ6KRYRTKKQxfVvsk63LEw9ByfF2isZDU7Vwxd4XeRSHZ3lMvD0mScFnsPMe
	HshvQyaAxJ4+rUuTckNUYKXHCiX8VytQlhn0yX+yG/Nudu9HA4OCqM1nr0Aj0NxhbC7N2NMeX4k
	OihfRCkZRoWJ7UDnDt7mTt7zSj4sU7w7aQ8HP1ubv+sJLNMsXpFAKHAzx2lhJy5oY7O9zs3lGI/
	ZERArICrulzk48Q4Tj+no4aYaU98iQ02OeC/lGLOPATUO8dz0YoKOuvzL2Y5OuQHRezkI=
X-Received: by 2002:a05:6a00:3e06:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-8415f18b012mr10130174b3a.18.1779634962316;
        Sun, 24 May 2026 08:02:42 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff71c4sm8051896b3a.55.2026.05.24.08.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:02:41 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peron.clem@gmail.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] ASoC: dt-bindings: sound: asahi-kasei,ak4118: Convert DT schema
Date: Sun, 24 May 2026 15:02:27 +0000
Message-ID: <20260524150231.109157-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Asahi Kasei AK4118 S/PDIF transceiver bindings from
text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Restored legacy 'irq-gpios' property to prevent C driver probe failure.
- Added 'reset-gpios' and 'irq-gpios' to the required properties list.

 .../devicetree/bindings/sound/ak4118.txt      | 22 -------
 .../bindings/sound/asahi-kasei,ak4118.yaml    | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4118.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4118.txt b/Documentation/devicetree/bindings/sound/ak4118.txt
deleted file mode 100644
index 6e11a2f7404c..000000000000
--- a/Documentation/devicetree/bindings/sound/ak4118.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-AK4118 S/PDIF transceiver
-
-This device supports I2C mode.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak4118"
-- reg : The I2C address of the device for I2C
-- reset-gpios: A GPIO specifier for the reset pin
-- irq-gpios: A GPIO specifier for the IRQ pin
-
-Example:
-
-&i2c {
-	ak4118: ak4118@13 {
-		#sound-dai-cells = <0>;
-		compatible = "asahi-kasei,ak4118";
-		reg = <0x13>;
-		reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>
-		irq-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
new file mode 100644
index 000000000000..c8aa61643ca0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4118.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Asahi Kasei AK4118 Digital Audio Transceiver
+
+maintainers:
+  - Clément Péron <peron.clem@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: asahi-kasei,ak4118
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device
+
+  "#sound-dai-cells":
+    const: 0
+
+  irq-gpios:
+    maxItems: 1
+    description: GPIO used for IRQ pin
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO used for the Reset pin
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - irq-gpios
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@13 {
+            compatible = "asahi-kasei,ak4118";
+            reg = <0x13>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+            irq-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.43.0

