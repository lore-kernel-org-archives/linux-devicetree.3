Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5912ED16D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939536; cv=none; b=t5rtPiK6ol1JWedkbJC9DpX3U1tDsokJ+CSgt6Zmu+D12YO3bYEbun//XAGv5JYkLpwFmloH0rhDWz6sibNSYH0qWOCO2Zfd9YGdBy2tTu4N7ASUJGpsE+1yS/6Cv4n2mqvfs4RzRV0wdHMT+1ZL5HP+K2XZpMLZVvHAu/P7Eq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939536; c=relaxed/simple;
	bh=AAYpfUYmdTX3UTjTYSt9G/mxz7kuZvKipqoN5YlKOZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZvTKTTTbBqRlsG7eBJ3UiiSOZcqo4oLfFv5mBxXcaCrpwptg5YSNcYPCbyAgFoBRwZ8OdHGUQs0QkfJ64BhPcp3Ljq/+EAp3qmO//Jv7aTTOXT8CeGDoI2Rm5z3jgFYXGT4GDpUETWxrIO04OhrSQoQwYaaunFKUkeD6Ey1HDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXloRZLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzCE5sHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXloRZLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzCE5sHF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6DYww1090303
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=; b=WXloRZLbD35kciMG
	tdq0m3CR61bZQyntpZgknAmIpi9avqS7uK4+IjZbRIO5+yJCWSCS37PBqxXHZzIv
	+sCF6JRl/L/5uWFWfUt5PP2WI0rL34tapGkdmi5f17qfhJlDhXc+vWewsA+wFh89
	M70afv3gxUN9T7nn1RQOsvwYeiaf7eXMsrPOi4gq9XthH36H9OkK6jdYty5yzBhN
	/BwYfq5x/i7MzAj6DFwqTqhcVvRO6aHnAn9VBuPKueD2iF7tCC/kZDKsFTCjZ2/Y
	KmnMkQiAYOCXPf9pw/toUsnwCDRYd8opPQ+m0YeB0anCqpRXgCdxaYT6NN1RhBL5
	gcVqQw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd39fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:45:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso15994635a91.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774939534; x=1775544334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=;
        b=RzCE5sHFSNeEDxAOFraXHqkSWIhDzEBYvAQtt+yvBjTl0iI50nERoBjJN80FgoqJsA
         oFWm1kMscy3P5e43G5XD9LR65BH5MrxqShi9usqSWRErpxppMENjw5kHxoOTCsJLjma9
         Afz/QKbaNNxC33BjxtgkbsT4F/bRVry7w70ySbkVVFigQO8GlqptpadMMqXzgvYuo/Qe
         DOGPodSoQn9JNhsnL9N26ODDZChesdU0i0U/+rwGXziWbdC0PLZP8Fj926x4A+HT1bp2
         rzfG86rIWcHvO2q9nNfWvmn3Q7nx7RQCMLOIshwKSMgyPposj7Cyr+Wlksw0g2AziL6P
         gVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939534; x=1775544334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=;
        b=WPnA7mgZ9ifDftLJm+wTlEkPKLBKw0Uv2kWRmReV/UnEvMV6paRerCarL1gGxl91DN
         EXVZS6zi5R3cTyGILu1aF/w4MN/h0K00rs5pmIdxlQcolmNoFX5ug0oGhd2n3bYn02pS
         q4o/tIn0sUrJB6vCOB1Gim21WPbvwekv65Z8KW5Nxfm04RSZizj9aSdgrEOwKZYH+XvM
         28JcpJf2vA2qnoJXrlO6GmMYKhNT68c7Z8hRHa0msU37Zr+E6L2xQ/CqySPA430wSy9A
         a7pWimnsqzO7xJAJUdJoxs9z4dZVZ/sQQleDObrEluKCdYQzL/xnfnL6B1YH3eF/lD1V
         JWlA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Rk2kLd7OdgkTzg2e+CwtQoPGjJYYPwrfy++WWUmb/Ee9cWSAaV5ZiIcDE0TRPunfRkYRttofY05y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg6TNqD9tTZS4YlkqW/3pJqf2pvnsEonUxQgXB5lxyG1MPBc/l
	z5Cirrey4iLacgsjoCuS8Pgx+RslSWXeJFatiXwxfC48xqk2qDV90ipzoRcsezRfR5B54u9LGN1
	CObDxPNSihHfm5ZvtcGGuMHJeVVzv8hzOGKWZOpf9sJ2/8vcjtFCtgaazV9e5bUNY
