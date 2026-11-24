Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517678;
	b=TD5s0tgzid/bVAZJIed4o0sxH5H+78xTTkho08SzDMI4XkwENODUB4jKxTXLITb/3j4u
	 UGyvFHZQw2SBI1y1bPIc8JZ9a+p47HWFF4rbX5Mv3NdgOano8s81BOK1D/6xcRDK646Ow
	 RZ5/aFAxBEcW2GHOV0N4f1qUZatR3SkmdXjdtuOL+3muP0D/vAbEaYJNHZVOaTPwqSrSb
	 ddrX8Wi1hlGx4/NMfouDgRqgFYKzsGg1eT7akmQkMFUhY6Y/SvRKc1UmE+OM+SfToHYJV
	 9oi+DMR6gStHdczfQ/0Z1v8twAxUN0W4NJ0QlJ72RQrq96quyzPll6ut04KxVDqFMpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
	b=fyKNohFf8ZzwzyfV9y9mwqxClpzwsUuhDhH79Eo0U9QwwZNvmG/PFGKESn87mdpIksBT
	 TKc8yqqh6kKyJzL+kz+ij8AmjYkUSA0k7K+SW3gxb7i/AP1SpUa8G9wCyJHwyvRSpSUCQ
	 de9UMkvS+3boTQc/pHnB2vTh6bvU7Hl5G3YaDPCqh/HAHsCRW/IIgbPsN11JSpqjXtOaR
	 KHUhojbOf+GMMd/sAvzS9lkq01noL6gH3TUaDU0fgaFvW9Yd2ZzGO1WI8KsNfTCYIVfGF
	 6slHHYl1JvCtqjzbpbjNpAmSGJ2lzhGMGjw0xoYD8b5z4mOWYKvvBy1vpKlnUQ/t8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHhleDKg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/1Rq1C+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45554606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45554606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHhleDKg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/1Rq1C+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAfL7L2848219
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q
	8U9q6iSM=; b=bHhleDKgvopeEk/utmfUQ67VrrpLDtyA+GF/1l9oNQoeleg8g8/
	XPS34JS0Ojf2IN7sX6kCyY2KzMEUG1mbyoPmEsDTYU3ZxK5o7fr7+RnESyNgYSm0
	kdv75y0XuBjRrHl8PuxYcIjjONueEGdWvLzPJGXANZPMpzZlFVJ4XYUw6LnK01OK
	dPPmeTn6dk+4oNrWRrD1iN461Db4CeEX2Ff7n3UjV5A8CWfvV65TbiXYKzlqPQrg
	LzewDcn8nPXw8U4w/oKUF9vJlqbhVnvTv892S/12TkuVno+UFE8cdPK19VmVrYk/
	FepIqgxQZCUFBhBY9Qw066i8rYOsU5STUPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh984b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so4436719eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517677; x=1796122477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
        b=T/1Rq1C+GRUpkBNnUY7Msi07nwtlDtIazS2Ru+oY8qlD6YK7zBC7wfSZXcYMPxR8kh
         5RrVmC6zO2gNdHA/p/pAzft9yRPD8WCGXK/iLuzuxsJC/1YwPXH6RStl0k5qezLLbp3J
         +iHYF1hLm5JNE0yJbOMvstCBNe99BGzJTcD/RE6TBeGD0YcA9kW9g8SvRwBFsuFRfKjR
         7IH7XmHqlSq7uQSk4MaGFLF8mjU0yozHb7CELxp6Pa/tzFZ8lsFYEi8ox0lkxJcCBz0s
         ft9CZKbDaT7QMYGeziBQxRBOxwJDsTZQJYfFNaQboJ4RdsmODENSDIHun5jr0+SpQ9kk
         ZaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517677; x=1796122477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCq9AyrnUPb6wZIC4i+bwmGWAMp/EZK4G4q8U9q6iSM=;
        b=hHqG7+d4piRVyEEDKD7Wbv4YDie9/fKOmk/IG3Hfk8Z+pmvRsvfqsKHzwy60rU2Gge
         2oNBylA+SlLV4cJCUUhMUU2oi6xA87U1lE/vDsFq2udXBV0yXhNATl0GkNbYvk01M3LN
         FBYTLKRUuiQaf5L0XIQ6ggobjdWTjtou8jM+8oNx0p+b3UBsvea2QcErs5VaSYofSRJQ
         K8OiMzfKrTrWM8YHPGPov+Zq16YfO1QBh57YcJ4OPFaYIKL16brdlCMkKelY0HGfHVkw
         MByDsVdnO+UVhubpENSI1XsrOBwz15F3TeU7zShXoPs0egw6GN1aU6gnACaoXgX+Emdp
         RhLA==
