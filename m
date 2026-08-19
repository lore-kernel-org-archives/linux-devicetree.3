Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83593AD530
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157487; cv=none; b=Vs65qAdFcoNc87cr4/Rf/lJptqaqCNskpUsEK1/oG56AVbzOimTKk2LPxaa0LtyzN+AW7iqeTeRqOe++9B0gyK8aXRP0KjYw4IVbtcTSQe/cwdjDxL7aN4CCjmhOjJDSLmna4d4P1IFgxL2nbvPp+cwXTf4/2L9d8iBTFoKoojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157487; c=relaxed/simple;
	bh=EmLErBTq9+rzqL6YVJ6SdkzY3A9hUBgqH6hA5arzz6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNs2NZtHg8wtdec+Ab6RnaI8xooqMstB4ulyudNmqQ2qZOdYJMQIpWPWZSaNmqHJIiOg3NwyLRUBL3JYE6QV43c6+Na5UvVyHTwvCq8McRKykjk4WiGbnPKOxv7bdYL3I2apFzw79hIye8obh6JDwiG3SfT2WT86/cNdyYwpp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ3dJPYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVP2hmAZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ3dJPYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVP2hmAZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2BWN3606096
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmNcnWfZ0ZUBosTzLdIv2T2HsA9or8p9Db+J0omcKOc=; b=AQ3dJPYzINBKptip
	wU6VEvK13IjnKSQrPvn57VLICTBgqH54t8rSuJqxpyXXiLIvi/wU5NiQrfJeHOo4
	jJuoi4hlYWxKvhb35Vv7PVHM53851s9j3eL7MRZZPT5ab29IMivIZdFfeAzCWSXd
	5ZeMBJnsF3XZkjUuJi3OjlGlthQQRvF998wqMjQChU97ojwF3hBlzeRlAr22Mg9Y
	NLuKQBeZVabhnwAJQ3HNmxsxMBTg9xe4oifkjHs75SOmXvyb0hgdnm8Rrugq7+7S
	Sl73Fby3TTU183J1QmE2u1RAoKcjPWH6uy4/bm5V50UZqDCjenJLE9vSJsk1DDE8
	wc7uOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esargm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:38:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so1954101cf.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157484; x=1787762284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmNcnWfZ0ZUBosTzLdIv2T2HsA9or8p9Db+J0omcKOc=;
        b=DVP2hmAZ3n3d98TcWoTeA8vtgwZxdF9a2nEVihfJprSPq5mSJSaoM5xIF4HLyYJpDQ
         7++KmF0E4FycDnl4W9wWJkcmVOqD+JjSrB1WrHdaF/O66oeCT7iUTC2qwyAgSp814/Ow
         NctDtj7c2zgSXqCGNpXU+EN2hymkr1WiDzk1MHJV3LwsvWeARe+uWJ6ehVYX2FiFS9WG
         ct2V6Iga6kI5pTJGXecrx0SJcKBge3QiDY31tPOqkZJ8Dp85Hx5bPw4Gp8OYJA+EjM53
         6vDITwyM0m0582y7n+uW+Bo13FpdxYWlp4Vpu86UZKL2beEAKHVe5In996rGk/H/f3PT
         poUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157484; x=1787762284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmNcnWfZ0ZUBosTzLdIv2T2HsA9or8p9Db+J0omcKOc=;
        b=Xzd+9YVD7Q0VXKtF1OH/J7Ruks1qvNHmDX2Fniuor5eJIf8jWOP35mxuj2NUXk5npm
         AqBYQV9HomHWcDrWKqUqtgCe8brqeXb/MIN8aRzdG15P60dCePXi/5B5YiHF5Nc20L+2
         acMQyg2cHG6/jDyyNcTOvt2XSVxdv8BXNSNYFGV+P6p94zbMonp11M8b/Nc5h99l4auE
         JIZe9rqBtakOa7EZA+7GAHy1ITluIPI+JqDZUDgYTkYJzyrubqk2tllJlXv/wqg48NCt
         xIVtnCNJg4QD4oZUKBhnnSwxB7M6dwVhd9+70ZDw91NG9cb/mj48l8sfpOBKQmT7h3wX
         EGoA==
X-Forwarded-Encrypted: i=1; AHgh+RoQVVvhpkA3FhI+lOPWWiaQa3Et+ZjWCNC0kfIaj1dMOZQMYZpzdxjIp4CnbEBsYObIDK2MWHnN31t3@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsojI62EgrlBv7WOG/Q9cWOM663zdyIFw1v6fZwWvs8ie3ZVr
	4w4HZ+C68Kf+9jsD+HE+4ZmBaMjLdhesaRh0ZoI2lO/PxVn49RquGYiU11ldd6Jd3LNWOBQPN8S
	oFUaqFCk6OFJY85+8kNV944lQ+ZUiJRbedn3ATbtnfr7byoo9AWnTzRjjtSKdbXGf
