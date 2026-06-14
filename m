Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B923C4E9
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472801; cv=none; b=CFg9epFSpujCXvxPrvpsYqKGIiTTXVdkNl4JsmlOKpwk2Wsv8ve98wc6rPGCabaGC0urXLLnqpHEv3CFrSATMjntcjXsqKCmXm23w55A//6VOBIZJBwziiLjsX2fAY7csXmYtNVgCSqiudLZ76UrnU8kCtdgQzdk9yVou2XtaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472801; c=relaxed/simple;
	bh=FouFj+iYJhzcqR59XAa2/WxqzLLfYvt1re4RY7l+JLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGlt5vTlK6B+TFtoJcu6K/JGH5B0CSd+51WnGqKaTebgWOBGI1aJ/IZlZG/qqmpf/Vp/DeNvv/l1XhSN07OrkuoqE1Tp5p03rXCS8iYqUUK05dANOApqPUXhIynEZ0glZTEZ8J30aU7tVkQ8K/PPXvYBE2hAvy9MCj4ey409Rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZVvZP6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccDi8dr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZVvZP6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccDi8dr9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEnWO2753107
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=kZVvZP6VJrKoSNV7
	LKhWeEnDvy8IowCzIt6/hmnwStxg4uCjdN1GlRDOcsPizXajLUvfCBEdbhYJR5ut
	bWBXM/xGfnVx8JP3CVlt48QKCcU0uI5nCar9ZL/AUh1ImXT6vzSZ1exCyc/gNLgA
	FaBJeKjOdHlqowWqZF03bGMYMziZmq7WqJ2bVZcE2L34vo+p4gJjRBFT94FtlxBu
	3QgMvuOhG61la6WPdSzn0KK3/7vM2sgfuBprK1zPpE+qZqNKAaZJOYRDqgEiyrZV
	Gxb/jUlrN7AlSEZjIQqv55kFWmJwHOOxQ405eb9mMaRSCr0p+skAWRSbClUnGwou
	9KtT7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6vm2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so42242605ad.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472798; x=1782077598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=ccDi8dr9lYAzGOx4rJQJtSCkpqbOQ8iO93vsche/KufeqQce/3yIBzbkftkZQBQCwD
         bj4mk0CKdERXASl+0bkvKifWmYo3KzzjLJIOpCs+ytp6Dc8/4n8hfy918xTDjC9Bzbzh
         XxLdYa27zZwWTcuIb2MqtkMccKYux7m0qIplNfXT7/OJ78O3vEQsZQQbnMYdNODobl3M
         1pdgI9aD3tuE7MVVQp3dQfBCQy4OE7hCwENAE8c4Ee7HwVP7dE3MjIQwEyG2chGBrGSJ
         y0qI43GvRnUzzPFbgaXOeVvo09PFxYb9ZGBl0HqMamAwv3SWUZziqQo9aR0I2cOyitYi
         aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472798; x=1782077598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=MWavILAObb1M1cyyoQMGywqPTHNmi6qxUmK579dcexjltEVZF3X0QsJJh2N3+BQWoA
         3QY9wbT+CIcqZdQosQO7m6nvYRujpP2b++fNnZ/kRVAxI4owRxtX4WoPNUW/TPglTnCb
         G+zCKv5GBfVa8DgfFlzth1ITSiLbMBBWiGhiA4TweK4JbqV9flQNpJ7BioB56NeSpOoQ
         q35zJ49X8qI2TM0qIb60CtCUz4p/J+eYlBieNViJhjIv7EnU03/3Bz6GsOlDujXRO6Zd
         9NQJqRRXesie1wboXRbVWTe7kffArvHciKrd+Tx7p9WktaZgeFsdIoGxBkxbj5N0yG83
         kwSg==