X-Forwarded-Encrypted: i=1; AL+hErHHXXkqnsh9ojYDmCq6dMDJIjOzeV/7UPLJUdePzrnScR9d0vZQAeFkNR+NhUWnMEloUfSr4F96zBIG@vger.kernel.org
X-Gm-Message-State: APuU4Z/nRZx3C1Bx/k6GYvgtvukElmfSdd0wxoW4F/Q8N82oM8iemSOK
	m42ZQjoKcw36I2xlftQqlIkXaoZsKWRA40fK1RVR3iqpQicjcA6ocS3DJ54CfVagEGxOKAIb3d9
	XY6Z4DxPLiO1SD8fSm/PJhXM2qGq6gPAi7OMoPOLhqdtX+eXiA18eMCL/3+HakwfB
X-Gm-Gg: AZFdTZd3b/440S70IwhPOnIM4B03NoyJ6+YxFSqD62aj0Pio7JfQqi+RPb7HpAzZXsq
	Jx/E2GFVQQsHRC7XoZn/DSdqZ689gEdkSXIx2w5C+PBtHjyhUU5HhoP3ZSAr1TB0l2+581oiaNo
	WTbDhimb7oEe0347fuzyXGGwH6vrGmKtEsDPxu/JKj53h/M75tYuGDLqYqUkd6rwI6BDApwSCUE
	qM/uhf2AyBBrZFtnNSvIN9kTdErNwt4MBs6Q1z0JrkOEm+Zz/fdqcNZRaT8CPo2sCGnPKZy6tVW
	zNgq1antKew5PRdBDzbrlINmjmkRJytXbvkMHCrKwagHxJGTWkbNh/ykI6dKzM5rNCRvvO/SAid
	S0OWe4b6bt1vNzGmmAguV3heMjh1fD+0B8S4//J2xWGomqTjP/uUTY3nPOQlR/l0IdLqJL4onpv
	oYoTP08r8IRMm2P4hfe434/q+UcX68kKpvb1ekF5SqljDTbqZ98zcbYIU=
X-Received: by 2002:a05:7300:d205:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3856fe564a1mr14547506eec.23.1795517676922;
        Tue, 24 Nov 2026 02:54:36 -0800 (PST)
X-Received: by 2002:a05:7300:d205:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3856fe564a1mr14547443eec.23.1795517675449;
        Tue, 24 Nov 2026 02:54:35 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm55231578eec.5.2026.11.24.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:35 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document Seca TRNG
Date: Tue, 24 Nov 2026 16:24:26 +0530
Message-ID: <b13bc8fa6aac6e9164ce9ad0ab202d0df491331f.1795517666.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b056ced cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX41WVxeRRNknz
 EaM6d4pIigAbey/Imo+5lLoG8QUF1raV8sTm5u8JQmGdet+L+VtsTqQcMSGLzN0I4CPU+ymPjBV
 FLOx6JJNfPKX0yoM4dK3bf+/wM17qVo=
X-Proofpoint-GUID: Qi4BUQScwhPFiVbsO_RLT7YtPDvjTbGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1PiW4NoYnwIu
 iJRBKKrlhUST5Op9XKrgwbKJXdcXp9FNhdGo4b1IBF1Y/K1xdBJbjx5nYgTKASzhheKqX1qIvHU
 WL8OVD2uj/KmYXEoSJzaEw2OuqycjOxLDieMm+sDfnJLmqfLSyGJapo6oLe27wxU2COb6X3IGY/
 cXPhuX6AfBnJHhaAo2KxW6hepDWg71NvaMIVzv9+5xn7Q+nGlHtExIeSfVJZ7+MpPXccv23urNL
 fvXIkI64iPW5ic0/Rw2YqVjXSnK/JIx4KW+QBn90rRBzRx6PUUxLSHJmOU9y2yqoDvKwCQ8cLv5
 6TjqJaBjzb8ygdxLyTvio7+Q75E2VKYCcNqQOW/P50qT15tR9ibyneTHcgHXZbWeTmTbgk/hUas
 C7aXCVhgSaxO9v77EC2hogapCrTIC/+L5yicla/rEKGyU06m0Z3+ibhYtk3QS7TeX7D39lLEt2t
 K7w+qAz53eSk7cO2NeA==
X-Proofpoint-ORIG-GUID: Qi4BUQScwhPFiVbsO_RLT7YtPDvjTbGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-trng compatible string for the True Random Number
Generator on the Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index de323969fe64..cec847c52f8e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -31,6 +31,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,seca-trng
               - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

