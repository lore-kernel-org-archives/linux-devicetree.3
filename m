Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F82D29C8
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393623; cv=none; b=YAn3gV3UDayyOi6v4zEy3H5RGzxmJVbhr4v9MX+XZ4zf1F3+rLzatSJNWIbjUwhS+f9NdpmYkejxwg+RAh7CB12CL6b4a4uv9aIELToQDJT9ckRavOySDU3d8GLj87anbm7Mqzrqrs1BkDSnKuZrZyQfypuHmB+Iga+rEQGP9ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393623; c=relaxed/simple;
	bh=hVd/9vBlCbyUh6zt9JM7gQXmP2qyxhw6kvFctofIbA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYk7aTmTgzxu2+GDwfjvUd+EXAVyMtF1AzwDk2xDMapFjWODLjjzkQGoHV2+ZIrfyJQTLQS4tFFqeZ3Zl/JD6y3pT1zZYdisePthMNpuEW+GS3rwtrgr1SLC6V7AO6Al/hCQ4GQNZa+e3Rzgr+ZZhyfKzHwRClg5s4mAMahZdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKLgbtVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atcpNZN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKLgbtVx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atcpNZN+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jxC71397980
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=; b=bKLgbtVx0zgQeLSv
	RG1K0NCDSfXhwbVrQCu7661cFTEtJXNLKoLoiURkPowe/nqyPIwyo00TJRxo51s8
	HHQ2uiLRacNOz/oBMAzEh2/6tII4Vc5P2n8D3ySTeQrSpD1PXG6aJVQsZqSbDwuZ
	zL2Ufs/1h5DdLyiCCpQXALBFA7Rb+RfsDYq9QrHLVmSDKuN1gk6rGa6/tScSbuWg
	+oiY3ycPk2u2i8bHvNfUGdAa0BEkwfz8pl/Z42rg58DoXDmisvjPf4F3bfPv1hy3
	EtN771a5eopr8Bsi3rVECixyuDK2Bx1x9UzrhsEOLiFEPaH9dZ+MrZtC4SQ+DxXs
	v9midA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudj8ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96751a54044so1444773241.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782393619; x=1782998419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=atcpNZN+8lkAjt0PwmUuwTWJPnUEvnXZnOUbuPt2k4hV7h4B7iFeI+Hp10efe4cNpB
         b2aOcSwfIvprWhrFhRuGcFHVrME12y0xgXn2YsnxlwX8bQA34xBT5iwZsMa7oUAcJsy8
         /jUoWv0m210v+tHSuAJQjMjXfeJfoVXhLsjO+GzlP1HP9RWJ88gUROKCmVgZJNhkyIzD
         Kfs52xGjcU803NuVZuARZ94vonSisJSwN41LF9m+ww/go59/xc4mFQx0JnKde/6FVGFf
         /ACJ/L/FZDmRfppL6ZdwrSbwMdh5o275ulw8Tg4kgMShFS7Vt5G34HPgCN48CKzwJJ1D
         wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393619; x=1782998419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=e+5K2AIcFYd9N8lJ/MUbivNQSwo0GP6OEOWZF/Osdj1GmADwTvchB1kmMBHYyZyVCC
         qmNvQDhMoyhS9CBhih8vnpzu1ccnDKbm6d+m9St+6wy8vHqcsd8xV7+Ot65Ayig9LF7d
         rJLeKMLZYaqQje80Vk7eOgfPO3M16qF7QUsBMP5EZv7lBKSOsl/oTPuy5w9S9u1/ztr7
         iHdmqk2evj1IDD+vxx9BQ9zwNolZwD6CSTR4ZEjToIwP38mHNykd2wlGAu1hjSmDwgBi
         UifGp9fN6MYZchr0+u3i3KcrweuVkC7P3idH+zLWW14cmpFfX9JCtV+1/ILcM0SUBZdH
         +KEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6vQMoSGEdAkRU51JjcQLoNIZVV/01DAnj9rxk+AAmb9XKmDuLRevo7jiFtuVzDzV0NtaNVwLxGPb5@vger.kernel.org
X-Gm-Message-State: AOJu0YywtGkQ96RR4dpv0VZg0bp3kIE9pZKgnrgpOgKjCUPRvwk940/s
	QINh8201d5TAvah9VSXLZBDvOlLNnbznj7lEeNp3oSS1ECCGRva92LgY4BoWvFcY7xR6qm5g/rN
	yEzUqulf2H9KNDQ305XjPgYfF/QmjeOEeZylTrJpv0qyNvma5nmybpAzPdo2B9eYX
