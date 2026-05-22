Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902A346A18
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451524; cv=none; b=JYwLrhiVwdw4uGE8blXGsxsZYALteLI73fQHRyRKXKIZxb0Bc3fiWSmTfyIkVu+LmVSi/xlLNYqtK7/SRN3wRSKixoV4gHfnxLOWKcQrKmSiNyUkcI19Kq+k1gkcAuFqKELERfOnwesnr4/HI0NReKh6e56YZvNt0eCvCD31cWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451524; c=relaxed/simple;
	bh=8bPCQx9vgOCU0cWDmOpsxkr3sr3KuUZG3ErxTmrg4v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ9UU6fj+s5AIrmkYxVtQzZeem6TYCuou8J3xfPkLAHIua7KfoquJRLstWH62CYR+ikDHEQ+vch0TFfNbEorE+oyHis2HgAE8Wmq1z75y1glWKxBmjPFSaAlIhVRuPHoMPhm8Ay02jMy4zH6h5/mP20AlRUBn4afz+u06/6CQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ptexrnz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsBU2RcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ptexrnz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsBU2RcH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8ZhNa3533229
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=; b=Ptexrnz+2y96YXX5
	jBcQwa2Ms7HXs/z7bUm/Ivh6W0CKprff2xeL4OLdUJ/VAYZQXlrATdmtYkSAA/8A
	iheCTTbWfmp9i0n/JogQtOMEW9m/KQYrGhVaZHpyAvDXUqQz1ZgRy481ZaLJCJDO
	0ASZcW+7J/jX+rEuwftvD2xOVMI8NvFy6C3uI7bUq7vWDCBZ/qIkbC8iAwi+uv0u
	sYzMo3tIi39F/o27GmXeWoHEFH5bGD4ZGUauTcz0TmYMLan5FRUJTDkVEpH6EjJs
	bW0HEaltIs60T3FD5BHNrXR7+t+R+/mynPvN7oB+gZGXplUZya5JBJ+CqoW+tqda
	kvy5tw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvx4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:05:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so406929e0c.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451520; x=1780056320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=;
        b=jsBU2RcH9buqNNPw/eOq35iFcQU5UXzFnOtFsUUFOGaR/A0dksQsWdohhuUbFGHiI3
         5jNmHAjY2QFSt4b4G3BVk6O70U81o8J/At/q/EDZ5A7YbFFLm8LoL3iNUmyPNjlf6a8+
         ckPLHSRtKH5hqzrdxxOCSxqvnEmdW0lqKliF/1cJKskJhBtWQISs/Fjt+61NNvl/5rLr
         5nNrV5nhUat+RyauOCPlbAI38FuoXqcbFyNYCgd4+VYcHGji8SrGt9/uY2q7FcSh4Urm
         jlNkkYEn8YLwJRRahoPUSRb30SccR8+GNYn02npwho5y4EsOmSl8BfKqp4SgOkhIxj6o
         HX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451520; x=1780056320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=;
        b=c6REd3vfPA2pMcg5fTK48VHlTMpTyy92IUItarljduY11OE9xnNbnW3j5Vi/Lszz+L
         FIjyEBe9qxqycuSTyHYZAsNIEpar59l1oHf0eQbASyeKdix40aqi22W2QxC2ZznNoisp
         x3KH9h1SPg+9hh/ucV2gLnk/GX7svqtqNjWvSwc3Z7uob2VqkZbbiEum7hK15uFjrkNq
         07vhPdQHQrawETx5eK/n8ndxY2awcwZycF5GLPis9bIhkw6NgkpxDuRT0mdC606txKl9
         hIE8p5OpM1jrLThNXqCCfN+c0aBoujAaVigC3bNAZYHEPkcT1YEdKCxuvCXIqLSBRUQa
         mxEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AaY4A+oyhBY+hw4sPolYlAsqWehkKmqz/wpQy/BkCiwmbFovS763WigCjKhzt9oQ74t/QXK+NoA4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3GzzqqB2GuYMrwdGkgN+ZHqUBBtyVatXFCASrjintJgY8GFmF
	OIPL8X8dA8lLPdABx3gBPH/EOXvcUhXO+gLlaXZB45ZvHFW+yMWqgXcBfhD6OUOaZYff5LGSre9
	5OpoHXJMxLsa8wit3V8P0NVGDHXEk6vjE8MtJSQejMr4P78TMdFPbDKLP3Lzr1Hnp
X-Gm-Gg: Acq92OFlvRQTtl4A9vZuLRROahrdQeH68YDCB7f3a/i+EQ9kBACK+n4wb4JdrS3tqVd
	dz3B++exaCthG8IaOYSSX/77xuXADHmZCZ/4GULuzoSnG6w4HIGZVffNCmXIMQ8fd591Aswdi5r
	nseC1gf9s9iPUweQjPYx1HCvHEEXsYN6CIJoNKVr2YI6D6DCJg4RaMomeEHXGaHBfWLq/KrUGWq
	xlkVTvVpBC+pmYZ1zQwSHEw82XIYC7j7NtffiQo/1hQcDXs8oxdNME6hsyjH/jqQxnw0LobIZUY
	D3U8j7iRTZZbjzHvWP2k9SOy9L08FwMwWBllYJtZj+fxuzjaETAm2JOvqvz0CTlrhju36b19pQ/
	m4PV8OpXKj/usOzkhH6ZT5ipJbjK6dEryOi+p0vFGERdDZQ==
