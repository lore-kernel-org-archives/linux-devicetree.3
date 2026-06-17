Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A733E9F60
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696572; cv=none; b=bKReVlEjUhodS01EAGPz9QzY/4V+MHwldcK7BnSbquiZlsJ12cs/2t9hmEWReiicAf4rbRBh79PPxRtV4z6TCcpXfxg6RLr9KIa/UzfnDrPGRNQ6VvM5Q91q09HNAldmvReVv4rC37P+FPZDS6ce51ZBGVYEKPCeAVPrXvd4P0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696572; c=relaxed/simple;
	bh=dgXo8IvB6nMkU36kHzCsSBiUJYrdYmOW8fzDb6MDZtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4WnxArg6FfUvK4tchIcaLdIR1zt5IF0knZ/NfEFKnejNra08rvViunUx8VQc2rRiPNksmgwRAjlX6APVX/iuOWtpm+LHk5XVt95VFvAx3ENbwHkPOmFJhfVW4sWTPZwXDlzrcBbOfTmBCgwoOESbfmT+N/XPCFJNZJYNNGhDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXB4EA3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmRLOq8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXB4EA3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmRLOq8H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UQTr1703267
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=; b=HXB4EA3SLJ91OwFt
	uyM0i9cJVZUdHNP0qEw/sglDmBR3qmXpBt28pz4CQ1gp+VFyaS8qyHv6o8KfM4yF
	+nGOByU3XWjrGeOuzlqAmGtBkBn9ez6/WwO70zYrLmzZsUu8PDIHykghAd2gCAV7
	hzTaNEL6CSrq8RdG2WjNW/Q2QuDBB9rkfUxp5b96f3zvOEmJ1HPUPXtoqgzP8SdM
	EnTk1lkVqNM2FXEOBKRFLrobyXJu+d8fMnH/etRHn7pYgp2F4YnIQmcOfDXgvanw
	zsoVyzY3gXgM966DCx1fJxGtWWWqwJYg3JuXmKMhEStB+8kwcF2fPmhl3untcpgp
	z4dC+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2u3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:42:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915732517cdso26269285a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696569; x=1782301369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=;
        b=CmRLOq8HyHy+vm0fQl7sfmhGmDqOIKLiqBqbJonpv283NJ4UNEozZC5mj/R0FP8po5
         FS56FGDLDOw1ZMuEA/h8uUdIKnyQV/+iDVqQ46/J6DgIs+oV0QXgOoKMgvHNjNMNbXOv
         J0bhKOD9Q1hxDLfZPcqDyKe4vZf3oYRIXOEDrQqhkkobRmGnKpHQmyiS65VDYwcnU7kg
         x+8ZEeP34I8vcgIALb5XpKKvV8l1eqK+awgPK+57GSmBcgP1YfeMc5PJtMA3f2Q3cxOg
         lc8MeqZO3ePELVYszH09U7sF14OIFp8dQxU7j1hmlykcPQFpactsM8dH4VhCOfSGczmr
         yxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696569; x=1782301369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=;
        b=bLyPi53bl29IGtTaTUKk9vjg/uOlCSs+ATNQAA19uNcLHbT8qYCYcz57ce+/BM5eD7
         w+jJGA/Wm/FCltjJDZz4+ldFXa1+Skoq082/ffPNvjeuHywxkVPhPTDGYhJcO/1U8kio
         qDq6XlAgHrLxNZVzOYTnIMyEqMIowxPmKfjG43yMpVSQTMSxS/jXshGHtNEbHtj9lebN
         OfXIzZInvs9rq5CuwbM6xHd2zkLyDIaVds8TDvYGQABH74Int5G5VDikKjsv/jY6mlAY
         g92G4eOFikYmvXYeAh4JCiHAkHHIS6P3/VYl0q5B5eCDiCk1SyFzf9CITqQJHlQQlfHX
         M3gg==
X-Forwarded-Encrypted: i=1; AFNElJ9p/chxnkFcsPRjfW9kSoIev1SuEwNpN7BzAJFF+RM+LCbKK2mdqszZE1ecdFZrBRRbCgz3e6Mx4Ikv@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWU0wDP6bCD7pjotILgYn2VBtS5UZ1lY2WUTQ/URH7horVa48
	aR7YOJfcjQV5qDV+NdWEL9WUqjab2ww9mE2iXEbdbaJ4xy9SQTQVgVUE3s+Bae+AL+oDv8VJvwX
	JWy4KBOnCgrFrLePqIkuu2/LUUPY8RcEoeqVX5gMgjCpSD9fF8EYlX3Yo03s6Pu0W
