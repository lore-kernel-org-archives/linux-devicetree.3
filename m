Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867B37646E
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873716; cv=none; b=JPeWMrC0RifjRvp17v8MVw2OD1r4Lmy0wQi6JlSUtLcbcWPUN8Srq4x/0d6OmvDuU2Y/UYbzvuFlofQ/uk0kFOLpZdRod1YtzrGy69KesWa62gVIz492Bk5EKeQPLnN6Z7Ab2gZXGwVSCQmMe097tZtr3ZI/nCFBMY7AQCihiIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873716; c=relaxed/simple;
	bh=o6jX84yg2Ct8H9sQ7gKIiIsXGPNUyXKJy8PFaF9vsd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgPR5VQjglicDL0vv0yEfxWlirTm0UjygPxiUZaMJKC+mpEWVUrWDbXEX0rLQR66RzsGNJutNU0riGubAGU9PHuZaMrlY9cRg01He/L6zBdKcBq3FoDgUKtUjbZSGD9EG1L7fVWTUCHWsqiqSucA8hglBCZzo+9AM2BEOwOhJ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhZF251E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yq/AQWoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhZF251E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yq/AQWoJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFe26C664048
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=; b=hhZF251EuVOLvaJo
	ap2nH7ljGJ7/aPEUUqeF3tJwJ9TNMc0zovy6yicrRsOwJftAsSKMP0HsiUkOt2WT
	41VcMgJv3qXHmt9TJKiIdiE7U8i6jbo1CVy0tbq5wIOzgJxzU9evclCJddg5x2x2
	GLTyI+GVfcUhdDPzoRfClJsQBpW3Du6F9U4vgno2HrOWMXKvMZPq7x/PgbUt4oAk
	fqL2K5ijScfJdQF+nw2YuQ88Fb95QsWAgUBBLY/y8nqaZbxPKRIX+TR/B+auuXxr
	QvOjFd99ti3k6SZAYqBsu8KOczKJ9bzpaZIivAPKkKOqifUEqaH/nVTsnr7fVyee
	Kfd+3w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsgqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:01:52 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-46fec31defdso9204114b6e.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873712; x=1777478512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=;
        b=Yq/AQWoJyN0zVqw3v8DuYcueb5HTvSPbPt3lWVuh61FqqU17OcKEwtxXZr5fOVFdXV
         E6E3tPdkwaks0fPR2gziYBIQnArQ7Fvsq6mQ/IkZlg8M3y2TGSICWSFBQpkHPcDb79WP
         lXKr9bnoKr4Ev9Wuj3RxIlCPJ8l4LOoYMl+3H71toysB1RnBuPtGnqGODmWK7/YlCMGn
         Aw4bRoUkZ4TBpKwOA8A8Iqq9/XhUMC0LBxeZWEW5zb2Z7vZ7uDPfRNCVOOhOFOWLChoF
         gxze0xqLOR0I9a3DQxwPi1Kbb2Lm0Mm5rdh/owSUwXAHmxFcO/XVVD4Y58RDNsKJxfjY
         gKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873712; x=1777478512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=;
        b=DqvsLjxVpLh43NalwQZ5al2ZIBmf2TWQtaZ3zQveu8FeOxw452luw63jrey4ia8MhO
         D4OVkn2lX7knDdak3FJ/r70fjCAtQgJ/agltXdziYeAu1Wm9ZtxWaveEOKxqvRJN7wfb
         4uYkJwlYVtO0mljBTNOt9AsEmYcqeBRGI17dj9GeGSVq2R5toRADZCbUzLK26+zpeBoC
         U15TooJOC+Z2uoYwEcf1deFecwjNPl0+lNM29uzE/o7WbMr9Lb89ubzjhg5qczBqMXNH
         8/uj9cIwSxG9wV3MInrTLV3L7m08bSvKFpqomSS2DR0Cltf1q3ny9RMy1wl+I378ATIS
         oTPw==
X-Forwarded-Encrypted: i=1; AFNElJ/mlJ4lweLp4hJPLK1vIhIbkLNh+x9tJyUIX/GpAzXh2bQtM2i5qsr9KFaVm45is6rHrpQtisrFt8ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTovlSmPzoehDZQHea62A6uEWoWm2ZsHrUFdTWWetJ+CwY4zg
	V7LrxobtTyzJvN7FcowQF0P1BT3VWvzbNyhf8nYPjKKA2u9eLj9gdjVx3dDw1ZOZqCARZys+TA3
	BWQNdlwei3E0DsRQysLJc9MssJWfiPi6PYtZAak1AvoPbWWWefu2D/trhI/kp7KS7
