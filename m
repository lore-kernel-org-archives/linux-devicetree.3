Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DAB1AA1F4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937080; cv=none; b=ZVcLa8sDKI8DU/48/ZKCg+SZpvV9wc5KLdxApGWdlMXTJH3aGbzg4UZraL4bnIvWW0/SsqCfbd0UAK0hZQRU44xph7qMxM6AuHH/W/c169/aahN424KBtMuAMuHo5k4fKw7clIhOQagaPazDqRfZ+ZLavIXwl/mktjrh307+S9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937080; c=relaxed/simple;
	bh=NTwlaax/lh6AG78S/JgsCIhqbIXpaLk3tcWX2JG/xaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1f2LxAzQ76pD71BTgRqN1gI07lXwTJJ8oNNX5cffrSvh8oS7y1xbLauoDu+Qdp33jpmo1ApqGqEgh5JyY8XxcdWlb4Ls+fSQ4S16bdLGKNh+ZF7fjrD12mPkmlpdHxhWzAkmve5ZYlDf+YQrlok187ohFTfgKeMSG95ccRorX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGxbE1/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXj8A6JW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGxbE1/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXj8A6JW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmb6U1589749
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 20:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=; b=fGxbE1/fRr3FWGh+
	r4JCOH5y5L0dT59tKsu84L+rDTy4LasQHxN+1xjRKtuatVOAsnIi5LicfdpmSD3f
	8gP1F00OdcUTuA8GbDpEDiI31q7iHugaP8ZpNeC8mBtkvXujrc+dHC8vzI5FKSm9
	xnfsKxNaXI8jfztw0nViruUc9ax/SzmDvUCzgFUafExlzyoZu4g7CBjxg/6id/5D
	pd4grU12qfEJisnPF/nSVWzkDavz33Xx6XpnR9kZmYdHzrcpmeroJQ1+y4tnRJ6F
	sATBfI7K9ijgNsjhliFiZ5V22WInttHziO7npBIn5+gcGsZjN4uVbRvPtBVG0jXF
	AEkNrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q09p5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:17:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so1042506a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937078; x=1783541878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=;
        b=UXj8A6JWIPVWKZIE55haaZ5SwzGC0XUmZOmOeqCX7FOu22NjZKfvKwi5JlwmfguVNm
         akgleHEphLOw68sapfK0AQAOEeQnuaIiSIfOPGIIB69j3qdk1yCHwq1LhvsetulT9khs
         vJIfPwo/BVYKRz8DRV2wa9blheJsE6m2LUG3b+7fT/l1a+lhAO4UXqCnjrAaQaysU+sK
         0WkGUW3qV5CjhNlF/7Skj2IHc8nbkQYBCKU4uQ9+Rpeo3V0B+lmJQvtWFpHuG9WU+Bv3
         PFC7sIcFta6tC72S72dh7XY7nNHYPo5HmKfo4zPF2pmY4OPWs3fCuvA84MUmmpL88SSD
         NXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937078; x=1783541878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=;
        b=SvMYBQEIKTTWviYQ7aXkC3IsUlJ/CFL8trUFyOyJkXnZ0X0caxZB6KaGfIwEBTorHj
         GW9FLf3NLkwyD6SvnVce+uaX0ccjBMhS0e5FA7CPC/+tLWKhaggtLW43xkH03UoMYFFQ
         5ECkVYNbJNSE1ZygDn8iPNBOzRDpXiIKFkIxKvh5J1YqBMphndhEjEWZ61AfAQVEvpXM
         UXZ6a0MxlmYw5v+Bm76GKYqFmXSO9S+Nyus3Ou1030iqXXqnNo5E6wRqcqxL3DVJ1iAi
         w6kD9tEN90mJWuVg12/SUu5/b8I70TpGzpNXRrDVAva3f64S46iQecHjEy2GXnbxU9cX
         gzMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrH734iojgdxaWGHOE5fhu1SRla7jSTf5dTsQhRgbvY1MO0dz9IgxnTtLCv5Qllxz3teT3QLYB1B3Oe@vger.kernel.org
