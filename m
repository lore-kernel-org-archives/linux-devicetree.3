Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364B3128C6
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095349; cv=none; b=c0EDX/OWZjkfTRhw4WocdlHX5MZW4ANbiNLYCzLiHKep38jmB9pbi2B1YACrillPYLsO29caAq7S6WUOCL8pALnxD5gq/tQHyLdV6wpFr2HHTKFc/8AJ4tjCO/Qz+v//Hu6rW7x74UdZy9edUQBkFyna5gQvgihCjk56buY3fuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095349; c=relaxed/simple;
	bh=Imnb8guT45fj+jnS+EFxeQAAPmLzZRhca0s8hOhxRRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3axyn+2WWdbyIkcOiVKZ8m8UxmXtRGYhDNbSqPEuJNufSIrtqYX4WealhZvGogHqiaDLRR6VhCo61dqd4XIfNokcVAByViw2fsKbmn8CrGMnOLj7wzVmMmWp6SGXdWaOLs1wlsN/GuO2OHYckKmuK21juB11Zb8R/LFOLcA724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcVjcJGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnUYUM5V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcVjcJGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnUYUM5V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LDtLno1923270
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=; b=jcVjcJGa12etEl5u
	pxQU19/zni0jREDkjsnWhG1u9VFEf6Ndr+cC1Lj4Ek61QohYZORtoboTWBoxHgEO
	4ZGsKEuja/BgP6eL8LOgSGAY4WUesjWiappR3gtihQ0PzJ55a1NBlZABfkYt4FBk
	2MJEyYNEYa8FH5zk8Oj4lnH+JMp1Tx82MyHY/LSsCkq61pxWofhgF04Kt0TKHw1r
	xgeSpFUwC/Cx1Cp3LaJEzj9yrSqRlF9GVbz8WuWecRihWlDF+uWPegWi4Pao96+H
	SJ034RkUS3vma/ENQZMiA+IHgInWcd3Dt6UwDGK2d/BnfSA+LxWdNGVsfq5YoQji
	LKnRHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmec9bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:29:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so4441872a91.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 19:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782095346; x=1782700146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=;
        b=HnUYUM5V4gbYwCX1WAONHW+sbw2D3wrCjeJs4FoDKkuWyan2TTR8zMR5V04NlicyHk
         hQzv6gR2K9Zpe5LYOA8dIWQ5xLgg68cx5BP/yPSL7HSFg7REDS4NHgYtbZrkuxATDw8J
         O/c5hpxflrIBlUeTsOT3eUujL7iAgw7u4TgKqLxXY45N7oQS4GBrlwZRyovcIbRIDsaV
         4aYPHA/s6H9uOa0HtZ64cTSrygyrCKDIqd5g3gijJurNdeIwRmCtEq+ZgMfdzrTp+Nc9
         phxxluJEwFsP9ZHmjQEI7Qw7VgIa0cuTyxBLoXhWTml6lHIbdNTZLaJyXbCaLdZCD4uJ
         vZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095346; x=1782700146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=;
        b=DzjCOerdU7mzbMEQju+AuRKKHvO3aEn8pZmSJVsZUoB8cj9Nd315Rm8tmrVOeYnYcf
         4tMxvRWDkE12mF/dTX/8Pfw5QjebOW6yHl/g9m6LJ0Gij93KOHASFaCTzpSX9vC+UbuG
         +u17bWkp2EjPdWihGXVbxJvMdm+UFi8wAKMgmaoLJMOyHV1HAgJAfTdPS2teTrkY4EUf
         N0DMdM5lf9sQo3okORuT5pqlYUcSTt7b/66WIPz13Bdve/ToDvUceTBuKJYFirLdIPey
         DLsOhIr37DlWbKImXWIzGelvHKruwhpeueIgPe12NgYG8Pl+w+4gpTTMEmYcd5Zijr1+
         8y0g==
X-Forwarded-Encrypted: i=1; AHgh+RpHIg7tXjYqCutgbsYDR2smochBVg8CkK4QzmF5ak6bB4yhI2DoFwX9n3AyZU8Xx6LO86LZqwidq7l7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzyiT6kgd0vu/lDuLUV8WPP1kCtJKXmaE5NkM9oIP2HrltlCo1
	EZW8V0ab/WNieimh51rqwR5Q6SHIqzCwBI6pp9XIWvLu5kVr1S1L0zEdyEEblJErVQAGp5wGEKW
	AaXw8QxXXO+aL+2DDBndZkCr+ooQo/jCzAI1gNTJb5VtAN9wmN6PSMBRkhEUU0M3k
X-Gm-Gg: AfdE7cmwz3To/fqCjj28zgkhWKhDtFiDqlHlIvUEzoBgETuOwWi2Ds6LwbAEEy6T9Rk
	F2Pvc/0tPx01qGcg1wGhdxFNGdrrViMpbGuhMOWRGk4/lJEAIFH3bJ50k8JaKRscZ/w5EHPA8CD
	9AIsnB9d3VX9VRdudg8uxpmas974hhH+jmvCmbej9fET1DOLdSyCWQDMPM3DZxDNFezzya3VgsP
	qxeNC9oK+y/MHyag8LVqsmrOREEPlP2Rh9OG9iV4FYCOSkW0mdenQ9s+0JcqmavphP2v3WFE1eA
	Zqi5EjX1tcyGtpZXPC1RFRZrp+K6+PAI9p1wTA0ooGkeBXLqoBnpjH6zjtSCmRR1hFOfv4/7OA9
	gCdadMx9iVs3LSHsn8FCOCpaae/n9OpkvKaE=
