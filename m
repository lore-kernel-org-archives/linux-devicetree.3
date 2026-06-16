Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F73446C6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617520; cv=none; b=q0tDOHHyp0QOJ2bV4k9z4B8SMZFAM2/uZlN7ripfAZcZdiQGqsyyAF1jdOc/G9+TulH5zYxdGkgZSogOf3SiW/DsowebqV8Nx4d7C1YenyazFDeU6gAS9zaM+9CCRy4RkqOcA59tyKWrsdWfMkktjd51UTDF6Fg314juSzplqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617520; c=relaxed/simple;
	bh=LRIaBWeDz9XvpY2K2lqiFjzIrt3vcupGzjCDyTLA+Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDhCU4KASwmOZVdBtwT2UqWytdjk/h8AUzy9HHjENzHgbELFIUlDXUWyhLOm4r91uZSub1hmXtwCp/0G/8QLq26FgiufCQZuEpeV6lby+oXa/khnX1iqM9ZpKjfjLx5b/TKkaiVtIsGNm+kWd50lwrrDv5+HE3MDrtS/g9FnlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnraOnxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/g0NmK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnraOnxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/g0NmK+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACJxa3411160
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=; b=gnraOnxaePe0uwcW
	fMNONOWu2c8T4AgkeRo1zRe5TdLRDXTRSZdLr3jk8Cvk1lopmGQcy7u84GpSrmqC
	hqvenMoYYtBA7vkowH6OiNBH3gm56yayy/JJk/zy3/07pRnKEVphQJ0/ctm8Dj17
	+p2FvB3O1i8vCI32FgngExrvMhbAp5wyDXPyId/wnYco+ArDmwEHyab6HSDzmZSY
	bBJNwqZIMGLNDDJgHOjHhio5fz5pnd0BPPbW9l3elLq5NFYnxvPNPPB5Oh0k5HbZ
	vzJG6yudQphewCrWROzarE41HuRBoIMwJ9CjDnbsNQIAJxOi+g+vGPfWqYMBF5K6
	KNZtew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ga418-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:45:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915976b2dffso35062085a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617517; x=1782222317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=Q/g0NmK+pCWeiAu2CuzhteNDeEHvaihYXK3lnz0kXyHJv3l8EpXHSaSJBt/ggmhTsd
         HBil8OzTN/35UO2PbSVQbXEwyjXV2LW8ymGFCvvyrvIdhPPfUynZEXgL004zhYO3gVBi
         WNMzJnBeGQSkT04axQ+Ir9cp00qJhuvSkSnVtY+HvjhSF+cfRVut9nIVC0Kl6CAI5TiJ
         xCzHgFGujHC37knASJcVuj9dMhlFjZRDme6y933bBeuUCKicCtAV3kega/hi9vB1QhOn
         0u2SGuh4b1bBJIlpdoRYk9F61BG6THOzBvNnH+q2mlGLWUrrx/VAFNX6IPMhs5FeEV5R
         xX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617517; x=1782222317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=OVlSteNoMpabiQ2DyAsaGcFdS12dR7oz7JNBcyBl80r3xv3gqJXVsgGmxengAhhViZ
         XAOkp/2yiiLVPDcPM6N3CikJZyyQOZh8vlvzbHcDlnlgKgNz4LN/JKAM4uE7vzbpgdnG
         Y9mk33O2BOTRfGHCnIPxU/ucqsjmrPdxQqCB/Ieu7YJkQnTqm7RnYGPtbw/+Y2vL4m3r
         GP7Qi0LhyPHuHlKRrw7hBQbqvuB7exL4DNMTUhdfIO8P8xclW1H90vd16DMmKu/2SBjI
         UcYtSJnItk376zoTil4S8oYmOvzc/FCfuyqRRnXhXMDOpnZX0QYHvWyUS2VVQlvS3SsX
         Jtsg==
X-Forwarded-Encrypted: i=1; AFNElJ+blx4MxR1cWdh6ZokYeUXzsgWcB35hWy/lDNhVZQIZZqC5KvqzP6S0pC7ejxa3aszn32mJzYlRsE9y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gqIHiW6nbpZWHMvq8qj/yam1WYYVT05BznpxMsqeJxzAlVu3
	02Fb0xcau025XByGnHBT0RFehqGWB6ZwfHhqLFpjuQ1qrX/LS9RiZv/lybZM3R1pQyj1IIKFVU4
	THmu2Wxvjj1ADg7cITPHH0iihZsYwFndVZ8GF8BtvCIgz1rzLeRsDZFLjX38ALxK8
X-Gm-Gg: Acq92OF8dh2ZfBJL3TbZjpdnWyeCpmj4JR6Syi/XYJdQ/zbn3rgaR6vlPAYSmWxsquc
	CNJkoe5ErbRtAjKJzfQqyGdL1sbjX65w4e/ui63LHAZQVnYvnHpFJl6kmJF2ICd10oupWM4nc2K
	MG/pB9SnE9xbz8G6rRMDyqklmmH/ZY0zgTXxbett+OCTr1ZH5Xs00NAiQgoU7SFY2fNQXWh74/O
	K+jSSCCKKJMDKMS+NpUSEFP8Tl0jXqhdCRv0SN/OARx2Rs38OtaySVBMkVYDmYSSIUHMjLMPtOB
	sRRNRGoYJWFq4/aA3i34a/iOQsoaLSzkUq5wysK/+NLeEzdhcGx7Zoh/JpI1t1SiMSrqwQY9yQl
	C+N+JSHYn0WjYQkW5y+Vo7TxX3tD6ARdB3cltUo06oRWKXw==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393885385a.3.1781617517218;
        Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393878585a.3.1781617516736;
        Tue, 16 Jun 2026 06:45:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm667680466b.13.2026.06.16.06.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:45:15 -0700 (PDT)
Message-ID: <46bc1a3d-37e0-4b8d-967a-950cb3a48200@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:45:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX2AMFmI+qrliC
 SjKuTZpjEHH5zlSk1QnNinCQHGx+q+mlr7bnmRp2XUNrtEGBLtOJKWRpK3dEt6NdFA54AL8ZyxY
 bUsO2la2QGQoVI+8Hyke+gvcN3kfMC6VNM7Njb79vJygYeXAY8vom5Gg2+hrL6iRv+Rl0kbMZq9
 SJ9048w7l0Cue/5KL6Pg5z3KKQdHaU6UaUwODb35fPMvDGunXgX7wGtUJ8aU5MPbQteHB6k4AgS
 0Kfca0Z/bre8mWf3pBMWZVJPnh1zKjP9m3Bd83xlPghF8yFP2EgzuH+kGYWjsw487pkJMaSFOdJ
 sLbis49cDAALM8hvej8GnJrNsoNXmdF8hglSE2FU4JRZn+4zHqLriNg7WMPddHUsHNuhVPWMHJx
 7GnDuR0quQ7/FQdsyq8ZrIYWt8zZ9omCpNDo0I+iK5wjejG80kXyEx2PJwQvKpYm+psZbnBgWok
 4HnvSsAcCK1rFTXpJVg==
X-Proofpoint-ORIG-GUID: wZKS2VLJfNPuuAALUGFRBWEZOb95AD6Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXxvlwpKgDzuGJ
 BgSgCMj+mgZdmwIkWjo0WM72FOLDAYN25Hvy7hdAe9KEK1tVIDLrkCTeOCeLI0FuFFwcHnTsQdL
 UlXa1O/CimD33ggBMO3YSYIf6QM1ZhA=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31536d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tLzcpL6T6jtHObjfa64A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wZKS2VLJfNPuuAALUGFRBWEZOb95AD6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
