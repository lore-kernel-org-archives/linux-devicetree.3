Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39B3A7D63
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217467; cv=none; b=i3wZLCVvflSAK1uDJaEBBUcvqNRHmbh/SM7v8jhs4mNdYUusJQvVKAW4H1Oo+dcOaRYcimMzoXw5fW32c62hoMOwpSz/gtjPYFLyQ7Xl538PRZhogHvaSYq2nepGJjeSc1343N5VWXtKLd+HY58DOUf1t9LB4xzfPFEL8utbLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217467; c=relaxed/simple;
	bh=3T029fq6aSJBubP6CIrM4eSqadT1jYbcXWfMHerM0y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snFfO0QacJFa78OH1U0Eimq+wF1ln+X7Tv1eITdfJstNWmd40q6gvoxN+HzYczDwvHUgWP2ObLUPD6LIr4pLtx4N9YSbtc6onE7wlSfruGVVyVN0NmH3jdMXApy8ePVu7ervHE5p1yQnte9mjViXGd5b+42aJZ3ImWMNjw/wa54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6jCQA+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLODu78q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6jCQA+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLODu78q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3tqdP1919996
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XJ9dZhmjMEIXeBV0EiJuypbB36kB0h9MJwpLrHOSwY=; b=p6jCQA+SpGzWL0sE
	sUuBDiXsJIafaqM3mUX1pqjXSi0OMCdtEy/lbvqCJEuxWHKDzuMa9hjX+SkFCMbw
	2mVLWR7AV8Y/qFKqimQBI1tNRlAcv+Qis0WAkxwrgpNzDHtAcZfcQPvOumv+Nxrd
	IkWizQy6kdVVxAJkx8RALvNh9MtFZ16ANQMRUW/rOc9IbTrv5LZCHn/Lf6JLiyG5
	PfKvdFY+ZeCOkzWr+dSjj9QaBTE6hwJ7DVt3Zx3vIz5DCTtEoVpPXNj+qCG/5u2X
	wfq8HvlzRzD9EeGYBTouJ3H7n4be0urAM+EvQsaBYyyzFZHTUHd9K0G0n4F/HsMm
	8q/mhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy10ak7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:44:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1080179a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785217464; x=1785822264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XJ9dZhmjMEIXeBV0EiJuypbB36kB0h9MJwpLrHOSwY=;
        b=DLODu78qNWwuKaZ54q6M3GRCDtyMro89K8sk9+VASqeS9NJCll0Jbbeswtq7LXbxAI
         4w2rCiXGDQEOXokTja5tBeDsdVYsqNgHJ73KENiGILa3Qw/Rjo6Me50MERZLMY1fJGYL
         Gs/W1+DNEv9cCOkHdKZGSPciv29iG1QBY1+9YjgtoPqnUo+WLbd9MPajgW7tAaoEBgj6
         Ax5q2GR29jcgks/8dZnh8i5MaSUEIfeVKfg5/Fre25EUW+w9FXkLEzpHXBL+HTa15zP4
         RybrAJiY3W3LJ6g2WXOV4P0mPcl6H7aIUuyME1ziCB1Bdq2tfy+SHA/+AUbS2dhQx7i8
         Bk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785217464; x=1785822264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XJ9dZhmjMEIXeBV0EiJuypbB36kB0h9MJwpLrHOSwY=;
        b=LsWaLiqJbMjA41XhoYw2uaUk/cF3xv32c3xvfrny+IHDskizeRsB7Gmo4825a8sRH/
         yCN6xtP5Ywr3uY687LJtltTJFW7d5SeL6MqyLsPD/k8KbCt0vZP942JNaU85lyVc/OrZ
         XVvStvi+YTY92Ul3E2A37wSSsetv3EKPtxgsGQ32Yl7TkGdsViwz8hEDXxuToccD6Z7+
         vVMtpSddIKfWVqQMuE2J4s8b//u6cSWrQEP6dSG8GsfAA0xftU/qaH9vqAC/E3N09uuS
         +85eoiVgM+K+618KDMjgq6LuClwW6Qvc6u8SW2790OH0ZKbgxhiR0Ow6eFZmP9/Pygbu
         N9nw==