X-Gm-Message-State: AOJu0YxIzOIwLauMFuaFP/oYdGrqCAxyi/rFnFn0xZM1boubZntI4XKt
	qvfTCIhS6jsm/YaJCP6Dc2/lRlp3vIwn8tsJPxwvDzr7b7kO5lFCjEAlWB27Bn6y58hey+eOh62
	aoFg0MliEnt6MqENLQcqfEWViRBaz2O43w+sGDQETX9GEm87KCptUmBNt+UWZU29c
X-Gm-Gg: AfdE7ckdcsA09ZUtdaurDm7pcE+WV4+2+XbUMYuBT7cgDVGYuuV+T4ihacvU/SYzlOW
	hJ3H/zSN8vnwsQUyXRBtNxZVH5qnSfQ2Oy1t0MEQj5oF6tuX6WUhCdMT5xlduCf0t3cL4CwWkPI
	AOZU0UZ4j2A8A/c6PgjXoJP2B09kY7TaZsEfER/K8jbZjqCYN4XFr7Ak8K/0M5x4WPCTU2iOh08
	+qCfxTiMME3J6GLQyyWE+Tbw9WZAsuSVxmAs5Wxx5//F0PXM3S2K0gH1nbfb1uSCNSIb36ALESd
	VcppuPJAFgBnrff0DaIXArd5Iq87oqP8STEtQV6O9WKLtLgNXFtnqMQAKal3iVKSP2jZB78UeAi
	ybf82xg4Khx7Mp2Ode+Tiw0/ktKsOf45WOJNghC5xonZ9
X-Received: by 2002:a17:90a:d44c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-3809052f69cmr5463848a91.11.1782937077759;
        Wed, 01 Jul 2026 13:17:57 -0700 (PDT)
X-Received: by 2002:a17:90a:d44c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-3809052f69cmr5463808a91.11.1782937077283;
        Wed, 01 Jul 2026 13:17:57 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:55 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:14 +0530
Subject: [PATCH v2 4/6] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-4-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4575f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mnL63iHeaYg7R5sIRJMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: i2smB2IeP4QrUOrUXpa9bymWfmvpSaJt
X-Proofpoint-GUID: i2smB2IeP4QrUOrUXpa9bymWfmvpSaJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX1rYd7wPc2tF1
 ygBTpATBScMoGLD/Lz6Dz3OgUa6dE9/1Ki3Bsf9+ttHkuhNcTHfOnUHZNMCYQK79I5TV40l4dR/
 pLrUxkfkM9vmMXGT1Z0FFjLctdjC9iu5mb7Bwqm0ArdIlvwb4Dp7zxrV8+B7oG/pvpoYK2PVKXJ
 FqSPrs+YQBaC5Ajk+W8IlpY1CWIyBZCACDfXLPOZFB3n3hneUSrbSaVPYIC8vrI2FLfaOmb/wef
 GU5MzjsJQQ52C/bqUciRctSJfh4cSDklt2yJK+7dU5xxHD9g3QrkohTOBkDbka3kZwsP/Gl0Ghb
 RJiRTuKXnuxCPhYOx0waOt05howh9DmwkxX9lQK53jwRvs/BQVMJ1Ma2nHN23zTvoTLxL6V3S5t
 6Odx3F4pNe79OXP7GQ2D6oOIB5sKO5H6amVa5ID/vAPsoXt1m29WEulSrcWi/4+IKByqQNmq4wi
 aKecDCnObM0vxSLyMIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX9O/ZWx2RPBLE
 8AX11eOY88gavaFIGAPAThnEdUv/yn1HwTZlosIF43MsdT8yT78SBtYUFmHY1PExD2JK0rZbuIO
 CgDhA3ve54d8u8JBGcxqak04FbayUY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010217

Document the crypto engine on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22b..5a653757ee75 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
+              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce

-- 
2.34.1

