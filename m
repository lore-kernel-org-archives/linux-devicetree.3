Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3B351C14
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610296; cv=none; b=Dccp+gCQTDA7r415w12vBR6vOTe69JUKpAcdcYlzpWMArCo6cF9f8mqFmAtpDZn2qISaUmf+wFHc2XmLEF+49hxu1QOI7FksHO+vcwDsPa5Xuzb96odSejvtvJiVFWkTC77SS9oGa0IKSKoCejkYesSwOo+d3zhL6iqP2lyxG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610296; c=relaxed/simple;
	bh=r9n7rSawhFk2n3APa8yaNvcfOl3foSyuI8+jSLMC6Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rm+2mWiUaPYwxEKiwzYdsq13yJiQZqOlLnXeeea78rnupB9cXdFnbr+HUAEontyTdLsm7pNJz9zIjJyPCaewVtZvoDrpaDMKbz4ErQ4dKC7ZY6j9RruF+Q1nSvjgDs5wvb3Vig2v2/+gj8KGWwwfzG327X7I3OG+tlG9ZA0QhR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPReZeR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZjnRtCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPReZeR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZjnRtCq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACDus3455530
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=; b=nPReZeR/Nm21IuxS
	g15voOVsgC/IyaqAszZEKiDHXqD+No87PHZpmFoc8OR8e8oQoNpDaeb3ehXTTGXp
	89D/E7PpxBd5sCwOt0nkVWJ/KW0q17ezksDQWn4RD+4zKzLece5a7+JfcQQD2n/n
	wj3xR9XtHrBGnDtmHdfxK+i9owN1/vhQcJy3UuoWWDeHdEKj9WTisa/abkKMAifZ
	+sx6E6/EpbNEmzZRv1AxmaxU5RvxzGXIFPB686PuK7aYbcCynh8IrKIyMwlz1IcD
	oi195vbZ5s03FVpMoKke8HjH7165s2W2ZkrL58Z/eVb34lp6MSvyzdIrzCIn3nL2
	WjdLsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkge5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:44:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so42976185a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610294; x=1782215094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=;
        b=fZjnRtCq4Kgu7ndD4uUIs6eWD1f1ryuWp9jwwZ8j3OqdRO9JqBJVvbW+TYDbSJb6pV
         4bqovp7vB8uhbh2qO5AjEmEa184StBVa9WH4p5TOCS85BLM2kHydQz2Kem76n6qk40XJ
         PsgqjIcnqfl4Ch7y+qSZbUT4MoapPQijzkjjhKPZ/s05eB1WTze3nhRlINPjgA6pYlgy
         ZRuG5QO6EnVyeSbkUxrj8miOMBl7Tf4H++FNlDzi4V73yuNrX9+MhiWEQLtwjVxA7ptT
         10RWcXVlZ+TTEXE/132+IXqo2eFL7qmyWWaH+o8MXEi9s4aQz+/IQUT3nOVgQZjlEmjN
         JJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610294; x=1782215094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=;
        b=POQ6tKjWoCdlGn64MMT99epdchzN7we8tABLwp1wdHftTBYrcg9joMrhElB76MRBf4
         ebN2i4R2QQ0bIL3tuuDOYIjK0UoFZymcNjY6iH/+wNXwFoT63wU9z1D/MRc/oDiFQpYF
         ULGT22wtdX3ascqtWbMat4ZThOuZFCrHZIpoxlwCEy/ov+p2/L2UCFYbjmfUqQsJre+h
         jrmGgkswBIC51NqT0cgfzoC1ud3PnhZL3VIeribQtYHKAylPH8tt60fsHvxHgrFgCV57
         wR1sPdGY+dvaraFRM6/CMI5v6c2I1sezSZSUaGRuwyo0/OnYV2QBHQIfDeP+JLcQudk1
         YwkA==
