Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6544C8FFB
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463417; cv=none; b=J2yHiLJsamQDvpdm3ULBftYPS3hW+mN9TrHiZoTdQf6ORzDyX6lBio+2Xbrmq9D+xjHlrJYceJTi3pFn99Pqui0pkprGH5LPaSCSiCVtNe1pBIEdHHESKv/bI35/dbaP7M8k17acewnXqRSipbEAN5EZJ1K2T3ryUzuZcZ9Mk/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463417; c=relaxed/simple;
	bh=BbeGXEWM0OqldoU0VUdDEv1IoMeLXIsjEyISU/LNvrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfjpdpxL2+J4YKbbxN3S0fb8/GmhVezWNrPicFgrYil3VpyAXlS2qyqkChqzC7u9xSxMu58RJFy8lF5s0/7+iSJ75A4ufOzxhDWxflsP6/wQ4eTbCzf7FnuUJQ4bvVUfMcKzLkaMJ4NOWCsnIGoKXhsFwpQhgFpstt4acojRFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwA3I1Z2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJvhOwuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwA3I1Z2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJvhOwuQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5RXK370216
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9+DCcW6CRFavHaFDIBwGFU8KdliAGH8kdInf6hi5rQ=; b=NwA3I1Z27MlxLk2U
	Kya95s7sAT+OQ59nFw0gRkWNChstIIoRgtj1akopgzN2u4rwolpPkyZ/3/CkuObL
	bIevEkI3mPx20RI7pamKoUClceIsVXQqqA1Wdurv7J98B2uPUuNvkNNFKf/Rm4Lp
	sBRbMC1Lu7oNvVG5rpTO+6D5PU43bMNLHeLPs0JAw1k88KgUKAbbar0JMDxOwPeC
	Pc31AiXnMPs7WJbT20ba6HHAx1JQwjaRUo7eXtTHYPfh4p8gVuLJriRA56R+TnUq
	0+2O5Ln1FeSj40T5BIO/YwYnGTgcZv/fvwd/wR0nEJHTb/0+ewqvkhYWd3xG7yS+
	VRTQgg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:30:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9674fae89e9so25064241.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463413; x=1784068213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9+DCcW6CRFavHaFDIBwGFU8KdliAGH8kdInf6hi5rQ=;
        b=HJvhOwuQGxjt+fEOryETYLasY+R6RGfufXTfhKfZ4QeWfoDvYknXVGchUaEomSGnx7
         L+e6z11RPOrgFuzH3ni8kaEw8OdweL0pHLORd/JDqpaFRmRlsULWoP2++LEyFHExSTuB
         ISjw0fhCZFRmNGuJroU3DoXH0qyUbSW9MDUWsmDS1waPz1042FCoS0kvcHibanUKrPyz
         wFpkl66/vKvtmrnyS98Pyx9q/R3lyRKYH/avoAvO1Jr2pbPg/aiDOP6IMSjdBFETe+1s
         3Q2PBs3sXE+1V1nQdBFbu3fS8T4Glj3PEpSEWbt/uPHGL/ud8DkMbNpnCmFwHM7Olp1x
         5c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463413; x=1784068213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9+DCcW6CRFavHaFDIBwGFU8KdliAGH8kdInf6hi5rQ=;
        b=YFeUKXBCMsO+HFp/YhYSfJZu8uHrPawyn/GkfYgc5ggJTBMucmMMy1t0Jr5hxUZ8bd
         QPcgVwWOALM8PnMfoRe28cSgxZ5xeremtAR/xYZEftwjNISGaWDR/pxI7D5FVYadjOI3
         dsY6IaRxFS90JIWM9Fmsra6BdJTLcY4hFjO0d5fUjrFA0SiOy+momjAAThe3Ii47De8Y
         8FR6cu04p7PgKMXzeJ0qC/0BwQ4/NBQRON1SnEbtuFu7LC9VpPXggCkwC39SItCllgLj
         7hcC+i+Grh2Rk2ZrhBRpwaIG50946ySjyzq6/0qcuVcCeHzZ9B/9TSX9valhna7TIV6l
         4ydw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+TIi1d3okn7ufb9LDw2J/Se3EN4gpiNFrV1P4ocUCmjpF1pyalo2/5XNP8wi2P6dyfOWfqlm6VMX7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28ILObYJzDnrsSHODlpVY2eRHdXTbNPPRcD5iQpnEBf6Q0tD4
	c7tKTtuCcskHRvs1dJNJyw+k3Cf80ncFgn+HXB28bsIxG1xvOJmdmz5vhrcGVfucXapywjPICTT
	PDt52vRhKMsd4TmjaDhne/R5b8BqdhKp3LPxcxgou/RYihyRTalzh4eNnOnHA2e+M
X-Gm-Gg: AfdE7ckTDs2dE5rzNLPXbuN3LsJs5KexnwBA1mZofIEeVyazu+jA0CA5pZdGwjC3E8b
	+/F/WrKZ4nCIknbXTuoTDvXZ078ZiVUqVngZGNMzTg7o9eB6zYtmZ6gfLodn1GB7LQ+hs2Fzpu8
	jCX+sUf+X0Hr5uvM+3saoj2Uq/xgN7nCKQkEUIs3TIqcnrvF/DmpMqMXaL2QHlOePftx+SmAvzW
	ED0WkDz41Rp1XCx6zOXs2laANO0nhsugWh6k+KGAZ0eBdynmxJQOg9tOcfNvcQPWW+klSa8lVO6
	9KPpIVeb+h6XTv1eyWn2ML4mzQlFkESmHJlrjQigP5B1R//X2myt4iLegtlUdOzk8tpmbr/HHN8
	mXWX3T40cXh29F4ogiHz5ZiXQZaXs+Gb/pCcAggxZ/r7dJRNFWEcXPeFGY3lKaWjrM8D4T6MnWv
	B4jpnMUQRjrv0bTSIqnSdIVFBx
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3989277137.15.1783463413211;
        Tue, 07 Jul 2026 15:30:13 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3989241137.15.1783463412532;
        Tue, 07 Jul 2026 15:30:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:59 +0300
