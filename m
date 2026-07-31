Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559735E93E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477340; cv=none; b=Lo57dzVbGgMFQA5HWNEoaXwjKnlkYXsIqMJ3xfQIHK32M2o/o7dVpAtO1xxih9u975VhfTFOxOxvvPRCSOHrdb9OsWvdrFXd5hwME7WAhMuDxAgOCSIckdvyGCV/FCVXpkF/X8v8oi/B1HjwKPVuGK7nrk8tCM9ggo5QGFWXDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477340; c=relaxed/simple;
	bh=vxXDRmx2AtjSWDCtlwLZzTO8raRnzIhbccq6vz2CYq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnykqPIScnC+Lp72RfDNZh1bMAlixfQYYk9XwfUEbZgnhO+YKsjVg4aV0NraryDC0bSot1CMAw+vOfY00O6xZ0JcM9yBNiZfca9OG1UioR6moy78LpWpcSJWlWU3Mj4mjpphIe3tQeq4Zzjdq3Y8VImIS7odPLkT7pbF8jpssrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhCWAxLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc81PFcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhCWAxLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc81PFcg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5tRwh3130401
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=; b=VhCWAxLuke4ds96S
	VZzZs4HwIIHYIy0kQdGGJRYhg36iXhfgdqRg7oeGFLjcB6yGK+Pm0Py0JEQkOOsa
	Y8SSkZptD1RTqDWO1lE4/VAfXF5uFn1GEiLPsyFnXopW0p3a6LqR1LKbbwx7y7BK
	ESXpDU6jpZZVAL9vEl+7Oqny+mzZVunaBVqclZPQbC6sRnbNgDUCZji7AcCdi6Vx
	X9h8t9LyKbgCgsjpulxeOkQo3N1pm2Y63drtuq7VFOdZSa3zRs6+9OdneGFu+1px
	2BNQvbsT/t+eS2Q/4DYFUHVrEN8q5Gd8aAgDELiUR0+x0DY4rRpLKhK6kl45fL6/
	PZ/Kpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp018015-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:55:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso8766635ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477337; x=1786082137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=;
        b=Dc81PFcgU+03pB8JIYsaz3ZmPAIw+MB5tLPoc7lN26NAAZ3c7ApcCbs68BR0Zil5Q0
         Vaf9BLzl/YIbo0QU1wNhUiDqeU2RUWf0eggzOPsHHV5H9e4NAZbMC9fgXVwXAT7MPEP3
         5qaf36InBN9bL/HMlKuVQKA9ZSAIAgVzsAwDmOutAN7oHUH/Ktp8es+vmMK9KjVc9xpV
         IYO+k5JpTvThWbCEMVuwxXqYYeamqzA7kgCZNJxmM9QEK97RKx2WlT2DgoJmVWDJq4pe
         8Xz6ItizyG99QD0/Whdr0jxJ8r0PeJOZhcKulDU8CTSPF4hXkgkGhRBjNqUyPCLuednu
         h0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477337; x=1786082137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=;
        b=ByI2HNwKf7aHlydX+aa618VuOdSN11hJCotaltzMeRPG453n7baQXVUHagDW8njqpY
         v14NclH4ODPtuJQh9Nr5xIFmIihrI8hiXtpwL5eOFnWyFcuP0/cV7T+S/J/s8xbhoOQv
         kUszNlEkxIZH/+5G7AjSp5X1pwDrB04pFpT8Hcl8lSMd7+YF5GJo3j/G8EuAoMAHIXuO
         NrUc1MJu+MT1HzNPSue5O/cWLQU6l85ZYq8GjXG/+c52ru3K+WOR+u/Ggqcj28UktzQl
         /QKFXNFcEajlAN4lhnuJ1++DbaCVIbMtJGOId+l4Me9W0cKHKHX09guBY+5K8WuWyF4m
         wBkw==
X-Forwarded-Encrypted: i=1; AHgh+RqoBy8JSjMM6jubhQq+DD/1fWiu3V/EOHQb5CeWgQlE3h58ElZOi+luXH7rg3HjGPXLtKze0qgzjLgq@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCEMNRyDxR0zSuMU3xLVhSZd+c2VI3fvlqVnYEnLreAYd94kJ
	vdIo87vhe2GfyzesYrKCr6vqgu024cnHT4YRcs/3iCPWjVfOui3GA0q6kzJ6LqPk8u9dK1t+8Hr
	CIoku9wb7sFzaaVidhL4TDzb0xoNb3u1/l+jMckjHsVNla1au7rvv1p8bewnECzOh
