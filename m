Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76E285CAD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649459; cv=none; b=Spsy+rImxpOumxQKoAQYt2TMdHJwTScJHhQtk0LybxO9e9gIL0Fj1bMzifYc5jWroU18IhOyEoqKexdCru/Rrn4aWA0yNDPuAIzAS3y1CjjPWhV+7di7MX6t1Qa9310bk7xoqW7hXUbyQf9zulSX6NCmZgncU0nMl1dgqZYZq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649459; c=relaxed/simple;
	bh=sbIkMcyBPUsyumhxcg1yG4ua3ww3bZD1a2AyBNbyC1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Wunl6ObET79O2R6ZiWFgjA3Gq7c8UPPHu0w+5HfEEHQrBASJ/8tTqG8PG7UC//4DJvWOnsoT4c0hkRFK8YH6opjh42h9L5re1iNTHVbb2tjlm/z18I4+3D1xLPQqO0h8VCN3Tzh0vPDc3MAT2ZyJF1y4JR6wq6PFb2MhVkXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7ocLZcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHqj5lFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7ocLZcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHqj5lFx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9OkOE3599289
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hB0D78KIovgBc2EIAjL61fKb
	7egf7gVyOgoHTC7m6SA=; b=N7ocLZccV1BBJHejEUysxxVozYVHrzaE1fwEN0+p
	sqYFnLUAzHMiPD/lZ1NaGCD+VhhJY5Ei2G86810lSkJ3BmhTgsIDOLuEktoMeHHX
	tlg0weIC8dUr7fGrRvgS1K5GYQuE4/Js7r1oICtGYp6RpIHq2XMDOq9NaK17qFZt
	lNQpoWms4aid7hKUXHPw7cMw6rx2SseSrgS2JFApDxXr0hVsFYhBebvI98YvGWxl
	R1PuZ0f9Yl9+A30LOS0IytfxbRiHwRNCccYS70DQnU0QnlN7QEW4qDn4b/lA5HN4
	/ZdeP99ONTCJ3n+HysXXgJlNScjMZMPN7PCdy0lHfePCXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7tr10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:24:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92afdda127bso449458485a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649456; x=1783254256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hB0D78KIovgBc2EIAjL61fKb7egf7gVyOgoHTC7m6SA=;
        b=PHqj5lFxL4WSi1wp+m8bYtzsWgC+j2Rl0oW4JyG6IlLqhu6+AaWbhmZOPJRrdTuLQW
         TJz3JVqC9TnemYKXManC/aLxN8XP8r7OmJg1PPFgCFEXiZwx5vzoQqsKGk0L92lzLNHz
         UxModnj9iz3KvU7w1Lm8keLjfPXnagDhuUvYxa/fkFCKc74fMBPvj+QZhKALs7Y6W9uG
         bmFP9FbuhEOQmuXE3lXJQrDvzhMjcTPjvl0eTmJ8iuesMgM4U8/eeXYp90yF2ygHrau7
         LiJOWq2O+gulcm6zVcFr4aUwa2esV+Dti3v3X8OAIwKrWTipN/ncDeHNgg/2MjMMNkUD
         buIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649456; x=1783254256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB0D78KIovgBc2EIAjL61fKb7egf7gVyOgoHTC7m6SA=;
        b=fLW40qeXCRlLemXeW+Dj8WidkD+cH2ovGk/oB3q4sgpEmshXUcRPRCZUTUTrYnQSFH
         Z/MvRByd2VwIjx31tKdEhS9X7ex1hO4SCW4bqESdQOriAht6g3A8d1EIVWnpykYDWOVv
         Cs+0zPy/gGZ1PiCXxCm0epdzD0XmvPd5JjgDyLYcWXrZJuRhN4EAidP+3fILC08Re7FM
         JFFddNUd8ZWoA4QIbScK1rzDGuugXe5Kaqk8+lXEcTTs82VQSSXjQ7yYRyGR/ucJ1Jl+
         fZ35s+J74tMOnM35xUNbpYGKggHp9bsL309ER3NYc7wYHzJaiddSrYWSwEG3p3GAGFef
         c7sQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fFJJhPr8moRuZUmiYJ39dqRSqImxl8qjPJkiqhHiJw7VACP2uJklUz5DXfPQg8xZfZ+AtGqGAY1oa@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZ2Np5Taqu/CbYjL4u67Ixu+c4zZXSC9gzCX/ibEu8ip0cbBA
	qk6olVumaQJGmhB+wMTdTygR9/X9dPREkAJ0L4pj4YwpBcSsKL8UwqfJMu2MZYHzdRLPIBVVkwQ
	FYITs7PWKSubukQSq20N94+Om50/1yuYtbqiHS+s7Rr3WGeHgX7SdXJslX+BSxyq0
