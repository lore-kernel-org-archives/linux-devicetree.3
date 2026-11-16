Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819655;
	b=G8A/X9fC1OBUntv65CVaXLgcwCwOnSDhgb6u+ciuV+2Khy6/GKmwSVbqg4ppV2VCSWtr
	 U7mqaw92pOh0HXZXzlrswEk7lu8t7OU8+LtaBUfmZ9ClkI5O8nTE1y8fTZDaZpIL3UgHY
	 iwGoIpFCEvo/SXjb6v94ludEubBZp561bD4p0Hhx+qIwF+SWYk/uDDvrhG9t7PxIBAASO
	 d6/GDPq8NpC40//a42yacqCWh+IseoSbvIXCUbCcsTJGJhGqSyf5i/cYMD9cN2FmLOPGN
	 2uIIv2V+k0yV+oPTcs7eocMYNM7B+v1Fpvv9F9bqPZOACVp8gJ3F5XbhuhLMbISv9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
	b=ZYskVhA7ziLSCojSu9taxW0ySvxrV/3bLWEhz73mJYFzbv12aTeDtqoejxv9GFOYzG+L
	 mTfwpZ+jZt6ZWGGbWHFLFm12+QCMZAoS7OZkRmaskkybyQ66NkBz2nlNXwkFLMLnP82Dj
	 fSuc3U0ttPigxuAxniAPNuBTZUFF8T+I93sLE7OgK19OVBq3jyA3zElx6FeZrlbSrsL4b
	 Gwc02SA4+lEvHeF1o77Pc8kd4iOkJ/X4vUCPXD8JQwg2I+ElVey1IZlt44qYtUya9DLTW
	 cmYyzkN5bRSzxdJ+kJoJtkIf9OSVNFcRGT3MxFyLoAcuJlixfVOv9LjDphkx12h0igg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CC606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG8TsKT2650736
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=; b=iS+2W1yHU1a3LWo8
	j1Pzbonj3Gfof/aae8Ul9LPmYnCD4xJEJjKCwdfUNa4sMkQGKVqrmiHaN8kO81Sc
	7Xk4BIl+1B2zXj2nwaCngF1fzmiX3y32HhVH1mt1t8rxqPiGYZvl5EVBHTCHOdyW
	YfCtty0PhYPgkoTyQXpmOayOhyX7TXi9ifw9yqtkPTqOnX1D9A+zkXXHFGUqyYE2
	FcoGWwTBuiGDbAX0AWTxe0RUlh4Bd6qlBOGcPEN7BunJuz1aLRx4S4jtvl3EutrG
	Ymu59zxfyRpjhb6er82c/OshxYNRtolocF+8mdSs6k1neZYONmEq0qhmlSoc/1zO
	FoN5wg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxcf03k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so3202834a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819641; x=1795424441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=Syy5B9tllTn/0o1LAH09AYvSk2lXAu/DRCBfdZYDegWSI1V1UemfhIXxl+nIJ4sGgX
         encTz0JiHHX/q58ryBrLdG+S/boxYlXUBGmFfAzb5HJL7WoRx7bTs2zYMrjD+Oh5vEKs
         dKuQlwXMQOiC382f7DsfsJchRgJ54NORvJ4W8GcswEEK4X6Ny7OLbJr1RJdvgM+9FatP
         hg4RPmwOy3iEB3Cx8G8af6LlDBD5g9L0crRLuusIkOrDia8EBYTdRt7OvzZWXyX2oCH/
         E7u1tCDB3qYgFQ6XZyZeh632l/BgPqYUfXxA4+A3TRgpVzFd3CaClHAHcRf8fPP8kRXF
         NtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819641; x=1795424441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=Pe3CBCPoVjU/Hk+Adxb2ekcObZRKSG5kOo7QvvFo8xxSjr/nMAcgEL69/TIr6iAEOY
         UgWd2lMrYWNpZDxdEmdP0TlfxlMuxLZQbJl58doyiymaLwJDhsV8l7X1Csr8W5TE6Lao
         Mo8aA3UHLcE5c4BgCIept0V33GEeVQZlvps1GaLduf1S8fFGE0e6IWCLGMXUdxe2OfBP
         sAPl9MC8SMZ/hnKen9gwlT9XFuWlnuSejVd2mgUR1T0+wtSpUEu4HKFG5EWWiyVyl5Uf
         d6CqWLEGp8zzPKaxdBLhMpSx4Mbm/x9i2GcbgXnfRp8J1EIlJIs0fCuLmrbsr1+8dVIm
         xH+w==
