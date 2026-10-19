Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697D544084
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419182; cv=none; b=Wt8/a/GtShFX+LCjon+pnb4EkRw6rfn7+TxaKwLLh8yW46QVxL6BWr2OMUEaVWSOPVZEkSJHO+wAVql7oKo8rV7PKD301ezk3B3HHj3okYpa9MxRsYjyYn4sUOYsegqmHPpOlvsH9Rj9OQiIFXqBxCJiUAWP6p856357vr7fp+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419182; c=relaxed/simple;
	bh=4evihIn0bxYc63GN9wtAllcv7hZd50BO23q7/zc5e48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+cNoBlrgv4xI5c9f19fsb84BxrVrCG1DPiO3kC+Zx8ulRHtI20dTfJxaKWCIUqdsoovAlw8FktLFEz2T1guPJV0aWMuE7/sVQmNc597YUb/41qo/Ggp2xjBgulxWw2pj/aojW/d2srIZGvgQkOHYB1g2yefVeK0utbdr1/7kUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VU83J1dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5lCiOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VU83J1dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5lCiOc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE07vu3485384
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=; b=VU83J1dgHrtZ5lK7
	NUT+WvVVFlySonV6oqM2NCK61qBB7XJGgFaLfwjpp8eo+Wvne4Lh1yroXBMTotVg
	QL8OPH/BM5o4+jf4qPpEv8ZUdlj13ZmS3Zk3GMKYUG+kUA1uS7+ksyo//aACxi3+
	ctsa5CQJTk+SuIOFNdORTX/rSTIFieAL+CkEtp6fIMnztjgXlK11uWLgxYR3qgF5
	efItTDI5yrYbh8+9i8adyk4h7lfA4H8AugRI39ymz1xDGSZJXE9v2RfhyWvY8RDk
	5nj0ZO9NzfROT/rEP6dR1kXbpT8umGvnwzudOyxzyJSdDN18h0rpn7cjVU52YLma
	BshKjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hhr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:12:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so525543785a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419179; x=1793023979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=Ur5lCiOc3ATy9dPGIrY5boTXr13h1+rFsPUP1A9+T6BuMDxKgGtXywp/zKSmsCmEuW
         Bw9S9ZJaB+3L4kWUNd7pT7xqUVqmxd0gZqcvlP8GiowSUemd/GNCDnKN1u4rFvYX/cpi
         aOFdRxbYiErKxuQGexC7g+0e6xWXpYSf3niT2rcx8wsNZaFEv5KArA4kUC5tZwOZ40eP
         Xw22SAAFg1fOx8mt+2wlYWej3ZkeZwUxy3mI4F68w4xNRxph8ccM94MmXN4h0hHDfBpK
         aK/pSy5Tdse1XPWolln7DIxeNqwcf5DRA6Ha7MHop03Cdppk0+RUwORPzDistyX6DWln
         DGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419179; x=1793023979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=lTHe9ZbkTUUat4P8WdMpGbcCv8gtU6rHE+C2WzrY2YfuQJs5tC+t0nUqWSEiXIrlZy
         UR4vFfYeSfBjaf2+4yp5GRxknF0nFD3uKyXEoZ0+cN/PGYC2Ie5Dzltub1W+e2Zj/xeU
         TMIcnCOv/UR0zgcsOv+xXLxzRPmlxg4PtbZm7Qf4IO4PRCcBQeCP2KqGquqqeopGKiGz
         ZNPAeRf/GbpGC7cr4g3L/e/6zlFVeTok93f9GZpukLzDljhPsen4FieTCrtiIlxlUPb9
         LuqKOX2EtRhSSdXMaSYAKsXL6caRjJIV4Cg/JAa9VsHWfl2Y1vq60obWj1V2KwtCkWq8
         4fAQ==
X-Forwarded-Encrypted: i=1; AKwUvByfStFEv4J/8hlF/8tQhBaXWZpeHitmYn7zR8kI7Q24i5V1pO73Zzit/Jr9t1DjS+sk47zSOtdXnz0G@vger.kernel.org
X-Gm-Message-State: AFq9FYI/VvptTonpv57ZFpsa9pyVOQY2V9I8IAiIh8XuB6UBKwrtEF3c
	AJ33sm7C/z4Vl7sp+RxUm2IJiKfyMlX8+9+TDv70D5mh9dZ2oiJJCzbApKXE1cSv6fmaX3DqWur
	vLePZIHlJIKDQxxgY545CI4xst+wrWp2BQlDV7SQMo+Wt95AIqn6nr8xbytp3klGt
