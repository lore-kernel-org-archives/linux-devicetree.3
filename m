Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9A4D487E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737842; cv=none; b=OmQue612nq8ipAcdQpB1LvgjTaXHH8VBZ8EDD1LL8lq2bdAzHRykGVOAUQmohoLK2xQfrk2U3avcaDBm8Po0jH4n0lPoBfbRU3aiL9gxUFfBT5gQRZNYlO87LzWbZ0gle3tkwN8hx6rkyewtW8MvFDDs5zcDezr1DYDFIcrwUsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737842; c=relaxed/simple;
	bh=Yc7wqbvlmYIYSmY8DLM/Fc/IZHx3O+w9ugmnjA+pCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJxM3jlTbblW42+u+nM5TOv558D6T21obdnlDIeil4gprb+Z4XYgdftIzRiYh9V5qUgKY1zezS+cf1yR7E3xT8I33RQewSKcHVIJJLTI8jMVgabKFF/2vXkXA+SOOGiRPJOBiZwrZyIwn0Vb2S4/+FUfTeEQntYfCoMGaZ7nr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf/BNKxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNo3hFAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf/BNKxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNo3hFAP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtrfC1836706
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=; b=hf/BNKxCTppZPbn6
	Xo+8ydQNhF/FEBjcg4U4vNdLZTC4jDnxv2z8zvF02U485r9hNPPBijP75Wx/2JgK
	64X1sLLRRsNoSux8BdzkrCATqOUPhpTGVLYgpZw7k1qMt6dY/mfqknYpIkdBIRIF
	8r4wTWA2zwj30NWuuQd/8kFmv9wVs56Ro3Ysp0mLZWYx2cjYehPvDdbeHl7by9GV
	T/voniU4jYQrIeOW2LySKAEyxqJP0OreTpGgN8XM8hfsdztDPiJg1oSR2BFKO7jy
	0b30NJsbh3g/4M6slkJ8SVD8+T7H4TSbXtgIH6Fkt7P8Cy3uMMHGyi4Ic04AaSMW
	dtPCBw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpttvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so21253e0c.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737839; x=1790342639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=HNo3hFAPdhJnm+BC74IvseHMgQ2m3e93jOwHyr0BUPd/fVf4xJwzKqH/mrhnrndg5a
         lFz1urMCi+2Wsyz5vS2Au+PxZ9Tc8/Q/kluYgZfJ7gABfrlyF5Hr341TCu4vE7Z/ZVA4
         mBDSFpisfBoUDfDntAlwMSFzyl2L+wqcBOadIE2w6F6EY6EcBhYNNlAPpgjTRi/7Rvza
         NLeO4gwACDdOxWwhl02bEmrDzjTogM7t9zv+FSUMOj8lpVhAuoNglkKNGMVanxsYP4PI
         HYdLt7+hb38pCpd2rNlk77KiWPA/Y2LKWEn6aXo7dYXJZrgnW/72qEzfCC5y86SGQB5i
         ljUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737839; x=1790342639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=GJDjOCucZ62EfXHle98JPFuPZoP6iID6N1IFBJrLHI/pjDOVKszL2hW95WOhqDIr1j
         CB3I125rfM4CzXVcDxvq8wSXUtqLd5qnIMgdzzCf9enjvXjk0T35fXnjWfe7WJaBxlTT
         EaGkqwneZNL/v2oSV7t+BReKRXEgtNn/UdPY4yNHglay2Wf572gF2S7ZmD53VJFoKDsa
         hkTERnqu2nmHX4MDhAudA41GtEr90IuLmh/oJiMaCA17FDXVK8ZTIUpt6P6dIrj2y8zE
         JQN9s+slOxS4mXtVRXPAPk/DKQ7C6raDThumLh92Nsp9YCSD69sWENk6yYwNTeR5C0oP
         ctzA==
