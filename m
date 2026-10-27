Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089767;
	b=eL5E3dmCS28XmHMlZ84tkb/+Yr5ZZv87mR4z2jkBIH9CIR3/2q/TmYSEuwJXkN9j1pew
	 juBHwQbKtqnCwHYiFWcRXwrG+Xpc9HjACW3q+PsNyS3zfwubrHpilsFduxsvH5gA5/2pF
	 tvEpjPTjngb7E9dhLwCoNnSVV5sAuUMPAV+kR/QD0q6LH+mkXxJD5IS8bUcKSpr1iC46C
	 Yem3VgVJtSoEd9X8oVrKtCu2y7HxnhQ3EFZLR6o3vQ4YCl5SecSwKV85UiD60OB9d0Co1
	 PeydDSAFk9AD04sVOTn5PInvUJz9MKrZC+8RD40BRPL8hwiBjmX6n2AHk6W07huYb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
	b=2vp+d/qDRwli3cuF+2sofcJhHWpbRR6Cr8u+S/RXQiEe9PODietwCOdz57AZ3d0vjLnY
	 sHSZgiFFkE/OSu3wYmBI06pQBBk0U+xs5yXA9ajgQrC3WrjpeoTwt2TzMDSaTsIlXOVuq
	 hcO2mO7RYkR3GRDeVgVHUWuAT4bh9kjV6pIgmOHylwKAfM2uNjHLzxkYyCaROTOnGDYF+
	 BGuSz11Lupr89Ci0pesDRBeFT+/NMAM0hLiiTrMGzifqZszNUv6lTmMeePAB+IyZkUGSR
	 5QHxLqPltp999BP6PR7IeggoICwQWFem4J4dVvqFNBQRQtl1h253EqsaW0nmQV+8zkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mzIx/jwo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1A606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C1A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzIx/jwo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvR6752075
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=; b=mzIx/jwoIISBSLsI
	brqUo+tvPFgIKfdROBM/ENqEm8Z6RQGuegvcH8/yyh4Kj8KbO09SLKqwvg1g588Y
	sIaVjiEpqcgUQYKPpi3wxALFrHiC0RZUd6QX6U0omfZCETP1MHHGu99XQ7nUMGyl
	cAJtYa8hUVzBzfJUG9T1F+zJ//LMULGJMlvlm6mi6g4luv7wdU39B98weXlDiUDS
	OJ1PAwjlyeKW4kxuYneleHuY4dL6lLmjw86d9PIrfWtVBjpwihZuht9mWbyB9Y11
	IDszBB2uoFXW33KLC5xwVu6TbKzs1iU1J6qsKaVXBCIqrWmtU8EUdBySxYpRw+9e
	VIVgUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmanr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:29:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so3569418eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089765; x=1793694565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=T2KnywB3ELqNGV4RPBeI3kSAIFaSCNOVhMGxI5Vp+fNbF9WOtE1F5yhFwTIW0OHHpc
         9cUod+Iy+sdh2qo6fKtmfhW8xmES+vWkBms9ZQqqGVmWvDXwLBo+aOn8cR3QR1Iz/Fow
         aX0ntRD7FWWxVZZXUvDuxTeRE55Rjq5LkxjltRUejvobsE6RXVsO63hQlgDlFgwCsKGO
         ZzFArHoowr819Icx8u0dBTtgRBbpMotcYH9G7QdkcGIWydeQ4irGG0wNQ2QVNv4RtOQn
         BsUmJWKEP8DZpU7dlZmRW7Hh00jPROgJwYUhdxykkZfnreLXW4Se0+zPpXpS0JmE5wwA
         p3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089765; x=1793694565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=TUXHAd7o8OMQz0/+uptj1/UtaVSArGihHFA53Y1PEKp9eHKWLz82i7wgcvolDPGgnz
         EDo173f/tCQvK2vPiUa5iBVQaWeVPFvmzINoD2CqJhS1PR81MJofJr+E9pOMZTRNXZ4g
         PWLkJ/LNDSv81932sYJseqXR1NX6DbsUjldHWBy5jioBieVPoz3QYeSW1l9QW7k2iFbH
         XSDZESPwZ8H3TIjAfMO586D/z8cM8TIbaE4BzSi5x1hrRJDyD1tD/Oryn02obfaV9/xl
         6DAwzYk9699gt2bZN6uOrLYsX9t3/lS9K3qiiuaCPuZOjtsdcY3KMKyb0hfTN4WecR6z
         V4EA==
