Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41AE34C155
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067149; cv=none; b=Ncf9bvv4hLj1HSX77uESckjByhyltfrhFIluwWW7zX/GqN7z24Itd9xBUu/36dFXMXhpGMaEwmciLtAQ7hTMbmTsEj2YNDvXHDcF5+PnyaDT+7NgZj+mLxnNiMu8jwbb9Ih5MCWtZMXmngHC0vik21mri1o9nEKPxMb+8FAXwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067149; c=relaxed/simple;
	bh=Z3lhZcvTy3ChvwrsZwjryfnqt63yUqro+E8ba0wENaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3bUl2Ejx1yuZjVWd4MKwxP85CqnxoCdgNMyfUDrGkeFjinKuNRBdaTyTbJwpRj5GNfUAomqbyjqjRFKC4QASu4g3v6yxXaXGgeEnOf78lfCnAWNSWbxKDr2c8R0YYYWmIfo5vhzpKGNWYiRtmeZNA+T1Mcm/oFgQxfkBx0KP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOmQVJto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zce1hbjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOmQVJto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zce1hbjX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rovC3108984
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=; b=aOmQVJto31isSbl/
	qfWSCSG3v4pXIhUSvwVqonp8Bmz1j9cuRdqmxS4psUVlFW0PRqBPDaM3gKX2xnh1
	Wy3Yk3C7HIjgzWSiY6YXXWFtvnbEesF0tpihjutQH59EGOpmK7j0ogvneiwDaRAK
	APiOWv5eTiehuu4PnsctkDnksfjoqs7m8HKb6blH9VtjtI+hGZBziym1ZU2drAI2
	UFD1VJAtNkR0M4IRQtfJc0mJs9w/OpELHDBXv/6uMssVVNryTpuiW0FTR5Gff0gY
	GBNWRDn6daL/UbZFWP6w05ryR2JNjRCcxmoO58LgXn62glh2mI5TaFoE+RE5P8VD
	lSvMwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eya3eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:25:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c9127e316so690477a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067146; x=1783671946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=;
        b=Zce1hbjXCA8VTFqoCjM8EHBL7oSKg5qkOkevTipnjilzL0Ak3b7EUOX7pD+mGC3TVc
         uXHrKWT1QettroPB2CyPTpuOaNfteTdOvgRgZ5gLWZZ7x0tNoHzvh+dwNlPn0KpgEE48
         a0zW7WsKQ8GwXpkqaMQc5VQakt6aLz/2M5+U2qkpYWH9ZqtSVR8f63NqrqtU2K6DRhTB
         sBgzVWUKYSIkf+BJjNPDAQwB4ke/R2RMRL37lDF2gDL4H1u6Totrrh10tasU+EVtcUQ+
         6YxOkQAyL8xist1nP/fEZe3KP9RDjrZX5SdLZH2QdqfGh3QKyC6rqJzJSYWPJu6ztjHp
         LA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067146; x=1783671946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=;
        b=d5yR3mKh7x0KCkvbZS4DI69uZVyHZWlBa51i3Cmy6YhfM6tKfS/TqwKUiErLUm7XKo
         ombgHvs5Z/3uUN/LsJLA9PDby3O49r8oiCuYYR1zh8OfwNKae007wCa8cskf4J0ZFXRo
         AKnGbhPH+YVcOYXzcVjtQQ64Ve4LF93ZhUIt79CTX4w40GFYbJD3jDC0NhfGHuWKSAHK
         QJEWN5rLLalgaiXAbUh7MlRFrmikwO5/OWm3fOmGLWSdqg+vU/tGXDrw07orPOZbZd/d
         Vpd8IoYVdzV9izdwPIeuSmvh2IS0NKgbIMO75yVL3ixWhLmDDDukUDSE3rtt3Hk5DrQG
         /lGg==
X-Forwarded-Encrypted: i=1; AHgh+RoaF17PkVsDu0aexqbmg5+8mIbSz+4LgXpwsDeqYBaQb0DvEvDS1Y9wwKB+u4vydxrpOtnHwJBiqUtP@vger.kernel.org
X-Gm-Message-State: AOJu0YyLf5gi5gfG/oB+9ZQ6Nd1qMQbTWiLooTPC2zEe7KT5fwG/IZIi
	6/ZTNiDAljy8beVr0d55lkrK07j448iPBqzcHX/3hRWNAMUnOv78gBuc8v2moYxmA6lNvBhls7T
	JwVwWR/hJtTJgPuXrYLGbOHUwaORWYY8zA60UstFesX0qD8YK96D7Ur8tZZTMQ9X5
