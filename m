Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965E2EB859
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772096; cv=none; b=n26/E92aeqAojWq8y+ktnT2Vhfsg7YSZX+UZf18lDhDJFtLDrRyglQoWC39dNxf+oDCvtku+8eTwnC9prT0sEyu9nVwNmvupUf3HrLuu462tffMIlMLA1DVrFd0o4f5jqH5uwSklHgAY4LWrqko3umatkkMvnFpSrIo18bBkY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772096; c=relaxed/simple;
	bh=we6KjKDhWaiCw1Y3DN0Qx/Dz1R10oeHjWkhFnTdywyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fiqq9we6QbvxOeY4gAG28lj4NraJbN6/r+TPsMn/KBn9p4gLyB7SaSHVq+cZmtuO1v+psasPQCRw62YR0iOIrPYVHBBGh9SwhbiOHqOw1yRgN4psg9OV0ElcX4SdVCzX9k86FU7eYb8LodOfm/UGaLsL2+ob5DKempRJ6l9l5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAN/mDTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch9OeED1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAN/mDTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch9OeED1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PI4w5R2145961
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xeq41+7z/tVXwb/S8mR07X8m
	Ys1jO7mkzHODLFTFEjg=; b=MAN/mDTvVvgqizzCvkCSM0m1b7HylT0q+LF3vtTp
	Qj2eg75SB/1yzAYsw3iQC3rYcNHlzKLOMAiA+cvPQsg2SG1T/xyIB8Yyqp3FFFN1
	9hVbY7jGNyouQtdEcOUMCEdCd4dSIq+Kz8p9/iJpzXAOp+R9SQm2qwqrWVr+B6DL
	+haN1QjvvGQTOlscwGyYn1h+89XXethHp1MUaNGd9WJO0TzMGvBNCFydlpk2gYva
	9Pezslp/nTu4XY0E4EHtolNbpxAbQ20gqUwT5M3InbZxB5ugipLSXPMU0U90Y+OC
	KAnrg2tdZ5uWRUYbSaIB1k4rFQeSsy75FDT3og/+sP67mQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv2xmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:08:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13312be8a31so1629469c88.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772094; x=1780376894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xeq41+7z/tVXwb/S8mR07X8mYs1jO7mkzHODLFTFEjg=;
        b=ch9OeED1uD6mu55eYnot6+aFBsu6znGophNMIveEMlSANRXTwQNiQZnQms3Ziqy1CP
         u8eQu7VYOKcuK3u1y+TLRWvD1Y2j+IInAoGE8bz1f9XAijIPL0JfjR1Q21E5X6PC7J+y
         QMuH6XHGFjCZU1v7xGdgwMKxq8EfYUhTeL51K/U3G4ZZK4R5x4/bKvyD1vvLqqlg8T2b
         WfvZmuE54/4HHg5oDS/glkIMhLmR60g0VsN8LrcJCaE5tMv1e6LmfJjwheYSQrgm+Smu
         uHWF4giiUmku4CWwEmG/DZSfKBo2xvHamvPWG1IbTOiZbWocngQ7jrv0IQwWzJ3rxBgY
         o52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772094; x=1780376894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xeq41+7z/tVXwb/S8mR07X8mYs1jO7mkzHODLFTFEjg=;
        b=AnFv4wCntVtSAdtMnjHPobdtpZ8khQ8Yk2nsDBEmQmo6eQm8khMsJG1J+WkZRrQzAV
         xxG/6Ja2tOSfLOVf1yRViYC3hsZTsjVH9LLXMVRIuaB1AOC6l90W4DZNm8Bh6c0tlrmG
         zkVJ9xOV0mNmxbv7H7ocXabaWLbZfu1TD50cxwxif90YpKXHpfaGmX3aEFFpW4LID8AB
         eSHdDk6Ph5uAY6p8oJAItyebECy7v+w0k9rVMI46ldB+i8RohbX+yct3T0wRJXoBCGqS
         JBefIo/9R0U+6Tg44YLEKYThOW2XWCqx2QAnkk97gCdM5oJzroaX501ZOZhPTyxTnFWg
         U8Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9opUvCk6axv5jAJBfCi6iywiZCre+joJPMTB4PXk8OUnXlrNrhA021S6Yh8IEwU3kXGFa40pH79pI8@vger.kernel.org
X-Gm-Message-State: AOJu0YyqE3kpnOZavlxlrdLMLHYJ7iODqnqseEn6/lNGP5VsV0NjHXV4
	/NcnsmG9IAVz5lubNaI/uDoIpb2UyIOCKtWWuM9gv3CWsiempOuQkdIKh58abQVTr1DhoZ1wkw5
	zfwlmW3LgGnpKEP/L1EM001RQN5soopkHV507pqrbTXtWh15aCfKd3HswpW9Sfwa9