X-Gm-Gg: AfdE7cn6xe1QfK9AsNIDlEyVN/YhWgZQN3vwwImK3IK7OjNfrAWQm40yB/OiX0rvi86
	Cb/DB9/HdB3B0LRsalnVCc9K/4jvtuNmuEP3/Bhc4/ZmJlDpuP+YqlP1goHcs/geQARQ+dzcWg6
	2d6/p7YKe1W0UEE29RB4qrMVZwZvlMVdh4VtoSlrt7AxWWmXtEDOEFaafJvU8wLEjoQUMfsdOy4
	0wF+JvcdUBbYwaCl5bTPptqk0ZMxyYs0XvtVWHFwj0oNNKiO9JFtI3zJGh2IruuU7bRqtjSeNqI
	JZH6Me5MJD+ADDKudxOnvJ5+DKjMRczNBuhTfG62JyOQ3p9T8v6d22V6xsimi8LXDqtfW4hZeI/
	Q5Luv+HXkhfDe61EzO7Iz8UUBULBihlYM36WWYAUHA4KFkuv7b9E96BBG7tiXUrY7uJ5gQU8=
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057814137.4.1782393619055;
        Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057791137.4.1782393618631;
        Thu, 25 Jun 2026 06:20:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fce5:aedd:3ea4:36f? ([2a05:6e02:1041:c10:fce5:aedd:3ea4:36f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93cdsm19126758f8f.18.2026.06.25.06.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:20:17 -0700 (PDT)
Message-ID: <638eebb6-c03e-4071-8aad-a5da30ddfe3d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:20:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
 <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfX2E9rZs3e4dcH
 XUKukFUTv2/R6F65ayvLlv03fcjJaXYB3Tl0wKgnNhry15JyZ0eJOLFvzHa+aqsAcdFSVxykqzQ
 LW4XvPH8hiVS/imoX2VhY4oB/w8cqu4=
X-Proofpoint-ORIG-GUID: 1qauG7E6Nlwsi4cUYQy5fOmdrMbHZERM
X-Proofpoint-GUID: 1qauG7E6Nlwsi4cUYQy5fOmdrMbHZERM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfX6F0Vi03OImiv
 zpmEnoHBuw1yQQR9GFf++rKa7gIWAknWnwNj9jtNfWdSP5z2kY0KpVe6MsmiowToNH7XlzXQogb
 BpSLzXZLsbCbVZYyUHhLu9fYxGVbquxJpUPp8Sar2a7cQyMruVsctZzzBvkJ8C/wbtvniO+rFc3
 hMcyJ4PSPHtTH2MvzgXDVH2l1qf2cfEFILe78yK7YAQ737Hhr3twr7hFbhW4Wd4q7OTxGNItbno
 3HDF6F3VrFqGZVfFKxRS7fznsaJsRvwa7+ITXpwLNockKmQSWZonkV0QoOVUUkAYOWWeB/3mDKY
 VQ/kZk9zNOIePtS8RuV+UDhmkunyZTMZJydSddZTwJHSGLqQw6/1aibjJrVTi1rrdK59HMjoXSS
 xlfJbLd/iBCjtISZ/uYmzSZbupZjerRkfJnfDlg2x5vsxKTYalGXisyTiBUm+pTu+tLAnXHWmbs
 malIemh8HXXgMvNnCaA==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d2b14 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jUCef7gqdSedP1EdzSYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250114

On 6/25/26 13:36, Konrad Dybcio wrote:
> On 6/24/26 11:08 PM, Daniel Lezcano wrote:
>> Add thermal zone descriptions for the keyboard skin temperature and
>> battery charging circuitry sensors exposed by the embedded controller.
>>
>> Expose the EC as a thermal sensor provider and define two thermal zones
>> using the temperatures reported by the EC:
>>
>>    - a keyboard skin temperature zone with passive and hot trip points,
>>    - a charging circuitry temperature zone with multiple passive trip
>>      points and CPU frequency mitigation levels.
>>
>> The charging thermal zone progressively throttles the different CPU
>> clusters as the charging circuitry temperature rises and triggers a hot
>> condition at the highest trip point.
>>
>> This provides thermal framework integration for the EC temperature
>> sensors and enables platform thermal management through standard thermal
>> zone definitions.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	ec-charging-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <2000>;
>> +
>> +		thermal-sensors = <&ec 3>;
>> +
>> +		trips {
>> +			psv0: trip-point0 {
> 
> "ec_charging_tripN", please - these labels are file-wide, so it's
> better if they're not overly short
> 
>> +				temperature = <55000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			alert0: trip-point1 {
>> +				temperature = <63000>;
>> +				hysteresis = <0>;
>> +				type = "hot";
>> +			};
>> +		};
>> +
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +
>> +			};
> 
> Stray \n above, might also possibly want to throttle the GPU.

At this point, I don't think GPU throttling is needed

