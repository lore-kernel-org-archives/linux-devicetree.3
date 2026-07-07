Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759C40A92C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428300; cv=none; b=G6VjO+QeWR777Q3DEbNAX9vDEXTwMcB/yhA5A6aoy2CaolgqE06bmozpsq4HfbyKzBnGVUVyZLdpAhS/OYL1m4WHbFrcVTTd1BkTKadXYThK+sbDszXWLLuR9bxQlzZrjGs4J1woFuOGdq1W4GmaJHPYQNEG6+csokYPUVBqwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428300; c=relaxed/simple;
	bh=N3r1vlxocOsnMg4V9tZ7lxxdf2qdmVHvLKewCnnGWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btG9kV0NTUruCrbzXB8owE6ilWPaINfvHyIToYG9aPkwswSXD5d8CEB3SzeQyXjf/a3UGbl9GItM3Jh+V+k3lHDE/Wud8239t9OjKWC4hxTmPaUMiGBRohz2VH+qtsRElhh4PAllv9YDhYbDu4/dWgltniGQK+O7jNIYUCwrgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hcg+VJfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTfF6cN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hcg+VJfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTfF6cN7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8q853749180
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=; b=Hcg+VJfVpkV8lEXz
	pRhbVpUE8euP4tGUSgH7y0uwY0o8T98qcBAwNUqlSmHeAcCGIqzto7y7CgDKT6CQ
	u0zKisU3b2IX+nBkeD6smRdHndkGbS7l4JuEx6FyNQBiriDdguugdQAPsds03Hk/
	bKehufyn6v5iOXE4p+GAxj99cS2RwOJddWnp7J3JuoL+q9xxUfWs1eoYS8T/7vus
	aRNaYEMBH563hlaARQJFKTomGo7x93l/z3FteHVgkIwahDTsGAiN8P/v4Sz9/7fj
	DsD7e3WhCEcovpkm2v3oP+rTaCZM6XuF07TZj2enPZ0muY/F2C1bcqSWK9JpTuaI
	aBWHuA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9e4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:44:57 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a0f261aeb6so5645748eaf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783428297; x=1784033097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=;
        b=DTfF6cN7RJGqzGwZzyNQJwcn9MMh/7bHAnj+Uje3dEdaL1bYbDSEo5yCa68pMqKTDS
         nPjIQfTqqawlzW/nw6yaRw3E5TU1Vmziuzdhp8WpKZ5xLzAVnpXaqTtgKYbWe76MGqNl
         rbVAKOy80BpP4Fp4ti0D1rv2dw2DEV3IrMMJYnpVx23IQlaaZiaI+IINPBo8mxAOpfhZ
         ac5SAg/4ZHNnkoC7uxGnvx3srSVja6eQux5VLn4UHelisWNSTUG8d5ZgAr8CHipJMhEY
         mzY+d2F946/WqPt3TBVvUJhMLlv6krYSWD47hRCqiYhZzxvzhhyzL6LM6ylixijU9sF5
         +ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428297; x=1784033097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=;
        b=dkSV+UOlKhTnElWx/I3clFlx4Rn2uIgu2iVziLYAapcqrUZjKIfWh3u9GZUuS305oP
         O/18WDUQ9JN3i6gw0md+Xfa8GIFuCm0nLbWlhtrm4PT/nihqUS7rl3l8OhSbu5ft48um
         Lcg4pAwdqf2gjNSU2J3F+LbOxinppQtR4w4kVcHivelpOgmAy+GsOpZMq6XHSoOEO6V9
         rDmTK8Ggc/hzYQmmLmA9rNtrn4dypZQbLzuSJNqmmovwxyFg9V1pj/VtU9y/B6SQOT0g
         ZFirstHBpxvekxN3FfcGz4va96NCXPC/jdcht2udevoklGmmverNtlnBdmE3MZn5Bwby
         V1+w==
X-Forwarded-Encrypted: i=1; AFNElJ+2M9PYZO4r8wRMWj3JQ0w4wpneofgK/wdKw5CJCEm4TjAOcc3SzxnA3GgyXeZZtoxkdiLTLy9Yt62a@vger.kernel.org
X-Gm-Message-State: AOJu0YwwenyoDa3ghaurHShRIqjSqgZTY2HAZ5GuWa4TjVjrnfs3T1Gy
	QPmzq7vrFb3dFp1E+7p1WsR6qplG+Tm5157BxlgmGio6mahByob6fDfyZ4Q63w7DEBcwTjxvtQk
	9A/SPx2jhHfiNhponrkDjTvxbCfx1Liz5i2iZs45bXCzu6RJ0HK98Ndum/QIWKr8l
