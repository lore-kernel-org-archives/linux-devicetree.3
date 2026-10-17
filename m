Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B203B9608
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224642; cv=none; b=JF9jSUyGsrC5nSCWtZQB186hZC/kEeu03L7yPccJRxyFCAXLOmcDT4VOEL1AUxJED75PWI9lVneLQd+PDVwXf3Y2Ge8lYWCE15zJfKUPC4tJSZH9aIlOw63EODfCU1Al5wDvSP1gmMKFFEwkVwcNkg7pBz/R3O44aTRk9u2UfE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224642; c=relaxed/simple;
	bh=LSrld5Agd/ciynuf9D4CLiDK+KowNdcf24U7fZm3QB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvPWcWxL9isqH59D0+IlpPyzkY2dMUzT586FP4h3kBuIqDMCoG1q6FXxoN4gnO2a5BRc0yNyIeSJJHLgLkr8qJeS/ep5fFDj5x4pOdtBrtBmsX++2cNzGHHCee6+NoZR1gziW5/ZllgND5pRgU7sNkxWw7PTjRmxo1G1V9Z8Obc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+0tPp+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I72Mf0qh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+0tPp+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I72Mf0qh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oQKj901003
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=; b=i+0tPp+hTTOZjkK5
	MAEL+J/w4c/vFLYwXZ+MOQLBq6MqQ4Cqk16foWDHZXW5eUduVCUaeSBesLbtuz9K
	F3d7QyjD1q2yIh3qg3J4cLWN1xKWNwMAyoSFEdMuUZvOhzaVl1q6FsQBx2ANjLQn
	OcNIYhnBfUvS2lcGzYNTN7LmZ65IqgyKSRXbSp5HH3eE9+zCwBgB3C2PK/QWAd4U
	zmbcW0sxxd9/uCmIdcbAVgMxZhO7c/gUZTQQJyUMw4dQJEN/FwtZ0W+/Pn/ah71L
	pJSODgci1nVNEUDBycUbVO3VKppWzBxXkxaeZ7AjLTXMs1rI04KnmvNqZOS9/uln
	irh8BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxggyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:10:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso326752985a.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792224640; x=1792829440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=;
        b=I72Mf0qhxOI6UlSPqs9AraVSzY+STJ2uq8ZA1/4ejxW4xDgJveyN+JWHnS28OtAkGi
         oY8tQ+ClzbJki6Z//sXUcCHk5IxvWQiCHVq9417FCGvopZdK9ipaA3+0Rb1F2jtLO63t
         5HplF5w/f1LjIUViSWK4nBYLtVV3sc1IabCl5DxDIpGGAsINM+hEohXH/Hj79Nq9tTAZ
         EBa/YVaMJ+BJLSYeh/P+kAKtk7hfaOd5vNOHj8rYRQZ744ecY7sLm5ndJHYekKd2lP7O
         7Hr/EJI8JAyQfzfrRSCKu03tllzSkUBRyjWNqKevoQSzWSn/sJebHoql62JIHMDYGPH4
         oVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224640; x=1792829440;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/ri079eO4FY+csoHfqAMZtagT4V8asc/A6pd2kzhyw=;
        b=bqvzxBMSQ64zX1mqh3cBZ8kBCDrLv3L52rFqUEPIiKDtGdCFvoKqKXIqvEP8w6F22Q
         qSIMGk+B7A0bDaAFh8W12JnkwZhfuUjoMmQ0X4IGH0e4GpLXSRaa9jv4ouS/zveTP479
         czgU2/3Igz3WxuYR4QV58VL7Sre0vwbC6zXwaQYtpN3HB+SEDTFvTzYGi8yd4n7eY2Lz
         ip/6m81/0hWB2ziqdDbN9hU3XgpnLN/1oAVyl+CLihQDxCOAqn6PFmSozIUKhMYXo/w9
         ESAg+zJE86Q7Yis+iVhq7pKgNPfGJCGGdwAP3uXqBzyoxwly+yUHG9y3TqzUSRPd34Gj
         a+Fg==
X-Forwarded-Encrypted: i=1; AKwUvBydHpx1Lv70ZCtY5xAq47S2FAdrLl4nhCVSCcvchvwKJJpZiGESi51cjmJyVPFW84zjYgFEeSclXjNw@vger.kernel.org
X-Gm-Message-State: AFq9FYJZe2QxHVi3fKfJ9FgghkQQ3rzmSX79jVRW+22s9WMSrdISybT9
	I/szwgpngOkggC3X8SlzoCAC7wQEV93NqAZo7kK85If3KLg+SsZYSi88Z4unF6WaWISz6a7Q6ca
	YA92lSk042s3Q9U5+l2nBTjiD19vr6GUmmqQI5BqsY7E4HDkE6jzImuVVGCsVPy5h