X-Gm-Gg: AeBDievFZE7oKsZPZd5Pum3PxEnOUAzvoiaQOQhfXWUsbG0gbQ8tSYwSV84FcKCJncI
	WI3FPoJakahRh2sCi7ZKPa6N8UPlxTT9AOzQVRSYyXWL7UmaU1YZhCl/5jiyKT7ZOVNATjE5hz5
	PwB32alqgrYe3ZIIk/BdSSsWlBPaLg1/SGdgc6NYpXrxvMknRaRG8N/BuikqbM8i8V9V0HG/CAd
	/PYePYW/dv/oWw2lGSvlGn71P3aF+J6CezBUl4DPw9pKzXywSyJ/sEZZtATiKxC8ni2zWshwcUt
	tSzeCEpC09HjN1Qc1+6TIwJ19o1QmokGzSQXJzOfAXcLGU7dEuBWiT8uX1gJLf+Vj/CR6RnyLaZ
	5/JPrnitG4mb1lErSDpIzbEeJ11DjV/J3erSBFN0xzIZf6Ea6MxlrSWZPCqWPXV9SFwehazeb0r
	6/mBZevyUvNq3kUn4Na4I=
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id 5614622812f47-479e826d1c3mr3812370b6e.5.1776873711969;
        Wed, 22 Apr 2026 09:01:51 -0700 (PDT)
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id 5614622812f47-479e826d1c3mr3812253b6e.5.1776873710861;
        Wed, 22 Apr 2026 09:01:50 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c68asm143199855e9.3.2026.04.22.09.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 09:01:49 -0700 (PDT)
Message-ID: <41514250-3da6-41c2-8a33-41a50c0b3602@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:01:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] dt-bindings: thermal: cooling-devices: Update
 support for 3 cells cooling device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, gaurav.kohli@oss.qualcomm.com,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
 <20260419182203.4083985-15-daniel.lezcano@oss.qualcomm.com>
 <20260422-calm-badger-of-courtesy-809761@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260422-calm-badger-of-courtesy-809761@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: inFyju86aHnnGnXL9SD4r5-TGqptz8yq
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8f0f0 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sgfxO1epDbPhlZI4IqgA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NSBTYWx0ZWRfX/vCDAZkGZbGT
 AnTKXkEhf2EqKuwEv20KfXP3IEnlt3VmxRmDfCCiWrd2wl6++JqNyPTospF+HQO2eXkU2VkWkwG
 CV1IxOCB+nxYlwOxwq4hy1GAmHcRt8f/KZbmewgdlc8/JZCJ3RCc1j94J0ORePTYIoiSClZOXC5
 fdZcE84F3nSAytG6ioZ17Gs1qZn2AkEZnghZHP93zPcvXyKhn1xDeZQY3HQFLUG1Dt5q3kBnZXc
 wRy8/ICY56QoE2nLI5MRl3fbTwahNfw8aCLhG2B4ic3THvGqNkzh/bqidlrRdhNqB/wfPRO6yPN
 JZPRLmP7q4xxCo2PvJmpn4y89eqqgwcVuQSPMgIvGldYeRLW0Zkvp7y3L4sFokRLXVDP8lJQvjL
 xJGxsWfwExVVgZpwJ8RWPFMyl4Kzqg==
X-Proofpoint-GUID: inFyju86aHnnGnXL9SD4r5-TGqptz8yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2604220155

On 4/22/26 09:31, Krzysztof Kozlowski wrote:
> On Sun, Apr 19, 2026 at 08:21:58PM +0200, Daniel Lezcano wrote:
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> index b9022f1613d8..28f5818f1e60 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> @@ -44,10 +44,14 @@ select: true
>>   properties:
>>     "#cooling-cells":
>>       description:
>> -      Must be 2, in order to specify minimum and maximum cooling state used in
>> +      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
>>         the cooling-maps reference. The first cell is the minimum cooling state
>>         and the second cell is the maximum cooling state requested.
>> -    const: 2
>> +      If 3, the first cell specifies the thermal mitigation device specifier
>> +      index for devices that support multiple thermal mitigation mechanisms.
>> +      The two other cells are respectively the minimum cooling state and the
>> +      maximum cooling state.
>> +    enum: [2, 3]
> 
> In the same commit you need to narrow
> Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> so it will keep value of '2' (const: 2, like all other bindings).

Ah yes, thanks !
