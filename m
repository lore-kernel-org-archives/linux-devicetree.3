Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1623FF1C0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884638; cv=none; b=GSHzjDNZdjGi+B28oN62BvlUh4cMz68TTEE3meVyL6iVB4kS1mTD5oDbRPn+Hir+9RBCm4Pbu3GBwwrOTaUmEeW5BDliP0+fzjpPUOk23KhK2+xCpJub5Th/2oEX2TRBA3VhpE3b/qWA1aHyadxyCWqbH/L/4abD1+LPOIjoYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884638; c=relaxed/simple;
	bh=TOkaBPJGZ6k+RpuWd1YHXgbXIAitOqBX0ASIhXLKUoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKGvzAFZJ+UBY1CL2QjCD1EOaet412zcj9mg1zfrx8j8RuVP9+Bil/R6xxAyI1wci/30AJ2tKRDy80xqQTyXTtizyq+Y9KM3rgUpzmsWQ75Gteb9zAuLCpl/n/dlMysywNvFetdKFQbWwzCHZ4mKNhp7lY3Otbkk2GV1zIoO3W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYf02b0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hip8oAte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYf02b0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hip8oAte"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YrIi3208361
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=; b=OYf02b0b2CIiu0ST
	cx1kIbIH4y6BaLlVOWaTCLSQ37e1A9VMz/JDYK764JeIDdT31OXJ6i9GztVVNVxV
	ZY2P01e8CfVlCWuUfxAfZCfHTILKVnAeT2JYgLDJKvgswfwjC7Q58jhdt+7ZxEj8
	LkmY7DFj/YEbH1Mcvb+BRZvOJ8wkJtr9Pu0VMDVhcsjoRfZ2jSpMAo46zDLz6TQ3
	dXt4T27WzpNWAund1pVdhDpcyzke4fCAKdvN0JzeSP3AQkMaAca7Glffs2nj0Oos
	/JMR9VgZGQu0aKxaLLDLGdLKp6xxjkotenlliDdaU+Qzzk3oTGWWK8Gj/6P02JG+
	EFGE0g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgs49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7869617eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884636; x=1792489436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=;
        b=hip8oAteb9eF10jj+iUWlrCRKl/WhTaztM294V4OO3U9h0V+x5bd57Eh+vqsTENvyO
         dx5DgaVr2pj6Gyxqv0Zo9WMsVoYijyNpbVpGqG8xxGdcFePG91JnU8xQckvwzYXXOp/I
         5ortkyAHZvYfSsoryEAzFmvA6cEZal47lNs/vQfvuqTHzh89/hpefNDqeMh8/UchWJp0
         D/cv7nrW7d7BaFKzf8NI1SInZpp/scOral6knTyGOeNGgtAfYtRlkxTICdcoB5G5qQqM
         JkuAyva9T22VAFoyElVHuv8YY/0HhvX/3AzuvW5OKCrCB2qMr38lBERA9DEQ22SaCp7M
         bUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884636; x=1792489436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=;
        b=dfQJjSOlOVW69oLGjoRaI50vgBRiO5yFNJWg1QJ8pa4JkamELxPoIJiGLbBxMhFUWT
         YmGFJz1aS4VmHtTYKL/pFjfrQGOURsSLP/de9jtTy9kP/rEI/DDNWQB4c5MvW/NhGe6g
         TzmR216R9nayLzTrJ6lQAlnKtMjGlPCeH0s5X0tf6yaXD7gQVZtKjaspHQxe6+An2SWa
         KjJEVmQg+fsL07gQqU2D8rw9eDyIND7N8EnBgbWdHounVt9ADhdDcA5OAD0xVHLfNH6A
         5aj/mYsxOQWkj2LHwLrkcZm3R/ip43aZG6a01xUdLIBQCP8sALl8p3stbTev8WoYnpwU
         GtuQ==
X-Forwarded-Encrypted: i=1; AKwUvByzkf4DNMaHVE8j4Zgd8bR2B16idVRyj8H65Cck11doKRHtBUPgk3wi5x2jClL9GZDL/wHzBt1q2MEz@vger.kernel.org
X-Gm-Message-State: AFq9FYLJkvIkUCk8vZj9B4QBEMLoeSbGMCsEfXeSmndVqJj7N6X2oNsv
	jKH4bxsxGtbKzgbOKgG6tukmSqXqhz+raVrbU0ZZ+JHj1cMZouyay0ocsjA+4aL5pOMTyWnJmvE
	m9LtcV2MaADlTaK4O7LPYFgF1ho8Jwm7XQqcuOZIHpIZYrWUdEqy4DNQrleGoajF0XJ6ciR82
