Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF0346FA4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582251; cv=none; b=pNPIOczkg03llESf2rkXsWzd/dCDCOn3jxS7iCYRLnLmm7kJYrDPXrhQBnEgK6x1y0XmHaVrQ6xj8IFk6qJgMUc5uzaKnwq5vV0w4uI16AOQa0KgB478B/md8FIi5z5lPDVPEhhVYAj55bv5shwyNzEWg+ruVZetxiM4Udc/0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582251; c=relaxed/simple;
	bh=yPigDOPI2hIqQ/pjyZYrG8uHNbPYwc8vco1azOeA7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+zp4UZTXDw+3OHnRMsa5cyuxqfnJuSYLZP0YRvck+nnvR1eNOgSj3QFUR6PlxhesnUiMltbifnDnXqNF4nx/kigVBm2wBAkvTLZR9fUW8B3h+7hyTTJiMIDlVYiBIs1bjkcPZhhAkyib5SHjuJ3r+Bw9tkh8w1j6Hvym6s1mns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlmdEqWF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXq7cx0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlmdEqWF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXq7cx0h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960axG837474
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=; b=MlmdEqWFtXi8UL+D
	aLZvSohVF6rMvlUTAfjoYgfAZgZkWoq3scqk3bzqDxEPX404KJYq2Yu4BKePlj1w
	jAENwYAMUSOcHQIFVioxr6mxVkbiEcfS2D9eVCBj3KQ8ADlMpUoHtdEkgFa3PZpj
	IsCef66Ulq7nqQXtMwbS5Rfr3zdgp42GTVjX49Z6/4T/hBBptihw5PqRsenwDL6r
	RlKXxlwe/HYrm/vZNx3po3UI0fn2R/5HyyEIe5oernY7qHR27/kSoPH/0NbEZSiG
	X0+xlm7tLF93wZ/flR87TB8KGhGzl3doX6aNnMPg0VIlrxcsjyuB1U5ulO/6XIiF
	RRQlag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwax7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:30:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so37685595ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582248; x=1784187048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=;
        b=IXq7cx0hGpe6ZvUFDk4Fl84dC/4E6/3bgHRyzh7g03FHx8xuRtmvlFoy1s6HGZcHVX
         6CAuKVko4cUXV0pNnf4nkXTu1uo5myF1hhCPYk6eq3pxk5W+BpSq4VqRzqQi3FiaYYrz
         YFKeXCNV3zhb8p0CnJdjGTm7cqt6uPAMjvDkfnclwSyb3BfkgDGO1v1XW2DESKpj8bTR
         ZYneMEq0lvJHGe+WoV/H18TQUmSjtib3vuYe6MIlEO3pGpoRqfFG/dHEJkG5BqgvH/TS
         ZgC1AFIYi0MN4jAJTLLY1Ua/WL7CSAgzb4CPpCB1r51ZRmuK9DGFy7GSeNpcGjDPSwK1
         AoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582248; x=1784187048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=;
        b=iqHXKtCU72jkiPq3xvO5oneHxHF4vb+zVbIhQTDs6gucS1KoEfH1UDUTleTl+4Fgsi
         iE5Oc1r74SGWN01YyUbFTG1OKrYmigXCivmr8PcIoTZpzNaHHFGu7nI/HvYGhtGhSVPa
         Ze3igZxgMRGFUMjpAYZh/MOSS1BJyopEow2/YFek/grpD2qq8parmXwrTq4oVb+xvwDr
         DZwfdV2+b6g6QfnhelDrU2/bdcBRbUah/UnGPy2+Fa5NDzTEK7RkuVzIUK7bg+KXv0+S
         8e4Hs2J6FjNNUr8TFcdpzxpWFX2NTk3W4S0O4/rop0HVolMhUOqxB1i09YnVjoGVVH0j
         S9KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2YfXYOdlwEK/QU83rblFawBHMRWrcL0J8TXBmQK0Ajsv7zeag/tO/MfisXueFKW7OE6uiLqlRz38R@vger.kernel.org
X-Gm-Message-State: AOJu0YywlCrGQ/jZZODiDWTDC1VLv3XsAgFoGZZ60tdJCmkWCPERQ/1/
	F4MsIFVD3BTiDF5jXWyDCnEUmsUdMmAl4hpZ7uQNQ6CNweij/EtGN7b6JloYt+oFY6/GJgRlJ9A
	jWWjqDsspImwnWqSBSszjWCfGB6ZA2G5Dlr1yaSpIHHLvsyTZLEFz+QQt7ZjZGbWw
