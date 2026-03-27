Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C673BF68C
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603349; cv=none; b=blszLE7lMmFIk8gojAZTtiYaUNY3gs02UQ+6iUCS39eN9q60bxxPqGuT8KLZPcJM0n8Yj/754zJkmOx7LbbboKyxzI7vCXHqC9I2i1xDWU+0UZF7Xgx6ujUuvtMyguhpZUbchK/n4u7ULIY769vztIgXw+BEzEoVwUlhYYlDkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603349; c=relaxed/simple;
	bh=77ziGXDJHCVtyxYDOLAAtXsexr+EvNb/qjtKrFRyQuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrvKH+ue0m4SKMvhm4FeiAaC8y/OEwVkzQfQfEN3bC1THTlF916PwCmLwXB6RwmdyU6Vleh1Ae9tmURuP6n1PFrgeGeO8O5fryfCm/JnwuANnckWOWRADvkKCrpddvkbVdXT0WTnTjJw5j1aoiC3MsJ1WFjV1YLDeagqeNcNwlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esYyOkWZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esYyOkWZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so1113923a91.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774603343; x=1775208143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKrsFAgsd9tGqXibhrnXaG9cuXcQbnK4a4OD2FtF8S0=;
        b=esYyOkWZdofvtU/E2Lx2kqBe4weEKdMt0bIzzUvgsbyjXFR6zEwBBd6ewBXf7C33/c
         Ie+biSvTlXzsXZ9E6t+6R29A18aZTiqX2k2D2ebf+eStG2CiGkNzJIAP7nBinKrLp8Ya
         iNVZi93Y0HT3VmwcA8KDhoANzFGN009D90LRCkz+jb2O1ZZJ2YFRbO5uli2Q84dw37dA
         9n+rqYpUqEubJBG2e9FCrqnsTxMAzI9GsiUpDmXaq+gujE7kaw5IjOaWhHRQKwDiz2x6
         nzpAMbMcOGuuY+Bj5SbsWpLO0kKtMKYQ6A2M6vK/FKptOrTMEtvk1QWsfBikguLEQEdz
         u+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603343; x=1775208143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKrsFAgsd9tGqXibhrnXaG9cuXcQbnK4a4OD2FtF8S0=;
        b=N0CPmtV4pts53suFaebNOyAkZRsmgOBxKyoPIwXhvYw7115BK6dmjTzYtPtUW3xXpR
         9h8DF7ykHoqEwD8x2UgVeQWwhOkkpTYzt5UmN6hslwicuTc5XDvOlPclbqUz5B98y7Ny
         2ymGrteiLfy3O94yiIkQJVjBVdDovX3wqHo3l6zja8e7LOMUB76hsqNButdweNhJalg+
         iQXik9Jr2ItWr0jEFGqBn73CLe+7o5OF9MawwPl4F+YR+KD1vuZLUnYoXYwVAP8D6wVQ
         EZJK7Ckb12sw5+fXvZc4uwD1APwckn14bkoMZpGF+PSXYypD6ImDAOSEnKBnvln6gUKD
         x9fw==
X-Forwarded-Encrypted: i=1; AJvYcCXe8lo1b43zD1DaChQMyzglICsamLWxfKx5HvpINJx57zWqBmCSe6t9Tlzu5XLpsiJ12w9nDnB3qr2a@vger.kernel.org
X-Gm-Message-State: AOJu0YzreJ907GRm41IT7I84M1vOuMQdH749rdRsQwo52o2z33Gi91y+
	PZdqyYIQbODZxYNx0S01CH0kVY3YYyu0Hesy8rzF2drn/de9F3D1nzuV
