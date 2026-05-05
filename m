Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C073B636A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959158; cv=none; b=Yb/nKU0PEWMvbmL8o/rihnbTpVvjn4F0/xBBTDkr7oo+5fahtdPjgw4agYpEDaW7MHx3kiPiIy4BCP6ckbcBzYPuKz16IQpiEyT6DkudZNGXAr4CLm9Sw7M4xiOG+0qGRmWKUxcJSGb1wZVVcpYS4ATXUIX5z91Z2TKAUrEIyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959158; c=relaxed/simple;
	bh=Zf/Oi6MhLnJyKz8VujhJqisPDWxr4yB5R7/vc6z2gm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbfKLFkyUhCP7D8eLgBMY3+CVGE/dY0G7co0B4ZN2K1jBp55o2fV8LzgTFL42Rz7txapvMIEIwlK+oc9CXjAjmfw5K/exQnd/Dm4fb4KABoqs5P+scQuMLeCrUiYONh6mDJcPHs8UPmCDH2GqxjKmsauSM2kTUYNw3RQ4aLsUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSIXBVPK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSIXBVPK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab077e3f32so18035005ad.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 22:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777959156; x=1778563956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIV0LcEpykTmV5tvFks4fy+hbUPeuDUPjcF4e2eUCYw=;
        b=GSIXBVPKHX/AYVuI1oPlaIDd3cdFODFlO1V7PZxcykKZDJMM2ApvnbDkbPRgGmLSdE
         McH9C+o4mKvkU/iMDFfXBEyCW4q5LZyqp1OzlaMwWJZ/J/uyLh4RQfxW04zHJ428ttS5
         GVfIhyR6AGNAZYqw6XDHDIAPPMIYpbdvhRPKVOcBOyBYPZIJIGdyslOhzzj+BtNkQ3wX
         t1DdmlUPEpQY3ZLX6Yc6SHrweFx58do5TlGQCv8Y4ahJGGXnWGweSVAfBFCrAwNPwrVp
         0+ssyN2sVRSVib/7fP5mTG2jlMc/Wh78lX8RetNFz4XN4mAoxaop825glqkwt+Iezkl6
         zJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777959156; x=1778563956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIV0LcEpykTmV5tvFks4fy+hbUPeuDUPjcF4e2eUCYw=;
        b=AMqqc8FFavLjxi8okrknVPoRGoQUqmcRNG7aJuMomFX0tpZho9wYnjxjpVl0BKytbY
         4EQGGyB/gmz/QXJDoyCTJV40nyhTiQB/YrJ4Be94OzZuqIOwT74xLWMW7V/qgkUq5gkG
         KckZAWU1xXa1QB/yoJixnprDsbC4kvM3F1ryrG23Zq+kauIK1e/x3GNgBxDmbTgw7etW
         Q1bJG/9QagovwM825O5z6nee8/Gz5Y59NJCBzkA4PMsnprxGexzfCHnGA8afi2YrifIa
         6oO6XjrYPhp6p6e+C2n6ksYHuJzbINEjZbpf4m4K4whXkhjvQNE+UCu3bl+USsUes2qp
         SnoA==
X-Forwarded-Encrypted: i=1; AFNElJ+iIwV+zcshn1EVNquKoZgqV2DAjO7pn17DfG5Zjlb7i2OSLBBlnOZTr3izP4GderAL9+T3k5MUNhK4@vger.kernel.org
X-Gm-Message-State: AOJu0YxGR3NybVSCY9IYmdf3pUT03xjk1FHRHfJXHE3hNQ6RgCdqkgI0
	kcQaxLVvMUTz9pbiBHoZ7tm1f37yoe4pnQSuhj6AHEhHmh3+r8emoYmf
