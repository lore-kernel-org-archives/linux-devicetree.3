Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE233DEAD7;
	Tue, 24 Mar 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356825; cv=none; b=mQyUpd4kT0jjgv7oqBMzsf3nJWa37O0DJ2W6QQNvJu0ro+f5ApfNHtOOf1TEYDLscLSA4kqvG/r8kueFnUnkYZm4NdFCIyRZHvB502yrH2UcOppKkfbDU5hUa/Z02t0eiShXEOLHvvK13p2/3CwOtC5smDpCI+N5vC7zXXeaZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356825; c=relaxed/simple;
	bh=pz3hfM8gLYvCdd+son91wPmVeH2Qhyk0KljKXMya6iM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OS1cO4xcZEnpAHvj2H6A3PlcvQiWp5400gR9J8FMnBP8M4mSen+TR1a4A818BdF9ScaD0+05xg6A0py0NYe9ln1cKo9q7RwEfBeP5U88E32OCNRKVJ74erMTKuRTN12LZxOBDZ/R1H3Rp11lkk+jotpfh49DunbqEcnEp/wNjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=D9+Sqqoy; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D9+Sqqoy"
X-UUID: 7a3206d0278011f1a39cd589f645bc18-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NE2THDKgWn+s+KScDCS5nO+ymg51/wPTHws2zjTQ8OY=;
	b=D9+Sqqoyl3h2PWkDnujQ0ncnxnW8yCQgu3H2GgBO+Ab3z+w2WN9FpDgssbaT39+aRY+wRymzDYYsW/2BGALr0dXomIXvoXiBY/XaA6g89rzcf/Ia/Cnpq/1fr57zsyDviJSqSwNP6njlHOYnBq49KkvSeiVIILeymGfDxZ+4LBk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f02c63cc-8331-4c04-b9f3-b150be02f8b3,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f1ed65e0-cf51-4058-942d-ef4f058f9afa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a3206d0278011f1a39cd589f645bc18-20260324
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1656042410; Tue, 24 Mar 2026 20:53:38 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 20:53:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 20:53:36 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v4 4/6] dt-bindings: display: mediatek: disp-tdshp: Add support for MT8196
Date: Tue, 24 Mar 2026 20:52:01 +0800
Message-ID: <20260324125315.4715-5-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260324125315.4715-1-jay.liu@mediatek.com>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Add disp-tdshp hardware description for MediaTek MT8196 SoC

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 .../display/mediatek/mediatek,disp-tdshp.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml
new file mode 100644
index 000000000000..048281a5b22f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,disp-tdshp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display 2D sharpness processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  MediaTek display 2D sharpness processor, namely TDSHP, provides a
+  operation used to adjust sharpness in display system.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-disp-tdshp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp-tdshp@321e0000 {
+            compatible = "mediatek,mt8196-disp-tdshp";
+            reg = <0 0x321e0000 0 0x1000>;
+            clocks = <&dispsys_config_clk 107>;
+        };
+    };
-- 
2.46.0

