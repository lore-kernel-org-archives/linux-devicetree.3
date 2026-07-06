Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232B20E6E2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344673; cv=none; b=X1MWdqUVBkaccBuofkbBtcgFOMMHqN376y+1+m7FXwdywoq6QuRlIu5IZialkibkAV74tHFtC4lP9gS6/m98F0Il/detsHmElq9NIAbB3iLtuYRhOTBVYf2kCZ/5c4w0Df9pxNmVTwO2EHEDxv4kaeKkcbsl+uxm73g46m6PmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344673; c=relaxed/simple;
	bh=3J+J5O/4aydjQptyZH0/DPttB/l6kc/yHKXP9RukXlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2mYD5szI2Y6SLifKqOqBDaq6sHK22ab0U87QJrrZyKV+F1ZroTkW1ZTQ9vDn6nCfVNGQbOM7djF/28/wFPqSuqaTSR+2oWuIzNe0J6QA9YT1bAJrAO8nI2bFf1XNZjt2DVWYgyHOWxYtQy3ODzUM2sD3NhqBauZv5/zmH13ENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0VeMtE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4Du46Y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0VeMtE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4Du46Y/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCWx238119
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=; b=L0VeMtE1JN+s48La
	4o6PDEyK/LmlF6HZ8rBRihIabk4KRNkvT+9wuDidxUkMypEtYprrYX6MltvEPJpi
	jOubmtNU0vP8tue1PIE3YbGU1pAf2xB1/+z6M8A8AO/26NkusyO8VNNTbfOEMIHi
	jc3Ijc2673iFjVul/aZykQtzZNmZZ4Ihuv2+qX07AS4nVDGAUqPjrMZcRHPCkdrV
	16kif6m/A2+pIgyoSEbKVu289ZgfTNvJUkPygiUxXw4ETFH2hMutI9yFmERmo0r3
	86GBi8dahSEg1Yi5M51fPeXDemK8SjU0Ljahot3REjchkOH2CHqwtGtwqnFPRleT
	9ggoLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t896p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:31:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso30652071cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344671; x=1783949471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=;
        b=M4Du46Y/nhSypo7g9x5S/Mgmwgxj9lq0zwZkfiPqlkZ3GMwV473sW2m3LYFe4c3JhL
         +Kb6GXoZOT4uMti6KdDyWRnLQyOJJ48RLgxCCzTXODJ/+FPYrInh4oQBakz5fohqoazP
         Wb84vXsIZ+knsSszQINSaA4MEPsUd45t2k0ZbJpOE7yCYEtQArk8diKOeLqkvTv4F8UK
         c+EoJjBu3XyfxhARUPtObeodLGVnw+Z0YfbHQgjl+//uHLK2FMfDYyuRrbSgmUXINUZn
         flxkd0nmhCy4mpZrb0ZMy4vJwZ9a7sWmtBiOvX6cQXAmDgMkm+8pCJ4aXsZLDl/gOB16
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344671; x=1783949471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=;
        b=iyXcqoSI784T8RT0KD4uhVJLuc4ZyaxUAO8cnAF/ztI/ATkN2KjsdXdAJo1Kti4Nz9
         JRkQJjGe94FPjYumbEytnzdC5ZyO/CE/En8f9EpoSXilvPWKpiMPX4+6zM0PkXtFzBwC
         mSsvYtJUKFnQ2i50ZLlDUM8jfHWIZ9G4kCSVJFXlvZwyFbSIIROUzrA+3KRbWjIqE2pt
         FgAgrPlcIHdDE+c36CFas/39W/5MdYaFISIrg73Y2tSTxBPUgPKG9xHvONhBXRl7mk+R
         IYHSL0N179/7ozs+rQCgwzg0dFWBprCTKPjiVS4LXZeJskZwWAbmry10W4DGlm+UR8eo
         KeRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPM3R/NIHrx7zj/F/azWerzZf4bMFIYRUK4WhlXG9X4PylJW6chdhd6Srqj1A9oFpTofgsCHCsyLe3@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYAgYDOOHxM5ENYPGbxVPWbiuCFVG2MduojQbFr9BwNZrgYXV
	1ZM4U0h+YsrLc5Ayq9HgJNM7sTUhkDES2StEbvtUWPvQD7GQMJDaNdGQK7E7N9T92LPezk+WSSw
	B0Rl8XlRJInp8kF72j+s+54PpEcxRlBJUdVDUlmMrymtV61j8vfKaqU7ZyEI9WmYI
