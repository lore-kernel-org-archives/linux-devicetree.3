Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6D43C056
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682834; cv=none; b=JYN5rz74fhd/LamfW1CMzLXGvWsGwkLernoCjqKxtCqSKgD8XGTHMRxik2GyjDhFP8riJol264MwhgVk7jYi2vrqSoBhr8uWUuGr2KXYJ3U2Pt11pXpjubcpwE7VQjOq4bjFTir0AEdlaOaLSxxDD6sgaojQvSqOh1VKd96Pygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682834; c=relaxed/simple;
	bh=2trH886MfLfuFoHZsrAJOX3OMrZrPn8DhveaaIce2Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ9bf8SJm6Est4TE+NMDKvEtXz2gOP7f4H/4JAnUTYvTTeOS8i2x5ssgQ9yG9D3grC4LlrtI6UBuPFfXdmUrgsoM1IWiiifDCF66SHqmxhz+gf70m+hVpQvGWEd3akL7AZZtrc33IpkKEvVXAuGdl0cUoP5lijQSyHqkuoFeP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyTHKO38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OziaUvQa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyTHKO38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OziaUvQa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVGZZ3430122
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=; b=cyTHKO38kskLh5I6
	p48lJOasi0t+fKZVK0LvqH+ukZiGJ5YfmM8MX2j6rx/8YsETCQRGb1d714dZHY76
	iRTm9n/pU+tAHmhVFqnOBcoklfhSqdCtooyP+mGw67b3WujNTBho0tiTtIfvtNGM
	Hx2ahUukboeIg7SIoQhpnNP1wiw7hfeVhRW91ywnyIhk0lF7ZxWDbWGDDkb5tG3P
	hm75y3bVEB3nOk/22XZPXocSx/9bdJR3oAB8y4Aay2b5CvvZ4t+3Pe8uBRpbKfEc
	/udQAE4LeaaFYAh9/tlMDmmZLPtNlgy6CF5o10Im0oVXC7j78MdwCwmhNZbBeycR
	r75rzg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgw93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:33:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313385ca1bso3179974137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682830; x=1779287630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=;
        b=OziaUvQad2694yywjUBlFSXgWNiZHwgwDekDy3xvUOiXSdwVn5WIolduSE9PodXwnc
         5nCXR+SispZCJpOZB3SJfK90wCieTpaCht+gy6n5hTZsUuKXccEf7UWEneCvHFbvMvCB
         kRs2QNeCxels8tiBUSO9sc2Ojdf53l/kWbAvkyCxERwARBT7MoNVJFJqLUvI7YGMwGW1
         RJpI3rteRNdNIEWebaxHCBq0T4Tsreh8rvTbcMfmbcJckmXuHwU01IDzmoQWJTZfJ9AK
         zfyKnD2kNaDcn12ZoDtnTMYq94OpM0c11qH2uciMT4SMv7C28JRG9PKXmm4OlOX0qs6A
         K2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682830; x=1779287630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=;
        b=NZgI5UExhi8Jvweve3pVDTxlAzsN2Ym00cfnW5XO1nN+xK8JbL4cl9/I1YlNWlSpC/
         DD5inQ+FB9fp8EVDJQLVCE3EubKrl5dnfN+9bDrHA6nt2mBknMomexeOmh6e7oGtm2Gq
         PJmh2QcLIT39lp6EryeFAyeasecU57L4YiIFBQ1/JjPWxLQGYUePfsF4UcLi59t7LA3l
         LIfQYx9aLw+xfR8k1uDYyU5x+N950h9Pk3I17jI2sdbib8Ddk2alOUY7D6wl9rftu6Wk
         NO2M4b1DI+fOh6G/7y25X+bQGGkEmR+eHNxBjXeRKQGBC6ZvW6MiLPSlPYuncvc6epRO
         UiaA==
X-Forwarded-Encrypted: i=1; AFNElJ8cnavlmQW+MvCDDjIcerh75o4q3HBva39w0UwNFKy+iiZTP2RJ+7MUMw79vdVtJ1hTWIxfNT7D9rVJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wcFWQ8bSXPhuifqRzve05ovkK11ssdJQoUhY8KggaA4dyJF8
	EVNBQXHbwvAgLnjalaxZD/yOrsfqQiI0nZpre8ihVJj4/vlwitgtjmD8nbUQ4h+ftnJXzOTt3Ef
	7LS9j08EEQdMn4ZRSjTVkBBY94PN9NB1S1ZlNoBA567ONXzIIXU7EMzpqN9gezKIF
