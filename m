Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FED1A681E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251941; cv=none; b=REspQMWWeeu95EjTZrrat5+kI/iOYeCuiLEfn6FDfGpp+L2uGC9twHurgWTOHd9fyIj7GtrqcknLNgKh7GuiDpdtZkjFpU9jKUSfWag5lZJSsOhV64tloPJtpbDMD9WzFNDHci8X3HByGtrDEGZa66q7XusH8bhgKyz6HfGF/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251941; c=relaxed/simple;
	bh=271J0lZFHsgoJcX3dFlGjV17Kt4aHWOaGN8cZCfR5Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQCNl5eHm0PAdWVuZqx4yP6/MVvqN0kx/2uWiwErViDDla21u3X4ypZeUOQO/av6W+qcQeWSbo7LzG9Da4CZGjQ791/jcB95uS6yauczaOCCxFdsr3CeFD1kk7yCoL1yVdHmrhUshvBMaARfA8t+3CLB9rPx9J+slnSYermGOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qu3Rqlcy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIuvU41r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qu3Rqlcy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIuvU41r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNUuPU1623433
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZ
	TCXXOmCQ=; b=Qu3RqlcyHPELxHIxXjKFuxWyAr2utRwjrUyWbuZCgVWwBarCv1R
	S0C4YZKgr8kbG9hv/4fEZalBjdr5jT6PQqjzkaUl0f4loZJgi5w6BgApTnmp8O16
	Sbqi3MLOzDvBCuSsl9c4XTpGlZsYsBzlNlTGx3zVPVrcEj/HCWzowXg0+DWzkJaZ
	4KWR4jaPhjzpcnY9C2Y0cAUPSLVzd0gC7djzqhwbyW6adINFiD0mHxcP7ZSFdrMK
	Lp4bSDvc6QYPOPhMKc3chhCQJM67K867rkPoRUQ/Hna0/7LvYiIJa2EK7hwWPdVG
	AyB4xxNE+QggmTnxUlFvsybkoVTB650kvWg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4ussvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:05:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c726f4055so10043304c88.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251939; x=1777856739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZTCXXOmCQ=;
        b=DIuvU41rKdMlv4f0pen7j3esfmHNpKK3gbs0Pn8I/KqrAij3E9xdq1gvzlX01yfI5z
         kKrCUdbk1TFX4zAONOObsBewk8cuasb/EKbFgxOswygDUvLleBSpMWejJujwg57qKejL
         +wt8XcIo6O0CsfyBrquBt2C7DCyoDilpTL2BcPNqpe+TBETK53j0bn9foLseWQgEGbQy
         xoTpSbxvgIFWp1uQsqkzZJBloSMZS4YOukL0EQ3Us+mETTMpPZhq0BXXTKGR6XIJ24XQ
         dWnlzV+xGy39KvugLuCI+fbYdfEFj2PSlfj52IqS41ONDs42SulxDuQsjIe0idEtrdLD
         Tyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251939; x=1777856739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7PxwMFZQggX2AK6HZIzTeEsYKNAeZcrWBZTCXXOmCQ=;
        b=RL5RfYxya4K/lQSEA4f1faNxKSyKOrVciym6yei1+/cbMU2ejLlw7cz035ryIJLQ23
         Z90nvJwOy2WjNmF4ZgUJtJIa0eOlH4SBiVBvJCBzVc6XD5kl3La9lu5D1874dPnSxpOQ
         /bZuId3PzJRuOsi1OPzAC+Wfah/IEPjzmW7J430IFlKFnPb3dPes26jgAVqfQhHadG/R
         Y8vq2G0zUZgc/HSEXUsv+Z5xLDvXVWwW36m7H3fSHYzoRTWonVU37HH0VAR/TYK82yh8
         ncFwz0bEJ1SSKwMpoQTo2bExBQ3kVKJ3q4CY8++FX+k9NnJBh+bUESVeoJBvzir1jIcZ
         fq5A==
