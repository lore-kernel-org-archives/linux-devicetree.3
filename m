Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4583E8342
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124674; cv=none; b=dkksOyQYVGVzSs3JT4PzlkHFiuPLDsctsDALjytB9GOw9A7/rfQquRAxQzms3OrhfxhGivobRDTzIW8UUGrVE6pZJMLR9IOYFRH5n9xwYXJupJkFkkF4rPEc7vDIqIpcBlF+Dd+H5sEUFAzrdlrSAJEedFx3uxhQvc2+OAi6bfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124674; c=relaxed/simple;
	bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8DGRP+PCsM0EnSE9jco7fQ/fJRIRZIVolbwweqR4q8VdW7X0WfrQB1kWX6vSg3v6ctPSq2Zo0oqiKQUifWobbTRWkANQlGYKpmB7zkMJJpiPko4i8EesTjhXFVDR3g5Di4VyBL6HJtiQkI1kSMA3exgEP6CTX88c2DGT613R9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IB7RsLkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dvqzu680; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IB7RsLkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dvqzu680"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3SGv4006795
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=; b=IB7RsLkOApXfakX7
	llDBN0EwmrSki+Wf35W0sQDebM+75eLCHnq9hXswlZOXiUce9QEkjzrqUDQnCQol
	whhnIPzpHSAqkzBexWsmYas6bhKwzGCaypI43EFvM0arv8PO15LfUj1MpEXfY1Kg
	Th39A6ogHDiwiKzJdUN9qcsFVkaLN5fZUJpkNYraP9iSx3Ut/ymNDlMpb7OU38x1
	Lw/ok9aJWUs+fUnccuCBdVUm+jW/bpLlwFXGNlVsxpuST2MDiAgAejSvkPp2sg4o
	KJ4tARVqf6XfmqHdXCWduBpY1J6phLJjc+B4Cju2e7bEwnbLfP0+JnpiuTJhcu2T
	nyfYZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6529gea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso98032465ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124671; x=1784729471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=Dvqzu680CrQNkgJzQArP4T/L8mJ+WXFoHe5zGaakOR5eb4k8vnNs5+fMMVYd4WyIEL
         AFvz4CHwYWU3QSwLfSz2KsiLfPIGV0FHkqfpFTOXsoVIsVeKIeoLo9dDYAmZHXy9s31l
         k29m+PNdhyGfpGdcDn6DPfVYbtPSr1nhCIlbV5EbXa1u9B0HCKKHU7N0/vg4hAlzk1DX
         ZPpoc1w3gaCuCVDvOtTmNmAZ9TtgFCA9htZEia+JVi9K7sITn89iNuvztqUz/mTvevoL
         aygopdF94ktbpVJUuyCcDSi6khxEhmc4qYbjyeD4SOmhBPDVtOvnzIr1Mjzy8GtbmD/g
         hltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124671; x=1784729471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=sNJDH2eGzSH/GwHyG8sJGXb76lxdpt9INyAShGDVmG14lhXmXs9ArlUVX8A0KATsvZ
         YIyZReQuwuEjJtWssYzrivhtihAagZWDGZr1Lcoa1UEkQ8Yrr1dYx7sSevUZYisOSaBP
         YlsDJwPxR6ivCi6fQ+VXTJMxQLxEmipEgUaWjMQzPMz9/uEK5NgXa90g+M6t1d2/xAGG
         OTr08kQzHspPY1T7ZJw2Rd2wE8DouM63eO6uKy+05iZVhPV8EkzHyKHdgs6p6iGXGr0G
         PgqxRfJkJFdFRrYn0ELmgYLb5SVKGXM4pEVMpM4gCc6g4VdCZOI2vX2tTUPxf2FUpwnj
         MP0g==
