Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875372;
	b=R/JD8I+bLnxs0dUXCAsrvDzO4x81tkppcU3pm7GK6oVx644pNl9LMWi3n9oRcsMF7kLk
	 /Jfm6q3KdaCijvuRkrT3WxsdZBjixNKryJhiinC3DeG5gDXH3wsqrIiaMK872rP/NAgui
	 GggzKZDhvPEcPXySr5lAAU7tFmxVX7mSE/hsZRQgioIl19TlsfQfPG17BR9FqfhBH0Vi+
	 gsj9+BghHAHKIPfPuNEJDw3LOMlGGeL12436cbRHZKhDEPGRDUDs49T5RlQZlEWHKUsTN
	 F7rQ4ZMJiPe1fcxGWp3elMqYhN5vfS0epAxCjr/Ng/rzQsgS0+LFfufPi0CqB3k+3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
	b=R5Fgv9wU2tO4E78aOTr0AZv80AHFs+JnqDkVFgmrxYOw/R5YIJ5OnSCe/e8K4mRib9fF
	 +DOsOCCvhPcADuXClPEm8kyB1N7yp9CCJypBwY69g/Sx3iwLpzlJUUb3fpzerZVa/bmyc
	 D9XHfGi6vgay8l8tfirH0tS6pLZCo9acquwlZfzS/wiRL/DEtx4WX0PsPGDKes8qAMMQj
	 NjIZMStUAaZl79PlK1H7Xsp8Ff+QBB+BOhD5EnLmpwvwM3iD8cd+kkAa1+E3NIBSqYe1L
	 Xdjpfxz2Wbnm23pXCfv49Fr1faIWC2ja2FRfy7I/hHVOEtZWuWewtWo7croOkD13MBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmmA4rRc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGScrvIu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34685606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34685606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmmA4rRc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGScrvIu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tQoQ433387
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=; b=gmmA4rRcqTYZZRXP
	KAE7kcQpnSrf6xCfhN75YCvS/tSECBrdo6rY6Bscw7TJahK/NfkAosyscgULmWtD
	D+qqrA4+1se8FksHQDx77tjOxAfhWR0EF0/t5eOUeNB2jLM9peIu8Z16ROMCI+0P
	dDFgHZxFBUwC5hXe8+KYooz8o5FML1RhtiTaIr2n+MlfAbSEaP7/Nrp+i+5Ivi5k
	wj0FBUa88PgBvvo/Hhgfidj4X6JivxzfhU0rI8JkcAhXxWMjnKWX8Wq/03lQ8EOf
	cprI9JkUoEeO//2gXHZceY6bVr5O1XMXqDAnMxmZU7epbIhuQ715NNFq1CBO5STI
	OzK/bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd91vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:42:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb4c49e52fso1576509a12.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875370; x=1794480170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
        b=LGScrvIuV5hmEewC8WAs4PXpptWkFN0fSvDhxlP3CabjQAL3MbYBqruG0H9147UJIt
         9BhUEXoylYupxX9oVgkbfBlmdMRpHYYadK8Jmhyq6W03I81K+4u8Bt0Y0Sdl5Wl+jKkY
         SO6ftPZXWe2wMFW2ME9tuuzV1E5nxms22YYwHNbkt4YoNCDcmVxH8AkzmOxbR61OPH9v
         wPvdI1Ru5B8YUBqihxAdRMHvfr8eKRTiOt3+3eLz9Csr8WJH49HCdG+iC147iD6giHV4
         tqYYwSRfyeZpx1LG+5GURy2BmqlgXlwQaBeUsQWH6483AIaqaaqps670bR2L+RUZVjxQ
         wwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875370; x=1794480170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
        b=vLD1OV/LQjHCYdeILpzpUw2kCsmN68g9J4dDDBZkkUq5WEh7o1heuXOhJBe8B3747o
         cDSBvWur/J8AKNoTSP4+zl/YogQIMVOEHtZtSuWLoyuTpY8HZUZ5H44RBixRy1kBh3u+
         pNJcqJfFfOzpVPrK1GcPkpqol6eWar99VUco21P9GQ3wXU9+a+FqH8a9AUT8jof+TVy+
         v23Pw2pZJsvHDWILcQinvWW/3tDxXMwH1cEfk5t8lLDRr1BXjDBnoh7Eq1eU8pVLatqE
         uQzCa6lKcot26sH+4iVPHIJiWW1k3rswGKukbWXkFQGz8XG4gL2VdxHysluzIy8YSzDI
         YLdA==
X-Forwarded-Encrypted: i=1; AKwUvBypCnaKbxe9QK0rFbW187ZiffmqAnZvlYs0603pkyWidtAYvMKDv2SgpSIMdddO/jXdXoyHZxvLhH1k@vger.kernel.org
X-Gm-Message-State: APuU4Z+Znx6iYZhc65Yo6qVV4pwa75fXd6jMDI6BtmrOWbqkKwDUqC93
	m4IHd3bBEjnIIl1Oh0+ThiSD+xMz5H8sl7hKpAWzVMySC7I8+7pBxve5VfntgSy0ZVVe1Zini9P
	KCohWi65VC6OuC7vgRBnalGHoTSYnDHTBIr75wvCma3YnCEYTMTHox2aDVUbJEAJt
