Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341302;
	b=h9V1zBGeIgsLtSwawQ7JhqaM0SKn3g38fIwkwEhlZm02BjYQL4JUdbNnN08l6EU19qro
	 kNgSKmzYtLkSviEPRPkwlGA3f5OQ8kDl4QClbjuBAzy2eZ25HerJaxmHruVkYxz8NrPcE
	 clP5a781kXljkdBUY/rOQ6rtPp9lC+Sntdj/FvK8AOaHsOqdV0hRx6PYb0No76YcWQlxx
	 NZzjxFEdjFFkbcGGGSYsiA2mYOp8a2+zWJsbhMqqVTW127JbshNkwMAUtvUtzmu6GgxNy
	 j7DDNmtLu0nZe3k1BCgeoQ0I1tFV8etOGkgjIe5cfl3C8IfrSNNqa8F2Gz0eWqSknKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=QOLDKhjm9mOZC2NvEm7tIj+raX++md1keEwXXAnnZf2y6t+b9aQxHuq+R7KV10G9uTMs
	 AjS4sVDXyV1fFIfqHO+hVmccfPaVnfGs18G3gc7wWgawv0MBUs0s/T+Z5kolYr1RMI7pN
	 3kb7pEUnI/08RzzFiy40p+3kGJx+Zg1jG79gzv1oSUxcfzoQuBz7VkLRMzG66T5VrTOeF
	 uv6yHXUBW0qMO6bldcM7m3zHYX/4n1hPvfPTdp3XUMewzq9Dn/8Jx4X7Bj3UlTRqZ0j2U
	 1TPR+1uitT/AEwrcWE4dowHqT2P2vxOdsevSHYYkE2pRMTl8Y9TGngeWRhRUJk/8MLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F2606A327
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B68F2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FaDi3345459
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=kJx0+RIWGjQOEL03
	Toy7PVs0f6x1xYEJwZ0EOGsCH6CNwd/JJcloH5e4EymGLPNKGU74VQ66qQaBVOEA
	Kh7i51CHb5lHJJ2qJmnu452UFF4nWRcS97Yx0KaLus/PQJKuvd23lfU+B0NeDnhM
	U9mqUEFpPoVd3vFtHdaGMFM36EqFH+PGfRzFNRRVDO3hjf67HVz7vk31HEpxkg8U
	ajWEw9+rwevQvbbAOVeoAdR0/4HhRhFB55jGHFQVBkoV37vrMXDJm+CNdRk9Xx6H
	YKIgLbDwhpdigevG/ve9r5GKXj9XO0zfsgF1uwBzQ3T/3H61sfEW38PqAKFfX5TB
	CUsMdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751g0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f84753b43so288203b3a.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341300; x=1793946100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=huTKyoB8SVjD2mVruikgIcnUiWxLX1ANhwSsWsJHzxZxei/AnLTSlrGNHn2PrY439M
         taOzCFJVltVipile48n+44oWCnFAEJJEAF8jfMKpqr6jSh5W4lpN4cDe7klYpH/4IP9o
         snPK8aXAing/zQeTj197DQagKJksMACjfkg81kK0ViD9+3m7x0pCxZw4IJl8nL7lQCmM
         BoqfB2d0qVzjAKyUcg2bVu9xDWwb8ZlESPpzLWjIyvP1MAQYK8mzn1S3enzlksddV/lk
         AaK0v5xZnhwG58lwGrPcIbkptRtx2yyge4TvkbZKJTTkOdbHXzUzIPZ3b8N5GIRSDc8e
         /lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341300; x=1793946100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=hNwQVDMgM/BRVJZx3sjn+T2OKFUsSofPafuF56k/mhlHBNI5Dcci6+CSUEN+7CQXq6
         rJ6fvHHsiPzPED7aKJ0x24/nbGKCVi05SSasYuxuuSA0mSn9AJpZnJph0gbOPVYRxQ+A
         m2VH5dirpFSTHPrNI3pki9MR9Pshja1uy1xOpsspH9ErosuXLuG9c9gULMWbUnBNjDGm
         QPg0DACGV12eaWDzyt063GufZapSlW/S/V8UWsHhYo4rDGE4cbI9ZdUfi3cplK1kLVYM
         tfzC3hBHQQ6oQNFQlJaByIAanCjjRn+7kOeHk+6DfW9fRYAL2g/zC0/JXafVV+EQ0ifh
         scPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMj5mkLdsyZVWDq1gYboz+WWEzCIY4+tRFrybD26Z0wIox3eEFlS0m7l8BB3ULw5CFV5eY1cixzmtb@vger.kernel.org