X-Gm-Gg: AYBFou1d48tKN5uRuUYJzIChMixrPK8J2/v1ofyAer4loJ6w6Un5nijiw15wntG+W9y
	j41aSQ6/+GUc80JwL6oJraHG6Fvn6rDMd/QIcZFNv6GoHdb0FsU5/ICzOmtzUQxCuajJiXrtFtn
	detN4E1LrNmKXBJ80Fu0G03IFzr7YfeeS8mXuaQA5sKU4PetbmjI3cHzgQCuild6eikxbbnnRQy
	Nc86xw3YUUYTtfag6jGQmWsLuPcZXj2GzzHtEyhp69aHkk4Yz8OYNh021jW27xt7rV0HWm2kiVY
	bVDocgBXMdcpm10oe6GjWHK4phMILSaumOu0kg/KH5vnjeQgDwoq4f4JAvCxlmpIsYUSIvEKluD
	JBNa6xGpNRugmtL/9lIrCM4m9zGnQ5nxP+WcdkbBk9MpBOIVH3gi8GaCT5479+KLaR+A/RPKrPD
	dF2XQQweocgSjZ
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213845985a.30.1792419179206;
        Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213839785a.30.1792419178603;
        Mon, 19 Oct 2026 07:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:40 +0300
Subject: [PATCH 2/8] soc: qcom: smd-rpm: Handle zero-length errors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-2-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FlXx0Df31B57IuZnrZTPHJb3Vqd4TKJsFeozt5W+WzM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVfEts7JDn9h1Zeppli16gelEutWsW1DQk0v
 j3ZDi9UG+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlXwAKCRCLPIo+Aiko
 1RppCACQqFAKdIN4mv7EkhRGPMsQzpnv8AESfhKraF7PSwebpe9pFTPEMXFr3rSc7EibVfDq/6h
 njJ1SJbVgwIXbWCI2aCBv+3/GiBLgwm7kdV5ZDuUQ7/ktbaX3NvpnOLj7yYrXgzOwRLW0LlU3Cl
 1zGsJ40L8qc8iUUdC8UfE+LRfNvyS9pOyXJ/jMIE7pMl0J666Ulu8pr81/yoAyyKwBgfYZJjpdq
 /U2T9epu98qDN3mb2wT0g2Kn31eDKYxjEU1rqvTUEp4exQWl4qlMaeHwgCzvKCl2isKBcCXRVOQ
 RjEy5PNFMeOQhLjjf71gISMRwAizsOgUw46OF6aG6PjtUwzr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX/i5mJ1252upg
 BCmjGGqB+B1lAASP5VAUGl/Mk41gEOyK4H2afC3HQUupWmmkSPPYY3V5OJg/A9hh9B5IuCEsxbO
 AgcavhH9PERCx9rEI0WE0ANMj5v/45gQA+eqh8plV4vBGbhLw644dIqEViwj8PCrnxFsQ8AsEmH
 IFmm1iJXdXl3lWwLs6cdWnXHfd4kYB0D2Ii81eCCM1itprI4l6v9OSVzxqPk3Z03Zk7ZGqzRp2G
 WmRJo+2QzTjDE5GqKSCkIkjMY/3/DrAY1LueKnHGMnA29PEj1IgYb43W2uOhTBKdFjYnXq2MXVk
 VnzwS2boah4jJkrapbk0ijBzGYdq7mydDVJ/VNqSkyAiDsNGaonnRL+JDnFFoeeZmJlrHKOaWpI
 Ejaq0SiEwGT5AnDI3AfzFGGlTJ4jPIyyZI8cdQqFPUuP5wkzV1Pch1JyiNFu7N5X8bIrh223xs+
 Aeow7uQ+VjGuyCiI1Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX+IGK4OpNuyV/
 LZOfki8kUv/gw/09iVMwLprvVMbV1dzkQLmXH7xYNFg50IZtb4yWgR5Y4sj9KE5R4SgyarvCnoo
 MHX6Pbw2NCvD68IiG1KcL456R3BCaxE=
X-Proofpoint-ORIG-GUID: HHNsotjKhXm5K_2qw7l8AWlZ8bPMwYTz
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad6256b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CuedHqBScD5EtFMGVU8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HHNsotjKhXm5K_2qw7l8AWlZ8bPMwYTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Prevent a potential underflow as the code below uses 'ALIGN(n, 4) - 1'
as an index into an array. For n=0, that ends up as '-1U'.

Fixes: 936f14cf4e67 ("soc: qcom: Driver for the Qualcomm RPM over SMD")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[db: report the empty error as -EINVAL instead of a success]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index f2b3e02abdf1..3677c645edfa 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -173,6 +173,12 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 		case RPM_MSG_TYPE_MSG_ID:
 			break;
 		case RPM_MSG_TYPE_ERR:
+			if (!msg_length) {
+				dev_err(&rpdev->dev, "Got unknown RPM error\n");
+				status = -EINVAL;
+				break;
+			}
+
 			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
 			memcpy_fromio(msgbuf, msg->message, len);
 			msgbuf[len - 1] = 0;

-- 
2.47.3