Subject: [PATCH v6 16/18] media: iris: add Gen2 firmware support on the
 Agatti platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-16-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22246;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zHeESJo914XM1uL6hrl207gS+fGMj/RMmdiRzkbOsv4=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2qyktxi/yll5+ud5r633LUqp+QW3eu1vYO0
 lp60P+d3iSJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qgAKCRCLPIo+Aiko
 1U0gB/jZNcfGsF2Ow5T0yvnet3kQTRmApbJe534OboXO661XNokuzs8WZ/Bs+MzFr8CZzaQLj6H
 zDVrgGvgRpFFvlJ/YGYaASpuIqAaCa5SXFfuePg/neFS4KkULkgEZXaQecUPfWzEr6x6u0YTFte
 CUqGrFOWd7DAZaoTNp3UI/zuoNpuf8eJ+aD3CSSN8ZYnv1CK4aPWjVl0i3rJexzkyVoJVu8DAKZ
 GkNzXUncYM35w/yREF8sXK5YsJqujVo4D82f4wikQE2FopN6jw7qtTP2pC6MgmrEbPbtJmk9eoV
 32NGhJzx9PqgBrCFHantTbXB1340+QgQo3n6iSsd4aKCNHY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX1jm/UtEiKjlG
 /M/AJ4d8UhWxyKL/0/wqpKl09xCT52iLlhXTsVzeCbRGa6yIXCLowlHnvT6SKceSC/sCEMVpr3A
 c4d1Eb5RiZCl/i4xJl2hRwS2mAM/WOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXwiYHUhVd4/zV
 rF8lZEeij5Z1aBFVYJ+jsOLebJVf++YVNxRQrAgvLKQ43WZJ/Ml7QzNwIz+1m+KW1D7Hfr0REFr
 ilMKBHg+/fx8kQsMt7KMGFUhsfIn/BXePgrBqTfmRCfg4+ywd7gKdN0jbWIxXMP3tbCXJSyBMvx
 AXeI1AQUiGdMX+4WLHrqzvDfa0CAcl2qKbHMjVfNqxj22LqF2K+IEJ4Ie1u67RC59quc9gSEToS
 V7Sc11/z1FS8pG0ZTuGhgqsF1nowfe9uUVD4t1A6TwgzrFajbMzGBc8HhlLkvyOWoB93v7LxgrN
 K1KwJjKRIuVdeHxUwpFYofwkkWv3Zf4cd3j9gc6CjUbo56wIytJsnNKv+c9thaEJTV33ZyM6JTK
 xS1j/9HBSbPTInkCNauwuwDHLVFa+mPTcOKCnEG92XXxCHUYmrPMxOrhM8w5GaGjXSjZxwvhXDX
 iRoftpZzshaee70pqrg==
X-Proofpoint-GUID: rQycwFVOyVhaymIynJqqWSQReG7J-BWu
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7df6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GUEZgOuAT4xZVSXxJacA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: rQycwFVOyVhaymIynJqqWSQReG7J-BWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Agatti platform is using HFI Gen1 firmware, which is considered to be
legacy firmware branch. Follow the example of the SC7280 platform and
extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
this platform. Like HFI Gen1 this firmware doesn't have PIPE property
(but unlike Gen1 buffer sizes are calculated on the driver side).

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |   7 +
 3 files changed, 621 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..f89245269e8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1118,3 +1118,616 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_dec[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = POC,
+		.min = 0,
+		.max = 2,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
+	},
+	{
+		.cap_id = CODED_FRAMES,
+		.min = CODED_FRAMES_PROGRESSIVE,
+		.max = CODED_FRAMES_PROGRESSIVE,
+		.step_or_mask = 0,
+		.value = CODED_FRAMES_PROGRESSIVE,
+		.hfi_id = HFI_PROP_CODED_FRAMES,
+	},
+	{
+		.cap_id = BIT_DEPTH,
+		.min = BIT_DEPTH_8,
+		.max = BIT_DEPTH_8,
+		.step_or_mask = 1,
+		.value = BIT_DEPTH_8,
+		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	},
+	{
+		.cap_id = RAP_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen2,
+	},
+	{
+		.cap_id = PREPEND_SPSPPS_TO_IDR,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen2,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_peak_bitrate,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROP_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen2,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 2 * DEFAULT_FPS - 1,
+		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.hfi_id = HFI_PROP_CABAC_SESSION,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen2,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = I_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period_gen2,
+	},
+};
+
+static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+};
+
+const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+
+	.core_arch = VIDEO_ARCH_LX,
+
+	.inst_fw_caps_dec = inst_fw_cap_gen2_ar50lt_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
+	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index bc04831ae7fc..5afe395cc4a0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -57,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
+extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index d28ceeef9d61..c0527dd702b3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -19,6 +19,12 @@ const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
 	.fwname = "qcom/venus-6.0/venus.mbn",
 };
 
+const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_ar50lt_data,
+	.get_vpu_buffer_size = iris_vpu_ar50lt_gen2_buf_size,
+	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
+};
+
 static const u32 iris_fmts_ar50lt_dec[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
@@ -79,6 +85,7 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
 
 const struct iris_platform_data qcm2290_data = {
 	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
+	.firmware_desc_gen2 = &iris_vpu_ar50lt_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu_ar50lt_ops,
 	.icc_tbl = iris_icc_info_ar50lt,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),

-- 
2.47.3