X-Forwarded-Encrypted: i=1; AFNElJ8e7aC7Y+VroaE6D0ePaAE8VwfltZJbn8wpE3IybawYnhTFYKg+Hs3XL1sgnm7ypcLBBEpZV3WWoaBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbKrflpbz+eqYOPLuKbiPpw6NaXxs4ISzLP+dM/iyCCgBayZ6
	JIN7cZ/mlub7x3kK7s/1WCeCgISafqy6n+8xzgrJ7oCpHQURwhD+5qFMt/Dqzk+gxbobevZwTFR
	635NZCyA0OddhPzIlz2u3S8DusdBDhbZLrKK5k3v829uBzFZbeBTwu6ZYK58HAhpo
X-Gm-Gg: Acq92OH5YoS6uFs85Uc6vAhAn2D8iiPShxDNVpHhn5Izi/kiGNmb3mDKEiH7GgY2VRv
	g1ItHy6JULT6ogmI1OhEEFGjO2pIz2f7CsIk66n2iv1YRHBEJEiivAQQ1zxvM4DrONq6Pkc1l/n
	FgtKyolWPnHjcBu4E5lViboIVF2/Zi3SW8105q0N2f7ba6Oynz6RowFpqNtPtTVaIrFBfjQYsqq
	Dk5uN2BY5N2T+v4//0Ln/wDPGEbyYtzZOK2iksHCwrNTcrLzQeEe/pzfL178Wy5LgwX1Y2ZCsQI
	NlonmOo2ju3wQE44Fe3608dFrDZxafTzqjGEUiM1RTDrWhUWTW0X7J2dIAoYH6J5w8oY5/f/sbf
	un7+X1hrJALlsbHX8JpmbDshlnU3DhSK6YXZ2zDMFiWaBQQ==
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1637963985a.0.1781610293644;
        Tue, 16 Jun 2026 04:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1637958585a.0.1781610292515;
        Tue, 16 Jun 2026 04:44:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm611669866b.38.2026.06.16.04.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:44:51 -0700 (PDT)
Message-ID: <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:44:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
 <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
 <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y9BxIO3k36dLV9CDpZDyEP0posHTSw0o
X-Proofpoint-ORIG-GUID: y9BxIO3k36dLV9CDpZDyEP0posHTSw0o
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a313736 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zUi1tAqb9gt6XWnjdEwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX7LS7CYJIpXdJ
 jARO7YWmi4YPsjZlCvILSXa0z9rTFSETJYYllAJbYuNi1nphy0qywhis89efLO5g8J5t8XHaujh
 MJdNB8zBkmjbhWVn0jJK/vDbskLoneEjWVhhyZE0lOLWJlDFpDHA3xLbCj84+nZmQtiB266Uwsp
 8Nrj3GR9X9H7IIKKY/wr2cN2LhQ0LkD/i8pt/OyLEL8lb1bsHXWdKs5fPyKwWztLFJhoD/SUsIK
 Sm0IsL21YeugAjemZdTLdjyfRrgNna0DLLRViZWq6GI6Yg782qsWGJVjeE04TgOVYJBr7oNgUOc
 LV/AGVaQpD/PRXPBpHBL9W9yfRscLQio3EbaEZnOid/7taXULJnu+k+zHBgD++HARLuYwcxsjzy
 d3xSulrDwP4LXFBBaebOUfcEIlVZtAYoX/KHyq8FD4OkPAVLvre+p3tbKaC455JkX4020n+pLoZ
 IM1gjDqilMrcKGMM7TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfXywQSMan8FGpN
 yC50e+W7gXFFNxtu5rmSOzWd27GQcIwbx44lpnoLR/O5pi/uXcw65w9xFRRqnZbmEsTGq4kJtvI
 YlZeWgkheyp1YLyg0B7W5QFxkjiF++o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160119

