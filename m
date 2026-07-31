Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6D34389B
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480397; cv=none; b=mwnwoc5+O+Xj3qhxi8mnjAURiqR8XPIr8tbT5F2wWI3nLFzmGgXUCSW/uNytMPUThf6QYdfZWhlSPR8/BYiZCY1U3bsmyCRzsZviNaXmWkF8+Bz9r8EjLx9F+grg+jEA2snuFaUqZ1Dpa4U43IneoBTZL3/9/W1+8+1MvmepPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480397; c=relaxed/simple;
	bh=ubQZpwX6MN713NaFuM0ZgivNDMCQILkt19Tn9nXCg0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLYeBKGpjI/dgf3uiWYNpMssGSyYHcXkdmuAHkeVoIRmYsay0SoJrJCBC+7NF1XGgGtdgFEFUL6Lp611cFkZZ+azPtYpxTGBqUQwVhQDvQxf++cQgXYZojDJv0/MberLRKBfQqR+wzbHza+6dBQrAAj/GEnbYKrQ38IgjhYD+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZUFZDDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv/rVttr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZUFZDDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv/rVttr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67C7x144275
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=; b=pZUFZDDgJRuFM+ib
	lOoaczhESiu4hPpJ/R2CSzKcwBaIGp+4ZO6q6Wd6YKVVSvRAPEcYOqp/augTKOhX
	VSy9WVGAOTDk36TQQtmzcZym2NMF0GMTy9/qEoTkjXMA3mS5BsP1RQfZ9z3T8ce5
	jZSI2gMNDf/kYbfzvw5AbiKwGt+fdKIh1s0nw/1DeZXzXoU5GLyhMxNwbJ1dUnXu
	rsoAn9675Nx2fiYmLHf9l9ojqsBdxTGz5qgwJZJJm9Hl/FfwbDyHbbmGp4Hf1A/3
	VWEayHHVgmCI3OzX6w9mNY3xuA28CvXFR9gJp0SD+rO8ZEn1yiwziGBkf0kEmQZq
	JUmWsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5k04ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:46:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso6489571cf.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480394; x=1786085194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=;
        b=bv/rVttrKO2WjQ0zpdYJ4R1O8uhlfgr0qZCLQhQO7Zswd45N0KR77TPwrjAete8hl3
         shbKxLKD0fstn6ZdI6+EAY/TMF1fXINvWFNNHWMDh4BEM9J381WOrBJc2GiGK4fpQPWf
         /sRws7rvrjDUglIFP58ndzqUxfCnylbthpyrYJrG6TDXJePJFjQmiOP0YX+HGPecgYrb
         r706iKYlVyGdeTgTN9WBvEymdikQrgaqw2fogiM4UxLK7Zp06nid9uS+EX+5gh9wiRd8
         Sjepm6LfX+nfQCnKDUHp8q/NOxQ4ds6Syh/HipzP+x5EJX9/MPN2BVXC6s70n1a153Lz
         b4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480394; x=1786085194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=;
        b=CgOMCp5Pq2RosQ83mZITtfxK4YdVrSoyAbTCdCi56fSlxkpziP1F4KsYa6WD6ZJ2Pd
         /NdJ7yPmYUfjWuJHw+NsfVES0UEBjJaxi3pWMWzmY+VdhXL8U7Sj4nnYPdoJBK0JuctV
         M3JBYqMKsClhtXk9hjXB7MawSqejqU8FvAwe1O18Cn19BaxVAidneZC0RZPqXoP4Rgm0
         /B76CS7c/F04+seqOWSO0a/1CwflAEcdyOfv7JJCDhDkP5mV/W57lbHC/5sWC1RvAweI
         Zj4OzY+anQI3c7MgdW2A7Qad5ib7B4RvKUV+BJzgmVv2jE+mbW9btWTPnJxbxE3MI0hW
         Nv7g==