X-Forwarded-Encrypted: i=1; AFNElJ8sDuu/vRaCKxq9XWe8e5E0AoOntz/PmlkCt0LiBAaTmZrMYPcRTD/phorgDUu99ofFXQFuSR9TjkAe@vger.kernel.org
X-Gm-Message-State: AOJu0YyU6J6JT8u7hNMfdh/jbc/Q2rUoo9JNuHQQCy/iE2TtGsLjAXnH
	KMverOl9yyf2tjg0+PL34Dnr9RmyE1FEj/29g2g3hTfoTCwAA2Af8CCBRtfPwzxn4BFgdE43HKp
	B2UvqX7o2YXMHpEvTFvqoWuOwn0VaAmBuulKmUWGnqoJWATIu/h6c1n5nP029uQJ5
X-Gm-Gg: Acq92OGl4wDUcuDjwcKbv13Q24xxgUDcm6ShI/1pXvCqI3ZIf+rK+VZ4bz1Aq3VaRTH
	MxOVMKtNt/2bHvb0tPCAkjxndMTeSrb0WmYQOF8NoUnl19rFmTcXQ0kiBrS7K1S3/F6ZAVQQSdB
	E0VVsMoo66/Jd5jSU3Cipqq2xQkIQZcZZNx21tSqYDK8LDWbUZpOH7v8NEFnwmalZ1tjW5msOtw
	7hxwUB4frTDL8F/W0dvO1n2QPhN23p7n+0xPHRH3eBfet4lXZJimQRi6Yhd8n/Zi/UoewR8pmYp
	O2LKYzevwq8XHJ6bmBR0GYLNK6Z77NSnQniqO/9hmwZ2gohtgvxhb/bKoC5hbvpfIwZ8xEQBebf
	JxSUN6QbYtSnw6j6fsXinIPSd5FtlZFMdtauVhQ22H1PG7g==
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369325ad.28.1781472798089;
        Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369115ad.28.1781472797754;
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-1-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=9c/Nh5M9LMZTEf7PKcK+5Hqv/dWjx+aNYHao+IXyE9Lpi8hX9zjkIPm1EMl/8kFjmr1IfHoDb
 QnNQYN//NpABbbG/pAJC2eLV4BL8orSO/XzLvu9r9mMxo4M1FCp7ipD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX1ZTLCSxdGjqY
 kV0aDcJc/dW+X7ogybQdSjdDITyyX8qEU3hgQMI0wcLoes5bB7hF+WSSi5vFNuv3MaTgPwxhuRi
 vRVfkCyhfWJl9hvmFMcQAuUVDZr2JDo=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f1e1e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: U9OZbIH391WCRvoPommbqTNyoHAbmYhH
X-Proofpoint-ORIG-GUID: U9OZbIH391WCRvoPommbqTNyoHAbmYhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX71cyTajkdC36
 FANFmW8ge6Ehpt3MwtgEe9RxRj6AhPMHK9KPvYHMgFmrBXJeRsbW/1d+Yb3BHnFOOEpDrzcqeO+
 Hy4lTEtO7+dzPPdxWCoVeA/HhUvFFYc8k+qNOCo7YN5YwLPMs95+Mepz2zEUBsyC1RhUv4KYxWM
 qxnI7TTJ+7qWa0lTpgmD1CrYyXiOFEp4DrMmxjvn4+JbfesvVme9voLGSMHiWZfaBLCwj8xnKhI
 0tBydpqUHndvFtZFHhx3ctAjKBku0pJK1zg8GKDUGQUGZ+f8H/OjIaV6sNqJ40mlyqzbUF23t96
 DJImQhFzdSrBJlSOd7dxiQb0PqxZy8pnCGZQouL/fT1cPdVIfTuhmTFkURh2PC5EYMjP/xeGwnc
 peN8jQAVDDXlU/NvN4SxPvDQDJPIiGqKDFpHFfMEH9QmOhNMgaO/2NhvFeRbS8CTp2aI1ZbLBEW
 Mqnt6u3jGKonD24PPhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140229

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.51.0