X-Gm-Gg: AfdE7clupeGtAlSmTlntSEzfFpAyM1qkbncVnMiucDFTDS61mZftnSLBD18DvCMv3WJ
	fJA1+5gCUIFVtjdzLnyPGLdqAIA/SxhMu4GcdJU3wt3AKh3YOxXzOtBF89U/m5iLitLCyUv91at
	H3tHjU44dpz6qz/7X/nJXZicRcqr6/dc19oj+hvSelIITJLLjcQKG+dm/l6L3rJQLxgmsTIIaBQ
	GshLVdenyVVP1ICdrJj8qTjZdOQBK1DGkKM6a1RkngdmxvneMQhBC/vtVoLAS2PBQ0cYJrZ5eTV
	6E1UpSxVErcoyVbQ7zuEp91fEZNSXcmJP2J3lPLCA+b20xR5xzQfqBek8/iTFf2Fi/mp2+l8Xjt
	1O4uLEruarsvHTumMNNWwTZRDeWJl6oqIdBreX1n8dwfG
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3143975eaf.17.1783428296929;
        Tue, 07 Jul 2026 05:44:56 -0700 (PDT)
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3143964eaf.17.1783428296510;
        Tue, 07 Jul 2026 05:44:56 -0700 (PDT)
Received: from [10.219.49.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13e15esm14448014fac.3.2026.07.07.05.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:44:55 -0700 (PDT)
Message-ID: <afc1fb30-1b9f-4124-b939-30600921de0b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:14:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
 <317be447-316f-4120-9008-2a1593328c68@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <317be447-316f-4120-9008-2a1593328c68@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cf4c9 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=zFzosQrJfojMdPK_vqAA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: cz1M-IRECV2TYeuTUh2_bdZtmeRP9Rh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX2oOBxkmDXmjT
 rVg60uwHA1XBFO0fIkRhAd1Z/it6pFoszu2XIJ8O398f/OcaE6hf6nMvUMPtU5NJuh77BnvIcaG
 J6G2vg83qtU/oda68BV9WzePMZeT6x85r/Fjd9tqGpdmBnI7SjfAn6K92TbCEmWN4rw5pzJ5vn1
 xt/qQ+WKcwCzC8qwf+5mubrRzt3yH1fGac0p5MOE8Kd+xg/4uqJ4Qf6d4+FQWTXUgP3LVnspPl0
 WYOSj3AL3nHxW3w+FH+3X/tUIAu1K+PsgT+/jSjDthMx3T+ir4Y5+BAGVkEaqzVyAynGIBmK5GY
 4ipziXkvkvnphIwxbMWbWpJ+dw75Bi2jqVM2tSetpE1lWPBwsnJb+UWKM6vHmEcBMOet2X2UsBZ
 O3038sN1oKnrVBk4CzJ35cDTY/+vUt+2s7+DoqohEb9/qRVVNSEdn7MlLfbdMzykjUTezr+9xP+
 7sK/8K1Zs20RkLVuIkA==
X-Proofpoint-ORIG-GUID: cz1M-IRECV2TYeuTUh2_bdZtmeRP9Rh7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfXwAABX9qmnTJO
 4x7RrCJmSrMPgP0gdpz1f6dzQPHcH61S7RuiKwnAZUgcqApi7wCGfmaqSDdYmDNCF/iwH3yOnF4
 F9jTjyRYMP5Z9a1ZPnOkXkzpMPzVbB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123


On 7/3/2026 8:37 PM, Mark Brown wrote:
> On Wed, Jul 01, 2026 at 07:29:13PM +0530, Prasad Kumpatla wrote:
>> Add an ASoC codec driver for the Qualcomm WSA885X stereo smart speaker
>> amplifier controlled over I2C.

Hi Mark,

Thanks for reviewing patch and feedback.

>> +static struct snd_soc_dai_driver wsa885x_dai[] = {
>> +	{
>> +		.name = "wsa885x_dai_drv",
>> +		.playback = {
>> +			.stream_name = "WSA885X TDM Playback",
>> +			.channels_min = 1,
>> +			.channels_max = 2,
>> +				.rates = SNDRV_PCM_RATE_8000_192000 |
>> +					 SNDRV_PCM_RATE_352800 |
>> +					 SNDRV_PCM_RATE_384000,
>> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
>> +					   SNDRV_PCM_FMTBIT_S32_LE,
>> +		},
>> +		.ops = &wsa885x_dai_ops,
>> +	},
>> +};
> Does the device actually support all the rates advertised, 11.025kHz for
> example?
Thanks for pointing this out. I have only validated a subset of the 
advertised sample rates and
have not specifically verified all rates within the range (e.g. 11.025 
kHz).
I'll restrict the supported rates to those that have been explicitly 
tested and validated.
>
>> +static int wsa885x_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
>> +				    struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct wsa885x_priv *wsa885x = snd_soc_component_get_drvdata(component);
>> +	u32 mask = ucontrol->value.integer.value[0];
>> +
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -EINVAL;
>> +
>> +	if (wsa885x->rx_slot_mask == mask)
>> +		return 0;
>> +
>> +	wsa885x->rx_slot_mask = mask;
>> +
>> +	return 1;
>> +}
> This looks like you're trying to put TDM configuration in the control
> API, it should be done via set_tdm_slot() - the driver does have one,
> but it only configures mono vs stereo with no control over slot
> placement.
The slot mask is use-case dependent and needs to be switched dynamically 
at runtime
(e.g. stereo speaker playback versus mono voice-call scenarios). The 
mixer control was
introduced to allow userspace to select the appropriate slot assignment 
when the active
use case changes. Given that `set_tdm_slot()` is generally used for DAI 
slot configuration,
could you please advise if there is any preferred ASoC approach for 
supporting runtime slot-mask
changes driven by use-case transitions?

Thanks,

Prasad

