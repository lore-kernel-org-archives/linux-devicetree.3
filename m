Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564814;
	b=aibMc/RuQ5XjISRpioTL+4vHiq6S5AT3B0CXNBaGLX2bNuWzTjBIG7+9X4R3CeEkOfVM
	 GsDQNbhM2IU0h6RIjEdqO6xMWY7TViaOiXMXFI6gt0ufm0HcdzPeISCBGJSnGz23N6Umv
	 5uulbxnmFs7Yr+VRdJo1cyH7BVa3T9KYPXLtEcHRCM8tfSSAES1a6Rm4C6HOqXHIZoiuH
	 IDXiPuhE79Cuq73E/tgFYCpVMXxG9zQ7/ycA4fKdDN+ia3oWaMdWi4qKFcdOR5Zs63CNX
	 XSJgSNO5jX/OW93IHqxfmNHXA0sMt+1EWDXORZd5o819AdCyPFNDCxWWERrxasNI/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cP9mBTTtOaaE43IcpziwZvt0RzsuA2Jb7C//CDklSMs=;
	b=1aPrxBcD2cOdTg90whmKXpVJOIW1O8s11GY78p05gmzoS0stm24wk5etG7ftmtNCcBl5
	 jfXttxDKwRIiDfglrIsPm2tLQt1+dhCtrS2DhLXDAaDyUUc9PiQWg6r3ZGW7sWuli9l21
	 gf0Oe/4F88vZXYeyN0DuJIFw42uwxE/NiE3ThR8uAXzFGi+E9siw/IBMgAQiaIeXKxt54
	 RqW51n4h4Gj6Vv13RfYBAx6OTv6o1rJA1/nXGEhxCfe8hRi194qD4aGGpUghUYzXC2aAf
	 lGAkltVT1tnIr5lSGPFVgRNlH6eFRlBmK/Nub84Y+zN+jqYXGAnnQmcXnDgAJUYVhfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu7chctB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKwLkQ7M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2918E606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2918E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qu7chctB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKwLkQ7M
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6FrSq3944893
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cP9mBTTtOaaE43IcpziwZvt0RzsuA2Jb7C//CDklSMs=; b=Qu7chctBBNJIQ0ns
	EkwPOZvZZgkrQ/URAfWzkQEeEM4sZ+df8fZ11QDylEBvRzggjKIMjZur/pbR7k0G
	cOw0Tdb4VPmzjfgbbwvnMH1EHlVGWSOmRKC8RRzWfvzv4nQ6JmMeHlpVhkTL79Ps
	K/IgL0cm9/+waJHDOsQvoWGewp7bZKyVIHkCO/yO7C8ATwOOJ3RD3D8hP0uqIbE0
	injjcvUTBV5C6diUW+wQ7AGI9oGyUiQVhPCihPuV/ZDwSJ3TT/lRw17y4ClkruPU
	+a/YrnJn6Go6uVenVyhrWHc4ZQPK2ePW4CXWpVdTJPwfwACIWa0lfjwXeuXsu0tj
	+mhOfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1fdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac76132001so421036a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564811; x=1793169611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP9mBTTtOaaE43IcpziwZvt0RzsuA2Jb7C//CDklSMs=;
        b=aKwLkQ7M1B6FYRmOMkMBm2oKc2QOJ3xOJdfv1pqUaAZ6pxZgmtiCnq7cjZKkYhhMpa
         WWE8IGSgMtllLR6miWIy8GF6bCDhep9/E8SBKzcNQ9Gsg7WwHl5l0nSWngsoj6Uj9B/4
         GMWcELwcW2rV102zeQUB4cNYVvU85tNBIBlFsYx08CTEeI8YNbhljhRSHUcSOovVkggK
         rU+uti1y4LNx7inZ2XNwbm1to/ZhlXvY2aw50Gw8d9Ib4VTOg02k1u+3f6vGCzQAK2YH
         Y2nAJ2UHe7a+Pq/fLHi+kB9FdjDDEKdvYrVS0iImrRZhhK2/62oF4kkqSCMYSOtOXeRU
         4J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564811; x=1793169611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP9mBTTtOaaE43IcpziwZvt0RzsuA2Jb7C//CDklSMs=;
        b=27P+EHHUEanQGnxL7bs6xPpAPDRDvE1D6Ny3wXv+w8mMiMJx2lLoXaqPT2POxL3PKm
         I/OAO9WZ07+J6DF+a286G+d/zOxV9hUyTidfiXeBTq2kLRTZraedQyOk0rl+rkoniMQT
         fvNs4bojfNsFWElQg4ZNhp2D6l1AWzOXD4+QhEDfYH3YRWZDY/yOb+3kj3HO0Iwm5/6f
         xTGoZZwwEYXm3ZwovYMqsxCGxJ9WaxzpQ2VWI0G7brOTr+qyOsdVTDRiKNM9momOu93s
         75f3IFPmiYA5tdFeXrsi09QQEL7C0YXrbR99psOdHDuHl/10/lVFz6TXHxFtTwojlo8Q
         7AaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1fq+vIM7NR1yOMBme+8KL2ToN55t6wpsJh1FqEIg8DdQhqVBJqG6iShVoom59Z9181RBqL9KOkCX4@vger.kernel.org
