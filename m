Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472400;
	b=torO1w33xiq9jSNrMQL5yZX52sq7QNB0rdhCcnqtojMRlR3fxWwbZ53q8AWzL5yNI3H2
	 O081n1RI4kOLT3ZNLYRmWs6KNd4x/r0p7xEWwQYbeObeuBU3EkemtwL4a3KlqZlslQXzs
	 7MkEsKbNPG2CFkwiI2ixbYSmxDT03g1RlzuUl0JApfq2311oX5G+WlU9DEfSaRFZpU6EA
	 kpsHB2AmNXkPpoiodf/Bdh2Fflw2czC95NpG6hLDScCj0p7xMTr/tsHt4wIYQ/iJT8J8c
	 TuFBz2iKLZO4nQivVn1L+9+gSyk56naQxgq/3UXNUmp0Wlqv+bdVmauxZqlRMru+Fmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=CyvXYoeQvhUB5EEHJWTfMucyXD/XlAj+fM1AcYuK/Y88thw4V4Ucpbdg4NsS/bJ1bjwr
	 nFWvL+BfPZlJI4FErA0jVDQMGaYqiaviXrb96RUnoMq+j6KObvG2X+Gw+HNaodQXhZ7cN
	 QAGnv193CJjVQb6FVXrUoLxzGmrldalPIEav3zzp/0JGcYJUrAaNcPpGOhwEJRDP4McuV
	 2DNzIhu/PWABOEGuSNW7tjfiIrZ/DtLrAnxFQRkP27RcjMVzq6fMLTDiv2LOY9AwV2DbI
	 68kBsGcNsT3ji66gtwYg/ExYGkoTW/vCBil2UU48Et+5aGA2dq6ZVBDff+V/ecWVFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=deHAO5QJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C9606A885
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0C9606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=deHAO5QJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQsk4092470
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=mS57UF3tUgxFrlxj
	xB1z4moWrZ/cepUsWIaj9Xw4c6DddzWGrWZ5DN3zr0NQZUhDRUr22twDmG1EZFY1
	LeTcCeOKTsdTpFAU7H14mr/i1GzX+0G6dUcQIPT+XI2ROlQcZLiZ9uC+hg1x2RMZ
	RwSgCOMRN2cPqipFt0gpaknCXNO8ErZ0g8xpNrGrWzumyQMTrsU7/SleTwJomSSv
	q2KeSy5KdoAOg2B3QjmkcAP6W5+52pQlX6chy3AOiMSiJs0lpUJ1ppqzz1XjOyPF
	zbTI59XXvaL9zAs7VaqRL2EWi/HPBSyfcBzTbDMs15Y0/NZTBuEcJ5eo/WZnMcN4
	bsnKag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2336732a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472399; x=1795077199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=deHAO5QJdC7izzzDIrwzT1rO5HAJPJDzT2o7VL41v/IZ/CcOGLssP0CvZkMUmEDPFw
         ZegcWUOo0n/y+cumHkgVn6YYqUeuW7QQMfqblCD9uUWgy7R4kAZ2qhSNypfhecKZ6Qb3
         +hZQ3xCZTnAl2AVADlXr0d4RHKnTiU6Ck6AtvBHW4LRC6qMMU4HvUwq33WmZly87wxVf
         +Z6ytCMH/zIEQW04OGLhqoXtjl2WZUh1AP5RHfSZ86hLdUKVaZCXy9Ro2E7mMOU9vX7P
         3du4QclaoEJcT/lDy2WNS90xDGWZQGDDgU5/2C44cq63NPyHBAXY7K2un+vMbHLqHzXa
         SG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472399; x=1795077199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=JlmlMz4u4k1K5oSXzb+vgRHzpa451x4/eg8OAk5X/0Ho24C/5wl6tuoa7ZRmEZOYDZ
         Ng56mIEZM3N4xR80519aQHx2Jm4Q5gugyTcvz5sXDaqqMUXVnrVK8H4GeRutQB1iJiV5
         RquQwAThUhqKFmPB7CD3oHr3fxtiVaYyt5VE2MEGP/cuUr+pB3Q4FyWhdsz6gFgfTX8a
         vshlpAno64j2+VhdJJ41DPjv9imK+MQBmNSUNqd3g1OnXRWxDv2Nqu96CUE3sjO9KThY
         J2FBOlbYjqmXQaoad9rbyjqaFW/DtucaLq3Xu9G10p+hGCykTds0+deTKB3cFOhsM9Gk
         9nOA==
