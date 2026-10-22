Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656445;
	b=cevOAM0LZY5vvq1zUR8KaXrJzabLJoYUy3TmNo8TK4SwXD404BY5Ntugnmzx4Y9Xtg1l
	 nyPeZTs42p9/DNtK5Q+OuqXqk6arsAuCFxDKxBuyhds5wd2+nXdgFSn1Sk0zVyA0lu2FF
	 7vkjaXKuiTEf+5yfyVxQvwzeHoFN+nau9Zm39ZQ/Rt5z7SEzdYx30otmL+9NgbLm0ut2k
	 CRY4N0nKpGoR7iDXohuw+zHAuj8J373muArb925wB4XbIppnLj/SBJF3Qw0eKdDK0IgYS
	 9nAPqJwWhrslayYKSC+YZHqOQFELRy7ZG8TESK4x3k6H0JFn1gLd1uPn7awyVJSKiGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
	b=oQFX8n3J27g24QJUmBLu1DPL876imPvZnd4Ow1FInZ8gNaEmKunlvyOOTk3y7MoH1pSf
	 YYMtALTsZpKI4WpD0DoXJYmTzVliv/N/Mo/Ngo9OejgRp2aWEg9YxIhmitaEo1prw0bnx
	 taKslzzQwqllRR0G1Ps4Lox16FcSXBx0wRr8dZ1Drg6gbbaV5kmrOkfmR7rLZumi43klv
	 bmjL9Y6ilaXwiHufOzcCqT013lRfk/o27VilgUm216VOXkjRkwpcKXCnp3sJMSTuiZcXq
	 yl7BTthD2EYOTCEziu0/WPQRWhyO18hIGiGwFqrbV00xWiCchSMnbnDUYkQDEMWoGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E80606A32E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E80606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708Z83517473
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=; b=JC+Id0HGcxwKpJD1
	ibh6qFVHKM9dmBjD65sOixx5xw554XLDnLtPjxnCKc+ShzclOWADpNIJG49iLWBY
	quC+72LO3omfkHpfHAHLHKv8pqZ758X3SJRAk0ccIM5AiS7ILJ9ptmSc88ztAzwt
	FtprcO4sGLGSdD1Ru5WtvqMzq7iks1uRitRccIpXHC9rtA+3XlwSZT3ETuY1kpVM
	LI/t/zOI+TXbmkQx3FhLQcNszGJ7NiYkcwmUYRvVVKo1noX1/cU/Soo29zTuDoSy
	vnD0+CBRANW4lTn5j7rdimZMClXa4ef3AazXwbhlLeXj7qw+DnHATqeSIlnGKFhR
	wcWDmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhbj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so32266485a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656442; x=1793261242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=jJKWMTOVV3nF8upLCwyMBKBIDjk//0MvGPDAY1PVugNgL/kYMtTo7ynrvF3slv1kRt
         z+MvaiALYzVzIjTQ8N5Ci1FlLgAvxwk5mj7qByKTQHvYjSu74C70a4oUcn+1d9KB+5+K
         aDaLuCakiqKd8cT99gGji/aGSQbtfHkDRJpRjzK9BbZjyBWTKEnE9zZMsgsLMH3jzMHa
         sf2HOzm8/2DQPVyYusYiwoEKEmJNHQ8egrqtzdAmvWjejsWQN3TQ2jZhMesXmvl9FbZ6
         XLWVEvgJNTpvNlLw3OR48LAhigSj/tMs+OL6fPRDLurhdOgQU6vz5yjGKoig82/8Q/mg
         iwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656442; x=1793261242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=mYzQguSXkWprOvU0hmYpbnUj71pdpmph+hpoV/hsEuts8UEtrGMq2qiITMr0Py9I/A
         Fr37bpxg/1XxDnotIta07a3JeDJZNBmhAPCraQ15tyln4TJO2WVaAvQ+HHNyxHfKLWLI
         6l8H5FLVQBWQ1PLF25IxWn5qT8UvRkMezzdv0pjqF/Tkkvf00KazkbFjdvwhKBwMtl1p
         r6THg4MwkqghQhwDxz7wYebgW0ngRapBEwvtCcByNYIWHbD3LSDUY+HMNkyejludOjl4
         B6Frc+onswwnpg2M7ebAFA3KEpEfzGKdCjs0vZYfwSMX+FWQumup2xUm1KY3jONSDyls
         vlIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxedYw3TEA5yJLxu66r83z38qiSFcq2iC7EsZ7cGSfacRrtibunellQeikkjcW650sdfNccyrRvyvgW@vger.kernel.org
