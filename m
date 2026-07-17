Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E03E7176
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282329; cv=none; b=RD+G6Ic83GM4w1ZdWess2NMiMVwfVOsKfVizq6T3F/bRrTgI4hMIcz/ujbJAcItBh10SJW4eDwy849N7G8IlV+sz1G0g1ckXEfC/jdVDiJTU94jBJViwZsNpnC4pZTKg5qgLUlZ/V8KKIBfW/1yJkmoMqETfOy52/rzSvuaRDyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282329; c=relaxed/simple;
	bh=3+7H0KM7b3GCDElOGl9jlYjs8r5xlY0/JVR0gENvQG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLV0ZoIhJnpZp75cRYaOZNZPlbga2ttXhLJzKf8jPnGzQmfS/r9fAI2ieWcowzkGstWvB8E8tMhrfgmP99/DUx6TlcKhKw8l8/7BeUT/C7HDuWdQ+YDJbO8GIBbDaiVTi8qdQhYTzbIYaJje3n17FFC1ugvAENcFOVGHaytRjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsrsmOJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRPs8FMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsrsmOJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRPs8FMU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHj82098532
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rHwgU4bJuDw
	LyN0I2lr2dORoG/+b5/ihZjySSIbII/U=; b=KsrsmOJXHJ+zWC4ycVLKgVReP+2
	dOflN4kwDkcZ/XSxcWvuWqfH+n1apdDVXrOeQKGiNVKFONa2l38dNuo5k/4HM/8A
	glOm0W5GX4fW4Leb1cHrkLaUwvtspaIGf2QaLnzvQU0YzI22En2jk5bQ+AOOMEHT
	wBVKw3f7cEVuB5XRDiVtE0+IugLi8K/72WH5Jt5ax1Qf6+SFFP5nx8drQWkjfeBH
	j0TcjSOmfEfVpPN8reG1iLqZZU2nVg3a3eLIFW9MoYpMRorm5S6fZ0KVAuKsHbU9
	GItawNkldJFuLG0C51AILopy9KQv+evfq9cRRl9+NpLUnKgjqJ4QgdKGb+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k5pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so11572944a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282325; x=1784887125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHwgU4bJuDwLyN0I2lr2dORoG/+b5/ihZjySSIbII/U=;
        b=fRPs8FMUVuvdk9kXtVXRTy9KQ0cgrXbkTstQ6OrN4W8oT2/P4IdoHt7S3VD1JByxss
         lfITsQi2+9tTVNW56Aj9FVUpcnM1dzdI6DBGdOWphUWXTuZReGtdXsStJRDOeK987N8n
         L5RJ/cSze9hOn3zJ5//sf7fr8lQmsIBLCtej7X3GpkopERupBwIf+UefrQAunYsOT0UP
         G2wzEQR77cOnc/d+l6UtuJf8HHGzAGygOyzCvJWVxiwL9koIA+ybahgtcB9T5025jPAv
         HFAvADM/S7neVDuYLezIVogCK15q8omaBvYQIdD5VIKWV5Y0fpBlONi7zzXrtqhWJ51k
         6klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282325; x=1784887125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHwgU4bJuDwLyN0I2lr2dORoG/+b5/ihZjySSIbII/U=;
        b=neFJtQXUB3tLE+WfMtulir+dyzGxiCb4JHD2tF9U06E366qDrcQXxEI/BTf4IPdllq
         PCD5rBgo2esOGAYAu2M7XtWmD426Z4fNDo3XY047vYiFmxccahTp91OEzU6BBZoRE3BS
         d1D9fmW/ggtBCx1fbnSo5Di9iXufmWoWRIJgUaEzZ0VL4DAdXUafsiW6v2Z7ZC5AR65k
         eRrBbugaBBek2JTlWmsZdKw+NVa2eaxvUY1d17wpx4tNPZRER100nSz/SMHQyA5e+Mvi
         e7ka4cbCEO0lb7eEAKdcCAqXFepWLwku5an2BnU/tx05OVjTm3tOfat4CF2S2JjB7TMn
         VBRg==
