Received: from va-2-41.ptr.blmpb.com (va-2-41.ptr.blmpb.com [209.127.231.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8C306767
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235785; cv=none; b=PFXJCiTDg+94wxfyUFl6bkcUp2DV/Kas3/MBfQFEBdor1F1JYj1d4CTt1QNMIi3i1vL0qTygmpb9Blii/0PYXCEfOLlRa+1I7lCneyQsbMHJkJjoQQ2ll5lc2EEiXxd4tga+/KApdivfTRBewZ9PuZl/EsXDpuEp7TO9ey4b1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235785; c=relaxed/simple;
	bh=WVziZOeRMB1UGv0Gn9pcw9a2Xh3ImcBFEM8uUWubguU=;
	h=Cc:Date:Message-Id:Mime-Version:In-Reply-To:References:From:
	 Subject:Content-Type:To; b=qHr0OOZiuObGWoYS5/bU1ZbreGYiIRWlgLhAPXHkxKH0VUGGmTGUcl6Lt4X3WCH4ENXEy/plVz1gc+w3tNqt8u72oQes8mRc31pxTBm1yHCM77OuOsNeZBMO1ufZMCZgE7ID7oomC3eRaaCv+nh3dQhCdbRP+Jn5CMFxMKIj7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=lLRa28YB; arc=none smtp.client-ip=209.127.231.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="lLRa28YB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1790235772;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=KCoaCi8bcR/IAcF7cKnD+rwEN3cnJDjyqTRrjsdnqY0=;
 b=lLRa28YBSjDa/dcgVSINEXDqwK9wXI4Kg3GNsFYE70O63MFKXJg2z8jIj3x3KC9gMfEYPP
 lpNQ53vqCSVAo7bYYl0wDlqR4gqhGM/MYuB6D5NuLiymHmfOmwDj4tWxmRwrKiTDyrpGyL
 mxX3kCERlEJjDIaRbfjEIB39sGTT8ux02RuFx4PGuCfsutdXBCnvWQQppTGWP4uE83lGYI
 mXKspZYrK3wrHRi8VycMjgnlPIv1NI0k2JQo5R6+TGE4GPIKWDwBWG7npXwwVVPGyIQ4Xh
 mPCjiYvzP71oGeVP0oK4LvLdRc+GLRgdZJVhACXAu+OCmOOmWf7AyqhTeIKHdQ==
Cc: <marcel@holtmann.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>, 
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <zhirunliu@aicsemi.com>, 
	<dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, <liheng.wei@bedmex.com>, 
	<yanli.yang@bedmex.com>
Date: Thu, 24 Sep 2026 11:34:10 +0800
Message-Id: <9301ec4530a27a83602d1036d1b836b326c69b87.1790235697.git.yanli.yang@bedmex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1790235697.git.yanli.yang@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 24 Sep 2026 15:42:41 +0800
References: <cover.1790235697.git.yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Subject: [PATCH bluetooth-next v5 2/3] dt-bindings: net: bluetooth: Add AIC8800D80
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
To: <linux-bluetooth@vger.kernel.org>
X-Lms-Return-Path: <lba+26ab4d472+74eff9+vger.kernel.org+yanli.yang@bedmex.com>
Content-Transfer-Encoding: 7bit

Describe the AIC8800D80 Bluetooth SDIO firmware-loading function and
UART HCI interface. Link the UART node to its SDIO firmware provider
with the aic,firmware-sdio phandle.

The UART interface uses H4 at 1500000 baud with hardware flow control.
Include an example showing both nodes and their association. Add the
Bluetooth binding to MAINTAINERS.

Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 .../net/bluetooth/aic,aic8800d80-bt.yaml      | 84 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
new file mode 100644
index 000000000000..76b94fd539e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/aic,aic8800d80-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AIC AIC8800D80 Bluetooth
+
+maintainers:
+  - Zhirun Liu <zhirunliu@aicsemi.com>
+  - Dijia Xu <dijiaxu@aicsemi.com>
+  - Chunqiu Liu <chunqiuliu@aicsemi.com>
+  - Liheng Wei <liheng.wei@bedmex.com>
+  - Yanli Yang <yanli.yang@bedmex.com>
+
+description:
+  The AIC8800D80 is a Wi-Fi and Bluetooth combination chip. The Bluetooth
+  firmware is loaded through SDIO function 1, while Bluetooth HCI traffic uses
+  the H4 protocol over a UART interface with hardware flow control.
+
+properties:
+  compatible:
+    enum:
+      - aic,aic8800d80-bt
+      - aic,aic8800d80-bt-sdio
+
+  reg:
+    maxItems: 1
+
+  max-speed: false
+
+  aic,firmware-sdio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SDIO function used to load the Bluetooth firmware.
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          const: aic,aic8800d80-bt-sdio
+    then:
+      properties:
+        reg:
+          items:
+            - items:
+                - const: 1
+        aic,firmware-sdio: false
+      required:
+        - reg
+    else:
+      properties:
+        reg: false
+      required:
+        - aic,firmware-sdio
+      allOf:
+        - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bt_sdio: bluetooth@1 {
+            compatible = "aic,aic8800d80-bt-sdio";
+            reg = <1>;
+        };
+    };
+
+    serial {
+        uart-has-rtscts;
+
+        bluetooth {
+            compatible = "aic,aic8800d80-bt";
+            aic,firmware-sdio = <&bt_sdio>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index af5a8b4b0bb5..20662fe78632 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -729,6 +729,16 @@ S:	Maintained
 F:	drivers/scsi/aha152x*
 F:	drivers/scsi/pcmcia/aha152x*
 
+AIC BLUETOOTH DRIVER
+M:	Zhirun Liu <zhirunliu@aicsemi.com>
+M:	Dijia Xu <dijiaxu@aicsemi.com>
+M:	Chunqiu Liu <chunqiuliu@aicsemi.com>
+M:	Liheng Wei <liheng.wei@bedmex.com>
+M:	Yanli Yang <yanli.yang@bedmex.com>
+L:	linux-bluetooth@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
+
 AIC7XXX / AIC79XX SCSI DRIVER
 M:	Hannes Reinecke <hare@suse.com>
 L:	linux-scsi@vger.kernel.org
-- 
2.34.1
