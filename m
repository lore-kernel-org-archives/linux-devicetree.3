Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D533AEB40
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287826; cv=none; b=Q3b9f4BoXbdysrRGujIBTN2RuASisBQk9XYWvLlDy1qykSmEtnOztPVwniXMYbdZZunM8rJJtIXmlU1oy9HZoAzAHCl6mUzbMZpgN4An3iPoY6KbagfTp6p90g1f9PqdaZZnrZUHY5bodushWwBc7NNVYfLyUJUA8I7XkWNcInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287826; c=relaxed/simple;
	bh=ctsqA8eW2YgTkr/ZrLNiW+2zgf1ef27dlLiIERHimeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3Ru2mbmRGK22f1+iLQB8uuTyV5CIHD8Epon7gWSOji3DlElvJegynFfwrd83aIK46bRVp7/9Ozepmgo+BYVuZaX6tNph0Hx3od3xYv57jooCd0riLw0gXLrZPw5epdvuvLYsfR0Ma2vZZfsNyDQNL/pxeL5zYjB0nZW2mHpqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfM0zDci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tjyvex+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfM0zDci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tjyvex+x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HAT43f1604021
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=; b=RfM0zDci2hpk45J9
	/lmwj59IZ+OVyCnkHZnTUoB5jCtjDfnJkpLgQopZ6HpbxFkdInxHWvOOgJUeR8on
	wTVwJmWW6wdRW1HiEGJaSKdgONwv4fSFyDMp/VP6Q1XnwVg2CJ8thON5ad/WEeFn
	DFbD4/L91Bg7SgVI2L9lwmO8N3FFpbVFnIYjzxn9ArXU4H8ffxruUq2coy4I5g1H
	6A8f2Xywn4/OtPQV4/aDkrHpvpHPvtnblFtBOFQePlynJqrvs8Q8po3kgBUWyaVC
	SJeyszAxdtoacbPDMjRebhjFDuuzve9h30IIjzE1ybfvbcnysNRlrtkloyfHvhOt
	YgjClQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquhupr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:30:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so25435881cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287823; x=1784892623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=Tjyvex+xRYcR0RJws4X0Q2ke8rneXWbBwQwcllu51MiWRBvMXTs48uQ0+BwP+s7itE
         4nEk/DYm6QkIVRN2mVYekACQU65HFbzwRoaAQpYpo09iDxW0a3arUIV+rVLk3aruoun/
         7nlNbMu7D2StvtiksFaRcx/3al+M2GCQ6VPMAT2CLJOQ6vnXtk8ap3wI+dUm4PX/c3G5
         JwHume9nPF/EUHomoaC4jv76QgcDanSerRDBUX+RwBzNozXpmvnNdVfHxMS0k4ByL3kK
         bOleCnAgrZj75lzn7li0ktGICw74L0Pw25a7wrD2U+wR/rM/vKH7HRvbtugeSVtXj1pf
         xQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287823; x=1784892623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr9ahte4gVexpnMGm8Z28hPfzVF+lobJDJhET4dQ4Bw=;
        b=Vq3aLYKF/+nXU5SzV51tYM/8IJ3fF/XpSupaF0ByMMOFPuYclX5sLVRo418o01r+YQ
         UKPHYFVcpqzZSIiVnJ6Oi+LEzOoG+pxqL1lz65/yl0uWseD6mrf5FSBTEtlR2VVzhK7L
         f4vMOBHaRIjUR2o0WfYzNOvsTA1S0RQX/44c5oaZ6LSWBBSIZ63MfpRj1cvjnctZ5xlC
         iSGs/NPDM59QHcMhS6h3CojHyQILkjIjGLzgDr78GR5WuJknUl95wjXE3mDLzxRS242A
         PHKWaLp1xcNZW5IgrZSNNABNNZU1YxMEY+3rTQjwuWwINwV/ijepDSzDfDEwvfNeVXaq
         xuag==
