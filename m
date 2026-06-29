Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF23A4274
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715524; cv=none; b=AV48JMLvxcZMZxPQ5PPHKcwdktvAOtyXzbo68CpIrOXaiynt5TS/O68gbchef3o92mAdFrsHLHoqvGyJgRmub/zCmFj65zpZA/koOIE1ukMkTy+xzofwkHJz2hB71y3gHrM+YvLmlgiDEprUyWMlOxK5ssj49vBwMqsUN87UVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715524; c=relaxed/simple;
	bh=kk1qLiHbm9kGC88siDX2uJHWpbpOShI7URZ6J+nyVZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tmhjsYab8aby6e7Mn7tLb4Pr7h6q0SWhZ3S+MIY3DD1zsttQ4r51ExFCFgLDqAZelFMfFPXErgeXuQhFF06rkDDyFhwD0JoLb2lCUKSRXbYj3jv5AX1KKqbqSFzk/8xIjbWlTU3coBt7BjEWH6JsQSQ4/62xqmQX/TyD9zqhNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPcT5U6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AthzSxBd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPcT5U6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AthzSxBd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NNfF1766933
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8PdsckrsHW27B6ZB1p1bQm
	yhKvBOYA3Ngl87ZlyvU+8=; b=JPcT5U6YG2SwN6sUZGm8skqWqL/y7rwEVvNqtZ
	d354V9KRm3+fdLFC+6Y9ZNGJHE+t1Q1mqpJGXn9LzXjbFM9BcfJuVUPH20NBgBwJ
	jkMoXyRgV5TLu8vHoTxtetfWJyv557++4sRKOVeDhJ79r0t0FYYzoy6Sbhv8xuF7
	e526fJXJooakrCEV55MIaV1A+nt6Ng68FthhWl/EmcLaqBs4DH4VTmVcdvPNUwZ+
	imh3gAZIe/AXWgDKygiQigk0XhZiwa4mkEIwAb8o2bhJu3y1TXpywkQjfhtxuBFO
	J3D1oWHEBE9f5q/lC7elj37ZD+mT0h64h/n0jv753eXnbIXA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a540k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ed53abff8so333531eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715521; x=1783320321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PdsckrsHW27B6ZB1p1bQmyhKvBOYA3Ngl87ZlyvU+8=;
        b=AthzSxBdyDYUUu5D/Pf8ptDyhYj7X/LweERe1JjxHWGjUHJBp91RaoQwX47pCjjpP8
         n0EqRysUzat2MP0UTDfFMFnAUBxSxuOwlRCYmsJPcZSbduarTZIMRq88jgWswbAg+lyp
         ZCpo5E22ubAeMPOPzWFuGYyiMCC2CDGjn4XtF30gvznwN+MqElyYl2Lovt53wgMe5bqI
         hxUcgQLLNmwcgBFu2evuEvpFPGTXcrxTmRadI2qOXOc/yLHfEK0z66ISFuJcM5Op6YYm
         fG9eZ3uSOicyWkE+8V0+h/9a34ulgN+jnd9PMa5o8zLJYcHciaULbhHslPpFb2cgzjQP
         9k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715521; x=1783320321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PdsckrsHW27B6ZB1p1bQmyhKvBOYA3Ngl87ZlyvU+8=;
        b=MSorMCtodQ7EQSY53xBHDmyii5MIrBBrX7QcaqsxmFvmhnVp7yvMcmO72ojufoxKVN
         FXVE6nkLvtRJGVebGhGcg5lnirSivpTMt8HdVdLcdQjZdmAEnb/Hv2OLWLqiXff2hmRi
         Zy5J3d+P8Jt134kG+2RcBPrQvBQhkQPK8pqOA/Gmn2TesxsaEESrvIhgPrqPkzfj5Q2L
         ywg4JDN1DwTLK2YOcwAHkGS5rxOTq/Nez0XT3YnIOyVdN/5w2Zb9MxS0fO0cUFBFlILR
         Jy/8ScIrv3kk6tg4z3qxaQ8klb7XIGQaAiRHjpuImTrt6/k+/9nyxJsQwa+jkC3bsO3T
         q6Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqvOZnBmCxc99x7bLfvfMtRWowmZrM8s7bxShF4+5ExTfArmskNVSl8ONMF1cYnXGsAsQAmSrVdzDmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQxJINTPKCSnIcz54D6zR+jw+y3kWm+Qxo4PauESeN1QB6Ia1
	7TfJZw3ap0dpa3NLAr5ltxLrPFwhUkHyEL4X9SBEhanWkKz4XHgljkoTh74wvFL4Rn8zFAxoCS0
	O7xHrhg8hdFR6vqujOu6cW/z1G/vZwknxxm3I+QOkhut3bg2vQjbwSukZ5G+OiwVP