X-Gm-Gg: AYBFou1Q3tMk8thhNYqk/RJChCzHLilNIirZh6DaS9xJHsZxDdEw79RJQ/r0ZohQutq
	fslZTcnXgG7DQI+Ad0WylZoAZUCGvXxE3idWnu2BtBKNLKPavMB5emMqMmDkGY+jsiNjo0eDrgt
	orK6TMMl19kHpOAX2Lr6D3Ig3nxz3W5A+MHV+EWMWNl2m0CSRgcNa5VSyqCCoO92kvy8aGc1qFr
	q5tGwKQzdpO7dG1pZa67yOwvVuD5Hc3C66HD2QQMzKGDaZTMmWERRZNjl7SIZnwvcJB9PBnAICJ
	muLVMhbV4qxYytSTuZ/vOHWUnR+9FPWW/YKUd4fGExMEoHnjF1lKgAmitKkXNjUD3YJAWZcc8rJ
	VKd2xvhQhp26lXJ3h0rmhRnI30UEA
X-Received: by 2002:a05:7300:fe4a:b0:35c:11e2:cf11 with SMTP id 5a478bee46e88-35c11e2d21dmr3178255eec.2.1791884635937;
        Tue, 13 Oct 2026 02:43:55 -0700 (PDT)
X-Received: by 2002:a05:7300:fe4a:b0:35c:11e2:cf11 with SMTP id 5a478bee46e88-35c11e2d21dmr3178220eec.2.1791884635245;
        Tue, 13 Oct 2026 02:43:55 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm39101861eec.6.2026.10.13.02.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:43:54 -0700 (PDT)
Message-ID: <14bbea09-81b8-4fec-ba3c-5c87bc78aa15@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:13:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
 <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N6OwLsBGRN4R3cxlctXUgX8bkgMo5cU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX3O7nEDvqMpSm
 zCRhAGA1NWsHN2hrHasjK9IS7I1RmVkGd8eqxkS6cuU2SHvgUTbnlebcizTdArFVqlNK/1J2Y+h
 elpr0H4k42S32pqUIS7yP2YLcLrvWalwv7vRE+f2E6Tuc8snzKbTceaKdIAA5/ilho5J9yi9S/v
 aGjTO50RPNSfwqF1DVVlGrc8Kb3YUiwlDupaF/H7F8w9nXT1/t27NR8JXgYQS17Pqh4Qbiv4kfU
 +gTTC61NU8ehdwFJhwNA2wdWXhi9n76Z//BukTxxgIrskvK5vOW2aAgTAsEetV4m8l/v80zrF8t
 LyvhVKm+G/gAGJF6BhgTrOTWliFLxtKYHWXYl3Nxwn2wGftyTP5joKUSU1Hd89R2Ei5JWDteWng
 ioYn2nC8QyP/invKDVXQdft7NTO4cQGQKnuicJtTWvzbl9w1oLDCo8buOQhq9THANb6nY3jwyjn
 kAeOnvcFyq+3mcxhVnw==
X-Proofpoint-ORIG-GUID: N6OwLsBGRN4R3cxlctXUgX8bkgMo5cU6
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6acdfd5c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=zSlhVJGgIM5b3PJuKxcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX/EELnLDXP5MI
 gabF33z6OBW5ybxNpAAvfepHDewbtrVwr275qFF+ehl3moGdfi6tBkl3T1/ogqEwfskefp1b6jT
 0SL6uDR5eW2n3+ra+rge6NPpnrRRanU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

On 10/1/2026 6:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] regulator: qcom-rpmh: Use-After-Free due to devres LIFO ordering
> - [High] regulator: qcom-rpmh: Data race in worker thread bypassing regulator_lock
> - [High] regulator: qcom-rpmh: NULL pointer dereference if delayed disable fires before init completes
> - [Medium] regulator: qcom-rpmh: State desynchronization on driver removal drops pending disable
> --
> 

All the issues mentioned here seem genuine, I'll make fixes for them
in the next version of this series.

Thanks,
Jishnu