X-Forwarded-Encrypted: i=1; AHgh+RrLf9CXIQx+Y55/mvm7LL+zVG+/6hlJHjznA6XX572hiabQiOavLBXNSTQD4P444RWWEAobSoegSgW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yytgws5CUEH6AbC1ecRBbu24xQ0r183nk1JQkz1qw07t3EydC5n
	Wxn5eoBLKNA7CMiNcfg/s7iJonJ+lVwc8t2xbapEkwutIeIywBHxKzpQ+e/FrmBQZrxY1zh52ZZ
	Rfit6xo5I+Vy1q0kRsfG3qhdBZQEhxYnKZWC82qRys9EPT9zQJelIpnZlD7Bjeojv
X-Gm-Gg: AfdE7clPoqlhECPyycvnw+fnH/c75KvHnuyShhgCC9W9SneKPbaldf0OIVAmyXmMSof
	aXrEG6qxRRQkdxn95494Al82/JP2XXt9HY3kKQjLjdK5x2sC0BDQLCrnoPjrfmmmxift2DABVsp
	WLidrqzZAbfQb857prN/4UNORb5oHhqnGKtUqaMdxTSouztfFhPov/b5Zv9jPF3SbGiANBo2OEV
	Tcj2htLdN+HsWgKCKWYk3atULrJ7HNJ+v+MLKJYDAYyxp93mE5peWcplqHjakXeUfNJdKNPvHC7
	nxAEktcbZeTqAuTHEjlMS4SqjefEQOuxe0dicNL/mu/v3rRDdP4veBmkFEmP5grTlo34PZvQN+q
	VnQDlK/CS3ocEbXbOkqLLVkwi
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545741cf.9.1784287823456;
        Fri, 17 Jul 2026 04:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:51c:1744:edf0 with SMTP id d75a77b69052e-5214034ea39mr14545191cf.9.1784287822904;
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1735f20279sm58707166b.53.2026.07.17.04.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:30:22 -0700 (PDT)
Message-ID: <43944722-3eeb-4e02-b3a6-6251d5fc78af@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:30:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e643NlbI4617_O6awZN4iVpDRDKOpHBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX1rAVJhVQaL7K
 hByKTtAJHGYbcykjQZO2se12uEqtihcSGeIzbYIZ+CTVwNl/A4D/qamM3jSxihi5p0xXnNQpYUR
 2X+y8q5ylR1kCGnbkaQjOXpWtoLS0azDeB3ejMsC9lj3JkZYaTOFiAQgpel84k5z46NZV9i//uw
 fGRVMy2bNxU1RpU5R3jSCCPawI/kXZeteoOMtSsAIsZV/ZaoCRaKIpvFPI8Y+gRWlDOvKGINjuD
 lfbXaeBq1EIbLMV8g6KAedBQd90xtOYBp85kxtpSf9H5BOoyIQOKADpnFWBrMFM3HTbMNb86KOl
 Ad5/qheJqNsqm/u5qUJDAR4TXfinGzUqWh+6mxj3+lW22fFOVyQWiEqy6iC6pf0dZxqmU0+Rk7N
 9UCc6sqZsT9l/c8PAcnWGWnYPj200DHoczly10RWiGxP67GZvtJEZi/i00alOkTAwR2KnO+2gBo
 kGg7pX+xQ0cnTXAWr1A==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a5a1250 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-lbNPa_U-NigBoBspYsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: e643NlbI4617_O6awZN4iVpDRDKOpHBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX2NE9TmQKcJ9Z
 KJFpJjDshx6xdeoos2E7UqHrLalac3+Y6DnnAR7uxua9AjHNL0zzhfsnrbtQoA94/Llo1Rgf/dv
 HqlXBnGqAXGbrnKh9KtnLauYVA/NEU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170116

On 7/15/26 4:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. The primary MI2S interface connects to an ES8316 codec for
> headset playback and capture, while the quaternary MI2S interface feeds
> the LT9611 HDMI bridge.

[...]

> +	vreg_es8316_3v3: regulator-es8316-3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_es8316_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&es8316_power_on>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Does it need to be always-on? Is it really on at boot time?

[...]

> +	mi2s-playback-dai-link {

mi2s-'c'apture < mi2s-'p'layback

Konrad
