Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659331;
	b=FR6lJti1okqfz7adD2sUIgBqbvAjL2W6TQ9AoPgOVjAnsJ1YyyrB+YFGrpTi/JeHTQ+R
	 BposDk5cmw2oYgt/CbVDnOk+/WnqMea1ABGYLTdm34lWIWBUnWJ3BedaleWXCYpA4cMt4
	 JSeZ9Lv/D2B4Z7NHpRQZUTqsorM0t+oKZNi/CDpRoOjJP8Bpn4RFGHmbb9JjNoDaFl4Bl
	 8sGvCGpnGtfYgAPW+G6y/YYssc9AZLmGNGu3mIfHaUcriq/MLTBqV7J/wIp8lD7eBjcsB
	 1tOKMpmPlipEXbUsKsqw32/Oby/keElDw73+QHlJUAWe4Ju1PpDr6ir5SIhOpXiiR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
	b=VxnKAmcKzmS5lbQwPWZR9nM1moYmkohE1FbMn60WeGaAar0+8UmqsV0gtIkJ6RApwUwM
	 m/pRhaWYlOrT93McZC5V7DFksCVR/usSPVNfA+IYhFdpGh6713af5ealVhHGoK/I9+uAO
	 H2kNA1UtjjM8aIhIINXeio86EMM+NIXuXl0wNae0bUsbJyJALbvmyXJwskRb0Hj6Ttixn
	 +uzp7cVc2LOv+F19VDCsqOICku2AHe6t5VEVIeZ9pnvGSirARB/DPRIn2Du+9p5dY0kRa
	 EUdxBGgyZqbqOePaFX6p8Qe0wofRRwOpKV1DcaU8MoxedWZ1Gqd3joJCxqyIrroXaCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3B4606A321
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70FWE2516191
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=; b=oi+Zn+5pVP1msRsJ
	KOXDTU6yTtwsq2OioVybeBhmJdXxQpp+R9IAb6QjuZBA6prCM5sEE1xtBTWZk3Du
	aBWn1eekJJp2uTGF46zDS51E3N20IqoW5fpmgPgj4DP7wkg9ah5srFaZhEVfzSvE
	/Q9rilRW47+mJFiq6iYP0a9nbrFNfEdbWkd9RNesO+b9Ngjj8B41vcaTcAZ0ofnP
	7yFg0ANGRt14ks5EY9G5MzxcPEfGAfYgk5U0h1OAW/sWykIAyZysvMZjBOQq+Y0N
	Dm6Jp3iTxQ8JD85CgeuYzJat+93BWwU1OXUPQmsWF6dVHfthiTyCMXbY9r9bxJXE
	NuXJTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9jjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:55:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f843b50so1760421cf.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659329; x=1793264129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=DIobJweUDKDrX8GQWoy4G/w5j5TjUk6/ufpFsGlaahAEdmKrx0gKtDwx0Bh1mejXpd
         FMCs4Z5A75L287TRftxgkRkVtgrH5y42H8X+OPr4LTw59WaSMW/kT1kW8/0HZow4S2Dg
         abG/+wx2fvi/6wsI/VzixJgnXUk+ajkTFpHbg3gYTFdlIz3CNIbXF4u5zoJkMKsvtNvF
         XP4oZ61bbgvVRL0vdQhwzw/ZACxN51aOTDc5UZ/JDTVXO4Uyvvyq0jQdYtJ6SBDVHjQj
         0QlYKhJzl1q7QBOid0dC1BMHhWjLALMohpcCsmCgvmcxr2CcVAsg6aNlEGV4TLrtjB7B
         2QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659329; x=1793264129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=jcgC+om9kXl5FWLzFzv2vCJRDpzLl4PRDTbL1h7O1NB4nwkaSyHfFwD4nSjGj4kTNF
         3YYM4buucBe4VU0YYGa3LSj8Q65yBbqdMTqAJ/sLFwB3wag2EQkNVnrcqrv01br6a/Pw
         V4Eo0B4PhY5xlJ48MYJCrGlUA0HmA3M6Mhr3OpVwEGqvXJfO/WcVwrODnGK0nusCnvex
         0Ml3U7e7fCkMr0egjF9+UlaRBdXPCe1PBnPFBBB2f2OzwOJvh/sH5TeLe5V3zqaYojbL
         +hAf+fPzJ2KZFEklo6oJ9yPRCflaSoSe6auXNcvbzC39b6kLIvKqgmZTsYAff2vYLZBW
         3kcw==
