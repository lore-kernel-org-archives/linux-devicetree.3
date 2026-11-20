Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174223;
	b=no0owBOoSHtJo3+np+ONx2rMIA+v0BdDF5Epogc9K4+VkzZ0GFqEqT56knoUqVwr6gx1
	 5PwJE40+7Cc/n+Hk/XfCqpLpz/sqvk31W2P9HwDDvvVZG3dK0bHbPBSsu75DNdC+daSHU
	 T/0+oaskWYk/4cVsr9YV9RVveDQMCTa5+h6kQwzFC7r7Y4oeeTL29tVvi6+UHTLOeT80w
	 0dIqa7xLLaXjRj+eYwrZZ+/wm0xyrYC2Th5deJaP8MRUsMgVnFdCjjG36VLWRauDLyunV
	 OTuqhLtbR+hWxVeOxNHse+nxJl0kbj6pf78zVQmGC3t3FWzcJG8IGK0kaLQ/X3JR4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
	b=X20AqAEg3AApGbl7x8nYrsAsSN+yhmREnHA2QtbqGHx8ItBCDUaXNLNJ/ymlWlwGYEPU
	 N86mVN7ih0Hl7keSNhFqwmd2tQGIZ+FXMii4/h6C7Dsyc9nIzFyly9tEiJVpSzsYXrMPG
	 SbgEM8c3kBnrbUk8QlCR6C/c1rh5dRjoj7qod4eSfBN///U0ZSqzBilGdJU/LxX06IHzW
	 TbA+46m8xE4uIiLeC3YNSFZBUYI6bWVcm4tnp3TfNrVkOeU4Biy51vrkc8xhWoDpxEWb1
	 GpurruAAy2rZg34eBl8Bl//xsyGb0cFuAoXSbVCWy11Jr/uBG26e02V2qEWMDbC0gfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cPjXIYET;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRUeItWR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA760A260E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DA760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cPjXIYET;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRUeItWR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjovu1462864
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=; b=cPjXIYETJtsw9lh3
	xJURsJ6/9D35NP1OWydV91E3GCvAVaM+9qJV5QTRNtbpEkHEJDTzoPemzdiNG5BA
	Ok2q0pHPET8wriTGGRqSA3NQeQTCBxSirzEX/VAOUjYHN4Ot4TrXNH7gSZ7CMZvP
	idzUgDOymbest6qWodiD0M3NJOq8AUReFrNpv2gkfn+yXVlHdvupkQb5vxCWayVp
	pPpgfCuUHsX34bWcoe/Z+wle1pm84CaAg7N3qeVNnoqnja6HuPjKUjbKT8+IPvPI
	jFc+9gZhgz03bG1espcz2a95hIzwgW03sY5kZFYoQzRNf4oZlBeH7KSrx9OwFhbb
	6rGeig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah8e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so11636585ad.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174222; x=1795779022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=XRUeItWRpfl2+5sDeT5swyjh5+TLiyV9WojOpYLX7Z3I0GJfsUzdcwmcXpTNzkb1R3
         D34f2i0s9YFl4QahjGrkKhXVhZHwa43YdL1+DK9o9xlGM+sqkUdli+7V7zuYw0gEewC8
         vaP49wEWyl+4062DC7NIzXL4Q7tfy5Hqbn/KYszdfM78OR1/LmuWDjP8Ud2GjSZhkcPS
         f9e5J/QQEgwz2QkRvkB7EbbQXZ2872JK02B7MFPrnmkgbFPs/QvFkfSdDm+ELkaQXn/l
         KDcWpqT7evgp+WMRcwMpit5Y/PXzMjT6l4rGFAyM8ufbl+c9NuxhCqS/8b5MoOLc/p6N
         JPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174222; x=1795779022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=qGXAAic4EttGMHgm5oLuv07XG04GTTq18eBqE+vyGocrG0cKuJWQVGKtq4c227Stcj
         AIxtlIuUl8TIJvQ3iuPBGcRplqvkYH0HYOIlfv+yHeChqmttdVQcEhf0WoEILwL9hnLk
         x7p95U/RC+N3SE3/W/jS8X46ryup1ukGeXY32BWPZ8azQ++XRyM3dD8LSXHyiI12/O7j
         1h6qwqYFHuP5U52Ypq/MUHhS8q13GevoFHyqcr9HE7GqNrqtfV5agHCj45JoMLFfsETJ
         ZgzkM7ZBLDXBhVtkjmb2a2uchJi7zLABQasFxpkcLRaTU+ufUnQMYhpAOVV/yHOtm6MV
         LN6A==