X-Gm-Gg: AfdE7cmQ+kkXVLg2Rr5UPzYAPFUD/5iroOSYzwmdoNFJAalD6FUkXfnEW2MziDHSt39
	SO5FTzfJ9frnKXjk8iHlrlO96FJW15ZWT6nrSXSC4IwcFoKWe6Tj9fr8JSfwpyW3O81K3qT0vZG
	0YKkQLXthygoKGo969nyqEjVn1KyYUL54W+uHdYGSqbnj6Rmab+/6qw0u/qS44TiwRHpdmt7ax/
	1WHrzwVJx/HEA9zw0hxTqs0SYmm09n8CUl3aqpSdlY6mojEvr0p+CRq3wP2o5hhjEO79GS8aOS5
	4VH/UpGl9M52aatofIz4HfJyJZEwQPqSv+oPNuLLmRgpeP+v4ZMXgIAahZlWnrAxmSizAbUMOJY
	hBi6IU9qS3D3e2T7y3+4QckYtdMBxy9jJU2T4zR6opz4x1+JEdH3Ro++RZRXK6yr4fKZwXu4d
X-Received: by 2002:ac8:5942:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-51c74801553mr5553041cf.17.1783344670536;
        Mon, 06 Jul 2026 06:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5942:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-51c74801553mr5552221cf.17.1783344669938;
        Mon, 06 Jul 2026 06:31:09 -0700 (PDT)
Received: from [10.38.242.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d727sm96867101cf.15.2026.07.06.06.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:31:09 -0700 (PDT)
Message-ID: <b702c745-1b5d-4b94-b2c6-46e79a427768@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 21:31:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
 <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXynczNsGW3UQ8
 7lZgja4xklVdo/IH+dqkb0MKJJyVyPHLl4ZgGSaBQp+QhQqHIl/5EBIvsg7cxcW0lkiO426tGxH
 h/w1ptGtPH4UjbbQbtXHFOZHv4DjBps=
X-Proofpoint-GUID: yUjPsgo7I4KOnuYQB4vGD7RMmMQS49J7
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bae1f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=d2Zw2t_Y-wEgfmB-ChUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yUjPsgo7I4KOnuYQB4vGD7RMmMQS49J7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXwNXIG8ZVBz2o
 /BKndhSPonAtuqAV5DCl4es3QE9zbfmV2lu4n0JSIZpbxysOoikxgqt9K15RAaSIWF9MkAZV+Ax
 T9sLL6pccozD8yEao+y/+emilFHSxCsBzKdVaYqMu0FF4lK2ilAqmAnG/T6yjxzQXfX6uqPonoh
 Vjj4eNJwYR9TglXT8jVpT+kXrqpdYb7Nfr6VPxxsGzfWGJBO2mhTsLp10782xFDNhbAvVQy1Kgg
 P0taI15RRoS/26e8jtIoQP8uz8LhmiYNI2B9o3Bcj7n2FTovH6GR9d23zO3QM93xn3txv6+NQdW
 kb3OhbeMxfoKdP2462x2kHejEuT9NKaeG/b41csBFWjPTLO4UPCUiCgocsr7gNpzr0Tyk/zbm1S
 k4uktM4X3E1PwEGa8KB73R4iamT+Qow5yNwo0HFJWEcoqwjo2LhaEmuwMJkVuTicDrxpTFPIJWB
 wFV158XUzkVuC4yi1Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137

Hi Vladimir,

On 7/2/2026 8:24 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng,
> 
> thank you for the updates!
> 
> On 7/2/26 13:52, Wenmeng Liu wrote:
>> The OmniVision OG0VA1B is a monochrome image sensor closely related to
>> the already supported OG0VE1B. It shares the same SCCB control interface,
>> power supplies, clock and MIPI D-PHY description, but differs in its
>> chip ID, register programming and output format.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> ovti,og0ve1b.yaml
>> index 
>> bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>> @@ -21,7 +21,9 @@ allOf:
>>   properties:
>>     compatible:
>> -    const: ovti,og0ve1b
>> +    enum:
>> +      - ovti,og0va1b
>> +      - ovti,og0ve1b
>>     reg:
>>       maxItems: 1
>>
> 
> Since it becomes a shared dt documentation, it will be accepted to get
> a generalised description section also, in any case:
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

Thanks for your review, will change description in next version.

Best regards,
Wenmeng
