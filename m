Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143C2F8EA3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821276; cv=none; b=UCNzRCoGNEPnDmC262QTCMkcJvrebIbv2N67/PZfXeNIvmCwKShsdnRrg2QIuatCe6JRUkRoovbse7WvktsPAsaSxlmYX108X5fS0YYIAwV20zCyuKS5a6euGLfqczrd/Ef3IYMNH0qlsc8kfzrI7sMMhNHRbABC/7gtVyHsS0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821276; c=relaxed/simple;
	bh=f17Bu/wrlgfBMydvWnsBrhKXZGIzMkgdyIzjhMwpXh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pR4Lf0UZdqLy8sxJcpiuSdfwkDwaXrSrJRGza79lR/roKwFkbdoOCppKTpTwlmgrC+Nmiydf/SVeouNfUa8BRnaWIraCiROSUrnx9aR2dEDL69v1J3eLClRwSbnosBCRjifyRLV6UTFI7/mXzfi/FerzGr8phEugCH33cMTFAYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2v5+HUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8y0U1rA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2v5+HUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8y0U1rA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4m71508588
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=; b=D2v5+HUQhOP+k5ew
	Z9FewbHHRNAGjbwjwzMi+6+QPvMRh0K5+awIqzNGhs+g9jR8Vx6HZmvl++rOE9v0
	mB/CDYQXjCKrH3ZivfF41Wr+PV9yK2+6MOTPUCvK1DUTlDULB6rM7I9EKzjaLFhO
	VZtYIe9YWeNxQSddoW0Jb+yoccGf1jaQEcEd48kEh3J8CXZ5HMbk+XHd9uqiop1J
	ZJMeaD4Whk+hn9hCc7IULxh5ykDY1y1UhI7U35105Q3asFUvFdGWZiofrSYd/mgR
	GVUByxi66NtnpBFqhwGcazbFV1ozeTXJo3M2euirQPJ/t/SeFD3gDjLN5/MP5Lmm
	cgRqvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j3dky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:07:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so3323981cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821273; x=1783426073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=;
        b=K8y0U1rAzQ8WmQOthxAt7me6LVEZ26o/vtPTZ30p2SpjX+4KkvlEgu3hKTAVD1rogK
         7xVuwfKJbpQ6bKv6qDqbqW17D2b+MhWRVNYWC4kNGmyozD0d7uT8NJWo6cRKq/tvBrw4
         oMkjp/HwZU3m41vtDXrAvElVyDIYVFkW8CdwtRfaHX4eLfV7K+xJOYnP1xM68VV0vdg9
         F/A39AK7Bfa1OU/QzHfqjuxftWQq3hIZT3r/rTnxJzwcc89m+3M1Tc0VJ8pAoJNkl20n
         k0XMJuDtzxS0uhDMeqW7yahEEaxgXHQKqw4p3eS4YtMg2wOeNQzIUkfteMjrfrG0vkAN
         94AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821273; x=1783426073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8nkSVjm0+6KGt7Tt4Y+eD1mKx4t4XwrLk/9apS2gfQ=;
        b=YLSE/167mfTy+x5bzzdObeXpglxxRtiFkFRkQnw4W3DdqGLDKldx/wwyymmPwnRFFp
         9JsCCic5WuNA8cABFuvAEjeMUyJt5H9YCW3L6uUdNwRNYg/oaEil6os1mwNSy9s3NrZa
         5COQSfMo9RYvxDC4mMWk3HCxDiu88LLQVtAKW86UGXlLLKwEzxrG5rehvHWYG8kTbhqz
         FzNkd6vIHGeGSdYOnSbZIlwzOP63YfM0BAHsDtLD+/k53mEnYKNHRzhSXB0a0BPiF3wZ
         cpC6rZN7exjCiZjkcmdWKpUrUXVqb5KkK4E+A7UpoWtM94xESinjPPrihPpmmKiO9wrw
         1pzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/q/eTI7NgSdh4H77zG9e3sHU0HBFvyLkSa9gmWAgaawL4zfcSK8nE0aESufJ4pzny9lWL/JbndrkIn@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqoHcal9Dl3VRJXqk0Ions9lB7kkG+VddoaVbn9c9643IwrU1
	+LtGq1rn7T+UDZjzFepcvqaH8EioOyHasxDZZBerdRJAeiONRTKlEGjul/iYfHyo9ho5+HsUTkI
	j8k3jGOY1Vp/v6U4hjcg9DPK+/vTKcWsEzCr85jsYynJZ62wN6sg2/4clfR+SyzW6