X-Forwarded-Encrypted: i=1; AKwUvByykWzAoDu2yFiZ9sjlxO2d3AQE7N5wPrmWZ1PNpN/52LmnC3TUf5/M4ipDPJilP67I8iLcC3jPsj8M@vger.kernel.org
X-Gm-Message-State: AFq9FYIwGCnkropTelHPJI+f+KPqQ62efJmVbKwldUTcpIwUxLHsjX/2
	OizBoH4QkIrXaaF9llDH/lh9kcurMzjbhPO1YlL5toOk0NG8Vbtl4/QaGekpZkuBYXDUWgvQ7sj
	YC/KVv7hsXbk02Iq75JXeU/g7cds9/Mewx7G1dOJx7krNEMase6Z/+TKAK+mRFzHs
X-Gm-Gg: AYBFou2FCKCCkl40ar3+9AMv73v4PsCdtm+rkJ8/6m2E29mzzSKvp1xwSUcYlAWVaJJ
	+JpIdHdXjBpMovVBbwxO9sulO5w6uRszsQpAe6DlZrkieD0zpUjKSaaP4DCR5IFh8ocjQiRU8fb
	gdwfmX+bhSngjCXvSvr2+BpqDzNIdOY4goO0mwqt18hzmAhKeEKtFuvxbsgHEDhdW7eJfb6jWZU
	tNph6am57oGJ/srSFaYFTsRxx+tWCQTux78I3VAzmsLNmTtm+G7h/xyXmlRMXRxf++pnVBwij+A
	7d2ykOZlq/K67ftxoZaQK1lRA2bzbV8PT5SvTSP8X2PmneLWN8tTICQkf69vLuqwNYs0nvgt1kj
	eV6nHMmm8lvXV5sLopxizLrutaOw9f+hm
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502669c88.20.1793089764947;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502640c88.20.1793089764414;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm31709403c88.12.2026.10.27.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:29:23 -0700 (PDT)
Message-ID: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:59:17 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXwJ2ASdAD7R/3
 lTT4twishay+1hbbxVM5OdFBWRrW/aKwoxKL463IEjsYFG7tRA+NMDK12DpH2LGIxp3wxlRFYd/
 zJD7X09GNROSdVxkTqHK/p+aUtcu19k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8cTrMjSmKSle
 CyhUI2Cx8JY0C/CqfhkReSWbVs5kmx6FEZuPWONgjb8YHoO1OumhCBEI+ebMrjb1Rurksg8lgRS
 2/tDzJRDphPDaP/HWWOvSZ+pJDqzb+WhHaBpP9kJle/GuFa4UtI310dSVpzPv1a8cSDe2ae+nOy
 ViiJFxNFtFtqfnRwJkwTLvHLttYI1j/h9ck9VjGUHSvJRkd18eKCX/4uC+4lWR41217YvFcQRkh
 SK6wdJtBTOzGxVGPodEJ4Bgv3e25vJii8uPBKL/xBCcEOI86iOM5FqqZZCOrIdFf7Q12bAOAzXx
 ogfC0PHxmV/6Tzdk0OlH03gX0fq/N/uxEHC8vwaMTLiIsCZw+7Q71L8JEb428W+pnlr5KGf8bG6
 hgveDCaHzJaLHjNn9kpjPxVH7YOMVK4sswrqXteNMulqWbyJjIPo0md+wQhC+FDyGMqztZFAbE4
 9OWfil3cf88CV0JgNog==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae060e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G9vM1blcj23d2gLDv7UA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: guz0ZuOjWmN7Q7XHUS5NnbLhRiq6cQ2H
X-Proofpoint-GUID: guz0ZuOjWmN7Q7XHUS5NnbLhRiq6cQ2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

>   	rate->min = rate->max = 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		break;
> +	default:
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);


S16_LE was originally added here for compressed playback ( 
https://lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org 
).
Could you confirm that compressed playback is unaffected by skipping 
this constraint for the MI2S and DisplayPort backends ?

Thanks,
Prasad

> +		break;
> +	}
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
