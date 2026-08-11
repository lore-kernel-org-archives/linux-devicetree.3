Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E233429016
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439819; cv=none; b=aW00Yrxou+oNHn3L7i4pvHTGOJaQGf9bcB38m7VMD/IjCmHqOphFDCtJv2bwslsvJ6gGxQUeJ1+5rf4Zbsz93cZ5tYp8t+KfLWu/u578fL3AyGxyjDCBmzyWikllB2B8n3Xozj4iBBmwtXuCAONAE+EQEi7w3uBHWCB5r786RpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439819; c=relaxed/simple;
	bh=Nl1wffsWKRQ/B1SUEA8s8v0wN92Ql2Dc3V2zBOoiP5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5OLB/R68GEIV8YawmK+72gfynhUYomp5QErQvzJ9qFv85KlAQ7IxDkVLvYixedpS6HZhxdymXVpp4tRe+1Dk1SDkiKFUY7u4NgnslYNQ8lOU48UHAvieQ0qSWacTtnsqbTuwwFWh1fgfuo7yfZq8LNkvn8b5++WQ1rMRktoQZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9JeDeC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOne8TCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9JeDeC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOne8TCY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B43vhu3320894
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pyvS/7fuxI2i5y2pp6Uz65Du
	i+eN4afnaMFMH2Z7u3k=; b=B9JeDeC6C8fZ8ljoQxRdgchTrm/gsOssNMwPf23T
	fj7mVIITbMWdpeDctyD4FNEF7BJXh6NAsh0X2/tM7HuxKlT0ITXHJJAN/eLS+Vd5
	DUPINbn5frDQJgKHF0jhdN9YKJlg63qz1l6cOnfBBNczbY5NSlkiB0b4JKk7eELE
	+x0VNse6I69FAGVnhBMVkA4odiY5H8OnNOr2RF7py1zt9Uo1wCQznpGfAvCKLieR
	Fgjpxd2PUMBL1oGX9pC+ac1e+C+rKJCpsXf2xv5gP42vCl7ELbvpZCi3dbd0hfdN
	ASXm9izz1MwuTDsnHivgMR79EQqiZWszFmjCGndBrqv8ZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr93xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:16:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso6397986d6.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439816; x=1787044616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pyvS/7fuxI2i5y2pp6Uz65Dui+eN4afnaMFMH2Z7u3k=;
        b=UOne8TCYhQnHen0F+NKfUjj/gbMaocijjdydmfBSA/SQf4GGeKRyZmRBoUX+PMkTVb
         M1Ihtb2Flj73HTS+0VccdbjfzZuxgBBthSFPIXmU+JVtIaaXiTQAd8v/bEMF8+vl3X0b
         BvVR3VqgFk8cVdyFTy5j5FeYauYI2NyNBjsDdHOGkhPOI7QAYUhyCbKb/MpY3GoZL4Z2
         Y+5IxxHCFkWDdSTGFRaRhTLzntSr35tRUZp8xZpyFJC7nn09ZEt6zR/XiTWI/PBuwqa5
         HQSxAZ36FGyMaHUDklmqU8an16YjgXLCCCwRVZx1hYUgr1wg0p1NwD6ORtcO3pCMDNxb
         lxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439816; x=1787044616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyvS/7fuxI2i5y2pp6Uz65Dui+eN4afnaMFMH2Z7u3k=;
        b=hW7zaZt8U8s0e5/v7qzFPuvoV5UN/2kdv09Io2xlCu9YFuQZmJ2jOEl3zTiY1pIITD
         OnrP+RL2T5oftaCbhJJwY5Ou//OEG11KgsOaHfk5g7XEGo+iN4TOqPnwrv7Hg4Oi/sSW
         eVR1pd8UwjERuKk6Vrg/MB1MhzuH/K/MMVhiW2YomaU9ZoJjiAfhzNrHDQ5cMUYCyWDu
         ZFlKF5DmKgXrPWACixzCRQNrQ8gNSfuubamMjkc0KLSWXKINAslitoHKom6PbtY/2RRK
         yZa4/5+ULLJMquyiuFrvLUXmjXzpzCcWHDA337UFWlRjstBfgF1/BFzGOYh0q4NNaU6y
         2IHA==
X-Forwarded-Encrypted: i=1; AHgh+RqwoCAR0QpjaQiJ6mdhxWdF4bvIKfnNzD3AxzdWIiszRNJHWEyAez9lpZ82C+BZ8EZZyORbkosuAtPp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KroeehkPczb3N+ae0dv/rQqa2J3gu0rpK1dLMYYdRvCXTJcU
	5N1ICp4FMyhPvMgmhbWFJVb2qzh0tIsBxMHtLFs8hPwTYOqXKja6Fgv3s8J+0rjumqeRwe59XGy
	GDbZj4RTCjdxcjx2Wy+q1gq2MFj19OLbKY61ylMy2PmQmi1FqbDQanDc+IS2b8rO+