X-Forwarded-Encrypted: i=1; AKwUvBw8pEZUvUfEFE7NdbGYN9DGuMZNb7DIHcQ4GeiOk8HmGNQaal4QLnM2bUux6xqcNH21c9CS9pnrQMsJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJjM76l8Mw8CHc1kZ9zBBwy1PJ3g0ud1ojAAAULBq/TgexUtb1z
	uiBbKRVHbQ24sOJ9XU3QmiQwC0tjbRZJY9bRpLNWPGE0Fonn9SKN90K+kPCQZn3FVJUn7wx7d7d
	FOdR271/S4FRKYVHOU43Y6XghhDQ/25LsDUowv9dV0pJCNiP6JOP4/Gv7/yuDRhjH
X-Gm-Gg: AYBFou0V9yCXcTaxC9tOQCkm/hJPZof8Ug1bD088QqN6fGSn30Ubgj/RZApqlxmdxEx
	k+ClQ1zCVL1cfiCJAg+kfwTw0svYSGjBJ2dshUQUVmYkJdVFIYWt05O9o2OaqSVRQ+2iBuCj7wt
	yxLrBUkKoCwOi6g7bSXGkEQ9HfLtW2E1wDDat9m1MBIhFwGaf79Qi+6E8aKNXsOgmRTAxBlMFY0
	ShVjhRiUTCTCHENTwgqvujk41DddLwVZvqjRIA/TnU96tfNwpESJ3kuuOcahbSvvUGcuzTMGBOj
	Xa5h2lkKg2051T8oPwZn+VDi5NDIO4sZtAmLg7kHQNHY2uZKaBs55Cy/vfM5Le9UoiuOfv8pxre
	i9JAULbwt7BdXYEoHcgaFAA==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721901cf.5.1792659329358;
        Thu, 22 Oct 2026 01:55:29 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721781cf.5.1792659328970;
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e2c3esm82701966b.73.2026.10.22.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Message-ID: <a6f54a9b-ffee-4a06-9b32-2f2f47ebb19c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:55:25 +0200
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
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: hawi: add LPASS audio subsystem
 nodes
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9cf82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ydbIL3bE3U-0NGl9bRkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: F6KNAVbbmeRaDpKqlJ8DvOJQIzOUMxoo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXxv53O3wj3/ue
 YcdP1hCZf00H/RVZigygwIX3oLg1XEbsLdWjv6/yrZteqRZX/j8JRJCJ2F67yuzOkAFx6yd4grW
 pnQu9t330AMkx/68B7RDvcSh8sD0X18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX/ZO6rePPtofj
 xbl5HL1yS9yzhMtce8KbFH2uygGuJiRL+dvzg6I4eQS7ZMEVaRiY35MyfP4/zu0Y0WuhMcWjgc2
 AvqTMb/GUhzUDXs9++3zu/LjB62bwb0cAzhb820PJU0Aaq2WOtmi0nXaHZbs3ML68SpkCAh/z7L
 9x9tgwB5mNxEJGBxjWpLqZ98mXBgBnbSAfIDzMIP9Ve1Rx2B0mCYPNayylmISNyWvCQyEyztzIC
 r4I31F1EHF2T/ygMjjHjiF6KlVr4SnBlZ9BQkZhQJziFGovjGv8mMl7AiszjyaHnlmDTsuQJqUU
 sgz1FHLd0wvtt9SHsF1Q20u/gKzWZ5XtGKe3/SBaAlhjYtYsAlJ79y48nkx67VFS+y3kqOICn3u
 3TnMutOHmMLanBHhCbyGOkdQxtAmb/59kTr/VkR+27U58NlHf5RRHyzL9tyNKPaEsnCHbCX+icN
 RRQwTAZ4rGpxNY3iDtA==
X-Proofpoint-GUID: F6KNAVbbmeRaDpKqlJ8DvOJQIzOUMxoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035

On 9/23/26 10:46 AM, Prasad Kumpatla wrote:
> Add the Low Power Audio SubSystem (LPASS) device tree infrastructure
> for Hawi to describe the ADSP-based audio pipeline.
> 
> Add the GPR (Generic Packet Router) node with q6apm and q6prm audio
> services, LPASS RX, TX and VA macro codecs, SoundWire controllers,
> VA CSR clock provider, and LPI TLMM pinctrl node required by the audio
> subsystem.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

[...]

> +		lpass_rxmacro: codec@72c0000 {
> +			compatible = "qcom,hawi-lpass-rx-macro";
> +			reg = <0x0 0x072c0000 0x0 0x1000>;
> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names = "mclk", "lpr", "dcodec", "fsgen";

1 entry a line would be perfect, in all cases

Otherwise I think this lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