X-Gm-Gg: AfdE7cnNVR4BwFTFAd3EDGIKZLQ+N78i0Upz7tUTDM1EM7MwrHaFP6wI+m+lxkAZrAz
	9iaSHw7w6JLrEbGXf2miO+UlP7LB9j2KZKAjIBXgX6gU7/qk/YcQMnRALryOUDCFrY9woX9WBs7
	77NYWqzrsdRAT7uu8+LhU3FQf+NH4qZaPEB5APWQJPfzsIo4xmoekHo4Zb0XtHjszwx5ScwNfBw
	8acU7uiz9D80ZRc0b6tgWTLryYCrcAe5CL0duvolScW3o8fsHZe/z7lN3oE3Jpq00GuPpPqPRzJ
	sOaNVDl1RvL3hl8dwHYRpP7iKywP73vYPZp6mhVa/MI0cd2mVT7nnNgBekdOzYIKrrQl4CFGLPV
	LbiGASHm/ivKrzXasH04LwNTTofDviQ/Vvx//Fg==
X-Received: by 2002:a17:902:f709:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2ccea374c16mr58574095ad.14.1783582247964;
        Thu, 09 Jul 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2ccea374c16mr58573645ad.14.1783582247468;
        Thu, 09 Jul 2026 00:30:47 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8e9csm39463965ad.24.2026.07.09.00.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:30:46 -0700 (PDT)
Message-ID: <0c1b1970-07fc-4612-afa8-f242c2808517@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:00:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
 <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
 <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX0+MeAXUB1Wqi
 8YVCL/1FoQMUaLOdyaKw8X4djHhGbVYzeOgOWbclIKfR5X8G8fe4hj80qrKwnqvq9tZCIN9A5Q0
 e1dOGxuzg4FydE8NDkxkYUnlbPbYJqor8VInnM/wRlkW778voW9KKL6IMn5M0lPQgkB+n03zYb9
 QdBsNlOgS+cKQFI2f6VvKqf02GRRr0fzOTZYFVuvGujyb+E7E4q+fpS0J83kWRVL+WPd40HhKG3
 HCmfZOCtQc4lHgz/QE2wM4f7hoZ+v8tXVSoI9EremdmFuSdO/A9IKIvQRp+G/Tm422tdu1UrTmj
 wDHEnBMSn5XmA4AeYqg557tHfGaU3NORA1zNN9cVRVCWk9lRquBRlC7FmjwVIHd7xXR9/34/rjN
 he19GHCTn4eTOTvg4l+SQ9wFEKc+YEVMCHFPStZhin8PGXNJsLH1aVPDcqMS9HjlCHqVaV9TSGW
 zlY+4uE8urKQnpjOEZw==
X-Proofpoint-GUID: h6u4Td1LDXuuKmrPBzkRf9cOTaUtjpoY
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f4e28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QKulUWdV5NHAk1IIq1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: h6u4Td1LDXuuKmrPBzkRf9cOTaUtjpoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX87yaaUxPqI20
 IeALAGntP/4x9PZxNVZsfUi1+uQZNpDbQJrEsiR8U6cb7p0qHj2onQFew2GNNNy7U/z5tlggqkl
 8nf819Ie6FyYG3dj0rLOB1DDV/OYQ/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090069



On 7/8/2026 5:42 PM, Konrad Dybcio wrote:
> On 7/8/26 1:27 PM, Ravi Hothi wrote:
>>
>>
>> On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
>>> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>>>> Enable the sound card on the Eliza CQS EVK platform, including the
>>>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>>>
>>>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>>>> along with the necessary pinctrl configurations for DMIC and WSA
>>>> SoundWire interfaces.
>>>>
>>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +&pm7550_gpios {
>>>> +    dmic-eldo-en-hog {
>>>> +        gpio-hog;
>>>> +        gpios = <7 GPIO_ACTIVE_HIGH>;
>>>> +        output-high;
>>>> +        line-name = "dmic-eldo-en";
>>>> +    };
>>>
>>> Why add a hog if you defined the regulator already?
>>>
>>> Konrad
>>>
>>
>> The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at boot to enable the ELDO hardware. This GPIO enable is required to enable the ELDO regulator which is powering the MIC BIAS supply.
>> The regulator-fixed driver with empty fixed_voltage_ops has no .enable()/.disable() callbacks — it cannot toggle the GPIO. The dmic_eldo regulator node is needed to correctly describe the supply chain to the VA macro driver (vdd-micb-supply) and for power tracking, but it cannot control the GPIO itself. Both are needed for different purposes.
> 
> Well, why do you think the binding would accept the GPIO if it
> couldn't be controlled? Of course it can power it on/off, check
> regulator core code
> 
> Konrad

Thanks for pointing it out. Will fix it in the next version.

Thanks,
Ravi Hothi
