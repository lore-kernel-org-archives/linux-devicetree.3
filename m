Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4833815D5
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376397; cv=none; b=KDsKRdZ8rVeOMLsTG8HyDN+ETju6KuX7cL0IIvcesATTXZ6UJLY4eMVNV/T52X+TjfXcTt8rfMQHtcrVxRdCOuDAyxYuw+UTUgVe2gSdyuvG7RZGLAmUZx5G5iGvTZtxXONZC+D/ZbqKhhfFZePcOG1uWyLNs4musO0SXL9B80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376397; c=relaxed/simple;
	bh=hwbEZ61VnK2nKsRjLCEmewXTb0y3Wzi0UBMhIY7quxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAWgLbpfGdrV4+DLlzCQNVrwCtxN175LXKASGQLZf1BimhSbBPV7+LwjZXLVgalrqYp/HiLaiy+RN8J919sKEmdzWGuJX2sKX/8oSM2alkOjcLf539fdT9zZU5m2yqucNeUPy9LEgdCUvmyOKJsD1P4XB/7dK/fyjAoZIdOzgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRdstDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuPc3+3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRdstDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuPc3+3J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IBa99N1651343
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=; b=ENRdstDcF+MXDYqo
	4/dfDGO6Ee0kpLWggE50hoYukMBjYjFfakv5Ym+RXiYybtVrCP7tgB8PjoGcuixv
	2GYrDfqOoey3MCum4j84poymRAhEVzruFq4f7QPHHeKjWhZfbOAUHJzKCNuGlPqn
	+i35HUdf6GbxcdGNJzgaVyXQTGr8BfAzikDB/Zriv+4WPne+CjDbXkWoQLzc7iis
	kW+xSsDNVFym+r5qnTRQ8N4vRcRI99KTwiQhMpDcrq9n3DeP4Z1gfs0JmNzx7DtN
	fp4uzjn3wvtCLtE2h/JttnJ82v80qmaa5zRxZxvHb+ZluoUzZ2M0GC4Er/LIEH0v
	sTmkZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aarq0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so154926955ad.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376391; x=1784981191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=;
        b=SuPc3+3JJ0iBedpC59HUt20D+Oll9F1+iMHgL35iMC1O06naUnGErlOCq9ejaE2hPT
         W5QFsl+Ad1G6rE3xkOnPdWTsVUO7O7hyv6JdLVdAAl3mVdPMURNlafjBqB97yskMyA0s
         5+toBVe+OHVi6nWcAVIdMh/Rw5K115bk5bCqL1DYuC9OuOZWnnD9/Ge7ljg3UR6+p052
         yfXaRL0MdScI+o4MVr+y+kIyU92JqGcFM2AlLotJCHTwENF17NYVjsyN2YjWzM+w0Imu
         ZAOQ5SSBQQ10JR4CplZ9lN6NO5yUReaePin2W9A6AP5aGi+IzMqOxZFzEM2xAb+mSpsP
         m+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376391; x=1784981191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=;
        b=aOzZu/EW+K/0S4qHPu7+PsVoh95Rtxcsg/1DIAw4TV6h1Y49AYHVTiyVUuxlWDVwi/
         o8ZWs0Yv3cyAwyV1Rv267UpTVWjpNo9EVtyFaHKqsNN6NMlOLNv4UycfIKhoh3a7k25B
         FCSAcxX+X0uZf0y1seqB8kRGmaPw54qa+UGCyc5vaEG1npu68zei7J73C74v37gLJDr0
         fB7+Xr8zMj+zQOvvw9NKoa/Dnbd97zRYdDDQJ4gLLolY12RXQI3yXcCcWqgSckPHMWDT
         08Uhy2QrtfJGMaf6WOE1Iuhfk9OV7tI+FAzRjbRYS/cMyISXcbdbAU1562j6l4MVnVKf
         +VHg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0+HzdtBUOXL/pX16eKvU18kjWj+ip3RodXckAXZk23Rp4ednvHn+GqDHhj3drW40dk500VXot2B1s@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7Nfs4cAHgFfbK/WV5GErT453UfYKS0cKf1IJYuIy22//AdwZ
	eWjZgHFtdac+mYW1rBxKHJljIUv8XpvNoQHwojneufLdiceMNSRIS8krIbdrALJUI5KsYAWXJSJ
	rvUfTgDDWSxOWu0W10BT9qEt3qBziNqmcimFEJf71v64H8aptcaw92yaGXBsNaiboXzWQTls7az
	4=
