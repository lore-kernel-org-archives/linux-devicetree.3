Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8E3F0AA8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815654; cv=none; b=iKmlkLU2DQho+gbZVBq8+bEgxt5LRzrtO/1IjBr5jOMVTyjaxD9XsyhK8kR1GvMnyKoy+2WIiCAb9I3XQaykIbjzdBuL8b4WEk/sfbkeE6nXrLoSJz3qh0Y5GUC5ikRSds3RxI3Oxnhxu+eeV11mGgm9jefhzYv/JLvliLExihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815654; c=relaxed/simple;
	bh=lyJ2DIsUIw9wDCzRlH3s/bM7OM6MKeM10elgahvX1t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMdyG0Qmraexi7pSb4/G5LZ7UXMvIziMB8/2lmSNdYHCHXEABSyCQc9swHdJXOSyfqxwhGgNF7S57qos0BGa1jWF/POV+XPwFQQCOwnnHiUdzfgfuGrHt9ybwuldliYTE6cOm4LUFYNQvoaCGIxUcx7UFeQZjWiblZZB0PTmOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/VrF+R4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAtNup8D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/VrF+R4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAtNup8D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n11T1573393
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=; b=H/VrF+R4jRq6dJMk
	WLACUDnkQtNgzFdTJRclHpuVU6Ztj7/r8mvRfk9Uz7YyOxg9hjMW0Vj+N/9O3aSy
	M19SsPwUor+mXwa6/6ny9wZgu+No+hC8UHE6okD/c7oIb0b2BJAdxkyW/WPuuu1B
	2t2ocEm/urWwwfojTEePomInnsJ7p0XhDYjI4qpEnO6sEM1vnyiO1CL1aqIguyV7
	A6vKnuq+zf6g0ZHZzRod8NkgEtqRs3mWLv27YluOQqHw8DoG9opJJi2bsfq8NcRz
	clrfgsx3HFZl7BNlXsInb0cxok2QXMovvmNfwH4sS4TpA+EBPXyvdprWNn9HHy5b
	PH0ETA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861pka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737c728b37fso94582137.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815651; x=1783420451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=;
        b=JAtNup8DyuNOew0nc/Kj/MuBPP0tgSRgqJaw5V7Iopa1obVJLjm+vHmgkPYKy9Fp+S
         St2Lm9ZUU+gW1ZfbTRxpkqOzT7Xbtjl7lshKyefixsjhgWPj1ZOZErx2JGJA+jWF+NmZ
         e1EqKOKxl7tDcZb2GxEPA+0YFZv4PIxUvhDTbn8iioyrFdxphVEiR8HmXAbnKkGVsaDO
         WVO8Jsgnxs/M1qnaLtxrVz5QDNVDtKsYzLdyd93FIvCgbJVZ9pMNCy52SCh2c+ploMyQ
         XYrSOMADPhhz4GjbmdLXSIWGvZ9SMH3EkXdosdcnbsOCIIoulSKJYmNu8hSVABPEP4Y2
         DVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815651; x=1783420451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=;
        b=UvwbyTm+7fz5h1JNc6dSOPH8G9Lc6AeQOdlFy0M1xLTLjy5XH7ak0J4cUF0RTTRpHg
         Ch4k86XuwKQgOxn98mx7kzQiBAB5TASW2mGiaevvE4M6HPinHGUxgLDeE4w5rm9YbuRT
         bFQs3UJ5V/s9sZv2N+QYsf2UADGL33c0fGAjYzDQrpUHi4OUWibxloC+Z7JYbfdXoNna
         41yI+fryZeN1fPMZcIPRbxozF5O0jrTDFZXZmVv6nATxbIcBgk/VBvgERgIGixhbLbVd
         gGU7Xf22/5iPEFLVk2ws0CvljEn8vfsRXhyZ0c6HdHwiXrWGbIN49Bz/C7HKuI9Onl2A
         chsg==
X-Forwarded-Encrypted: i=1; AHgh+RpFCCW+hgBreZCWQYA1AqcwADA/1s6abkLSbbdp8QXyvlw2Tv4HFkf+PjrhdZbkZspfsTFFYBRoiPFD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wtDR40d3MzH2Afz6UkBXgT0euOsVYaeZkVgkvjDMnuULrlWE
	ePpXrwNe1MXTUHO/XUjVfp2iJDUwacbhjgGxP443eNvdCb6QBJumIY60obJLTqbqiJR2FcnluWC
	C3x6dlt7AD/vrUWHBpJemXMrfmTb/BgQgE/JR3aQub3hEmHmFzd+mbifZ8Ncqot/Y