X-Received: by 2002:a17:903:1c1:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c718fcc7a6mr138565925ad.36.1782095346323;
        Sun, 21 Jun 2026 19:29:06 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c718fcc7a6mr138565775ad.36.1782095345891;
        Sun, 21 Jun 2026 19:29:05 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d3505sm60225495ad.19.2026.06.21.19.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:29:05 -0700 (PDT)
Message-ID: <20fa15e1-316b-44fa-b59d-99cb7fe78bb0@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:28:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
 <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
 <c7191868-d141-4095-b703-230237721f28@oss.qualcomm.com>
 <44778bec-68c5-426d-bc05-b4013630b3ee@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <44778bec-68c5-426d-bc05-b4013630b3ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDAyMyBTYWx0ZWRfX3WGCxaAgi7m6
 6gFpnj7VNJ0yEkmnljxhBqDuisF2zJlXH4bV9pRSH0Lk93GmooTz+tr57sU5QJQv8o8AXYhXyBv
 GWzv4O/J10Eg4G7nNNE76R/jL49L2HmBUFOAItK95ktDsiJmFUbRspgbF0Im+DGMOCJdq77UciJ
 po7okHjrR2io0HGNh+bXuLknf3b1AIp/A20UrDw9qi7NknsFz2wKxJCGkFtzI4Pr+rE8EqTp+RE
 i1S8jSFo5whtOwrIDWQhcGRdbmPDRhIMOlaeqqboUFCFTW5MH6key2s5qZ/dqpSZriLO5Xzifsw
 Ph/zsBrKT7xr+7SHzl7qIHSj+j29ABkO5jREcvsZ3NV/XOgrzRHKj10SuMPbjmg34u7LWXbRcOS
 fLAWup4l5trJ8WGGJ8rvJimY6NIep5hez6B7lYy6G8FuvKwjQxfLIenFeMstnmJthfO0yDjlYXT
 f3J73xQrSHgRt8FOBJQ==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a389df3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=G-0MMZ6kwLWl7lZkNOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JAr40USrX7axRTLz73KI-0vC9D51WW5J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDAyMyBTYWx0ZWRfX0OSgxnlO/Fqg
 AFUHf4f7NY/Ci6GEW5N/QQ7W9vpak/9GFS/8TF2oAwONTUK2VsdEvQ1Cr7f5gCR9xIgpiCDf35f
 gGzB4t3KLE+46WaImbWQh7osDTNGROI=
X-Proofpoint-ORIG-GUID: JAr40USrX7axRTLz73KI-0vC9D51WW5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220023


On 6/19/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On 17/06/2026 13:02, Fenglin Wu wrote:
>> On 6/17/2026 6:35 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jun 16, 2026 at 03:08:24AM -0700, Fenglin Wu wrote:
>>>> ....
>>>> +
>>>> +  qcom,lra-period-us:
>>>> +    description:
>>>> +      LRA actuator initial resonance period in microseconds
>>>> +      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
>>>> +      rates and the auto-resonance zero-crossing window.
>>> This does not feel like static characteristic. Isn't period depending on
>>> intensity of vibration you want to have? Why would that be fixed per
>>> board?
>> This period is specifically used for playbacks that require
>> auto-resonance to be enabled, which I referred to as "T_LRA-based" and
>> "auto-resonance zero-crossing window." It plays a key role in the
>> "DIRECT_PLAY" mode, which produces a constant vibration effect. To
>> adjust the vibration intensity during this constant effect, the hardware
>> does it by scaling the peak voltage of the driver signals, rather than
>> changing the frequency.
> But maybe changing frequency runtime still would be useful?
It could be, but the LRA F0 (resonant frequency) still needs to be the 
starting point. You can control vibration intensity by driving the LRA 
slightly off resonance by a given percentage—for example, to reach 50% 
vibration, you could probably drive it 10% off resonant frequency, and 
that mapping also depends on the LRA characteristic. Keep in mind that 
LRA is a spring-mass resonant system, so its output is not linear with 
driving frequency; it is a High_Q system, and its output actually shows 
a sharp peak at the resonance point. By contrast, the relationship 
between driving voltage and its output is much more linear, so scaling 
vibration intensity by adjusting the driving voltage is easier to 
control. Qcom haptics HW scales vibration intensity in DIRECT_PLAY mode 
(for constant vibration effect) by scaling the driving voltage instead. 
That said, the HW can also change the driving waveform frequency by 
updating the T-LRA registers, and this property has to be specified as 
an initial value; otherwise, you won't have a baseline to achieve that.

>
> What does the frequency depend on? IOW, how do you choose the value here
> - based on some motor-part characteristics?
It's the resonant frequency of the LRA actuator that's mounted on the board.

>
> Best regards,
> Krzysztof
