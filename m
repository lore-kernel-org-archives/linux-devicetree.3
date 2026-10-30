Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341296;
	b=n/3/voxXNfsaWOpLcxGwdU+TjyBVrKNP0kgyf3Dek7wZ8Seo7PXeG/01eMyocMCRi8Js
	 wRrCvlcI8PJi72Qb2qyCPy2PcmxL8uSye/zyUrriaWh3rv3/Mtc560kcWOe6VUHgcYj57
	 WnKTIkCsIykHxn1rA9qjM9frESeGNvKkVW8L9BXxmdgIXNP91mAOGpXomDYHDwukm8Zrq
	 qtTnsUGGTuS5Njkvigdo9G8RGnfRu6ndXouWnOS9lUXf9UNOUy1V7xRLyuCwRmh/3POjo
	 JjrTW7D2MEe+n0OMGeEm6e6YnOhcH17pznqg1T5ZN6cyISmTA4I6q0n81YaqnGe2GSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
	b=T++UfRN2IzYr16Jcei0FjKepDIhP6wautcbfvxzhUp67ZtWCKpaJB/dtFoDMLv4rgdU7
	 UeK1MBu7sTl3YT4VsRiKTsgccRtXbP4XCekdTeAW2+yp+VtkCMqtK1iy5pZcppU5sONmE
	 kgnHlMSX832D++8ybzyrVFQVoTebvIQk0RaimHab2KnGPISeTYH2sLg4D1dOj3brHxDIO
	 wmOCUqD1MP3cQYb/cRB+6aDd1rExzCZHA1CF0XNnIIZZEwPIdyzHNRt7G3b1i/4xpyy5/
	 YEj38KPhqW2gdDK1/Yy4hgy3lzm/lxRt0cAfeXHmLBZuTgW7Jg0FiPa1IWvgX4wZaPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYKe3LWW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY3T7Ye9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE52D606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE52D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYKe3LWW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY3T7Ye9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F5gS2287034
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=; b=ZYKe3LWWkPSDPz0n
	cXuRFf5IqmfVxT48sC13SyfypuJDGjeHdmv8jkLcJDCl5yPVzKSYLWMdhzHh3i/p
	fVGq6U1p/nWj91dJv+3X/DldsqvIFfPgxcSFKiPmA3+F97HTXb5rFLpsrm31GBvC
	XczNDNVkuFFE6wzrU45lxDId7fdfyVR2tKsnwgErCQq5sdP/S9ODGrTOF5L2Eyha
	PvyDdu8o9LVrG4XYjuYNLe3IPS9gdPGVC3cB8A33hvPJRHeY0qYji6XdgapHlXPD
	yLeiP/kZwLFQfpyzl13STZ8pYzC3zX5tbbBnEMo8LXByno1PmXBgc3ktY/D6fvSI
	A3xKAQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso250618a12.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341294; x=1793946094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
        b=GY3T7Ye954wn5vSHqjVo3NHfoFnloN8lH4+Noi10KnT+oyglEdfHx+9XVzIOSrg4U8
         js91GbHBUpDBwixK2mUtsPYnMy69hjJCC3VIjtwD3eJ8qFmHJhWEM+Ytk/ss8MuxnCut
         ZICEYhORtY3IfmsGLjVOPapKSkw0sDMMaR5VFo0kNDJEioTRJG8L2z5/DnEGBGpEOFEd
         fI4+QKIUGezjTFg6Wy0KNpuZK83rphQ6vUxWQ5u23vpkmbQDqWM5rIFc7hEUspfS+ZV1
         mBdM9GD8ZhlmMZpRgTURHhUGMgqc+dfNEKaeaiGuP169sKxnHB1AtHgcdssjFP/AmQeg
         Ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341294; x=1793946094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
        b=XP6DAao6wtlquQ3tZhiQ43Ja2674uchJ6iDA1uveEPtNNk2LsQ/YszZ71bxePquLjc
         Q+Ta/iJhDoodmS+xdqGXVAYF0KMpu5P/g1/8t6i3DMJgxxFONA9hqi4krjBB1ZBFvUjn
         mbUCF22RV6qPBHoFQJZga5aVDJaewTXkJQjIlODlC3Mp5Lnb2jbGi69ZKSRgl1tp9iR7
         NvTcIR+iDGPqS2x8xYPu9gf4vU2IkE4kv2alCj+QuNVWeOuqaNZe+yIjfIPYc/6Gv2Yn
         4n2Q0do6o4vyHYBby6q+QrczD0l0BG8aokVneG1TfgLB51KsWu4M/uB/+OzfmP6X0dc4
         n6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVQeMFRuHKku+2vU9vc1Y4gnVQKBZD7WoOi3NSwWTVDJskdngA5LJchDTynyZkTMIlT9WXpYCXizyp@vger.kernel.org
