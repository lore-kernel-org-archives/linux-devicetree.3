Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075F2848A1
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767182; cv=none; b=Hft1d2B6oDc8Us2yIjGVpGev8kAXCTAzjjnAtYwniYnPSrjpMBCQgD5JWvxrQ7I/Eg0uGVuPLPh/uVtWzCGSeYm7MeCz45XrFYocVz+oZT8WEaG21ds1lzEuwisCZkuoZk5QvuLgJB57JeO69a4fckeqJzjyuv34F4uMu4KgU7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767182; c=relaxed/simple;
	bh=XZdAZaAtQcyYAGB3DQOfoExEp6vD9CjO1J15n1KZgCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHHMm4imxYSL0ItM9Yw59evLW9AWDsZSSOVvZGqlto1CS00dG2lbt2XGlk9oxlXPUbO6jUAeshrIISriiJ4QVfeGKeYJoBKKxWyXFOFotZPZ/M4LNUlRKw+rYZNplswB1b9mklnjmFFaJb76h1nDtBA4t7xvM0smZmHQS1a2xLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB0yG/zt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds0W7ris; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB0yG/zt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds0W7ris"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2Eapo691624
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hKpCmYx1/VB
	9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=; b=aB0yG/ztdagD50kwU61MghWXWPy
	bPFiESTQIMqUJSjVkxruRlUvFzJZcsCP8ORCIcXjmky+fGaGK6cAPL68IlcMu+n7
	eRo9Jy8AkDBTXHRVF4ShDXxMzIEOE0EW7AvfavypJUlZF2u4jQhrug2KkkhynBAz
	Qp5CB3MVNZmDQJwjj1yoNPmu9d01chItZ+OwXk2AGpnobAXxhj0pu/F6a+AZnTv3
	ikZgYDOla5LJiwGLxRIlYT3va8fJSDm+3NybOxRzN/zgS1M/syYu0unBocRk+pPZ
	qya/kacdEb/Q4LoKGlQv+rWYeH/BsRka4TQwL7zKyayHjbXB5asV+y8E75w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2j5mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f5943ca81aso1316110eec.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767179; x=1780371979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=Ds0W7risOppMZKaYkWYb/6GqQMovLzVZr5cuCofqgoh1rwW6bxgDCr9pjiLGbxH2oF
         FnDIBoGyHCDNILkQWe+0Y+eWVtd02rSsHNvvjraEip9b2NlIY5tzl7EhsjwwLlAA9Mup
         d+a9CucRJsekbZts1K9Ge8usQlYKL3dGPeSb/Nb9gaZcR6ZEzeDKXD6S6Sc04+rJ8T30
         wgUNDx7bZ7WbtiXx2LxHG6Oqv3Zq75ChydIY/sGKjhA1ZeXkE6/FJYBeeyTP3Fy1xL3P
         qWK67dY9TdaBodCtPLq4xrmbahgoPffs/JdY5xQ5rNcbOK26vD1Nj1onUpdpA8WrHTUF
         rZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767179; x=1780371979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=XTM8G7uLpUSsHN+dVfdKizP9elvbKoR9dE5HdX28ToyXcUR3pbyTDFm7ioGkiOXa+R
         k8Ez8062ozK3u66T4nRicLp0TKdb2EQrDyTP6Xnis6wBBWl3eteSKdLrV0snMafZjclV
         A7rRRGCuq8nK9gjM30cIO/1hYU2aIL1VsrkuFEkXv2YyNMxheZLE021/qVwVbXdnQCeZ
         XnGYbbefhQRPlrA3vqc+vQjh0GIg6spQYLJ7hQPtqm+anflOqA0mkTvuxjmc5r48EIlG
         jHibpsScu8GF7FXLIMzlbWKsq9otRDN6ij3LG6Ma+CuGj0vgTdWlHdt1HFF3+IsLdZAV
         XvOg==
X-Forwarded-Encrypted: i=1; AFNElJ80qD6OvQCmZrfJhsujJ7lP6fs4rHlhyUxla+cgxU703Cg2HRf0f9qsHeLIddngw+f58mi4NGOMwN+S@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTAl2LVWBNAPrMTZM1600LMeMx2iNAb+KXd/tKaDY7QJ+MIcz
	4OnnMNAVFgDwRzSA7o/vrm/ZXs37GzEx0JlqPAnK8nPwvUCxBfD2qJO4lXSpJqXX3+PfXPC9xkN
	7UdqraKJx+lLDQHjEEmj7NmVZqR9WzESpACK7lXfzMd8WV78CraqctFyUoWQv1N6h
X-Gm-Gg: Acq92OGN/v0rzCN7jXqILmPxt3plRDQ51oNEs76Us8tf+XvKpSd7QeQak2vcQla1sDD
	L0olJpK7DNZ04y9ep0AeDPIg3r83ZLE50NaZiMRhcBMe+J47iCDpu57GAkp6LoGaZ/wZALxHp4Y
	ixrf/A5AC5HpOo99KDnryc/Gnb9KnlR+LlxxKF8MkyVARaqQbHMtKwK3rOI3Xyk+1ueAcW1R+t8
	ckapfLfwfSmVwbDfzk1m11UhFtW7VHxsJDdVcKhNldssH7Au6ukpUbmn3n6JGJokG5JL6AIq/cS
	cmXPKhN8vBPGtwSP9ZNSwhwEg3NggzW036tFc5gZq8xTZJSYnNabk0XWQACMByB2G9g2E+cBZ9C
	OJnlMeN3WYSpTEcv502gwZtZPysLNQWzsp5MwrYM/nVZbUueCTvEtdi8onYFas8a2rAGqsOgEfH
	dnrVokiQ==
X-Received: by 2002:a05:7300:ef83:b0:2f2:b544:2fd4 with SMTP id 5a478bee46e88-30449201503mr8469960eec.34.1779767179524;
        Mon, 25 May 2026 20:46:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:2f2:b544:2fd4 with SMTP id 5a478bee46e88-30449201503mr8469944eec.34.1779767179030;
        Mon, 25 May 2026 20:46:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 26 May 2026 11:45:53 +0800
Message-ID: <20260526034557.1669007-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bmsa4bRvZEP1bR_kuZhWGc-pi8p3hy2E
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a15178c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: bmsa4bRvZEP1bR_kuZhWGc-pi8p3hy2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAyOSBTYWx0ZWRfX3B75IFrpKHTI
 BZBL2M4K/2r1O3c2b+j6+vlvlKaAVFqR/ivzAz3AgC0QuZLCjo8KwyXqidjRuwBU5xoDmsS/Sb7
 nO3NrgRNUPEVLk0hWRsSqatvBWlqtay3hw3rkCxxqSdKPHbog8zW9t4CxGY2gs9OdijLbV3v4i+
 RncZxAYtzcFpp8vVIS9ECJAnWrvn/1yA3Ocf/u2B6VT18Ic7aruBGdYzCIK83WQxIDWe0VefycM
 AT2vToFy4CbjKz3JqmK4LVoOeEClt+OcvrR2kvQ2aMkvLFz+Kj+9qUSdrySWluPfpQxpz3n5A4F
 Zwfyie3xIwf9l057w5IPuh/EZCO3RMj7/y3v1saNRMeVk49YGj0yBU73Zg72tczq7qRlp8yCIOF
 zKWnRWm/CBxkaeWG1KC8iiTBQ8IdjMybEv+eFawn/FLSWmVBuWzdUYclfpU5MmcOYdlk1mu1A7i
 KiaSRPtcEgNUHYDmiNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260029

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0

