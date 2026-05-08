Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555D35CB7B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283094; cv=none; b=CMOQO0KggE9u5bIFve2j14AqRuMBzMYkyekl2WR1MgsAMWNhagMD9a7vJzaZ1yaO99zs9FnXBCQqqSWzfZF9+cT9nlwYIQsVwsy2u9epO8RXkTozuYQ+dUWHx0wok/0TYGMNcrBI3LKYCry6hr2POkGvs/V25wo4GPp4/tuXnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283094; c=relaxed/simple;
	bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbtvzQIGC7FR63DJsZqCCTt4eZjJqdv3y8kVr7GMqKjBJzrZF8zKQweeX9I60fxZw1VL5uRL0ZjDse1vNLLAGdMttBqx+Y3y8C3KUWb/TBO6KaeNlsBr4zi7vaxl4rtk4bvet6zLb5GjE69bqk7eO4lYHaf7FzgIq4BqvFC39i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2akJPGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHHl5Brp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2akJPGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHHl5Brp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648MRONE318068
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=; b=U2akJPGVtGb2jLF1
	VyAMgiBrbxGw+R+Ubus+qhyeuGmGeoDs3IDBQHy9475bqeF/vxJ0F+BjOpx/YrzR
	fB1sfWCZPwddCHY7XMg+LumGk9Lp8kseKx0wy8+VIB5lmN+u8xoWz7FrskiLl09v
	9G82T2RbZgU8MpWhBwBHA9zBaiRimOsj8F58VgBWB3nyxHebSFHCFvp12V/TDQsf
	9OaXB3OtE6T6+NXvw/mGIf6iLWUs5RcsUk5CN/hwq7yysALRdJd6hdTMoYdaA7f6
	RdICfh6og1ASmClnxnaob3FjmT8DDez29vtVHSAqUaX1so37MjW4iNReIek4DfCh
	JXnuBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc03gp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee34588671so3728710eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283090; x=1778887890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=UHHl5BrpFyNrNHXB9EQMYcoze6noL41itSr/oGF8r1h/o/jas/wysCfuPNiI9MV7z7
         9s4yS5++eWrOXKDp5QS7GVatlGOCjNIwaOEOsaYBszPe/MuJIgbtteJWnLRLt2Xm/WCt
         +zrip0RUulRJ3OcRYzajzCc9fEG+J8WcJxWmN4MbnohCy+u4eLKxiavxB7TxmhHeolqI
         H5z3Z0sUZlAciwpIiy/o0wxtd3cyf0pbmI1XpflrErS3RnbqiFtTLphv5H0EtNPFR3x1
         cP5Zr7ZZNFq8sweNs5uQ4ghrdt0sNGcCu8WqDaYD8SYqx0Sfooizb8zOiwBGpKbDx/4n
         RAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283090; x=1778887890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=a/Mn5EbTPZ4Fcm/i7HJsyX50BmfHgrDDyI8zZjjv7S6OUb0EBMkx7vuM32OZyEcTbs
         QrHHJZy+4L4y2N2LxXxsSPeTkezITl9ISTKih6+HPqWqvDZgTuW0MW+Nu+3j0jUdJInv
         sNuMsOIAKf9AelUWqnoccLjt8HBlVC4EZ27glHJ9zjtelCTj8v4GoX1eTs3tg/bRg2oj
         ylTwQcA9OyDMbyGlqJ+MDONdN0hBAL7knaMEvc+DPZlSn+2OlNB+jD3M3yDDjnRcHCoH
         MV14azBCoLS2e3HBj9hsTy0qUk8DehXvVW85wqh0N+GvcNf5ZSkPqpn6/sDx1rqWlfn2
         KQxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ud9Jiv1u7V+CZB60slkSMeKLjdiMo6DoT2e3yFZozTSyINFWaVMSR4y+hRb6b1+AYGIO4G605lbHK@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPtBVhkGwZOf0u5pwtmunpSk77kmFSp2THXoa+ATNIhCLDBsV
	2iiQsrWjmYtpbO/QXdMJQIg+JltVeMKf/mpZr1z/HCMyufQ+mLkVIVidPIXZnPPr0LjQ9fNnTgP
	aJuQTA90/Bk3jNv3/+qrkEjI6vSGDNPA94DsW+p3DLCyLjFscNnc2vuL6b8wEA2IoHz+RvDKI
