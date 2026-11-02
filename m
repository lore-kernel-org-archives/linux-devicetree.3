Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616156;
	b=whjnCJXrHPLbc33MNfOdeRmree9gPX3S5p4tR1wijadOjyx8MO0OFgGJ9DZqKDHCfE9e
	 u17nI8JVb08QwKipneT1YF9gw6Fofv9tl2AMHb6TaZjfZxXAlyY6gM75VabHnaWL2tuKa
	 lVo+iySfdUjZm+GftaDD2exsLLDQWx4l8S3o1lmolWUgq8XrE3pawM7/8HfmVL2vTuuJ3
	 l/q8OGLDdNZFziJ72H6XhWFJHtUTtU/4dSxj+h8LgMDToASdAky4L34OK+N2D4P49S8t3
	 l1ol/7TeRZc/vFdZjpjMMcPUCG+trJDyFJ/oeJ92h0zTIcxm1b/HoYvdqm8wfHrdvdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vHCQVVO15FdmBnnp9I/9kVXmayxMC8obtPYEQilEqwk=;
	b=gknhHoa/ggqx4wLOq2eqGDpkJ3M0YaYeK79Qrx7LQfK4Cpua0zt+BWkxXBbXP7kRY7tW
	 K/M2N/kl3iFioHhl10tYuDw7tTdSfV/eZeJ4dTUerfMhaGDwZ/GzQmgVEt8fRW+RH1UUD
	 VB/WW7Cbfij3hfxWaoLlDT6OdgcmpXkB/jJjwkKa0ydEVjAxAPPigiIglroV8JkFQzjQc
	 41LI4SwQjs5GZSpL4luf1NGLZeKRTlAuRSxar1WzbRIGnx9NHrrCIq1JZkRY+PxGwJOkJ
	 YZKWBqRANS7hfU+R1f3Qjf1Bov+wY2NGKcOtiKOpCPcNoGbl71NiewUbgMXymrmiSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A7aq7iaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ejHcMJdp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4C60A2612
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA4C60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A7aq7iaB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ejHcMJdp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6hr214014
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHCQVVO15FdmBnnp9I/9kVXmayxMC8obtPYEQilEqwk=; b=A7aq7iaBNJN23x0K
	XuISF+M24IDuLOpXEMy/YhGptdlBDVA/AA3cjet1ZubjhwLdC2nYQrmGJ5r15Uj0
	gV+9FaBGfoeQv2RkBQvqaJKKFQIFqjDsoFvPCAcJ+En0cHiQFGXZKTm4sVHWwl5i
	q42WiGeYqsnYvFJPBD2OYxj8S0WNBEh8DeTzp2GfyJPcGe9jJdzjUl8SCLhYexNz
	Uj9vhYl8bovxNKZFll4ECByxZKN73xJzkkCFUO8fU7LEYZR8CgQh24K+Wg4ddw7K
	lbuMKFsVY7JM7Ba6tUwOZAn3kb/7pR0hAAZ3xgR5VahmsR+JAKxvyD6Qxs0Wn17F
	vtXXRQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s6fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:35 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f9b643ae53so2507996b6e.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616154; x=1794220954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHCQVVO15FdmBnnp9I/9kVXmayxMC8obtPYEQilEqwk=;
        b=ejHcMJdp4/wylOmo82EYmR6OLjR+94FkCt6eTFqMXsZxUE56pttxOF8CFc/DL+qxpk
         JX5Xr81eTRSEcPqJJ/YC2UuIqLKJYiD4kffmwkrZWQyouSfS8Nsf0k82MmV4v4NBNIkf
         lWYVsQYDJf0mu42P3wSNz1SjbtoaZgKtWhbwLFG8tfe0wacGXQQiNO/hjBq8nmFzqHG7
         JnKEmkRhLtRKFxAnTMAbbvnkeBPDJw4NcPi74wojmbJgGKZ+rP1So/xLxJGMK7gdgmQJ
         +fNl06VkxkzVizdCJQ0KbfWC2fsjgX9yXThObskrxZvm2PuSMfh9ruE92mB316vMhVAP
         GFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616154; x=1794220954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHCQVVO15FdmBnnp9I/9kVXmayxMC8obtPYEQilEqwk=;
        b=k21+WMZjGcb0I/xQsxUK/GmI0xjBKQjAiD9ucx4TdolPc12ppEs8WmsUQHEWCGuZ2t
         HgWgkH/1NppVLdV7dmQOpjNUePbW2XaG7l+8YSyCb9HH8pLS8iTqXGMrNiwKo3gBHpW0
         OOgADyjZTQcT0nx5Xi3nbNK1ZXufba6JtiGP2PRFb10HJeOZWVWZMULn4lUXN4f+qoEZ
         Sqmy98rqnbtnxUzds3XDPZneRegKSWLTn9/+/bcTbiNhaql0djLJrXNgswFVs2/IVifB
         NqaGWUqKN5YvxM38bvYCEUZ3yhItMoK0g8tw5PZN+gDUxahk+GjFrJtLO+1/UyWAi5ux
         Unnw==
