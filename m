Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685274;
	b=dBPVILocZUQqybWPaUgdk1YNnGa6fbUYYk1uifXq9Kmpkf5Nj/ik9knEVO/iPztOyNqa
	 HgiP/iLbg0RjbMeaGDX/VTtL1QUtYcmEf1UjAIfQFoadtRYr1wVT1JK1gDJf8Uvr3ZPK9
	 PS7CiOQeuKBc6XVPA0nkxfcgpo3XLjtwkNc6SJujniXsJrFLjOIm/5UliB6npUttEh6pr
	 oq2PKyfB67cAzzVXySwVURvGP1ZOxu8TPUks2JR60Git7QVbzQOPksl1/fOX8NCFPNUeJ
	 A/MB5LbZhOe3cxLQBJu4O5/gIHfYZwJdOgK2L5S2hrng3FpNnh4jkD0Hpgo1pdz1jnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
	b=PdtnQ09WPYU4f64Y6FWJBhlYwLeiOw17WtVZ1XTDKOg7POE50hDEwcLtq/Zklb9A6vJy
	 I3G90Oj0HAhi1Cc9VrcyEJ/U5tNFvDSrNm2+ZJQRqH17emTYIiTAYIwXu9cEyvTjjFX6a
	 K7M5bKFg3rvl2+4Fx+T1LQBSgixsN8ZnfhEz1FDg0/BjRY/7Ng4wP256+eSyXX91tcVNg
	 q40+VMRoqqq/gnahzf/TuF+rs1kr0LUfMSE1L9ZvGiS2OhzTZaFuXfC7tr9Zjh0pGCM+N
	 I/PhG5d3lQ4zUC7X2puTbtFqETlNkQdAELiaHKl1wxFVkjFiCFYwD24Ayo74/0kHvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D4606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEF8OA960665
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=; b=SDvJatAAVPIIVtEt
	EheiKoLEV5P/+uT9bE17Ch9o19/8L9giDLTqZMjB0N/WJeeiKADlhBI5fzEuimj2
	Txjfgk3th7MAzvKboQwBE1shfw8PDnjYFPPmR+uJlYHnQOpkHDYB06d2J00jtEo0
	FJBxsORhB01j0D+NHf8rQH3qzmXUb1DQPQDJmOQnGj9GulgZCf0XuJU+uTrxiVPh
	j2YS5SzK8GFKNoO4CZPFCHTLhBU4vES8LAdljQXn5wpsoavkjfQTxi7PQVcYosEz
	KkqYZz+1t6F1LAc6ig7nHBrTm3UyYfO1UKJJNpBKJEpHEKsXc/Pw0zo//JfYQcNU
	axx0Uw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amgq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:07:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso2996922eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685272; x=1793290072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=TOhkkQMrbFikNyiGk1LgwmHcJyae4EdAtbpvige1UQTTx3LUhGbcDHuOGVCF6cqxhr
         6waYErcAI5XempbzwjDXCwsyEMMjkZhZuJ+1DJ1BUZc2efaU3GWzii+FWEWIAMzwjMF9
         BQivbkoQt77Jq6f6aO8cCHIFiVWRnSgO1znjvmLoc91S3B5XAEoBz5XpEWLA+8JNxX4N
         wIF4Bzeo5Cx/AO0FNl0K3YPQu4I1HbjU5sIy0OFMB3FDwj6dsb5YAGyTFCze/9zClM7w
         WsyBwcTW/lvOrVawtt5VP87vNA5OppmluXUjrdgzE6vN78o5pXOCi4qBaI64hSS7NwpZ
         TvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685272; x=1793290072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=Eb6WQqKjVTalHtX86BScChVjC96zhVxJKskXGJXDoF71qh7p6XeBLhRJn7oelftNLj
         IY9x+A6jg3UjxafrRgW4sVYID8ZfrX9umYAD4CLkW6N6i5quCdOdzLisLqs8ww7PhiFM
         yGcBfrvDsxVwJ9mAy9jdCWQNbByuDQy/OIWbv1V8DoWLkxQqWrR6MsY2cNjPIwNnVkoI
         GqZsFD2Alvq3o49mOzoD2Ugr1jLmbylwchY0hV5l5W+V0RNNvWLEK95exAoyNGKk8ibt
         5WH4zFNQOYM7tEXwvJldy1QjZ8JsbVJMrbhSKREiy3uAoSNY68V78kRf9uLT0w8TkBPg
         TxVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy31eSWuvwAwb5H9UgHKi3ns/m90iQMsqjO0LK5/zq4CUXLb1a+YQh1D6bo5x526RYo6GiQfyhDfBNZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLwcjxcSvHLOAfmhi693B4RBmbufn5hs60rVe2el0z5S7omsClo
	SZV4+rY/b6vmJpppQKq/d8/01JSKXlM1o5wtRGbnlEhMXTmO7EAiY3w8tR6ceUvPcg+Mq6bfFFk
	fA90z7AuF9j2SzLM6aF8gOEzv0jYAq7tkxmSM9/gLEA5kPtGSaO7mUvUbhp2xTeMb
