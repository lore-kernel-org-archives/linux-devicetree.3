Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7983B47CD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734065; cv=none; b=OYTMY2pz5jwyB7g8MCR4yIH4KI1vJu/zLMgc+LWHe94jCadhHDvLmPm/WMtYuIOaNiE8dKs/hmdI0r0A9Fv7kmPFBTSm8As93ZyWEpxQ2FAsO6mIGQKyA0v+BpwdkWGeOcKrsrBEQ3x9Bno2ilKDwEe/hErZf0tj3LKxGChSV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734065; c=relaxed/simple;
	bh=dn5uLR2398NEbNSJsJqfsFbz7HOVMX/WBpzKD1Jjnc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rl4shJr1ziZhVBdPorcWejcxhVgw97/33PicZHUQF3Jvdkn9Es+s1eZi1/BeOPhD51or8oER2HQfAK1hwpT2XfCu+iAQZ1Zi3YZSJaUzoVLdLMSdNB22EEaqTmETjuEesSRysdCSqZ2uskQmsg8EOZpBU/dJ1EFmSQQL3LXJCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fE/ZALgb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fE/ZALgb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384422b05b5so1583475a91.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734053; x=1785338853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XAx+o/XmxUzSXVnjm0e1leXA4BepyDNkXpcnr5iSRBM=;
        b=fE/ZALgb71QjVFPo1hZDn6UXxv6gi/8NUgS+2v5dDycDY15KQIrzc3M0ZeVyTmHydp
         sGm/Yn1A+x3aagWJFjcbiiM7N9KLsysTqKYMA0kJdp2L9D6jhCN0vZQECBgxtXzsNUW1
         h/L1vT6YX7rZs+tw5LE7ZfxPd5Q/xfgNzxPuetUiXkNRzOfdGxwjoKk/WfK+IJYdoHIZ
         b1LjpNt+TlHTxfKi3Cjy3Isbexq//yEun3Vx2b8dlANTYfPQ0i8dYPBt3yxJ0MhVB0Nh
         XtKYfP4nOXGUXtLZNhddapMT7pTj/E9GzCcT1wljCIhFeVjv/UmG63KkE/AVDl5umqsc
         4+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734053; x=1785338853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XAx+o/XmxUzSXVnjm0e1leXA4BepyDNkXpcnr5iSRBM=;
        b=sS0Z0Es3Uei+OQY/V7/o41KimWkI3r7i6WcQnB4nni0eagtiDEY2+NbcYRWo7dCdvV
         0/LX7Qp72s7JM7T74jeQekmM9ZOtjjRZMXbwbY0pfF3Ck6uhP6wF0OmrOy2OcZGubo5c
         mNuwGORkZMdrHuG0CgR2biTSnGRXNNsLrufc54Rb/T5Y/7090gOEuZk6aQ7qLTWDKT0C
         9AUvEZBJFuFWKOyZnnJxoK0NOKqH/DhlzvYGmz2Hrdt9xOTAeY9fUp4vB10Ec/+kX23G
         lLJFTL6PXyMDdHs9abBw1xH4JnXqoklR9EZ3EQE+9qJ1gZhwbd9UlEEtKeZAB1+qad3T
         uTCw==
X-Forwarded-Encrypted: i=1; AHgh+RpV/oZQmFGn1elGMWkAh3VT5tSoAnKwAY7xc0R6ZIiEP60TZYwnjy6wAystJSe6xXfefqGlnEAG5okr@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQOCJPyfxxLNMNGZv3ebXfXB2UgCjE6oj+hlfUjFxYkMidV/T
	sFgTfkC+1rEY/fwvAbOx2g63zvrEhRNI1HrmhLCGmvKPHKoU8uG5aAnIoG2Reg==
X-Gm-Gg: AR+sD12QNgWdtYGoUBUueJyJo3C2im7TobbRWuLmK8a3uwGPIHEb9F3qBkubbizOJG0
	31+JAncPAhh19jj+yCgsG5QGFrLc4SYa9W1RfoADOYj0vTZMQnlvCgvekbje356zn2Ianhdliwi
	YNkQg90G/BGloRPlJ9RmZNOwCUjZDhEEiikfQijSivrmPXRrpFU6prDExOmZiIfVR01t6jk9082
	60YMaj8OO1FriZWiIIljEokCLIGiEJkLzSup72E8vTIxXxZLc4iN6lwJWhd2eX8gRJawEtiXvL3
	QEB8UoKfhkvvXKfUq1u1/CWzk0bdHX7XHiPNfjISxNFKMckzMSy4nN9qF0HgtcXHvxRaZwWZQT2
	yULpnAB8l3fCKuO7p4aiQjNI2O/plm+crI5WMc4MfbxQhDKUItZpkQdsClETZ3l1pdlkFwScdDm
	n+a65D0A7dsluRzAo=