X-Forwarded-Encrypted: i=1; AHgh+RqJvh3arCKn7gDZfPdEXEjkNeeuVDBBUOybj21Z5CjEwbVmelOa98KN+PbweuFe+l4no7kTGp5PtQuR@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlJGvQF4SAQvPPOw2lnE9j69+39n2YwrkSnmhNADemo5W3Q1n
	igSZHgzDYD97yhYYYIYhHHJtRV7UKYPxFFq4bjPP45OQsSWHyDknwvYeSx1debC/q5lDfHd2bnJ
	q3q1JwiAEJOE7eL/wl6px0ks7LwJ8oUaRA33SD51zKRoNJL9sVl3QYC2Ox/gwOC/9
X-Gm-Gg: AR+sD13J6Z7QwUy5ei3EcaAwEW21BhRfAO9hzwyWgMZ/h5Zh9QY+gaBQZphwBIXvvva
	VGJsLnKnahdYWUgm6C/ong2YzSckVSRHbJ5B6jEzScQyiC8prFsQcANdZqBSFoZUwFMkIMnwuVX
	qFilm5KkJ2Pzqe2xJkIqv+ci6MUV+WXZXYnAO2yx4+clIQxWFNuwUgFJxE9O2wEH42sz83Bw6JE
	aQituDS057aWf2ILLWBn5mU2ntiKUd7nACiKJSEa3dhTU7OOfiAOIxnfTEgfyEWcxBL9QGc1sTv
	XrEeuQnnQU5wo1OYbFIuJTbTQ4CNyBWueK34WCUPYn2QVD+/Aax/VfUBILW/vVJI7IV5UDFgQEz
	JIJWOBStb3/aJfZcKjjv8bMUlk10Gag==
X-Received: by 2002:a17:90b:2e0c:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38f6a40fbf0mr1010516a91.1.1785217463883;
        Mon, 27 Jul 2026 22:44:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38f6a40fbf0mr1010482a91.1.1785217463379;
        Mon, 27 Jul 2026 22:44:23 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a118sm709542a91.8.2026.07.27.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 22:44:22 -0700 (PDT)
Message-ID: <29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:14:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
 <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
 <15957c47-f8bc-4d92-a6b4-88c9a546d807@oss.qualcomm.com>
 <vfj4efaef46cldwve4bk2rat27atpqtfyliewkbragm5wyrchj@ke5vcubecfui>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <vfj4efaef46cldwve4bk2rat27atpqtfyliewkbragm5wyrchj@ke5vcubecfui>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aNhWv9d9pxhywIT8OOzE7kRJYrjo43vs
X-Proofpoint-ORIG-GUID: aNhWv9d9pxhywIT8OOzE7kRJYrjo43vs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MCBTYWx0ZWRfXxODpJfElNVpl
 Q1t77CTYXtRilI6AKtQBNd35dilmsaQ9QQ17QXZ6hsVuQjBbpzgw02uvOtrsXk5Kwfxq0uS9Wa9
 ZuXKi1ub523ketsSt/fGN/Wlku50+lpIEUqE92vWbzop1tmFJMEbj09NXQ75z1+ennbcME2+M74
 Gkl1czIe3kzEFWY9M0b/kTVDy2NwZi/7/H2LP8DwmHHDywXlzYXAh1COnobkzAm+c9gKwmuf259
 9UF78MF4VaFVper0lX6sEH0qToBbmluAT5B+FpfpoGV98Z5Gjo5cCEAAQyx8hyrITMd1YQqcFjy
 qKfNuIcWzZVyw70vCIhrMk9pzldfmqOWBwFmt/gcqjziifennooSQtmU3WE41s8CUHFPyIp2aPR
 aLTdpoqUCb9nmtwnAReKS91v8NiT8z5asgy3xOi3arWwWAsJHmOzEXHRCjNEoL5pDZuwOFcalJl
 idAUZ4hZjW+Y8fDJezw==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a6841b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ULO9zmJhv1W09lwQwGwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MCBTYWx0ZWRfX1KO3hJ8YMD7L
 cLlpynJXbEi0L56PeTvDeIZnLVxi6+RquKr4wmaHzSkhFJnt91+sTsmzahPxzkjoWqIqC3aEToy
 DBtsWI+yVMbRVVI9Y5jM1XXYBbPbxP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280050

