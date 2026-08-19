Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9926F423EA2
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130275; cv=none; b=bNsD4AlHm3XI9uiqfvaED1dVZ1fjZi4Mp4sOZcOUHdH48MVH+w2XmXEM+wPdXIsD3NfJ8+enozGfl7Rck/bIPN5EkLWDYN+M0q8uT7CJHQwZi/zO5dunHHKqELzwmbYKJOMAsP0Cv8UfNND9lW6MkwnqiO5hEiU6I8nDembSRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130275; c=relaxed/simple;
	bh=auF42t5YW6BzcxOSO6933Uys6PkmhXuZNKTrajZn5AA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cllnOwewU2v1L5QHoUNTeLmsA1ns5g1v/YC4k4MnEDtkhKz8B3LBmk+sAcqxi9wRvCvob63bhQtv8bM5XEsZSz643m6rvh125qN3KHigceQIHUCfOzgVs5/vBFfMd5oCgZsaurICRmwXVKgn/O0fdQP59/MzhOhrAlAwBoh+u1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; dkim=pass (2048-bit key) header.d=bosc.ac.cn header.i=@bosc.ac.cn header.b=GyNDmrZS; arc=none smtp.client-ip=115.124.28.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bosc.ac.cn header.i=@bosc.ac.cn header.b="GyNDmrZS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bosc.ac.cn; s=default;
	t=1787130262; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=RTLG4bEHspGF2s893DBaZo0Vm/5PGntK4xYmGupeOBU=;
	b=GyNDmrZSWaspP5aeYYqMSPdaha+ihTV6oh04ozvWNB29q/YKYpzPETbKRvhtc/Mot8ClaYIcSXmXwBL95NQ23rkZy/0HwsXKEIdi3et3ZnCOlL7LXQj2zrTKy3wTuVgm/dySt8VMposxbfc7lHYF9/Cdw9qnWwmL5HoNbzenjlbnIoOLw15KXFhXclh3MHQt9FmoP543/6C1XhRCEjSrCPETRhcORErMTZgaQQdwYphUSoL7EEROcJzdp+w5R/vymXCjW7TfLHxurt8tiVUUfhLYnrqNUn7M54ZKA6ineDdYzb7cC7E6hTjQjQWqsnOC/weSTRynOSLU3xDwjGPhCQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07881055|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0516398-0.00709156-0.941269;FP=8747108671987209650|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033022149254;MF=guoyaxing@bosc.ac.cn;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.ir5uWtc_1787130254;
Received: from guoyaxing..(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ir5uWtc_1787130254 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 17:04:21 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	inux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	yangyinglu@bosc.ac.cn,
	yangyinglu <yangyinglu@bosc.cn>
Subject: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration binding
Date: Wed, 19 Aug 2026 17:04:11 +0800
Message-ID: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yangyinglu <yangyinglu@bosc.cn>

Add a Devicetree binding for OpenSBI configuration data in the
chosen node, including the cold-boot-harts property.

OpenSBI supports describing certain Generic Platform configurations in
the device tree passed by the previous boot stage. The OpenSBI source
tree documents the `opensbi,config` node and provides the corresponding
device tree parsing flow.

The `/chosen/opensbi-config` node can be used to configure OpenSBI,
including the set of harts permitted to perform a cold boot through the
`cold-boot-harts` property. OpenSBI parses this node during the boot
phase and removes it from the device tree after cold boot.

Add the Devicetree binding for this OpenSBI configuration node to
document the supported `compatible` and `cold-boot-harts` properties.

Signed-off-by: yangyinglu <yangyinglu@bosc.cn>
---
 .../bindings/firmware/opensbi,config.yaml     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/opensbi,config.yaml

diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.yaml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
new file mode 100644
index 000000000000..86b1e1e673a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenSBI Firmware Configuration
+
+maintainers:
+
+description: |
+  OpenSBI configuration data passed in the chosen node.
+
+properties:
+  compatible:
+    const: opensbi,config
+
+  cold-boot-harts:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of hart CPU nodes selected as cold boot harts by OpenSBI.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        chosen {
+            opensbi-config {
+                compatible = "opensbi,config";
+                cold-boot-harts = <&cpu0>;
+            };
+        };
+    };
+...
-- 
2.43.0