X-Gm-Message-State: AFq9FYKwi6gBo4OeDVOczTONSEw+p4xrzlDG8vaM+X6l/tbAFm3FZw+/
	yVTUiDVYKN+n2aowbThUBzmVNydmtNQdihl/fnUItv/sDmUZZnGeIPBpllZ8S0F1oFhUDLIyOXx
	tTYgDiqbTU5JLjrDrTugKHhtrqsVWyIOIH9FE6eVih6n9j2dQP3MmYhxkji+e5MKg
X-Gm-Gg: AYBFou2wqCwP6yuZUKVlNAHvdHIKWvGzx8TblzSqiDBx7GoUpG7gOqIJrQk+iypB66A
	E/oplg/8dInZHOHVZqQ7WH9mTDcczrwSZ9n8YQW6dHkrMstX9o6+o7UUs9KKdCSVd2NbLyAdiMt
	G7OcSU51PHeax5OSvw6muUnp7GC3DlShcyAldPKbhAi6rygtwtO9ihRIgOGwIiYflaJLkcegTbM
	0kDCyDpoWM6O3vaPtx41VV6z+mrG/+qAnLQuYIzxBxMX/9v2beAI1a7aswrBWtWoX29tsjzCcer
	xfHFkvdtl9eu4Pz5hwfc5karpnUqYsRUjzIqmWxHI5/WGurt1zNLqFCVU61aeqtIIvu1rOJohPL
	21FRFZdkWd8Ve8PLYUMbWt4oixmIkrhjvtfY=
X-Received: by 2002:a17:90b:1dcf:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ad86f10199mr840933a91.49.1792564810750;
        Tue, 20 Oct 2026 23:40:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ad86f10199mr840918a91.49.1792564810312;
        Tue, 20 Oct 2026 23:40:10 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:40:10 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:09:44 +0530