X-Gm-Gg: AfdE7cmAVL62ixYkPfo9nTV8ZO5N9MHABvtlSlq5JvXGJz6+JCBd4M813Ha1URvZdx2
	hoRSkEIeaQT3bhC7HDbaQxGeGFmhnuhyFEYSJ8ncCequ3TEW8an1Txj46gF8RaNUk0g62YOslc/
	9m4CcfNuXlx8HsMwIkXvdtG9St7+eRQb3z4x9/J8hX89Lj6sVwAjgh87M2he63GtwptjmsoSLF6
	WouPaT0beii7iMUbeNTgzHAYg+XtPucWKccVKxdT7L4Xkw5kn0c6rhQKhKbOQEjfQWEnXdTn7U2
	YytP3Naby1A9G5j3TdmyezSku31/tyiBOjYcJ0ynQ5Pjme1VhkGr1rB485Ut8gu0hLp8p6nldCw
	aeuovFfpsfQH8goseCDpm36N49fW6gA0ZPmw=
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr523879137.4.1782815651540;
        Tue, 30 Jun 2026 03:34:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr523877137.4.1782815650930;
        Tue, 30 Jun 2026 03:34:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968201sm917585a12.24.2026.06.30.03.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:34:10 -0700 (PDT)
Message-ID: <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:34:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
 <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cpQCXo05QU5P3TBOAOyH_ZLImPjUU4L5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX0eTwNSpqvjsM
 OSwSlJWEKRZn2aVai4fK3vAnaoaSbX5AJu76n4RgiX27hbl+9YPW0nljvphrpH3qQE8+pl4O8c0
 cH17G+wMowC/dyypxZ75A0CpkdWhqakF7I2KbFG2k/A4WrUVzpnet8ZQ6PbZsm95ztrBlZCCADO
 SoXu4lHOgJ4bM/DtkzGF+D13gqltZv0HJNIDPpeX8oVJE8KPrv+lxIuCx5ocRXAdMuMqaRK6flf
 icah7GIIXD6vI4YR2SHR/ielm3gTeIoPkG83vrbqcvibrZARVsM4ZoIOmrWAf0ePzA0+lxcRZCo
 K8iBqa3fHxZeVTnpbp8Xht/QaAge4XtzCNRxzfjWSEsQfpMbpkNSjiMsNd/4yE6AiTuJ3YRMy3V
 fVl4dk87EVItpYRe0PFGuPHOL5YXRkTg0WdXT7AHXi0/88YEVs/3avFrCj2C9pkafvWoRwXwR84
 +nPC84QjELzABuaOI3g==
X-Proofpoint-GUID: cpQCXo05QU5P3TBOAOyH_ZLImPjUU4L5
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a439ba4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=AfCMliE2q1qzQo8TwlgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX++IOem/7O6PR
 s0Rsv4p+bzNAiFer43pF4L5PZ3rY03d7u2gq+Kp6OgVHQOhs786dWPXdj0CiBLFd3g82O5yMG7L
 RzfRsv7rGXkB9/q45dAjUPo5Exhgqzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

On 6/30/26 12:30 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 6:29 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>>>> DSI panel driver have been added for a while, so add the DT node to
>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>>>> describes the wrong, no impact after manual disabling these wrong
>>>>> supplies.
>>>>>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +&mdss0_dsi0 {
>>>>> +     /* real vdda is unknown */
>>>>> +
>>>>
>>>> L3B: DSI core 1.2 V (both?)
>>>> L6B: DSI0/1 PLL and core 0.9 V
>>>>
>>>
>>> Yes, that is what I saw in the DSDT, however, I can disable them
>>> safely (hack the regulator driver to add a sysfs to handle these
>>> regulators), the panel works well.
>>
>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
>> ends up being on), UFSPHY and USB1_PHY
>>
>> L6B additionally powers the same components, minus refgen and USB
>>
> 
> No, I confirmed they are totally disabled, since there is a way to check it now.
> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com/

This presents you with the status of the votes casted by HLOS, not
the actual hardware state

To get the latter, you'd have to dump the SPMI registers

Konrad