X-Gm-Gg: AfdE7cleibm80YnGS6XHz6Cl448HCrG1N7Z1zjD6bVQZUyb1wsJAxqTxoSVIhgguh7k
	1DRFJTRdzSWAjSeH0GVsAHjhi3NbsviXt5YOtb2KbSchaNT7uYrCPAvdEfeT+H71e6xwbVsYWcT
	JXogRHkQWnn68JcJK+TDx982O1bNJTS+rZNumepmwoK0yymiJopB/FrgXCLS+Xme6PbDX0g3jtY
	Uwpn1oFtdnMyr5QWpuqK1gciUDGNSzeW3gGWAEnYtecnQ9Hq5X+U6jrWDWyUrmMvAWy9+Td2qK5
	rVqECav2lewzrQknQon3taNLqV29KoB/X8ivmx09RTTPINwVgD87lYVj8s8XJN4KD0x6ZsBzRCH
	6L9ryCIX9ZcyeZdTeTPPAZ0BDETSkmtVD1Dg=
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr25796491cf.11.1782821273203;
        Tue, 30 Jun 2026 05:07:53 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr25795951cf.11.1782821272483;
        Tue, 30 Jun 2026 05:07:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm113569266b.31.2026.06.30.05.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:07:51 -0700 (PDT)
Message-ID: <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:07:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 34VCtyYGFnXb3pAmKwHxvf7j3yl1oNuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMiBTYWx0ZWRfX1+UWZahMeJo0
 XaXf4hBRvdmnuqv/vKjF/UPjqua+d3RQfnHdEuMeMWqKEGd7WOZoeUrJ/vSLKeApG2gBW77TOYv
 Wb+IsIWX4ZvydP0uDEg2xVrq5OcSbIY7+kD7mm6ph+IDlVIT4J6a4sk/jtqxPEdRxzFRgF6v81t
 I9GGOJjHi4qNC0UuuVZKK6d/kbN3WjfdGGorHTJkoOV5bx13ZWUvYjiXR5so3Ww/Kd6LdmN+MSQ
 eXrWb/rJDS/CtAa0colXOL02DfXZ+5xCtSFaKtyw5TzccTWGSan6AhbGdhB/MM8NusodfuHAGS0
 RNM+iEHPCJrmGleeCvBHEPhcBukg61jH7EUl/yvqraM7rU+WoqyXacYpfNv1vs/X+WFQHt37WNf
 F3TU1ifEZAg1EpSD7MJ3LEEkXOz9AkhG2FFJvOUPyJP016z5/9omixuighon5OlGvXiWrKbgSlA
 VnDcfL0zEzVaBbY3AFA==
X-Proofpoint-GUID: 34VCtyYGFnXb3pAmKwHxvf7j3yl1oNuI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMiBTYWx0ZWRfXw6N2jqmijY7X
 xDc8mnjyuYdBYrTA8VWOS+LhIGccdJx3aiTXf5PxQRtP01MrdjEve6TfGywXd8AhpxwLWoqHDr7
 DvE8OtrmYYYcpOYYhcAeaIPgnuPT/cA=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43b19a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=iZyORjh1VVlEZnV2gd4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300112

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
>  1 file changed, 277 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c..9356b40a1850 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -205,6 +205,92 @@ platform {
>  		};
>  	};
>  
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				active-config0 {

trip-point0 (the current name is very misleading)

> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

125 degC for skin-thermal with a single passive trip and no cooling
devices is.. certainly toasty

Konrad
