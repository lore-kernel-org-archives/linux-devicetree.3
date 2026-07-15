Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AC35DA64
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093909; cv=none; b=sXBtcBuUThrjrbDnxyD1apPv4aqIsFd3j7rA9i+034xnh80pdjsAWsd1ZNaeTE+0c4991SJ1sbqTXmtv2rSbfzawtsRtj+896wGTcIgTQ5tZ+DwxCZCHvxmxMXaUrc4mit8tEEtzU3Oo1cVq7ZKsOzfaaka111MxYw15LvN15PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093909; c=relaxed/simple;
	bh=i3/b9t7IlZg8KXkmOMXMHUx3N5cuv2mcPJfMFSHaElk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liiHnjyxkr7gadaV6kml/GfJewN89ILDHhQU0BsPmNASOeWyJt9ANQVIXsMGvdBqRHMtRlIKcNmKu6hsgKVPzlGyNpBRFwItdBLnJWf0kDaP2iYK21/mhsX/YNO0b1YLLKsanwIwDHnUY2hWTi0/NTXIHOOvpPhC2d9wJYBcNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNbG5je2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/ZxXnZD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNbG5je2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/ZxXnZD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lIuM2405246
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=; b=kNbG5je2M9021Jl7
	805Y52gTi9m3iLyQOHaYYyqnSv4+iz+DcJDIFouVe9/fY7ZC1W+0T7cgyQ9BlaSi
	w1w7KqrfwIZIjCYH4aBnEWz3s/C+RX0qgNObDhwaO3jMPz1fMvGvTspPnnwvNiQx
	0IWxiLI3kXyasDYXu044+A6SWzbNgd9g75gb0c9vZg8tcbA3yg739R0gqJV1rtQw
	35l1hXy7JwlTG14rWRgqu/7e2RlOaEUMZS8PmSpgmzfKvMqPkuySLWTkSmJAEuMd
	kTKWnGS3Y5iJnmrAIvh1+q+DPPpy4YU7BKqTnV1qIjnc6Xm9GiSS4bROKgUS3yXx
	V5Z6MA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0k62t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a06bc82easo5433245b3a.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784093906; x=1784698706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=T/ZxXnZD1rDMSp5e/ZyR0i6l5QvExSC2zdF0LXWopcymQfyikdrHSjf8fl8ZYDFNYr
         /Ld1apErwix0AOkAHegcZZnpZNyyynMyNJv6ZUsb2PpBmL1/ewKlbSMGM4VcjuHvsPTt
         xrOmer+IEIwA25MESVoQL0Q1U4cQfQalBo9OqhZyaEJ2JCTtN/qDs1MntLwo9bwCRxHd
         I+iffsfmIqh7OmmOxhI5/uBC7rdK6jTY7kn/c2kbcLeU+xlKeP6m8sx13d4DdQltmFBj
         8c8K9u/oDeXWfqyyErWCuroe4Zd9hlEqSgJjC2ylF4HCVAOTuUC8XDP3Z/6hqt5v7bT8
         AkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093906; x=1784698706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=SfcGDu2VZ6NrgQlLoNpeyQdfspPjUEX3hS5DTNiDIiRWbFJhag/inlfK4RFxs6I3AN
         KiSHecJtGt47YnWCMR7YdxDIXar2T6YL+A59yh/FbjD4HxJWlcc79bpENE4WZivOf3V1
         I/QJfOV/r5Vp5YqcqAW/8eWhekWOxUSrdzownfxrRA0gaoa2JNLkH+aq1iQzSoD1jtns
         95d629ncBkEz1Q/4jSdmdqcz2/LjM6aDPm/OWWUD4PKjqIpocf/AqcqhQj9hW9PYu1YK
         qtUrefI57j4jx5+ATIevBpbIRR65Xnxc138drTs4+a74iS2ryQICr8RU40GhGNUJwqsm
         JFTg==
X-Forwarded-Encrypted: i=1; AHgh+RrmWQr9LUkndM43R2LX0A8PWDxpj0G71l7rXHKk802AV8RHyadZzrrdlimJtfDsjWzVZ4MXZmIJDtm9@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQvAAw5R+iuNFNDr/fLHkSCi0NURbY6eE4tLDmdNoCUXJQJ3O
	ktVnUL11SpKiu0uoikImSzV9nU+xNjXGXhhMCpERwWUIcX2l4z5xNfz4w0WohxN1yHTUXup2wRn
	ZVP4Ucg42yPqv1Uz73uRHnnDJtCv4y6UoU9WFkLCI2PhbnUHvlGjgWNr/owWnIW8E