Subject: [PATCH net-next v3 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-2-cedd1f681102@oss.qualcomm.com>
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
In-Reply-To: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=8482;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=mJhzhF/7WA8BSFcvRLcEwOGKZ7+vE9/EnrF4/T3J3iI=;
 b=emO+9SrGjvx+wA0OFUXk9RK+aVV0cpEIu/5mK4fq9uchgmzmzu1cqCL5yIQpJp//y0uFtAufR
 wm/zk/YF+h7D6M1IbnN3vN0lRurpZ/fHgus991ibi+DCfO4MywxqxwP
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad85e4b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bDPAjwpS2HP9AAYYRpEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Hug9fll4MqMsP3arYGZu5EhV26bAGblC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX3KdW62LIFcV2
 AB0SexHLZWCKRSilYyl8l6z7KylqAcBDMLnaCE7vd4SE4GUu34yRkrR2PIweS2sFW15UCZoWkHp
 ePXQ248gdHUzx2nhqEygdnbUxYfWinSn+nXhUui/ULqr2w6YQurEo3KaXF4ZwbA9/+SPUXi9QCU
 NJ0Fe0nXWQ27MPQPnOSFrEPMg9i0LKmtlC7w6ycuRHMp5J+fcYDwSx4Z4rfTEHjtRy/GFcUFAGd
 fPtE77sRQ3zNI4WCTpnKhcoEa1nG7d9JbNdplxG4xZvmChdHPoXEzrMVvkgY2e71tXPEhoupQYg
 bL/ux9RLH1PFmwHolovv0+knNydE0i8nBZmJH6A3ETW9/xq1Mb28h5odPTj8nW0NtocPFrZt/jh
 40NyfQnmhuCPupiP9pp9vUshnUrlzSRMFNSOU16ezqVSvplebVPm6lf5P3pMLCyClRkjpbaHfIH
 VaFBKqeVw2ae4NbZ4Jg==
X-Proofpoint-GUID: Hug9fll4MqMsP3arYGZu5EhV26bAGblC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX/FoF2oduYqt5
 V3NlIjUq6BWUImin/fqAwMZWoq2dUwiRfKQpsw/izGoc+3ydHc0KOYWt2V5HCG6at1iks+Zfkjs
 DVFqE5FayalUmn2RUQddp+xvxQqfbY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

When qcom,vmid is present, require a restricted DMA pool and assign the
entire pool to both the local and remote execution environments before
requesting the DMA channels.

This ensures that BAM-DMUX mappings are within the assigned region. When
the BAM DMA controller references the same pool, its descriptor FIFOs
are covered by the assignment as well.

Track the assigned execution environments explicitly and reclaim the
pool for the local environment after DMA channels and mappings are
released during remove or probe error cleanup. Skip the reclaim and
leave the pool assigned if the remote side did not acknowledge the
power-down, since it may still access the pool.

Fail probing when restricted DMA pool support is unavailable, when the
VMID property is malformed, when memory-region does not reference a
restricted DMA pool, or when the pool is not attached to the device.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 119 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
 config QCOM_BAM_DMUX
 	tristate "Qualcomm BAM-DMUX WWAN network driver"
 	depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
+	select QCOM_SCM
 	help
 	  The BAM Data Multiplexer provides access to the network data channels
 	  of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d64371eb8d00c638a39b234ee540b83c9..fa3621224a56e34086635e1abe1220c3ae40e899 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -9,14 +9,17 @@
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/if_arp.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
+#include <linux/swiotlb.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <net/pkt_sched.h>
@@ -75,6 +78,9 @@ struct bam_dmux {
 	struct completion pc_ack_completion;
 
 	struct dma_chan *rx, *tx;
+	phys_addr_t dma_pool_base;
+	size_t dma_pool_size;
+	u64 dma_pool_perms;
 	struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
 	struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
 	spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
@@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
+{
+	struct device *dev = dmux->dev;
+	struct device_node *rmem_np;
+	struct reserved_mem *rmem;
+	struct qcom_scm_vmperm dst[2];
+	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	u32 vmid;
+	int ret;
+
+	if (!of_property_present(dev->of_node, "qcom,vmid"))
+		return 0;
+
+	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
+	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
+		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
+
+	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "qcom,vmid requires DMA_RESTRICTED_POOL\n");
+
+	rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!rmem_np)
+		return dev_err_probe(dev, -EINVAL,
+					     "qcom,vmid requires memory-region\n");
+
+	if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
+		of_node_put(rmem_np);
+		return dev_err_probe(dev, -EINVAL,
+				     "memory-region must reference a restricted DMA pool\n");
+	}
+
+	rmem = of_reserved_mem_lookup(rmem_np);
+	of_node_put(rmem_np);
+	if (!rmem)
+		return dev_err_probe(dev, -EINVAL,
+					     "Failed to look up restricted DMA pool\n");
+
+	if (!is_swiotlb_for_alloc(dev))
+		return dev_err_probe(dev, -EINVAL,
+				     "Restricted DMA pool not attached\n");
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	dst[0].vmid = QCOM_SCM_VMID_HLOS;
+	dst[0].perm = QCOM_SCM_PERM_RW;
+	dst[1].vmid = vmid;
+	dst[1].perm = QCOM_SCM_PERM_RW;
+
+	ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
+				  ARRAY_SIZE(dst));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "SCM assign restricted DMA pool failed\n");
+
+	dmux->dma_pool_base = rmem->base;
+	dmux->dma_pool_size = rmem->size;
+	/* Track the destination VMIDs explicitly for the reclaim operation. */
+	dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
+
+	return 0;
+}
+
+static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	u64 src = dmux->dma_pool_perms;
+	int ret;
+
+	if (!dmux->dma_pool_perms)
+		return;
+
+	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
+				  &hlos, 1);
+	if (ret) {
+		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
+		return;
+	}
+
+	dmux->dma_pool_perms = 0;
+}
+
+static void bam_dmux_remove(struct platform_device *pdev);
+
 static int bam_dmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -796,6 +892,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 				     "Failed to get pc-ack state\n");
 	dmux->pc_ack_mask = BIT(bit);
 
+	ret = bam_dmux_assign_dma_pool(dmux);
+	if (ret)
+		return ret;
+
 	init_waitqueue_head(&dmux->pc_wait);
 	init_completion(&dmux->pc_ack_completion);
 	complete_all(&dmux->pc_ack_completion);
@@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
 
 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
 				    &dmux->pc_state);
-	if (ret)
-		goto err_disable_pm;
+	if (ret) {
+		/* The PC IRQ may already have powered up the RX path */
+		bam_dmux_remove(pdev);
+		return ret;
+	}
 
 	/* Check if remote finished initialization before us */
 	if (dmux->pc_state) {
@@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_reclaim_dma_pool(dmux);
 	return ret;
 }
 
@@ -853,6 +957,7 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	struct bam_dmux *dmux = platform_get_drvdata(pdev);
 	struct device *dev = dmux->dev;
 	LIST_HEAD(list);
+	bool remote_suspended;
 	int i;
 
 	/* Unregister network interfaces */
@@ -872,13 +977,21 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 
 	/* Try to wait for remote side to drop power vote */
-	if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT))
+	remote_suspended = wait_event_timeout(dmux->pc_wait, !dmux->rx,
+					      BAM_DMUX_REMOTE_TIMEOUT);
+	if (!remote_suspended)
 		dev_err(dev, "Timed out waiting for remote side to suspend\n");
 
 	/* Make sure everything is cleaned up before we return */
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
+
+	/* The remote side may still access the pool if it did not suspend */
+	if (remote_suspended)
+		bam_dmux_reclaim_dma_pool(dmux);
+	else if (dmux->dma_pool_perms)
+		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {

-- 
2.34.1