X-Gm-Gg: AfdE7cn5mDaQTvGEDNIYqitp3U3ZUt/wc3V1cL94cflhBgPUlU5Un5lUwEzgYfaI1qy
	tGffFutlOhH9u33v5V+CePIyYpI9ZOVD8Nta7FUo7TaszQ7CbFz2HjP5WSzZPp50UTyKXRsxwYG
	5MGZ62rJOJ+3J1JG6/5qhocN190Xtgk6Ry5z0/vfpMVgXm/9TKa97vUUN1vbuPD6aMr5tF9bowa
	8xZneCdDL8Ghh3EdBKG4jJxGjnnj6jBPvgRass4nn8za1xgOJfmRziiZAVQW/tuCdD711br4/R+
	Mu6yAKzAormRpBn0aFImh9BYyoSfbn+qBXbCTPNj0vsrFZxQf3WCC3lAUZB8eWQcpZX8zRaUThP
	rvZVUuNS1lOzUEv2WaM9s3K1V2fRVJMmcSGolDG8n6tzhZgboDKjRaP+ARd0Rhw==
X-Received: by 2002:a05:7300:503:b0:30c:a943:ea14 with SMTP id 5a478bee46e88-30ca943f3d5mr10942272eec.2.1782715521012;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
X-Received: by 2002:a05:7300:503:b0:30c:a943:ea14 with SMTP id 5a478bee46e88-30ca943f3d5mr10942233eec.2.1782715520350;
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings: crypto: Add Qualcomm Maili crypto
 support
Date: Sun, 28 Jun 2026 23:44:34 -0700
Message-Id: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIUQmoC/3WNwQqDMBBEf0X23EgSMNae+h/FwxqTuqBGs1Yq4
 r83eu9l4MHMmx3YRXIMj2yH6FZiCmMCfcvAdji+naA2MWipjTSyEgNST8LGbVqCKFqjtDe6Qus
 hTaboPH0v3atO3CA70UQcbXdKkuB+1jriJcTtOl3VWf7jX5WQQvqiLFtfGDTqGZjz+YO9DcOQp
 4D6OI4fgChNmsYAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=987;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kk1qLiHbm9kGC88siDX2uJHWpbpOShI7URZ6J+nyVZk=;
 b=MhAbpbKRo7Zykw6jlz0gqg10926e4hrk6nA1uGswCGHP91EWYV+4HPlWpGir/87RD3v+ZBp2T
 OEXjZkgSya8CoSLiJOwKJjFudKrgaf3MEKZWSJOa4UQ6tS5/Z5iDffN
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX6Tylfhirn3t+
 Cse7WtSHnilQDVgPjO0W9/phXdfTMlRu4Pcb9FeeVqijqEMFCf6+v5aoJu1y7RGxnfZZz6/nx6k
 gnqH2imOSwVy9iHYeQpiJTaiHUUNH6RWlcHObQinDoyKNhIWkCaRlf7RIsjbNvItSB1KDedZBL3
 LInh3W0a7eJVR7Y5xm+J9BiWYfNsFF9R2EnWo+qJZodOWz/3oiedX1nq7L7lKXvNmdam66XS5vH
 W7WyMxNL+LZL9UnJAtHkzl1IPsleSVJ/wyh89gZxQqR23gONwM3UDuiIcaGKAsGa/IrtpYle6CS
 cVlI3vYuaysgJgunDC0+LgQSJecj+2V5wafkjoO68CvLpR/cvAfLtVNf4K964NfGNvvWpr8FnCD
 48d6SZ6g0LUMCfeFa4I+TsyCTALlo2zgQ1wn9F6gPKWov+P+ArE7sHZqsM0JcBpmcJ20JB10sK+
 LgDwdUoK+XQpuWSQdzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX6EhL4F2HnW2l
 0O6oVY7a2yc+Vv+6n7T0g7QoToghWiMiX2Hj0tF5S0FsE6Kx41LeT1x4UoxgnTxGEKDdR/OY5o7
 bzaZA7SmItDVR282tfU5fH9wchW61II=
X-Proofpoint-GUID: mxiRSnKguXrmThjRQEAmL1kbDR7LCeBj
X-Proofpoint-ORIG-GUID: mxiRSnKguXrmThjRQEAmL1kbDR7LCeBj
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a421481 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R6wdMziQwWSI7NrRmIEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

Add crypto(ICE and TRNG) dt-binding support for Qualcomm upcoming Maili
SoC. Meanwhile fix the power-domain and clk missing on Hawi.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- add power-domain and clk constraint
- add acked-by tag
- Link to v1: https://lore.kernel.org/r/20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com

---
Jingyi Wang (3):
      dt-bindings: crypto: qcom,prng: Document Maili TRNG
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Maili ICE
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk on Hawi

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml          | 3 +++
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml                | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-maili-crypto-5d612f629acf

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

