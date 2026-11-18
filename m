Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989785;
	b=1UdSkebMZnkz+ilkXm8i+rhOEm586elfg0dz85poBTzUvtzdkPvi1N+/swq5IUsW3XTM
	 u1BWuh4ypHCNpmf2FXVYTmWfPl0PCco+GI8Ct1RJYtsiObVfSUhza3OChVd3VQbBSbOr4
	 nOAZ83AlgPjWO5JPh8+Nv4bzdRzsBFIZrs1d05iRyOsPedmPA3YgHuOx+CekLi/FE06kA
	 hrez1hVZouytSSFt0LI+cELx2pdWPDPO57cT5U9KJ1haSAWcFQf3qvddBA4AXETNnircz
	 mzrDHn4/EIvvIxfTNvCD6yhd5JtEqIszRe4kvf1UJ1N36dswj5mDe/cuJhf6KsZylzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=nCUw7cqgN7TT6QGKFduKA9fPsbACX8Fy/xRvafm91qLkjaKU6mkDBZO08xJm5vODPLgx
	 Z5i2IDS7Vemkf/mPL2fko8OKUlesBUZigHgBtOIDRRzwl82CAHMmGz2Rnpd+1t6v8IvL5
	 hfpRb3Az62a4xX68nrwpqUOl8nXpNJzzkgohPBMf/YYXdTo9yyF8MrAvnOIvLVYXP9Kyu
	 RgQiKMqGcS6hOFpoV1NHcyEa6Sibc084pf5XRAhAYbUbgHJbTjnmRkV6h+6mjAOFXMpsb
	 Wk50YjIW1ClGxqqKRd05tPZF8Ww5qm82GjbGN8xx76pfgLxlhhcV5XUMe6tXTTy44Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F400606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F400606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VJRL764899
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=DzCboT7Dhn4gGb+i
	TKOVZRY4KjDy1mBZpGu3EEkyjoEsvlCkOvJksE4Rjgq5yUOJHiEDO7cUGcbMcdLU
	YDu7rJfTvsgwFBD+IipYzt4X3XhRNfgcjPC8e0JXIBpU3v3Bt/EaLN3/xHOAE4t2
	gAA0sk8RB8umQ+qZ3mJHt0gWfYHl8Ni8EfHuyj54kpTTcPvkwoa+TcrleTNl31Ai
	IQ0Z2Fs3XXOqRhEupUNC7Wd4mv7jdt7xfwIiEcp6rot7Xu5oP6jwJY7cc/k/H2I3
	MpkVyI8B1Zm/PnkPp3UXkoY0JUzHfS6zhWd+zMNsVy067//RjR2PTXXXd9SIXHo4
	TDcMVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvba0d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so767003a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989784; x=1795594584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=ZqhfalMRIVW9zVTEZ5bAp2qwag2BL1ME8zRXHJ7pl3oShz5HizaCfg1/DVt77l6s0q
         9zm8fWVxQM4z+rpixI01305IxCoXSZPj1I60CQXLWuOJ7lJfmTO4FteXzWKSM1IdzRg3
         NJbZsePll4JGgDD0KMyZkc3m5PE8UL25dHXC/kZTm2RKZGWy4/+bouen9jpnpEsluvyt
         TbxRyrhHVFef6IwsiuVSMPsHh76ni5z3qctlKZvrXsybhHM332aVG4BjHHGDuLD+nFew
         vT7UR/JCVDHet/rOztERk/Y1r3bYDvGyOsP57RWSUsyxZqZAe2BF1rH2fciaBax8wf07
         FYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989784; x=1795594584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=RU+1RiaxFf1S93qN2tiGjc0PehhRFvzttiD1DXmXcKrQxV/FBiipfDItxGUHkn/rTR
         UruseAVOlcIZ9rW32A4y9aid1LkPO9xeyT/7oyQhizhIee6GgPTliYVmp2l6FBy2w6d8
         1H0ezz8StXkQVQxR6VuX3D9P9Z09I75JPqY3IBTXUZID5dv0CaldML/YIuFaSo08MmdZ
         8+pg9BLjIX7ZCWSR1BgKb2EWXSpu8Ga8HLv5ZbVf7pA6iFzMv2BUB6fyDpUCdjWpCXNV
         aSfjfzNKQf69Ya2YbjS0OwuwtpYChVvGgTGjQg2sKYpOaYyI5FuzY5/8qj3yPb1/01rY
         sxGA==