X-Gm-Gg: AR+sD11x7iLLHSkhdMvwvCEbWTGniNHF0DaU9y8nOBSxj9DaT5ytWYPHP99+j22bdzE
	uwLYky+XpkwPAuYALvez+uB7AI8/mly6fQ2w4ZrVemfA1TfWzNtgeOhs9tKEFq15d1nrrwXh6TS
	ZAIyZmNJnPcgSHBOBOCaE3Vc/nzmKHh1daTQtV2PVNp4Tj+ZE9VBhkPJvkrOFmiqrNAxLMF3TiV
	isesXVVX84CI+S+kjls/zBdWdEJ5wXhv2oBrmKkmfaGApfm87mIZw0qRPzASQYlZCz7d+4rwbfu
	jZ+I3oPlS67cxyL+m1jAQPjWTms7zl6F5psdLNV5QpepTt17CpxZgAk9CapOm+SG2WyLGBcuIfE
	H9FZbm0lV5OYJ6kmAMXGme1PBK7qH0FxLbbqQ0aTVA4gW5o7xoPtB7MKwlT4k4scp2IMF2KdogQ
	neZyYEYXwBLi8x6w==
X-Received: by 2002:a17:902:f552:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2d046dae6f7mr8191095ad.15.1785477336955;
        Thu, 30 Jul 2026 22:55:36 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2d046dae6f7mr8190825ad.15.1785477336536;
        Thu, 30 Jul 2026 22:55:36 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae9874fsm624985ad.32.2026.07.30.22.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:55:35 -0700 (PDT)
Message-ID: <282e3d1a-17d3-4fe6-8435-ac6241f69eb8@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:25:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX6LryhWWSbX9r
 6RjV2JoF787/RUgsDBM4lMFOTNXaEzYBtnLya6b6o1B+AEi6KyME5eJJuJym2zd66NOY2qNDNry
 wDz8zRF7kSbN0F+GPUv2u4I7YK6b3s8=
X-Authority-Analysis: v=2.4 cv=Q/DiJY2a c=1 sm=1 tr=0 ts=6a6c38d9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KABvarx3PlEzr7JmBnoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfXx0RbsjwNeZvE
 im21iiEYyuABfmsaRWWSU6uyE2nk9XismfjaDe+NUrfLeZ46pCnPRCS4H4nYWvDxhod9NagIr1X
 etjmqp0QFAneX9VfLHJTpdPQGRLQPpBmhwh7/+9Vbrbh3UlQMcMKvC6RXtK2Wuyw6pf5ZRrFCND
 wV+nthG+ZtdkHo/wbp7iQ63EnRCDIpcbxLeCw+8rlo22Hw9ihvI0XsFdx0vlKko+MWv7f/jOrow
 QV24+p4Nwzui+F4kuE3ou33IVwayAjrQoD2IaHCtscTnHglrK5sWDasdAglUwOPwNMOy399pkem
 WNJabdMEOW/KVW/Iok/PJrkz9adoEAQo8SLe/lEGaSga85Qb5QT3p3sOZ+OzGXelYyoiBgt2svT
 BVIm8KsrdXXTFTsvl6LLooyFzMuIPvFbupJzw5Xrxid9eFnhOKm3wGq34hVv2Rmc1gwnNKlfB8e
 AjzmwKUXcY5B7xotcXg==
X-Proofpoint-GUID: cJwH2yyAai2bro8nzzJAeEYFZsHfUdkH
X-Proofpoint-ORIG-GUID: cJwH2yyAai2bro8nzzJAeEYFZsHfUdkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038



On 7/30/2026 10:41 PM, Konrad Dybcio wrote:
> On 7/29/26 2:13 PM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>> driver averages to compute the SoC junction temperature reported to
>>>> the EC for fan control.
> 
> [...]
> 
>>>> +  qcom,tsens:
>>>> +    description:
>>>> +      List of tsens providers and, for each, the number of leading sensor
>>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>>> +      junction temperature reported to the EC for fan control. Only
>>>> +      applicable for Hamoa based devices.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +    items:
>>>> +      items:
>>>> +        - description: phandle to a tsens thermal-sensor provider
>>>> +        - description: number of leading sensor IDs on that provider to average
>>>
>>> Why don't we want to look at all of the TSENS sensors?
>>>
>>> Konrad
>>
>> Each tsens provider has more physical sensors (16) than the count used
>> here. The leading N we take exactly matches the number of sensors
>> already wired to board thermal-zones for other purposes (CPU clusters,
>> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
>> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
>> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
>> this platform, so there's no per-purpose reading to include in the SoC
>> Tj average.
> 
> What you said is true
> 
> It also doesn't answer the question why that isn't the case
> 
> Konrad

What I meant is, the driver looks up a thermal zone for each sensor id,
and skips the ones that don't have a zone in DT. Sensor ids past 11/15
on this board don't have a zone assigned, so there's nothing to read there.

-- 
Best Regards,
Anvesh