X-Forwarded-Encrypted: i=1; AFNElJ8D67NG9jpIcjQ5NTyQVBoiEiQ8gBBsdFLRZ/ktHu9OPPohgUctTT7g+ARY+Z8kQFT2AqGJnJqb6Jw3@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8hjzZMGTNvytFa0xum7i45r2RdYvXQpbE4H8bmsqhEfysMNp
	6k/P3MPts2mQb+/G2ccxVnbkWsqsc7gH1shjhBdtZ7NrGXvDWVes73kHakYbuZd9PnifTkpZh3z
	ccMPqhZ+MnvbbCX8lazZ5e5iZU1OpHusEPYDIbLLbG7+8ZTJutwBuyYI2bJlslfTy
X-Gm-Gg: AeBDievassEpd3OWA1pTZ4z6cc5i700GyemT1f3q0DSggd87/lIBn8tAZkI42/15yve
	/ST9GC5y71ivjGEUmjImnZudfY4wkvK2sHqrcxj25VrfH46S0xCvw1nYGvKxEduILHFRvpWC8GG
	5ghfJN57dgmrYKvuq70b4T1XStDpBYwoTMHLBxMzDX/Xrg9+ZA3wTbDBqjt/pRragTUWUf5F75Q
	3+gkQV3DRn6k0FjKXoy0zuvxOcONquxuiVD8Gmh/qz8DYoA83o01Jl4dHhBEyShj3P/PUQcGfba
	UEEI5hwOI2kxC/XxEyjciHj2Qe9NsGvAWt47DaWiFAgeytYljgpqHttZqO5XiLjnTifyOOit6+M
	MdGR517H4/KaehpP96MkLzdZ2pVmpE+ot2dBrSaOlrWKqkk6VeNBJidmNY8dCVUjbrr+oa8/Fnk
	apDgCMORf6F4vo+U3e
X-Received: by 2002:a05:7022:4596:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c73f978fcmr20066387c88.26.1777251938709;
        Sun, 26 Apr 2026 18:05:38 -0700 (PDT)
X-Received: by 2002:a05:7022:4596:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c73f978fcmr20066363c88.26.1777251938194;
        Sun, 26 Apr 2026 18:05:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm49985745c88.0.2026.04.26.18.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:05:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Mon, 27 Apr 2026 09:05:27 +0800
Message-ID: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7H1-nNFBVEKgSuAx06rtmEGraMJHkbUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfX33dUAIZaq6sN
 2YO7GPoUZId4NJ+VQMPnSRldeZqjDz6hsRfTEPPnrtjCOl2/Zy4u+VtEqL6DTw3BRqFwhA59PQe
 ZYCTSeSbYQ8qiNBdFEyqCO/S3/oMh812lwzoAq1fGzO42ovL3I3NRrbd3j2UYqvMl7cfM46FYAx
 3VZMT4lUOZF/6rCwrNpClDJoZkmL/aqPJ6qd5x7jvctBbkAb6rOmjLIXQQGIvaQWH2fb1PVBSHV
 nbNygVfYluQuXFCxhG6qo9qS3nyjNyIhivSrO+UgfKSJp3+/uG/ls+OJW4hBDmGMddDr/au0p7O
 VlDne0mgcjHh4XFzAsNGRXIWuFJ//WqGvCr4VTgFw4GP9p6ma0zb7mG81a0Ii5hyFMMz9uFQreu
 J35pc7SwLcRx10e+/Wr34VpHTq3qFP7SvM7pFcttltBfWZSfNNQXb+EJmVEjpPCN7sWUnZ4fOYG
 uDSfiXxYC9HbbFccbGg==
X-Proofpoint-ORIG-GUID: 7H1-nNFBVEKgSuAx06rtmEGraMJHkbUO
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eeb663 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_7_cwL0RbDhQ0r_n38wA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270009

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
compatible with 'qcom,inline-crypto-engine'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..9251db2b8fcd 100644
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
-- 
2.43.0

