Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98353F39E8
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170751; cv=none; b=V/rpKbN/SaD1yGPikMfj3l7a0r84KzO6GfGJYj2uR+1cSJoMTm8y/qKmVVC8SkiGmi3RDino+Mb9OGdXXWZ17RekTAe3hqmXsgCsqcCOBr27Mq61ZO/+CkVkecIOhc+gHdYv05MZtEUPNR24pC7vMJs4ousKY+2h75WSY3axR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170751; c=relaxed/simple;
	bh=9WUTQgRakephEhhifi2ai7YVHSAGw7Ewg8/ZVPhpY6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fqw9K1lFWroIAWl5edSmLTxpyHzzo5E7HYHLpHQEQBB0FK/B4yjRWtx+duAfl6uTMktfFFU3K0U8LxztJ3SpwOCMcnsTYZW5T33y9iyHdZmpv7yIGOmoni0nFSH2qtXhmrsOXSssju6TCC8Fp6vO9etdo/OMouXNLgL4WBVXb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA+BHz7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDlrDTtX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA+BHz7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDlrDTtX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaAe2924435
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=; b=lA+BHz7xafasOZM+
	OeRtipnaY/XyUvBm3wO+CoqzMcFzXqrxNw7TYMLNqQ0/Mo7xTjSWWRdVNfDukGb7
	GSyLEB4X4DRFyn1TzCoWI6Kp9AiPou5DQAsjwoYVT42eCOktgd3nMoVxRVcr+Bag
	+G2JOdl5kFCFR/tINGFyHtXqW1KncdIQYcN+3V7u80VUQ0EPkV2eJGH9tJqVTDWn
	ivjK16vqK8erYRAHWd+F6HMpqopwrvKwDDiQrOA5q9mQuJGybXiIpY+t6JPmVQ3i
	sPBWHGRiviLKu2SAbDf1bYfMB5gTu79MJFP5DuYvxBdqQ7dEe+gi6LBNW2MQ4A0d
	AiI1CQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wa4s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so4061786a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170748; x=1788775548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=TDlrDTtXM7bzNpXBYpAzARmHlCKCWrNY/ebGX+rfEMxwyISOu34LJhL/UxVVk452UP
         bc9FC+IxbmqoLQMYQg42MNUaIgO7ijKeYBsV+PXDAt9SEt4BurBWLmMwN5bIl16SMKfh
         etFYMsrz6swMtBNRl9JirCvWvOyob4sWzTZDfrD/Cnbl6YZx3j60Dq0vMwUoLj31owB+
         0i/6toQEoEBU7uqwVeuXd8KE/oyLJidyBOB6eSzpvozcd/EvzOuqPlJ/KWmPYPOrH0P0
         QrBKoBVH93m+fnCqrhhCtjtbI/KSX++BJAsGF1k0AiT7PsBZb7zI9eaOng0KNrj1lMSf
         qb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170748; x=1788775548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=DXwlltm8PuVugaOCaTZ6G8xJMnAPw9hJ6zGoQeevpGussNqTKH/+AHEuo2iZMfNCxq
         LprwylcL5diby7iyrDzkPHQp8cdwChQOmwkVjLLEWWwk6P2Pe3WMEL1sTlvsvNuB0pYK
         qNSqYiNnXfXjXXxHBVNWmXxiQnvobN/dyJxmTKX0r4iDP7AJZNREgLolZFRActELU0nq
         e38xRCDwlJrDNt52BmCeTzmuikdqUVqFqzYgLTE6PCbSYEsvoVZeB5oM7W2GvOybPipg
         tbVxV1YY39rNXSRHahnDosmFSTK6PAYd3d/T23/+Upc1ifB4eTwghxYpHh7D7ZCqiXH4
         ZelQ==
X-Forwarded-Encrypted: i=1; AKwUvBwooIoZuDfeNO44M5ug9hG9KGW2k/+jPqg22jAYuhL5TgIpuRZA9LrNYJHEHk7nfGShTT2A36trzkOF@vger.kernel.org
X-Gm-Message-State: AFuF++m8DKREVtPi2qiCo1o14MFCEOw/K9n6D+JsaP9MAlLvA2Ztr93I
	0GSD1Xff2/Als5pW48WnIyVEvFJkfwz7G8Y8q6wvC6l9B9Krd7zoj4aEc0deO92h64PG3uevpvK
	xUXOtPMweXE6lrgGKbJeoMuJz5v2m/Ygylig6jOBKOiESXQ7n8kPI5NHmwX5mLCtx
