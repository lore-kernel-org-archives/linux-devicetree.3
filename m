Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E14330652
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844490; cv=none; b=KFpSjM0GlgGpf2dpjooHD9iJliTf2hHEfD+nanOF2vH63eECZr+d1G/8qpfVKns8rvAslciZ7WtZ1Axt33sbB7f8rk8uOqYVtqK80E889YyOnYGSDlzkYmw3mpzC3TMDYV5pxp5Ti7afGd0M+DpWPRAFjWGSgtm035KiK2QXhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844490; c=relaxed/simple;
	bh=MGYvN9/C1dG8nd0mhdkOs7JIPjaMEapnUVdAhEo1FnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcp70Cx6KQLKWxVHL420qU/GCCQ0tPlMeb+5DVp4t2P+P5nkJhqQcaEK4FfC1JyN4Lm4pR1dJiu4Ilwqjq1BjKVd5eFG+hoPyjax9dsdRgohh2dX8ZCGTvKYhScJKynYZer6DP7xZeCZX4LoycLSKnl7bbjm7k9pQIlwF009FmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BS0qiGxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqcIWpox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BS0qiGxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqcIWpox"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBOEWw4020774
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=; b=BS0qiGxskdxIIJvL
	LaoS1BZrx/iXGupCqkXUSxwQGD/mj8MD6TZoFC+I2a2WcaKO8XHfb4ZivB/pT0tI
	cdVvcbchc2jc5+cQXT2Mk+zitKaCqjgwrkRV56EZk45R6DFIzgVdNsoJYgLYIFZu
	y4dm52TQKklz236E2QWaSsUWS6F3OIevhkdA+CYvCIXqK4YnyH3VNlIE4buJyKX0
	NJXYjA15jmnpopX/CwTvv39nLlrSZId8mam9XaK9VemVH6ebHqmh9lxDJzTs+TOd
	j7mtGXGYNM6Nr5jOicTmonaah7zPoMLzTAdmIES/2f4mJPKTTacFp/PIjUaJXSye
	vDqyPQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru1xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:28:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce849ad82so369667241.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844485; x=1779449285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=;
        b=PqcIWpoxWYGe0EJSAgAh7U0Z1n8eij1lJfi2RxGG/EGEDpTHNi7GPvmYG8NL1n152/
         Jk9FWpWjTC9uRFjDldnBLMNJsY4q9MWrg8bhY/0rQiMvXsb2WPSeJb7MmnsnwXJWxouN
         csusoRvWHyoGSczUQhf4kLMMTTi6cW7CevD8sRtBSxQxM+D9ysj2JP+62cuS3r6kDXiu
         tJlixHdMo7GZ3QfoPxhg3yaGYHjOi7nC6M2blIQRs+0ImI4z4PxV7hn4C98IRyL1/j77
         5Xdqy4oZl10Wo18kipJaDMf2llpUN71duoN8TBLBMvM1TMo8hJJysJdihRVTkrewuTEy
         f0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844485; x=1779449285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=;
        b=HB7ctjQtWmCisAPAKtoMH1AIbTXsE+cqW48sp0zzl43W3z/sOzfWv9EAGbZYrqzxfh
         7z1q+ehjIBxcfl2JezyoC1t0FA929pdaQpYdmGDv4JqejRUr+OnMsM0Ymu2frcxbKNyk
         vJy7+V41h6As4pEt7ocD4ooRSh4KBJj5j3zX5bf4jyTMtsrYZhk2EZLsTHFuFaXH4GbQ
         ZtUe9+Ui2Wci4zxvho4bcE06RhvEkDW89DbmUSPi8SJZsQkr8c4PregTWTG4C2dCTNDx
         2Hpqsb4EqGTblHpEFhn0VSKWyDoUQmqL6T0Z2rF10nJPFwvFeCZCADrzYIqQRPmwYU+g
         Ta+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UaJsJI/HCO5rmfNJml5BzNgtx1YDPWUQtmjfWeyu9bwJww89Ooq1k58f1JK4ntlj1ZTzl4/x+ULeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRINkHRxPul66SqWzqnp8NsJbOUynU3YH2q61KPve0XBBnoVP1
	UNCFy3v4EVf0Wbs+skuaQ9PlU53LKkDq5JNiLpAlOpDxscHuOHPCkrzhOGfd02YBDdtGBJhRoGJ
	meU40ZYdO5mDY0YkmsHGPhcfiNPhsDvqF5GiuwfOg3/OjbSLQnsDThZVhdyXBrElB