X-Gm-Message-State: AFq9FYL1P1zTWUpGemHwRMYQhe2M07a0QXUMIgIZq5KlLC4WLktxMh0U
	aqyz8MfwKdmkMJgUkEIKp6nj5EAilLXYZuK8X8aGQuo8XXundaFTe/yTLHz2ErrXrS8p53ODHNd
	nNiPLjhwcpRR7piHS7HdukkI5tKKOKf6D/Dj/Jo4g9zwWM4ifbk+p+ZqKgg5uWoj0
X-Gm-Gg: AYBFou1VofxIfJG3hbQkbkc0ojqwyk+X3xW0JOLRr9VcYPpEiDfPSNYrdHZlnkZ9zcc
	5FXcYnB+JfGw7P5gXxKgSXJTITPnR7dNInNAAdimnORXXXk1Y72s7EMuluTtEQhDnSmU2Bw1nMa
	vZuq5JTJiPab3qSTXzJbGP0ZB6Z1h/PX2mUaehQJGsVymdfEvZRV6tBAJ7WRcwA/cA4jKxzULqp
	SETqE9OJ3VmNnxQ2tJzp54SAGRbPKlHZUcPg506q9L5NVE/6quy82AzvogZQdKt4vM0oaxB7Oim
	U9vW/519/zsTndwjFjg7w7ir7XlV7a/EfWashK1zk+oZTnoOcdAJcaAyj5DBqBqSCvKckaZEEZY
	652WGrD6ooQ0hF3fH/3CU7rwr8xL4oTHDxd/pC9Ap1tSHbfvg6ZCrs28mdX+9LwP5RmM=
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209660b3a.18.1793341300176;
        Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209631b3a.18.1793341299712;
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:54 +0530
Subject: [PATCH v3 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=PZBL5PDBWrGF8v9vICz/rjOoHgZ6Sr5icUeqXHTWjYxJzByPsFzF6/rbxm9JMZk3v1bAT2wHn
 04OGor/UivlA3u5yQsBIIFIFv0xG6jW6KR8tYwNSq46Kl3TXiRZrUze
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: vyUGBYauOb_SHHVW3yo_HTTo8UIvrK_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX7NilC+uC/nC0
 Kh7odsy8zOv2EkEf4zTlFEdd63nvB1gFSozXIJSBEff9I3tt2oFOymcits5Yj/omOO0u9wTuJCP
 +aMN3VfP1z4VAhoEocAUHObRI0d42SnLMw1ourxcezt6U4PtMV86jHV2fdYnrA/LW6TtWWlFQ2S
 fpBwv1/72pTbndaBF24kaBJQllAOAcvkf0cBq2jxAhJ7NQI1B12ggwTStuqF5GritgAYPAjQDmf
 igeKR6JIfXXypzBYJhDmjE/4Q5GatP33qYofFo65fvPiugb4s9rPgsmz7JYSP3yFPxPLrRTDLkG
 XiBLhehotzaHWzvTca2YDhWOVrmbYAu+nh66CToUf0a7e9Xoul/TDU8JdSL+bLaVLy6tTxsAdW7
 VUtlWJR3WaeB8htDb/ZAz1dw7XL6B1f0+LSjBkcu29bFbYR2Q7oMavVrro+JHKmNysUcLfZUBbn
 S4IaFtSEnBFjOYYcPuw==
X-Proofpoint-ORIG-GUID: vyUGBYauOb_SHHVW3yo_HTTo8UIvrK_b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX4iJGUolmGqPv
 JJF419PAvMX611flDcHOp/QphAnHwxZthXudzMmb3Bcb/JeVQ+vAfooi/IcsD0yevIud1o/N8W2
 9V1uo6LweW85sLTWPcbijIWes34A6ek=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae43775 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

