Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623542EEDF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830874; cv=none; b=mDZdvjVcQae2gX+fgOlEa0OeWv26EXBBuiUPuama4OWboONsfn/McxRi9GKP9PJEngv/Jj5IahQyQQYLS7clq72hyRworgy9VqsBJiSskTzctkDouIjEnSTKq7ohaeO7vq2YRfx7HYErlTRHeozMpGJvS6wIuvwsrDpnKEtx+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830874; c=relaxed/simple;
	bh=a67mJeNZX5KrGqn1ekXxXkpjh2tMKqBaoHlEee8u8ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgsSKyb1x9iXsIwgo7z0xgcsYFOjnpVKiCVhDghv8HMXyVQWMvPCz/FIca+RE/eIA1vd78N3dSBs7wOJ+l/4rRwzlr23eFl4HN0NJSXRFbCkc5FObqicciw1uMcq1p+7wXUxFnYCtt50MnZNHiUjUGIq/L2XhdoaBwjJvBFO6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dzd5CTwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHrVV4AS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dzd5CTwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHrVV4AS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDVDJ2116458
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=; b=Dzd5CTwfdNllBZOg
	wiydvEVqE0o4mIcuAZDuSzXpHMQhngLUtu9Ia0EMoz+d71o4uVHilfDFTmNJYaXf
	tkujPdME9brquKY0IH+lzl8yTBu6uSz+yMqd7b9/gLnRVcvd9dlNhSh2DIkzlABm
	XvISyWTFDV6jJNTRnZ4aOJkLUaIrZU5c3+mYqH04NMQQDuQc7RakwOgsIsHPu0xA
	cmTfH97Pvw+mrJXK+VU7pZP/oP1r3Oty7N25dK5lEb5YGQpDAlBr1FQnp/CoVOdO
	Q8oN4ugNYU9kZwte/lPwXfeEEaj6mrhcP6Q2mkkWFdqjNOwCMkqhMIFcGAWHOAH3
	+d1KUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j440u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:47:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5a63e1f2so26421985a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830871; x=1783435671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=;
        b=EHrVV4ASbn1dkw9BncJKV293dvWQ1DSqtfEo8dvBQCek33UHbtHH7P4peUjpw4LnEC
         1yn3t9wEsQhs0jPLoQbhehRlCNJXZJ4obrljrUiCh8iwePDi7qrG69AJb/YodR+HToQ9
         E7I0vTykuivTf5jbzA4ZzXcgqRhSRAebXl4658z8IaR0fvu+6qSUFCL6U85zAdzidRgV
         jG3zxrX7aFoptLddbc+K5cszW//1Qw97BSEPYlyQN5L0wusLHIdaHYkY167wvO/BMCgv
         w1DUT5JVkk6SpajE0iknkaRlhz/Acm1/W+4Dby8bb96EPptR+9LXMib9PRz9mJYn5Jas
         TOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830871; x=1783435671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbUiOCaUaStlX9RnL5J3MoliSUlfoFKIYcIBvrZpHGY=;
        b=Q/h8tbkVycJr95Gd2YX9ox4ZWUHDSE2ph0Dr8B7W0ZlWafq8NDQCFSEaxpscsqpX+u
         FH2yToWr7NDOO4oyokuhB3yKyBRsP7SY4WKZeMsRFWNqKPqbxIbsKim9bxF7ZLNOz7JT
         8OZGozXbO51rL3JKOcDynfX98zkuRD0HpYvesMKutgisVojaR50i8cKTiLR8GOkXa6MB
         NEG1vGgkYlut399ZhBtnQnIxEDV+YvIf9UgtvDhkCl0LRZfZVJBEyCr72RkyQsqihZmB
         Zp4QqloRvysoZZGhUeqNJ/wfOa1RxKl8IJGyv1gjMxVBtErwURbJ0GIYy26zX4WxHFUE
         1NQw==
X-Forwarded-Encrypted: i=1; AFNElJ/OrohyijdmXO+d7kWvu8cl3JM1Ugv7Qx73FQ1BWZY6rK9JiT7xyFmWcvKdKUDmPC0e1kBtfuiLxoMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4yuzGR+buI0ab81JR2nfe+WWxWsE2zwG/IzZqJSRtZ2e3+Dj
	IPI8YER+hF2f8uX24YsKPr6Iu0eVZAhxugiQg2WgBdzjB51B0V3+S6qRIanwcGfeYrRn2v4mfR7
	jg/Nx6Fz19xWPPWwsnOIjH2Ya4aJqbcJwJNAtQ5V9Z0grzQmy4wx+yZOwfdJATMcUIwzi4I27
X-Gm-Gg: AfdE7clguIMwFDAC6xZ8s5Me3ueLyL/kQAlLNYsFOnyMggpefeM78F9kwBzEK8xZK4y
	W+IKAv5YazUq/lBnQ88NFcWjbGuIFg99x4ke5hIOHH4hYD26l9z+KRlrbdJBh7VBoXF/SwwBLtW
	ALwjhs+0iUhOFNlruGgxnm/oL5Pe8pEyclkW9Y7kAfygz8vj1C1uvlAeyRFs6EA8iZAvv68iwBj
	LODEom9KGBbzqlARlr7YTBTGBY53W0jKjU6s8Py1V4Uwnz/JBqQ0yQY3TZcRHzmnsgQwAGK4kPJ
	JgXxEFRG3cQIHFQa66LUpq2AaYOqFsT1aV9Er2Mczktfdvy+CY88rHgSVDCrSYWkTtReWz9LeAD
	LNHh2UQexc/4T8k1K7jI0ny0eSYvWZ+ATF1Q=
