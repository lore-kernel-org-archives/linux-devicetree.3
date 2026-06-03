Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308133D7D77
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487871; cv=none; b=MdibNREMIlKH/6pFqfT85vF7ZK4N6U+2nf5xovXl+I+QeV/oxvkNneeNaxf54VlYnX0hjyoL1jPFqCNSFEAGcHWZPt1k49cKZ+vH5ZZgtV4IR/0ORVR3+OOkAP/0qt/IlfWFDTMcIPA+GmvdEXEaL7RQmxy1nHCj3VNGL+EiGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487871; c=relaxed/simple;
	bh=DjUT5aBftEoRVGB+npU3/j0yKiFQnkBpVVQvAeO5wKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=szzw94V+FiDOatpk6LDbqvoyWLnvMgNn05w5aLUJ4bwmIXJU2B71S4pHgvyQiU+sZeH7nxuNwkVf4waRwZqEZbrP+UsR8CPdVLWtnF3+umK+B++sckCgd0pKBhrcv8Bxr982/f8tmLc0x4aGsiWCIkgUDYNDdRlfSJw6a/SYhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL/O1bMl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL/O1bMl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85a2cd51e7so219369a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487869; x=1781092669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k28+kaUswliCdDHq3RJFU26Ptqjhc+SLCKZBma4M7JU=;
        b=NL/O1bMlk4QJ2sE8mQiHiU/FI3VARjgA0CIPz3ZBDuVyj+o9mhLNGJ3Bbjwq60qTWc
         dv8oAGHiYz4yL1dxlNIv6QQnE2ymSm5DPppCn165wuJLGwAdpvunHaz+doTgOCka9IiY
         fIpu/zs5J6GNrN1EG23TITm6uuWM8qvcjA0gwLluU52qp/5K4OwQRuRyDWOa7NS+ssqa
         G4nKwrDclUvUH/CYTb/j57SzOU+di6hKaQHiT62L3tUEVQlX/FPHaDHMwFG8ZYBBc91k
         RH+jnRCLBN/FwzXJMjj86yorp4yBoyxVaIOEtQtRXM5cbfZ0gxFma3vSGJ+zoNRlPK3s
         UeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487869; x=1781092669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k28+kaUswliCdDHq3RJFU26Ptqjhc+SLCKZBma4M7JU=;
        b=jrJZ67IznECtzukS0EvAtLqiekWsLx5ljRfAwp+4ZHeKz5F7MlcsATmspQMhIT6OaF
         S0JAW+SfVj54Nk6MB62WvFxz9oq9pFUPxyRaqeqNQ5gUfD6X3QbeY9eSdT9CQF+o/U2K
         Xn/1Q32TYTJ+WT7pvUCMtNRlOjix73AN2jKLYcmmtiuX9MtoDen2pxZr8goutATQtJ2J
         D5Qy1oTD5FwW68lQw9XaaLWDW1qnN6mHpvyDmvM4X+mG5b9amTLBh1q4l1ZN7QEllT7f
         4bmnsinugMh6PvJpAocCY+QFBuibNl8UTqb7IxuhbP6jAGFZFu8T5/TSxq/SqzeInx22
         pmzw==
X-Gm-Message-State: AOJu0YynUn0GPQ+jjL2ItTEqeIWGgJQm3aqmP7DRnaSL3fwWFGTSlGfw
	hjTmuXpcMW4NqSEUoxA5ehtSzwtI4XkRVRWyq86SPcgD/jblQHSamUx4
X-Gm-Gg: Acq92OFeNQFAen4nH+73qT6O5WyIGdkihlw/BuR8ThLt+sT5Ckij5wFsp9htbaW4PPA
	i/CihsI6ArnDqYeMbhDjLeoH4WH5kPdndXCljyGmm4GL9LEH0ikAhzuF9s9xIOsFudTsMhWC+ik
	BlentYXf5hChJFFbLvPdWeILslEycY+Xao9PFPXKV8cINhHyi/PVDVCdYpXFcLi2aM972v1XpqP
	fYc7WpKkK/SxAr35J4e/G3f7d9z5xMQpbEY0ep5qcbMAelajsdz2qtm2TvXCVdsCuXkNXGpZXVm
	iILbiIMi6wBRRsyp+EC2YfqLEX1+LAJoFXZNCNINS1L7lPGKKnvCE3qGyAOJmGgCzeYoUxH6iJf
	+6RdxFOYvxFBNZhYkMoS5inirrtFi2871WCtJRcqcbp/0mHlEeL8OAbyle8RSwJm+Ygl5/j19wE
	QyaYQ7X6R4OFJGPBlpI0rj0+cTWW0JdjU4d/jWMomUSqg=
