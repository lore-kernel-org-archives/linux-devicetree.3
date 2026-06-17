Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E133C5855
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683323; cv=none; b=b47/d+43DxG+syOzum3/N8OmE65nII7HOnJ/xm7ingvtSEXoCN2lkB9Jm0R80O4SLh1Jdo7ZH7I0I723Yeww86NFz/cvGuHGakoJiKfle9FUhEbnV2Ev26pEyFLdc6ZI5GN0UYobEQuvqkVnLt5mmZzxLrgXnZZtikNPfoYAqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683323; c=relaxed/simple;
	bh=oa3HYSodztA2zZt5YrjFAdkccu/0sKAQUh+l+7i5hKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZd/h1mewOGBgs9+4vB2LWBcbfzwEWlMkxKzKIkCAqtQVxmEnYfHHp2yRERUxE4D2n1VQEkdKjS1fO14G3wl2SnyWA8zyM2aiH1AUhxFzvASHvkegcL8XW0Hyx60hWKgDH2ACtey+0VlS5TXuj7zTJQ9XBrN45jIJ9/Pitr2B7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBOA+idh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTcvdpid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBOA+idh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTcvdpid"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H6JhAQ738309
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Tw
	t01kN6hE=; b=QBOA+idhbLucMQTWsvKsYivubrnqYyvW+Tlpz+lFiJicXRlCEbz
	ekYgUozhsflQX9pD2At2ueCEK1IDVlycA+eMjHVM//PEDtC3J0L7nkbrdNbwUSdI
	GvS2xV+b+7A9Ro3lXXTeYkKFX7JT0m3GUOQFM0GVw+Byk+G6Rkf7XeL2yr0UUaoh
	Wta3wfZAA0+u30p4WOhxQ5mzHhQZEmTdqqPZN7Cmgmo0gy0P4Kdct3A9HxnPt1jv
	xpyUfhjf6tF4uC6tnOSBaQwJKeHbJpGKunmeGaX7Wq4KGsPz4JnBiqoVvHB84LmN
	aofUm5reKNTm4XCH9Miz5t2rOVTFiMszLbw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesj44s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:01:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so188525a91.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781683315; x=1782288115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Twt01kN6hE=;
        b=OTcvdpidgbi0k711uYgLqktRwpoMeL26mhL5KyWfAixml+6KfzutmawfX8zrr7kV1H
         cPGLYNuZiarqF4855C4Ml/JemOGNsgyQ+8aDZ3USsXxwu417KhWfj+BbzGFqaQlgriB5
         hBCcgmsvZT4ucnbLjJGkbXI8BN/FoLLKVIe4pzzuisHtsfafM1k09zRnp5emcI6+iItL
         awqYq0gDPXBAY503J52n4EqWK6G3fEABrplHmeiYGtIZTN8Ykipu3thTGXwnojDy6Gcg
         HvdWNaWxxPaM4TOPJkqNeIjgXUFJ0Wl8cMR+04kXjILh67wsEg4UZzb3s6xz5V+k8sRb
         Yf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683315; x=1782288115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Twt01kN6hE=;
        b=hO8gC2UyDy2o2iq2GkfpzYUPJyYFKPHoI21luQ8mf0kFGrMZLS8ma2vh98sDyxI4E3
         /AvpXc6DZ+2Bee0TWrzmu+tAuv5XorsbWnGxQlR/E2If7DRyYDUsD4e8Oe+PZuIdCqwQ
         Ek+IEZLverYhKLtIdEY9a4hYU/2QFbQd2pU2gauOo+Kv/2Wiz4l2Q9eaOKd+r/d8cI6q
         jebtq3MXbyCoPruj9mi1k4Kd4k0R5tHNJ+O8+7o4fbW0yOBK6Xour59AjAKqrX29o8ce
         hd19Prui3WJKGTRvs5qHfsQWSMB2W7Wkm0z8+FlUW0370jGHJ3Q84Lua98xi7xWI8NQH
         J8BA==
