Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F431A570
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652179; cv=none; b=aEmo397ra1DDSEya5VcZwyqJCHsW/13wwgDM2V/MGma4wPT6DV4nCrpI4dmzLWprlMwOLVqGR/bEXws8TzHcHAEFnikiNWFiG28GBGbCDbTvNnlSe5nfCfjebrPMFeCEtxmjn8NoJh5TRNDt6mL3aBfj6u+TtIqWf2HLY4VqrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652179; c=relaxed/simple;
	bh=mjrd/5WRTtizVxAileTEcsI3Pcwm5BCTvACtsLVlxwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUaCo0+DJoX39ZyVu1KOdXdo0K7whwVqS3VBDl8Sf1Ct7jnKu1UPH9dLU8U33YFc03gC9zYvIuUCGoiLvtSeoSIPd/WtZruTZqt0Q9B+jHxasyDfKrAuqEhn5Shnke3/4fK8inJ7J3zpHxPUQsxYOMxfxqte+/8PIH4UjqoGXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LogcTLjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCrai2zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LogcTLjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCrai2zR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O0mfWE2394143
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=; b=LogcTLjlntl1XNsc
	yeqnh5YMUmrxODxq2K4HIRtiksiDZITDHIaGV2J4t9Y5hap7R8JTPgzE3/3zh847
	okoZWGj2T9vhrc4E1t7DDHPjAV9Xw2dJ1xIRthgqd4vV3bRQby6E938tsdcBswku
	ir4Gxrq29FQpejJkxccMOevias7ggrockSi12sM/dZPoLXzxoglSNDJFuIlE6Tgw
	bGW6ISeYds2l74VCrjo6qMGtao0qos+n1jWCpYGoxreIQXi6N7s8wLMooTXSCqiC
	uxLeeVi71KUXy9+d2WZyTQGScNJEkF3eQFU0nDDaDf39lrJRuM6SwdVdRjRwsEdx
	1bIK5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3bvde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so7695424a91.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652172; x=1780256972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=XCrai2zRaSx7adJ2I4QNQkfKAXwE71GguAkz9Df19yG9l1i/Gs6HYX6mg5nproqaxU
         72WHgDwn+PUdKdmjETF3YvwEAO+vu9cifWUBYk4OPUXn+uqjQlAwoglMLcq7OSvvA5Ta
         M6CwTpmplkSOxnhtLXRwAmXaxA339WIDg9H+4OsWR0fN2lFy6MZQpjboybQsZJtQTPPE
         0lnqQglccMCWvvPjv9gkJueJMQ6F9fPJEqynM6QG6CFfaPNdCEzSFrg408HPyLLh2Acv
         5KHmg9Ef8UWdi/xnnHqhHsht8I9fsQitgeS9EBfMvqOjpqV7cautkmSIe+gs4q4AKpXd
         zhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652172; x=1780256972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=hyZs+oC5tzZzjf+mq0mwuDtCiPyBhx3mR+BUQ4b3vFjMuSi93F8XqNUxwBdDVZGwiR
         r9gYVn957uZJ5SKUb+B2Kc+w2RJGy82YDGsBxtO7RMGkGzHuuzbm93n/XNtRD1BhIKJ5
         bfBFeQQ1G2QHXBl07prSlSZOoy7FIQvL0b4SVxYGpCz4qAWbwxf85WV0xIcP84a9yTMo
         ZdcoLEfRef2tzHNXel8w6NTaQ8DijZv6DGn3xHZqtGdFSMoZnFTqpYJrj6wgVxEuz8bN
         2PESF665vJaG5DU/F3rkfYxsJ6DnqkKALGrLf5ASt59a7Eh+ECbiC9AKcklxuuorkUuA
         ulTg==