X-Gm-Gg: AYBFou1U3caJfd0JFaXyG7XYSDnbQqcus9TXqCRAJiaVTwoDtYJvcKB+gSB9odmDyRY
	RnuTO5tHvG8mcfEItSsLstXw3GanzNICQpVTv5eUz8r3u7qQwaioiK6o8YqbviHoHtUF0n3+g0R
	BKV8tkT6LlQhiru0VOCHXYG5vpsAvWgbZwAxb4i+NUQXV6kieizzZsi0dByb33z8VuUM7DDZGdW
	Nzwtul6a2wC8rOuhu6vEWwSAm92Qfh/AFZgq0Y0j7vcXHXSfXIIovLKEvq4MhbJpiHwS4dUTG21
	36Pmss9nLy/J7C/tE+CZMe5TUgSZmzS/t6ddMCFRNikSy27UYXmffFHAQo5MRTm+JcEaCXtMQWv
	r0UPliqsdAdTAeWXq47eJJz6Cx6tDaYn56sYD1MoRcIOZvnztM0Z/iuKg
X-Received: by 2002:a05:620a:4495:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f2e8128b2mr120961985a.36.1792224640045;
        Sat, 17 Oct 2026 01:10:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:93f:2e81:2217 with SMTP id af79cd13be357-93f2e8128b2mr120959085a.36.1792224639531;
        Sat, 17 Oct 2026 01:10:39 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm11128617f8f.5.2026.10.17.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 01:10:37 -0700 (PDT)
Message-ID: <c624d8d5-3362-458a-96db-0457b25cad53@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 10:10:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "magnus.damm" <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001075742.21961-1-biju.das.jz@bp.renesas.com>
 <20261001075742.21961-2-biju.das.jz@bp.renesas.com>
 <20261016-rebel-ostrich-from-vega-f759c8-mkl@pengutronix.de>
 <TY3PR01MB113465234171180FFB5F1B6FD869B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465234171180FFB5F1B6FD869B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfX8F5jegUzJm2k
 85ac2mpPxrMQLEz4EZ/ugPJmq7FnIRz+P0TQJ7PZHdD9afPO8D3yYrCraWdhdJfJQXaayyShzrp
 dKhP+7JZkbYjFNc6HaYmExzDCfM725Y=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad32d80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OvmbqCCc-nj-YtGC7z8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfXyXGsis5ZQC0W
 ZoBZYsz0u2Wav35Csw23moMg3nTdLRZcwo+6PTJO+bpvNIL+pMR3FfNvDlr0bPUINoVsodYVeb8
 1Cx1anZO4yXifw1GnGB7rS6mx57B3XeFu2FBUW0psVt+6FOTgma7SZaWJmJ64BACnnLxN8N66XI
 hD4OugBojl46jHYZ+ywM8N85wtPGDz+W6fnTZc3519LpMenFyeiUvEs+jIM1B0gXSnvHm4DvYH1
 B3yIuvb8CiR3mwrqFeJkCBz4jYLXr+62y2B0YxZz6zIbSJgQ7pNOsb9i4cR4GetRSCevx+E519U
 S7rx+Ht5mmVvNMM4DvLnI8aTwbWZQ3gBGpHr9XEsm5WiwcG/Dhv0wX8/pH8/pCRLl732Y+I+eW3
 sNjUC2951kiyjnPD90Mu8Iz3MVErmmy0ZK6fJGxrbEsLnawfyvDB2Ew/Ok2yB/3wuc0zURFvfEb
 /QposMR/xq5ZjnXKPxQ==
X-Proofpoint-ORIG-GUID: X_SaMLjGbTA6QFqLOcLtXJ-2DqpnEe3B
X-Proofpoint-GUID: X_SaMLjGbTA6QFqLOcLtXJ-2DqpnEe3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170032

On 16/10/2026 16:12, Biju Das wrote:
>>
>>> @@ -294,6 +295,25 @@ allOf:
>>>        patternProperties:
>>>          "^channel[6-7]$": false
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: renesas,r9a08g046-canfd
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          minItems: 11
>>> +
>>> +        interrupt-names:
>>> +          minItems: 11
>>> +
>>> +        resets:
>>> +          minItems: 2
>>
>> Discovered by: sashiko-gemini · Missed by: opus-5-5, gpt-6-astra · Confirmed by: opus-5-5 Should this
>> block also cap interrupts and interrupt-names at 11?

Correct.

> 
> Krzysztof,
> 
> Do you agree with sashiko's comment? I dropped maxItems based on the review comment [1]

I asked to drop maxItems from resets. Why did you drop it from other
places? Comments from reviewers appear in specific places, not randomly.

What is the upper cap on interrupts?

Best regards,
Krzysztof