X-Gm-Gg: AfdE7clLUsPQoOUSIAZWTOskdTI1aY+/jt2ZbZMIW1Q5H5qm/Uk+ehAsyQ4LTm276tq
	XPgtUmOxP8E98QB9Eyr5pKwv5iuPw9+qdBn9Fi37qBCU9SlJmaGIJJknoPlug0OP+GSmobbqmkD
	KAFwIaP18N8WrBHfkJPv1VZgPXyVeDWebWJUJ9m5hmoU7Mc45cKtwkVQxicZM5JaYQ9uh6D3Tf6
	xXKdwVWY2LnEpGNZKjpvmtxHUZE7cmGUPDpDkxfGJJ4R2IXsWvc75qJl5VU7ZewfK/btvHyx4RR
	8E1Sj+HabBjJNRGRTwN6MLcz5Z6zEjsmquc5rtIUTwNzYq12sLMvBQj0zcTslPVKHe1MVjlYrmB
	JywHqzUcLjcajLju6CTEZ1tRcZyeMGhci2usJZZJjExQD39O1UX/oBzqcwf1ArxlKJT4N7xLp80
	CoIbW2qH2NLHDCXL8Z4c+YC6+Q
X-Received: by 2002:a05:620a:2684:b0:920:798b:e2aa with SMTP id af79cd13be357-9293d5b26admr2140615585a.26.1782649455961;
        Sun, 28 Jun 2026 05:24:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:920:798b:e2aa with SMTP id af79cd13be357-9293d5b26admr2140612985a.26.1782649455451;
        Sun, 28 Jun 2026 05:24:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb139201esm923603e87.37.2026.06.28.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:24:14 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Message-ID: <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX8xK1Oug8T3uH
 QtJGIPJ0x/eINnKqltytwugZj/A7BnBpJoe1wHDy99vd94+WjC9xz5TcrkYI7JuTVqt76LHrIon
 zW600H7GzDnEdwEbzugxAfVe6pBs9vOZX5L1suEdL5quM9xp73dBRDS2RkZFaWbKvoEc6djlq4n
 Jl81Bx20qFJ6LgaHC1LpBH7kCcOoBPnh6BuM5fkqFSr0XpmEToyAhc2Wdzei47jM7R555YWhaSj
 1q+8kl9CBqEyDfKVqJdLXJUIK3q872AmNnRLO9pT0eQmmAwCKOoteFYqNbE0/Grzgp32c653zO0
 mfEkbp4kvvjEHe06abWuSlYqGOOLF+ykFErZREt7VAf55YhKyMe0JDNTHM1NYaZ+V+FPjDzjQUy
 KgkNBUgwRC4TcF6rhsfpadIf2z1FJ7Bx/bMycN2ad+TlpDm28aRV/lAS7HlU/mAvacaDR/90hsX
 wsR9XueAU9bBEGwmJaQ==
X-Proofpoint-GUID: WEnt0p26rs2-TLh-qLao9rE8KsoGeCu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX3aY78V/ZajMd
 J/1Tgd4EbYBWbk1s90oNO/FnsrWrl7C1yZqk6mm96bNVvP9hHfL2iAcDlD6/CjQBagI8oKnouDL
 Ji5g9bsZRB795s4UXjJi68c2F4Es6TQ=
X-Proofpoint-ORIG-GUID: WEnt0p26rs2-TLh-qLao9rE8KsoGeCu6
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a411270 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=V1VsDmVQltbkEKSUdJkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280109

On Sat, Jun 27, 2026 at 03:31:34PM +0530, Nabige Aala wrote:
> This series adds display support for the Qualcomm Shikra platform.
> 
> It introduces the Shikra MDSS display subsystem support at the SoC
> level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
> EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
> support for HDMI output.
> 
> Nabige Aala (5):
>     arm64: dts: qcom: shikra: Add MDSS display subsystem
>     arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>     arm64: defconfig: Enable ILI7807S DSI panel driver
>     arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>     arm64: dts: qcom: Shikra LT9611UXD support
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  arch/arm64/configs/defconfig                		| 1 +
>  5 files changed, 534 insertions(+), 2 deletions(-)
> 
> 
> Signed-off-by: arpit.saini@oss.qualcomm.com
> Signed-off-by: mohit.dsor@oss.qualcomm.com

Unnamed people? This is not a valid SoB tag, FWIW.

> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> Arpit Saini (3):
>       arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>       arm64: defconfig: Enable ILI7807S DSI panel driver
>       arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
> 
> Mohit Dsor (1):
>       arm64: dts: qcom: Shikra LT9611UXD support
> 
> Nabige Aala (1):
>       arm64: dts: qcom: shikra: Add MDSS display subsystem

Huh? Suddently a different set of authors for the patches. Please clean
up your cover letter.

> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig                |   1 +
>  5 files changed, 532 insertions(+), 2 deletions(-)
> ---
> base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
> change-id: 20260626-shikra-dt-changes-8d127be951d5
> 
> Best regards,
> --  
> Nabige Aala <nabige.aala@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