X-Gm-Gg: AR+sD10EyTGIkKKoSi2zsSAC5WSQOoObvdygUIZuOR1flaNbfvH3PLpn8Y87miPwzni
	ZY+MqgSWKexSCLVvP30x1ac7rEgrIYN6diIgjVBR2Io8vaiLxuQ0ce4ZmBrsMQf5KiFiRZK3YJy
	LNDu/0NbBL9CM7+JSmlKZMJHezZ/Fr5Jci14Z/OGg7C5iPdmVT9en++zbt8m8FK/uX+XwGOGBp8
	3mQR57dFxXPZnWLvu5V024r9rY2dQGdrPec6ZON+jdU/q1Ad9wCN/4pRBOKaQDsOY5kZzvGEI5O
	S0Xqbz+O7u3MkPvO2f80yAxknD/WT+F7d1nazSCKgZfN5drvLA3r1U0eGaYy92pCzkFUDe9eSsK
	bxsGIqjB+yDQlGVr7kMYrtwRx
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr43639151cf.3.1787157483913;
        Wed, 19 Aug 2026 09:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr43638641cf.3.1787157483343;
        Wed, 19 Aug 2026 09:38:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c5a0764sm100952066b.30.2026.08.19.09.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:38:02 -0700 (PDT)
Message-ID: <1146dacb-ca5d-4ee6-b7df-e731bbcb56fc@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:38:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
 <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
 <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
 <282e3d1a-17d3-4fe6-8435-ac6241f69eb8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <282e3d1a-17d3-4fe6-8435-ac6241f69eb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyOSBTYWx0ZWRfX5ZrpCbv6MVCA
 Byj59gVGq0fUuIvbMKDjzdat9Fmr0vQl17HoSnYszgq/lpeU5RannkNos5vY8Em1rEHEn2T2YwM
 b7UOtg2J8YlVWZu/E7BCc73dUOnVlqc=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85dbec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=-T8yr1nOjY5rGLoC8-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -tg2IoNkFXDoad8oKlX8CoZRzOrB3Dpr
X-Proofpoint-GUID: -tg2IoNkFXDoad8oKlX8CoZRzOrB3Dpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyOSBTYWx0ZWRfXzNKwTGr6L+KG
 VTTFcUJmj8neAAwy0qi7IEU2/i7gRWd85LzUdtRH9we433jEs6E0BXpnJMFFUpfFd5IYPyab07h
 nRoQyWcS1kw1sny3yUMu6QMBLNoaoi0lXn9CLddPDzH49yMCA8i2hgrZ/pBNWMzlpChJ+6YGMgS
 7LO6lCkYoHIHl5r+KEToi5COUBhdMnI8tuU5KKGa/m9MX4wrMFSvawj60z92OsoIU2SwIvj98Ij
 I8qf36IojrXgitvITZ45opIpvYS7SOUmiIOL3vshHO31oNhjUTW+dJorNeJKchHfq7Db1Ia1sFA
 hSoSDb88nk7v5VYtPdKbyPZKw+XF42rkln4YdPXTMGTD1A9e3wOFQCCeSevcT2x4w2o68qUYXc6
 7slGcw851CcKQA+13rkn9v/Q2329gXruk/3SPFOJZ/dSR70sybm6Po1aTw5ZreRlTw4TlbOhmcs
 jf5iGq/o+OsxoeOcGEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190129

On 7/31/26 7:55 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 10:41 PM, Konrad Dybcio wrote:
>> On 7/29/26 2:13 PM, Anvesh Jain P wrote:
>>>
>>>
>>> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>>> driver averages to compute the SoC junction temperature reported to
>>>>> the EC for fan control.
>>
>> [...]
>>
>>>>> +  qcom,tsens:
>>>>> +    description:
>>>>> +      List of tsens providers and, for each, the number of leading sensor
>>>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>>>> +      junction temperature reported to the EC for fan control. Only
>>>>> +      applicable for Hamoa based devices.
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>> +    items:
>>>>> +      items:
>>>>> +        - description: phandle to a tsens thermal-sensor provider
>>>>> +        - description: number of leading sensor IDs on that provider to average
>>>>
>>>> Why don't we want to look at all of the TSENS sensors?
>>>>
>>>> Konrad
>>>
>>> Each tsens provider has more physical sensors (16) than the count used
>>> here. The leading N we take exactly matches the number of sensors
>>> already wired to board thermal-zones for other purposes (CPU clusters,
>>> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
>>> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
>>> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
>>> this platform, so there's no per-purpose reading to include in the SoC
>>> Tj average.
>>
>> What you said is true
>>
>> It also doesn't answer the question why that isn't the case
>>
>> Konrad
> 
> What I meant is, the driver looks up a thermal zone for each sensor id,
> and skips the ones that don't have a zone in DT. Sensor ids past 11/15
> on this board don't have a zone assigned, so there's nothing to read there.

You can keep repeating what you said and I can keep repeating you're not
answering the question "why do we only choose to read the data from
certain sensors and ignore others"

Konrad
