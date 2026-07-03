Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92739DBFC
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071061; cv=none; b=MOg+yH2Okpr3RInP0iR0ZuxFe6sG1hTp+7C6K+jnwKEpeyRn0m6AnvC7OXiYlOCmkeCr5W3ozfHf78U4kOujfPjG/RMLB6ktUFV3QA0q2lY/kkMpcPRxXiqwKo93Yjqv5xV56cqry8vkdLWiZ54hBzYLagTuhMvJbY5IoeZTc6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071061; c=relaxed/simple;
	bh=PW1Gn2ZDRUx5qmvoCMyRof05YepCvm5bLOu2Pluzkug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EOMvKlll4bfq4DgU4QWrPMbuCUvz4YQ6JkUYA64DluDZffiX11GjnEGy0Ds3dqZYFSR8kgMd8HBBz2i7e5XB0Tq218JPaytu7x4Yi+WprAa1mldq/0C6s5RGg4DjueMtdo9RJXLFEZmEil07+E51LnoBOWjk2/1t/BErWb6t+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN3VGnrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/KjpE5a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YN3VGnrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/KjpE5a"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636hE9G3144471
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=; b=YN3VGnrQ8VkV3le+
	NY0sCWKe3WFHuyO9eBWaJ+3D+VC1r+sfVNdalQPp4ez1Vvx1r0da+ou3RcaQQiXy
	fvIqZcZ16Ohkek53MErE5qVT+ZfZImedOfPseQvdgDJ2Onnw7Sr2n09Gdvtwucvt
	cvE9TLwGTP0G8zsgGhJPYT1hXe4SOp8LuACUJB+CZ2y1llqyv+klB2yyNB+F3DcN
	ExKdqw2UfTwiqlazNsJD8TCYaOoZ12cDXB+Q2iTfW4YRra75oZMBZI4Qmz10vYA9
	cMGAL0dw9jd1CgqWU1th75Y5hdGXKEWwKKAyPx5+HaCTQYfTms1R+78JCdrjw2kn
	zcF41w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brm66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:30:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so720102a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783071057; x=1783675857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=V/KjpE5aK6UVdji2tuyWeRo5F8HZRd0H/mWgPKLM9zX6jqV17rEygXq20Yvvy3bbL0
         8iISGW4vmjOF9HUHsql0tKPZMCZICpo4X7xNv93k83G+xhK/eXVCdnf4hlWEb8taApzd
         QWpLwvGhVACTpyFfWuLpaifUUGDwnFYgRMr3igjLY7eyM4aIpCX21jIAKLiq5lzQqRoH
         AiczMVNJq9QhixYb81oJ2Dnmc9C6tUjuD2sioU0iUMmOoFO9rAyexRPn+1VtTLvLRy/Z
         qgG+U0XmkYczNMuDWITBlNmE2pa23jcTsP9b8b0ttC8JQuHx5aOlSHLAgyw2q7hvvL41
         DvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071057; x=1783675857;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=Xkv6dJyMsZpyKUpKjfe0usPlQp74qJtAfkBhEGWjUB5e3a3hLMKk7HuCwx4abg7WGo
         laIF5MgZy1Tb1+6H8DPd/qO5f9jdR57FuqtJLei+M1NQZ0x2m/gEjQEGJ9Twf87gvyVF
         DT0PXrXQsGOQYAxgWPknlByrEbXONjYxU8yo/ov5syEiS64p0kPZYxQjVfD7Kpf1stBK
         JshoUHgTX/B1pSCWwjRwIdDc8UQfCJSyFxo2UYRVInY+5dQXr0H2O7HNLWW+KGATwjO/
         2MFZxAR4a/UEsMPHrRaMvWElOCMjfRJ9hum77PrlGbEqNaYez9vKX/Gu6q0HY8JaM8DS
         pCBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8McSOKm4uCT76mkGw7nUMuOQ/TyXAR3FtgobCTjs9vBKf9B5ITyEkd4Ld05xxfamL2osqy1pYLLTxP@vger.kernel.org
X-Gm-Message-State: AOJu0YwOVUwsOA51HjLET/cTKeMBF3EP/XgcQU1rajlv818lRtcZYCdH
	TkMROatCFznV5wJz6e4LWtxj4VjG11EtBQV77uELclaeOwZuzpGLv/4DGQ26bo50cs/QIG6j83t
	5JPMTR+citA4ZGZjjNe2yRQcczcrf8xLKZzd6yaUPnQxS3HfNABBnbV2kRKgyWK1m
