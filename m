Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550E31D362
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409895; cv=none; b=Ind0kW7BiKaPbhieiu2pIhkahmZEOz1q2KMa1fqe64Dap+gHjxhRvmJ/2xxxs69haZQUfgxCc4m8wtqoySr9UNIa9dH482zkMLMnIFvEWDksK04gSf5IG9WpRI6NwhxbT/bobHbcnopUaOFqd676FYeXSjiLing89QufCDJHz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409895; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpCiMzmKO2sYqf33NhrlLPSQUrRr9n2uIFWOLp4jttyWYWBfvBPWU85Bl+yuAUZ+pIW6fo6lC1ept2sSRA0Z8/Vq8cy7dsTd5Ls9318IVS4fEoJbPx7itz0eyq8ds8W/XHIdBSJjNsZNSpzSRZ9xgaGrV7kHFoi7u0mRD0oQNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La4oMK6r; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La4oMK6r"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso3151711fa.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409892; x=1777014692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=La4oMK6r0bH9F3SRmHbdD+x7Gwy/4imtA632ohRbqRTyGsIBzmRKxbqfGKtQ9Qd7rS
         5MPpFRHiERg+hwVIkpIFAfQ5F2bMj7JcCmeDvWN/4NZXmWgqnHhpRkiH8UpzUHJEvWyC
         oE9Lw02G84VdlqgQ0G/vfeBoyuNpRKVURbd8dcYGNRlsmX4amyDb/zPAH7f2MLxIXyoW
         nw0cEPCk+RUnC42CRYV6q01HXOU3WaphXk5TsOq1XNqjLjT75S6UzM7UXufOx3pteQwJ
         4JJGa4/rliSULJw8IJPrCulKGH1lUUIUFWTulI9JQ1X0ypZsNu9UXpkBnnmJcAYtiRPo
         IUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409892; x=1777014692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=oyjA4OYbrHF9m+GitJx7XJqMN8YptIjM880GjhDwgjPSTi1Uqrjxw2onnDhYPRAqr/
         ZyGH0A4vViE7qZsxJJTKKau5WYmesj6SGo00wBQ+Tt763LnTwFwj/si9jCi+VPGQZ2ep
         xeTtX3kFjGKH0C8UTlxGtP5/OgAMc9duwRRYy0o7Wd6TpZnTW5mDxoHleMCa2DGbOWY4
         KU1u8l8FTNXfTPCgos/5cf8nAzXKyfeoDJEKZZ2nKcSMM4i7tFwgv/vJMVEp58JozRsu
         CU6sktxtgqN9iy5byqR1hwu1UXWtLGcGpWjKJ+G5IDrZtsWi2KLUmAiOrUMOf2j1c/DJ
         sVIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hQ578VOdiis2YwCwUh05zkHXETRKx+HeT0ME1A1/sCr7MYM001TE5uROfai8ncK4bi4TQXyxccxtY@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYc7UitOhs+chjxPbnqLBljkwoKpbbMRxhb2LF2HNyk7pKc3R
	nWHzxI6ip0zT3tzYz3ONd5S8jxmzsYeCBxT77Wt2fSMlIGrlnskVhDTL
X-Gm-Gg: AeBDiev6LmiNRVe/9/VhUdrT6WfHlHSnwuTL2+SLb0hYTnjwtU0VMBvsLEhoQO/z+jA
	QpWGVRGzGp1WG+JvK3H6GOnJ85qoIa6qHdO5HmrErK6a55USbLuO8xOd4CrPJ9/Tox5PIxATcp9
	lCHJ5ERGIEKhUJAEbvSongXE8aEnk1Pqpa3/ybJ9S7fVyTHsOf7wcmAfP/3BoWKnE5mDdDZSZMr
	lgKz6Nyn5CFeb/PxDKTiU7VjjIyuDCcQC+xGLCIbJgA/MFz36UOhyb4cbae5CTXOtjPHn20ze1j
	aSrFizQtPoBuT+VMErmna+9L67kptUNCMuW/hAyflKwDrkjqeROWBE/biL0aReNMTnR+DgT/76L
	kngPZpLxLhYKtFYW5aDprzatXFIX7W5YHtBwjobJjOc1MUiTm78OhB63wpDN3xY394AnwWO7ZqL
	To5Sz3yIvCN4e6oo9HMXrxGPM=
X-Received: by 2002:a05:6512:6d2:b0:5a2:abc3:eaa8 with SMTP id 2adb3069b0e04-5a4172f60a8mr474614e87.41.1776409891908;
        Fri, 17 Apr 2026 00:11:31 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:31 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Fri, 17 Apr 2026 10:11:01 +0300
Message-ID: <20260417071106.21984-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417071106.21984-1-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
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

