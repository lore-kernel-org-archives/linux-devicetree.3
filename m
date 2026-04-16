Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF42D8DDB;
	Thu, 16 Apr 2026 03:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309192; cv=none; b=ZWK3PuifftuPwCfxkzjwuJhtsRFSVBplIMckjv20cVhMSrCNtHHj9wbzxWSHD3riol6w5BI3LuEPbl1aYbPrmFb/wYTOIJwVABTSUnNRrlh0lEHzM/0ydGgG0eZRD7oKiNWwfNfm/lfuzKXERBmDmc0yBAaV04xzoWRnEn1d6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309192; c=relaxed/simple;
	bh=KJ0Wa1T69I89V6sLklGaoOyFZeG1EJ7RMuRkbdDZC4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XL4fikKP/kla9s7L8bz1rLc9sJY0tSYz0rwxNSLZLa59Kar7FZAUjJ4cijRCleSteekfWLjzIyD82U3zXMfy1gfW+NDea+66eClQ5q5g0NeA6p0Of9trtN1VIkFyFN+4euWTE4fs/FpHJQ6yxMzvGjN9G2fbkp8ZNCXvJZKrrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lyTG2bh1; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lyTG2bh1"
X-UUID: 2fbd4410394211f1ae70033691e9ac7d-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zQljgFJxDTEhCUsQGY5V7I6/LsvzWdbAyeTeYZsqooA=;
	b=lyTG2bh1gEa+alOhwmp3EWhlLozvLBN4yP5M3A5Q0qY7BajsmPRCD7ZzE0XyL//O9fbd6P2VAzQm8vvL7gMU4aOK/DGPHP9h7wXX78BAFhFffqMwP2Sdh6nIkbmiQu76pM0O5wxV4h0n1mWk6l3wK2s/gRgESjFd5R4z17+vJlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1c5b25f7-3cd6-4757-969e-10cd3261a6b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7496eb24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2fbd4410394211f1ae70033691e9ac7d-20260416
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755827277; Thu, 16 Apr 2026 11:13:05 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:13:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:13:04 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 6/6] dt-bindings: soc: mediatek: devapc: Add bindings for MT8196
Date: Thu, 16 Apr 2026 11:12:09 +0800
Message-ID: <20260416031231.2932493-7-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Extend the devapc device tree bindings to support the MediaTek MT8196
SoC. This includes:

- Adding "mediatek,mt8196-devapc" to the list of compatible strings.

These changes enable proper configuration and integration of devapc on
MT8196 platforms, ensuring accurate device matching and resource
allocation in the device tree.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 06a096440331..5eb260bf3dde 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -22,6 +22,7 @@ properties:
       - mediatek,mt6779-devapc
       - mediatek,mt8186-devapc
       - mediatek,mt8189-devapc
+      - mediatek,mt8196-devapc
 
   reg:
     description: The base address of devapc register bank
-- 
2.45.2

