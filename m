Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF231F5847
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560721; cv=none; b=e34FFCWONFsFktw12Oc1DJqBRoU678kAA0rcV4gR6qMrRnmCIvmF0pd6ceO3SZQS34v08LV8hEnEhHBjscxuDbD0my1VBmPpMlr3wboLbP7VPR+ZJIp0ob6koqU/89/Bv+FlPe0WAxnVezNgfzvatd4MIFZXCvTla+iuhPqKuts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560721; c=relaxed/simple;
	bh=w9cnIu+knTgg65YCw5dht36ngdUu2Y2zhB3WJV8QGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Twy/Zf6u7Jv7ArHlA9IHT2u5kgBW3s+Rx7MJQ+4o9s3p48JeZnFWdSbf/8zvxasnCzL/ge0ToUvFPYfJywGIesGyZPwnuKxv/58MIuEJr718Nj53nTagAI07y0YtnD1v363FnqhPTSbd8MNR1HkwfmkLDysOvkg4qOevPL+anZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae9PeUV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp4LqTY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ae9PeUV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp4LqTY3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376RC863402372
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=; b=ae9PeUV8ezUyTDLq
	ndqzM3OLFwVVyCHrNPszhJlk4nWmHAZaFddWbfDuMMzNTENmYYpQe8KQKuD28RjY
	PAzCvAv1OsFA010dFiKc+07R38hjiFOty6gmEk/j22h1CUVxSnJHhUNM73omZylw
	3N65elgWlpaQTUSm+EIKJ1+ErE9ohfm0g98yyaDT4QOIYzhi1wjoddhc7BNdxuBL
	U5oBEz7PMwDuFpJlX5hUiyh/wROP3Y3mxndIfhWqzzN66/YULPOdv+GLTjFQkAIi
	O1mLzfLrrHwJDb0s2IhL1dXKN8awUttelsubrDiv4URVyoIDC0w+S7s/+FH/3D0t
	pklBpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhte7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:18:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso18811791cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560719; x=1776165519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=;
        b=gp4LqTY3ctRU2KCCBJibvcA8cMh14yBnoU7AKvKC0v+oFHDsNPQz+L07Rvv48M8M7T
         +UD+Cak9cUFQJwFFwm9PNgxHOPIbCdDnhD/h94dNA/x+CgHQ5qcDQGc7Ek80O4TJ33Aa
         3SAkudaT/IgXadP53fPTdsKyKtUPP5MvXMEArA/eJoFRl2z0B453euLUghlgjFkSBU5q
         +ukEvLThs96GqjFTLF7WWYeZCiyPA4tq/lq2k10nMzPRQVoTrsYH6AxU7OK1mS1KwLc2
         Ab32Whge+tqhKHGfVCJrf5dQDF/vLsXA3JxD7I6u1T5Gz2hYMnL3D4v5TUvkwjAZcaqL
         diRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560719; x=1776165519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=;
        b=o5VLe3sH3jKt0sZZKCsMMLLM3+NX/a2Bn0DJ6J8FrH5HcF3L2Yu8IRQzAV2n65b9Ki
         AUPfXzk4Kk5MB91NtuLBpoqURQOxWQDd4tGrWbAxPuX7HyBS02uU9NFPtX4Hy9ad3hm+
         V+d7SWKCOJGXiM7hvk6GkX1Mr1EbuAUnn7tAatUk6u1vPaOpFOFuyKfWvpWWhEd8bUb3
         pslIQ14Pz50CgLq9L4tDOUiSjRfB9tS7q8Y5IMb9g7f3FQ2gubszgb4bx0mGcf0t/xud
         tk6D/8Ju+lpu36MYnMo0TILiTzXfS6y5F5fZqg52wdP/uiIqBYYPQ//pLxLcfuj/ao81
         wYOg==