X-Forwarded-Encrypted: i=1; AKwUvByyQdL9cfFVeMfgKl1mdo/WxiO8nOBs6qKVowrMZZBpZJ/BCT6/Bu6udnAHRkoEeddFwqSco1aYfwQg@vger.kernel.org
X-Gm-Message-State: AFuF++ny4kzDeR5f3Zi31ej0/lFZyPSp56nxYho7Bckn9MgS0a/0AadL
	ZRLV6AWnPTz4JYkEI76ticWAkEHDxxN0WOGCjVpzksa3VWueIL4TsIbdKJa/swIXZiTk2OroagL
	nIGSC9xdBQGhy0eXK9zAfmZVVFR0cY+lXm7Jl0f1BkZimWhgK6PAZqE3DfHFBLc/w
X-Gm-Gg: AYBFou1cM4QkHWf2HAan5u8OEO851f4EQ19Rul79iQJewGDDlaNE4U+gguvNZoNtdMb
	5OwnalHJJqVufZ4mHGvP5IoUrspswUbRUPuKfrVA9uv++0awqTXkZd8GH4Bcl9G7tyJ3MndO7Pf
	eQKz+Jhv8TVdY2qw87Mg5qDEpFv1x4WXEHyDGIMEV+TPr0ADEyoUCa5yqyYYfyc80yFDCIl/KL1
	SYa9pk0R7A42n/f15aslsy6GzO7Ps7Ss2WrpNdMqEXwnCvxsyBLd9t/xnSftJYuLqAk0jwTJuCZ
	xJOjWtA+tk+rSpNDPy6AO0qWlPO7axcmLjW7Y/6HfAU6g0Kg6wXRmR9Dpa2ABI9x8Z5DKCuSyYY
	jcHDWWBBLGoHfLiiYyq9NhQ==
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929299e0c.1.1789737838653;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929254e0c.1.1789737838198;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm856663a12.8.2026.09.18.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:23:57 -0700 (PDT)
Message-ID: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:23:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfXy9CKp+Zc5rZc
 8A/eS+3xOEpPQmElPB4xhkvjaV5NCulZQN9EKlAjRKwFPUWscjFuKCrDE8ve7m/fzhvLQNNP7Oj
 LAYBXP2jtIweT/aJR3Wppce6KJUhGcvpD0NE/SLMAZDOeb6pbu4KrM6yeXPCamN3J5MSFQOFT/V
 UqexJgjt+0Ztw3g6XWTIjE4Ac1qrb9rDZe9mzYu2mQFk9WVdcRZ6sBuMJETwBAhsTm6tpiY3EBT
 TVftcR03z5mWVCf2m6xONPFIuYxAWkLDnN5l9X2VoTh5X8Fo2vrdRChHy0C/c2dRLFrz+p77wGQ
 w98a6FYt/UPkKwxjgJ2DQZu2dlgmawhnvWkDKhVMOujv6PvNfkl6HLvpWfnDLO0n4IQ8fDC3+zT
 7uQB560r9Aq1WyfNcbzhlg0EzyNSP8bMxlzToh1AKaBozfrscT27JzFjJ/Crmap9V5TefRmMdeA
 nWtHaI+SJ+QbCSIixEg==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad3b6f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=PwanzjBgMYuxxlb2B-IA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX/a2IUHIDp4sf
 g6/P3VkyecwTh7WFN0gC50+cUEC0ar7cnnA97CBP0E7XvZT5bhwTGzzrK0mk+Rbt7ZJqfdxLT/i
 G5rVQpsdIsfbMZ1J7GN+U6Ju7pEHiWI=
X-Proofpoint-ORIG-GUID: GE5p7tsIhDbap67eh_-3A2SN0Ytx1enB
X-Proofpoint-GUID: GE5p7tsIhDbap67eh_-3A2SN0Ytx1enB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180189

On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 14:29, Konrad Dybcio wrote:
>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>> +description:
>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>> +  customization.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>> +
>>>> +  reg:
>>>> +    const: 0x76
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - '#thermal-sensor-cells'
>>>> +  - wakeup-source
>>>
>>> Wakeup source should not be required. If it is, then it is completely
>>> implied by compatible and there is no need for DT property, right?
>>
>> I suppose it's not *required* but it's highly desirable.. should I
>> just drop it from the required list?
> 
> Then why isn't the device driver setting wakeup unconditionally?

The i2c core checks for wakeup-source - I can remove the property
and call the equivalent functions from the driver if you prefer,
but that feels a little "rough"

Konrad
