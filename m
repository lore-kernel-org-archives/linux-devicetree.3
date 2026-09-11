Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922B3EC82E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100858; cv=none; b=f5JX6FUOSAt1m6GL4w6uog2vkyDqcNSca83Pr37QSkZKo4ui5d/Qm+wOVHTgLiMa8FsIO+Y8aFR6kcZhnmGs56E86lKDwrTqmDndki+0MKVW9PII9Vo1KaUDxZri4MEdYHZ7c2qqSu+M0suA8cEayb2FwbzFU0pGb4FIqoRJSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100858; c=relaxed/simple;
	bh=l7BLvAbP/Pdv6FGDbaIFRrv/1rYKCBm7pQkhO5EUGVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usw1CCz1MpBBHa5/HYARL64uLtFm5YpCWwylk1Wko4dT8i5sy2wNZDGnowCajBlJOiASoxKmdogmYJ3xB78/0LliPk7udOp1EVF8PvNJ5APtyfuoLoY/9D3OZQCbrJQwyMi7SllraStzlEvPZSmE7pivz57WIoS36LIwc8zA9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYRqXudJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ/673VJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYRqXudJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ/673VJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4M7RY1853144
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=; b=dYRqXudJ6cp0K3Fr
	SWnA+MCtmlN9m0ze9mT0UoUcj+e2dtJl6W97lWufLI0R3kM6emFYjMwts5b/a97E
	MCNM8+QEmxYWniSSbYxfw0pyYoW2pMyDI1YgbQ/5yTDYNcsrHLCZDHJgf4SZYITD
	hv8NOmF9IgEzER8l/5vUetm6/3tLXVZ+ktja2UMkgKHp+rQ2IwVM3FpuUXcbjSBG
	kg8JyMISdIeEX73RnkHMg+WJLsZhqZsJ8+zddq2mMpqZ+qkRFO0o5atbhcxGI/nN
	xv1swcfZpqeW5ntAOX5c6xRCNWyMOxFu3OWyBW7KyhMZ3Jo1PK9+aTUxUTogEF3G
	2qV0Ww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucgke7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so836166a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100856; x=1789705656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=JQ/673VJXxLW6QYk8JRW0c+skjpfP+JeHUhsRtWBH/EyojGkToWBjCyjGSDdzpnhZ/
         NS6aXz/DyjsUlThwNuN9wVxLEtuNJqzvn44UF4//QUImWYxn+TeGv5l46xQ7S8/m2NbI
         OtheR/0mXsdTRKMLD8w8EtmJU7x+qH28QpUB5jfDQSsW9hpkngLDPV+XPzqLDIdtr7hW
         +3YtOcY5LWDdlBRRFnig1whsOUb9rqpJyrKp9UeFBk8Cf2bLXjBYS5pM6y6mShyStqhs
         UTZb++RHqivCKiYxFMibsSjG5dGul+cesFPH4vHIUqQ0LaASPMYCmYPW9mmpwuXxPjM1
         OUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100856; x=1789705656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=Rl5vFpnMWO/ixy9OMqb21Y7fcCT2NOpIae3viOtBAO/ldH/gC9S2mKX6chAwn2SbjP
         2h1WWCC3yv4SfJQTmPb4iRf6F88ebCsNofob9vKFD6PCyYARccfyI10OwKMAzIe6ZA5M
         2yRcvwgkSyOvDXAjof81RSslzrJUn521iuz0S2Y01beGbJiodGoUjIMmPJU6epie9CzJ
         73Wm/JpFzMQY3ajaZRzq+hWtSM4gCBEZXQ4/ToQoBOzLcOtkairaH52zADhmdQQDhBEt
         Vg+J006uxmJNagxWhhHGnaMJB4N1169mt+JbjOE/2e9e4xEB+gxvBtN6OYkSzL/bjMhe
         lu0g==
X-Forwarded-Encrypted: i=1; AKwUvBwvNPnbXdZ4Tu28dcxrYJl/rpvHMU8r50qurgigFF4p8o+Z2ZUZrzVWuyAQwiNhsDIoXDW59fHANp1L@vger.kernel.org
X-Gm-Message-State: AFuF++mCzzmarCBniMaLYQ7QzBLTRYmGX2jXi9V7y3n3+4ADJT1n+6aV
	GuSLBR5sdDS75gQmbFfqDv14kjzo5MHtOXkbq7ONIOFK9o6Z9jz5v0+U9I4HWbespPEN0Uh+nJu
	pQ014F3DAQXXR/jVEi/Duxg6mxTq5GwY/7DKboGUe2NSWgx9F0W7e/Y9wJXR4LzQi