X-Gm-Message-State: AFq9FYLy6LpYLQWXFNJAGA+ctpsrOJCST++vFB1HkLPpW20PbWKhBAhg
	tbnSea4ON7wrIlz7v6/VCCujPhZ83B39NTqHN91mW9wg6/Imw42hCEQubPkplbEVN9zkaa0p0nm
	cwS9Vxnvdx3NfpxY+ghpeZMkZz5Yy7mXz3aHOdV4JDfpZnTzAfgnHMfkz+hVA1TfG
X-Gm-Gg: AYBFou0Bla8xN5Ge6MMlo3n1m9thgOQjiCpqapzQU/Y4AmggJuZvyrkY/MkETOdz3b/
	UO4tJCXzvyGibtCS00GHFbZTQndZf0ld+n+ytL6j8ZjRQHWrgeUhCyZVNGNLU77DX/RODIFGZI5
	6zamkKPYGYfnfUnYc3hIMxFf8J9ECUmnuucpQxAQhx+QRulA03unS43bLLngCkS3pdzYlK43TfR
	bVm4kyEQ1CbFPpEuMUJBLbOiOBj9JbyPRV73Ij5NonVg+h4/GOw+z/6MlRh6X9eNyUNiSysFx6f
	GO7saG1W59PmKKeymW2iDIWd46216XrEWFk3eze/ZaNrnSGdaIGs7NVYCn3G3j9U3niwvV0VCwk
	0H7Kvifhu/bdQrQHfWkOgKDt35uv2xu/mZJnPl6QEOmxncduO/5RS/grdx4bupURiTiE=
X-Received: by 2002:a05:6a21:7a46:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3e9290515a8mr1251631637.92.1793341294452;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3e9290515a8mr1251622637.92.1793341294020;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:53 +0530
Subject: [PATCH v3 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261030-pm8010_i2c_support-v3-5-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=5530;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=is9tJ4J6PefOG9w6hMR36Wb/NnwkOqhvAGypJZBq25k=;
 b=kmVIOF4OU4owH2jS6p2Z+iHPtECoZj0IZZApbZn1G23y/MYOOI546bagjqsv6F/irMHry4Mwj
 0UOpDhM6OAyAhTPEx5bU2vSkyPeMsNYHRpxh1DePyalYrADtN81UoQ6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: EO0BXANhx1muVhHDUyjs3T7IGEqYdikT
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4376f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX7uAsd1vDDwEE
 PXqz8ZMBEJsOcQvOLaLFcFMw3FJ/1kND7Zz2uXslgdEBiAMTGijUA5Oq/dNeDnw3JxppuVZId1U
 IIDS5W3JXCC9PyvauAVRT2PyVo7V3LxDBmy2lFir6KgdkLERwcfe0yQARPUYPMs5r2uOPnGU4jj
 DVI13UM8REPDDIMiH+4kZaEwLCBukHxXZMVI57R7vmn7KqY5YR4VQHz+dKr3VrFVuNRLqgqdCmz
 hRxzheqGVLIDPoXMAbK5XsrBOyWk+v3JOAe3+T+Qg6qdOEcMF5iFSOUIPLW4KJJALV12UDNCRIW
 nq1hZYWq/c+3a3+NKyUCfyB7sI/v8Fbnbxd8+YFO//IrFXz9hJEzkgbpBnY2JcaYt9XWOK6Ymv+
 Xa+O+ftd31+Vp+jTKiwZ9yAUgmezGlQ2k1gkEaBIEPb85F9BKB+8+d9YhsuQurE7aypyTXL7imz
 o1HgGClC4VKltlFq9BQ==
X-Proofpoint-ORIG-GUID: EO0BXANhx1muVhHDUyjs3T7IGEqYdikT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX9FeW4qAFD0du
 VRT8dxwRDTLaA2OplyMaZjkzyv+9l4BalpTJXOFE9JoflDsJ4p3Gy/9yAHDfaIWAhPQiWpKey4L
 LGcmgduywu3euNjVX48UJQ9W384whdM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 76 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..39fae8d48e46 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008 = 1,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,43 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	const void *match_data;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Failed to get driver match data\n");
+		return -EINVAL;
+	}
+
+	pmic_type = (unsigned long)match_data;
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +300,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

