Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247793A16B4
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449314; cv=none; b=hgNkZwsvi0XbGeg87t70+OOF/KVcK6ygwcAhXS54n1Q5zoKb81/ZbiyUrdoyMXFR8PK0HoxUHseqZat1dEU7E2yqtflVNjUgvl45tc3N/LGsbgiCX7fn5vbDfca6YDWjKBkb7Dc/hQCYiCS/Y5dtgSvcEdFE+t+N5ZY6JKyRljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449314; c=relaxed/simple;
	bh=GGBj5Omn5eGTfnwBhm7bOf3DSJcY3zfC7XPsQH3CnY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnwPXR0pnGs6N7AUKETuLf2jdNw9NJ2ga0+0d28k1ezvSUp6I1HqhOkWRD1GYJS8K9OlH8czfvWVOFFU5mB35C4rvFSS7+/j5Q294w2cuIreljl+SZMQsbrUP9XrnPQswLp8JsLXoy2ZlQrQhcYsk4SiGMH+CxothkwSFoaS7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARu/+63R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8cGHqp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARu/+63R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8cGHqp5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4GcJ3929543
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=; b=ARu/+63RHiJpOpF/
	1Hb3ePPyv2yQ0asDXeCVZDLxE3NW1rzhDMFydE9U7Bf69SRaFCBJjne9EE0XT/Wp
	xltTcJXcWoCy+ebIp7BRfSszKAOn94mPY/FFG9+04weblHmO+p8OyKh49ZH23ptd
	/bRbEtced7BCRTVTUSB83UzjV1DE3+DfMm08GkO/g652YePBxZxRoWLEnh+fd779
	lapMCpmkU1hQLw6MoPs4vmETe1Rk/eh7+Lnf9HYXJmKuGFDxrxW/GAv3d5gMDFH2
	nEb+mEAKFCcVWmo6pyaARJsBuV6BAtW+B5zt6fw5BUvIqdB5Ve9gnUYZsfj2urr0
	0d63iw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujgek8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so1192072a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449306; x=1777054106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=N8cGHqp5JT3aOQDXXSrqPl0wyXF30k6JoP2AtpWEAj2hsCgRXZ8ZSCmm5L4eCf571n
         TFN/1II7DZwMoePafKrSq3JSaY7oR8k2NNq8F15R0Oks324jqgJhejdlF/pEoALZVE65
         S4GSDuqnc4lSRYk6rxtqQECHZUUiGVy+XQMDtL315pRwL31NQ6aVASfd8n121yMDvKlC
         /AwCv6rrHnztPgv5k1WViYx8xboMMWh2rnI8kqDqk90/KcNExhGaoTbNMXPLXVwSDJo/
         iBwaFtoZX4JUUp3gBqvhrU+AtXCTAUSi8pCuQTauSeF9UVhCLn1zC8zuFyJWflTRkkn2
         68Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449306; x=1777054106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=AH+Gf9+7WjT/4q0rgawDiln+UXpWKS6/386V8l+psh74XDfVhNXjHCyVx+eJT6BLyk
         mq1JX5KsXcOOfDWRvjtuRfRoyXOIlbbSzdHnDcAVsahdWi1nUXX9Q5aPMaJ5xXLp3gCu
         nIP1rDtPwL5BoB+oxSxSjkanTXXPw/86hdwM7tbqGGggnAhvd+d+SNJMpiQqCPsGafY2
         T3GSsRG72v4b4iMEpd7jjAbHoyW/W9OC+pmczyFEYbsgyoBm0A9CJ6/XIpfJXzExXPwh
         BDtzzeGzguXbRSYAJ0eiah3GgRCP31E4L9ixRL/GZRDuj5zs543EccsFg+p8K0tlaUHm
         7VUg==
X-Forwarded-Encrypted: i=1; AFNElJ+tG4EwatC7Dg9EhrEnllADjbEOjlXYIzw8Boh7xexJ5r/XMTouoLn6g5TbfMNYUl3T8JjNp0HmLfQu@vger.kernel.org
X-Gm-Message-State: AOJu0YxCobkmsQPZXgO4fpFvnCMbLTJfrAdHiGOcSDnW+EGWV5fIvlSg
	wE5dLZ/42AK1Qpt7W/ug8lTJKWnlBjYtG2UmeUSooVXNVycxYBtCl7EseO0MVhj3KaWyCD3xtOY
	7M9WpqoqFTr29Pte9VavRURfMZ64sB9vpu2E/9mmgOKfDcLMWcrEOcfE+cb/6EUHl