X-Forwarded-Encrypted: i=1; AFNElJ/UkNfNKfXuICddqeHPjrNJLSPFNHSbka6GPRnwlGu3KkNk22P49MLFhClt30BZTi862GBnw6QMvAgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLb2kehOx49swQyTLghKyHZXvIoQLAGyAgDUGllkF2WM3MpRmd
	1QFZIE6ZhAj4lHS5c2txM3C0HBbtrH1bjwFA1R/Ly721wMZa4CWYq4twiq5JqCWsoVOy4f32mcC
	5KHz9/GZKWLMpx+wPBZk2P5vfb14tHqXz+3PxaSpw1i0DpgP8DukK2CjAHrlGXWkN
X-Gm-Gg: Acq92OHZGi3nNigYpOTx0Q4KBfLjLQnCJ7chqt+A+RdcfhuzEynHEQgEjik27YhxG6i
	GJ4fPqUQNcwxGEE2m7SF90cEhpQW923sNxHcZBP5NUxzjpV2cjPGqSuoChANYtV718gVDijk2kV
	puDQVDuA6/V75OXPqdI6lfPTm6TwSFIIBFrmlzf1bm0luaxfXjlQnVD5cTiWsrWHKPHik0/0kMW
	l45kUDjex6xvNm6utLCWfEwnvHuWWQB4/2QS0p3TGkCZu8YkZIkxVlWm+wlMyeDgQR5JLUN9dIR
	RxPsaPVb8jy7Z1ojo3Dv57TPmpTtprsEiMuSBC+aiFnRiE0UmTUE8XsdKUPaU2PBpkVIPwEsFup
	LP3xi2bVDwVb/1X1xqUS5hZdi8++subhysVYW
X-Received: by 2002:a17:90b:3bc6:b0:368:7327:6326 with SMTP id 98e67ed59e1d1-36a6741ecbamr12524823a91.1.1779652172276;
        Sun, 24 May 2026 12:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc6:b0:368:7327:6326 with SMTP id 98e67ed59e1d1-36a6741ecbamr12524797a91.1.1779652171688;
        Sun, 24 May 2026 12:49:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:05 +0530
Subject: [PATCH 01/16] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-1-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=857;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JRwNa7gj/V38SNuXulP2MlFnweDp961hhJdbueICCwE=;
 b=SJMty0KWOEX6DjZ0a71oPFOwID0hjCec2SeHsUbInB/1OE7qDGKizj3oNha3YZZH6bSMaZrvj
 cv5jqYpiPCUA39iEcakFA60bKj9Q/JudQ/Ojlo5t0q16s0LLJdA+U+k
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: yIr1p-MXtBlg-8GpdfwTNAlP0Q3EJJ5i
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13564d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jyTGefxJr8I4-3Pae4IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXyqbaPlI03gyY
 P8Zl9jiHuVvhbB+JHDwE+ZLbx37zna5/q05iQx6U/Bu5pmGRRq6kMySTQCirqoJo3faBOXfgFR7
 Nxlq1eoHncJ3ZAAwpw+ReuQgc5s3XL9sjk5r2Y2uGIv9fE9K7vEStSEbEpttFYwXMUpqiWBOi6N
 rSBHOD2C5d7Yu5vWhegz6rbtQ3eBnxx4WeZ9CI/a+Zph/lviF2YzkvcLIe9ncnXVvsZ3a/istaP
 1uB+iqM1oaI6hxOu3yeInmA84ustMVQP7dHvXyhjhsWVTZg6EVFepa/t4qDM5XIrUDTNxcs8pi1
 cn8F/zJPQ9IkIMAuag/ZO8lICip5C7sLkbHtav3aCS4PUEldoPWLns627Xq/JTzAgJ4VfyhXaSM
 jHX0AXqk26wpF6QduQ1quXFJ/DKjaTKhbQe6Oyxk+nO9HJEHXMRj4IirF6jCg+k06Molw8+Wy+Y
 L82b5KcP0aBROJ+6bPA==
X-Proofpoint-GUID: yIr1p-MXtBlg-8GpdfwTNAlP0Q3EJJ5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1