X-Forwarded-Encrypted: i=1; AKwUvBwIbtY+YrtJRsN2ekeyiaSU/VUYE/UzKRtg1rA0xWosMl/bqJNncFSUveCljsXjO7Lh+jnq19qmxR+M@vger.kernel.org
X-Gm-Message-State: AFq9FYIC+cZmx3nz3LvAEidfzdWM+LoFvNdwP8QnByYkSml0PcuvVFA2
	k/HSKo0CRWzQopCWixc7dyDVwd1+BZuKnqySyR4oQ5EMBxBCgUlcYnvppA/k0WAfX+JLksSix2o
	DmZPGiFC6ZPQBF7q6VSAgoYFwbgEXkiWfJa6QdBQ39faCemxlb/eOFEfhnNfiy/tC
X-Gm-Gg: AYBFou2FGP3w2RSfCpkGVnZ8xH8NF4J+h+hFX+F2WQpH91UzrsGht1dqZO6ow0Yv9C/
	tmeiLD2mK86QTS3BC82HfBXBnFlKUwEOK7aY/z47SxFVJghn5+/6Hsx7a444EPrV9TXYCb2o2qG
	Md3zZcrkVpqz5hxxoJ7zha/wAZC+ap/UlSPNer9KcLFtd+s7jIlMmon9xl08PomqnalTCY8Cu4S
	Eonz/OJBYl6HXRv0pS2f7ngbweZCl6j8x1vimNmpNNC872sodbCxZC0yqKmboaSO88/hTXrdUE6
	IYILY7ymrY9Vw4t5bVvsQojiyPRzlAPGA9o0J8eG65cZjf82ciqKk7zt/ydoNV6XyqVcJgtEe19
	iIXHodnyF3hyqudcnIq3+rG0XwM2lzrm0bNeEFmzbunTMPWsbTJjVuzTkGJCUrjBqXN2tuFY08K
	SAbxS4W6wKoVUjgGfnOTyzBAfOk31ivGwtBcFzrv2pRi1GBBruH2SB0hOYPdM=
X-Received: by 2002:a05:6808:1922:b0:4d6:9232:b3be with SMTP id 5614622812f47-5640ddda3a0mr6776769b6e.53.1793616154068;
        Mon, 02 Nov 2026 02:42:34 -0800 (PST)
X-Received: by 2002:a05:6808:1922:b0:4d6:9232:b3be with SMTP id 5614622812f47-5640ddda3a0mr6776735b6e.53.1793616153411;
        Mon, 02 Nov 2026 02:42:33 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:32 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:17 -0800
Subject: [PATCH v24 09/15] media: qcom: camss: csid: Add support for CSID
 1080
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
Message-Id: <20261102-kaanapali-camss-v24-9-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: V_3j7xsWVsBX874XC4-0nWr8UhJTuIMK
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8691b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V5uz4Rz8kk7wrr954LsA:9
 a=4Q4zU7iZy6iiv8wZ:21 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/6enOEU7e/+b
 DhWFDoNEIEGQGLVhzYSzaWkZxl+d5gtHFaH48u2TDRte6XC1MBnMD4gORvE2+FGlNmfJUoW/wqM
 Gqp3A64k5CJucivuEffDg1dRxbK3+ZyMWYdpvceR0G6lrCebm8KUEiaCedLVCgPkxvLGWyjf8zT
 DwENg1/F7byYSV+YOZbLCEYITYd6aXoJ3DyJ8SwdYXMKGTjRIb5QqrRLtQrAbCgxVYDG2C+JuNQ
 5pZ6xYNmMRE8tBjGFBiqpA69BBjmZMGV93gCieSguCNIZ8Z6lmvU4HZFrqN42oNqyFFPeqXfM5l
 Cg0VpBFmK3bJBMnxDUbrmlOWYv0tVHfpKhMKpDZ18SDAvm/SA85DQ1sXE4GTVcw0m/0suWxjFHV
 oQR8qXKVksbFDTouLbzIwpeIndW5alW7SgF5ayxvZQll7j4eTfG5n3pB2IAS4IKps2fw7j+wCfQ
 9/7eptimGv1h5Cq/3jQ==