X-Forwarded-Encrypted: i=1; AL+hErElfQ6kjT7Ai9MmgLttDZ1LHH6DQvLyj49CsuFFA/uyHPcad9Lw/g1Y1mSXvIKi2AbR80hNUDzim5cy@vger.kernel.org
X-Gm-Message-State: APuU4Z8O10ieTJla42oKfGV2pBwMbHR1GAS7WrL9YtW5Ezs+7iSjQkI7
	8ufsrDfmR1yponkQk8xOJt8T730xe3IgvC+U3vlU5IB/NfYSkg+ALRnUL7EMuetDsybtHYgQijf
	SyTS5SmctCrURH8YbiqaSl8RotZ8casZWnpwfPvc22DKqaFuxWRbgSEnRF1BD6ceX
X-Gm-Gg: AYBFou2ChO7kPEKRVDoTZCs/z0nOtjWQ2vXl/MQ4thuNxNZN3GLJY91OTS85o0X+1Xl
	+L6OMez20aQ2TBbbUByjJAtln21nhKniy8tR0JEWDhCSrv4YS+KENPUmH4umEzAzWeBIRmYd0pM
	mS6NL3ivp3NANwGZ9zfFOR7x43r9Zj0EzzUk/mmqsib9e6OkX2RX0GOS2Mmpi99SDYkuvxyU043
	GOHjF2xuYIxsnjDFkBOlVGQNgVNWTpBbhdD4bazuzH0TICgZ0Yt57n6yslo0LCScd+T4QUf3l/8
	td3v231YFKaXvQYbSpmbNCuLZ5e0aeBiHJmAsQ7AnzG+9Sz5jVK2yFKK5R3S0ReQ8huplGU8SpI
	UzVrN8S1ajXWneFq79uB+dZTtYURo2PcfnU+VoChV/4X46/ipT3VWZbCT6EC8A6QilUv1uqwaVm
	662M3DZVg4L1QDlnkaIusXkT7/9VBXVXb0IKhkCV3OMdrLpRasit63pa0dPu3nsMSz3zyPsTrDS
	w==
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885542a91.7.1794472398783;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885514a91.7.1794472398263;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:24 +0530
Subject: [PATCH ath-next 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-10-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX7VX13XYo8TOb
 EsJHm8BH74b9Ew9LRPSb6MngPjdYUNdPqNdPq4I8TeOpHjt0beg9xvvhSalqQY6liGaJLuhY+7g
 y3KkAJEVFyAlGQvYxohdCKZL2pzDOYo=
X-Proofpoint-GUID: uDH0mnHE1yPFgDkhGveD6Q-BB3TD_eSR
X-Proofpoint-ORIG-GUID: uDH0mnHE1yPFgDkhGveD6Q-BB3TD_eSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxfdBNCI2pJTb
 3bnf2M73VC6e//vN5algWX7aQspWB87BTpEvFPIglyTyk/qy688Fdlp2ud02vQVT3pHqKaTVvDi
 XDauIf9SZp9FZT+d4mrYDub/9138yDleG03BjbukS7XEO08+N6kPm2inbikXqHlLqh/Z018JWZ3
 qRHwSeW9D/sZWWqozmmhDN4tj8cuK1S7rDChF5xXPe04kL/HHM/dq62P8ExA/pYqapzx3zUo2um
 Pg3ql3UNiSLlJuS9Qu5QhuSOX5sWn0NmC4K7WepX6RyEEnXVOearXrLHlYiiHk1FQ3nmF4Y7i80
 zpWkhKH+ONql3iDASPz95kZvcPrgzPgPvjSsMuEL9a5/9uv6JPD9JjtJX81vhrC7vMwQ1fxe+gN
 XtNe85uwVimjUpPMTNihrvCWf4d6ONuf9ztALauJCLFZt03t3Uvph8hZ168XNfMz3UX9GeWlUIJ
 XXocuV7QB1FfzTUA7/w==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

