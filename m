Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010752;
	b=aIrP/2cpLxmfjrUP5SgYEmCLuG8IbD+ONsEzz2oRqKTnu7PwJZ0cDu1IfKqWNJ/AkWif
	 WqbWZCjXsqqM62wUPKVEuRKfQMyxI9nk0XkxTicBiFz9opi6aQmI+HttXmOWrg73LIYA0
	 FvynSznjpZwmjnIyk0OQnupCSwB/y4rRWPcNpdJ/+bvgUhGRKCReBlVCndAI5TChJs9Am
	 NMVsReTNO/ut2qFCRNktsPu6T+ThnubFH6bKBWtxYqbbRZ3Rfru8/Ip1yfjkuXMWadC6L
	 eBEmyUcIqgV9kBLlNkRgWZbMDtAUHLJVDPUDuAlE3aMsN02IKGxFxIST9lEqI/hrDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
	b=NjKDlLMpWc+T5pFou13nW0CN/+JI0VNuL3h1RYfxTTxAyMxv//DZxFr1hluw6PMlvS/0
	 H1fK5uKdrrDVdafqu6Y5FCPD9Q1shDG/nxRPTO/N3y7CC4LwOnimm39SAhj+f3xKsmPUZ
	 BBGHacz6Hf6VhM6uVjd/amWfwxp19iSOoL8bq7p2YhUeh1A1wBHgdB+GhvUSyMCb8uCiT
	 /LC/pfgGKSmXaGivyDZ7zNluV13xjtYxDSNvoReAnakpVefvwlv9A86OxD11kHDW4wQxD
	 n/iL1UkAZ4lazCEixqTpnnxlG9dXpQKspSnaYd6IMdQSwjqkofKpisMalYAmD6rRq5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YVLtPNNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXKDukfL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BD606A329
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793BD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YVLtPNNb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXKDukfL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bYmK718651
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=; b=YVLtPNNbGlUHy94g
	8RQOzlnrgJYZ/gT4incmst9z61tp0MdeHKIiAabef/e7CaVvis4Glct8lwcNBpEx
	COWiE0w1D+JnRkGcZmlHY+dWLzIY++dpAX1/SF/Jdi0AONfeJQMy04DX6+xU3Y0Y
	NMr8MLz7HvyiXvgYUim8jQ2XBBCHrNXkFlIXa4h9mQFQc6tSY8zkf0tr93Nf1y9L
	XG7/cV9pk5AZhDG94FZeQO0a2aCX/zoafpB+R/8d5THjQqAWcuZxdIRReppRA0io
	EdEXhiW1s0QSmkbtKQYZkON62/JTMoxEN1zP5O6u3r624dQCm2gm2GwYYYuIVzol
	TIaUdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst16s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:32:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso28781185a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010750; x=1793615550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
        b=UXKDukfLjTCcofMm2X8rKFNah/UJKP0icz8aTqNyRf0t3UKa4Ib8J30QSNdXoZ4jmt
         gOhW8I2HUArKfwca8pE5lcjD7um63XOIRTD/PLxdVoURHt/XVcvbf68XTHsrw4DST9fI
         cAJk/NvaGCWoOS4Mavd+/dvz6Hw5Bx3jE1qhOFEd2Gu5P3AxwQydcD39pa9mjdhmkdjw
         I9O1IuIK0v02ACbr1LVdSrw69Mkrt0PJwuC1Vj/s8uofxLgtfmCkQhSNlz8KGpBeaykX
         BAsJb0sQnqjtxn7YWLklrDTbmd5XpKHr9vJYx5JYOKo8TFzbdS1kXxJ1IsRMDXkFyZGe
         qyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010750; x=1793615550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqNVN0NTswa3cRcCZzARPyshpWFTY6ZijbCqSsQ91+0=;
        b=gI0yNmg9aBwsm7uMw282Z5vSxWfwbpmOPNR27KKyJMaBDBD2GEdbIbQvMCkPX1g8DX
         ceH/8V+wtDO397R5Y0p2BHo5WiXoJKimtJokPmmDTXKW1x1lCaCYgZ1r0QvdGKvevKVf
         1ncckx927D0XkD7sEH/TFTfW6eDztRkRj4adsKKcFgmw0L53coPkAZVhuFTRJoGULzwW
         RlzR50MII3KtDnpI6IguKxjsdVuES+hhF1oSaU0iSwliojlsDe6Ntn0WOzgZtcFQIfW9
         PC7inKLOihYMcoHsSbTAx9LTg5mdQg9rWF1w4AcP2DTpdoZoOyQrwVvaLFQO3BbtFGzh
         hfHA==