X-Received: by 2002:a05:6122:c2d6:20b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5865e98ed72mr580080e0c.1.1779451519562;
        Fri, 22 May 2026 05:05:19 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:20b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5865e98ed72mr580040e0c.1.1779451519025;
        Fri, 22 May 2026 05:05:19 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm612312a12.5.2026.05.22.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:05:17 -0700 (PDT)
Message-ID: <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:05:14 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a104680 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ATWgodkRvw0t6Ni2IuoA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: o8g3ZtKOLwxsEQwIOkGZPXqVhKgfHjvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExOSBTYWx0ZWRfX+gjVvMBate8X
 q/KGiitVR8cOae257QYdXvN3yjSVVny1lNZr99OIDb/WeNqL1j7jy7BcRwhdIncH60jB1wHOLdG
 3w1QSVxQbImY76tHudPKCRp3yP6lTLtYr4SGFFr2CYBQuqfNpqf41YHUz+gOUcBFZaFKqcvyWE5
 UcFqIYmV1ixlk7WZ0Pqt0Ry/C0H30LthKxeixz+l/AUInpmua1B2xIEacZOlP5EQQ8q8XScXsuS
 5/atYiSAGhw0PXvcgelyj0mQIMnSzS3T/4vhjnzFUaBEbHTFfqEbKglldDutrtF4DFv+fMjDvjq
 J6l6slIc/3kQOPEBRtbgt/nVC2MQu148qu+SCWYIAIlxbJwmv3AHY8GBLfAPa+bcxMOUvBqEBwF
 ocPG0qFYib30X1no9sI2HqiBjDfcpj61BoiK9klRad/a8aRge0ry1rSUE1KTm8Z4Y9YL9Mdaiin
 qEQwyePKOgpbNJiNSjw==
X-Proofpoint-GUID: o8g3ZtKOLwxsEQwIOkGZPXqVhKgfHjvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220119

On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>>>>>> The DP part is roughly the same as on the instances without USB4.
>>>>>>
>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
>>>>>> given moment (not to be confused with USB3 not being able to be
>>>>>> tunneled as USB4 packets - that of course remains possible).
>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
>>>>>> turned off to save power when no tunnels are active, but that's left as
>>>>>> a TODO item for now.
>>>>>>
>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
>>>>>> necessary, as the Host Router driver is going to excercise manual
>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
>>>>>> and resume flows. Failure to control that synchronously with other
>>>>>> parts of the code results in a SoC crash by unlocked access.
>>>>>>
>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>>>>>> submodes.
>>>>>>
>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
>>>>>> couple specific overrides, pertaining to electrical characteristics,
>>>>>> which are easily accommodated for.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>>>>>
>>>>>
>>>>> Overall it looks good. The major question (after looking at TODOs), do
>>>>> we need a separate submode for USB+DP / TBT+DP?
>>>>
>>>> The problem space is as follows:
>>>>
>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
>>>> we have a link partner, we may (based on the HW capabilities and user
>>>> config, such as kernel params but not only) start or stop a DP tunnel at
>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
>>>> as a separate DP AUX host)
>>>
>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
>>> separate submode or not. I.e. I see code (and TODOs) to detect and
>>> handle DP going on and off. Would it be better if we specify that
>>> explicitly?
>>
>> I really don't want to end up in a situation like we have with:
>>
>> $ rg _USB include/linux/phy/phy.h
>> 29:     PHY_MODE_USB_HOST,
>> 30:     PHY_MODE_USB_HOST_LS,
>> 31:     PHY_MODE_USB_HOST_FS,
>> 32:     PHY_MODE_USB_HOST_HS,
>> 33:     PHY_MODE_USB_HOST_SS,
>> 34:     PHY_MODE_USB_DEVICE,
>> 35:     PHY_MODE_USB_DEVICE_LS,
>> 36:     PHY_MODE_USB_DEVICE_FS,
>> 37:     PHY_MODE_USB_DEVICE_HS,
>> 38:     PHY_MODE_USB_DEVICE_SS,
>> 39:     PHY_MODE_USB_OTG,
>>
>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
>>>> (and each of these routers is hardwired to one of the PHYs).
>>>>
>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
>>>> super high-res display at one of the physical ports, or a long
>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
>>>> we would only need one of the PHYs (associated with the router that's
>>>> wired to that port) to provide a DP clock.
>>>>
>>>> This, along with the normal (logical or physical) present/absent status
>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
>>>> or something along those lines to toggle that bit as necessary
>>>
>>> I don't see phy_set_opts(). So maybe a submode then...
>>
>> Sorry, I misremembered the name. The function is phy_configure(), and it
>> takes a union phy_configure_opts, hence the confusion
> 
> So, phy_configure() will be called for the DP PHY to set the DP opts,
> but how do you plan to determine if DP is on or not? Or do you plan to
> add phy_tbt_configure_opts ?
> 
> Another obvious option would be to set the flag if DP PHY is being tuned
> on / off. I don't know if that fulfills your needs.

Either this or tbt_configure_opts. We still have the muxing question to
chew through.

The bottom line is that all AUX traffic happens between the "AUX adapters"
within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
and the far-end device (and anything inbetween in a chained topology) meaning
we only need to engage the DP host itself (and therefore the PHY) after we've
already performed the capability negotiations

Konrad