X-Gm-Gg: Acq92OFaCa6HEdhxQ9ty/8V0AnHHy6dt/GuTOff6dBJmpaFMglcGJ51l5i3M3H+f+ii
	OHybWqECRPt1f9Q6vyD26NZKYPWfy+xh5g+gHRlzuZtLt66m+7RO8+kCfbUQS79IIurRyFykZW6
	7VxvWkBkyvLZwhemiaV9A1urV5E3PpE2ZtfyduP7RvGzqiKJQ4iT/h4nwR4SANARFkkdmJp2HVY
	QeH5+0Qmm4YtOXVDRTpZjNZMukF4HBEomid0X7XvNQIrL8P2xcBei5K85Mts1EHQfpzqCH97QDH
	UWtP7RHjyfkbdzc3DKFuUB0MjH/GyRAGHk0XDv9dEHlJVTWpvePcP0QsMLiGsRImTlMx1VkLvC2
	cPY2Y1pGn11JG4wqdCVL6Zt2kpWPettV/RfE=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr273172785a.7.1781696568635;
        Wed, 17 Jun 2026 04:42:48 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr273170685a.7.1781696568174;
        Wed, 17 Jun 2026 04:42:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm788394666b.6.2026.06.17.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:42:47 -0700 (PDT)
Message-ID: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:42:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org> <87o6hk9i29.fsf@bootlin.com>
 <aifktn_s2qmg7MzI@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifktn_s2qmg7MzI@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WOjikCV9gwpy02tCjdr37rRvnPLbXhhL
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a328839 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FDdbgDo1gx5wMt_MktwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WOjikCV9gwpy02tCjdr37rRvnPLbXhhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX74gE1NBw7V7d
 pYgw0IRNGYFmTwdbSKrp546dS8/gXKktlLVpIGbn0tzyuGxLCyhZ6CoI8z8wrXsaTyJWzTzzZPX
 tg+pDogZeEryLrS7XA7xTzWFxhgRuk32DJBzWzAI2RBMKKcqpYvmtyqfGkmo5025NiuHEQ05YHI
 2jfVVK/wwzJkm2aBVcCHGpcMwTuYMKb1QiurJpI8k8rlA+NbRG03zXPNhEP2CEI4QxtIittQdN9
 2rz6QPF5aU5h87wiiaRj+LTa/beHexrUWx46bA7J9aQQhc5Z3RFMA72MExMN3XJdeG9m9W+hz8v
 cSG05XSkfkP+wKteZXOTEtewz6eevZRYhS8KAPYGA4gFeTCsyJF95PG/Kqu8CsEq+LeUZ461cwI
 37Sc2gdPQft6OZDGmSoiEzswjSVVZ7foKjs9xO7jD4+5PGYiuarVTTdCMQK4QTio+78hWo+hqPd
 sVKMzby7Gk9N/mobe5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfXzBkg4fduCHNJ
 /Z2mV+8JymF+4RNMsMQiS+rwbguZ8xhaCzl8cNSdilN/34+7G11KM06NYm9XfrovMjXJK0+CoOM
 AWwlFfMun7PcImM0b3+LpsShnac9vms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170110

On 6/9/26 12:02 PM, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
>> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
>>
>>> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>>>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>>>>> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>>>>>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>>>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>>>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>>>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>>>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>>>>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>>>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>>>>>>> clock entry in the dt-bindings.
>>>>>>>>
>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>
>>>>>>> What is the problem in giving twice the same clock? If this is what is
>>>>>>> done in the hardware routing, I do not see the reason for more
>>>>>>> complexity in the binding?
>>>>>>>
>>>>>>
>>>>>> I had that in my first draft for this series, but this would be wrong
>>>>>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
>>>>>> this platform at all. I'm not sure about MDM9607 in particular (maybe
>>>>>> someone from Qualcomm can confirm), but a similar platform I was looking
>>>>>> into at some point actually had *3* separate clocks for QPIC in the
>>>>>> hardware and none of them were called "aon" ...
>>>>>
>>>>> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
>>>>> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>>>>> from GPLLs)
>>>>> gcc_qpic_system_clk (32 KHz)
>>>>>
>>>>> No clock containing the substring 'aon' in its name on this platform
>>>>
>>>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
>>>> The NAND documentation says
>>>>
>>>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>>>
>>>
>>> Thanks for looking this up.
>>>
>>> IMO, if we want to describe the actual hardware routing, we should
>>> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
>>> MDM9607).
>>
>> Sounds more accurate to me.
>>
>>> The resulting diff would be basically the same as this patch just
>>> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
>>
>> Diff would not be simpler but more accurate. So if we go for a
>> modification of the bindings, I would prefer that path.
>>
> 
> IMO the result wouldn't be much more accurate from the perspective of
> the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
> effectively saying "there is a single clock with a single rate that is
> sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
> 3 separate clock domains with separate rates, as shown by Konrad above.
> 
> We could try defining dummy clocks like the &nand_clk_dummy in
> qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
> these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
> clock for 'ahb', then enabling that clock without also enabling the
> non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.

I can't find a good answer for what RPM_SMD_QPIC_CLK controls, maybe
+Mani or +Kathiravan know where to look

Konrad

> 
> At the end, the truth for the OS/kernel running on this hardware is that
> it can only see the 'core' clock (with the option to change its rate).
> All others are invisible, with no way to influence or check the status,
> so pretending that we have separate resources for them doesn't really
> make things more accurate in my opinion.
> 
> But yeah, let's leave the decision up to Krzysztof. I'm happy to change
> this patch as needed as long it works at the end. :-)