X-Gm-Gg: AYBFou06sFEgzTNrTzLSGxCQT7QMdDwIazWz7FwqSa1h7bhu22znwuJNnrtojk8Iaa/
	qgz89jVwAARNM7/J5h5fWIgpZ+BdZCYxTOHoTRJUPaf02AoVI9w2Eo0K0+H4R6bxgf3SKjZafZR
	FNBZGvmrHylmtpnp3WaAl/f/c1gbTpk2dVfO4TIdMnGvospC3NROz1AeNiarW10Q/3BalhrmsOL
	66CvihvQ9wkdezspLQbo8NdpQCVHt4iVP3k8m87ByzPLkR1vivBgnK3v2POBdlZNk2Hw3sEr8Dy
	GK2UtHQdtsRLUSZrr83GdhqfAECjLSuCxGeufGWBufccN0KrmgKhvOGxC6B0DB/z/Wm42863txy
	hMx0SweXmDLVz4XYDQI4/E/PanAI=
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4018025a91.17.1789100855696;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4017972a91.17.1789100855066;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3072419c88.6.2026.09.10.21.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:34 -0700 (PDT)
Message-ID: <3e322428-7673-4428-ae29-dabd9cabb974@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:57:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa38338 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5R3-X4UbMoIwJvzG15sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX+XQtMtgMPFcN
 HjqFu/UerC5KdxmG6QDi5tAzLQDiBqCnM3JkP9o0VReUGzuAOFhhxnkAIB3gUDG2wZWtLOEZaLK
 NzQsXNOM52TE9p/X3Qo4YbxfZYZi9QFKvCSlT2QwJC8QDVk8D8jKRZ2F6wjzrTbmWpymALp20Lm
 l4JlA/qleer4h4umSnnIZ0+JB+dqQCd+OxvtIUro3uEeHqya7d3b+WyXt/YOH1EJIA25sXctHN8
 urVryt+U21IzYKx//zXRtcMqYVss5SuKXyaK+4XWuc+B8wzFhi9a920gc1mVn2Lb3cd5lDypECU
 tO1kvNjKSitBhXtLNA9z7He6kRhXzB5NfpK8dGeJQ19hZlAM72B4FWws6pddqV42Jp84hKjK8oD
 q3RxCjj4OhjIcWSeQMT2X3GLiSmRBKk8QoqNeko+V0fuQJTIKKd/bf+lDUP5utQn0/Y6TfTAZeN
 /cFXvbVxb6BjN9XeMCg==
X-Proofpoint-GUID: 1z7HW67MoP8iSAmnb-VX0EE9QonN0nBJ
X-Proofpoint-ORIG-GUID: 1z7HW67MoP8iSAmnb-VX0EE9QonN0nBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX4ZNwFUbQSlke
 guB4oEnJ9HAxBXpXRNvwq1RDbL2yx25E6kJdSUSUspYN6pFusNC4z6i72u0/YkAvppiRuwFvY8U
 Hukbq0TLARM+bBfMAt5gM+m8JlPl+nI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
> Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
> driver to support both SoCs without modification.
> 
> Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
> strings to the binding, along with the corresponding clock ID header.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f65380747220..3e6ba5505584 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -16,6 +16,7 @@ description: |
>    domains on SM8450.
>  
>    See also:
> +    include/dt-bindings/clock/qcom,hawi-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>      include/dt-bindings/clock/qcom,nord-camcc.h
> @@ -27,16 +28,22 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-cambistmclkcc
> -      - qcom,kaanapali-camcc
> -      - qcom,nord-camcc
> -      - qcom,sm8450-camcc
> -      - qcom,sm8475-camcc
> -      - qcom,sm8550-camcc
> -      - qcom,sm8650-camcc
> -      - qcom,sm8750-cambistmclkcc
> -      - qcom,sm8750-camcc
> +    oneOf:
> +      - enum:
> +          - qcom,hawi-camcc
> +          - qcom,kaanapali-cambistmclkcc
> +          - qcom,kaanapali-camcc
> +          - qcom,nord-camcc
> +          - qcom,sm8450-camcc
> +          - qcom,sm8475-camcc
> +          - qcom,sm8550-camcc
> +          - qcom,sm8650-camcc
> +          - qcom,sm8750-cambistmclkcc
> +          - qcom,sm8750-camcc
> +      - items:
> +          - enum:
> +              - qcom,hawi-cambistmclkcc
> +          - const: qcom,kaanapali-cambistmclkcc
>  

Please add the interconnect property in bindings, similar to
Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml

-- 
Thanks,
Taniya Das