X-Forwarded-Encrypted: i=1; AL+hErEGdsNquH7EbBarv+CvNGcjPPidsDCaGk4AVTuoJ8TdEpwz5fJnLQVtFCE+krjlMXr8AiCugeqXiJaZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+FfQB3lyPJfqADy1jSJ8ym8rJxupjyJV2hEh/l8W3vzh4Qo6b6
	0tgRms0J2JVrL25w12ItdFbGFh2M/ny58v6dmGYXB+aAwaBAHksQH+2udfFYQXIruou0nvPPHLv
	E4h0VLaSzDWacTEK/SahLo0imgG0/RM5i/Ugq28BgmtqFekinlulKO1uaiTHS0Hao
X-Gm-Gg: AZFdTZf3aHZFiHo1vMLBdauQGTda3iCW6bHqv6EM2oJJc0x+j6KvtRcJ+iFdYTSXSky
	fN9horA3/BbW1g5pc0TJvE+BY/5TgEUTIxHOo0LkI40LQw8b/KTEUCVY5zCZbmGi6dlBpzhG/v9
	zsll7mvVA3v1yLlZ3xHUU3KBlwIY05lTMJAXy5HkQRlF6bxm6t8daQ2ymossZzVKU0QNfxg9EtW
	v1V5xBq+POABsOXfOLsGfe/KB94aLCeZExFDKIELcoj1awvsGJgnLR74Esrj7C52IsLNSqM5PJM
	Bc6k9kdteuUEjO7ZcYXxTJEkG4vXmgGz09gvL6FsgcAO2ilHeZ313Fv6IWZrJxBUzsX+4Y3TxXr
	KaUlEk5FRdN+nZn8r+LN0flVHq3bwAtUcr34ihRp+zpmHBNY0XnS9RkW6hBBsSB1jd4IYgKRQrG
	i80xmCu2Y=
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr21097145ad.42.1795174221622;
        Fri, 20 Nov 2026 03:30:21 -0800 (PST)
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr21096925ad.42.1795174221174;
        Fri, 20 Nov 2026 03:30:21 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:20 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:59:52 +0530
Subject: [PATCH v4 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
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
Message-Id: <20261120-shikra_qce_fix-v4-1-5249e31394ce@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
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
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX4THhAriW2ZwS
 ITmsZ2ABP7MnRlCed/nBgn8pJIu0AfmGr+YNhBe78cv3497WVNgac5YODD++jlRBP8XLnNFGih/
 Tdnt/EJU+/ZiuJiRsNniNj1FxbJQirjruCrARtthRbFIvRC96COUmKOhxTpjJ0wNNLN42WdT0W+
 2ZnasyvKJ23wZ3OoCPrVv1LQARadL+4MlHIg3iL2DigW16eMe7LfsWURnouCNmv3C3axkmOLI/Y
 RJhlo5VPyS3wvwC6yXxAiq90b1gH7+9SITSiaohA5jSpQK73akUOw8QRSNpb63nYqacOF6SgO9a
 deo0C06AT/VvgTRgr7+hyfen3XVkmUG5tHv6Ik+TEm+Zh8IRLwiuD+Oxm3eH0j1mGdBPfzAxwNT
 3Xm9l3UlUnsnreZxLN9aSD3YdFSDyoAERDH4gj+jNYWwtI2hfL/S8eo74PaUpJGNnVZOoseSC+u
 3+Vhylpp1QjCjpdaTmQ==
X-Proofpoint-ORIG-GUID: Qa4n5DzXbvCbXzLjSXNUaRWVpUBpoMY2
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002f4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Qa4n5DzXbvCbXzLjSXNUaRWVpUBpoMY2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX1dDX06rYJNhJ
 kC6uabzveMx7GhHk1QGVnQJXxSaXlZEFNpwoW7UzCnPJYpgKNR6rZB7p5ug7Y7MZt79eES67LP+
 VufSEexQlkaw3znkJLaFULatrZaCNks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200045

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

