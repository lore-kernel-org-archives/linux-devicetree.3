Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01080481A89
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078365; cv=none; b=eLXffK1aUfVXGvDmZMj05cROTHin1yXclBfhap/E0BPllFA9KIGqGWHdJFwhjOhb5gBZg/TzprGi12IN5Ill7nq7OM0oxQNRPIopuYtrtn2PUIG2WBslAJGfZ0OC7CeMiOJHBV0RAm6HkiFXUpCcueUfumRPtNTZV8gr0dWTIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078365; c=relaxed/simple;
	bh=usS9J5G6h0+6xIgtwnQIWUzULlG33RsNfi/sRs5D5iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3AUU9aPzuvo3RIbdfFaZrHU9OXthUkTaUMIFXPYcmBFmtZ81xcxZOZPmo1Nq8xSp5rgnTXam2y8JoE9+nd2gKFruIa+slk2ORPTmAbdWFKU/v27wAGYfbBjcrwXJ/pVSYO+vES5VRzmPxaGEIfndcG6e4KNJJiQ1q885kVjtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Js35QZhM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMd3kuQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Js35QZhM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMd3kuQd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGNFO3309338
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 14:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=; b=Js35QZhMvcwrVbQ+
	I5/dNbCaamWZmICHMBkIbgWez4EaYKo39b6v/pp1Fac1U3Im6JAYkplE8UAjYYtq
	niZ70b9m1PMGhBgzVX+LCmmzqts7xQDX9y/vX7ImBrErBSKWXi9GsXCyXtQmpMao
	urQhdfnV7Q1JUp1fcwPqS9flEH9kV6KOmxJ7ON7aTtkVq0ewa1zoRFKIsD/5okzr
	AhTZgFMmJIG0XEGSsZFenbXWetOVpo3Xn1EcWcX/koP8yKQRxlyqYWFNe3N2DZ1Q
	LEz4H7UyGuOUcignyYie5WUj8LCfyMUKcO5hSE9mJe4K6TbKQhiPXCl5dDomPQZf
	m5fyAA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sg36p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 14:39:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d571db32dso87398241.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078355; x=1778683155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=;
        b=JMd3kuQdlkFZINxJ/QbjRB27iWctx9xCLw9qCIKrd+fMxFeCp+cTwJ3A5+rEVmcJKv
         rqZ9Lmzlniz8+gxugkAotiEhwxVziOtFuGUGvTwnJ/deKlEm7spTy3U2wyI3RKQNTMDZ
         gDZclJByV2IvLToLWRoEq3Jn3XlwTU7KWaVJYgXa/kZM7H6XPoXw4fDfmMFyHt2rnlwG
         23yNzE+c6et9qrXTqaeFeUdGtv0qYR911LQhS/DeAVspQigTLmRZQMzymlrkHWy6ab2Q
         YAJwvYcqmRo3VZb9LWpxFpo6TyRyidOuGoNvNn4frBWVd44Uz/JW6yDq94OzuzuZwI1s
         9G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078355; x=1778683155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=;
        b=dJwdL7ZpnmquGMfUO754Ip13TwUGabTA7c8jcQ73GYVgpHFgp4RyD1KBvfgV5T3Zw+
         DCEwLMge9ny/BbbFGs6XK+hFWFkyqfFykcMzRSWC52fq9hBPXdBWx73jm+YERS120kBB
         xCs+yH2ChAN31cQnikSouMkwhyrPZFYUki5NmMxBbJd28DeszEgSqJk0jQiI4SK6nW8c
         GTOjsVkeJQUPbdzRxqAX3pP59IeJ2rk6N58uEtg1w688QuuZ5KGPbm4mp/3UfMfP4/qe
         0BNswqC28mMP90FTCY2KtH18QAd1SIQfOfseHLlN3tyDSZuBckAXdaWlJg1utsC8Y7uT
         6HLw==
X-Forwarded-Encrypted: i=1; AFNElJ/2OmtdO4kEFwDpUDQHSZrLSH0KnEJdGPyZVf6zu1sOn13r9jBYrNWTk+h4LQ8CQ9pr2qj0Qid6LDpl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ic82k2jzLvaJZOzFjIIboR5ypftyZXBpVyRRq6k/HqqjgGlW
	oi6lXA9R+GBq2R6w7WsB93QfT0hqIVGzjXDU65AYtY2cWTE3PSmeC/r7etYvFlSreZk4ah2jC/U
	B3vVP3H+Dw6oL/Wsefp12hYi//WQSn74YEqrkxr6zbaXQkdtWGuUOKBL8lv14rkWg