X-Gm-Gg: Acq92OHqyB623QeHCu/nea4fmcP/ZTNlXEGBokYOfI5v1MD8yvfvKZpoFtf9smnmCAG
	12J9oXn8d1ZI24pCvqRP8XnArZJsYebYzq+hkQA6uGY8gVeGmZ6gYSMw0Cr6LGWLqhooiUbJ1J2
	k+y9iSk6xXOWHxAt1BlDw6nIsi6TE6a007sGvLITOprDx//4yiJXO1pueEUPYTIN0dgo1cHbI25
	KcGHFgCr7TrFVSKjdy8w/nAt55M5GlUNQMEI52kt/tF3EI62naKIJQIVNrbydv9SnMrpg2dTgri
	XakfYIqf+JhTkJyijGKE2+G0sNT7VIDLixCLtMJHWiKTX7M8SARf6pUjT+pXHwidXtPsdoRaS8M
	oJ/RBhiAHFNLFmn51z/7a6+E5Ar9qtYW47IjhorKTPaXJef9bVhKx0mAC4PWyHS3dGndAQRDZxn
	vpHMhzlgF1mZ5Dv7s09aq5zy1Hs/4B4Kj2NF0=
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1347959137.6.1778682830176;
        Wed, 13 May 2026 07:33:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1347942137.6.1778682829682;
        Wed, 13 May 2026 07:33:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cbfc4dcbsm2307502e87.16.2026.05.13.07.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:33:48 -0700 (PDT)
Date: Wed, 13 May 2026 17:33:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
 <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
X-Proofpoint-GUID: DI7i_OxA0aoHBIMxWntNJG1da5LPryQw
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a048bce cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nxX5gXaIHGdBwnkTwtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX554IRO/cJl7A
 AS6M1CyLJpfKTAXg4NF6Zmux2+ouVXWYA/j4G1zDKut9rnCgm1bY4lnnjpVvXG3KeBO1Lc8lqmy
 LYbsYnL9Nfr+18IvA0c0B7/BjchKPzybRKe5wcoAfHK9FYr2knx164b/rl+S2+p+Tg0+bcwaZS1
 0GMlLVgDdVnTSzMr+uCaVuJZTmVhnWnBwm2ay2LkMsSYzmA06TmcDNxkqVtx9Mabq1x/uX/VB5C
 rjiCfu0gBOgs3T8wDm8lJv8DWTLgVf7AIIhVY8n3WrCyBNTByHrsWNEC+fzsvLg+5tEVR/kKzID
 1dVv6fA4dT8WjhFxpDuK7NAQIYcjlpmtTiDiiKAauBfwd+s9sKlJIOb0pevTdVMEF7lPp3azxKK
 UTnJJEC6/RaR6D5pQqjHdOeDoUiH6SXhfB3OKujf0bJUEVeCYJR7QVe2iPpP3uukO2aPCb2NosU
 kx8LsOU6vVClli5vq5A==
X-Proofpoint-ORIG-GUID: DI7i_OxA0aoHBIMxWntNJG1da5LPryQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149

On Tue, May 05, 2026 at 07:17:17PM +0530, Umang Chheda wrote:
> Hi Dmitry,
> 
> On 5/5/2026 4:58 AM, Dmitry Baryshkov wrote:
> > On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
> >> Hello Dmitry,
> >>
> >>
> >> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> >>>> The monaco-ac EVK is a new board variant which shares the majority of
> >>>> its hardware description with the existing monaco-evk board.
> >>>
> >>> No, this is not a good reason. Is there a common PCB? There was a long
> >>> discussion for it for the Hamoa / Purwa EVK.
> >>
> >> PCB is not common for these 2 boards.
> >>
> >> Also, not sure if I mis-understood you - You had mentioned to have a
> >> common file for both the variants [1] in the earlier version of patch
> >> hence refactored it this way.
> > 
> > There was an explicit question if PCB is the same as a prerequisite for
> > the unification of DTS
> 
> 
> Thanks for the clarification.
> 
> This was discussed in the earlier v2 [1] — even though the PCB is not
> common, the majority of the hardware blocks and their wiring are
> functionally identical between monaco-evk and monaco-ac-evk, with only
> difference in H/W being 4 PMIC in monaco-evk v/s 2 PMIC on monaco-ac-evk
> and the rail which is supplied to the SDHC controller.
> 
> The intent here is to avoid duplication across the two boards rather
> than imply a shared PCB, similar to what was discussed earlier.
> 
> If this approach is still not acceptable without a common PCB, can I
> drop the refactoring and keep the DTS files fully separate ?

Judged on the previous suggestions by DT maintainers, there should be
separate DTS files.

> 
> [1]
> https://lore.kernel.org/all/8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com/
> 
> > 
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
> >>
> >>>
> >>>>
> >>>> In preparation for adding this variant, extract the common hardware
> >>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> >>>> include file, and update monaco-evk.dts to include it and keep only
> >>>> board-specific overrides.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>>> ---
> >>>
> >>
> >> Thanks,
> >> Umang
> >>
> > 
> 
> Thanks,
> Umang
> 
> 

-- 
With best wishes
Dmitry