X-Forwarded-Encrypted: i=1; AKwUvBxa5UCW/klT5QQJA03+E0QMniRcMdoDX2FL3tNP3mJaOrMXuR1jAqlh+UZt0r99aROW7bXbgomp2AuT@vger.kernel.org
X-Gm-Message-State: AFq9FYKfIkyuzYznAKCrkchst7mITAeZCp/BpAfTg7bYjvk2G6F5M+h+
	NP73yAchvqRisrpb47sWw2SkLumQBSInNvSxsPbPw1/MWhp2BgoyxOxdFQnfj7TPaPNW/Be3dq0
	3Hx8ZveaTqU1oXwCOWFrxYTDTjk6DtmRy442ZOmtG6tOf/Udq82cMpJ4OPymhbc7m
X-Gm-Gg: AYBFou2ICpXq3/xCtkIltb4vxu+THWK34i3z+Ar/+yqrkFTWwh1zMGR9h+G05w9h72S
	DuczbcPvLpUIfyh6T2HTgkUtpGzIel+PAegnZM8fYLod6f1YqPs3u+lddRON8HtTOrhnsJrLP4d
	nVzs6hrIv7Vnj4lvLqOMZT9PZCOALxBNEPBzuVs64msJVXpxqqoeg7X20QO8hoGMhdkIcAtlmuN
	oGezzGZMW5dQCBlWJNiqsdGLVaFNvMpVdOEAA74qwjXN0ozTuIU9LBxR7dFZ7d794GDxax/Zw+o
	JiIcWJxiROfqffoDLTNT7uWlmcsJ0RqGd0+TwWNYICHzo8Qz90ob4BSVBvOf+SjJx+7qL6YqzWQ
	u8D4pgbbnbt4MJkN1mkBJgQ==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr925849485a.5.1793010749476;
        Mon, 26 Oct 2026 03:32:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr925846285a.5.1793010748912;
        Mon, 26 Oct 2026 03:32:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm299947666b.74.2026.10.26.03.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:32:28 -0700 (PDT)
Message-ID: <c25a9b96-dd9d-475a-aa4c-760b5ab1af7a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:32:26 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX/v1U3/CBU6C/
 fKhAdpHO7SYxeR9DN6VIwHFvEX4Wl5k0iwj6PCHe/54vP+2DHoTJQazSv5o5vPa+brGx0f3DIiM
 yXu862Acm0CtNxDS2YRDo9+NZz9M8Aw=
X-Proofpoint-GUID: biKr4aImiJAdR9m61ceNR2ZAQ4dY-GzH
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf2c3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EHe6ishlvMgZby2v5DgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: biKr4aImiJAdR9m61ceNR2ZAQ4dY-GzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXzI+ZDzHurx0q
 EJm/O0rY98yfPOZj44+68j0tRsjhY0oOKXMb8GrviCRXEJacSTeGYGaAa4As18vS7+ULHs8y5T8
 6g2e53DyFAfiuFOgTmqhmkiLUVgDKtTTwUbX2jYU3VadazxF9zPw0RVBeI9h/m5w6Y1P63S/lvw
 6B2KwIVyV51iI/Y3KMZDspQJiZZvIyBeua5Y75jScA9FLi1KtzQ2ubJAUXlt41YhmYFwXLrUT18
 J7eFb7h8fxXGwp+muQshETZohqhgrZju7ppeB8o69X9nG9zi4jeiJiEyE+6aB6V7tDkqnKQ8wuc
 9P/eGHf5fiyMEpujSb/EP5pwkMp8hYzBysBt0N4eCwnpUKSw+zgmTRNEZbgw4nIsUJNhDu5abDK
 lpf7icuPGQIiMni64a2pO+UItdgfHRxJCi7oc5uR8k9jptrSAn4dD/MDRnsHHnqyncSdjwYLp9k
 TOj+uKrwTy6MSQtJ6rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has an on-board SD/UFS card slot,
> but the SDHCI port hasn't been enabled in the dts,
> so we can't use it after booting.
> 
> Enable the dts node of SDHCI for the on-board SD card slot.
> Add the pinctrl node of the SD card pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

[...]

> @@ -467,3 +493,16 @@ &usb_2_dwc3 {
>  &venus {
>  	status = "okay";
>  };
> +
> +&sdhc_2 {

Please keep label references sorted

Konrad

> +	status = "okay";
> +
> +	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
> +	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
> +};
