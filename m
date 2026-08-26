Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BA35E1D9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752555; cv=none; b=NN/Jkhcq4VOSCrT9v4gN9OYtQoGAR+Fm9v3yLCgxofnlQo1kQ1a4O6QqZUKQ1cR8EvwPgiyAhO8V48RmXsPpPf+9AZPB7BuYle0ZqFmaIVH/WcM5GpN+OdNnICaxiU/Y4WCihy7pEn/avK31fBI/o7D2+NzjihS6iunJZYLITa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752555; c=relaxed/simple;
	bh=otEHI81H4WDn9tOnr9Q2d2YY3f98Ld2GqVk/KVLqC6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsEjQx6KVzYJSyBT5hVXmz5nyJoGcHC4J3d94jZoaND07XoKj5cJ5KttoLe/b7un3nTzNPBXHDr4FX6aU878//l3Y3xJGPvIWXB2TIuxqDL7V8M7EDJoQJgXV0VWSLPrjMJF5DH+3HBi5Bmd8iZr45tFxQ+iyd8+l3rZTKKH7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/jGLp5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIcNo6lF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/jGLp5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIcNo6lF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDHeh71617726
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H8h1GEu+Qlj
	UORh54PMZRj2icU0G1P+PhnZ9VWrNixE=; b=Q/jGLp5YlEK12a8Ol8D8SQCFtVj
	DMn7XQMrrURdSTog6SmesX5WQAitGQPJ41ovWo1P+tOIrWTfVIM1ochF7ZwRBMlK
	1sV1LdgP+DJHvv/NqN+5dkmZut+Ju75oqaeHybtbRQ9hXH4k71obCkPIOhpcYKGI
	QPrkM6IaPAMT9OBF2fYNo/a1JrzemuytGaELCv3AN5cEgC6H5hCrB+MKTVf77AOs
	FwDOaNyjsygwlgnWE5b16oZrYcVJcnlq+axzjxLmr3fQFj3mnwBuyl/yW1SgRiTW
	qLrGIHK3Bd+8NVOwIZwkYICvcuY6UXUSCk/TIpq9MsitOI4hOmeBjJBbaQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbr54b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1635277a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752552; x=1788357352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=RIcNo6lFWgjqZC+GPgr1KEAPj7rTnzNmJ9Kb7WRcVvK247cTzQr2ouuXJl1lfJMfOz
         HIYidTVd5NN+xMHFgMTheR/OO7QG6cQqJoh+mwEF7FIeFhVtDZxeR5EtHATy7EE5H+jC
         EhcF5PaUUBlG5/oTIksWhcNPLQi0Jo47RHK5ncxaTM5jvflpROnjmwraxEUQzULt2qed
         ELiyYdfaAzEhnyfbn7tY7/rwgkbN95TfaWE5hrwlBk9KKuKL/lqtbqXAS6dqnM6ICubN
         9LADFFe3u5yXrxhglEgyx3h9QNKAbi6e9Wg0Zdyn34kfmZLd94FPxqES6jnTregWZpU0
         tHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752552; x=1788357352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=hRiQSxZ/ckanvDZcB9BsardvgHPIis3aMejdTE/gmuEm7dWxev592jgTaZRheqU+4c
         nqhLs6ud3KhkcYiW7YgLYmrp+OZm6bTwxU/Wa1Tm7nhx0a71sHGgewMB+aDoe963R2Ax
         /WDJdbGXNNz4CAdcr/nIhJLPKbQj4WIiGsBPsyW0XlEGPqkn8lGSDkH6ZsHhTWrsOnIe
         CN1Vv6VfnL/DkPweM1MHS3Y327s/V/Z9yW6n5lO16eQS2vi6KTM2i9JzrM3ChA4k9PG2
         5P46Go6w9mn+X4i9w/1Jn+TLz1F+Rck9IdB4/kEQr6aywbiLgELMlBH1OUFOuR5hxI3h
         gDMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrf0U5AQ8dVXBZMa/6d3fRQluOx3HXtSt5T0aveQ8qyIgKH+x3CluCltR44YDhWQRqtClfqOsOPqYmX@vger.kernel.org
