Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10012FD1CA
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246595; cv=none; b=ueqQn6NhrdtO0P4iwYHIzqnhJCbCcfrY/Gi/+/h4bBygjVqnn+71SsZE+QCXEf8/eOtY2sRvhlvWQqNBIFKrCsMHLJXZ0mERWm/9HLXIP73x65SLm5bYmSd2RIxGWTi4WTi5zOUkdJuG5NtrehTWvrVbgHUXhhuc7fxM6vgl0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246595; c=relaxed/simple;
	bh=fj2BDTolpIHjrNcpJ4WVAWJObJAgy1V02X3sJ8SSQQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAwtOtQ8hpqYGwrh9uxQGnDjuOQ1w6u3aSeExRY3C69BBWG0IMGwu4jf6P/YFhokt9Iu/z8J7p1cfoRKp9gCV6sT19tEFNxzDne5OEFdKGxFEgEcL8i7Mx5wn1CXMI2ODCvgxvIy3ty6KeSXjWGpEH8vHTMXqbJpgiwE3tmw3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtH2M7oW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAJhW3KD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtH2M7oW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAJhW3KD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BbFd2548181
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=; b=XtH2M7oW9JPOsZWJ
	iHfSpi9vnqUy5YGyEGCXw3UU6IzJljTcb4CeJSnQmLl1IYfbE9sCanXF0/bxt/lE
	QZbEuCUXXxPCwUO2Tf1d/1moLY0MqDS/eGOOmSZvEehMkX526kmyZFIKOqeFor0J
	kyvyH/6THMVBvBbVwqc7uXNDY89ULDzrS69jE2eu8DDiUunX56UiChP3S/2MJrfd
	IQxMIwZHyH2D01w9b2S/c16DreByhIGSlTHnwf0OUbm8fHKxrwsEKrGOay0CGvSu
	oqHcJTDteHCzvQBYWD/a/ZAloBPiw0hateVQxEjzK3xx5yGRw5lhX8oz7qWnl1wa
	KRY/BA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ut1ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:43:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc02d28b6so555205a91.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781246592; x=1781851392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=;
        b=aAJhW3KDulO3rQsYsa9fvw6c0kXxAbXCizjHJfLqgfkZjZixgfvL9+ckZEVkswK5Oh
         EAKeXMWwX87Zv0TqOW335ayribprOazJ0n23/FqmrRuhiD5oYduS4qJDj7IirDIsBgiJ
         jUEGci3bGjwM/jppHRZtvcAR9805XQcGrkcS0PadoR6tY+uarvUZwSAMQBoU5sVCFGwK
         TYh4hQBcVQBjnx3Qk1yy6g3/VN3DCm2nr0Fjr7CC8ywXXyALMLPzkTNoKRSVkqt7S0y4
         iawjmvIT7zPDp89aAamWDq7LLDJEywJ1cFkOO/5ffjjD9pctOFX6+Jw3TrE7m2ab6g4z
         Dm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781246592; x=1781851392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhRQQ0HqfVlogSV46vuX6Ct/PmcPgUZ4ULZ4DIlTmCI=;
        b=qlgY79miKZeYWc8kwkro456nqFhmh/MavERHjlcoPymG4n3GLUIduks/rG+oRN1P5e
         Ma1TDXGikTZ+WT8urij5nknHqLHjY5PlsbvO99ogv7FSzOCs/CiAfJrCDJuSXLkEp7/R
         YSZRdq49ph+RsmZeyR9lIwd1wZOUH6v0eluN8nY/W7fbnMGFs5sNCOjXN7CIZ0Iv2IIw
         pTvD9zKHxKP6rjY0vh7uBg2BBzifxgKWN64d9Kc+VDR2nm6SIE+Zbw4wdTQkYbeC5GQp
         4nchcgmMelJpW7BMcbXFiYrSW9ccZ/ZHfO1wd3o4s/7wIinFzOF1vd+GkpsGER2fAEdW
         qC4g==
X-Forwarded-Encrypted: i=1; AFNElJ97CnN5ulpoFk0PHClLcMsA3E1XMVNV9F4vL1K2SK/2Ia/8GVF+zrzFBYUT4EwahMP0Q/RRMC7+oUcQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9O2q5wp4wfCaUwDFn+4z7F5JDVCuW3bHGfqi+DqsxDTFgHt6
	DoAORxp9XgThwflh2IB5QFoaEsKX3EvK7KW7RqxGwKPB9BPcw+Xzzpcga7jgu3l1/Vi6EQgN9Gv
	WlXtosGPhV+EoG2/IAlEDXwKhD49+ajiXjqVmpHmC8+VIw/gji7tywljTVwQdeQpUT3hCAVEK