X-Gm-Gg: Acq92OG4mDMD98NQ/BtVIDP0B6g2/n7YkNhQZ7C9BkmcujFEMRE0pB2Z0cyMDTcl/nt
	mAev7huimy/ydXsNtDk1DWD0XpqOJ2nmpntdnA2iuxR20tvc+UvMyLngVfdySLh7wWj4kjuhxj/
	THzEcRYzmgkouQ2aWMa5N4HCfIGnroCdCZZ5Ti1tuEUUUaA+uTD3Jsm+qlcjSQrfnkbhDD5vIta
	S9CPvONfJiF/0sWHlNWaRu1UCoPkblSSJWnshmIu9guwvdlZBo4ZUaIAtW9SaMqGO0PRwyuVgO7
	4FlhLNwc7eg8HhkWT92oiRvhlIphSAc9d9ebuXGKKdDBiLHTd6psDwC2Rnrp/QUyE4LzcANe6tz
	/rTGERd2uJVE1T5ILdFiJqLlzCq6VJ5atG9O+l41VyZUK5/p6TwSfj3ZYPLM=
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr7179509eec.32.1778283090037;
        Fri, 08 May 2026 16:31:30 -0700 (PDT)
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr7179484eec.32.1778283089490;
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:23 +0000
Subject: [PATCH 08/10] phy: qcom-qmp: pcs: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-8-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1895;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
 b=9X/Fm33TZjr4AzS45pxwdMzaAydcOfoG9fPGrGiA5IkBCbFNsvCvp1zs1OEql78mocn9qMGK6
 8L64aV4TnsGDB3o/H0CL8R5vVcniIMti1GcUrKxkka+w+i8XAXQzsJK
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX9pL4ozGM3N3R
 nnus2VHAOrG2JkBXKeJxpFggRL9c8CQiU44+RLVlSMo41aPVy3Ut8LgBdhr0/b3ANKkUHbqz6dj
 aquc9vmddDtoF8gJqWazuWNZdVAw2ij0iA731+WOyF8ORL1U3weSQukT1tEj3FKm3NIm9ujXhKP
 S4rbsozS/wLOPOxf1WSKGheE52pxM1g+nTA1e/HHcJfMG7SICG6Y6Nf4T2B9/AyTUsaVgJsFvSI
 hxcc+806IS3/hiv453049RNli/ysolkF08hGrGubBQbEq9DDJ3O3lZZH7CWQl1bN/mZjYoI6yXn
 DMsogLpshHdKQib8vV7twvbCxi1JpgdYmtqLDoHghflwF3YdzhBHQbrGXiauvvvCjCJqAl5BFnM
 ap6MY2oA6HAXPhwK1DhL3QnESElte4PegAxX6Mhwqs9CEUSR4TimQoFJ/Y9EAnLQPXhv5KzJK2c
 z/2cWgXhmPpf4kPo2dw==
X-Proofpoint-GUID: XvS4wCuPzD_BWEFQ8heGkRgj5SC8PX44
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fe7252 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pc03IfIZ1lXN1Xjd0rsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: XvS4wCuPzD_BWEFQ8heGkRgj5SC8PX44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

Hawi SoC bumps up the HW version of QMP phy to v10.60 for PCIe Gen4 x1.
Add the new PCS offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h | 23 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h            |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
new file mode 100644
index 000000000000..fe0279ac4e4d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_60_H_
+#define QCOM_PHY_QMP_PCS_V10_60_H_
+
+/* Only for QMP V10_60 PHY - USB/PCIe PCS registers */
+#define QPHY_V10_60_PCS_SW_RESET			0x000
+#define QPHY_V10_60_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_60_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V10_60_PCS_START_CONTROL			0x044
+#define QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB		0x170
+#define QPHY_V10_60_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_V10_60_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_V10_60_PCS_ELECIDLE_DLY_SEL		0x1b8
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1		0x1dc
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2		0x1e0
+#define QPHY_V10_60_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_V10_60_PCS_EQ_CONFIG5			0x1fc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index e461a000da48..3a4a0a9a9e4d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -73,6 +73,8 @@
 
 #include "phy-qcom-qmp-pcs-v10.h"
 
+#include "phy-qcom-qmp-pcs-v10_60.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