X-Forwarded-Encrypted: i=1; AHgh+RpRbQO6vFrDprsPdtoRLbXrmT0gb9mw4lR5qSDrfLJT4PInSLjUDJab1s0RdwlH0YZTD4Oh/Oq+v2zY@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhDJrL82tCsIYXRb11ZkwwXkC+Npus+PK++tYXtl6oDVfkgfP
	1ev1LxiyaqllqhrIVr+5/dPJ40D90PXZ2Z4+NfORKr5ggAStrImu5GiOr+8YPYpXkRPuFROpicN
	ioQN/t5SMNObsNMQLNUudHa5+CZBmEXDDqldyFMCxM51GLHsPWPGG9ExxahqhMgnU
X-Gm-Gg: AR+sD13M4IwksZh4b/m7SjTqtxWhZujVRTkMShXtaKdB02a1ghUKMymtUPHZJT0e9zz
	S1/QDqnFR/Lf0XdETFUx5mx3yiybq4rOnGhgiYlfpIy0XpkkRY0OhpZz0eiQ66SBeF/K1N+PfNU
	XHaBdhATaQE1Cp9gFmlKrjtGqvOhhm6ZMe9DCNZRApOZQQ4ZnaFBC4WfhR5NNdIByhT5Q4Ixynu
	lLLHBuWM53SNCaExYGLznOaHcndPvdb73D5/fJZ5shkAA5Os0bkFzII6CUabubCevRMvj2y7dWZ
	DIWo8oV97wdcfquwMDeUM77/sJcEUdDtwNbsqUhmPGRPTKtRyUfNmsXI7IoKgjerEeDz0zGdhgh
	E5ZOa2AVFOBH4BTSPxwmTknlH4t4=
X-Received: by 2002:a05:622a:4b17:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b4afe0afemr8922451cf.14.1785480394205;
        Thu, 30 Jul 2026 23:46:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4b17:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b4afe0afemr8921991cf.14.1785480393615;
        Thu, 30 Jul 2026 23:46:33 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fd3c90f38sm36886166b.17.2026.07.30.23.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:46:32 -0700 (PDT)
Message-ID: <60d72f9f-3768-4e2d-9fad-adbb71214abf@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:46:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/15] ASoC: qcom: sm8250: add support for
 LPI_MI2S_RX_0 and LPI_MI2S_TX_3
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-12-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260730174353.108023-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L7stheT8 c=1 sm=1 tr=0 ts=6a6c44cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gjZ7DTAbrms9DNMwUrcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 85lfZ8domhMucKQUl65v1XPdnky6mBCy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfX2WHShnAV6oXY
 FH+lzxg7lnDtQ5I2UDA0ioRDALnsy+95FU4QMmA29sif2jZhEvJIxw3j9PTR3806SNMI2bkm7Kq
 hZh7034RmXarfHkGfhyosACstYK8y9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfX1t2bI42AHA9N
 tSjZqRXXlMKua467ySgQAwCvKPhZEDFLvYABwQ1PGsBryQ9j3QxcSb3aYMazyDz8o17+31n+mVN
 pZOT6t/0qAISE70EmB08dHtIa1YWunqv8e32WiBAK8Qj0OZ+ucs6hs2T1kB8UyMrlXPyOv3d7g/
 q27cr5Cfcj8zA/fmGULXdwRYdKMAHK0/Nf4AkjNL5NnB7PyDILgL/aMtuus6zriCyLn2cZ1G2EB
 HOrJOevjS7sJ2oGpdujGgOytV2pDWeKeHitexYY21mZiBE0O4cvW/DmL0Szs5iRROLYvkVDBz0I
 gsGusD85fBaujap0XQWoi4cmUg274h1td2Ron1fcORI3ULKeihzfYqCrloqgQoiKfjDdQXUdkFo
 iTFTSLA0qlbSs/NUlM3MkwsBK6THJuat61XWU+aTswjyrcfl+Gpaortrz7Z0m+Trb+GxgNwFJuJ
 HgMWbPs6M7pvtQiPB5A==
X-Proofpoint-ORIG-GUID: 85lfZ8domhMucKQUl65v1XPdnky6mBCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310046



On 7/30/26 6:43 PM, Richard Acayan wrote:
> The LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports on SDM660 can be connected to
> the digital and analog WCD codecs. They can be supported with the same
> logic for other ports, but just need to be explicitly stated. Add
> support for these ports.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d0..1952c599e004 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case LPI_MI2S_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case LPI_MI2S_TX_3:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}