X-Forwarded-Encrypted: i=1; AJvYcCVOGSNvO29MPmJYA3Cx8JUcFhBrbg6BWASTrkkIOakU0eQQ4xoAGa6nTHnH/EQJAfy66I2VtvQDkupt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0QYpn+htTHHsKKmHpwMnqOn6dcyQl6BgBzGec61IximtOjGpG
	LV9PJaTtYhbjVGbcp/36X67mRX9RnT2nmYQeH0Po/7vW+vEhLBMZUxE3RzlQhBPjodljzTdHElX
	/lyV8kJ9DUWCpk3ZyC1fDpZEsjOuLXrd7c90c5g1OcyEhCIUIgamjWl245Olzq1uM
X-Gm-Gg: AeBDietkD9kuzVKQC6/5nwrzNaAqlnQH3w1cQEgxyZpdCTNCjL+pJFPlAP2lxP6Bt3I
	0VmX1GM5EoSs82AFeEaRzEWe55WJQynYbbgrQnKpyKhGv24t77xJGqHOLnkfzCQdH4O+2jEZR/e
	lB5K7+O2J7fZWdyC4mIjT3QOJOS3Rv443ITXOlOEAHTqN9pKUc+JpGaKWXfu6+2Cmeq2UezFKfA
	1oTSMhaSFfeJOq0Q0ERSp4S0wXWcrPzFst5qRcvfhyXUrA7XTd1xj1oPwmK6LHFUQJyg1gdKcEv
	etCVoz0OqzBUC9UaT3r57tD6afIDD9QZSQSMhWUQQVpJoawFfjSOsW1gokCC3qgD3PC3d307FC7
	Wsd6xHi9wuut3Ssni4JLq/T1RNg64dzo5HgJ2SFpZXZpndcF+CPJLmFwUaHMeNxieL2jg7XHUsp
	K2di8=
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr180228731cf.6.1775560718868;
        Tue, 07 Apr 2026 04:18:38 -0700 (PDT)
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr180228531cf.6.1775560718435;
        Tue, 07 Apr 2026 04:18:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bb78esm4545183a12.24.2026.04.07.04.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:18:37 -0700 (PDT)
Message-ID: <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:18:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
 <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNSBTYWx0ZWRfX2ndbEUxraFbd
 AvSuJuzC8rNmC5DytImnmarakI7a4Cx3RHscOQ/wEhoW7DsqeFhr2gJQzOe2j7pi+hYZbndIWOL
 2JQVslBwBeHxh5iHoxg+XuBeLorINhl04riKKBDWSywuBZgV0HiAGz2QIhg6uVpHonXeKpCZEts
 QOoI+mXDmSSS4SrwgijB5HH6lxLMrT8M/dNfUddZgBsZI3jYnMNGvapMXLWo6OuUEF377ydhaaH
 UEWDMfFpvUnlK0T52tJErhir90WeLlCJ20Oivbr9HIkVy3PDXz5a/oEe7K7TUGMUAgRcX5QHOOJ
 +V/VNqyKVtNGN0utO+x77P05k07MZnmWz+X4b5CVypP4z9sLSLDN1xNmHOcT3iN+A3DxnOMC3Iu
 ioEcaebvfk2swJk8uN9+fPyTP2C1mMcNMBBAtv9MdhY8dVhQ3/Vjq1tE3NY84z/rAVQ7Rmyr3sY
 Qzgh1PGGpo4uPeTOi6g==
X-Proofpoint-GUID: 10gwLDd4-obFScSNbUi1pMz-mCSqsEY1
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4e80f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yFPsli0tPFyAm-MtiuoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 10gwLDd4-obFScSNbUi1pMz-mCSqsEY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070105

On 4/7/26 1:09 PM, Kuldeep Singh wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index dda4697a61b7..5e6b659e8719 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>>  				     "qcom,inline-crypto-engine";
>>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>> +			clock-names = "core", "iface";
>>
>> nit: one a line would be preferred, please fix that up as you seemingly
>> need a v2 anyway
> 
> Hi Konrad, Didn't get your comment completely.
> 
> Do I need to send v2 to just fix clock entries in 2 lines?
> Or some other comment to address and send v2 for that?
> I don't see any other comment on patchset to address.

I didn't see your reply to Dmitry's initial comment about the DT bindings
requiring an update.

I'd prefer if you sent a v2 with that formatting change. Patches will not be
merged for some ~3 weeks now, due to the kernel release cycle so it'll have
to wait a bit anyway

Konrad