X-Gm-Gg: AR+sD13Jvvq3FzM2C4mIiOlit+H08pkMPkHFpPkg3J7NHpfOulc519GarK++ozv5Pqn
	I7GmavKQeAFtDYNt3Gei3OXAUHuTOsIo1bsx506qZN+yJ1WsjpMCcNpHjCjo0JL0r3cthuwyPs5
	5M4mRrkNAexAs6yi3oy7f3q9Tw/OCGi/vaoaNn9eH8j8YH7+JQBOjyzcfpv+gEldP7rcNkm5+M9
	krgWNI2iczF5HL7HoXAhHHmNuQ6iHfD8Qeh6irRUDRuvWy5dV6qrwviTzfflWOOP++pzEDicR97
	+4kF30eIhJb1Z3oP9B0Lbd6xeIpFy4hbTe8cdoALM6JqWux/YjEAljcS90cgtqlSUzg9RFlIh/s
	GeS6m0bcTfDy4KCYprsOW3FvC6ed8T5GFtoxbt9qx/bT6FNm2G52nHJnTfC2lX7tCpf5WcB7u/1
	CrRrcO6S4/zTmnzg==
X-Received: by 2002:a05:622a:4c0f:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d58613f11mr13713141cf.26.1786439816320;
        Tue, 11 Aug 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0f:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d58613f11mr13712971cf.26.1786439815937;
        Tue, 11 Aug 2026 02:16:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448736635sm162139e87.75.2026.08.11.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:16:54 -0700 (PDT)
Date: Tue, 11 Aug 2026 12:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: Add LeEco Le2
Message-ID: <znkuidfiskzgl6qrt5hry4akmqtxkfswgz6v2jrwc7nvztecli@q543uz4p4knz>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-5-79a779d76173@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-next-patches-v1-5-79a779d76173@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfX5mO6Qt72EngO
 Hjf/QgZbR+SbaZA8gKWJo0gU35jqQYeuOuUbHl14nCEnE6joDJaSMC/TrdlHHSTYHkr5umELVUP
 /M2X+hNHzRbKQw1HGG4up17AmY1GdC60Y/9lvGht5hYSMm1+b39UDpkguHMKE6u2dWvcyeZdchs
 xYVa6VISxIgVKwlk65OixygvJ5MhZ4Bu02464B1W/vwnRrvp0AkfwY84jYzVbPOC4/6PuTYDhV/
 6l73twi2/qMimpf7CusSzYZrri75qyQSw0rTrT/WV/KBxzQPQxeGZX1uuNWGN0e5rodGvRggRO9
 Y77W/FsEMGRHeb+T9axECA/JRNPTXxSfPAEKJC1t/WxQYXmVOlaw0gt26HI8IihRDLlOTFofj3R
 gNlF+A+awTNGJNNY4f96OkXIPdyJy8JyUMU1kfCq6VnMM2t08/TgLY7v5eLddX76faR+1Yd2Kat
 HEiyzX3Z93pEKqKaJMQ==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7ae889 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=eHW4eeqAPWbo1CzvBrgA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: BW5dhaolsUmldlp4rQV37HqAfO7_BOjx
X-Proofpoint-ORIG-GUID: BW5dhaolsUmldlp4rQV37HqAfO7_BOjx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfX7UIlTnwKgEKD
 l6sEPPw8RQt4ifOHW0zYdgatNzXWpr3xM6HmjH6D2l5+CQA76c5ahIOh4Xo7wq0PfN9U+5EzIg+
 4hKKOTv9S6g+3G/NvC1GFRjJDFuUuWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110076

On Mon, Aug 10, 2026 at 06:55:38PM +0200, Adam Skladowski wrote:
> Add a devicetree for the LeEco Le2 smartphone, which is based
> on the Eldarion/MSM8976 SoC.
> 
> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,Audio amp, Haptics, Extcon, Led)
> * Power Button, Volume Keys
> * Regulators (PM8950)
> * WLED (PMI8950)
> * Remoteprocs (WCNSS)
> * GPU
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts | 444 ++++++++++++++++++++++++++
>  2 files changed, 445 insertions(+)
> 
> +
> +	reserved-memory {
> +
> +		ramoops {

Nit: no empty line before it.

> +			compatible = "ramoops";
> +			no-map;
> +			reg = <0 0x9ff00000 0 0x100000>;

Please use 0x0 instead of 0.

> +			record-size = <0x10000>;
> +			console-size = <0x60000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +

[...]

> +
> +&mdss_dsi0 {
> +	vdd-supply = <&pm8950_l17>;
> +	vdda-supply = <&pm8950_l1>;
> +	vddio-supply = <&pm8950_l6>;
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;

I think, you missed the panel here.

> +};
> +
> +&mdss_dsi0_phy {
> +	vddio-supply = <&pm8950_l6>;
> +};
> +
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <8 4>;
> +
> +	disp_reset_n_active: disp-reset-n-active-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

Doesn't the driver also set output to high here?

> +	};
> +

-- 
With best wishes
Dmitry
