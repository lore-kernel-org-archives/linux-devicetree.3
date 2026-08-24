Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9C3EFD30;
	Mon, 24 Aug 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562266; cv=none; b=MDXkJ1+0qpiOGnxXRDjP90jNT5z3hnj9sPbrgvCTYPhGRvXa5FxuQJRpUVTVdFbe+PbEkHeM7GF8paWhFy4zWLt3oUs96/fQMcTfH3bspm0u79Z9BE8E42gxxqclL3VfTqJ9tEeDlg2n9YFwhin11P5yW9+KoVTg7a3WGTeA130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562266; c=relaxed/simple;
	bh=8IWwb6vpgOhMbw4KZxOur1W1eGzDWUqCvfiTDTTohIs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tKLObah7IYkWl7u17c6GGaPhWlEVlIH8LhN7mnGq1KsFa9RFZB70RepM4uJNMZJwRsZGHjuwtLX/jt+5mktSO1n6A1JuQZ49TTnZ2FCUuPOrzi2x8/me1mkLOShvgi+1LfqAa43O/9NtpDNYMRuaW2QbjEEwW253nNAl4uNm2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pLglmnOa; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pLglmnOa"
X-UUID: c83c0dde9f9a11f18dc8c9802ae25ab1-20260824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yVSAp3BOn2NMVHDPGQ6AJu+jYwg4kqser2wze3TvZks=;
	b=pLglmnOamEJZIzk8PC3d0HVWd+fsj8GCpNcL3BhPYkn3+J8lIbsR70QvPqXfAotormSi2zc9EOxMtPv8kxvvgJhbqftr1f5Vy9R3Mq5kY5v/QURRt9vjtJyiHxIycuscVNKczGt/UO5JigdWw0wSkWMIpYfCbmc64zt6HdUL6Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4cc59c5b-a3f4-4862-a8d0-79323c5d806f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:fb1e1dc3-610e-480f-b463-9bb53aa0aeaf,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c83c0dde9f9a11f18dc8c9802ae25ab1-20260824
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1542505101; Mon, 24 Aug 2026 17:04:15 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Aug 2026 17:04:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 24 Aug 2026 17:04:13 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Justin Yeh
	<justin.yeh@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region
Date: Mon, 24 Aug 2026 17:04:00 +0800
Message-ID: <20260824090409.203230-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The SCP firmware in linux-firmware for this platform
(mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
drives through scp_c0. On top of the segments it loads, the firmware
allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
over memory the firmware uses.

Enlarge the region to 9 MiB. apu_mem starts at 0x55000000, so no other
reserved region has to move.

Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first SCP core")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..35f60b5bba6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -166,7 +166,7 @@ reserved_memory: reserved-memory {
 
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x50000000 0 0x800000>;
+			reg = <0 0x50000000 0 0x900000>;
 			no-map;
 		};
 
-- 
2.45.2

