Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB163E7150
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266872; cv=none; b=RgMUUyw9bZX6OC5W8FS+fNWgsWaACZYdeXAGYPyJCcFo9l5P5rcpJt6BBy7sFp6piuRGyab/MQYVngWFoNoovrswPOSdvntVcTBenUfMDirJ3V46uT9fXircsMZ8MhMHJYDzesihj0LndUdGe/dnn23R2Oaou/52rv9IUbQfCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266872; c=relaxed/simple;
	bh=ECsH5Gs45CqpRqX5C/jNn1QZ5iDd0NScn6UK3/KsjCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1J3mcbC8Rc3ypbC6IRIhXElRbgkx5tnFxIm2Iyx7yMWqbtK0Q9KVcNvKYVpkY06t6jIUhMrof9jfvtzf4v/ztkMgBl2YSuXMgcEwaPrySrBq2JPfIcQ27W9zeWx3C1kxS7yrURTtBw9OZmI53mENF2vq/NFVXxwAPkgeHKULSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iel1ax2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAZhpWSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iel1ax2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAZhpWSI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGmox852141
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=; b=iel1ax2rWwLeO8uZ
	D6yJn+0z+XjVZA72k9D5bRPJhMSmXyjx8TszMpMcdCpmpefZ0FzZeaA6yZULSurC
	o1J0PfV1r7xBL5qNUabH7LmldPwb4rGDwOBOIFZ7mbYrE80r+OR8f4OioX2NyPnD
	eJ6dRM5lLpW9U8HeNOOe4UTKye7tcOoeqA4STQAtNluiEXMwnaE9Ja7VykIQlR/R
	j7qX5dpXrAZHdRYH82Js+uYqks4Us7YJasAvcZsNvkCkaC3YxdYSDQRIv5r8BKml
	UR5akM1jgReQtOFpbJD8vdr/jbKuIzpnpU9Ltmbgw40UngID18yUIBEbnpoArlBi
	iO4yog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthk0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:01:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9429f49cso2714857b3a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266869; x=1778871669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=OAZhpWSInhZKhJoUdF5LckMdDUK5aU0jSjXgq0xlSQDw5vK2qw54LjIGh9OHchfsSP
         mhRtauH+ReyStG1KK/4o4Zexflaj0meY63ZJG1mRSMulNzYwwawIJYBpN5xiHkJeWXS/
         LDCRU3DNWlDKufv77M74ZTC0pXyoM6UdNsdqm5+SgWSf/I+kPtSu1g4NmZTPjditkKaj
         VA/M63vp2LOFRLofjKPL4KovR9iXogo1n8+e8U3ZOH3U7FyVrFwYNMhJuUllnXp7wPSz
         bZrXLmS9cF7TnQT7Xyz3PjzmvrmLbeHAzHLOb4JKQyUFsS7u+xgYRyslSjUnP2snQZf4
         EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266869; x=1778871669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=LSqFU03SafjqTgvFN64YiJ14XQGH0iPvAVz/xgYEKakF/DCDluIytC6cg6zyEwgiNv
         4Q2ywoE/wPUxon2URU0aR/pAR8F30jk8TjF1PZ2bH0vV+JGdxqnBhuYKLgbB6PmMqUGw
         eFIB5dyQSEULKC0neFklmYY/oTGp+D9ScsUaMvM6VNU61g2qpX3i58emVQ/WyKJWpgh+
         xgJawqM6PUXLuJaplQHmAz71e50oOaud8bts/KeY0Aa1msmPpM4O1OX8+saXBRNeISZW
         mKfn+eUpdef60Svpu461dlIwb2VPqIqddEKqeeRpwbsg3PvSFMXZL3A11CxhKbdhoQru
         EMxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SOPCYraOtr/b3okf23rQbaQ+BytBxPuSoQD/TYxKvoKip07mk0GbLaAyJ5HuIgnrF8HWhCswMUBsp@vger.kernel.org
X-Gm-Message-State: AOJu0YwCETohHFlR3GpGwh4jFXgVOkIO4NkWNeqN3U4vqmRC0BCKg9sF
	pGLBDzB5C5vJ+G0jbjafllohOn/zEMvg/n5JSwATCfZnzq1/tfxwm8ePFeDKt07NI3SWXb/C1ey
	0SwLiHDzqbfoQBM1A8ZmOx/TKpCHpmbK/6OyVv2cvlKPOfxnjjbRmcJ52/xqkTYtg
X-Gm-Gg: Acq92OEJkSmYXAFmU5t09iRBzh1CHdQP12Y1iWhUlwPuVzGWHWlql0yDFkIQjDAnSUp
	ujfmlCUnbY8wwxtTZgKbkkNNredb19s9wEoJptCpk1D4FncDWI9/0t0t/HZhF6zh1F5GgberbvR
	dC0h8/ZGlr0QSS//O/yfGcZHqEkckY5osC7D9RD2p7kwCcEX3tu5nwB22z6l/EwKwHcuT58vPxF
	+vjZXZHQ4rjWKR2BkH0xLGvUY8iJpMnxBmkxsxHReKNM54/GwddM75lQBpr+fLGy8c/f+mGgOl6
	f6QQ0WeKNe4GSCk4UAN2YrN+z+Gve9RNEM6NhaPHYMu6p8nraETldrXxRTEuW5VWy9z24wI+CyL
	z3bQYwkyIJ3coXR2VK37eMZRCXAuj1aVcsGQAYi1zphpSEr0WCr6dvVU=
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14043024b3a.33.1778266868602;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14042970b3a.33.1778266868032;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:51 +0530
Subject: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1118;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=WbVuGY0YNDSgJ/NUQMQmGYDqgQRedyuwh2xVr1Rt3qk=;
 b=g4ip/Dem418f0yjnajSGGs74S3S3o+EBtTgU2gWCC0Y8pQtMZowyDugB0vnAvvkDMUhHColtn
 EHdVoMJlf9gBkirrywja/++JGIhsXzm42t+xad8qNcttOjkBs2PFyVN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: 2uSj2kh2MopIHpuS2j45L-sa04lG4sRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX3AcJIpgQf8QI
 0iuwgdhTzYSPBgHyGHLcSCkbejUpAbEyPBiic5Gkyo8t6544THJjMcDi0D87X56mDmu4fsIEeEh
 jwE6wYG8tVFZt9Lv4KHfphnUcQelu0ckaj0vVkzSpCYmbifZGApoGVY1NcUt38yiDkGuv1tLR6n
 CcWFJ96ERso5uBTrbqeZSwNYCp7JepvijS5UoLyFncINTaGGD+CTILkg1Zcg4iq3EiAS7JW7AKa
 uEBm969318A5z2sGWM/96+QRcszMIXMbObhB1rsLSu6fgNZwMqMseiMgzVM1sBaa6dUYK5E5SKy
 Nin6SIeYDbLjZGgyOWRynwMgC+Go6vLsEv7ZPHQF6wux7sdS4hW554x6dvdnBeI+um6SkwqhB+s
 9bi4mroHCzutobFVuoPLU2hnx7fcIygIexaak7zj1wqSXRL/d8Tt2CR1DmHOK98SRa7dCKRiGkR
 Vs6fohqrIqCbv3k65kA==
X-Proofpoint-GUID: 2uSj2kh2MopIHpuS2j45L-sa04lG4sRU
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe32f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fccdbaf6dbd5..903a8bd118be 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1

