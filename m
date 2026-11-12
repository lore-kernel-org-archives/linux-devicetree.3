Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474960;
	b=CP01WbXAMm+G0WZmwEPXUrBsW3vzPYDY7u2O2nUaDTMo/m0aHUywlTdbWfYUYXAVNHiI
	 0PrbBAofpPsE8tO9M9W5M099fVzg6gINVV/cX3SsvpiQ1uPSARSmAm3Va3DXglkOkG6ip
	 WULIBBH2fe2QIStBlmSMHNfrTW/WmbXO+D03hgU1sYQUEZyycnFMmIt9ffwOT9wLw9gq3
	 sKWyaNyi+4HZR9WS/Huqlw1uB7pGqWUJHRYlB2eUbtdmdrR3p3UCCFG1v4S4jCwFqteTI
	 BBcDctRHZNshnqk/pvynXHsyHXCIksdVkAnLkFCRsQsstUVbuTkrkCDTng8i/nYH2tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
	b=jgLW4kaEj3Lptfru9ucVTu0SK5OAodZ8hxP7m17cFm/fODD0DYBsOww/grEYcPZPu+k6
	 s3HipFA7k2cM1niuVNiQlzfRE3z5kMv33wGGqAKgy6+Jt2u0ZPJj3R7xY0kCGMm+SEdpc
	 +iFNtnMOQaIVGPLBGWgS8VvpyoE6TyDv7Bt355hiKLkfwjA0S2tVHy7lbHGVNIBAKX2jL
	 vi1K6ltCIfYyGWjoaIQPhwfzK+0IGdGiuKonnrUkYtGQoGa0hvkr0Y20l3vY3Fj7ELKnn
	 5yaVR+jYVRuZCd1qXzNvj89NAT2/ImmV16EGocfeKVd5JTENJvXLvmaBMb1ztVUgBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FA606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC98wFj597386
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=; b=PqDq8bmMBO3nXfxg
	aSqmeUQiTKT/yujxY7YIbp9ISBVRoCWHUkhBG+ZQW4PKPkfKUY6STNVS/L+1cxYz
	SNiRyHQZsNJMbiALMTPbQ0j8zArDup57HdMCO+HOUWfiN22b5FdhaAf0DvFgvzpv
	npm8GB+mnNKP2Oh217jLN4ZDXKYtAUvhGbgEp55P/JIwbYxTgO+tLRs4Fg4hn2tQ
	0p1/xxlVKRcr+K7krvBTRli16kzrU8MMVPGSiYH+051WDMdIWNTTOiCgnpPLm10g
	a/gRG1BV0URfMYAoIzlhvxcauWH7j3mxXieU+idb2B0ulluVgS5fGMJ3Kr8Zg5sF
	Sz/0Hw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1540qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2713067a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474957; x=1795079757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=Z1yUwpIgZ5OKhJJroG610EXma8lJiCg/jLUvWXgxwk5Htt2oMWZBVm5gRp2E7ixvPp
         xl4hlk4BX2M6Elri0UjwpXXKrlbOD/5geTU3ibUB5HMHymK5CQk0SCeTrdQgtOnJ9ibo
         3iPOhQSHKe/26gbdJrFtmpv2uagIu/VWbzm2Y0UJubrRwLw4CU26pap2PiMOPulCB1Rv
         D0JQxsofS6h9ts2qGLhkEUzZ28FTpeyDiASrNgApPBbMrP9qCHNAw7YlFuJ1UdyVlckD
         RLw0uEbVp2KZ/V4TolRAHmQMIW/wDm4TDDuoLTcyCPz4gmlA11sG7+vNpSclwaOjRfpI
         YvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474957; x=1795079757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=bjf/Y8m/5DkbGZMJIBq9lC/ExHNxrVkYeNf/Ru08/rUYFJG0RGgCkcjSS/gdBU5QXb
         XLsoEGPn9HsZG1pa/qqUUfWKd1HxW6+pbpBLlMNtfgy3VKnq/8angkNODmy/gTOM8+7Z
         egs+i1GdVAJI5mkZp3FziYEDQ7Aw7mrCS3KEdD9ZHq5KNT7cSh0OCo8dEAEWsnWnVPhc
         mH6WO5/ewBNxKiTna609uFBi5SN/zXLyiPW2yxwduZwdXk+8cF1T0KtLatJAbSL6Alyi
         s0PQkBfkWartbGYva617LXuIJvCVbDTEC6pmz0VFa8xEj4mg9DQCmU4a43okefWEZDMV
         bnfQ==
X-Forwarded-Encrypted: i=1; AL+hErFxOPJGfVL3rO8JNwJlfN8WKmK86mFPjSjR+fVlENdQiysEor9JE9MmImHtWRK/Qv6MobGWGre+Klx3@vger.kernel.org
X-Gm-Message-State: APuU4Z94T9wLaOOl53FkAzpA7GpFSV0+8XmAe183fvugZvWo4Cj+A5Rj
	xKL8jghCekTrd9pF7a+7EhMmFyLNwhFE5tIRxLHeQwonFnTGK6bI6SEIp+JPR1uIeNEYvTOlJTB
	Raz8GVwvbuR1Kwl5Q5wCsXUP6zHOHXbHeDqtovEUUp+s39WCt69Oij9pZyKjeAT1S
