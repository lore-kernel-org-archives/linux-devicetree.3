Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FBF408001
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685460; cv=none; b=QmXM3n6C6fInj3IsyMjA9WjlXmuO3bjf1NhgTgZto3SJREsyGL+sl6vcNg2Bok1fDBLhMayjD/8Sb1dHvZepXVdYzUGstLpsfhv4QOWmtQgpNs4bLq0zSV7TC1APwaKfbAtNMXVaAtTf6NJt5gv8OtQ0Ep96vucSPT/WsUsEqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685460; c=relaxed/simple;
	bh=LQuqMBiMfznhd5njKcRFfwpGiKCYjugLtkhtU7uU7rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbLNZYBvRghG5AgZVxZc3qmVi93pm3IvA2nVEmthbGnpkQ3xEfoW/cAuHngoDASh0R5O+G5IpxXp2zx1NWaHbK/5/lNlHHoCbZztdrlXTT3gKv9a6KquPrEIV3kVCbMCI15u0l7wxdo+7b2PSfHr8jtcI/Esa9pmbUrLrrV+LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjdqP+yv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG+Ad/CQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjdqP+yv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG+Ad/CQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmh4m393296
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=; b=cjdqP+yvsqtn6gPc
	W+muhRwpAEjb8KOgdYqYgcyr9oh7YA3nxxu/lmn6zEvw/C8I2oicRSES4ZQQBep8
	u22fp53QKB3BGmePM0prjkBOpPuHkc8W0uHr2yBIlapcZ0FphrPBtDeViTQAMs3n
	+H0UZx0wRm9P4XM2eHbln7299wzAI6WFA6s8oE9ssdEoK+a9+zhdbC0/F2EFrmJZ
	C7S6OY2rgHWvD9uPInMbCQBTm3qSv0C5KPf5YmcfNGbhPXaRM3HjirQFJBiaUG/Y
	IoNP6alu/Byf8pt25HOABSpN96pox1tbMPE4UsL1l4k4kwNMctXY0XG82VJPi+IC
	E2y5KQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8k6w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so2002761cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783685452; x=1784290252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=;
        b=eG+Ad/CQRqAWo2z/mxzOUoY0Iewu+f51JLlWOgPDWiFp4qmJR9e00c8J8fWh3rAYV3
         26DsbecVSFmaOg/7kQ3liyuXpfmtH2XvJjxKwpEs0gc7tV/B4fZuCMPNSYiQABsc3wRc
         ihGu1s9B9W7LaUw/phI/2Qk9C+W71MCzHGVuRarS9ngOdnhepD3FHdE338XNJjRa2mAR
         rOEleev08DTc6issSCyhFwLSL7EGfiFGvZPd6eviYZsCbDaAjMq0q4v3l269GcJ0EYLr
         cZSCADdOFQwZV0Pno2Aym/KQKgalqwi7Ff76T0o0eSil/DYOjTxVaASkC7+6OskLwmk2
         tHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685452; x=1784290252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=;
        b=UdHUJ6s25WlnOIcciV/dpi/R1DdqfAmK01du3Ax/mFwkSSayvcuuszTd40He2E0E17
         S2pu3vjZbMUzCk3GayXFHCosPPBIKzYXv+g3g0yirUX2r0C0gUe6R3Tu3CeVWsByZhr0
         wcyn6UqqyIEEmMZPoTl8ZpDCgEHEs79hovwwU4yC623hoQybjGs2xEI2jg/AHQtmxSla
         r3fBb177dsLh3J/QQ8GLzV212aSdO5hdIZAHA3NpM9BSuq30cOvs7CtEhMfd9D/T9Gqc
         GXor7WVWiJkyqmT565EzZ8mkxR6CRmclCU4Un1b4f6uT6m4cjPgQMcAJptnRWY75LfHo
         7TGg==
X-Forwarded-Encrypted: i=1; AHgh+RqjVzCCPm8LpxJBCUW6ATCgnaXsi08diBAZyYng57b4hZ4UaWRRpJLZRsIF4YT85I+yauLNtvAN44kT@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4cS5n0BgV92X0OG6+0iiS/NV8nzVUwHvNNicuPhfiN2Ra9da
	b6x+85M+RP4rjMcWsJ7FDLUdIGBrCfA/pKAY07Wef7HAG6AFWgwHaWHI7PN1m2s+samhIJNyhhO
	1xt6UI+JrAaPKH/UZRlRMXQejmn17Rhd4WzOI0PgX6kZFBto81R93S6Z/yA17Fcxf