Hi Dmitry,

On 7/22/2026 3:57 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 02:35:42PM +0530, Arpit Saini wrote:
>> Hi Dmitry,
>>
>> On 7/20/2026 6:35 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
>>>> Hi Konrad,
>>>>
>>>> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
>>>>> On 7/14/26 9:21 AM, Arpit Saini wrote:
>>>>>> Hi Dmitry,Konrad
>>>>>>
>>>>>> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>>>>>>> Hi Konrad,
>>>>>>>>
>>>>>>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>>>>>>
>>>>>>>> However, this panel uses MIPI DCS based backlight control with no
>>>>>>>>
>>>>>>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>>>>>>
>>>>>>>> we control it via the panel's pinctrl default state..
>>>>>>>>
>>>>>>>> So this is platform specific pin , we need this to enable/disable
>>>>>>>>
>>>>>>>> the backlight.
>>>>>>>
>>>>>>> Handle it from the panel driver. Also please fix your editor to prevent
>>>>>>> it from inserting extra empty lines.
>>>>>>>
>>>>>>
>>>>>> Earlier I handled it through panel driver, but this GPIO is specific to our
>>>>>> Qualcomm Daughter Card, it is not going to the panel connector.
>>>>>
>>>>> So is it an enable pin of a voltage regulator maybe? I'm having trouble
>>>>> understanding how this is all tied together, given the panel driver
>>>>> uses DCS commands to control the backlight status
>>>>>
>>>>> Konrad
>>>>
>>>> No, it is not a voltage regulator enable.
>>>> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
>>>> The WLED driver is a boost LED driver that powers the backlight LEDs.
>>>> The backlight control works in two parts:
>>>
>>> _that powers the backlight LEDs_.
>>>
>>> So it is a power supply.
>>>
>>>>
>>>> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
>>>> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
>>>> and controls the actual brightness.
>>>> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
>>>>
>>>> So the DCS commands control brightness via the panel's PWM/CABC output,
>>>> but the WLED driver IC needs to be enabled first via GPIO91.
>>>>
>>>> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
>>>>
>>>> Dmitry suggested , it is not appropriate to model it in the panel binding.
>>>> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
>>>>
>>>> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
>>>>
>>>> SoC (ITP Baseband Card)
>>>>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
>>>>  │                                                            │
>>>>  └── DSI ──────────────────────────────────────────────────┐  │
>>>>                                                            │  │
>>>> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
>>>> │ Qualcomm Display Daughter Card                           │  │                                  │
>>>> │                                                          │  │                                  │
>>>> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
>>>> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
>>>> │  │                                 │                        |   │                      │       │
>>>> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
>>>> │  │        │                        │                            │                      │       │
>>>> │  │        ▼                        │                            │                      │       │
>>>> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
>>>> │  │                                 │                            │                      │       │
>>>> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
>>>> │  └─────────────────────────────────┘                            └──────────────────────┘       │
>>>> │                                                                                                │
>>>> └────────────────────────────────────────────────────────────────────────────────────────────────┘
>>>
>>> This is a nice diagram, but it shows backlight LEDs as something
>>> completely separate. Usually they are a part of the panel. Are they not
>>> in this case?
>>>
>>> I'd be more interested in a different representation of the information.
>>> What are the _actual_ panel inputs? Decribe those (and only those) in
>>> the panel bindings.
>>>
>>
>> No , Backlight LEDs are part of the panel, I will correct the diagram for that,
>> and regards panel bindings, I modeled only the actual panel inputs.
>>
>> Hopefully, this diagram will clear this.
>>
>> ┌─────────────────┐         ┌───────────────────────────────────────────────────────────────────────────────────────────┐
>> │    SOC Card     │         │                                  Display DC                                               │
>> │                 │         │                                                        ┌──────────────────────────────┐   │
>> │  DSI0           │         │                                                        │      DLC Display CONN        │   │
>> │  ├─ DSICLK_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSICLK_P/M                │   │
>> │  ├─ DSILN0_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN0_P/M                │   │
>> │  ├─ DSILN1_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN1_P/M                │   │
>> │  ├─ DSILN2_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN2_P/M                │   │
>> │  └─ DSILN3_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN3_P/M                │   │
>> │                 │         │                                                        │                              │   │
>> │  1.8V ──────────┼─────────┼──────────────────────────────────── vddi ──────────────┼──► vddi                      │   │
>> │                 │         │                                                        │                              │   │
>> │  VSYS_PWR ──────┼─────────┼──────┐                                                 │                              │   │
>> │                 │         │      │                                                 │                              │   │
>> │  LCD_BIAS_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
>> │                 │         │      ├───►│  LCD BIAS DRIVER  ├──── VREG_DISP_P (+5.5V)┼──► VREG_DISP_P (+5.5V)       │   │
>> │                 │         │      │    └──────────────────┘──── VREG_DISP_N (-5.5V)─┼──► VREG_DISP_N (-5.5V)       │   │
>> │                 │         │      │                                                 │                              │   │
>> │  LCD_BKLT_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
>> │                 |         |      |    │   WLED DRIVER    ├──── VREG_WLED ──────────┼──► VREG_WLED                 │   │
>> │                 │         │      └───►│                   ├──── WLED_SIN1 ─────────┼──► WLED_SIN1                 │   │
>> │                 │         │           │                   ├──── WLED_SIN2 ─────────┼──► WLED_SIN2                 │   │
>> │                 │         │           │             ◄─PWM─┤◄───────────────────────┼◄── CABC                      │   │
>> │                 │         │           └──────────────────┘                         │                              │   │
> 
> Perfect. So this is LED device, it provides backlight to the panel.
> Describe it correctly in the DT.
> 
> Think of somebody using PM8150's WLED with the panel.
> 
> For the panel bindings use only actual panel inputs. Think of it being
> used on a completely different platform, without the DC card.
> 
The panel driver already handles this generically. In ili7807s_probe():
	ret = drm_panel_of_backlight(&ctx->panel);
	if (ret)
		return ret;

	if (!ctx->panel.backlight) {
		ctx->panel.backlight = ili7807s_create_backlight(dsi);
		if (IS_ERR(ctx->panel.backlight))
			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
					     "failed to create backlight\n");
	}