X-Gm-Gg: AYBFou3U4s6S5Sjcp1WtBidm4hBtepw2r19M7qLAnZItOiEZpxT/kvueN/Le+C/R1OF
	hGpkfpfhdGK2qo66zi2/fWWRXVOqmcvl4Nz5/9/xVc89PNbVmUy0aBlThueKGBbPCmZjefmdGpv
	Y7h9VRjL5ezjCwErGGzOPDvjTC4DRl04TYoDlQZyoNDjDitp2F1bJS453NIc0fmhE6HR8OhNdYW
	EJbkyDePJ6pazjfnZfZsrL7BlkF+xrviYW/d1nBERMzKdkMAszY2qh2shjpRhzhYkJXsq6xjxoU
	cavGQN8mogBM7SR1MQDRwNPoU7AajsvLbTmbDagbqnU8JJuOk2XncECN3nTmu7EddC3kLFX8Uda
	agsZ6iDMZmmTJiZ2RZY8Dhs7+cyvNjPua3ESovJh3uEJvWy3cIER1zDh7V+BIFnUSzmD6F10Crj
	ob/NsAIeyJZnhMRL4alh3rvkiLn6LJHLvNjuLlcD4F
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070806637.50.1794474957498;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070779637.50.1794474957003;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bd30c8e6d4sm1051351b3a.48.2026.11.12.01.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:15:56 -0800 (PST)
Message-ID: <6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:45:51 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
 <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
 <avV4B4g-NWtZbLuX@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <avV4B4g-NWtZbLuX@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4CNbGCu7zPs9
 XNL13tmu+juPZsnWN5aKtHb6sLUtRlECKZ1hqfUEjYgDX+7gTv6X+xlNjibdwz4SHgRFKLRAH7C
 bEYmKbaEoRTYSKs60EuzWKxQhfjs3sQ=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af583ce cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DY95BI2w6Jwo1tMKFB0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: wR29a03lqfuyMjO2alFkX0Z_kAKl4eCL
X-Proofpoint-ORIG-GUID: wR29a03lqfuyMjO2alFkX0Z_kAKl4eCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX9tPiBSCjmd3Q
 YShgxMQf7qFOE4DUFDBTvAgK6wkvWOw4g0Vist3AotCJ0NVRxBNhHSmqA4lOAY+ckaUxyXAr/Gg
 z7WP/2MJ7hDbOOAvFxhzA8WhtgImZG5bAz8RU4U0kRmJYSWmuRuAKLYgU7jW92AHtaPUcZwCBK2
 pHrAcdiUKidyVo53VIvFVhqxTbyGHptltouahIP6gkinVzoEFAq3zb+25j209Ek+WA/WCW591dE
 3GX4q7tyzyjKLyiDCXjqgrjzukQIaBKw5TncMrsUkYZ0XoZ9enpgzATuIJTCf3liF3y/KbIJtQN
 I2UkQHjwjGJJqln+cIw8E0COAqWzCb4G7hZunx4Ob2fD4Gx9wiZ2NSCLoIHuYENY8pI/axDs2ZP
 hQvYZ51BU5bvPEQJWyMdrQTOXGMXQF5pyza6TiIxZfPX14Z+hYfnAV7koX9KOUYcPYWkUUASzCp
 N0rH4ujKhT/wPcU85YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036



On 11/12/2026 1:55 PM, Vinod Koul wrote:
> On 27-10-26, 13:37, Krishna Kurapati wrote:
>>
>>
>> On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
>>>
>>>
>>> On 10/5/2026 2:14 PM, Vinod Koul wrote:
>>>> On 13-09-26, 20:10, Krishna Kurapati wrote:
>>>>> In cases like USB High-speed phys which can be either USB2 or
>>>>> EUSB2, it is
>>>>> required to know the type of phy (rather than the operating
>>>>> mode) because
>>>>> DP and DM interrupt lines need to be configured differently for each of
>>>>> them.
>>>>
>>>> Does the controller care? In preceding patch you defined the EUSB2 in dt
>>>> type, so this describes the hardware. So phy knows it is usb or eusb...
>>>>>
>>>
>>> Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now
>>> its type, but it needs to communicate the same to controller.
>>>
>>>>> Add support to cache the PHY_TYPE and add the following helpers:
>>>>>
>>>>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>>>>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>>>>
>>>>> - phy_get_type() for the consumers (like USB controllers) to query the
>>>>> type of phy connected to them.
>>>>
>>>> I am not convinced that this is the way to go... Driver already knows
>>>> the type and should use it...
>>>> we alreayd have mode, i am inclined to not say yes to adding type here
>>>>
>>>
>>> "Mode" attribute describes the current operating scenario of the phy
>>> (device mode, host mode, high speed, super speed etc.,). But it doesn't
>>> describe the type of hardware and hence a new attribute.
> 
> Not really. A combo phy can be usb/type c and we do set that mode...
> 

In this case, the type can be "QMP_COMBO" and the mode can be: 
"USB3"/"USB3 + 2 Lane-DP"/"4-Lane DP".

QMP Phys can be Combo/Uni phy type but the mode they operate in could 
change at runtime.

Regards,
Krishna,
