Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE6403E96;
	Thu,  4 Jun 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571946; cv=none; b=Q7U3ycnPWxvLG/T92rqOFY34QA+91+V8hkKyQoooRbNwQVQu2UNoOCJNkVSaBfY2/rcibbLJfmcwN5I9mjqKxB21420/JBQinscdYANT3THQ4dTmFXMIkm52PM+02ZQHonKIPh9nhqfMRf4zL9DYezpiFlBK7+eQpCnxNNCpjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571946; c=relaxed/simple;
	bh=u517BEwQRTLE01P0mJFfmff+0nMkj7k3ExoYJzgThMo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlZNrCZqSMcpxbF9e16qpttfW19FrU2u7uMTA2jce8soby4OZSkBY/9zWjCARDyRXc5Rtj5906hKviPNiQWigRYGbw42Ny4XWGGgTZP6jseW2aspDfQZoTId+z2Q55Y3cgNr4woo4q0Y8ZvRyXuUlGYKwgXYGC5nOQzQ7CVokkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dWU7W28m; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dWU7W28m"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BILTF0299932, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571902; bh=kp3CXR9786IlCOU/M2dXnjgdAwiYVzueeangPNGEtds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=dWU7W28mk3hUn247ZGwKCpLbiI0R+gXsdptVw+RDpZIpB91NYlTw3DwI2K6YpeOTs
	 iKDeqoaAUKyC1ppRT3Zc7IcRrEo/iY5+JZUmZCQx687L3rX3OLdNEzMtkkluwaEGXX
	 lSfKISLoxhKsOedBHFrJYOVaRQhQjJ/vSwLPanNydaqACENyAKKyo3AAjCWFMVxlMu
	 JWIkQX1uTw/pSDnjwrVMuMkT0joSdH9NSkQIGoOy6wyzbRiAtvpra53/Nh5aoC92wd
	 gNKawUSnOuKE85xhP6xCI7evl7OtNhmU7ohy1nurlC8pAAkc3hyBMFBmjQUBuOlV6I
	 d+o20mUU25afQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BILTF0299932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O level detector
Date: Thu, 4 Jun 2026 19:18:18 +0800
Message-ID: <20260604111821.975624-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604111821.975624-1-eleanor.lin@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Tzuyi Chang <tychang@realtek.com>

Add device tree binding documentation for the Realtek DHC I/O level
detector.

This hardware block is responsible for detecting the I/O signaling
levels (e.g., 1.8V or 3.3V) of various interfaces (RGMII, SDIO, eMMC,
etc.) and applying the corresponding pad configurations via pinctrl
states.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../realtek/realtek,rtd1625-io-detect.yaml    | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml

diff --git a/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
new file mode 100644
index 000000000000..badf27212dfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2026 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/realtek/realtek,rtd1625-io-detect.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC I/O Level Detector
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+
+description: |
+  The Realtek DHC I/O Level Detector is a hardware block that detects I/O
+  signaling levels (such as 1.8V or 3.3V) to determine the correct pad
+  configurations for specific IP blocks.
+
+properties:
+  compatible:
+    const: realtek,rtd1625-io-detect
+
+  pinctrl-names:
+    items:
+      - const: rgmii_1v8
+      - const: rgmii_3v3
+      - const: sdio_1v8
+      - const: sdio_3v3
+      - const: csi_1v8
+      - const: csi_3v3
+      - const: sd_1v8
+      - const: sd_3v3
+      - const: uart1_1v8
+      - const: uart1_3v3
+      - const: aio_1v8
+      - const: aio_3v3
+      - const: emmc_1v8
+      - const: emmc_3v3
+
+  realtek,iso-pinctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Pinctrl phandle containing I/O detection registers.
+
+required:
+  - compatible
+  - pinctrl-names
+  - realtek,iso-pinctrl
+
+additionalProperties: false
+
+examples:
+  - |
+    io-detect {
+        compatible = "realtek,rtd1625-io-detect";
+        pinctrl-names = "rgmii_1v8", "rgmii_3v3",
+                        "sdio_1v8", "sdio_3v3",
+                        "csi_1v8", "csi_3v3",
+                        "sd_1v8", "sd_3v3",
+                        "uart1_1v8", "uart1_3v3",
+                        "aio_1v8", "aio_3v3",
+                        "emmc_1v8", "emmc_3v3";
+        pinctrl-0 = <&rgmii_vsel_1v8_pins>;
+        pinctrl-1 = <&rgmii_vsel_3v3_pins>;
+        pinctrl-2 = <&sdio_vsel_1v8_pins>;
+        pinctrl-3 = <&sdio_vsel_3v3_pins>;
+        pinctrl-4 = <&csi_vsel_1v8_pins>;
+        pinctrl-5 = <&csi_vsel_3v3_pins>;
+        pinctrl-6 = <&sd_vsel_1v8_pins>;
+        pinctrl-7 = <&sd_vsel_3v3_pins>;
+        pinctrl-8 = <&uart1_vsel_1v8_pins>;
+        pinctrl-9 = <&uart1_vsel_3v3_pins>;
+        pinctrl-10 = <&aio_vsel_1v8_pins>;
+        pinctrl-11 = <&aio_vsel_3v3_pins>;
+        pinctrl-12 = <&emmc_vsel_1v8_pins>;
+        pinctrl-13 = <&emmc_vsel_3v3_pins>;
+        realtek,iso-pinctrl = <&iso_pinctrl>;
+    };
-- 
2.43.0