X-Gm-Message-State: AFq9FYJpzIPeREvrUJEx/DaXINRySdjFwqEcnLnu7VMzFj2UAC5kXif/
	BC/2OqRZ7mEarlmBdGhKx77PcczlZg/nAsmeJ106PjeGzAC1PmZ/llin4R81LLGjDNwgCMvqTSY
	JYyKFDo8qYDue710dAmrfBYLqQMphpQBAu+2X4XMSro7YHNbuIl3WUcz5Tni6sUGD
X-Gm-Gg: AYBFou3cnJNRHt4xXR4y1PwbevkZ5EEW3kGUObNwjVaGPwOXol4fOU0vb7PQ3dLzttM
	kFRWhYbyjePHSAwviQK//BArLxWcOC0aCRnWddmfdBEhXOuRopGdy7ZSxR7UmOlUtIc13PSNw78
	cCFv2ITSbk0PF+/xwwLnOITvvAxQTBOmvkNVVmdLBX1zLyRIXRlQE4CPEs7s30p6sciHlpo+G++
	iw1kBARX2nLyEVJu0JnXd3uJXowdVhK/7RwqSWctExrXkUG3b3C+dREvaK343MMqDln7gk+H+/Y
	I/psA+VqccILO/kwV7rP4jU0cG9RlNA7t990CB2VilkC5tBtclhlaWSEwzn8OIZhv0TZiGH2u16
	uYBM92BNO++aboX+3NFatKw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008990385a.1.1792656442377;
        Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008985485a.1.1792656441987;
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1627775a12.13.2026.10.22.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Message-ID: <52029ffa-1bd5-4243-9550-85cb00bde8c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:07:17 +0200
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX76BqK5Zheq4l
 qyi8WpdSL319X9NF2V4mQIxbT5LzqQdaiBoutXI34MFhgC9cMmUf7Q7R0w/882+C2Isj/XIVSvq
 /dHq9U6j36DJW80jkvjWdVR1PM2FCuYXKCpsZrDyJDFbkUHRk2MIHO0O4o6UgCW+bRt2Lu8XT5U
 8XdZwlloF2w7WU4aMaw15m+W9tQDyL2yc2xKUcOIR0wA0y6w76fvhcZWhgyLEzTesz18NBvx5rW
 MP3dAqOjkIJ1n5FqetzJSXNCaWa3jErxLrKSc2EuGtHZJkNxcYvovEwO7PnSs3K+Wh8bCEmL46Z
 M7gRODNaTDwovlOXCz5fTJMDRlNdHNUIUqjrYnQW9wqpHZ1H9tGSefRRrPcuv04h6VsY2wvCwlJ
 lB9jJneJSnKd1oCkUS7MTcpH8uKsrlacQVTw5AT6WIFV3C/18+GQoVNcfMHARYQ88WkBN+2Cl/p
 4MEX7vIgxSF1lBSECmA==
X-Proofpoint-GUID: qT0zn4riCiwAF2oRYAZsIulLu7NpNDP9
X-Proofpoint-ORIG-GUID: qT0zn4riCiwAF2oRYAZsIulLu7NpNDP9
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9c43a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jboVpbf-MrRR0o0IvX0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX+b1iTHt4nRtn
 z8XL8kO8XW3XyxapWabsN9OTbvK394sYnt3rzGhl8r/XC2J1xOCLWfTK5xb/9nym5oA2QRSBg/p
 CjEKHzw0V2dy9pAtCIzyxe+KXkcNN6A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, Anand Tiwari wrote:
> Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
> LVDS daughter card is connected to DSI0_B2B on carrier card.
> 
> There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
> connected through I2C5 with reset and interrupt connected to
> GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
> using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
> GPIO on TLMM GPIO2.
> 
> Disable the default HDMI bridge and connector in favour of the LVDS
> panel.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