X-Gm-Gg: AYBFou3hwEEv0kmOAjyUSyRkMR78CzgsOdz+r79ISErv/3LBUdLmOFzvyVjNiw70b3e
	fqu71pb3jMT54o8pAjP4QgkAgQTyrivVXMzSSxGSqSRId88bwVOf3v1mlXqxmFjPI3Dm6agqOdY
	Skvnfn/LxhCwaCRiPEyCp8HzAE+cBerjMiJVrY+DIqveNKg9CK74e2+R+q6jIOuFe/WGI/652xq
	FZTqYmsH7xz5uoBoJF9zaEtIR8AZZsjkwZML9aymeZdtHOWMfqRccyqFgkqr4MvyXXIcHM0hhsN
	BbHngo2sQbLXhhjIYDgYbBb/QxLy7qA3qk7wrwqUcCgWvKRbQI/gB4Yh+HFHNHY24J8JydlowUT
	QzjsQpP3tDGTY8beHamkZ/V2JeGJi9RLVDZcwqxROPYSqJmhfPe3pFRuXOSFdMcEp91IOJ74=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25646082a91.17.1788170747889;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25645956a91.17.1788170747310;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
Received: from [10.133.33.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm16294336a91.9.2026.08.31.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:05:46 -0700 (PDT)
Message-ID: <89805886-ba34-47d7-845f-904db15c7b17@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:05:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9551fc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6mMdS-TofruHI7CEqrkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX3NbsMdUZquBV
 Y5B/oyHfLyvJchaVgLyxDQmAy7AT7gX7P4m4m58vNWdAxgLyIARyE55XnvcY1GBCCz2SB/8EoTf
 GOlja8Ez1D8eCEAOGGofWb6hp61M66I=
X-Proofpoint-ORIG-GUID: bEjrTgmbfR5Jwn7fzkuGxvMOXh76RTBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX3p0Iop9VwcO/
 vDoSLz3fwHVAwfrCT9Ji7xlod5WxtD2ob3S7HrjwDqUYLil3QXTDgFTL1pixuuG1lYuVgtg1/Pk
 39g0ptp4SMNbRB8u8PALg7v+Rat5AVo9XgIynseR0WGHVKk/+RNno0QY7NtssDOz8VoL0Zp98fp
 eev+nK9Qe0+tzngvHISnTAGLY4Lm6TJQYSGcPnSf5QqbAnIcwLiUsHDuVKcV81UX/xxh+LF3ZWO
 XA1FTQ2rfkVKgwRUzFAQY7aXSUgPWM9uy0i1NQDCaPC/es2k4xQoctsEx6TXqlARuy4cisjzArK
 w35j1ZvbaaYaQTEbyrBHfMKbTI1V2jUqbXK+7Km82MP1Z1EICO7oK7RHnDXYDimwd5qLm74xm1M
 GgH4Z4xC4H7EzzkLN/xwmhgZRcPfrf9NOJBUy8yswZWd9yUGaIX24k6pS1eTLZXp786+yRmN22e
 0muEts0pmFZzvaDDIaA==
X-Proofpoint-GUID: bEjrTgmbfR5Jwn7fzkuGxvMOXh76RTBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310086



On 8/31/2026 2:25 PM, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
> architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
> Changes in V2:
> - Rebases to the latest code.
> - PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
>    change is already merged, so dropping change
> V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
> ---
> 
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

This patch did not show the falling back relationship between Maili
and Hawi, please check and update.

Thanks,
Jingyi

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -23,6 +23,8 @@ properties:
>         - qcom,hawi-qmp-gen3x2-pcie-phy
>         - qcom,hawi-qmp-gen4x1-pcie-phy
>         - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen4x1-pcie-phy
>         - qcom,qcs615-qmp-gen3x1-pcie-phy
>         - qcom,qcs8300-qmp-gen4x2-pcie-phy
>         - qcom,sa8775p-qmp-gen4x2-pcie-phy
> @@ -202,6 +204,8 @@ allOf:
>                 - qcom,glymur-qmp-gen5x4-pcie-phy
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,qcs8300-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x4-pcie-phy
> @@ -232,6 +236,8 @@ allOf:
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
>                 - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,sm8550-qmp-gen4x2-pcie-phy
>                 - qcom,sm8650-qmp-gen4x2-pcie-phy
>                 - qcom,x1e80100-qmp-gen3x2-pcie-phy
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4
> 
> Best regards,