X-Forwarded-Encrypted: i=1; AL+hErG8vzGqAHJHjScaxVO6pYKFT6lsrFQGk40aa5sfWYtKtfR7YKVBjIfXFifo/6rV1ty3uuJh1Ym4ooQi@vger.kernel.org
X-Gm-Message-State: APuU4Z9U9lPWZ9jZXux6kVBsn+vvlNAK0PMszgFBX84zvuw3/qULELE4
	vAQC4EsUiVTosN2DRVE3fZyM6fjrXC/9+aNuRQ65JOBX/SSM9XanawpDPEHp/VWD29OPFA1QpO7
	4c/PkkkLqMmww7YqffTE4Aul9ua4b/XMjbWescPiqETcIICQM4lRX4EVqut/dJrXO
X-Gm-Gg: AZFdTZdOeo5/CfJoVNo/MfD1sMVPPDWGLdExX5eAIYUXSys/ReMtgBkuIT1h2zAv4da
	5fDBiQcd7AAllYB4484axPBGKR6dpXmnKrieicpnpR0dujCzgE35z6zUGeEtEil6VgJphfMrWpA
	xklDpiCB5J9wbd9V2oT88jbHmTPCkR6fzOqwDuJDq7+hp8Y5H6578WhNWirNAQm+rGsg1VVb11Q
	0awZ/qbHgbxck+OANFCY0jDzNzkItH+Cc4u+R4oFCVdyU+a0O90ziKlw8qI4f3ax1TOwNadq7QE
	/Un9sg4wfjmQpp5TokPE5qttcOaaZyCUZqoeqhsC6i2n1fZIZyOyqvUrMQ6jPfxKMpw6cNd2slk
	THSX7mNRa5kVsKNUjSOz96awsYX01mVwnPGgKxeQYOWs35Xqfy4MMMdbyqRstnW3qi3jmD0SuOg
	MjtYYGe1c=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453710a91.43.1794819640733;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453665a91.43.1794819640060;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:39 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261116-shikra_qce_fix-v3-1-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX5AnL9wyR8AO1
 R4xnn2A9TkluDdFEKjJkNYNC/hoX4PBakQzn4mjVZeLZ572cRNdK4yJEV9r4umg8atXdgQUorI/
 vO9P6VgBXpBRumOa2JYZAm+j4TzwcvuU2F9mQ1L7sb7/DFXxR8M++Ke5giuP52kxUFNIIpJ2jHb
 2b4qrusbaYx1rbolizAXT2LdnQsbVyw08zoAG+zHZKmKxgBXDyo5DLexS0SIWMylaVHPdwFMaXU
 RBGvAuVnBFyZg30DnuhynTzYYYIS8WWcDoz26dPCVBXhgNKVBZXpYL24vfPevVXYNVkb8l4r92+
 4xriWL52CG1et/NiyZiuqn6x6dVNiNePt5LJrLdu9VwEQ4BklPFJFN0CWHKmz7YUd+FAiYi+dXP
 rP/l9S4W7RiUIa/nANPLEhWZU9sZqQJp/Cc1NklXhHaOdck68ZNEMC6kqkax/SBeUzDv6+vkTQb
 XEJY0uMCcaKycK1sFnQ==
X-Authority-Analysis: v=2.4 cv=RtZQvymK c=1 sm=1 tr=0 ts=6afac639 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfXxVR3ya6JKXky
 C9HL4bZwCqTQlIppvcQZ2Cx1lxlAJcDz2AilmyIgCIf5F+Blr65Od0VTA0U3FobhG2IZTZifwEs
 jfpxdUPvwwxaIrditsDoAyQBoi4seos=
X-Proofpoint-ORIG-GUID: 8NvLkUtpoBMlJ3WP6dcSvOm1iRSo2WBc
X-Proofpoint-GUID: 8NvLkUtpoBMlJ3WP6dcSvOm1iRSo2WBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160035

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

