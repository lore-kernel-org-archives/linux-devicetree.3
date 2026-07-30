Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1A41D625
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412089; cv=none; b=LkVBejW6+OEqI+X6IIq0daKXoTnz5lI+RPo6mdvVcSmkBdLh3gxSGMcMSG4e623K40MqxDncEjMlAx0Bqs0aEf97fsX/BRTuTiI/L7LLce3xs8FilBfCO52MxG4/1CKZ6uBk0vwpXTxoM4JMS8yYD9fFuVfWsprXGfTAG0rrl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412089; c=relaxed/simple;
	bh=ZTCUJnQcX4xxiOEuuREEDYYRsXwuOcI/mHgyUCcOAsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRhJV060Lx6kUp9dUZj4C1ORE8J2udU9q0AeOpEHuOk4NWtySHxvTYSx9zMUf/HcoBXQ7pDVzvI8I4w394KPF3aV7zhW7RCatOTUcTM/r57PcHdRXvXZ5HcTQJ8z3NEnT/uzgQYLYOChjt+nvXAfPFa14hBuekJfAWR5qLOOn7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAFfNMet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQUF4vD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAFfNMet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQUF4vD3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2Pgh4191208
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=; b=YAFfNMetBPtOhvhF
	uJWAfrktmzeHiBJ67zGGtiVtkNRP0r6T9hdWpomxRgQyNl0yMJqxJtDZcVzPQLz9
	OcQWUiXm3FOhbAJS4d5vcaga7i4t+dkevS1CWh7ea9mtOtwlHw+ju4hfmAd6SY63
	1xyjSOgpLg0bcjqgOU4zo8tW2v32xCEjOsZRmMeCaKgEfhrE+Eg1OyP8K2Xgk/Ye
	dGJjLdHYUVjemh+I9h5VpxHKS4UUAmoVj2JlOckbCz8q8UXV7ueSA3rtRzyVqMsh
	GpjVr5GT9g36SvToDSmxdcbSTXWei+uPbExnahXvW1thkZ2oCZbXt9h3Gx31NaLU
	k/yxtA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tygkw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:48:07 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66927fe1796so1895402d50.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412087; x=1786016887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=;
        b=CQUF4vD3hQOd4WDE07IRc2fqDaeXbYaHkqExgqfuPOje5WUUuqeMuWMV0q2fLG25X+
         zlFKuiOIMinNXpe15vn7OSy031qd4lV7XOZDzj34xXYH4C+TDTy6RsiijP1AOD8JjjEe
         ymCrtkUBs0bTnFUmyRefbm+M3j3IPoQqkkjShRPML9iL49VZnaG/ngej2llnCPUO33Gg
         24PPVdBLOtJp5zQmbGCnAdMYHQvbmbRsNmv20mtAgB12vlmhH0ELSmjQdCSVDw1GNrME
         P/YJFrgReHF9Ej4gMnmknEm1HN3A13BPm80BN8Vj2CU4+fu0Wylzr2RZbOrXrN7yCrSN
         Ur2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412087; x=1786016887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=;
        b=hLi7WPFBd9pu0ycDmWtpZE8f/RQKB58U1bfcNq1iPdBukhklI+/6T1wEk1cbuOOHcx
         zlpE25LxoMsIS3w710ryeSr8U4zRa6jopPVorgFJSRCH3xcBwQro/3vifGNaTz/tWD43
         KDSa2gPgDDdbens+BAokHjfGm7ZC/hnqgBEuiSAF0zGZGAq4fNbEWYW6HEVcqR+cpt+N
         PVs+LWeyAcuT5lLTTK663jWo+CNFXOt6vpQquqF8OtWsXWMsFjnhFa4x9CILZhnN8pf2
         CKh/E/kXTUoCU5z2WV3kmfCcq++jift3JGFb9t6nbEAoRexhxVEvYAaF4nGEG5/hqwBD
         Q3Bw==
X-Forwarded-Encrypted: i=1; AHgh+RpR1aTAxcywuCJGwiRTEtLQMk0kEJDaVePo2bewso8ySORaigPcdcHmAXEsN5fGkLtjuYurzpRjWrEp@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7wTTKJmxxWHTINlL2vwsk0/L/UnUggQ60w0LSoGbuGX19XWT
	I+M5t/7iYSf1vkEx+cQNvWUTOoCTEfFle1cZjskEygO/Ez43or+lSRaz9BCBSCkj0ft0hxr9/sz
	cNwLaeblX6wzlcdwTujPwLHIAEXihIBpg79ZXmtpP2xtPmsOEvopqAhgZAeIAudR6
X-Gm-Gg: AR+sD13aa+9cPn6EApCpyIl7kwAcGXSsetO75VaoaX4tw7byAupjUCnNo6wPDQ9fXLe
	4SLr9Y2y9MZyjYTuXKe/s79W82QvvhPiXrK1eLBdMv2BlNHY/anGTLRQi23ENUK19TddtG7xXyK
	c/J6/WrcEn03jWxb/1ON4VdEixcMH7xRofMSDDB0pnupl+jK0Z/LaazQkxGBcOK+XBco6TsOhuO
	Ss+36/4xv6xeN5MLoTnUsgXyYPyh9IQTbaQLY1lc4czWfdsMgvvo7w1FBzalM9ZDMMNXoLQzRLm
	cFZRhXt74fxhbJUP7MW1iuYs7QVUFEDrq+jg3+cZMwuy9qLkkylU4S3aoJJS93v7Qfl7txVickt
	CQABgUergj+brAuOREFU7PEprNYyR2UDlL0zs6NEL6fozdkYh8fOMxyyH1TemjJVUBw==
