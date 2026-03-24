Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F41A2389
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311071; cv=none; b=AMGwSH7tDNYsHvdUe0xEZZmkp6+dUb9bg46fKTNLlaHfFOd2YK5srJeny80MLbHvdZsffItizZ5mHG6xRWEtnElKVrY9FCujgNqXQ4kZFZVMBh6PaYLTFXhn3AKFJ/6HnmLCQs/55u2v/eB3o37qb5ZS1nIdqsICvRQVgcVN4EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311071; c=relaxed/simple;
	bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3DJZ65YMo1zva0uRZ3mtS8S4jxNyGvXLviOFXQ8jrzjCcHrWj0ZqnjLFsL++XLLGqFjQ4h3JEWmtF2w5w6eDbYCDmRP5QKNyVcHDzuq0UbbmYHmasOp2klXDgmNfYeeHuOHBtaRJ3JwCDhLLw5Cph8MY85lwN++FR1Yqye5AZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThwdjKXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCJp2ijR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThwdjKXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCJp2ijR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqk7n3817811
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=; b=ThwdjKXBIH/GM6v2
	+C4NShoWWmvh9MpwK8l4xrvr7GK3xfW00Ygs1ZcTXEB2g+/k+zeWyoao7lAUcxgq
	nlNBa2QlAZSAZnyiBp0rEd23/SaCBlwUjYOgcGIXZHdve2KBCvJZ/irnLtod9e4R
	op5xPPxkOHgfBN97JvvhQEfEG+89PxT7pXzKyS7X4omDTThhF0MB9XukfeRVUngS
	VkQFBg8fEfqh5PJHv87shVBDIzHx/r5FDJgdaY8zKB9hpxzsL7xr5vMfW1+eTzdM
	BK1Un54UdRnSu7vhv/PXxSAlh3xCthKYf/vcl+ZWOPOXXzcsX5dtcOtGHPuu2SZZ
	qY6djQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w2ae9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso194378001cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311068; x=1774915868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=XCJp2ijRDYBvEr+BG2Hp88dY5SerPrH/IjL0E/aaLCWa7X1juCfuBqd9dHWsB/Kr4d
         dIOx/8LMz75ivNLq5PI+bJS2As50wbTvtxojTsm8kDbxj1MvNwnF5LREDBmxlyi8K4gF
         paypQlwHloPCu5WaqLt6mLvD1oLCySgXS2jjFgKc2Ca5n+W91EXjQTbKk3mPLYtB4y5Q
         uJJqaB5xHNz1VGDMwnW/LuZl65S8ET4taPaXKe42bbibfGoNmsV+a36uxFfnjdYg5FHC
         uASlPsVY+yqHTIghxA6TqqFg+3OBsFD5CyOVkmwvxolG67D4tucVgOacBDTH0PB7+muy
         m31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311068; x=1774915868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=X+0ENvjyUlmYeVP7zt/eD8YG+f+cHGpYHorypfbOd4lCxk2j0kxaAcIB+VoI6x7sXh
         PrbZHMJNoX7MnwDCPjfHlfmK0TiBohif241BzOQdKBjg2FwWzTswIxor/sfvgqaAuPOx
         6xObBefB0GpbR7CpX8wqWHDlKsofX+9r9TGQi5XnKcmvFU2xDUpNTbdPA6Xs1p7j+Lcp
         O8yj9GjkYkPO4U5laMqsAZP++v5jv8/cyuIdHm8yZN1iwTvEbxZYRxp4biSFzyGws2Do
         C7lWn7+pcuQsNs6Mds4vyJKS5WhjwdXj0ydHg7H7aI1mvltOrF7G/8zf9AqmkKqaNkD5
         FpvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLUinC7fIPuoSZ8+rTuQWMe7OKKMXh4NGz5NJUrKyhN8wYyYcc8KPuKg4yEOQJYGnsBbE+RSxiRTd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bIllkS6EcOEd2bauu+WzKlLCnjfxampJ8gfIDudxOyumfXTY
	QcWu3ELP95lYIcfSCjYqwNEQeRvem8gvaGy0B6Cd8yGL00itYr+bjNV06neOmTqFOgD5FsfSOt9
	d9vG94cdlY3QJnN7dPvFO1ociqHcjQx697nFsY8+ks8Zoe8RqWCUv7rCVk1elccyL