X-Gm-Gg: AfdE7ckfXVbhVrX1pvGu4IJ2mE8/lU26J3VlS/OiQJyUszjW2WVfk1w9hud3fbfs73T
	mAjF1PKrAsaD0gekr8Hwc2ADjvXXCuK47TnTtigKSb4gJ0M6o+WDfGSsICB3Y+v/qu5RpUF1EnC
	D8zly7g6Q/ziTAwxm/zh8dKb0y3U07/O5+AbF9TzN+gOVoULWFuU3J6LuiJJWh9lATlPBDpMtN7
	GOsCB3AxKGZQDbbUGjYFyr/pJYZgmn+OjMI/ZIVN8/lUUgFq/3rppkgeFJOmr/Vk8uS0HV4r+S+
	cp+Wb9msK4SuCdsR2iwRB9sqnCwzht8wynBJanCZ5W1oOCuwpGeVv+MdWsfLoOL3LsEg37PpfZi
	AJi1LBwegerNVTiSX+wSwcLHqVY0UftN2BDx3ZMEaLQA=
X-Received: by 2002:a17:90b:528b:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3813b5d35f1mr1237821a91.1.1783067145696;
        Fri, 03 Jul 2026 01:25:45 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3813b5d35f1mr1237775a91.1.1783067144955;
        Fri, 03 Jul 2026 01:25:44 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm30312280eec.9.2026.07.03.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:25:44 -0700 (PDT)
Message-ID: <1db1de13-385e-4b9e-b18f-f7035f1b58f5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:55:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Fix legacy/new SoC strictness split
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com>
 <20260703-nice-beetle-of-efficiency-eafad3@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260703-nice-beetle-of-efficiency-eafad3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OSBTYWx0ZWRfXwJhuHR8SM9Qd
 3th5mer+Vlrtd4C8K++Ii2S4UR2O+Z4szdJ8mUG+t7/FYiLFBKjW2wde+Dx8uLtnrq5Or3A2ma6
 AFdvxJgoXz5+PJzCK1+lQLKcYW9AblAvlv93352nwSVZ4xjW1PfCi8emsbjmRfkkfDTyDoCDSxg
 fMm67TpHvZYj26wCDeDLL15RguaRMWqCfmL4eI3Pem5AUZUXXabK4Yfe7q0i6dSlK4v40lczvJL
 zNHaR5Kthqlz0UKHuKzXDHqB2VehU55+TrkxZKcHXH/m5f5AmhVjie/v3PXGGtkjyW7uJSPyp3X
 1Z/KNEcXDKz9EH0ojEXjNJe7PnOItTs7j4xg2LOc8EeuoVAkfeE4Q07qH2L49ljDqEszQgLB1kj
 kkEo7fvk6HLVRXEpHJCq9u2szlHNqTXjb5uYiv8GO6VU1e7S00lNDVTgOdNAVeaL+3o5B111Bj1
 8DJsdYaNOJj96dlHiCw==
X-Proofpoint-GUID: Yi99dpKcRPcWN0Y01Pbq3s6kiPoPvU-A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OSBTYWx0ZWRfXx1NXWcZbVBwx
 ilc1vPDCUg4vfSnAcaI6xkDmjMt6p/CZLBGrLm7DTosOoqp/tK6vqS9zOs/a73h02uZOhbc5i1B
 L9/PPTepsBGTpgshJdhp0M8UAwWIves=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47720a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QthcfW-pFkhp4WIqV0YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Yi99dpKcRPcWN0Y01Pbq3s6kiPoPvU-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030079

On 03-07-2026 12:21, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 01:47:11AM +0530, Kuldeep Singh wrote:
>> Couple of already merged SoCs describe ICE as single clock historically
>> which are recently updated with mandatory 2 clocks.
>>
>> Keep only the known legacy compatibles flexible, and make strict
>> validation default(of power-domains and 2 clocks) for all other Soc
>> compatibles.
>>
>> This ensures old DTs are valid while ensuring any new SoC (not in the
>> legacy allowlist) must follow latest requirements by default.
>>
>> Fixes: e27264daac7d ("dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk")
> 
> Please drop, original codeo was correct, no bug to fix.

Ok.

> 
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 23 ++++++++++++++++------
>>  1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index db895c50e2d2..4f3689a24410 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -55,14 +55,25 @@ required:
>>  
>>  additionalProperties: false
>>  
>> +# Do not extend the list.
>> +# Legacy SoCs are allowed for single clock.
>> +# New SoCs must provide both clocks and power domains.
>>  allOf:
>>    - if:
>> -      properties:
>> -        compatible:
>> -          contains:
>> -            enum:
>> -              - qcom,eliza-inline-crypto-engine
>> -              - qcom,milos-inline-crypto-engine
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - qcom,kaanapali-inline-crypto-engine
> 
> Your change is not equivalent in relation to hawi. Please make it
> explicit in commit msg - all devices which are fixed by this.

Sure, eliza/milos/hawi are non-legacy and will adapt 2 clocks model by
default so will update them in commit message.

-- 
Regards
Kuldeep