X-Received: by 2002:a05:690e:4811:b0:667:8a32:fb04 with SMTP id 956f58d0204a3-66939ae94fdmr7966d50.5.1785412086242;
        Thu, 30 Jul 2026 04:48:06 -0700 (PDT)
X-Received: by 2002:a05:690e:4811:b0:667:8a32:fb04 with SMTP id 956f58d0204a3-66939ae94fdmr7947d50.5.1785412085691;
        Thu, 30 Jul 2026 04:48:05 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c6e9bbcsm1106293d50.2.2026.07.30.04.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:48:05 -0700 (PDT)
Message-ID: <5861906e-2969-4849-b9ec-ff6c7df65dad@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:48:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
 <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
 <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WX4F8WM3XSaoV_BAtHc9P0TqivNlUzhT
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b39f7 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=_0oT8-qNcuQ5ffpwqqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfXzIJiX/yVbskG
 lKGYlvaz7xoOWiwTsczDPn8jV+v5gr7CqTh5OI/V4KSvZYqaS/n33B+PDI0A/Tuht9ydOGKU85Z
 EHBNsygU0KuFtiCw2shbWuXJN4WaQ19gV/mLjV8hGcRiTvW5ldOxnk0xzNBaVJi8stJnBFIrjVC
 HZngeRlS7VFbOg/9gYmtfxHGGZY/k0gTeDljqWd1yaC32bTWUozycOJTHhNf1jSDM1X9nNU+3Pv
 bz1OKi0jxHt9SooWecd40XMWV2KooMNxY6V2WuOp5X1/w5dkhuNMtY7Vbay4AihMHRLGABzgmAG
 K5lG39uQddb7gWEq2YEWkC3YOG5thifn1DxpkWQWqY0AbMEhvvh6tEOxyP2LKODwuANTaQZMTBB
 Qmy2VSvqv2QmraF16u60t3cnin8RY2PuBu7X5GXnbfk+pH3MWXkwQ/zNYb1l7guN0OW4iPCiSCM
 g6NC8+VRPNzqQ3iq4hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfXxDjL6FLxRZa3
 VzRNKhPPf35HkR/VGiM7HXNjr4Bc79WMI4WJTlPk9tgSd3DjmyKYEzEv4Lhu0LHlqofHFRpM9Tq
 jqodJWM3m7e7NrtPwONBvNgeGvGtpBI=
X-Proofpoint-ORIG-GUID: WX4F8WM3XSaoV_BAtHc9P0TqivNlUzhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300088

On 7/24/26 02:04, Guenter Roeck wrote:
> On 7/23/26 12:16, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Guenter,
>>
>> On 7/23/2026 12:29 AM, Guenter Roeck wrote:
>>> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Guenter,
>>>>
>>>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> ...
>>>>>>>
>>>>>>> I am curious: Why not use static initialization and use the 
>>>>>>> is_visible
>>>>>>> function to determine if an attribute is visible or not ?
>>>>>>
>>>>>> ACK. There is already a comment in v1 suggesting the use of 
>>>>>> dynamic allocation based on the available attributes rather than 
>>>>>> static initialization. The intent is to avoid having to perform 
>>>>>> enable flag checks in multiple places.
>>>>>> . >
>>>>>
>>>>> You lost me, sorry. There is only a single is_visible function,
>>>>> and its intent is exactly to handle situations where some sensors
>>>>> are not always available.
>>>>>
>>>>> What would be those "multiple places" ?
>>>>
>>>> Understood, thanks for the clarification. I'll revert to static 
>>>> attribute initialization in the next revision and use is_visible() 
>>>> to control attribute visibility where needed.
>>>>
>>>>>
>>>>>>>  From the earlier exchange I had the impression that there is a 
>>>>>>> large
>>>>>>> number of current and voltage channels, but it looks like there 
>>>>>>> is only
>>>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>>>
>>>>>> Yes, this hardware only supports one or two channels (voltage and 
>>>>>> current). What we discussed earlier was that each channel can have 
>>>>>> up to three threshold alarms (warning, critical, and emergency). 
>>>>>> However, the hwmon framework currently supports only two limit 
>>>>>> alarms for these sensor types. I have not added support for the 
>>>>>> third alarm threshold in this series to keep the initial driver 
>>>>>> support aligned with the existing hwmon capabilities. Once the 
>>>>>> basic driver support is accepted, I can queue a follow-up series 
>>>>>> to add support for the third limit alarm.
>>>>>>
>>>>>
>>>>> What does that have to do with attribute visibility ?
>>>>
>>>> I was only clarifying that the channel count has always been small 
>>>> (maximum of two channels) and has not changed since v1. The earlier 
>>>> discussion was primarily around the limit alarm attributes. That 
>>>> said, you're right that this is unrelated to attribute visibility.
>>>>
>>>
>>> Feel free to use (and test)
>>> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
>>> linux@roeck-us.net/T/#u
>>
>> Thanks for working on this. I'll use that change as the base, rebase 
>> my series on top of it, and add support for the third alarm level.
>> By the way, for the voltage channel, the hardware monitors 
>> undervoltage conditions and provides three threshold levels. At the 
>> moment, I am mapping:
>>
>> LVL0 → min
>> LVL1 → lcrit
>>
>> For LVL2, would it be possible to introduce a corresponding low- 
>> voltage emergency threshold, such as lemergency (or another more 
>> appropriate name), to represent the third alarm level for voltage 
>> sensors ?
>>
> 
> We can, but I really have no idea how to name it. lcrit is bad enough,
> but lemergency is even worse (or at least I think so). "lemerg" would
> be almost as bad, but at least it would kind of match "lcrit".
> I tried to ask Google AI, but it didn't give me any useful ideas.
> Any other suggestions or ideas ?

'lfatal' ?