X-Gm-Gg: ATEYQzxP5LBbxYanLgbHbI6SKbbcxdqi4PQKxWPeVLNsQDGFo3dkX58KNOs0rB611tQ
	OJwlE4QSK/udUzhZgPGnTWijE6KEu3t5QfNgw0u+eloOpIhKxheCSOoqt0NS2GWC148Yf82O0TP
	lHUSm7CX92udGiF+Buyu+NTH/dKIgsZm7JyfO+a/sHkRXG+sjrnDyE433NBvxiGxWKbIhEmNvsO
	r/z9pDc3xgAzKU2z6iiKSQvqjO0C/vYSydwTQuROK+KCL8+KY8V8hBg7Ymk1a4S3h2ftuW3Yqty
	w2OMlW3oSTk/7lge21mt3lHj/mo00Os/UT/NH9FI+1dAKWzDfesgzmiCYEhbH4tKTHiImUURbN3
	mMe/RN6TPOTJzkwIDqlxcQXBC/fRvEWjQMBtgiLNwFWQjgl7wNNwM/IFrfooNvjQiby9LnWnlXp
	27SJt0fNj/DFu3Wu91792BKlpxcBdXC7gV4x0=
X-Received: by 2002:a05:622a:52:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50b37d57012mr217685041cf.27.1774311068113;
        Mon, 23 Mar 2026 17:11:08 -0700 (PDT)
X-Received: by 2002:a05:622a:52:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50b37d57012mr217684641cf.27.1774311067603;
        Mon, 23 Mar 2026 17:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:40 +0200
Subject: [PATCH v2 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaH77+a++fkvnb2TtgevMk5sQdGw4+5k7KMF
 Nc4XWzaAOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhwAKCRCLPIo+Aiko
 1WJHB/9wSxBxhVz1fPRLOcC/xcSgPP5OUjSpZNUqcIoNgsFYJJVUpapM9V9tq81MBYE78b70QkO
 zAntNoKcp9Sykwx/wZx2LxbFM0uOlk2nIRsqreqTZgkcR4Q+ODtym8bdR7l2E98eLT/c5Ahpiql
 sBubAL6kzWhVxDd66Hs4zeaEfv5Hi4jPgLyXiXLCaHkFBhpNfg39vhat44hcV0O1peBL1r/6EIo
 VDQvlJveKlkr8GcS7U7pthywqWS2k9XEe95+6QGj4nLTqwfTX9aejWB4BIktOdbuadA5VTB8NyI
 b4eyt75resKVvjidTc2MedmJLjaz6tIIBxhYQZOutPWFFYox
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1d69c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6pvQaZlX7ZpTHHZizXIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: am5ACHoWTmij1mTMPotB--SqcUZV32Wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXzUdKSeF5EwAl
 VwPuE1ogUB0EdRY4IjzqipVpp2GEvYAiyicuhMEB9NqzP9VioScf2ADerr0R8LpARVYHxX/4HfI
 Wf0KnuoKbALBR/YH7Qkt72wv/7TKC1JaKhxNbE+g5P5nmqLtx83KzHi7Xa2DoAqQCnVvApoaQfi
 YwD5+A8fsJ1SHHp7vOzeCjV9wlxTFxRzl57iB7XLQl5HcYaqdLHyVzhatA+KpEvLqub7c1uHcmQ
 bCvoorLECPKdJShT5MErTVatHn+V5rWXZuoVFpHjn6+hw082errwX8Cvs6pLSTLG8HXCD/WLftW
 5U7P7QZx39mN9PWCQAB25UL/5eLdAa6adwDDkmDn40TR3GGwOeqOJTK1ypsMO95vdZ/XrMlYstc
 GyNhHw49EcN1LbkWQMIr8Sv+GzShLjrLTb2iNrpodf1Nr2rOIZUJsAryXaqgxwhgftYiJWd0Q2V
 MIBZ/jTnzyqkb73eCSg==
X-Proofpoint-GUID: am5ACHoWTmij1mTMPotB--SqcUZV32Wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000

MSM8974 requires a separate get_bw callback, since on that platform
increasing the clock rate for some of the NoCs during boot may lead to
hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
msm8974: Don't boost the NoC rate during boot").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 1 +
 drivers/interconnect/qcom/icc-rpm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ea1042d38128..aec2f84cd56f 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -553,6 +553,7 @@ int qnoc_probe(struct platform_device *pdev)
 	provider->aggregate = qcom_icc_bw_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
 	provider->data = data;
+	provider->get_bw = desc->get_bw;
 
 	icc_provider_init(provider);
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 3366531f66fc..cbf0a365839d 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -135,6 +135,7 @@ struct qcom_icc_desc {
 	unsigned int qos_offset;
 	u16 ab_coeff;
 	u16 ib_coeff;
+	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
 };
 
 /* Valid for all bus types */

-- 
2.47.3