X-Gm-Gg: AfdE7ckyklWFUMwQZ6+fl6XaTt9Co2NNBtvmJOtOGtapD25DdploCm0YFdD38VFNLZs
	UJPqtOcqFjuYMERakpbnAN+MogardSZVY8dptwBwOjapUCLLum1shqicuRSA340huny7JHn0TrU
	9jEOoOBEF/P/IrG/rbQ9V9YNjY3ogTJikqJwsQuM7zZMqX50srjPgzqaDw+9LlGhyo+z9KPOu7R
	+6VQQgbYNHK0lXXDRFLx/WcPOWy6BaMQQwVFozRvTHRtWTHrKqGDZjJeFry48R//6R3apFgVhyV
	dh0yTDRchfBREFbbF45guETW7vpHM6KG8i4UcXwOQtPiYdsaF9FYtiwsSIKAxwnEj0LC+UAFNjI
	JfD5QY7HV+QxM+Vrx2W1pn33a6yVYRHdaID0du+RS
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533785637.35.1783071057523;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533759637.35.1783071057123;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm2291087a12.27.2026.07.03.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:30:56 -0700 (PDT)
Message-ID: <20a98312-be6e-4743-b2c2-46cc084653fd@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:00:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Language: en-US
In-Reply-To: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX4VfHjJEgN4Pd
 rgy82+oe8YoQx7szCiccynDOSbUkdpugoFFcW036JsO0NPzMLqwqxiaQGUowLsenSYmw31HvH22
 9nl4OtYowupRRhrFv9f1QLG25FEfx2mVsOb/RlK6ESjriXfCdHJ1txaRtSxzvWcbb9LdzVSpdRU
 1Y3SsFgBRMwJj7nulAyXHxF9YzeVpM/i8Ze0xzQd6iu/1tb0NgrLTyE5SMCGJ15xZhm5u5g2gVb
 mYfWd+8YhtpoxX16j7PxFJWOYpSp3UtlMgL/au6vQTmFU64Zq1Na/+YI6IQarYWCmri+bvDYsHA
 O5WWCpcROAoCI0JE9l70ceUNL/uujN82mfXlVa3JmQXjJhdRtqD9fjC5QtuXHowTQ2/EehbiU1I
 LffvBIA4G92f+YjLogL4SXVvBXp93PB/IW/YLKRp+BHos8xXL4ttxSPNYChg9foN/PFSSS7LJjN
 MjZ8nhNdJWrQ0PVdyOA==
X-Proofpoint-ORIG-GUID: wpg_RH6wSvaZvXXeB5I47aYFYePgj83l
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a478152 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=CzlgM8hXaGG7tx5CzA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX9WjtUJzmkCDr
 AcXwDyhp9dBNw81+4IJN+QkVxwsuJ2CcT6ttmNFY3EcuiIrhFhgdJIz2ZPHlfYXGKPKUbr8zhZX
 9dOCGTNc6LClhNN4YPVUpLjLupYdsvQ=
X-Proofpoint-GUID: wpg_RH6wSvaZvXXeB5I47aYFYePgj83l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030090



On 6/29/2026 12:09 AM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:
>> [..]
>> ---
>> Maulik Shah (7):
>>        irqchip/qcom-pdc: restructure version support
>>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>>        irqchip/qcom-pdc: Configure PDC to pass through mode
>>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>>        arm64: dts: qcom: x1e80100: Add deepest idle state
>>
>> Stephan Gerhold (1):
>>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>>
>> [..]
> 
> Something about this series breaks the touchscreen interrupt (<&tlmm 81 IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(
> 
> With this series, that interrupt only happens once (stuck at 1 in /proc/interrupts) so events are not reported. Something something level triggered..??
> 

Hi Val,

Thanks for reporting this. This seems likely because patch 6 of the series adding IRQCHIP_EOI_THREADED flag for gpio irqchip.
In v4, removing this flag and modifying .irq_mask/irq_unmask callback for secondary chip to have similar functionality as IRQCHIP_EOI_THREADED.

Thanks,
Maulik