X-Gm-Gg: AfdE7cmpIdk06+tOjinlcU29QdfK1cpb4oW/S15eA0IpcVAOc05olLLv+f5eT/SzmW4
	DRQg1zGFT7L8XqxuKD4akh9jf1LDMaNAOH7WHHiScPsYy/UX4adSweEdkveQu9/43ZpOpRJCUmf
	imTE5ogIRjlDHsAfxdOhc6YtXutZ5glRBA69e0KhsR8gnB6aq+YrZo1Kg7DcF1z4FRW9gLbTyAS
	kOwrf7kraK3D4tYYnpcTdJrt5jfeyj4M48kD0rc8tRuDfQbtGibkb7KZvfm53P5L9tb1Ht2dbL+
	ruZfgq+4G8lHrVHc0I3vmFWItNnWG5IhYqV+pH6NXFDpIfk44hMg/01y8SiROLR0/ywQFiQc2U1
	oiIE1dWijrnfvrgMZWVbTGoz3iKEKWGyRTf0=
X-Received: by 2002:ac8:5d91:0:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c964037f9mr69730211cf.0.1783685452054;
        Fri, 10 Jul 2026 05:10:52 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c964037f9mr69729851cf.0.1783685451645;
        Fri, 10 Jul 2026 05:10:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm437597666b.51.2026.07.10.05.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:10:50 -0700 (PDT)
Message-ID: <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:10:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CoB2lxuB4Jux_NVdD5odrJIH4wosFrhy
X-Proofpoint-ORIG-GUID: CoB2lxuB4Jux_NVdD5odrJIH4wosFrhy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyMCBTYWx0ZWRfX7Q3lfWXC5vos
 rc5S5dk+bziiq/MHyz3WlBudjFGp+rOD+WpmgjGyRG2droGBj32ByrJCvBK4zLY35jZ80R9C9BY
 c+UgtFOamXJ/V0k/kIR0xzzVkl1yUlA=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50e152 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7g_QvTktBp9WSWir8t8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyMCBTYWx0ZWRfX8OME/KCL4HcY
 ycxRKM9oRq1qaCUCCpRiIkf6hLGli4Ww/R5MScZ8a/9YzBtN0Rp2+kFyETDAL9mZPdI7nfxfL+b
 UirbGafgb0B/+Vmdam7Cs3r6hVpzp8E3RY5nb+dMgCu1u81EjXDjD1xChioM+lw18+iPQ52FQyq
 AkAS/mG5qqHoaNZfpszRQtEeqHC0K9cfypdO3pPrjAVsbl658I4WxwbW7x511e6b6+JeETma1I6
 xx8BnT+6KFxUEWQmpM4TJ2oIrc8xF/CH87tzUxVvnzj1WnURi+66lactJ9MzSFaeoSVrQWT7yod
 aTFNQKXNTzdBq5sWY9z1jZ1RecIsN7KVstimVm/RSHNu+4zqfIsoVrJ7g7syijMadXEFjy0Oqtd
 kO3zCPr4H7y09mKa+wKiYACW+L+5K4NLyBLNQ6BMqPtw9HEjOmmzPhRA7tYVzJsBqni+jEXyWzp
 MKcE51TzRCyCv+ThU4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100120

On 7/10/26 1:58 PM, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>> Hi Konrad,
>>
>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>

[...]

>>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>>> +        pins = "gpio91";
>>>> +        function = "gpio";
>>>> +        drive-strength = <2>;
>>>> +        bias-pull-down;
>>>> +        output-low;
>>>> +    };
>>> output-foo isn't necessary, the panel driver will assert it as
>>> necessary
>>>
>>> Konrad
>>
>> Ack, thanks for pointing out.
>>
>> Arpit
>>
> I just checked,
> 
> Normally the backlight EN pin is controlled by a backlight driver.
> 
> However, this panel uses MIPI DCS based backlight control with no
> 
> separate backlight driver. Since there is no driver to assert gpio91,
> 
> we control it via the panel's pinctrl default state..
> 
> So this is platform specific pin , we need this to enable/disable
> 
> the backlight.

Why would the backlight state be so tightly defined by the panel?
Disabling or adjusting the backlight level without shutting down
the panel is a perfectly valid use case.

Take a look at pwm-backlight or gpio-backlight.

Konrad

P.S. Set `mailnews.wraplength = 0` in your thunderbird config - it
currently inserts an extra \n between every single line