X-Received: by 2002:a05:6a00:1916:b0:83e:f208:b11d with SMTP id d2e1a72fcca58-84282f381e5mr1983863b3a.6.1780487869275;
        Wed, 03 Jun 2026 04:57:49 -0700 (PDT)
Received: from [192.168.1.4] ([2401:4900:881d:447d:455f:e104:1ee9:e49d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221470sm3132067b3a.6.2026.06.03.04.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:57:48 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 03 Jun 2026 17:27:39 +0530
Subject: [PATCH] dt-bindings: arm: omap: ti,omap-dmm: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-ti-omap-dmm-v1-1-ef491c4699d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU2MD3ZJM3fzcxALdlNxc3WRzEzMzyzQDg+Q0IyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCIp2NRbwAAAA==
X-Change-ID: 20260530-ti-omap-dmm-c74669f00cf2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780487865; l=3673;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=DjUT5aBftEoRVGB+npU3/j0yKiFQnkBpVVQvAeO5wKo=;
 b=91zrxjqErYzbjHVg/nfgNCPicq0FT0Z6dYt/V702pgmCu3YfH51KxJeCMDSUAhJoSkIPSWTbN
 XjBd/wCaP+4AVBH4/hikcIPkn2iRGsG/jnPDO6Q56xORaBlIlAhWmay
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OMAP Dynamic Memory Manager (DMM) dt binding
from text format to DT schema.

During conversion following changes were made:
- Make the 'ti,hwmods' property optional and mark it deprecated as it is
  no longer used, it is kept to support legacy dtbs.
- Add the missing required property 'interrupts' to example node.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/omap/dmm.txt | 22 ---------
 .../devicetree/bindings/arm/omap/ti,omap-dmm.yaml  | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/dmm.txt b/Documentation/devicetree/bindings/arm/omap/dmm.txt
deleted file mode 100644
index 8bd6d0a238a8..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/dmm.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-OMAP Dynamic Memory Manager (DMM) bindings
-
-The dynamic memory manager (DMM) is a module located immediately in front of the
-SDRAM controllers (called EMIFs on OMAP). DMM manages various aspects of memory
-accesses such as priority generation amongst initiators, configuration of SDRAM
-interleaving, optimizing transfer of 2D block objects, and provide MMU-like page
-translation for initiators which need contiguous dma bus addresses.
-
-Required properties:
-- compatible:	Should contain "ti,omap4-dmm" for OMAP4 family
-		Should contain "ti,omap5-dmm" for OMAP5 and DRA7x family
-- reg:		Contains DMM register address range (base address and length)
-- interrupts:	Should contain an interrupt-specifier for DMM_IRQ.
-- ti,hwmods:	Name of the hwmod associated to DMM, which is typically "dmm"
-
-Example:
-
-dmm@4e000000 {
-	compatible = "ti,omap4-dmm";
-	reg = <0x4e000000 0x800>;
-	ti,hwmods = "dmm";
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-dmm.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-dmm.yaml
new file mode 100644
index 000000000000..0b375385a7ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-dmm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap-dmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP Dynamic Memory Manager (DMM)
+
+maintainers:
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  The dynamic memory manager (DMM) is a module located immediately in front of
+  the SDRAM controllers (called EMIFs on OMAP). DMM manages various aspects of
+  memory accesses such as priority generation amongst initiators, configuration
+  of SDRAM interleaving, optimizing transfer of 2D block objects, and provide
+  MMU-like page translation for initiators which need contiguous dma bus
+  addresses.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-dmm
+      - ti,omap5-dmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated to DMM, which is typically "dmm"
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dmm@4e000000 {
+      compatible = "ti,omap4-dmm";
+      reg = <0x4e000000 0x800>;
+      interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+      ti,hwmods = "dmm";
+    };

---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260530-ti-omap-dmm-c74669f00cf2

Best regards,
--  
Bhargav

