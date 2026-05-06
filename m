Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3561F3FCB06
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081985; cv=none; b=UKNJljpMf+R9JdDLHmkmlBU+AnkIkgUkjwONk6ojxK79BOUQQOVnXQqA0ABSzEpwQE43CTOGKuM/Pe7NQGuv6GA1OLfIRHuEWbxkm4tuuPv+sgUmbhSvmvZ4bajz/AULuh6UNvIPJbScbRy9QcSwk/RDV1WunTXSjAvD6WBIScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081985; c=relaxed/simple;
	bh=k76zP0ySvEPeRY5uVy5i7dO3WcSb4FP2yZnMhkl4RYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdL6y8gNxd1mfbquNis7L/o5cTOhzqTwTdn6szduRxqk/q8UC8rsNhUtAq18mPLHQ/RHH2yZXqnNOxvrp/u5ceyCZqMcNqmyfWKmQS8fHMShwZQvQn45P3WAC1pyjy05/yvKaQ/ioiqBYv9hnEAchCA3CwNUXcQQIegYaJQfK90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdfgqAN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwfp2NUx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdfgqAN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwfp2NUx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3VxS1953117
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 15:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=; b=EdfgqAN/Z0o9eV8f
	l6Pyc7N8WFODkTjS28eOwfvGJRbphuJZq3bk0YU70CxFhJdkKp+q4ZJ/0Fb49bP9
	3rGUGAFOetYJc6owHbQAdr8bOKC6nlXUygkYW/OWSRfDHz+7I/Z3iJyKB7tQjVGV
	kQFeCZuviGZrG3j8GKL7slwsTWr/HQbZek0cXxwODenyM8CHq1Dpu5yjzsvEFrKN
	/hvEHpWBrpD3upauUsw6lTS/oorVl4zwjkWbFKdCb99yCmE8XscXc2sWPo931u6x
	7TOy8M/T5XdoYSks6jZGlgmy6EG1zlC1FRWkTuNYpGA7odTHQ75qIVxOn5LuMfUH
	sEdmIw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc17yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 15:39:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-611af0d600bso4241775137.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778081982; x=1778686782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=;
        b=dwfp2NUxXAKbaz6rBmWHe2xFikeJzAISB986J+rFY+SDiT2S7rU5huCdcGpg24BK/Q
         t3B2OOCgPMj5GiS18F9jp7COA5I5Ci39kcmPVohOkGtuiy+v2Xqq6ArLAeg9jY8vihli
         KO4HRQ0dQ4LKKdSj2RXPd5az0sqGgqZCoI7k8o1aLE/o8quoGWYu4xoXNtsqcYB6Q3yF
         CHFkCu2r9avdwZgy24gEexoNVr+j2xssDw5Bgmg+UClMg86aUwzFI8h40gBS0gbuO0E5
         dYybtc9q9DoKffdnL/N2c2XEraGJrckBthqv8q4/6+xdUroGIsoBGIyog/Rv1XVky1MP
         9X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081982; x=1778686782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=;
        b=QesUAS+uuyrkInXVs164l8KTZuOiZxOOET4C811zooyS1g8IiMJOsnP6uvzVj8zIkC
         SOzmVuBDXJ66dGwwcz+MlvPuPtiOGZLooZiPWkqmtmfDyz1wfTjYVmmOezoyZ+3e95Lr
         GzErw9EH6IA6wzXHDsweCXEIV5dQgFxGQPWkHTjTqimpMgvKlEdXKOIzXJsl8N1WWhfD
         UXHt7h5a2vMz3Bkws9r4BaOpuLNL8VNiszdaETbskELllT1s8TQIT9NTXmgzXxemNe08
         1GvqEwt5Woyfh7vZc1T/POYVHAQzWbEtrA5y+pOi/zf5SIkvlTkQibiIxgvjkLi5iSK0
         cc/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8eg0EP44iYqiW65Et2jQYGv7OarT2vCLS+lJhuVPjoW56Xnl2SvyXpW0yh26MAx822IJOJJq/v+k7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xZSGADZ/3ibUqRj8Tocjmb5MaVFkeFFiJiMI9E82x8l+d0+0
	ZcSE9ZXCIjo0830kjvAj7XNZYhklPR9bm6TUjk7y8QrlsMaPEAb102omty8f0Cz4ENq4H+Kp37p
	/j+4TnZ29T2XUjR0RykGOFobCK7kpa7l0KKrKCxL3sau6inWZq8vot/jcUTvJQQbi