X-Forwarded-Encrypted: i=1; AFNElJ/htr99JGJVr7uLKjWdbSOcy4KF6WSJMs06aPCagxVuc0s27qJYCt3L77jdA+VHNx+B+A7yd1SiSFj0@vger.kernel.org
X-Gm-Message-State: AOJu0YxDU6TChT9vaHoqiIS32vYP9f5Myarso9bFOJjXJaHcw/XmiOwN
	qpL02moYyY4z+00CMPNKaU5zs8GaiAd4puYcrN4Xozza6UepIvL1vPW/5g8Bqoj+j9StR8OVxtu
	JBtxedE8rSdmnxmxwWrNkzJn/bijQ1sCCPtud8r4BXQ5aDM71ovENnqjRM7ugeoFg
X-Gm-Gg: AfdE7ckFxL5j4WMpDaHihUmVwoTOQFitlFTWgDl5e96YRwVHvEei3tMvXBNN1X118NP
	s8+hyxPmwzD585N+NC5uyxi+/9BZ/ThB86dY2zlZiHeiT1y4iKzEAgz3PPEmeSLjoFj+7lePG9J
	8OwxbSutll2gZ09lqIsB+ddJ7ivINZlfqPbFgJ8xJa9cC4OLbX5/gjr+qXn4eW2tB8mF5xvgvb5
	0EHRuFrnUC4QYPoV9Wj4iFU9gL8KruqQ+2Y6QLA8Q96IZQE2IvSZ+5IlGb4XSKYHD7ADWq5bNF2
	sNomcf7HtKJHjoaSFD4qyCuCAc2V/YJafBQMVMC8US5FEwH0SgBBKYMJfvVA+sXxnKl5TuPerBu
	HFEyEcoAmhStjBINZE9LjKvM+rHalxVMe1m+NtA==
X-Received: by 2002:a17:90b:5708:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37c9425eef8mr2941908a91.20.1781683315189;
        Wed, 17 Jun 2026 01:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37c9425eef8mr2941858a91.20.1781683314650;
        Wed, 17 Jun 2026 01:01:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae7dcsm6520972a91.2.2026.06.17.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:01:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
Date: Wed, 17 Jun 2026 13:31:47 +0530
Message-ID: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfXy5udnM8ND03E
 tW4HCt5oaRV9buFthmI445uHG2G6ztPq3HNDwzvQIH4DrFX32yZLquP5TIwKYnxTtvOKHWnN75p
 7bQPx6XWIuWege3joS7V+GfOfewmCqn5RRNebVWpG5RCTccLuO7Cc/QX+VHfCfmZDMu4sxLIY2S
 gTeTrw71VbAggKm9RDHHcyBJolJrQOm5UGwFbPFs3zZy7x5WEIY/lckNtMDvG3FcMLCec5iNInd
 4Ya7eoh6vvi7SGQkqNEnP0bpSQRi/ffmgOTaUfcFhGIJS0n5H9P9lZmg0S0D16lf3x8103K/muP
 thHw20w+ZFyHNa2qsO2pFQdh/oIkk23qe+HpJCXATdJGqq28D58rQ0CHJVZTh3ar4AMdCPuL2zQ
 31ofOcJFc3i5vCpQ304vYjM7uYMkIY7a7H2Z2TgP+snCWGWeIFsCgYjPId94JE83fypVI3ahSB9
 5/82CBajg4lQadjRFSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfX6RSU2YO4pC+H
 9Fm+5jYpYAWnbjbmhPJ5AGAcu3OUs/x23OqKUoXMsd0eCo7MwnyBAEN26PCdWfCHAzPDpGB0dHf
 ZIiecyHQF/OZDMZ+a3B+/V0WFvocE0s=
X-Proofpoint-ORIG-GUID: b9ho_79fBSOVsjEymONbd018bCbH1lTm
X-Proofpoint-GUID: b9ho_79fBSOVsjEymONbd018bCbH1lTm
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a325474 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=il2g-N3IprqvI5tJ1rUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170074

Document the Qualcomm Hawi SoC binding and the boards which use it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf6bdded81d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -371,6 +371,11 @@ properties:
               - qcom,ipq9650-rdp488
           - const: qcom,ipq9650
 
+      - items:
+          - enum:
+              - qcom,hawi-mtp
+          - const: qcom,hawi
+
       - items:
           - enum:
               - qcom,kaanapali-mtp
-- 
2.53.0