X-Gm-Gg: AeBDiet1Ti/sbHET+PeBBZWOYXlHstwwCw8wWxWfbPffmvsbisUM39s0fGqfFDu4Tlq
	l/tevbZH6r6KttCw2qbdB6wtLLfw/0CVmKy/lOnV50NZpHiBtJqbGNHTsxeDYaoPRignX6Z9RSL
	ZhHQ2HJIdqpp6w9f5eaKLdeIt+f88lM15Ob7svkIE42hw9fm8v4RalYLfLkibztV76HA1E9hOXt
	sb/Nag8MJ3/Wivu0O9LG99BXqEqZabpTsmq4JGK4CpM5cTKzyxZMGr2RWNcgOlE8m4oA+XP07q+
	x5yT/jjA3LdqKvP/iEJUNn7zTZbx0q/9fxHdG+DKmBwr1VK78d5oIY8XbD1IQq/KvnF5kXd2Bj9
	cWIq1jE5zoZjtpK1rzVC1nEmhist35KTvUHe4SkRqMDV47Si7tK2/6eM2pjmfnqTr
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987072a91.24.1776449306072;
        Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987033a91.24.1776449305385;
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.17.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm33496785ad.7.2026.04.17.11.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Message-ID: <680211d2-9277-4a44-b403-a2c17e531d3a@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 23:38:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX0E1yZSeyC+6I
 1LzpHMr9nRAayVx2DrVGtOVA++/Q4MfyFUpsnSbRwJlbdvlfuAB4jFPBu3znK4WRsnP/xORr/Ww
 jwg+8XFmTwvoet9Yg+FSz3dB8OMh920X+0L0HEiQbXcA9QFUzhzjrrPERFNPQ3maa9yvwJSZnZy
 n7ENJLGQN/WdViOLBvgNf/aDgWsEMOmQkEaZAiUnms+dk3u9kY6LPDOCU6lqrsDjjcfYVEeEcR0
 r03jJNgi9F1MiyCweLSaIjEmqeu7ZEIZwW0ojSsZJyVtzv2b6moegd61Xepqplnn0mZ90Q9jwqC
 uc4uuJph7i/TsnKGG+OmukyoPAvVi/a5h403DSdcCu4/IUA1mTXF6v9+FKMSNXiOq6lza5TvfgK
 2Vvp26c/1TXpmsbGawdDyv5sDNAZdFMjcWvDgoxkaptNPA3eIbTzMxSgnIoMpCuQNEzVmD50VVY
 0sh0a6DKOwyoJJMU9cw==
X-Proofpoint-ORIG-GUID: EkzJcxTmoZmZ05u0BfHOScP7L0SyAZiK
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e2771b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AEHGBJ4MxtK84nyFdbYi0g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bmlHNXG4B5j1TUniDnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EkzJcxTmoZmZ05u0BfHOScP7L0SyAZiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170182

Hi Daniel/Guenter,


On 3/20/2026 9:38 PM, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> On 3/20/26 16:22, Guenter Roeck wrote:
>> On 3/20/26 07:52, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>>> +
>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>> +
>>>> +/* Interrupt names for each alarm level */
>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>> +    [LVL0] = "bcl-max-min",
>>>> +    [LVL1] = "bcl-critical",
>>>> +};
>>>
>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>> and critical. Would it make sense to do adaptative min / max ? So when
>>
>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>> an additional _cap_alarm for power attributes and _emergency_alarm
>> for temperature attributes. There is also a generic _alarm attribute
>> for each sensor, which is supposed to be used if the specific alarm
>> type is not known.
>>
>> What exactly are the three levels of alarms ?
> 
> Manaf can give more clarifications, but it is like we have yellow, 
> orange and red alarms. So there is an additional alarm comparing to what 
> is available in hwmon. The proposed driver maps orange and red alarms, 
> respectively to bcl-max and bcl-critical.

Yes, it is different limit level alarms (3 low voltage and 3 over 
current) like yellow, orange and Red.
Currently I mapped, yellow and orange. Red is not enabled.

Thanks,
Manaf

> 
> I'm just asking if it is important to have this 'yellow' alarm ? And as 
> there is a missing alarm to describe it in hwmon, how can we use it ?

