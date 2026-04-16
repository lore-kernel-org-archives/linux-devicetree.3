Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F903E0C73
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352896; cv=none; b=HHKfO32kNmyHJ6C139kw3LFxIvnXRmgdaBoZVRr+Tpng/FZY/7Ki1pGdF2nBeWjavhzO+nE3IzrD3kk0lytsaCVv3xOZEqFL29Cn5sclHSOq/yPQ4C/VYUFVZTVsRTakw+5uJ4cq5vg44RDOOa/6gYBHzg4onUGi8FTr6xUjlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352896; c=relaxed/simple;
	bh=YICVe7onyRZm1cIU0ABm6cP0eaJuEsK/X3wiAhTzNoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtrW4jcklj7M+AAn2/DYHdg5ovt1ysoqfg9aEanTXcXaMbQ7iJ0qKXN8b11+wcgCJ88zttcO0t0uJ3yKia8ptC7iy3Xc2IVdRacjrdDjenpW9PdC9W2lnhd06ScNBNgmYllEf4/CafCy+UK7zB+34wcsR1BBjN9r/8ypXe4DAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYCbXC2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgshXezz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYCbXC2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgshXezz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GC9wqf1668220
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=; b=AYCbXC2mXQiuahsX
	Q7/stFtLHZjHs59or3bQVxEohitjkd6L1fjnTGb7RM4NLrTLiJzk3kW7TwUtP05h
	spk3InPE9WM/BqSV4IptViyyykNpVrdHrQHU0v5epM52rwMfPZjQZkBUF/k5hS7W
	/EyCEW12JRckofJtjT7W5uUSoAAU7jGlrKx/HO3qmmPjBm5PXatz/kvdBG0d0pYH
	6iPEDDghVrb7A5Pp46Ftrhk0Bn7PSYXRg1vhEi5rCRHLd7BWPYqcQkyrtFmUhLRl
	QlrZPOpbLiFe20gR52gaGbF8HXniSJSsEJU4YeQl1ohoJITdwUNVWGFRJJHvjBcJ
	V79Ziw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91x60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60586b8e65cso611086137.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352893; x=1776957693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=fgshXezzmGPVyTyW4PE2kfYFg7Ua/iXV/1Ux8sN9tH+2eqlXzSoUV4SRhSMk5UPpIP
         XEccPHWftZYLoRitqYDlsELFo38f1cAJ8K5iqxMn/7V2fp0ov7RswinJ061+Q6xWuYyP
         zn8ndcio/AgUovF5COuymu0T5K+fNt0nckDTOTlbVTnwp7lizTRUjmsdnwKTkNiyTQ18
         R1C+5KrQbgdgeAIW9iRD3KqdfGWHkQS5U074G/5t+XjvQ+iaPC5lQVAwyVkn8xg8mqkW
         bxZ8C+siF7wLhToSuLyr/MZHNSYcXrQJ72Pv+sR5vPobUdF4qj6uExCxt4jdlulHkTX1
         5Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352893; x=1776957693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=USNpXjvlpPwRDQDzNPFxG8/geewninaTe2WfALCdrbKg4Lb84GveqDgspP/kquSCX/
         6h1S4dU5MvMR48G+Z3Qk7MYcoDMdRWWdoouH2vP3VOgQh3yiwKCiXcxvx2a6ZK9iMGIH
         H3bvREsm2ohZcoV4eDI+p0bcj0COgZ0X4t9Ju9gyCGCZMLbknMp9v1cI+WfogONfsZ46
         ghmGRfOdmHf0VqHOH/I52z8/ZbDGXsZ41ZbTd+ads0BK2MVkaUuTaETcsK3IzWa2Otzp
         OPu8KqNg9crHjOxYk0e2Kc6R9QCr5VgavNZ7rXjopHUQS13sj41tzjYQHMEa/E3f3Sfx
         FR5A==
X-Forwarded-Encrypted: i=1; AFNElJ+K2Z3J0oYdGqY+k3S8dm3ldaCrAjeAqdfwQYydOa0ZPuHNdpDkxR9ofRqOVEj9MhSP5qoqC2Njkl6j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+u8xpeArL6TMy8tkX2ETd9vSsHjP5QF50h2BxcmSYvn8ytp4
	gE3pMx2iPZCQnacYrM/sCaj5pveKIo+46ySYZ0Dyo8TyKAohpvwSqNrvRdmXTvYgjQo7ZMiTpM2
	eJLsqanIInpMzem8+sE+QHBrpqPgd2CNyaG6f0wJ41U+URS/BvDWZ6Ce5GYf88Kfm
X-Gm-Gg: AeBDievOO8kWCKo8FrUlgVscvYEH2gOOaft5ViM0msp4TY74n8aDQKubdH6zFabpqpz
	5ZKVSqbKoo+Fn44ufaPuXU/f2aTH7s+i3CoENraNGmy3BGIQaSRLoYt8iXS5eNmBuoD7ATArr0F
	AZhdn4UqPuovhRxfGUcEsrTF82eD2o//6Kr1argqjPfBMPsLpxFNmYvOCWGQWJALF5vwI7sx43p
	vm0SfakDyX+Tcd87I/WF8QYl3aA8sbtMhCkEZeSlAlEacx+77ZDlM5vWirJhyMobK0uYyNPjsYP
	ak6wVGuAlJTSrTDTkuR4WXlw788TWJGbEy8rzYyWiw08aCUM1UvXvrIMqpjiOpR0yO8AtmicfFX
	YUPlD4XFJkxTeZ2EwKePWceinD5PkyZQsN6euOFoGSR4QP4PG51ssFs3CV3fT/izBDELfpWPpRq
	X3PGfRQ6h59Wu7sw==
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490403137.8.1776352893489;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490377137.8.1776352893012;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d57fecsm181221066b.22.2026.04.16.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:31 -0700 (PDT)
Message-ID: <23574203-187e-4fd4-b143-e53ae17a7a00@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:21:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfXxaS0/iRkDPPS
 iCEF13V5w+5MwLq3Nr3uW6puwWmSLD0qJudNuagruDO2tgjpJTsgrWYV6CMOPIcpQf4dHqT0cYv
 0LSj3pstMwKoY5ygnNY3jvZPGPy2mN5o/xxTMF+EXaZLMvR7VB7bgx3BsJGkmj5VjY3PlrMNBEC
 J3s2i2YQCdPM0nCJ6MR9wH8yb6YMRK7zTbhqxxwpWNtpHZGJZynQgHD9PL1ZjLmoD/LSPOqh7TD
 fVMHEhpsUPjlcYhZIQedwH2HXPk7hNIV1XYCecNi1xI/dtXxV+ziW52Oz422oUIKsMk6h5VMRCk
 aNRtOxl/AfHP0x1nLd9TmyKt6nrpYwUVU8CkVklZnuarHvrJOugJuO3OQTN4ix5UJdl807DvVcF
 S1eh67QvOcj5dWjKhLvOlFNQwshQxGgGfOwCMerglThWo5kOHqYmTB+unJfRn8ZJ+rW43pTDgKV
 68cVOhjKT3JpMt7YHhQ==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0fe7e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=d5ByKtP1W7CnrCxYHJUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: B7bpc9OB8VB4c9ZPYihwDji68GB-hSG8
X-Proofpoint-ORIG-GUID: B7bpc9OB8VB4c9ZPYihwDji68GB-hSG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to indicate that they are hardware controlled.
> 
> Because they can be switched off at any moment, also skip voting for
> it so it can be enabled later.

The second paragraph bears no connection with what the effect of
the changes you made is, whatsoever

Konrad