X-Gm-Gg: AYBFou1YysXHx6MSbAUouS1HrN1xUwWaa3pgV6FpwbfmDxnUt+oaFllCPA+VD7pLL+g
	hviEoGHrOnacJSRaxoa3LhcswgRB/JD/dNpJ067tc3st9YxgZJqFyXNQL8VAhU8MNFVKTGyN0SJ
	DFSM7x6dukju24BRiSOfZrOe2ZNJWHaqBaabnuVC3fizWjnN+gg/4lljInbf5CnJeV1rot7iIHV
	Usfzy7SolVmNBqwR9c+CZxeb26Xnn25tQjW1HhrfGLypNwJ5IOtyw1nnMUAvzdfib0iM/ITGv1P
	PwQkK3EF+sEp1M2T4AxIcM7rpJCe9b8zkzWZe4ZdDm5oPCBJdf0jajkOpHLJHcmZC52GY5i3TZA
	T6UsU4fckV5ELmMtBlxZ2spYzsg==
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741556eec.37.1792685271616;
        Thu, 22 Oct 2026 09:07:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741516eec.37.1792685270960;
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm25689760eec.24.2026.10.22.09.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Message-ID: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:37:44 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX1kx2U/efanjM
 Vzfm6UYWIVNvVsqpLQMoyYVoPsOr4VMyvMezH/RRFoVcki/jkotEW8ZYW+v2y14V9DYBS8UH3B3
 vp3kL/vFtvw1CHp9AQ44pLizeqe4RDE19RiN/b2AzdO8NYmh1N/tFemoiLTaYOBElWzPQzq+H/x
 1RM089j+Rfo/7Cgjieo+ukOFeDuG2vv9Nsl9L+yteOO/5ZREP4QyzLWySdPXHABQFm2TA5/Mn0I
 FkhquqRn3tH7JkwRhtaQ4594ErlfpGkX9xQH1nsTdr6znu2aXyFz3pkvnuJgfMdYKlkAse6DMFx
 nC2earaxuam9UuoXzUC085LbrbuQ+Vfs6NdNbUBQAxRloL3mFvFqyeerw6G1qKR1Y0WLq80FKL6
 6sjiwtV/dRHZ0Cw0isXcTacp7/TYPgXqKFCd90Hc5ZbtTB6nxyL4X3YBgO51c/JWUuiXXhar1q/
 zyXJOGjbiE/7Of9B5+g==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ada34d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YK1r8bVAkC-uCLGTKrwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: p1psCFj8p8LIPyKt9KOuOJQS63RE_lox
X-Proofpoint-GUID: p1psCFj8p8LIPyKt9KOuOJQS63RE_lox
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXyMmIcXMlBvg6
 Ax5NKy8YlQMdebQbH9LIQFiInwMFrtPBE5N3PHiVQDFHdg5a966+O7qR1A3Y0xFDDHiqO0Abzke
 GwF2dXPYbse9P9hp+LVRtN3NitIrSi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add machine driver support for the Shikra IQS EVK variant that uses the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> The new compatible reuses the generic sc8280xp DAPM widgets and configures
> the codec DAI format for I2S with bit/frame clock driven by the codec.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9860a68e2add..66064c31136b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -541,6 +541,15 @@ static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
>   	.mi2s_bclk_enable = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_lt9611uxd_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +};

Since the codec is configured as SND_SOC_DAIFMT_BC_FC, shouldn't we also 
set .mi2s_bclk_enable = true here?

> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -608,6 +617,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
> +	  .data = &shikra_iqs_lt9611uxd_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

Nit: please keep the compatible list sorted alphabetically.

Thanks
Ajay Kumar Nandam

>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