X-Received: by 2002:a05:620a:178a:b0:92e:5aa8:a4d0 with SMTP id af79cd13be357-92e627f639cmr370760285a.8.1782830871153;
        Tue, 30 Jun 2026 07:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:92e:5aa8:a4d0 with SMTP id af79cd13be357-92e627f639cmr370754985a.8.1782830870603;
        Tue, 30 Jun 2026 07:47:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c3aesm144203566b.47.2026.06.30.07.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:47:49 -0700 (PDT)
Message-ID: <746aa10f-65e4-46d0-8db4-bc6314343f9d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:47:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
 <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
 <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
 <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
 <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
 <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4yAbUa79u8Dcs91EFHt4CSPX94BRd_24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX2NBi/1bUOHZU
 8eF7h9MfAJrG2AsFrG7QNajqznkTwlzKL2sLSbR8oSVjFz3/1J0uPK3pwi+fdbVUH+MNITx1far
 RRmlvBn8m7MdwNIW4wKI7m6rgwKeIww80kirDPOypkNnTKZ470J8LXV+McT92XMtXOZqgbrfSVj
 gASDbeEBmKQk4lccrb4/CzLSfWBChR7uQp1Db+Xm4Kt0FXMDE8x2K235Zf/JB9OogxcGaZAXnw5
 pyqSWmOMQ3y3iUeRVsDanbOHLlHvRTq3u4jIhWr9UQ/eDrTpCFPDGNYKYlHFts26LtxhZ2rpfAS
 Zmlk8aZwhCa6xCmHQHUTvoELZYncOSZZPu9lPD0jCZ3OTrvkkSBtUGYuk+2GnWP9thB12QYDNHd
 W/vxO93xLqtNWdX9udgrF++djgGJbs5qaWeOXOSYrJeQf/VKV3IltbxGRdm3CPiE4Eg3bjoh6Gr
 XIVhCEePqmpEhAoFivA==
X-Proofpoint-GUID: 4yAbUa79u8Dcs91EFHt4CSPX94BRd_24
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX0R/fLUmioT5m
 v8sZ1qDCyVc95PxBCS6XvNKlwmC2ZqdXN5dy3/AQxpbAYReJfcgihoRgOCFoyN+fIRS0rRaupnU
 ycmRHHjjYOOIhz5yBVpN+l9B3X8KoI8=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43d718 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=lKQ-AihTAAAA:8 a=EUspDBNiAAAA:8 a=ynoDEsPQ24qRF2YoZ5AA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300138

On 6/30/26 12:51 AM, Sam Day wrote:
> Hi Konrad,
> 
> On Tuesday, 30 June 2026 at 8:39 AM, Sam Day <me@samcday.com> wrote:
> 
>> Hey Konrad,
>>
>> On Tuesday, 30 June 2026 at 12:24 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>> On 6/20/26 1:15 AM, Sam Day wrote:
>>>> Hello Konrad,
>>>>
>>>> On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>>> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
>>>>>> From: Sam Day <me@samcday.com>
>>>>>>
>>>>>> These regulators are marked regulator-boot-on, but that doesn't
>>>>>> guarantee they'll stay alive as long as the simplefb does. Adding the
>>>>>> explicit supplies ensures that booting with MDSS disabled doesn't
>>>>>> switch the panel off 30 seconds after boot.
>>>>>
>>>>> Why would you boot without MDSS if you want the panel to function?
>>>>
>>>> For my particular use-case [1] I'm trying to avoid taking over the display
>>>> hardware entirely, and use simplefb until kexecing into the real kernel. In
>>>> this case the user might halt in a pre-boot menu UI for a while.
>>>>
>>>> I can also imagine this being similarly useful for "recovery kernel" use-cases
>>>> where again, it may not be desirable to assume control of MDSS/MDP/DSI blocks.
>>>>
>>>> [1]: https://github.com/samcday/pocketboot
>>>
>>> Can you handle this by adding a panel = <&display_panel> property
>>> under simplefb, pointing to the display panel defined in the same
>>> file?
>>
>> No, that won't work because display_panel is a child of mdss_dsi0, which is
>> a child of mdss. So if those nodes are disabled (which is what I'm trying to
>> achieve), fw_devlink will defer probing simplefb.
> 
> I apologize for spamming you with false assertions! I just realized that
> fw_devlink won't step in and enforce such probe deferral unless the property
> explicitly ends with -supply.
> 
> However, I tried your suggestion and confirm that the LCD_VCI_3V + VDDI_POC
> regulators are still turned off by regulator_init_complete_work(). Since I've
> already embarrassed myself once today I'm not going to attempt to speculate as
> to why :)

That's the way we all learn!

Looks like the answer is 'because nothing grabs these regulators'..
At a glance, grabbing a regulator reference is strictly tied to a
struct device (and its fwnode), so it's probably not so easy to make it..

Konrad