X-Received: by 2002:a17:90b:49:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38ea4b48d28mr2840510a91.3.1784734053010;
        Wed, 22 Jul 2026 08:27:33 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:2944:6b74:18c8:3132:3887])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm7529823c88.5.2026.07.22.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:27:32 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 22 Jul 2026 20:57:13 +0530
Subject: [PATCH v2] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQ6CMBCF4auQWVvTjtCqK+9hWJQ6wMRCSUuIh
 nB3K+7MrP5J3rdCosiU4FqsEGnhxGHMgYcCXG/HjgQ/cgNK1FLjRcwsWjt5L5wP7ikqYyU61CV
 pCXk0RWr5tYP3OnfPaQ7xvfuL+n5/lFHmn1qUyNfoc+karMpTc+sGy/7owgD1tm0f8eidXKwAA
 AA=
X-Change-ID: 20260629-ti-fapll-clock-57a02c264e60
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784734044; l=4594;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=dn5uLR2398NEbNSJsJqfsFbz7HOVMX/WBpzKD1Jjnc4=;
 b=2U2yfC+iWv+nAWF0jjAqMtw6ecpcwGQomW5H8E0QwMCuRGWlUAW4QTDMfpRTIFB7ahCD7BhK9
 zddAGR06GRcBFs9uduoJo9LImpx5SP/DlMdBJ4pJcVBxb9OCYMbxxYU
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM816 FAPLL clock binding from plain text
to YAML DT schema.

The text documented #clock-cells to be set as 0, while the example and
existing dt and driver require it to be 1. The schema now strictly
enforces #clock-cells = <1>.

Properties clock-indices and clock-output-names are documented in the
binding and added as required as driver strictly requires it and existing
dt already use this property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Cleaned up binding descriptions by dropping the redundant common clock
  sentence and removing "phandle for" from the clock items
- Link to v1: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com
---
 .../devicetree/bindings/clock/ti/fapll.txt         | 31 ----------
 .../bindings/clock/ti/ti,dm816-fapll-clock.yaml    | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/fapll.txt b/Documentation/devicetree/bindings/clock/ti/fapll.txt
deleted file mode 100644
index 88986ef39ddd..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/fapll.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Binding for Texas Instruments FAPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped FAPLL with usually two selectable input clocks
-(reference clock and bypass clock), and one or more child
-syntesizers.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dm816-fapll-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of parent clocks (clk-ref and clk-bypass)
-- reg : address and length of the register set for controlling the FAPLL.
-
-Examples:
-	main_fapll: main_fapll {
-		#clock-cells = <1>;
-		compatible = "ti,dm816-fapll-clock";
-		reg = <0x400 0x40>;
-		clocks = <&sys_clkin_ck &sys_clkin_ck>;
-		clock-indices = <1>, <2>, <3>, <4>, <5>,
-				<6>, <7>;
-		clock-output-names = "main_pll_clk1",
-				     "main_pll_clk2",
-				     "main_pll_clk3",
-				     "main_pll_clk4",
-				     "main_pll_clk5",
-				     "main_pll_clk6",
-				     "main_pll_clk7";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
new file mode 100644
index 000000000000..423b7405e398
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm816-fapll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments FAPLL clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  FAPLL is register-mapped with usually two selectable input clocks
+  (reference clock and bypass clock), and one or more child synthesizers.
+
+properties:
+  compatible:
+    const: ti,dm816-fapll-clock
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: parent clock clk-ref
+      - description: parent clock clk-bypass
+
+  clock-indices:
+    description:
+      Maps child synthesizers to physical indices 1-7. Index 0 is physically
+      reserved for the Master PLL.
+    minItems: 1
+    maxItems: 7
+    items:
+      minimum: 1
+      maximum: 7
+
+  clock-output-names:
+    description:
+      Names of the child synthesizer outputs. The length of this array must
+      match clock-indices.
+    minItems: 1
+    maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - clock-indices
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@400 {
+        #clock-cells = <1>;
+        compatible = "ti,dm816-fapll-clock";
+        reg = <0x400 0x40>;
+        clocks = <&sys_clkin_ck &sys_clkin_ck>;
+        clock-indices = <1>, <2>, <3>, <4>, <5>, <6>, <7>;
+        clock-output-names = "main_pll_clk1", "main_pll_clk2", "main_pll_clk3",
+                             "main_pll_clk4", "main_pll_clk5", "main_pll_clk6",
+                             "main_pll_clk7";
+
+    };

---
base-commit: 0716f9b9338a86dd27796e00ed0fd560c653323a
change-id: 20260629-ti-fapll-clock-57a02c264e60

Best regards,
-- 
Bhargav