X-Gm-Gg: AfdE7cmXJ6N3WG9K/EzJm82aeWGjm+T4XuqykLAkMaBeUhPvbKvlN7/n9acVhKP8ldj
	feeoK+D2XR17DCddvGTk9DWS4Orvnf/p0RtaC5LsUTpBKuBUSEAWPM/Nw6SZRjKwHe9pP3i6yI3
	u3Jt4BSYYQ1o82YBF7AjMnkZ+1FrFx+3ynFli+jMwYCw0zvVAaJow2CHCBP36Etpgpy7m7R+7L7
	MikuC1WyjX8AaXbPfCUYUBvvvjk17jh8jsRFa6GMzmjaUDU5A5K7kCmE6SXnmP50U3aIJ7E5fuT
	pfGUODXwLBn9o2ZdA3ZGLNIx2ruokwHxacUfnnXSybdcDsWYaoCFSUHH06psV9qeLHJln6LaCBS
	6C52Yrtp+73U89ECr3WvDSVKrZxsNEHaCxwO8BWygCrfo3CjGxn0JLm7zJU2FEXEzNdi2HoXkRG
	w3704=
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302061b3a.20.1784093906522;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302034b3a.20.1784093906014;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dadefsm2420750b3a.45.2026.07.14.22.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:38:25 -0700 (PDT)
Message-ID: <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:08:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <albAccNnsI12AIUo@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfX3ty1wy8kF2si
 FXI9vVx/7q551Yko5pM3oMRVQ6klpLNRbYhD6IUmvxnxPbOtD1RW7z44aNwqU8R9ui7sPDtOefC
 1AMFmyPEz/p5avBFiy2N0XR8APxHjiM=
X-Proofpoint-GUID: b5N-DoRanAD_xAbhDTQLaQNpEVNG-nYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfX/646a85NupYZ
 g7sy+z0NhdEkPjTqZej90qJFg+xrSp1Yt+5nYNqquKwXijfgTy4lWThT9S+5rGmL1V4W/ZRhFTb
 fiGJ/BdksvOGYuuksaUK5D9IYJz0x/DdCGl/nxttBTTbT2xWcuwQOAsNQrmEyI0ihqkGek6geS+
 bhAUbNUMDWb+Pevoa13Cl2zblYKwbewoyj1xTU7zzX5UWOR9AHC1w+ZzsoKdCsLUTqDhZw4njxy
 ngcCKkUdPWv861EEppRCrd8TDo+Ov9egbm3QXyQJXcf0SuJM6pmMgH096qiYzAZW5OMp/53XMG5
 xngfnz7hpg9XNOaAjlyiX8MzOsFHhZYo2G6CZWrMc8MXJOWn23Qqs2dJPjfKK8fM2x3aEf4PHZh
 nsbeTR2OJMCZpjLl4CxKwS0QsyG+EW2zADzl0dUm1ipZ8XI2ubg87WDqOwXLhCT3E24dMeELOZn
 Lgbw1s44GIhrhHL4T8g==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a571cd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=jzwohxEhcxs_Eh9CruUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: b5N-DoRanAD_xAbhDTQLaQNpEVNG-nYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150051



On 7/15/2026 4:53 AM, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
>> On 26-07-13 23:41:14, Thinh Nguyen wrote:
>>> On Mon, Jul 13, 2026, Peter Chen wrote:
>>>> On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
>>>>>>> And Dmitry already said this at v3.
>>>>>>
>>>>>> And I've already responded to his comment in v3:
>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$
>>>>>
>>>>> It does not change the fact that type of phy is implied by compatible,
>>>>> thus you do not get a new property.
>>>>>
>>>>>
>>>>
>>>> For USB2 PHY, it has property "phy_type" already, it could extend support
>>>> list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
>>>> or re-use dwc3->hsphy_mode depends on where it needs to use.
>>>>
>>>> diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
>>>> index 1ab134f45d67..5cbf17d493ad 100644
>>>> --- a/drivers/usb/phy/of.c
>>>> +++ b/drivers/usb/phy/of.c
>>>> @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
>>>>   	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
>>>>   	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
>>>>   	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
>>>> +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
>>>>   };
>>>>
>>>>
>>>
>>> eusb2 uses utmi, so it doesn't fit here as a separate mode.
>>>
>>
>> Hi Thinh
>>
>> Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
>> Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
>> Features.
>>
>>
>>> To go this route properly, we'd need to introduce a new phy type
>>> attribute in the phy framework, which will be a bigger change that may
>>> impact more than this driver.
>>>
>>
>> It is not at generic PHY framework, it is just for USB PHY dedicated.
>>
>> I do not see big changes, it only needs to change above files and related
>> dt-binding files, and other users may leverage it if the controller
>> has special sequence or settings for eUSB2.
>>
> 
> The usbphy_modes describes the interface between the controller and the
> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
> and every other driver that uses usbphy_modes to handle the new mode
> correctly.

Hi Thinh,

I don't think any existing drivers need to be modified after adding 
this. If anyone wants to use the newly added enum for any eusb2 specific 
purpose, they can do so in a diff change/patch I guess.

Regards,
Krishna,
