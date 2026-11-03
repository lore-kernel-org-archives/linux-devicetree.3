Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735063;
	b=Jr/Cp1QSDncZf/6lH/Fyhc21eYsx9aZNv8aHTjVB75ZwP8sx7X+DJ12Co29cGuBzP9wo
	 8XBmLTfLe7OhwD8D/0gUdZ3mRNd/X9ZNtE66Vbf2BIl/ndO/4PBkgVZfJ33YIvV8wA4pG
	 05XFwcNBSAGpLOoCvTQZ2YMiYAeqzrTm3yUa/5j1xnJcyDC597Tgsu59bQUPe1LnwDg4e
	 Iz4Kbmbrz8wgkHNVv9SP7mp9np3kRULOTKixH85X+O89XJuhm+NoSbHGkxI3Ove9oRF3e
	 YzCVmJViZAGvb0zRMWpYSLNyRTSmwqwleWQhzA0x9OTjLPGOhTquKIEE6FeL8AZ0mkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
	b=rd2o8qEWj93+KcoxizMFho9ZxEt2Devsxy2/2poIrVs/8HM8TvT8QspoFejGvskeEjFb
	 eTVF0XALmnSbA7UFLcqMfeqm/sj92af1AvtIeeJ7X60dzD05/flK0kDnOJNCoQRaYpDy3
	 CzcHtiaUXWf+G6AHPw/aTYiLTSSkdS2R/F8rkaYDrkcGPKN1LIPLoV1svszFdiTbyRKPQ
	 3ekhgBeYS33eeaEPIpRx6ciPTXRBQvccFAuvvYixJ9UdeW0tbgt2AFUJOQOraOEzYSmvm
	 H+TzMtf/d8HWiYWkc1zFL3daHtsFqbEC7UXC9ZrzdT4GD9YwhRLlEdJrpPpFMDYzn2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHQMUZSO;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18F606A334
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C18F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHQMUZSO
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3962557f8f.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735061; x=1794339861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=lHQMUZSOhKdGVdbrzFOPzs8jy+HGwmA04DoqjzjWjYDUBnS2e245zZJkKtbuNaR1E4
         hQ1lmfoVmZXrGuwp16eF3fKqsHyiSOT4eLFVeqcI5OPceaCwqY6pLoz7TsAFwDQZpBX1
         /ggQ5mL1J294ldi8bRqXI5vCvJzN0AbWI5TUX0KqUgEp9hW4iYjJQO4z4DqGmaE60Q5y
         xHxo6LURPAi4zy9sYQh8WkSZDCQS6NkmY5Cg3jJKXqmFZ8YXu/LXlYlTNd/eKv4AjA4f
         aleQySxVnLc5WWuz6gKrmBeByJdiH4V9g+CobLjR1/H2zxKR1ZPQ/sC33aUucj0tBWlb
         9LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735061; x=1794339861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=oXHNp2CbhOB38FD3ye3SjxALdCEzhzV9hBtOXEhhSv9ddTbkAkjtnDbqb3IaodA+c/
         enAMUc4B5mo/InsUd/EgwW2elHU5aZ5+FAIqzd0bgu3idPBOMuU8hGdN0s7euFdFSxoU
         gvM9t6G6CEQMiKEseFe0ZsNPuzGaDRnZGnta9QMLtfl9MpwJd1abAlRZYNlLWbKpBMpl
         /2slukjG+eJyRjEa00p4EkYNDZYDrhdnOGx5UQKirytXPSX1xXCEhgvVM/aZXdmpjYcJ
         YmaS6DfmAEHwmMmub8xjbvw+YfCTxZItyBFbhaHDQC63A2nXLyTG4qaKlMOPzQkILgQD
         cICQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwg8f811Wd53mZKLCxcEXHThLwjlMEHafxCY+9WnHcqDrwgYmf+xl3o6YY584mMW0NI3hf3Z4wWLyd@vger.kernel.org
X-Gm-Message-State: APuU4Z8rhY4wRSMsLd6ctJHGqUnX5vw2wkzTCL3djYY1+CURRVdZ7d/A
	/mDxkDs6TVMpIfkbleQyPczmv8ZDyvWeD3nisGwVl5Sda2BhLf8MZ5qX
X-Gm-Gg: AYBFou08UmYnMq4bCnAbkNc+WV4oiO7S2Y77okMK6dB/rGZ8z+kgc30f7SmBEP2lNN/
	PctNlzPPKeOsk7rRhjFlZViZL7SA10QJlP19ONxDvSr20uuikEd+MoUR6rxiyuQHPMMdi9jGo4U
	vUcYnMbuM60O3jcbD0OlSfsCg5xgOY08IuAQn6xy7ErLXaDNJfbdMes7ibFs2xs5889/Je8ko5U
	nnjH2eMeqqIQsI2tiDanY1t8vgFydRG59OF1FoBy48uMBee9TCRD/aRGz5I+wfP0MZ5pHTCANCc
	8tSirUccdaB6aLRRCemAdxIjoLH5FfwLM5ux7xnU/o0blqCA46yRT4yNaG4kNvIEzh+e6c1UzgP
	rU1HccrBgBoiHnuUhtexLfwipo3uSzsaPeXQar3/2fBD7FE5gqVq6sA4vgPGkO5jU5u5ZjRNayo
	NeOj0YSCFD2QAT5aMTUf5nLiifsHn2anukbd/L29gr29t3344dNIYBKxwpcdWNdwJprYBNVPUxD
	JVomyu1bJXSjNsy4EMBD0xOOs9WDnhPHtYJFNlYEcQngS8pllMJIJHMItuMvD0DgkJjKVhlL7qB
	YvqeWc4q1yuefcNAg+ZsISMfvnCw7jd1dJ1hJLCRCogi3t3DlSLnH0h8LCIjOspwmleOp781DAk
	AJAl4gjLCUtVlLfYPPOrchkJAYsjUCQO7nA==
X-Received: by 2002:a05:600c:a4c:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ac17d16ba4mr320226935e9.9.1793735061345;
        Tue, 03 Nov 2026 11:44:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v15 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Tue,  3 Nov 2026 20:44:06 +0100
Message-ID: <20261103194410.6632-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..61a8d773f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..a9c78e635764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -805,6 +805,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.55.0