X-Gm-Gg: Acq92OElaUsMB0/CU67SGEad7O0uLHXWn23KhdZO0oFhAh18oVgKaEfnIIVl3KCqGD8
	P57Sp3YlcaOiRGj0wXNMZdO5ykJuLXILQdTsbJmOIRM/FhO3En2KgtbuEnUcFyCvl29LdDRnh6r
	txo5IwwSSdIM5vB1bR5JCJP6g/b9LfSMbnjh08j+bBpeiThplChhSZyOiz0RQnjzTsxufKiGRj4
	/BCqmkCzLSm7YcKHpqKjpru59j+h5Hx7r2J3hGDpjH/3n7ehvNnuN6yZaE4ooV9H3KvNYyU6exC
	1SSJjHAoZvHPnIAZtMIlDnBsCkabqen424WzhX0gMBKdoNdel2mlAUy4R6p62ndXyma1q0zs9gp
	RzS10iMh+r5HgUriVwspjvQJ/ZYYaW3msOR0VFDQNO49kIiTPZoY8Xl+SVS4G9mM+96dTp0XZ+J
	qDmuY=
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr439701137.8.1778844484435;
        Fri, 15 May 2026 04:28:04 -0700 (PDT)
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr439689137.8.1778844483971;
        Fri, 15 May 2026 04:28:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e35ae3sm208702566b.46.2026.05.15.04.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:28:02 -0700 (PDT)
Message-ID: <abe8443b-9871-455c-95d9-d16975c0fbdf@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:28:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
To: Mostafa Saleh <smostafa@google.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org
References: <20260429141815.827157-1-smostafa@google.com>
 <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
 <afOP2xXmEpV1eI3Z@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afOP2xXmEpV1eI3Z@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XsvRk-PBRmb1D5u2NQaUAmS6LPN6cUNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX1UoqbyjD5+wq
 IVJsP9Eun0WTjzs5zgvPHnU6Kqm/DQDZoWMLQS8MOwRZE28bLHH5mE9VykIsq8wFaE2XWdOGnI9
 GFA8gc3K8VRgDuATuKLd46YFxfeqPywDXPQn7LelU9rPvzlv+DdM1EM7ucqrU7aszREHQWkG/Ur
 Q99lU4wW3Lb6MllP9yx374eddlOQpxcjB6f7Xlo+jZ4UT+C3un0aNUwqP6octQ51ZWJfbEleQi0
 P1e4F9aYCRoC1ADMJD1shqfVgFfmFupi0rsYzBD45Y7Fn9EQYW9G3Yw/8SbwQfrRQxdmuET5yL7
 YY5ocHnbG0hhhVtTCl8qsUSKGHGP3t+tgY08FJemqJpV4+5iaiUEv2uDerDCg5tzgS/PiE/fiZ2
 taqPmaUB1cpdliBu5sWF5tpl61t4u0teTME5Jt0rPVTQGZShI8v7PW9t0UyPrivI1aYX3azcAaz
 Ao+Z3CYcN+GbUpeOivg==
X-Proofpoint-ORIG-GUID: XsvRk-PBRmb1D5u2NQaUAmS6LPN6cUNH
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070345 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=FLMWTHjliotF7KI-E18A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

On 4/30/26 7:22 PM, Mostafa Saleh wrote:
> Hi Konrad,
> 
> On Thu, Apr 30, 2026 at 06:48:33PM +0200, Konrad Dybcio wrote:
>> On 4/29/26 4:18 PM, Mostafa Saleh wrote:
>>> Hi,
>>>
>>> I see that recently the support for “Lenovo IdeaCentre Mini X” was
>>> added [1]
>>> However, unfortunately that doesn’t work for my device, the board
>>> resets once I try to boot the kernel from UEFI.
>>>
>>> I believe that’s because it is another variant, as I have been using
>>> my device tree for some time[2] which is hacked based on the crd
>>> device tree with some trial and error. With that I can boot with
>>> PCI/NVME/Ethernet and USB (there are also some other errors in the
>>> log related PMIC), this device tree is based on purwa.dtsi unlike
>>> the upstream one which use hamoa.dtsi.
>>>
>>> Are there any plans to support the Purwa based variant? I am happy to
>>> help with testing, but I can’t confidently send patches as my device
>>> tree is based on trial and error rather than a data sheet.

[...]

> I can try to see the differences and build another dt on top of the
> hamoa one, but that will also be based on trial and error rather than
> actual knowledge, I am happy to test patches if you have other
> suggestions.

Hm, I ran a quick diff and even though there's a lot of noise (mostly
due to the same things being named slightly differently), the actual
meat and potatoes aren't very different at all, e.g. the PHY regulators
are the same

Could you post the full dmesg with both DTs?

Konrad
