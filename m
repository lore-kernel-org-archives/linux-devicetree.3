Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD235B639;
	Mon, 27 Apr 2026 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273526; cv=none; b=Tr97s20sbJN/TtYAz1e+yG8DWFjP2ctjcQZOVjY18pMnnHZbbQIAOqg+pvYBG+s2OING7xBQ0stvVgaVDmx39zoMXaPrk2LamjRmR6j3+sxO3fMAHSFFkaSxNwCam7vsLnzG4HnXSY6Bo4lnwCsrt/2rTsO+MTQ8ue0n4lvifi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273526; c=relaxed/simple;
	bh=txp38wPE8HLnbB6HjG8lVlOY55mwh+97PPoaAn57Rck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OK1JIdBPwCZ6IHMAkUtVKpmKqveeGaA8JYF5BDLXlo5KpUTdx0NVSv8rEZvbLKg100/2mxtvknn0kpPffFNAcWhgIX2BZNTEMSBk6Zj0rK7ttodJuvnHXIw/gm5iANDzTAhrn3sXZe9+ajwSUviMntngS9N4nz+yQrJpktm25AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gm4RQL34; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gm4RQL34"
X-UUID: 727b2e48420711f19781c1a04af40193-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rr/9loWzTCnuzbqIycr7oDXTTISYfg5Ae1uSICJW5Ho=;
	b=gm4RQL34QwCnjs15OkJloqifimmHdv+EKvRzIE7U8O4MwjETygGf/okbXdCtvtGNHNlxtjZGp147eTK0OwC0cx8HaLlCALJk55W8pc/pgW+NErDVLJNXqHqtLWDH9V3hlHp0dkSAfc0irjgM+QtNXapvURuytQ/RH5+uJfVlFYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0ea6a5b9-fb4f-40a0-b518-d06fc6afcb1a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:53187fbe-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 727b2e48420711f19781c1a04af40193-20260427
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1928408788; Mon, 27 Apr 2026 15:05:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 15:05:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 15:05:15 +0800
From: mtk20898 <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zhengnan Chen
	<zhengnan.chen@mediatek.com>
Subject: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
Date: Mon, 27 Apr 2026 15:04:28 +0800
Message-ID: <20260427070444.20247-2-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add binding description for mt8189.

The clocks number of mt8189 smi-sub common has a bit difference.
Its clock count is 2, while mt8195 has 3. Therefore, the minimum
number of clocks is changed to 2, with the third one being optional.

About what smi-sub-common is, please check the below diagram,
we add it in mediatek,smi-common.yaml file.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,smi-common.yaml                  | 25 +++++++++++++++++--
 .../memory-controllers/mediatek,smi-larb.yaml |  3 +++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..454d11a83973 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -25,6 +25,21 @@ description: |
   SMI generation 1 to transform the smi clock into emi clock domain, but that is
   not needed for SMI generation 2.
 
+  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
+  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
+  In this case, we use a smi-sub-common to merge some larbs.
+  The block diagram something is like:
+
+                          IOMMU
+                           | |
+                       smi-common
+              ---------------------------
+               |          |           ...
+              larb0   sub-common      ...  <-max number is 8
+                   ----------------
+                    |     |    ...
+                  larb1 larbX  ...  <-max number is 8
+
 properties:
   compatible:
     oneOf:
@@ -40,6 +55,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,19 +125,23 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
         - mediatek,smi
       properties:
         clocks:
-          minItems: 3
+          minItems: 2
           maxItems: 3
         clock-names:
+          minItems: 2
+          maxItems: 3
           items:
             - const: apb
             - const: smi
-            - const: gals0
+          additionalItems:
+            const: gals0
     else:
       properties:
         mediatek,smi: false
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..9a5dafd7c07e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
           - mediatek,mt8188-smi-larb
+          - mediatek,mt8189-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -85,6 +86,7 @@ allOf:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
             - mediatek,mt8188-smi-larb
+            - mediatek,mt8189-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -119,6 +121,7 @@ allOf:
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
               - mediatek,mt8188-smi-larb
+              - mediatek,mt8189-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 
-- 
2.46.0