X-Forwarded-Encrypted: i=1; AHgh+RopGZAW0roI8yRSf0DJgZ/dyr4Ddbew7mA3Kta5i+CYfJ2MKSK9GHtUp6ZnnRaboRhYpvqQ4kEDr/Tt@vger.kernel.org
X-Gm-Message-State: AOJu0YycdBe/ZuucnBSx41o4pF10WOyn0nl7PSUE4sSIfsg1HwQhXx7W
	cesJ2DtEZD6AwlbuoWFTu6g3BMSMC/h/Cr8EQ9vHrSPq7YFhmxr9i8Y/IV8kAJra2NtycEhMRPY
	SVySn7Ut+9rM1HOaYfS1B+F7MQFQrYc5aWCIkLkskpmlGrkHG21YEbaNJQzJ0YlYf
X-Gm-Gg: AfdE7ck7uZ+6x5Ks6aCVBqhgTBByGH0j2gF5dISnaXxmYr4GHe1IUOmCjlkPXRrskPT
	rwxg3KLGtAtHE49+uk6yLH5LUbbTH9UKvELo/GvJpvHPLiIt8pxtONwi49V6uNrFsFAPeeB8Q+Q
	3rqlgjlnY+jvmQCSJpF7OUZTEgVxpUQLOd2CW+8Yub2DKaniDl2DB3T+gPnJVAqPs98FfvX4/yX
	heXcaYn6rPANbEhbdCKiCkf7sdvG0ax/olhRy9R3ba7CSEMe1EfuLpf3oWNHPYBcSyd5SfYF0Sx
	sCHxdaiXzFBXwgcovgNyGAYeWrCfBK3vAWtchTmzHBPwzm66r5Lzk4+tdp15JBkuMDPbY6tjRak
	FLCBUNdFcK20BKUx4/dCb7vNndB0FlAPKskwE
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736761a91.6.1784282324584;
        Fri, 17 Jul 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736734a91.6.1784282324108;
        Fri, 17 Jul 2026 02:58:44 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:43 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,pas-common: allow up to 3 iommus
Date: Fri, 17 Jul 2026 15:28:23 +0530
Message-Id: <20260717095825.3962666-2-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX8w+t+TR8nEyC
 mEfFCuLAoY1FkoViKB4DwKQh96waXVF9/xdunFdhmGQJ3wxuiX/Eh/kbr4lPjvH6g/b1tmvui78
 IiCo/LWvuXfdzbSPkhv9w8dRr1vqSPNDIh9f0LCl2O9uZHFp4iiE4LLXUJRZ0l4zeN5shEm31JU
 Nh3IMPntl+PrwCiRyJBybCQwgge7YGRrrNTtGOvNB47SxvBiay499Xpdc9usvkZ/l3qQY2fcKOP
 59ReSQ0S6JYyF86hxJBbsjJid0oyacwQvN9tMvAK2fwYPxyNWJmy5vbJ+eU/bYSJl57Tl6hEhe4
 iBHc+5pYtAJrsOWOcBEDOmDtBTkksaf9rKXP03n5RBBINphjrrOVx9Uifz8wB/lZ+eakp7FGlna
 HGE1fbOG/b12gwEWFvgpeLGUL7qqsBST7AWK4uM7ST9gQNjqiNsZ3g47onXXGXvTb3OAWZaDl2Z
 4UzYorqaonW5ichSVdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX8vubEIGkl6Eb
 2sD6Fv3qWq5JPgPySYQIZKoO8dem2naWKFUMYiaQi52S8Q1wIxAlMDZez1+QI4ZKQu1GSkWPa/v
 Sghdx0jzK9uElORKaOckDujkV/Bo3bM=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59fcd5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7cYE88sQBSXScjUnM7gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: k54UDOZiGL01JMQtHVGE-_pR9KZnS2vs
X-Proofpoint-ORIG-GUID: k54UDOZiGL01JMQtHVGE-_pR9KZnS2vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

The ADSP PAS on several Qualcomm SoCs (e.g. SA8775P/lemans, QCS8300,
Monaco) needs more than a single SMMU stream ID for the audio ML
(machine-learning) offload use case. In addition to the primary
ADSP stream ID, the DSP/SPF issues DMA transactions through extra
stream IDs that are not covered by the existing single-entry mapping.

Relax the iommus constraint to allow between 1 and 3 entries so the
additional ML offload stream IDs can be described, fixing dtb_check
schema violations on device trees that add them.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 11faf655f530..fb656bda8527 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -33,7 +33,8 @@ properties:
     maxItems: 6
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   power-domains:
     minItems: 1
-- 
2.34.1

