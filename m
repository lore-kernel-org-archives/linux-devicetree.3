Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191779;
	b=HOjUPU6xm71Fh6C/Lpj4ibphFN+7wXl75FOP45goN0LdiSvqmNxMNi7zZ1RVJmB+yoxv
	 e+vKHH6ScjGILCOA1VaDVRla9IIS9bcJ9VnoKF/uxraZvxoxOv4u85ZX1f4vCrYCm3m1f
	 3hA6gcDtytNTPPK8g27ymiAhc+9hDs9lJ9RByOh3EbcJb2svmf++8d/njXr/kWkOKgvnd
	 4KEefbsnucoNOsdf3oHW6Yh6cGzJO1lFj8f0+VEax9S2CGcwkkXfz/4u8rCf9yyX/tfik
	 f0C7sX2ULDbwOBx328kF6sHalQvR8o3uhXVbWAz8PR6Y0UNuvTWkLBRn6XEXSmZ32Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
	b=XADpvbtNpsOMFg4nzQDJ78IOeIxRfus/V7JkPbNYzFF3X4u9ZE/nOU0OQhn/c5O/5Pzv
	 vHgWx4SFu3WqM9LZy0l7vaZ/lm9ndeUa9+u8bSYupriLzKFUl2Y3E6R0z49jfmleoRCHf
	 V/q2VxoOPTTk0Bc3t7rBhsFrLboRAZCu7OC7m6QOiQt3BKaoxY6knxk19+tUfB7jngv7W
	 T7gHXEmjWqG2COSUtHlzyx0+b1Bavh9DJsA7HAVM3wYSKuQLDtPq2WVlmKRfY3Z9Y6MKt
	 lUkZxhsonPTQpp1VhVx0kbLzf7xZA4lPdVRA5p5abZEyXOLe7gkCquN6shV6n5Ytdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL22LZ4j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F8606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL22LZ4j
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAbp1606928
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=; b=kGcGygIba6OVMRxE
	/L4EQh1pss1+HCJmr6bFeuZrBp0KPi9d8ZCiWo2EnnbCgC863kY29hhjZGFy8wuB
	gljCm76hohmROgJTbQz1dmhtOpxCiCd9JRfP8CxiS/ruADla1YUKIuXMMxmKMXuD
	E2KdVRSrTocxh6Uc//aSyxDLFQ9gaJNSUZQPuIcyOiCrei52HoUhYzPItn5dtLix
	QTw8nz1uRyXkLyLJrbqKk0dlrpH3DZ56K0NamXVNql/oAvm7nzvlt7u/ulbjFB0r
	6sbkh6NdLyA6ASFXHX2BKXFh9H5gFtITLQcQUl5SDLwag9+qDUXLcMQwaSfTXC5N
	3ZD/pQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j7cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so1514562eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191776; x=1793796576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=iL22LZ4jsIptRWNCO+1/ywPtlBXRsWgAWqMpS5PhtbSP4E5o4COnIbOKeVqxrG9e9D
         AAldAkT5l0FtRtiFgGHzQ8oI5yt2wcMKg+2yzbGFVXU3iUTPk6XGjEnEurtB77rv7gNY
         /iynt45QqwRUx+cq4r9Gh09qntVE/wSW9mZ3R+3xHgMS/0D82JwsLxIXsHY2FipeJFvJ
         cmEgSzUtmFodXflxhVmAj7aloIhD5KI+VQSRX3+Xqy1Hn4dQTdvTdvJCoc7qPMjeyZpP
         dOq96ddMobmZScCZE0QgUj5V8yisHtIfC6OWG9aohKM4yJT34fuk5xqAIxuQScz4eHjV
         2Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191776; x=1793796576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=nQOW/e+YruochAWJZFqJ3ydpJ5wCFP/MI4iQ4Qh/lXMBtslkxsnJ52VNAhR46LMSgu
         uuzV74bSJ/3UxbRQJLmjyg1DbPeKXF4xtm6L3hxNvQz6mRFgfnri5A5MTQ6qYx3IPrvk
         7fo6xI5yz9LlB6fR7gTAZDiw1IYoc38rBmAlTmPnRA0hW81J2uaHEsQeDSuIpC1THLlz
         TqX5ndsDVb3TEnyzyu/luJf5tIMOMJ2dDE9et971RQPuuMuGGi7lkxsKs0xDBcJ/SAUV
         Op80GFZxGFt46jISzkdkbzdjzE5Z38C0Q6UQ7GUqZWl38xBMh/mnOiKxeURnjc3sxnzO
         KluQ==
