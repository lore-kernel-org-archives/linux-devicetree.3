Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC913BE636;
	Wed,  1 Jul 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891992; cv=none; b=Hu8bufkmvJW8ROOu3Z0rFKk6d6UeqqwHiks7/QNuBN1Io283w6gZOSyaARamPpBYn+zuHR8OcdE/dZ2Uw1osAQ2imGBoqUTh6vZgvhbZ4lGzMej34X9ZwaLC2bcmFpW40UY/pPrmx44T7FBjIwcuLgBakYTGOv7ieYQWQy922PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891992; c=relaxed/simple;
	bh=B0KH2pISXV2mq4/ZJ4UJtKhTis06wE7HDQxuBNVo8c0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ju6t/c7AsnviZipujm7hxEXgPOWMbtTS7VJcN7iP5489WxoGNmi64+APs2DOtCvRnHmNI1lHYsi4/TdsvF12ao+sUnVx4S6Wen1u9JRCTbGxwr1MrUKPtPuCulyHklfLiD3yNia15y/iiRqpc2SnwmDxs6WmsYhVTtm6QdkUtUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AePkhl2D; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AePkhl2D"
X-UUID: f35f2932752011f18dc8c9802ae25ab1-20260701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l7mCsGPgokHXyP8uY+tRPYlUOzo/mMetz6YXudC9qco=;
	b=AePkhl2Dy1E77S4Ha6FRsCvC18z+9g7Tr88d0krmINAvE/4w3aWGxUO4HxeAhzQ7v/fFZ/1uWlLjSuF0cWxLxSusvD6RLbNtCa/aGh1XvduTs4m0Qd1XLsFJFH5zNWJ82Fs1CMuD2tIsxV/Qr4XHqC36KI/egLh9R+VGIHZheCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:4754a8d0-af49-41b2-b7de-60a9662a2163,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:ba22ae0b-cc5c-4c79-a965-86c83a4d1523,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f35f2932752011f18dc8c9802ae25ab1-20260701
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <congcong.yao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2010730496; Wed, 01 Jul 2026 15:46:20 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Jul 2026 15:46:19 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Jul 2026 15:46:18 +0800
From: Congcong Yao <Congcong.Yao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jarried.lin@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<justin.yeh@mediatek.com>, Congcong Yao <Congcong.Yao@mediatek.com>
Subject: [PATCH v3 0/2] MT8189 SMI SUPPORT
Date: Wed, 1 Jul 2026 15:44:45 +0800
Message-ID: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Based on tag: next-20260629, linux-next/master

This patchset add mt8189 smi support.

---
Changes in v3:
- Change the clock numbers of smi-sub-common to minium 3
- Link to v2:
  https://lore.kernel.org/linux-mediatek/20260427070444.20247-1-zhengnan.chen@mediatek.com/
---

Zhengnan Chen (2):
  dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
  memory: mtk-smi: Add mt8189 support

 .../mediatek,smi-common.yaml                  | 18 ++++++++
 .../memory-controllers/mediatek,smi-larb.yaml |  3 ++
 drivers/memory/mtk-smi.c                      | 44 +++++++++++++++++++
 3 files changed, 65 insertions(+)

-- 
2.43.0

