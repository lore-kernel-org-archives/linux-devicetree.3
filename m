Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96A3FF1;
	Fri, 29 May 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049121; cv=none; b=q4iFfG+yY/LLLc/6ng9egPA9vXDVjcgHi/O1nLxRPyBcSp8CZ5fADESlPvvBpT/Qd2R8SpfkrKnTZBsIDGxXJ3Cen43RuxJ1AluuhcwobQBqitJdjJThxpb7Ev37j1BB6F7vS90hVLbOaq2b8FS1uP2KsCwDlNHBT5SgOKATWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049121; c=relaxed/simple;
	bh=zPggXzwyaNDkCsbcmPGZgNvIpCqXTUySf7RDD+tIbts=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YCRwnzeZDiDVoB7votpjBVce18ABYn4NGrJrXfjyv1gXjUBENjtxgJkvDQtV4SS/1Rykmo6QwGv/1KBG7w8iah4ucKdHpeJxUKWt2TEY8QEIeHYqSkD5OMhV0mjFfwFLhaPPUhohiA4yEoL5IzbHfiUOV0+drs44ITGJ+SW6/NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iHkS0ZZ2; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iHkS0ZZ2"
X-UUID: e4d8af365b4511f18dc8c9802ae25ab1-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=grTfbH+yr4nSKi/vyDecz1/pxBsKxMZRoYqkCFPR46I=;
	b=iHkS0ZZ2j9AmhspJo2ab7XExlSSeGtdBhriqUx4CKQ+QKx/NhQi8vsAwlFK9igBPIMDo950b44fvU5WyYsbuTlCuozudUF3day23SJIoWLF8Z3PgzJFrtYoI+GvTpEOMiwACJEThAaOuoYWEbfBx7A+ArThBXJUzTMiyLxrAH4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:f829aab8-4828-4f3d-b4a1-411d15e08a1b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:57f291c9-9273-4096-a0ce-fc7a6a4f85f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4d8af365b4511f18dc8c9802ae25ab1-20260529
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 487376451; Fri, 29 May 2026 18:05:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:05:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:05:16 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 0/1] arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping
Date: Fri, 29 May 2026 18:05:07 +0800
Message-ID: <20260529100514.52082-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

update new cci-opp table

Mark Tseng (1):
  arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

-- 
2.45.2