On 5/28/26 10:00 AM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:05:14PM +0200, Konrad Dybcio wrote:
>> On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
>>>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
>>>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>>>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>>>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
>>>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>>>>>>>> The DP part is roughly the same as on the instances without USB4.
>>>>>>>>
>>>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>>>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
>>>>>>>> given moment (not to be confused with USB3 not being able to be
>>>>>>>> tunneled as USB4 packets - that of course remains possible).
>>>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
>>>>>>>> turned off to save power when no tunnels are active, but that's left as
>>>>>>>> a TODO item for now.
>>>>>>>>
>>>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
>>>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
>>>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
>>>>>>>> necessary, as the Host Router driver is going to excercise manual
>>>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
>>>>>>>> and resume flows. Failure to control that synchronously with other
>>>>>>>> parts of the code results in a SoC crash by unlocked access.
>>>>>>>>
>>>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>>>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>>>>>>>> submodes.
>>>>>>>>
>>>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
>>>>>>>> couple specific overrides, pertaining to electrical characteristics,
>>>>>>>> which are easily accommodated for.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>>>>>>>
>>>>>>>
>>>>>>> Overall it looks good. The major question (after looking at TODOs), do
>>>>>>> we need a separate submode for USB+DP / TBT+DP?
>>>>>>
>>>>>> The problem space is as follows:
>>>>>>
>>>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
>>>>>> we have a link partner, we may (based on the HW capabilities and user
>>>>>> config, such as kernel params but not only) start or stop a DP tunnel at
>>>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
>>>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
>>>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
>>>>>> as a separate DP AUX host)
>>>>>
>>>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
>>>>> separate submode or not. I.e. I see code (and TODOs) to detect and
>>>>> handle DP going on and off. Would it be better if we specify that
>>>>> explicitly?
>>>>
>>>> I really don't want to end up in a situation like we have with:
>>>>
>>>> $ rg _USB include/linux/phy/phy.h
>>>> 29:     PHY_MODE_USB_HOST,
>>>> 30:     PHY_MODE_USB_HOST_LS,
>>>> 31:     PHY_MODE_USB_HOST_FS,
>>>> 32:     PHY_MODE_USB_HOST_HS,
>>>> 33:     PHY_MODE_USB_HOST_SS,
>>>> 34:     PHY_MODE_USB_DEVICE,
>>>> 35:     PHY_MODE_USB_DEVICE_LS,
>>>> 36:     PHY_MODE_USB_DEVICE_FS,
>>>> 37:     PHY_MODE_USB_DEVICE_HS,
>>>> 38:     PHY_MODE_USB_DEVICE_SS,
>>>> 39:     PHY_MODE_USB_OTG,
>>>>
>>>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
>>>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
>>>>>> (and each of these routers is hardwired to one of the PHYs).
>>>>>>
>>>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
>>>>>> super high-res display at one of the physical ports, or a long
>>>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
>>>>>> we would only need one of the PHYs (associated with the router that's
>>>>>> wired to that port) to provide a DP clock.
>>>>>>
>>>>>> This, along with the normal (logical or physical) present/absent status
>>>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
>>>>>> or something along those lines to toggle that bit as necessary
>>>>>
>>>>> I don't see phy_set_opts(). So maybe a submode then...
>>>>
>>>> Sorry, I misremembered the name. The function is phy_configure(), and it
>>>> takes a union phy_configure_opts, hence the confusion
>>>
>>> So, phy_configure() will be called for the DP PHY to set the DP opts,
>>> but how do you plan to determine if DP is on or not? Or do you plan to
>>> add phy_tbt_configure_opts ?
>>>
>>> Another obvious option would be to set the flag if DP PHY is being tuned
>>> on / off. I don't know if that fulfills your needs.
>>
>> Either this or tbt_configure_opts. We still have the muxing question to
>> chew through.
>>
>> The bottom line is that all AUX traffic happens between the "AUX adapters"
>> within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
>> and the far-end device (and anything inbetween in a chained topology) meaning
>> we only need to engage the DP host itself (and therefore the PHY) after we've
>> already performed the capability negotiations
> 
> I hope you mean USB link capabilities. DP host still needs to ping LTTPRs
> and read all the DP properties on its own. I don't think we want to leak
> that to the other layers.

I must crush your hopes.

There's some preliminary TBT-layer setup (handled by the tbt driver in
Linux), followed by the expected DPCD (and alike) r/w accesses, which on
our hw must happen through the DP adapters housed inside USB4SS (again,
because the DPTX's auxbus is NOPed out). Think of it as just another
i2c_aux provider.

Konrad