X-Gm-Gg: AfdE7cntwtJdFIxBrgbcKqx0ydB6StB37c+mcbTxBkM/EuCVuZoPyrwE3Pz6k7WXuuK
	OguvUCe9Sp62wNQZc8Onh5L6ynN0ph28prLYcZIvfvH79+O+ONdzx1vPJC44pStUIFWQiEEKIQC
	kjhxt9R0nouPncGrNYsuzSommJ2aBxfeKmJWMNlYOs8725LFlEshAwZaE9PRLt58tRkd1Z0SYGA
	piPvt4fVjorTnA8JInRc7bXSvc4pjamcydqLQUTwULvzuqjoCJ2LTRCnFm9tiTzycoEoRXQ3UoJ
	QtemjD+QJmYhvnp+ydg81mn4sQshYrOTHjMEC2S35l8FDciOF53RYh/Mk/KJKAqlSn6r+lIwbHQ
	QC9/7blCJGK/y6H+peW/L7gmEO9plMDEd2vdtcVMMIcFKwRqGP6FJ147pxKXlqJEx
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr7238300637.70.1784376390551;
        Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr7238247637.70.1784376390038;
        Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:25 -0700
Subject: [PATCH 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1077;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=hwbEZ61VnK2nKsRjLCEmewXTb0y3Wzi0UBMhIY7quxA=;
 b=g8UW8Dsic1c49ffwsKY4JRINpR2pyk3c9xaK3A6YqJK8OndCS7fTZr0RrRnPDccYjJ7EKX2RG
 d4OcWfT9DegCUw/BwkpMbVeJVaLsykRXuuVMlsFFZyV4fww4wls9icE
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: lafKMXDW6N343vPh5zGEEQFP1kf7v54k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfXz2L3S3u/30xt
 zHvYJnzmsLTTVDQ4D6svfI37nLTqXrh9dwMLYiaCWXShKGmLYoSV6G57HHLwIOlUVCt1uEGC+9Q
 aULgEV+m3Nu032kjItxilDn2FpH+P9o=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5b6c47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: lafKMXDW6N343vPh5zGEEQFP1kf7v54k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX2xWVax8HLQRa
 +1f2IhRswBvztbhoUXP6jFFwN1pXi8tAGTc1FnttL8YB6b317guDRBygzP4EReDKOHEmAHd7ilA
 HSKEo2AtUNCjTfcf7el1+JdfydywIU5m9enfIZqGxgpUBEcDvnOcsf2m0n6k/2Ddd082+WkVFkc
 /RA3l2z+GKNZdgqpEVKMGXee+fm05NzpgO6qsVSjhia90oQ1TeWRu5dpha66gBnAbPzC4edYJCs
 +0MLHKmP0UGjfIjrCKp+t2cxuPaj5DysMd19rXzLdKd3n3eNR2ISqAmvdzMgj73RfJu28C8uOt6
 Tny3098gAVN6DMW+ykVc3MsWL1Yo/EBiDAyCInZ22RPNsqDut/yVMmOPtk4dWACpjExg89qtEc8
 G3nw2xhMh7wYW0j0K6AivGal1k8MBWrGSsgDT5UJ4lWTMhSNGrdEj/NWUnPnWN+YowIw8ssd/Ah
 ci+ZFxBFZDDQKw0kXpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180122

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

