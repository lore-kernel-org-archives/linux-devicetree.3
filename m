Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B437CD34
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411315; cv=none; b=ePF8xKr6wb7ibsKasM+J5YEE2voaT5kWr73KqZypvOCa6nTFzGlxISqrb3Hy9MkGlhn2ZB3XPWI7XPkZArpq/P5g8DKXgtMKLGuP7m699R3fZ479a0kHv1a7A8RJZ/8mBJ67HkLZrL/5yA5zXgzeUo9Y33+hBMy2ztUeh6zab28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411315; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIPunUxp7EVYTrv3aQMRxpQWLp0z+B/hUmo+UAOwV8pYXAw/iftsxHJXJtTOjcFSGWDhh4hzYW/q0JmIl3llSQSIrWExW8xOP2R6GCwvIeJxxjvWNxhs6vTGixzpULimk3u0N+xz7r6eyzudIBtyXMoAZDHcfPXIZda4vyu7x5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+7VMlDh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+7VMlDh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bcc1c602a87so140376066b.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411311; x=1779016111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=i+7VMlDhEnQTy6TQpSATWj+W9wpDGc/zGemHEZV/wLPBZVyGo+M/4FGrj+0Jx3GxPh
         bJ8sN8IDtPs3d/OtGYQfhVUsF1bXJ7WCsBFXI4kviAYyA0GOZqGb39zjqCxQL5YI6bEo
         hJlBrjsa42xAJWaglmWB3eNMkBkoxeDEf0wG9HsmU43ieNrSiQ7FbblqZjNgfDEoB1Rw
         zE9Y9U5ez4fGb6V3Ln2yy52HYCJRCGmUARpepDJ9Ql1QBSVwSameLeh2jSnHST4a0ntl
         zTaiNpPbT1hB5S3v7Wt+rSFwu5bB7t8PgD9bkO4nrVErDT/MXRjvDo4RgBDNDO0Ekm62
         bo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411311; x=1779016111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=ROxeTVHMUbpoiHdLom3tNHLTi7Q1BltfEhK4UP7hs5cPjKUV+vJpus95ieLUT5K/Fz
         kgPqW//qnxlE/gCwFOGfVTwNiss1RFR4Rtc5KK4Yz4Gyz8Lw9FwQgTN26nqSNbNMnNjt
         v5Ncak4urmxFDmUv5TkPKDh9WWPuZvMnbae7aFQdPX0r8QAG3GdpP9OJNU9Fo7xc4Qno
         cFIl8NRYzKHjv6SFdktG30DPaS8vvBHdW0MGCp5Za9vUrxnMMZf7wX5AcA6GpRrHME93
         caylpT4U8w7CcBI8JJntbHwGGurUyLNxvOLdnTAGungzOftLeIa8RFfF0ysMoJnuO0ri
         fiZA==
X-Forwarded-Encrypted: i=1; AFNElJ88KI8vfspPnoAZN2Tgqj6MlLxY1LfbiOq2PtXhzjBKe6o1EJNJEBXTQKf8yK6Or16h4/lnmrMcWAtV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53EEry3G9vYo5NsHjzI7fo7n5HbkE+cCZ0kHB8xcE61TwkFUa
	9K1CD+y+Ys4+6wNhjZXIsPtUdlWESMt9T2+Z+WfpUZe3Mj2oW7pZ9HwF
X-Gm-Gg: Acq92OEeT6C4QjrMRVcpqdZLF0BsV95u23qyuiX5JZ8xPCKjjCjKdnHgrgucfBCDV3U
	TBUOE9Ym0pXf2YrcUyZ159Bx4h8LiVdWQmK5n1vRKeFA8WM/k4+ZMZTB46K4dLtlSZdGujwBLaa
	xgjGM35K2s6k+fJi56+uz6HQdre91ky0q31kUCK450Onpup5YYCQ6W+PaXVIdMCbhuz9HTc3yDf
	bUPHWIzcjhNYFH80YFSse3jUgTOVjoDpqe/gu/1S6nYGFQEMnW/SBo9WOE0ttEumnzXxyLLn1Ix
	2t3I3QOOqRioS37aKksFu/XpiEol69bYev27KzwsBVPc8vRUlh+/a4NpF82Yg86VGY7hhnAhYN6
	P0OKnn5yYdsVD5BjGReVjE3gLVLUDxcDDc95w2iVfgV7nXKKmY1tABopVF9GiOND+cYSI+iaMFh
	8gQF5v5fgWHzjOpiRD7JtDVs4=
X-Received: by 2002:a17:906:fd84:b0:bb8:fdf7:e132 with SMTP id a640c23a62f3a-bc56b9305e6mr1075475666b.18.1778411311105;
        Sun, 10 May 2026 04:08:31 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Sun, 10 May 2026 14:07:59 +0300
Message-ID: <20260510110804.33045-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
 .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
deleted file mode 100644
index ebf7cdc7f70c..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Motorola CPCAP PMIC LEDs
-------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should be one of
-   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
-   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
-   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
-   * "motorola,cpcap-led-red"		(Red Triode)
-   * "motorola,cpcap-led-green"		(Green Triode)
-   * "motorola,cpcap-led-blue"		(Blue Triode)
-   * "motorola,cpcap-led-cf"		(Camera Flash)
-   * "motorola,cpcap-led-bt"		(Bluetooth)
-   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
-- label: see Documentation/devicetree/bindings/leds/common.txt
-- vdd-supply: A phandle to the regulator powering the LED
-
-Example:
-
-&cpcap {
-	cpcap_led_red: red-led {
-		compatible = "motorola,cpcap-led-red";
-		label = "cpcap:red";
-		vdd-supply = <&sw5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
new file mode 100644
index 000000000000..c8e7b88a05cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC LEDs
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. LEDs are
+  represented as sub-nodes of the PMIC node on the device tree.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-led-adl # Display Lighting
+      - motorola,cpcap-led-blue # Blue Triode
+      - motorola,cpcap-led-bt # Bluetooth
+      - motorola,cpcap-led-cf # Camera Flash
+      - motorola,cpcap-led-cp # Camera Privacy LED
+      - motorola,cpcap-led-green # Green Triode
+      - motorola,cpcap-led-kl # Keyboard Lighting
+      - motorola,cpcap-led-mdl # Main Display Lighting
+      - motorola,cpcap-led-red # Red Triode
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - label
+  - vdd-supply
+
+unevaluatedProperties: false
+
+...
-- 
2.51.0