X-Forwarded-Encrypted: i=1; AKwUvByIWkcSLxMHj/Xv1dMiRwls5o8UrsEUU63przTt+5+JEr8OmuWD/hqnlHVcFUltBOHTlz+nAtljeuc7@vger.kernel.org
X-Gm-Message-State: AFq9FYKum26hwS7HnfFnvtGGV7cMD2C/sultBVku/yjLOob1SCVnnpP5
	SntUXsD9kuZu1iNI55lgPrAzMgS6fcIp+KT8AG0/WGOeh/tno/KPdCV/XPRlIsQB8TWA5U/uDPE
	Mlph3O1mBnSjg2EYBjwYqjZCCr6jaZQNIYRzNdZIuxNU/92ZamVsEBP9GXvKbjMTd
X-Gm-Gg: AYBFou3KRrq8ZlTXzVXlJhgwdrDuyfw6zAzqm335T5zkHd9NLE2P01gkuB/NbqasfUU
	VP7MZxBESnh3mv6XP1nDmtVdlhxOmdVDi+Lq5gspFx4ruUZw+u+65jqCS1aUllGWz99Pn1ewaSY
	c+8SuLEjn4Kju113Wjavb2Xz6ydCUVEeu5fUpJdh/dLjkpPCyof/3WVDM6JrzHLp+iGpJvrOxws
	qdDZYMF1+bEEkfDOAARKKDAVO5WGttjW9GVv8RrqcMsILLOwsCrTz5cqv6sDkLFE1Rw2+5YJPQA
	VNye/JkwcbPYQ32JXQoST1UfZL5jsWfPOC123zYG8YGy9FohoKCqJVPTVBpWIYqsS4fztIYIQxT
	mH0x463SrESTC41DsXYv7elNqjKFU7K8YFXi0TCLQXooKlnsL8nOeW3dm2mC7lgEyvFSW9abNVq
	MWCgH4Lj13
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806631eec.36.1793191776315;
        Wed, 28 Oct 2026 05:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806595eec.36.1793191775704;
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm7401232eec.9.2026.10.28.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Message-ID: <c64d095a-d725-477f-8421-14cc74dd0a09@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:19:29 +0530
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
Subject: Re: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX4b5b5Tgq4MI9
 OHaDJXefTeWz4qnNdSP/P5awIQWOW3VehbSIPMa9D3Qk/ylg1m3lZE7cceVbdjd9rUAk+gZbDB0
 r6/FMqCcofB/CVRrpooOBcJS4Gtiifo=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1ef61 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Udm-XXnTmhyVqvlFBioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: XRIumyVoPmXqnhNn6Ax7APvF73LrT8Dg
X-Proofpoint-ORIG-GUID: XRIumyVoPmXqnhNn6Ax7APvF73LrT8Dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX7cxI0963ukWi
 EgEtGrBtMDyJMquBa+XFfM30tviUOzAzJGdpiNM3aP4D0EjGFITh4C/twsV7S70NJF3EYs7R2R4
 GsaQ3KaEFyWVXaL+RMl0pwp5qK4mljKn3AjMCwgyulBhm8cUR6n/KhouWc59HUIKXgQC5xDmB5A
 w1g6oub38834/DvAvg7TWwM2qX3LbpptdRaijWINjpbsCSJhAh7kqL5qR+a2A3p8p3c6VdU1XuZ
 IndfAhN9DISJRZxc60Yn1WXResK8h+1LKou4LIbZGzwE6MXPKqUg/nztm19XyBejzmghHKavypl
 JcLbQhEm8JWCt9vrjsov4kVymeWfm+qOZZZB7jnyYP0zykQ8yKlWI0xRyltKb+EDa7pbQn4n/az
 tR5HkWEe2wdP5dVw4aDZVKlmRVTZiKj1B3rwjyQTfyt/zVmO1Nf5lZWhYJiA+9qdCCalhGuszpM
 COjAetM31kBHP3nrLKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

>   
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};
> +
>   struct qcom_snd_soc_common {
>   	const char *driver_name;
>   	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
>   	.codec_sysclk_set = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,


With cpu_dai_fmt unset, the CPU DAI falls back to SND_SOC_DAIFMT_BP_FP, while codec_dai_fmt configures the codec as SND_SOC_DAIFMT_CBP_CFP.

Wouldn't this configure both sides as clock providers? Which side is intended to provide BCLK/FSYNC on IQS?

Thanks,
Prasad

> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
>   	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>