X-Gm-Gg: Acq92OHu3ftWuQX8ciaRfez5i7u7TPf3liBtfagP9ZwGDfqdJOdOwIKYbGh3LyipFzN
	pM50UpaB7B+Y0XN6JPLv4P4feKpHGh2D/kSq2DaNmfmHn14Wybu/MBZz91p+5qaUUzPq5SV+De1
	gcO8zS6Rtq08sPcQJs2pQeGecrAxH/94Gn7QjuNxBaabk3j+QNnpL7X8sW7CZ726SOx1WrYI7yB
	xfwvtuEHHmMCEUMuNaOW0ud3KbDiOtYK/3jJXLttSpe7jMkYIXWfro/nCb/9KZwDSYJiSeeHNam
	wn61m6ubOdBWm8prk2+S6XdbNw57r1o4oRH3t75iyN4/w4Bi1RK6hfodD6Hzaclur9Q79vmipGX
	evZAIFC9VZuK51oAZqOPD+XJio+XJG3bYGlCX9RwKmj/wriqXWxC7txnomIjk+VA=
X-Received: by 2002:a17:903:32c6:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c41050947bmr19439255ad.12.1781246591658;
        Thu, 11 Jun 2026 23:43:11 -0700 (PDT)
X-Received: by 2002:a17:903:32c6:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c41050947bmr19439015ad.12.1781246591074;
        Thu, 11 Jun 2026 23:43:11 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm9266445ad.21.2026.06.11.23.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 23:43:09 -0700 (PDT)
Message-ID: <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:13:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
 <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1OSBTYWx0ZWRfX/zAkfhHAjYQ7
 pIUa1vVrtJmWWEH9E35LCHHzUK8VBkcBJJ3jW1Jg77vkThVdq1lQgFG4XkV0tC5ouR+Q9TReq05
 m0Cm434j/MVzCSerznRbMrVM7Y6R6wo=
X-Proofpoint-GUID: Rfi3iUZu_KKSOOARAGv8Qp7Lojdrqec5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1OSBTYWx0ZWRfXyRO8E7dYKPCV
 e3tJHVHd99+I1CxEcunLMQqJkthYfq7zgxcCDnDiQBaZSnG3qD6PHF0pVXq2GIAmJqEoNy21oSS
 wtm7xtAD7+vWqG2+t3FoMU9OVIbxjzp4atLEw6EN7a8S/OMbzaZowfx0l1PDJ33WtgmrcQGWKz/
 xpj0/B4c8Rq6u81mcVG5evJ1Cd9lCFz2PqJacATq00ubpIbt6d1/7biqyf28RnD9YEyrKi96RMO
 wnVrFKIwOmkfUDMEyh7dJTJ1MvQ7/C3bLWz7OJfhg/qNKgq3eqBn1y4WjAiF/tu9zWuZVilinCM
 TLgF2dO3j4oW58spg8eYSK+mCx6wrv7hsTNOY2jx7XFm5mEJhMXN/6dSEPC1rBoLL8vIbxxVlgR
 31PamqKqs2wNRPuAr+L4toUALTJ7T6WsqzCk1trxlcfz8OzEWHLYRSXmDi5014C1nXSdRg2xTf5
 5g8MN/tH+efb6IACjDA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2baa80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=hfAPQjwllD3DkVB7DTwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Rfi3iUZu_KKSOOARAGv8Qp7Lojdrqec5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120059


On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>>>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>>>> supply.
>>>>>>
>>>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>>>> refgen regulator supply.
>>>>>>
>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 220 insertions(+)
>>>>>>
>>>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>>>     	"vdda-phy", "vdda-pll",
>>>>>>     };
>>>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>>>> +	"refgen",
>>>>>> +};
>>>>> Now vdda-phy / vdda-pll supplies?
>>>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>>>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>>>> and no SW intervention is required.
>>> What is it being powered by? MX? CX?
>> It is driven by CX.
> I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
> this chip. Please provide some details on the commit message.

That's right. No CX collapse on IPQ9650. Let me rewrite the commit 
message as below. Hope its okay.

--

Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe 
controllers and two Gen3 x1 PCIe controllers. The PHY instances require 
the on-chip refgen supply.

Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with 
the refgen regulator supply. Note that an on-chip LDO, driven by the SoC 
CX, supplies the PHY voltages without requiring software control. Note 
that CX power collapse is not supported on IPQ9650.

--

>
>>>> regulator-fixed doesn't take the resource 'reg'. May be should I create
>>>> another regulator driver which accepts 'reg', something similar to the
>>>> qcom-refgen-regulator? Please advise.
>>> If it doesn't require control, there is no need for a separate driver or
>>> separate supply. For example, the refgen is being references only by
>>> those devices which require software votes.
>> Thanks. Then let me respin this series on top of phy-next so that Vinod can
>> pick it up.
>>
>>>>>> +
>>>>>>     static const char * const sm8550_qmp_phy_vreg_l[] = {
>>>>>>     	"vdda-phy", "vdda-pll", "vdda-qref",
>>>>>>     };
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