X-Gm-Gg: ATEYQzzkKWgbimIvBtMLhlGh7CZDVqNzvHgZPybOWxq7m4OIL8LfsyJSUb8flcXi37r
	dp+z8yOT/fhb29PzmHEeryk2THoIIi4EE/C8AZ0BqN49ZaHqWFK2U9fYNFAFPGQQsKTmViHVK2D
	D1/Do6ZBkWsJBTqaWsLppR45kV8AfhYWy2Yj7Nnw8PHZEYLraY/4D+wrJmpaCd4HTKcIyKU9IxX
	ekJRWoYDfb2Y1FNzQ14fo+80YBzEMuaevjTidHmoa5aZFdCw9PVx2si9ZalYaxwZ3nsKKTFa3j9
	xgxAc9KF2k1cXCL1LmYwo9TpHr0A27FbnX19gHx4x/L7EEyns3ru9KGHF0Km463sH4R2cye/yYO
	KDWXdX4BkSwejC5B9bYJ+KQk6pPmDxgHpaKwnBPpiBvkYMu2kZd/eYQ==
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14593881a91.4.1774939534151;
        Mon, 30 Mar 2026 23:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14593862a91.4.1774939533671;
        Mon, 30 Mar 2026 23:45:33 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959358sm505729a91.13.2026.03.30.23.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 23:45:33 -0700 (PDT)
Message-ID: <d4e092d6-5d9e-49a4-88d0-c02e2f17f36b@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:15:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add microchip,xstbyen
 property
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, linusw@kernel.org,
        brgl@kernel.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        anup.kulkarni@oss.qualcomm.com, Conor Dooley <conor@kernel.org>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
 <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
 <20260323-bonded-ranging-c9f9c4d0aacf@spud>
 <20260323-artificial-ecstatic-collie-047169-mkl@pengutronix.de>
 <20260323-surname-osmosis-3cceca19c824@spud>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260323-surname-osmosis-3cceca19c824@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XrgYpmeKI1PVcNPT9_Vr-v58gulx1_bI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA2MyBTYWx0ZWRfX/9O4BKzEDEhx
 GeYi/pnuFlhWvIusDYVsrxxEkfCbY9aLRFsKcTB8J+Dc8REothGf02iWaVkMT+tc4XeKvHKS1Pq
 ZLMk8kmo9UnfrQ1MX9iZByuqWW2YPr7+/KKKfzdjO9HOPK79hJoxPzc0PwFUlDaWRNDNjXx+mtn
 V+qN5qlowUCOrpbr3wAU1WQ6/fogsWsjzRnQrDDlAQzJiXrmysEyKAXAXFHTUhSs5dU4a91VT5G
 80ZZSAQx092DKLrTWf5g/K0HS/SwxoNchE+WIRAnR8XoGpFILhKys9rLdQBKRTQkSGaEx05seZi
 CzMgBld3J/VVPmJPM3jpi9/C0DMVyzrLHmPl3fnxvpyTi78DNxsX36Cwm6Rv4KzBJZBgqmjB8dO
 6wRaTNKgCKVEQjsfmdmMzCME+HTgblnOoYNHsh8IY+Au8WG8mvnQTY+JG/Wr2RTNEnloCM9TwMX
 jYFwGY74tSlzVcFHXxQ==
X-Proofpoint-ORIG-GUID: XrgYpmeKI1PVcNPT9_Vr-v58gulx1_bI
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb6d8e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XYAwZIGsAAAA:8 a=CaXaFvdgtWsuPFoOWtQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310063

Hi Marc,

Could you please let me know if the driver change looks acceptable to be merged?
Once merged, I will proceed with posting the device-tree change.

Thanks
Viken 

On 3/24/2026 3:00 AM, Conor Dooley wrote:
> On Mon, Mar 23, 2026 at 09:37:24PM +0100, Marc Kleine-Budde wrote:
>> On 23.03.2026 19:30:00, Conor Dooley wrote:
>>>> diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> index 2d13638ebc6a..28e494262cd9 100644
>>>> --- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> @@ -44,6 +44,14 @@ properties:
>>>>        signals a pending RX interrupt.
>>>>      maxItems: 1
>>>>
>>>> +  microchip,xstbyen:
>>>> +    type: boolean
>>>> +    description:
>>>> +      If present, configure the INT0/GPIO0/XSTBY pin as transceiver standby
>>>> +      control. The pin is driven low when the controller is active and high
>>>> +      when it enters Sleep mode, allowing automatic standby control of an
>>>> +      external CAN transceiver connected to this pin.
>>>
>>> What I don't understand from this patch is why a property for this is
>>> required.
>>> Why can't this mode be implied from the lack of rx-int-gpios or
>>> interrupts?
>>
>> The mcp251xfd has 2 GPIO pins. "rx-int-gpios" is for the other pin:
>> INT1/GPIO1. Also by default I don't want the controller to drive a pin
>> in a certain direction.
> 
> Oke.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>