X-Gm-Gg: AeBDietejYosHVTqvNQ27yzl8/R0/Xe/RBeOUTqw/fiUMboJ5P+epQ0svd1kKI4iR3X
	akH83FYLsrk6xrB+hBU1uRVb0u5D8R/kYV5XShTkXicGs+Vp0AgzV4hWaxSkbYZ/7WZRN7x+JfN
	oUdH+rUIaakaruPLcKPJOkjSXdneoZik/Fh19rEnywhnOj1WO7xhpKcVh/H+Zi6Qs5RZoVw9cNQ
	/GOgekCUgAclCx7zy87qIV52cSpXD/vpGOpC2MGopK4aTb+Qo2kcgeCkFKE0AfaQcMvz4CghUH0
	z6AuviRTn82eAUqxtgpivOyuISXBvvRoorRJ7yoi3bFaEcgth9Hhy38ev1BnvSnA4g8eDWSp/dX
	hMA8GYpv2+HHMq0D5jzWFYP2X39ieH5NNUh3jv+UzxMXqe2No1paioOIXdXuHpAdQ8GwTpRvE9r
	8oYEjknDBM8ioONTjfBBk=
X-Received: by 2002:a05:6102:580f:b0:62e:bf5a:c23d with SMTP id ada2fe7eead31-630f90bceaamr1891642137.31.1778081982604;
        Wed, 06 May 2026 08:39:42 -0700 (PDT)
X-Received: by 2002:a05:6102:580f:b0:62e:bf5a:c23d with SMTP id ada2fe7eead31-630f90bceaamr1891615137.31.1778081982111;
        Wed, 06 May 2026 08:39:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm13410347f8f.26.2026.05.06.08.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:39:41 -0700 (PDT)
Message-ID: <89e792f3-3a8d-424f-abe4-b915bee63265@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:39:40 +0200
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
 <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
 <b37dd665-3d25-4627-ab04-17431d9931f4@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <b37dd665-3d25-4627-ab04-17431d9931f4@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NCBTYWx0ZWRfX46GPaX062j3J
 qLwH5sIovXsCueA7FVBYp7WOVNXP7EocnUWi6iQ7hpoi5wBm/u6Q8FgCJ3Gu8e+4m9A7BPfguVo
 /LdqiOyKJtqRb+uqK0VJSa56exSFjvW5ZKdhWIz7VnRDdNTBkGRWsWXYuK66Dm2xG/ZWbc6Rc4M
 F3efCDKX+OqHld5o6OtlE8z7Zqw7D2PBBVgt2rsA4ZpKG1NB9RiQA1Ennzla8HK039EqM/Ary4F
 FG9Y/fvbAOMGVqVN9Js0abzKfNIRb2hXrV0v3aOFwdH72XK1WHpWg7Dy2OOGGgN4uNBUZo/pu55
 N5DD7U82eTeHpyaRdSyAKcGu+pH+Pk9+JCU/pm15bE8dRqb+MePXMMuEhaK/3LTMjbAotPAvgDi
 gnnqekuyFr+C79e5fXvEVf1/S5SC13eQNnslb3+Zu/nsxNkfqM1UZIZR6F7tJtN3MSUVUShP53M
 UHUodvTJglvVwO0Q+YQ==
X-Proofpoint-ORIG-GUID: vGnxiLS1RYoDEBFEjR6vYUEhXDBga5Fv
X-Proofpoint-GUID: vGnxiLS1RYoDEBFEjR6vYUEhXDBga5Fv
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb60bf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cnH1WqUiKSxbJj0qui4A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060154

On 5/6/26 17:27, Caleb James DeLisle wrote:
> Hello, thanks for having a look.
> 
> 
> On 06/05/2026 16:39, Daniel Lezcano wrote:
>> On 4/16/26 19:51, Caleb James DeLisle wrote:
>>> This timer was first developed on the EN751221 which is a MIPS 34Kc
>>> and therefore has a custom interrupt controller. The hardware for
>>> econet,en751221-intc implements percpu routing of the timer
>>> interrupts.
>>>
>>> However, the EN751627 and EN7528 are MIPS 1004Kc based, and
>>> therefore use the standard mti,gic compatible interrupt controller.
>>> This interrupt controller uses a different IRQ number for each
>>> timer interrupt.
>>>
>>> Add support for both models in this timer driver.
>>
>> Given the changes done in this driver, the description is short and 
>> does not explain why the code is so impacted.
> 
> 
> Fair enough. Supporting the two different IRQ models lead to an annoying 
> amount of changes.
> 
> 
>>
>> I suggest to split the changes in order to facilitate the review process
> 
> 
> Okay, I'll see what I can do in this regard.

Perfect, thanks !