X-Gm-Gg: ATEYQzxBbS/7XyPzJ6Tp+Y+uN5xbbfYjQBjo7Pj2O7mbI71F9RWiwBEz10sFsuZAMZy
	9AftXfUkGrV9Ss+sgRExuezGh0xCGeulFRXZusjmxdSkgY7K4I7KR8hWHKBVm9n5SGsDlvQ6Egw
	6pdp4uon+aEGB15M5TEdLUBLwJvExi51eOY21F6wkslrlKJHsdj2B9Zrqaevr5PgYQFDQxXiYob
	WujfghjSJbSK8uaMNN6Z65/mXPpOFCrAIHFPiHP/8ezrH9GLss8QQenwq6AJWQ11JLdIZHD77fC
	Mc8Ud7MOQ9gEr1YgLpVuM11b1wjW4+wB55al8mgve2aZIncHAxMDK5ZpDgMtf/WHJoHX4s2f4DN
	I254WPn5rkjoGfFsKi3YZDoDo8bfjmeRWuhntRhAINzLvymkq/ac0WSp/vZrBtFt7Xu9zYGXHFg
	ozZvI45lNug4kdfM5GE+54YgzarahFdqg3KptjbMVkxMLK69Hg5IC/IUJUyEPf5Nie1TivACvO
X-Received: by 2002:a17:902:ecd0:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b0cdc1026fmr20438765ad.5.1774603343419;
        Fri, 27 Mar 2026 02:22:23 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm57749095ad.0.2026.03.27.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:22:22 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: john.stultz@linaro.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
Date: Fri, 27 Mar 2026 14:51:06 +0530
Message-ID: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Hisilicon hi6210 I2S controller hardware binding from
legacy plain text to modern YAML dt-schema format.

During the conversion, the order of the dma-names properties in the
example was corrected to "tx", "rx" to match the official property
description, resolving a contradiction in the original text binding.

Signed-off-by: Chaitanya Sabnis  <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/hisilicon,hi6210-i2s.txt   | 42 ----------
 .../bindings/sound/hisilicon,hi6210-i2s.yaml  | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
deleted file mode 100644
index 7a296784eb37..000000000000
--- a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Hisilicon 6210 i2s controller
-
-Required properties:
-
-- compatible: should be one of the following:
-   - "hisilicon,hi6210-i2s"
-- reg: physical base address of the i2s controller unit and length of
-   memory mapped region.
-- interrupts: should contain the i2s interrupt.
-- clocks: a list of phandle + clock-specifier pairs, one for each entry
-  in clock-names.
-- clock-names: should contain following:
-   - "dacodec"
-   - "i2s-base"
-- dmas: DMA specifiers for tx dma. See the DMA client binding,
-  Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: should be "tx" and "rx"
-- hisilicon,sysctrl-syscon: phandle to sysctrl syscon
-- #sound-dai-cells: Should be set to 1 (for multi-dai)
-   - The dai cell indexes reference the following interfaces:
-       0: S2 interface
-       (Currently that is the only one available, but more may be
-        supported in the future)
-
-Example for the hi6210 i2s controller:
-
-i2s0: i2s@f7118000{
-	compatible = "hisilicon,hi6210-i2s";
-	reg = <0x0 0xf7118000 0x0 0x8000>; /* i2s unit */
-	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* 155 "DigACodec_intr"-32 */
-	clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
-		 <&sys_ctrl HI6220_BBPPLL0_DIV>;
-	clock-names = "dacodec", "i2s-base";
-	dmas = <&dma0 15 &dma0 14>;
-	dma-names = "rx", "tx";
-	hisilicon,sysctrl-syscon = <&sys_ctrl>;
-	#sound-dai-cells = <1>;
-};
-
-Then when referencing the i2s controller:
-	sound-dai = <&i2s0 0>; /* index 0 => S2 interface */
-
diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
new file mode 100644
index 000000000000..5171f984630b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon hi6210 I2S controller
+
+maintainers:
+  - John Stultz <john.stultz@linaro.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,hi6210-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: dacodec
+      - const: i2s-base
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  hisilicon,sysctrl-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to sysctrl syscon
+
+  "#sound-dai-cells":
+    const: 1
+    description: |
+      The dai cell indexes reference the following interfaces:
+        0: S2 interface
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - hisilicon,sysctrl-syscon
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/hi6220-clock.h>
+
+    i2s@f7118000 {
+        compatible = "hisilicon,hi6210-i2s";
+        reg = <0xf7118000 0x8000>;
+        interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
+                 <&sys_ctrl HI6220_BBPPLL0_DIV>;
+        clock-names = "dacodec", "i2s-base";
+        dmas = <&dma0 14>, <&dma0 15>;
+        dma-names = "tx", "rx";
+        hisilicon,sysctrl-syscon = <&sys_ctrl>;
+        #sound-dai-cells = <1>;
+    };
-- 
2.43.0