X-Gm-Gg: AYBFou1fCTagKQG7ccUtRleDQD8anyi2lz/InNw306ClAsCr3WMcyhe+8W60Ravhs+D
	AZadQ5R9YTD64N77WwmoVP6ORmrFnnY9DsNOB/qa+dfvruKs6+wFwCMYWV7Qi+hvyntZBTfzcE6
	fvJFBmTwuFBWl66S2eT9Ao6MpAXtUjUX88IBaqgeCo2+/9s1P7Q6+MRFL08w1SHvs/02cEeBI44
	iGdppLowIoNwbdgG00KBf7fio20LhXE6sV5tw9mBvxkAAxf7y8863Zl2wiK++kuWBI99a5dJ9ai
	SU047mZY6dcH4DkHwL653Q4DlJYd1DmLYn6Ve9mBpqz3J/Nxz/XplD2F5aJiJdcsEnp2qlX03ng
	D34QQKTrfEFPC0J3M+LU4drJkzCXsciXm7kGdGla46bwoRq6aZ1yHR8B4uvdkoFiICMChE/y9Mz
	Nu4RTcj1h/1A==
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr16039441a91.23.1793875369483;
        Thu, 05 Nov 2026 02:42:49 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr16039424a91.23.1793875369020;
        Thu, 05 Nov 2026 02:42:49 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm3266934a91.5.2026.11.05.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:42:48 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:12:29 +0530
Subject: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
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
Message-Id: <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793875351; l=7551;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=IwKdeVjuVqMKg5GO+i5bhV5v878wKPagYiYrOofdEGw=;
 b=OyeDzxszz5ZTuNqW8QaIHHPPP0DTRodfYN1eSiif3X04h14g0IjCwyJfIrEVwnyIUNtEXe22m
 tn2aah6bSMWAL199Pp6SfmyBP5rxBVN2TwarkfRWMlR8+H+6esBy1Sv
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec5daa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_LqUGthVNh1NuqRdQHsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: uigkHQ4tBo51asf5xfpDq-EE2gJcNrZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfXwbSB/e4BU7RS
 zzwaQ2P0Di0U0LQSZiI9FVdrFQLP/fA/dA/v8KwNG56qFfIrIyKtxpf5tn8e5HpWNHNVYehEmN6
 MYc/Mjc8kT4WnJkbrDv32fw9ERVuRWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX6hCHOsneoVaV
 ictb2cFnhxjc8MioXTcYOWgkm+WLqYCFVBSlZkQUEK+slljdecxzCCX1/Qt66jFEQF6TPDLF9U5
 GqlZUDKh/7b0OpBYGF+QmsGkFx7JKvdZQWckN3QyrtktmSO6AoDBlamRhfiQ+ArfAvIdRzvG1mQ
 Zoq1MeX4s6rYfjqMAgsqiCV5jDkmCVfwhltYn7Ghr26i8hVv139rMCS9eAu2rvuUj+mtNyZ3T+2
 YCZqex1+cwoxrY67V8Qn0Pq/O8EaICIRRZfg7FE1v5d9d3Jj9qYuW8U9JxLZOI+ST2Qd6x4ZP61
 LqTkxsTC/GX0Mz1h1cF3Ahb/Go80MNyWYQ4Wo647gpbDGkXoHk4RvwZXCgNa0bkFAFQwiGNNPKB
 m1oed110nuKdhQYzqSQRAGCZWAl2/Wzz6nrr72p+cPl4E4OwVKD/ltashuI8gVDhSz2cxu/go8A
 qO38YsBFcx+21owOdHg==
X-Proofpoint-ORIG-GUID: uigkHQ4tBo51asf5xfpDq-EE2gJcNrZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050042

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
leave the pool assigned if the remote side still holds its power vote,
since it may still access the pool.

Fail probing when restricted DMA pool support is unavailable, when the
VMID property is malformed, when memory-region is missing, or when the
restricted DMA pool is not attached to the device.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 2 deletions(-)

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
index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f296ee13c0c31c9b 100644
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
@@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
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
@@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 				     "Failed to get pc-ack state\n");
 	dmux->pc_ack_mask = BIT(bit);
 
+	ret = bam_dmux_assign_dma_pool(dmux);
+	if (ret)
+		return ret;
+
 	init_waitqueue_head(&dmux->pc_wait);
 	init_completion(&dmux->pc_ack_completion);
 	complete_all(&dmux->pc_ack_completion);
@@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
 
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
@@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_reclaim_dma_pool(dmux);
 	return ret;
 }
 
@@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
+
+	/* The remote side may still access the pool if it holds its power vote */
+	if (!dmux->pc_state)
+		bam_dmux_reclaim_dma_pool(dmux);
+	else if (dmux->dma_pool_perms)
+		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {

-- 
2.34.1

