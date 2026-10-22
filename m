Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659538;
	b=cX7o3X/Rx91AWyjOcyUXjR9NifrW97S6YIzzMlPHuzcbKaIHd1hFGmVhzqlL1HNn9qgl
	 Pf3mUNLs3b6z49sAdZggjcHZAFLtelIdJRVAl8u6b/WjPkxQLQpcLymH1rt//nAEv5uYs
	 xbL/UYsl14Is479i1hcGIsWfLO3Wrg9c1gOyu9go24cPFZJN6wOvX2oyIcDMVtXzfdtvh
	 cJzDytOrKk5/BtHpu9Mc60YKbQCTcXNpTYWn2Zyc+SPGI3+gzlstlRBhJWI5CFAVtoodz
	 GX1dzg8k2E5i0AIhMJiVVyklperwl8eqV2b/oDdiF4/rpK7jcP6oc+p2JkGTXXwzk2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659538;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=ytAPM9y1CIH6yDKXPJOIKHUT5JjG90HVhV6QaIOwpZA=;
	b=5jbyHoeGUzI5ct7a4QjCKp6MrHxpnEHWRg/ZNOSiNLxvLsafj5VRGhHCTyyxvbVfAMDg
	 CiY77otsA1Fqepnv8Uz6vCrXoRhKBC6uAT1dDZthAJNKNcsdYiCd2TcGU5yrofh6x+ysU
	 3AStqQJ12oMdzdCF323uCvW262d/8084wqWs3wei1BwVXnzDPzSEe7Gn5QAhxsHTp5f0x
	 3NCRT5hPT5qoj+QEJTr+NQgqExzUctwjYVZK0FDCwpB0yi6mD6kC3bnVwq9kAZ8Xjyt01
	 bUhzUPsSCZi+p5QloFXzew267WGXMLnkMOyhxf4ro6oyZ10lOV/S/4XGzhNyJYVwaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DYm+47g9;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2971606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2971606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DYm+47g9
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022085854euoutp02122cedafc62d40b13fbaf22fb294f0da~gzlkwsOw22829528295euoutp02Z
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:58:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022085854euoutp02122cedafc62d40b13fbaf22fb294f0da~gzlkwsOw22829528295euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792659534;
	bh=ytAPM9y1CIH6yDKXPJOIKHUT5JjG90HVhV6QaIOwpZA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DYm+47g9DsDETL+FhGLFw3NW7kAlwz8apTEl9+bGvJvMZBFbmrqC5vrNOKgPIP/El
	 7szmisKTI0M1A0itVtWye9bINCHl5Z7sZCCS3z6Ef7Sk4MY6EDXmJfUKM2X9+zb4gm
	 f7+AiV2RejC+vCTCgZLh5zNhy41C9DvmLmhwMLOs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97~gzlkeZ2-41811318113eucas1p1U;
	Thu, 22 Oct 2026 08:58:53 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022085853eusmtip22f10b685962fdaf49e7f0a2128385306~gzljwo2IO0965409654eusmtip2O;
	Thu, 22 Oct 2026 08:58:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa
	<abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Roger Shimizu
	<rosh@debian.org>, Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
Date: Thu, 22 Oct 2026 10:58:43 +0200
Message-ID: <20261022085844.768508-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97
X-EPHeader: CA
X-CMS-RootMailID: 20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>

The board dts deletes the wlan_fw_mem reserved-memory node inherited from
kodiak.dtsi, because RUBIK Pi 3 has no WPSS and uses an external WLAN
chip. However the firmware still keeps the 0x80c00000-0x817fffff carve-out
protected. Linux treats that range as ordinary System RAM and the first
access to any page from it triggers a synchronous external abort.

This has been observed when the dynamically placed adsp-rpc-remote-heap
CMA pool ended up at 0x80c00000 and the remaining 4 MiB of the carve-out
was given to the page allocator. The first allocation from that part
(a qcom_tzmem pool page at 0x81400000, allocated during fastrpc probe)
faulted on the initial memset:

  Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
  pc : __pi_memset_generic+0x16c/0x188
  lr : dma_direct_alloc+0x190/0x434
  Call trace:
   __pi_memset_generic+0x16c/0x188 (P)
   dma_alloc_attrs+0xac/0x1ec
   qcom_tzmem_pool_add_memory+0x90/0x1b4
   qcom_tzmem_alloc+0xd4/0x1a0
   qcom_scm_assign_mem+0x74/0x18c
   fastrpc_init_reserved_mem+0xd8/0xe0 [fastrpc]
   fastrpc_rpmsg_probe+0x17c/0x3d4 [fastrpc]

Keep the wlan_fw_mem reserved region, so it is never used by Linux.
With this change the adsp-rpc-remote-heap pool is placed at 0x83800000
and the board boots without the abort.

Fixes: f055a39f6874 ("arm64: dts: qcom: Add qcs6490-rubikpi3 board dts")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The issue was analyzed and the patch has been prepared with LLM
assistance. The change was then tested on the real RUBIK Pi 3 board. LLM
suggests that Radxa Dragon Q6A, Vicharak Axon Mini and Thundercomm
minipc-g1iot might be also affected by this bug.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index c98e910ee398..843c90ddb4bb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -31,7 +31,6 @@
 /delete-node/ &video_mem;
 /delete-node/ &wifi;
 /delete-node/ &wlan_ce_mem;
-/delete-node/ &wlan_fw_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
-- 
2.43.0