X-Gm-Gg: AeBDiesuxPAH2Ewfax5xv2uLzi6mu0dyE3BRJBTGsRHXYdryP2NZgSqJ5MKbNegNm9i
	ZeGJQ5TQprJnWdcZGiDTbQGeVmekJT19r3fbJ4hnILJbVffpXfoCDpqEr8TqAS3PLN1BUgW2OvD
	aARP2YXtaGaR0xWXvKYm4TxTtbv5KPJ/dzyVIuzsYNQFGlQu77h3Mxg8EnF2/3+uIHvI3BIXBT/
	XzfJhMc9DFHVAz27Byh/0Hz2UO6DHMNa1m6waYDekV7lIHptvg9ovDz8ivoHFJQkNSL5kzatFeG
	7AdvkVmd5rg1+2x0zqjy1282iXi5tqvLAyYTcou6tKRum4ndDIyA8iwe+KeLB3O6leyXrxkTT5R
	H2hgIwJVfoOn6F7Ak8mDbhD8i8jdP0NUPAvbnuOs9+uHrYDJxiLltgYDfZXIHGvzaKJGx5qYCBg
	eVD/KQS8O1sCZuqnpqRQnYq9UcTIV7/w==
X-Received: by 2002:a05:6122:1da5:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-57559611fbdmr1942836e0c.8.1778078355373;
        Wed, 06 May 2026 07:39:15 -0700 (PDT)
X-Received: by 2002:a05:6122:1da5:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-57559611fbdmr1942788e0c.8.1778078354922;
        Wed, 06 May 2026 07:39:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5390f854sm50161775e9.14.2026.05.06.07.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:39:14 -0700 (PDT)
Message-ID: <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
Date: Wed, 6 May 2026 16:39:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/timer-econet-en751221: Support irq number
 per timer
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com, daniel.lezcano@kernel.org, tglx@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260416175101.958073-1-cjd@cjdns.fr>
 <20260416175101.958073-3-cjd@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260416175101.958073-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb5294 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=L9NX2KsuAqd3V9ZBNpEA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NCBTYWx0ZWRfX4MF+VTDecdZs
 EO+ZVRDH4eaSFH83wEhlzasGOYuq0HyBvhjQPb17uBN5aDGHDEqWGcM4VvtYAMy/VHvgI9Cfejq
 +OYNCOgZRfxbCikIyTNQSqEWse5G12gXmG3Kktf6QMysyPDjD1yqtoQgXiAljw2BwBmSC/g9g66
 24umL6fFxb4XBA7WaqJAI6ninRjvfFZAF4u96SjfOi3sLhQftFbbbValmpj/f5hgin5GCERoHcr
 qytfWZUsnS2B1hlwCuN+/ByvIlw/sed/rW0zslnooKZ9ykC3e2oUiNxMP9/SE81/XPNU5m9Z7D8
 LhWAaNZb5oNbE8M2/dUGqQmxzWZ1fzSNf107p436rE5DxMkJwC5KBJJODrTtsyAKHINvyDo2etc
 wEdblSwpjeeX4d73BRE/LZuefCPuXHVFKGNi7CLqT56BixVicQwQu5N4YuDij4jI6sJfRNJVtsJ
 4hGEk0DxfF37O2XqWAg==
X-Proofpoint-ORIG-GUID: FvkknNyr6eMcR6lCblPFA9OFOCVENCoo
X-Proofpoint-GUID: FvkknNyr6eMcR6lCblPFA9OFOCVENCoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060144

On 4/16/26 19:51, Caleb James DeLisle wrote:
> This timer was first developed on the EN751221 which is a MIPS 34Kc
> and therefore has a custom interrupt controller. The hardware for
> econet,en751221-intc implements percpu routing of the timer
> interrupts.
> 
> However, the EN751627 and EN7528 are MIPS 1004Kc based, and
> therefore use the standard mti,gic compatible interrupt controller.
> This interrupt controller uses a different IRQ number for each
> timer interrupt.
> 
> Add support for both models in this timer driver.

Given the changes done in this driver, the description is short and does 
not explain why the code is so impacted.

I suggest to split the changes in order to facilitate the review process

[ ... ]