X-Gm-Gg: AeBDies12cdRTPM5sktiLJag2ne9WRMu3jX4db0KgZD00VT43cVNwi7+NMeUz/fyHPz
	7+9iT9mPcngahntTnZE0X+nbp5S4HUjVsq7i2rDIG7X/VAItJ+qxxY34FlCoqg1KsDQfPitRgAW
	5XL3G4G61rNBM6ElXvP8PvPlMRRWbbVW2f9+q4Dd0gHMx+m+3pkoJgaYi9p2+87SGDG7MB1Yk6M
	wJ7e0unDXJiUuhZkVDkU4sk2Zc0R2o2j/D18ZFaaxZvqLW1emHoZYm3e7WUZeLNHVLGsUYWuYrU
	U1Q8+i4EeDyT07DG3KIHQpREvEUvx8PpC2sNEBXoFRlgcsnavV/feo0jBanilRIxIOjxWq/BuuI
	LsKh1bJ2Vv70IFraRWcC2LYRvIr6Bsov0YDt8wUP2+hhHFn43P283oGIsCXY4PqICGIeCVR1P0m
	UUUxnUd7TSwYYC0ifKzco6yvlFfg3eieZe4LHF+Ftduy1/fIiKabbPtwEjUh1VZhWnoaCotRBl0
	84BFkLLGFIaxVZXLuuu6g==
X-Received: by 2002:a17:902:e547:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2ba535ae6c3mr15910545ad.6.1777959155886;
        Mon, 04 May 2026 22:32:35 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm128161535ad.20.2026.05.04.22.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 22:32:35 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: wsa@kernel.org,
	thor.thayer@linux.intel.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH] dt-bindings: i2c: convert altera i2c to dt-schema
Date: Tue,  5 May 2026 11:02:01 +0530
Message-ID: <20260505053201.5795-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Altera SoftIP I2C Controller bindings from legacy text
format to modern dt-schema (YAML).

The hardware constraints and properties remain identical. The example
node was updated to use a standard 32-bit address space to clear
compilation warnings.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/i2c/altr,softip-i2c-v1.0.yaml    | 62 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-altera.txt    | 39 ------------
 2 files changed, 62 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/altr,softip-i2c-v1.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-altera.txt

diff --git a/Documentation/devicetree/bindings/i2c/altr,softip-i2c-v1.0.yaml b/Documentation/devicetree/bindings/i2c/altr,softip-i2c-v1.0.yaml
new file mode 100644
index 000000000000..d04570680c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/altr,softip-i2c-v1.0.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/altr,softip-i2c-v1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera I2C Controller
+
+maintainers:
+  - Thor Thayer <thor.thayer@linux.intel.com>
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+description:
+  Altera's synthesizable logic block I2C Controller for use in Altera's FPGAs.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: altr,softip-i2c-v1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the RX and TX FIFOs in bytes.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@80000 {
+        compatible = "altr,softip-i2c-v1.0";
+        reg = <0x80000 0x40>;
+        interrupt-parent = <&intc>;
+        interrupts = <0 43 4>;
+        clocks = <&clk_0>;
+        clock-frequency = <100000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        fifo-size = <4>;
+
+        eeprom@51 {
+            compatible = "atmel,24c32";
+            reg = <0x51>;
+            pagesize = <32>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-altera.txt b/Documentation/devicetree/bindings/i2c/i2c-altera.txt
deleted file mode 100644
index 767664f448ec..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-altera.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* Altera I2C Controller
-* This is Altera's synthesizable logic block I2C Controller for use
-* in Altera's FPGAs.
-
-Required properties :
- - compatible : should be "altr,softip-i2c-v1.0"
- - reg        : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number.
- - clocks     : phandle to input clock.
- - #address-cells = <1>;
- - #size-cells = <0>;
-
-Recommended properties :
- - clock-frequency : desired I2C bus clock frequency in Hz.
-
-Optional properties :
- - fifo-size : Size of the RX and TX FIFOs in bytes.
- - Child nodes conforming to i2c bus binding
-
-Example :
-
-	i2c@100080000 {
-		compatible = "altr,softip-i2c-v1.0";
-		reg = <0x00000001 0x00080000 0x00000040>;
-		interrupt-parent = <&intc>;
-		interrupts = <0 43 4>;
-		clocks = <&clk_0>;
-		clock-frequency = <100000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		fifo-size = <4>;
-
-		eeprom@51 {
-			compatible = "atmel,24c32";
-			reg = <0x51>;
-			pagesize = <32>;
-		};
-	};
-
-- 
2.43.0