X-Forwarded-Encrypted: i=1; AHgh+Rq7kiTNHeINT3Hf7Z1yRsAelZfcIq/rgkO+ehSLJsqOOU8k/cDmIgZZOBb1ORWKPB+1gqDv7+UA1Kbw@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyBKB3qATemg0I/hOASF5hk1nARK1nI95BRhlEvoJOLqLghP9
	gZ+mWNQwYgYPOpXRGLpmxE+veXNc4lS0BFlLUMvC/u5F2nL4XeA7/Slpz7xb5PX43moas6iT00k
	5sppEt3t6aDAndQNlv4IC/bX7tfRI+Desp0N2OdZ0WoU1n/ZK8WymzPR6F0Cf6paY
X-Gm-Gg: AfdE7cmBkTTk3xciMLbqcDqe2BC0pnljcrV4riOXsrTz5tSJYYcI13mlRZqxy63pGDF
	fq2pIZdsMAbVmovDixp+YsQvR4qH/MMa5rGSCtKOCvYLdAkUXPCsqhanjNnjgqhbaIisQuXWZBX
	8K8tX5X4BDrtc9oRz+flnuyPJpCbj2jKxFpM2stdnCmh/FF/AC8siJ2QReH7aUP1fcNRFX0YV81
	JEnCxsvPqc0T/MG85ghQygnjreeinYu5lWT4XJS5Ns5obqZrGrADwy+aYl6tbOXUo6wPUJnD23D
	hau2UeJSkxTc9Av6eCcIM9vXzH4/7P3Z+E3xfCMpMpz+6aAy6xsRxs8+kRFtg5O0in9zkNGqFfO
	CiqKdHzKv/B4ZkZffH/KIDmYwVASdRVTZ/OE/Yi4WuIoZ
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72569205ad.13.1784124670932;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72568685ad.13.1784124670343;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:03 +0530
Subject: [PATCH v9 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-9-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
 b=2qipjg45gfc/Q86MUudP2IYVC2Qlg3JxMTxLLbpVLRgnMcPjCSalBAsP470+oXsfKJSpB4oGA
 RffdrC+4IIACk3ajQumdtL9pzPGYvWKLGbtd+rxWPoyoXo/jzMRA7bZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX4Ei7VJKe6G3y
 F5jrJJkS8CEARhXoX47quyFaVKZmJDX9l4Bsv2LdmuORy5HxLvHZAR1YL4BBc0W9OgR1e51EYQy
 nKimwcrc55i0uarxjl31u1koTX4eOgaPLTFPvPhu6svPd6Hm/d0HSKSI+/nZ7QBZ3c4ZfW+lrOn
 Jkws2+uizYp1v51ZjPIXFNBLKTW5ksk5PhabTE7o+sza3BuPYhPmI3eBJu/SoDSmAGfEQCWwaj8
 VXGf4xkXzc5G2woD/mZAaVTrI06M7HK/K4ugTE+aBgA+zesWoBymgFBPadWLTGiy9niFBQ07kbY
 TsNXlaVMyUCxS8R8wjHQoclxg8QQLC8YStlKSb6S5OjAyNRTH7f6jF0oesdNARCHNww66FdaAhT
 FUQs8QhQvR6uHIkMespIurBiR2/BtMmXdojsH1quKlzAVSIbu6K5b+1MZcBEd//jzYeQJORQx/B
 ZiL5wLujUe1WZIBHlQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX0UBeeYTMuo/i
 OUag0VNdK2CYBg433ea2IGYr4+m7M6K3qV3Ge7PvzFCBznmwDkICGX3hxH0qAUso1kchRrirpOS
 0api6WA6C+QXY73a13VN3EMW66RdL0M=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a5794ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: QkLAoiRuK4jjOR509D3MQC3lz1r8mw-2
X-Proofpoint-GUID: QkLAoiRuK4jjOR509D3MQC3lz1r8mw-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 4894cba62677..7d5007abaded 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -333,6 +333,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -366,6 +371,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e690c566c875..72eb8f6240b7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index c44c85eac3b5..3782454b7d06 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1

