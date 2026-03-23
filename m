Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39393CCFB4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287774; cv=none; b=YLcb8EDaBM53TaUySCNySyfmmHa3WlZsnVdvYR18DjRgpH7Hb27wxfmpsYVC2d1XI4waaMbiJxqlZefgJR3DXl1I5sPZYMSWXiI7qRWVnqsINudXptmgx5Hdb3zHNhe5GU0NdJd9J1yo2turgZcdDJgXQNyoZPCdK5FrXOO3FJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287774; c=relaxed/simple;
	bh=Zia7/De1q5TthWSYEWLCdCXljCxkVAiumOWzbpU94iI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DlMnhizbKq4j5U2JgdOqSH/Cp3gyf2a8DEF/JVrUJSojk4/h6/5P0js2aboWgNExNfAvbjs6mefXWpboM6sK3xg8cfyvySpqgbbHt0V9cNJXxmZsodtZrwhRmIE3Sa9WhhooflDUL78wNlDuCDQ0aFqRcHQfPddAJlpao/KhXAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bR+UAaw9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bR+UAaw9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso564377b3a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774287772; x=1774892572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9rgDJBvOjQHeJIHea/WkUik8ezrEjHRne7jLDTut+8=;
        b=bR+UAaw9REN0zR8aBZkLuWfFnqxvlW/mi3su9CB0Icbog0ZE3y0kJFmuLct2VUF72f
         BhKbefa1PkLOzbujhHVokeSeT7ZddWen4D57ml7zgKNLJ5/PNizKIxBe3WP/RwMeyn4w
         cWGecSEh0Ygx+msHst+pofificU5vtfa2a9weiB71yaoziZ8hd48KgGZhXAuSFMT9aDV
         aYhN9T20GC7IsyLjYJNNBq7KCxvzSRfBKcNShCExdX/JVBSgYM1es9GkiZ9OtN7m/hhE
         3QI202z/Rh/xnCBWGBF5LbKqNb/byXJcRdMaoGp6H++bLZNEUljeasl8C0c6cw5vC43q
         0WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774287772; x=1774892572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9rgDJBvOjQHeJIHea/WkUik8ezrEjHRne7jLDTut+8=;
        b=OcQ/3iTnO/YPTuvcAd/2aFLExmFRDT2W0PiqCmfDCSf1KdOgLPhDZxXKH69MPMyJNd
         q3l8pmL/sXPzPRkNn/xN/CdkOEOtxVJBapkAZgFmi0eNFCb7SNo4oHO1Pw9I8rQx2u5+
         T9JAgomDl/kPdABTcJ51WDwa3zQozZrrjqZOVaDjcWbM8ax2PP2XUaduSdhV4VjFsfhW
         N4fvTgPIS2xgZ8mfqEZc8FxXXAJE8zdvXeUQUI2nhSjh2YWlK1UMb0hborxy/yi62n2p
         Jz1rLzsOKfulnzQQifK9Iy0zOnZzmvy9AxHQS0QxXyV+0xnmr/fXIbSjabNpm8GB7hox
         7WaA==
X-Forwarded-Encrypted: i=1; AJvYcCV8XHaJtdqa+pYS2v+fHLxB8qJMFo04uciQzXeFlgC+37RqpWzcXgFPLPLlgKK1DL43dkLtXJ4zJ5nD@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcL/SQhJvHytPb/JaA6PP6OGHsVeabbU5Ppm2Zl09zaEfWcBd
	Lo4v6PXA+wWNxaQeqZkFj0qVcfS1D8G3Oh3w0/flLCYYtYoRvA1c80mn
X-Gm-Gg: ATEYQzxMcL1UGvWXtYGbgUX0LLhCVgG39iYY7ncUZ3rY/ikaWm3Kes8PsVyBcqfYkxz
	K1klf+HfhKyIOLIs6kY9U+wOdHBDGW/vOJ1mbD/tSNyiAxwAVlYznzIWbAhBfCJ612dBJeO0mt4
	7VOGlpURoiNu/JmCdQzxbGievlztRUHm9IpDGsO5muwfKiZXxgjT9JZxF2xtfiF5Teo5MNskJXk
	TA51FTPtzM9ASA4ZNdINF7u2n44XN6lRMehWEgbp/YkexmoqA2RStKUA6p8jYcf7GN1lcXwiNMG
	wbfjHiO0dqHuK5UMClpMbD7LDrqhqnRUi7JlKTyaJ6bhxeNlnT3nfY+HifflCl1HfMG92pxl+DH
	otqTUZ759xzD2ZRHRmul3934MIih7fW3zd0EBG4guHXeRe/gmqiUx2tSpBm2sVIX8b15I2+pSLj
	qAP3D0+hma6tWFJn0jUUt870P9C/zM+oX5Ag==
X-Received: by 2002:a05:6a00:b4e:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82a8c241249mr11327052b3a.19.1774287772189;
        Mon, 23 Mar 2026 10:42:52 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:22d3:4161:93a:b87c:36eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da3dfsm9847123b3a.45.2026.03.23.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:42:51 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	i.shihao.999@gmail.com
Subject: [PATCH] dt-bindings: i2c: cnxt,cx92755-i2c: Convert to DT schema
Date: Mon, 23 Mar 2026 23:12:36 +0530
Message-ID: <20260323174236.147507-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Conexant Digicolor I2C bindings to DT schema.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---

Note:
This patch is part of the GSoC2026 application process for device tree
bindings conversions https://github.com/LinuxFoundationGSoC/ProjectIde
as/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../bindings/i2c/cnxt,cx92755-i2c.yaml        | 51 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-digicolor.txt | 25 ---------
 2 files changed, 51 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-digicolor.txt

diff --git a/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml b/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
new file mode 100644
index 000000000000..669397bbc571
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/cnxt,cx92755-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor I2C controller
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755-i2c
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
+  clock-frequency:
+    default: 100000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@f0000120 {
+      compatible = "cnxt,cx92755-i2c";
+      reg = <0xf0000120 0x10>;
+      interrupts = <28>;
+      clocks = <&main_clk>;
+      clock-frequency = <100000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt b/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt
deleted file mode 100644
index 457a098d4f7e..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Conexant Digicolor I2C controller
-
-Required properties:
- - compatible: must be "cnxt,cx92755-i2c"
- - reg: physical address and length of the device registers
- - interrupts: a single interrupt specifier
- - clocks: clock for the device
- - #address-cells: should be <1>
- - #size-cells: should be <0>
-
-Optional properties:
-- clock-frequency: the desired I2C bus clock frequency in Hz; in
-  absence of this property the default value is used (100 kHz).
-
-Example:
-
-	i2c: i2c@f0000120 {
-		compatible = "cnxt,cx92755-i2c";
-		reg = <0xf0000120 0x10>;
-		interrupts = <28>;
-		clocks = <&main_clk>;
-		clock-frequency = <100000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
--
2.53.0
