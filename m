Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D5437473
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387079; cv=none; b=FKqCha6D7UjFJmaUQ3wJSvoNE4FE/yEDbfaCB0WN8rTVkDjNTM3bO/VdyNf9bTHSJ0JCSHOvJwfcnL2+S51WMjw7Vpe6tVjtwkgBJqhpZ+svwwoUqAw/6pgXI/XJpyz+cu3iZ9YtvLK7M6Nj0EoCAgKgqP7NnJw7dVCuX9KjUh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387079; c=relaxed/simple;
	bh=SkE6ePlUHBWkhyEachrZ7O5pW4NWv5G8XNJ67TLvx5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eQ39/1TKy6m/RSVboxAoOTCskQrqBI3akw9znL6fSXDxq5kF3I6zCk4TvD7m5zBDxVWbiVtUs/g7y7QVpTKP1NGFC4d4+IkdM4B5SJWmHcFl/EYj8VeZj1RVqF5WmTCkrpPHzB6YhxRuXbKUdl7V+CBnah9Xx0lBHs+oevyw9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLCJMlo6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLCJMlo6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84f3ab8751fso189321b3a.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387077; x=1786991877; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMauofcmpRjQPIhwMimdnRy7aVAcOB6NPdBSMlSUuNA=;
        b=nLCJMlo6e3QMYd/PcGfXd2C002krgRTB7pxd7yso5CP+UOJe8bWZC2dLWmcRTjCnd7
         lqT8Jrq2mriyPEV08sek/RQgQ/LWezWbAeOGBx2rPn71G+8H8QBnQ1e4NeCr0AjLkNmC
         xVgp9ZaLZmEiLAFEJZZldy7WnJIORSwEvrLBSQOQVr7kLjBfuvRL6rt3xTN/hGKNDCzZ
         NWrN/vmAxqZACxT+FO68Zyo54WygFEsXayFRuSiN5xMgpMXHPW4GIATZL1BHULyruvYn
         +F21pFPmuygtFliUYhiSZLMAXYMa+sd+2fsFpX2hObmIJIzSt4kuHnpeFT6flkPOk5/E
         cUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387077; x=1786991877;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lMauofcmpRjQPIhwMimdnRy7aVAcOB6NPdBSMlSUuNA=;
        b=Q7WHba3JdH41ug7bznEvikau5tCZAXmZShbqH65eHrOwVCDKUcAHr3f8wOZBMnbzud
         a7nA1nXRftbPgUT352ptwAjNOn1gloSMCLDLBZwvdTDcO7dzxHs7OdAnL24aSS8lV5Uf
         WVNakd55Ud+xnK7rMXSEyw8qiPC7UpJcDb34CBmxG+VlgWdVqVOC6nwtv/xT2d+eZHqi
         HdF5wdHg3K9wJuF/wXoBExrO8Q8aTdRjRAKJE70LpKbt8QT4ZP1ujRV4VXwmYMR4Cf20
         fXnKW6LoXodAQussxSCPv6YANJptTmxPUoHJBT3TXLEtZWlkpoIdpk9XtCaTFoTlDLm2
         j6iA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ38qkXK6ZiEcNg1zBf+EM5Sw1KookGZLmSxJswXA1RvgX6aP7TFAgHroBLmuyybLt5NKtM0wn/8GD@vger.kernel.org
X-Gm-Message-State: AOJu0YwpaxnBSaApT0rw+fBhasKkb82oT8VGxty0e1g3xE5FfPgZ+JDe
	Bka5DfPRnFRmEtZU4Q7estNfY8uMafjxQAyNV0CKBwjnkxkg8zSDWmgL
X-Gm-Gg: AR+sD11r6GYbIkp5cLNaTKDKyzLHHQtKS4rRHTmUaXqxGydmlkbS8rekHK5Vw0UpYyq
	10grOFubCMcxsP5BeFQeWDwKFdU95ctdkqqXct4OGWlOVUIOkcsBh0nU5NplhI40ye09QH9Q/T6
	1WzPfbNu2GINkMjGYgCDj7yZXpgMxmVfghDdAsuVTbdjkIc/7094dOvIa0lgCuHr30d7JMlxPhX
	NhHfSWWEO2OHgxZw6rzILWXxvFbg96ZqbydCaaEueHM8s1vyuDbFGxuzJmqzp0I27yuMhCyXb/d
	FXKbX5Xch5kMeGFGjG/eaSUlqvuaMVFzj4FEjC2f7jkqrmHDjlEy3PzZf2cXM7VmH+SDfvRhgFB
	Z9Bzu0Q7UUHSMIZ8Mw/S1z3JZhTOMEfLR6UqFX+ug5+Di5duG8oflQylLAtaQG4Sa5ttM3szdlL
	/lqu/IRMmyGdH+TWeVw3bsfB/1EuEfsZPtpTuDd5zXXsmABs7uOGwBX4EnEIEVWBighmk=