X-Gm-Gg: Acq92OGLeybfBaWlQv2RYhzE7L2KcCFhjPTHe52aLi9wFfCvNg5DkXvztZgGHtGpA4o
	+zUV19bPZ2if8U449iJ314Cc56CV0kzGsk3it/kPNsEY6WPN18atMb61TwPUAt767Gd81B1owbA
	FncuqwzwadAPjbfUp2d+syuGqVdtnr2J1vaFE1i7g3omLLedjmj6UZl4qN48EfQknkS/Cbd58PK
	5hugzEo8vgfZjAQIS6tBTZhhBTpr6miOTewuICNyAaLvfEGW5NNT5Mnpmaw8Urfo6KmhsGUXYKf
	UtNxY8v2ZBSDgcbbknPkCEtgaJHXtxOyRu8aDnhKGz29fvt75hhO1Ph0OLZ6zEvmqj0QPHIm3dc
	N3aWHCZefVhIMSYo1J/ZuNDtS6cKzp15zTLZrGlxLW3BFENInJsH3ncn8kU1EuPJ0XfHQr9ISap
	E=
X-Received: by 2002:a05:7301:4181:b0:2f4:3a9c:8193 with SMTP id 5a478bee46e88-3044913e776mr8443382eec.16.1779772094130;
        Mon, 25 May 2026 22:08:14 -0700 (PDT)
X-Received: by 2002:a05:7301:4181:b0:2f4:3a9c:8193 with SMTP id 5a478bee46e88-3044913e776mr8443362eec.16.1779772093599;
        Mon, 25 May 2026 22:08:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230b25sm12376866eec.15.2026.05.25.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:08:13 -0700 (PDT)
Date: Tue, 26 May 2026 13:08:07 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add initial device trees for Nord SA8797P
Message-ID: <ahUqtyGz4FkXTJMF@QCOM-aGQu4IUr3Y>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MSBTYWx0ZWRfXxjdMK/ofaHjj
 QuXi6Cu4W7bxuaqzGFJGEcYUsGKJErtzXxUPM2R5/24OVgAgGKyPGP3xiSzjx+HWT9mkyCoesUn
 VMIbxQ7wgFecvE1tuzJHzWZzhaozU3MDpVXEKDVyeY+B/4Xj3yvPRaSOBOUDfNwHudyHV8ZKYeB
 KwrvGmf546Vrew2isOmTtcPg/wWWzsxWgcPJOHU0CejxMdzVwMx2npxkkYr6rV+XcsyK80vG/R8
 fJqeCwzKFcyT2nNeRN0D5mLuoiNbsJtjYmDRVfEWFn0QvYzOsBDRqeMkLFPm0VpK9KH1rOWSHO2
 A3Lm7QWwAjKmj2aNbLvUsqCYgQhxIBM4ecHc8E9i6LCi83G1qmN+fuvlI2Xleeo4DYLpic4qrgz
 1mkChCeKfsTdC2IjG9W9b3ZbdEBay+b5Oddd5CtktNdhHGmHBqvAQmM1j09KD0iXpRBdyY7iGlA
 /LvG8KglTFcIT3aQjjw==
X-Proofpoint-GUID: ny0FmahWts19CtUoWFBT_8BOi2NKHbWk
X-Proofpoint-ORIG-GUID: ny0FmahWts19CtUoWFBT_8BOi2NKHbWk
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a152abe cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9JTcp5UHuzCfzI7zTwkA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260041

On Tue, May 26, 2026 at 11:45:52AM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SA8797P
> SoC and the SA8797P Ride reference board.
> 
> The Nord is a new generation of SoC series from Qualcomm built around
> 18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
> is the automotive variant in the family.  The IoT variant IQ-10 will be
> added later, by sharing the base nord.dtsi with SA8797P.
> 
> Dependencies picked up but not hit next-20260525:
> - TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/
> 
> Dependencies to be picked up:
> - RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
> - APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v3:
> - Rebase on next-20260525 and drop patches/dependencies that hit linux-next
> - Improve commit log of "Document SA8797P Ride board" to explain the need
>   of SA8797P model compatible
> - Fix the real issues reported by sashiko-bot
>   - Fix unit address of pdp0_a2p node
>   - Add missing compatible for i2c15 and spi15
>   - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
>   - Update commit log of "Add device tree for Nord SA8797P SoC" to match
>     code change
>   - Sort sa8797p-ride thermal trips in ascending order of temperature
>   - Fix sa8797p-ride thermal zones with identical trip0 and trip1
> - Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

My apologies! Please disregard this. There is a typo in list address. I
will resend.

Shawn
