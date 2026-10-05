Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DA386561
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197755; cv=none; b=lEQkcZ9ybW1pVyf4vzIVP3tEgrWcDnlm8m9SQ/iHjyDxMgZQOhctPUFEgMcHYKt6zYPIweXHdMXaS7j8rVooM4l0dcPgzvJiZL2H6Z+QPxpRRCvV0JwnOIkkzotPeLlnr23OvHfkero87G3eJyl+wlhxfbg65/BAm2LOvf3Hpoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197755; c=relaxed/simple;
	bh=5UG4E5DnIc6hOxuaTW32mLMZmvC08mEQ9ojnDaMhTXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2z0hIMRjJkC2rg8f7tE766MnLHyO9WxzwvXKby1fpCTBG2DgPG968jrDiPM167S112mmrh3X1M5LClPY6mQWCefKpSBBsUVSMssSeqeNWBmVWQC3gkK+d8sZDIN5uF5446wpJa9QCQfcDaUVSO4hysNWmakTt2soEbE3Bey1So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCnmctme; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCnmctme"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so939414f8f.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197748; x=1791802548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=;
        b=rCnmctme8fcKPEDAItjB+i45PF9g2XJ2g1nxebxmGAmiWXvAC/y10ajfW1AaKZVEDc
         LA+AEyAPU68YQvc/x8KIk48wl6o3+T7epCtGiZxv0K0twz5ZRJsV8B43T8UFVSARjK+x
         54B74DFA8QbDhUSnhFN8mvpJFUQZuBAxvnIpdzwL+DrdG8fnbjK1FLlhKINuult0I5Rf
         QLkcLGg9342tCTPIwOKLwZkZA00fK2vdeEQ0Fz/GEWXwpCo8E+blboDC9cQM/SmxIkKU
         KaqOa92O/xQOqijZBLN7paWkCJiP4xHxQTGslDOuJmiKFvWtLhFP6lAnBnaZc37f36Ca
         DIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197748; x=1791802548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=;
        b=K1b0mqKRldZ+HdxdjPgE1X2rKM/kc36iXE8BZryBiXnIxSiIx2BqDvp7n602hRAC7l
         0OcJ8BemKFW4E/nemCOQFYT2o5DYEvXNOURa6frO8KXiR2Pc7e7DYpeZXGGmsGwGcxrj
         NiitktSOYxtI9ocuzHUOdacRR/H/bAMluIrz82Vf11j0xJRzl4ZPbzE3tdtNT6JWM9sS
         ColRjSqcrLLkV4Dzq48o0mzYunUaIj9naceucwhXgnkAfG+CxTLN7EUJAR2oF6p/ltj7
         9/PNamUSPTZYbkM6DgjqAGYEj8bEeB3oZnvkQo9ensfu1gR4WehZV43PvhiS2sajU4s/
         83jg==
X-Forwarded-Encrypted: i=1; AKwUvBy5l63wx5xfHHLPukFLgGVVX9FtPlEaFHipzl1Nf08CvdoBT0eDHPdm5ND4/H3m9rmjd9An4yHzSiWS@vger.kernel.org
X-Gm-Message-State: AFuF++llRaP6Zlpmp/W9amnk7ttKudoNDc4bK9D4pCHeDWHzdirClgUz
	z96gmlyQnG2vFDizfW4h8Ce+MZJbLRtMsG9bA8XQnFPwsjspGI4OTbON
X-Gm-Gg: AYBFou3cFIKXnkkbe5mHCGEGZbeprZk22nNEZme1rgByeIm7avhjO2iklsQSQKrRgDp
	SsMoJzUxzqT4WdKmjZJ+14BQSiXb/znG45lTiAcxM+IWH4ICg4CoJwaoq6E5vaqvwSNDlvYhYaC
	j4LVIQRMVdfPrLAyh2XFgMvOCmYgliNiF0w64IH2GPV/nalLeWtDk3gpYf9Iuosh9qwyw2/tPnx
	AwmujHAAAGrd7Va6cOXs7krRMS+GSPyXjlIf2tW/kmiUhkGWfAq2lvbHGMmgZD7c9B+kEJ/Jmx/
	hJw8m++8NESVBDHQiCOvSl461creJL03qWgp2dw8J3hhix0ujsRVPaObZQkPvh0PblXLM8bTU+y
	U83t5Cis2Fn8q6fPEJT5CxfsN9ZTN3l59VCzZDEBngSxxmOk7tepjXXkhquO0N/e6RohT4h1MRZ
	KPVzDhkxFKbT0q0h4Ta/LrmoOUnCvlIY2Vo7Zqw+wCcASwI6/nftsnVmLVG8DtGV3G/3OzvBXiP
	kMpviHXJa1lJdjlCUHFlEWH1fP8Hc6Q6IejFnFv5CDaA+JGok3fXFpO/BDh/Kc=
X-Received: by 2002:a05:600c:19d0:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a02756f0c3mr166346825e9.5.1791197747443;
        Mon, 05 Oct 2026 03:55:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm270319635e9.0.2026.10.05.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:55:46 -0700 (PDT)
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
Subject: [PATCH v13 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Mon,  5 Oct 2026 12:55:30 +0200
Message-ID: <20261005105535.2472-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005105535.2472-1-ansuelsmth@gmail.com>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f42e3d49a61f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
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
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 0570815ee980..d8cf9722f76e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,12 @@ S:	Maintained
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