X-Forwarded-Encrypted: i=1; AL+hErHfqSifwmbrs6jnhECAmp38nIUbLX+PAXZnigXYcE925jOIvXZ0IkCebwnpc0cmVVRfKNYXTbTVu+gi@vger.kernel.org
X-Gm-Message-State: APuU4Z80aNZcWEeQEJxhA9+v+OfyZ02Zi00m6daW3Zn4RZrTQ1PaC8er
	DGTpua60kQo8qKX4KVKfXw0NZvAW+vIYrQDs5Um7bmqUlkQhcNct6FjHBg4EE+1B0YOxw1+N6/v
	E9c/nFT67Ezn8R/6wujT626f/44FvWzXWq/dn1V1pBaKdCXz/eVwbzYTHXiOIXTBMh0M/06Z9
X-Gm-Gg: AZFdTZfdgI5d9ppKe6eo7CTTjyWYVYri6u3geLrwu1Stc2t/hvgyoUSOLBXWmNvUAvK
	Tx9uCKXqYO1Sf65KTLTp8G83xc3TzQCuIAALyprnK//efbrbzUlDOCjnIJI1oWvQvUNQqQW3Lt0
	4ijllbZCq+tIepU8w0z9Ltq3n381FWpx/smzgixltjgu28ZgkC6TbRxM14JvnLPv9DA5ihmcktX
	lIu/kpI2ojXAAkT+csfKGeVq/C6yDAFSzHktf29PBMcMDk5flC3BbbVJYpraFw7jrmZMmxhQpsc
	cXIxJK6Pq6GIn0aV+o4fNntXR9weTu1Vrli6l86ynAT+ItoqyPKnzjscHku25lkFp8ZUlarjb2G
	Y37PUlCLujegQKi33tNnoqPeFwHW3EGkshfRpoD83oH65Scf6/sqB//Po66wTLQTTJ21oX6+SPN
	WA9fFcVGcuUXytXUaLS1zY+UOY3qwc2bKqTnFxiXY/EV+x2H0Y1G5pQsqeqn7CLGTKlpCvX41Hf
	A==
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897029a91.60.1794989783727;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897016a91.60.1794989783284;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:33 +0530
Subject: [PATCH ath-next v3 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-10-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: xFPlBuufBqmvclKONtvC0Mhebeejou4J
X-Proofpoint-ORIG-GUID: xFPlBuufBqmvclKONtvC0Mhebeejou4J
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd5ed8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6MO9CV4i6nO2
 ZPp8fyxjphODjVg9DwsNXxI4jzDPRnMgFkwNUQVhzbbIun/nF2DSKRZYodopRFvwDYq21N0bpWG
 a4WSMQgTqXMCJhMCTkvGvbaYysGeObA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX9stEkaW1pe4v
 ZWfvfu0oWlC7GhTl81nMYTMAmbhDaxrRLUub4O1Hw2oocJy/J1dmiUK/d2A/kK4YwkSCd1pU3B+
 xf1A0TsVGQMIMsGfN6TRluGmwIr2tZoZIuq2MH/MfpeN8jx3G60LL2VO13MfK+Mb8aa0pWp9n8L
 p4hTNvZWsB8RDHu75s4Fd/oL0W3kcBQawWQBQpXDdOxB7MO5fxaiaMJOz5tgi4JnnsFS0M3qDj0
 +gx+S5KkNiiBCoRwIYh2bmHzvbFjAGrTHYjZJ1LUD413AupHb+t28VCj9rhpk4RbedbEB3Iw/yS
 26qV5QGPI4ZVYKTlT7hAnEEdx+eU1Y+WULpSybrDq1c3AKtNi9r3zzKAKJRuCYGuOxeGhbuU+IB
 jNOJ3iGPCkR7ja4s2jfxphQ7rQKN66B4QbAEN3dAzRTEnXEHGJzlxfLR9O3u36W1KXdnwZfgTop
 m6v/fMIDbFpaBA1s2CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1