X-Proofpoint-GUID: V_3j7xsWVsBX874XC4-0nWr8UhJTuIMK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwa+emEHfBhTU
 i7xrkKHS7BRGr2SgopN2ZNyErQJ5WK9VFgf82noAfe+T8vEmTfByUKqb1FxzNO8HqSeBh3Pvagk
 pw/tTcAjddt4OrGCctetkCIpUcLjcoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add support for the CSID 1080 hardware found on the Kaanapali SoC.

Introduce the CSID 1080 hardware resource descriptions and implement
the hardware-specific register programming, reset sequence, and
BUF_DONE interrupt handling.

CSID 1080 uses separate registers for RUP and AUP updates, with a SET
register used to commit them. Extend the CSID interface to support this
scheme while retaining the legacy combined reg_update mechanism.

Also define the INFO_INPUT_EOF and INFO_CAMIF_EOF bits in the per-RDI
IRQ status register alongside the existing SOF bits, as well as
TOP_IRQ_STATUS_RDI_OFFSET for RDI0 in the top-level IRQ registers.
These definitions are added for completeness and don't enable SOF or
EOF interrupts.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 402 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  72 ++++
 4 files changed, 477 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 27898b3cc7d3..218ba3a95939 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,6 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-340.o \
 		camss-csid-680.o \