If a platform provides a `backlight` phandle in the panel DT node 
(e.g., PM8150 WLED or any other backlight device), drm_panel_of_backlight()
will use that external backlight device.

The DCS fallback is not created in that case.

For our Qualcomm display daughter card, the DCS fallback backlight is used.

So the panel driver is already platform-agnostic:

- On a platform with PM8150 WLED → provide backlight = <&pm8150_wled>
in the panel DT node, and the panel driver uses it directly.

- On our daughter card → no backlight phandle, panel driver
creates DCS backlight, GPIO91 is handled via board-level pinctrl.

Please let me know if there is another way to do this,
or if I have misunderstood your comment.

Thanks,
Arpit


> 
>> │  MDP_VSYNC_P ───┼─────────┼────────────────────────────────────────────────────────┼──► MDP_VSYNC_P               │   │
>> │                 │         │                                                        │                              │   │
>> │  DISP_RST ──────┼─────────┼────────────────────────────────────────────────────────┼──► DISP_RST                  │   │
>> │                 │         │                                                        │                              │   │
>> │  Touch ─//──────┼─────────┼────────────────────────────────────────────────────────┼──► Touch signals             │   │
>> │  signals        │         │                                                        └──────────────────────────────┘   │
>> └─────────────────┘         └───────────────────────────────────────────────────────────────────────────────────────────┘
>>
>> Thanks,
>> Arpit
> 