X-Gm-Message-State: AFuF++nXQxMLUdtKb8gIJWzD9s6LVEWO8KqqjyeWkfwwtXcZzWgh5HSE
	y1uX2uWoV2PFNnOsLB9YInscaBfDcuJOwAq78wND7/u58/pSLSV1vTKnm5MnUGBswc50cxVMOql
	panyh9HWTyvdOndKtskPxDW75D9EwYq9xbjvc93VO8ddf+ZDAMLTm+iUD11U3ql3h
X-Gm-Gg: AR+sD10FHIwRsbidNsk/VERP/MA+BXxh+dTpmshBw6Rqd4hEtKFZv8sE7vhsRK/GIOk
	fDNLkaekYKpIYph++BNBqy/N3T1zKisvd+Esbklwh6p2ShdGzAL1V7cjhHrXMY/j2oQ4FFW91fE
	cvSLYxz7HOXPXusJEfjdveFZQ1cJX1c3jWpV0QY/eUNGUfNm8lQEJ1DqPtjfQzozTSb+B7oqTKz
	zLl/2qCQiUebLrWCEOz3I/5q2tQoKSi5IdcXkqz/Nkx1GyAzJuBNDDf4WuT/pQmZtNQwaiC4XgI
	Zsha5GAz1YuiuzwnE80a71X23j1RvGwPcczUBowDBWUqS2FUnpAmkYYjB1RuBiWIb2ZVFBomlkW
	TlRnhns8j27pNmoWsKLbxrG6GlGq2oWlyEXP9hG1JyUdWhyiJYto2WT6bzxq1
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr15615181a91.2.1787752551509;
        Wed, 26 Aug 2026 06:55:51 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr15614990a91.2.1787752550699;
        Wed, 26 Aug 2026 06:55:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
Date: Wed, 26 Aug 2026 21:54:53 +0800
Message-ID: <20260826135454.658615-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PAJRKTZPp06jF78Wx0jUd9aM9fB3eXPI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX7j2omoFRj9MT
 LznRV9Z1Rzv3qYhGpqHdy3zvX4qEwhnNOKSJ8i2HynzJkZ033MlJRWt2ZwVn0EcNRguzGpU5SrL
 GWdt0vKEQu/97P6seuRDfZjBVRfpqoI=
X-Proofpoint-GUID: PAJRKTZPp06jF78Wx0jUd9aM9fB3eXPI
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ef068 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8T9gEdC4W5p8owDaN-wA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX6I1E87vobib4
 Ugsxr7Zv88AuTW15ubpwZbs1lSHEINU4VNYHGtPT8R5P2kKRIuBFyb7J+qxAlCSavMEYUq1hO3i
 kDvfU+Wk2sR/EW1vAxltas6LS12EsTsmZoGs7IBlGpeHXc1VkKFPDcyr1vKJjC0CD3f+Wycb9Z+
 KgK6Adp8grABleH/bWvGa3u9K+mIGmx1nqgUqx6Xdub/plw4oJZ7ZJm6MGVnYUQeUL0WmLYPGfh
 m2/c4UKVOtQ93eGB9DrDiH4ZUIxaMEsDrT2A4BPQpT1aEdWfcrIIgeyF0FG4mbU3WUp/ScYJEUw
 VvVJVJdw9VOhBC246YMJ5ret+tosiysTUQ3j4lJC5aeno+pKvutqnw31tF83YPJ2KstBgXvK9yF
 UYI+497eqzHcbhJtKlDZRL3uWIGszMA4MhVK4OwpWWUCDAgZl1Jhy0Yk7pgGGWO8SeHGw7G615x
 diaKI0tfc8NlHzzGSgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260115

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Nord routes the NSP (compute DSP) memory rail through a dedicated NMXC
resource instead of the shared MX rail. Add the index so device trees can
reference it.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 07bd2a7b0150..92c8408dbc57 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -32,6 +32,7 @@
 #define RPMHPD_GBX		22
 #define RPMHPD_NSP3		23
 #define RPMHPD_GFX1		24
+#define RPMHPD_NMXC		25
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0