X-Received: by 2002:a05:6a20:6a1d:b0:3bf:abbc:da62 with SMTP id adf61e73a8af0-3cb85fc0b43mr32697665637.2.1786387077264;
        Mon, 10 Aug 2026 11:37:57 -0700 (PDT)
Received: from [172.17.0.1] ([2409:40c2:5004:a08:95b5:64f6:95fc:7bec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm50497225eec.23.2026.08.10.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:37:56 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 11 Aug 2026 00:07:37 +0530
Subject: [PATCH v2] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ti-adpll-v2-1-f578b253bde5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNyw6CMBBFf4XM2pq2Qqmu/A/DorZTGFMeaZFoC
 P8uYIzLk5x77gwJI2GCSzZDxIkS9d0K8pCBbUxXIyO3MkguFS9lwUZixg0hMOe80znm6IWGVR8
 ienrtqVv15fS8P9CO234zGkpjH9/71yQ275dV/+wkmGBaeeXt+aQKXl7r1lA42r6FalmWDxhUZ
 QSyAAAA
X-Change-ID: 20260725-ti-adpll-ddfd84e4ef18
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786387070; l=4828;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=SkE6ePlUHBWkhyEachrZ7O5pW4NWv5G8XNJ67TLvx5A=;
 b=e8VbaMTGYscunfjxrSGTB+I3AZOV46XSEsMe96PZYdESm8n+K+Su1jdpJHSwJMuRcFPwV9fRW
 g2cQweiTHJhAvnWFZX7cjttuNkuPLVgsSS/J1SwAghyALhx215f/KSm
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
format. Add 'clock-output-names' as required which was missing in
legacy binding, as the driver (clk-adpll.c) mandates it and fails
probing if it is missing.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Droped description for items clock-output-names
- Dropped extra example
- Link to v1: https://lore.kernel.org/r/20260726-ti-adpll-v1-1-86f6fc936507@gmail.com
---
 .../devicetree/bindings/clock/ti/adpll.txt         | 39 ----------
 .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 88 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/adpll.txt b/Documentation/devicetree/bindings/clock/ti/adpll.txt
deleted file mode 100644
index 3122360adcf3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/adpll.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Binding for Texas Instruments ADPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped ADPLL with two to three selectable input clocks
-and three to four children.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of "ti,dm814-adpll-s-clock" or
-  "ti,dm814-adpll-lj-clock" depending on the type of the ADPLL
-- #clock-cells : from common clock binding; shall be set to 1.
-- clocks : link phandles of parent clocks clkinp and clkinpulow, note
-  that the adpll-s-clock also has an optional clkinphif
-- reg : address and length of the register set for controlling the ADPLL.
-
-Examples:
-	adpll_mpu_ck: adpll@40 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-s-clock";
-		reg = <0x40 0x40>;
-		clocks = <&devosc_ck &devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow", "clkinphif";
-		clock-output-names = "481c5040.adpll.dcoclkldo",
-				     "481c5040.adpll.clkout",
-				     "481c5040.adpll.clkoutx2",
-				     "481c5040.adpll.clkouthif";
-	};
-
-	adpll_dsp_ck: adpll@80 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-lj-clock";
-		reg = <0x80 0x30>;
-		clocks = <&devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow";
-		clock-output-names = "481c5080.adpll.dcoclkldo",
-				     "481c5080.adpll.clkout",
-				     "481c5080.adpll.clkoutldo";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
new file mode 100644
index 000000000000..9676ab2d8705
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DM814x ADPLL Clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  The ADPLL is a register-mapped clock generator found on TI DM814x SoCs. It
+  provides multiple output clocks from two or three selectable input clocks and
+  three to four children.
+
+properties:
+  compatible:
+    enum:
+      - ti,dm814-adpll-s-clock
+      - ti,dm814-adpll-lj-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: clkinp
+      - const: clkinpulow
+      - const: clkinphif
+
+  clock-output-names:
+    minItems: 3
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-output-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,dm814-adpll-s-clock
+then:
+  properties:
+    clocks:
+      minItems: 3
+    clock-names:
+      minItems: 3
+    clock-output-names:
+      minItems: 4
+
+else:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+    clock-output-names:
+      maxItems: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    adpll@40 {
+        compatible = "ti,dm814-adpll-s-clock";
+        reg = <0x40 0x40>;
+        #clock-cells = <1>;
+        clocks = <&devosc_ck &devosc_ck &devosc_ck>;
+        clock-names = "clkinp", "clkinpulow", "clkinphif";
+        clock-output-names = "481c5040.adpll.dcoclkldo",
+                             "481c5040.adpll.clkout",
+                             "481c5040.adpll.clkoutx2",
+                             "481c5040.adpll.clkouthif";
+    };

---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-ti-adpll-ddfd84e4ef18

Best regards,
-- 
Bhargav