+		camss-csid-1080.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
new file mode 100644
index 000000000000..3d90d31201fa
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+/* Reset and Command Registers */
+#define CSID_RST_CFG				0x108
+#define		RST_MODE				BIT(0)
+#define		RST_LOCATION				BIT(4)
+
+/* Reset and Command Registers */
+#define CSID_RST_CMD				0x10C
+#define		SELECT_HW_RST				BIT(0)
+#define		SELECT_IRQ_RST				BIT(2)
+#define CSID_IRQ_CMD				0x110
+#define		IRQ_CMD_CLEAR				BIT(0)
+
+/* Register Update Commands, RUP/AUP */
+#define CSID_RUP_CMD				0x114
+#define CSID_AUP_CMD				0x118
+#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
+#define CSID_RUP_AUP_CMD			0x11C
+#define		RUP_SET					BIT(0)
+#define		MUP					BIT(4)
+
+/* Top level interrupt registers */
+#define CSID_TOP_IRQ_STATUS			0x180
+#define CSID_TOP_IRQ_MASK			0x184
+#define CSID_TOP_IRQ_CLEAR			0x188
+#define		INFO_RST_DONE				BIT(0)
+#define		CSI2_RX_IRQ_STATUS			BIT(2)
+#define		BUF_DONE_IRQ_STATUS			BIT(3)
+#define		TOP_IRQ_STATUS_RDI_OFFSET		16
+
+/* Buffer done interrupt registers */
+#define CSID_BUF_DONE_IRQ_STATUS		0x1A0
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
+#define CSID_BUF_DONE_IRQ_MASK			0x1A4
+#define CSID_BUF_DONE_IRQ_CLEAR			0x1A8
+#define CSID_BUF_DONE_IRQ_SET			0x1AC
+
+/* CSI2 RX interrupt registers */
+#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
+#define CSID_CSI2_RX_IRQ_MASK			0x1B4
+#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
+#define CSID_CSI2_RX_IRQ_SET			0x1BC
+
+/* CSI2 RX Configuration */
+#define CSID_CSI2_RX_CFG0			0x880
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
+#define CSID_CSI2_RX_CFG1			0x884
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
+
+#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
+
+/* RDI Configuration */
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
+					(0x3080 + 0x200 * (rdi)) :\
+					(0x5480 + 0x200 * (rdi)))
+#define		RDI_CFG0_RETIME_BS			BIT(5)
+#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT			12
+#define		RDI_CFG0_DT				16
+#define		RDI_CFG0_VC				22
+#define		RDI_CFG0_EN				BIT(31)
+
+/* RDI Control and Configuration */
+#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ?\
+					(0x3088 + 0x200 * (rdi)) :\
+					(0x5488 + 0x200 * (rdi)))
+#define		RDI_CTRL_START_CMD			BIT(0)
+
+#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ?\
+					(0x3094 + 0x200 * (rdi)) :\
+					(0x5494 + 0x200 * (rdi)))
+#define		RDI_CFG1_DROP_H_EN			BIT(5)
+#define		RDI_CFG1_DROP_V_EN			BIT(6)
+#define		RDI_CFG1_CROP_H_EN			BIT(7)
+#define		RDI_CFG1_CROP_V_EN			BIT(8)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
+
+/* RDI Pixel Store Configuration */
+#define CSID_RDI_PIX_STORE_CFG0(rdi)	(0x5498 + 0x200 * (rdi))
+#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
+#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
+
+/* RDI IRQ Status in wrapper */
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0x224 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0x228 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0x22C + (0x10 * (rdi)))
+#define		INFO_RUP_DONE				BIT(23)
+#define		INFO_INPUT_SOF				BIT(12)
+#define		INFO_INPUT_EOF				BIT(9)
+#define		INFO_CAMIF_SOF				BIT(4)
+#define		INFO_CAMIF_EOF				BIT(3)
+
+static void __csid_aup_rup_trigger(struct csid_device *csid)
+{
+	/* trigger SET in combined register */
+	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_addr_update(struct csid_device *csid, int port_id)
+{
+	csid->addr_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->addr_update, csid->base + CSID_AUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_addr_update_clear(struct csid_device *csid, int port_id)
+{
+	csid->addr_update &= ~CSID_RUP_AUP_RDI(port_id);
+}
+
+static void __csid_reg_update(struct csid_device *csid, int port_id)
+{
+	csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->reg_update, csid->base + CSID_RUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
+{
+	csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy)
+{
+	u8 lane_cnt = phy->lane_cnt;
+	int val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
+{
+	int val;
+
+	if (vc > 3) {
+		val = readl(csid->base + CSID_CSI2_RX_CFG1);
+		val |= CSI2_RX_CFG1_VC_MODE;
+		writel(val, csid->base + CSID_CSI2_RX_CFG1);
+	}
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
+{
+	u32 val;
+
+	/*
+	 * Configure pixel store to allow absorption of hblanking or idle time.
+	 * This helps with horizontal crop and prevents line buffer conflicts.
+	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
+	 * and just enable the pixel store functionality.
+	 */
+	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+{
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u32 val;
+
+	/* Source pads matching RDI channels on hardware.
+	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
+	 */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	val |= RDI_CFG0_RETIME_BS;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	writel(val, csid->base + CSID_RDI_CFG1(port));
+
+	/* Configure pixel store using dedicated register in 1080 */
+	if (!csid_is_lite(csid))
+		__csid_configure_rdi_pix_store(csid, port);
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_CTRL(port));
+
+	val = readl(csid->base + CSID_RDI_CFG0(port));
+
+	if (enable)
+		val |= RDI_CFG0_EN;
+
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i, k;
+
+	__csid_configure_rx(csid, &csid->phy);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx_vc(csid, 0);
+
+			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
+				__csid_addr_update(csid, i);
+
+			__csid_reg_update(csid, i);
+
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return 0;
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear)
+		__csid_reg_update_clear(csid, port_id);
+	else
+		__csid_reg_update(csid, port_id);
+}
+
+static void csid_subdev_addr_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear)
+		__csid_addr_update_clear(csid, port_id);
+	else
+		__csid_addr_update(csid, port_id);
+}
+
+/**
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	reset_done = val & INFO_RST_DONE;
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (val & INFO_RUP_DONE) {
+				__csid_addr_update_clear(csid, i);
+				__csid_reg_update_clear(csid, i);
+			}
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+				camss_buf_done(csid->camss, csid->id, i);
+		}
+	}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 0;
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			/*
+			 * Only need to clear buf done IRQ status here,
+			 * RUP done IRQ status will be cleared once isr
+			 * strobe generated by CSID_RST_CMD
+			 */
+			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
+	}
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Clear all IRQ status with CLEAR bits set */
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
+	writel(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
+}
+
+const struct csid_hw_ops csid_ops_1080 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+	.addr_update = csid_subdev_addr_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 2f7e593defed..a3ab2a384bb4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -163,6 +163,7 @@ struct csid_device {
 	u32 irq;
 	char irq_name[30];
 	u32 reg_update;
+	u32 addr_update;
 	struct camss_clock *clock;
 	int nclocks;
 	struct regulator_bulk_data *supplies;
@@ -224,6 +225,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
+extern const struct csid_hw_ops csid_ops_1080;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_gen3;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 30c2a0c89100..7c26cc6d3b37 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,76 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csid_res_kaanapali[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5611,11 +5681,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csid_res = csid_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = 6,
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

