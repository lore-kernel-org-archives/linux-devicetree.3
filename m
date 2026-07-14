Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF33DBD5E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012043; cv=none; b=a4qMSjmyDFEGVfuE7ny2zeOquUSKenJSc/SoydXaA0wH1clusSikUQyITJ75IhkhEdb8JnFeMo/ZreHvyhbJ5q1P703TcMx7XbTVkzpL4TdoXiuwHhv4NNGD1j5uPeoWCsEiA90LvxCp/7lNp3RmPiP95xI6hzP95npUWhkqYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012043; c=relaxed/simple;
	bh=du1fKzl+zbOOxRTgFJqsNwKglby2lARhz5MLhrd3ZZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZ/d5BWAnyQv1Z10z4Wnx8p+enQlgLuyb3iXzOgKf880F2JWtm+RgQ1VVYVOF/cahuZhijfFtvhKaNhgum8hEajHSkAUmAGfQ2Aq52AI7SL2lKup1yLzWTk4lc9z4+jwWxZWhmQexH491Jvu5ddkHq3oACAhoPTknfheGjAsZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQBcd6TC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmgoV44U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQBcd6TC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmgoV44U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SUR33929089
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=; b=hQBcd6TCFMk1uei+
	3DVeRMg8odbYQdEksVZAVFPi6eAk4p6FpJbPhseav4gSz+ZYSAfFawpiYI2DRT+1
	nPsKmA8K4xkxDqfLLPFy8N323iigAyLo0nXcQ7wuwzCNyAfmuzlzYAdDUJ2aapOl
	5aqdR+LhpZ9NaaY65/V/doJvBLTbksxRX+II1jRdBMWx8TCHB7bckWpOJZhR7Ckd
	elSUj17IgFftdJUTyXHxwUATkwDnya16r3yCl3HGbhwxY5Nz404OTiQXmTd+EL6O
	gtjLxoqSDwxR/R+nxhVUgUb88HvrMpnUS++Ux341WfGOgjctQN2VUYIjR2LDwx1R
	gOBoLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xaqa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:54:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f3951a6d76so13110456d6.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784012040; x=1784616840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=NmgoV44UZX/ToGg+4sJhf7vHFqDJObFZctCdKAkCNg7Rv1xPuEulc5A0F6szzYGghL
         jW/snnYQIRBeVSVgRrrmMLQKdng9Uc4jOLDuwGlej8YYEGTL1ibOhc5KvoGO0XnBun9p
         yREBQt1Z7f/S98olIqu511u9s8yBU9pWqv3KDBU4w9UjQ4wtgxFX/kkPp5EQM5lkcAg5
         vGnh1ZdhJDIhX3IllckL4i0xS+E3CftBleh3rdC6JX0fw/tAQvP3gjVnYyGHv4CnmN2N
         vzINGyNsS1yYcTpt5abDUQ7XfGzKcqaLnJyvUkTNC6ucV24h8E9E0cdIfnQQ6fJB5+zI
         m1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012040; x=1784616840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=HM+Q6aEUS8zUrX4KSTTWr1XFpSQknhpAKRhm0oWDgmWetBljnNTV3qQ4Cqx+Tk978V
         uvg6oDMS6ftph739f6Lr2LhcjmYlbrVUCH5BYOrZDWyjqoScz9SMQBNkNcJfpDVQebqI
         ltkG+3edt8X+hhxPewMKqBqPM50acvQ0waRm5HXUaD3R7l5WJ/OkZECZ9oKbbDTa0iaB
         jBgVoxhPPfNFPIuStEp+JR9qsW88dg5nNINrhxms5yufZgLPQAbWPx+s4QHtBox95QLo
         0geEWfK6f5ugHFDsTdt2D6ASMmBSexp6bW2CNHfzYbwTvI6GISp4mEuUvbj3a7QkUuH+
         IrLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp6MGu5R461pV7uVyPCoCm8a8ZjAnXofERh148x01EoEfmX08O0zmVuZiUKmOU0BU+Coyw886OdK/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzluk6qUdd7REb7hH3eFpdXDlAnipKQbbbdNEjPBiLZSnhEmmzr
	Co03VKY9ppQON+vDU4+ZFXwiMuNIq28MOeLk1o2mYakJaDX71LSG+qDZ/Cs7ZI4GRkwTLu/aesN
	Q2R2ov/WrFCMpcUnGfgRPV/Z0CK69GF8y5vH84lPnaHirVX5kQTMEYRjM0RzWFNBK
X-Gm-Gg: AfdE7ckgC31EcPfbzRGTGM5gLPo5bgBXE+6O61ztcA2Bm2goS8Pb9nUspcZ/4ymBaaF
	qpn0OQWoGdB0+EOvJVAkiLFSbpV6CUclpxz630PsBFBM7jVhMoXOjHb+c8G51YROdcR+u9mWKqm
	mVOYM/Dhkv+Jth7xA87KNP7mgSIS7LUEGLjgVPPEAygTShPDbJmqfo+y4Mu/sU9+VKOMmBKXdDh
	z5Fi4fkUndQi+q+QoPzorpZffyc8JCG/PqaWWQ6ZdfaVUrremZUNM3Z+GxgwG/uN9uuwGrJtTPs
	Izd8DaH9LFxO35de3Ihf6gNABckZ51GC9n7e6KObJ6BFJ4DAtYvvXRin44AS/cJeHOyWick6jMe
	4D1e8Uz+3X534GRDlH71Xn7C4x0Y7s62q1vQ=
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925466d6.9.1784012039924;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925286d6.9.1784012039462;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd295656fsm862065a12.29.2026.07.13.23.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:53:58 -0700 (PDT)
Message-ID: <d132334b-f920-4858-b690-baeda6c527a0@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:53:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfX8s/zW8pMsyNo
 9l1ThnTh+ZRcwkfI593jCZenxJVBzR5y7cJDD758ijV+WGGUojGEeE5Ht2MzGukNwB/RpPWTdYn
 o7Fcul/IIEsFHoraNbK3AUBmt15M0Q7KgAm6PjV/Ri9H0TYQwPK74K1hefzWsne3LTD2y4hyfoq
 q+GSM/O7B2RzKlyokNk0M9FkJi0Hfp3larm3IGv+I1/mWOh0U4ZJT/RipBwvqe1Bmi7ePx6yyaz
 0KdWE/cGv6uXSI63UVSJ0yZsO9zILJ9mhcUXw7LDEkoY/6AtvYU9raRK4jyXtgEzyUMBfHAKfRK
 RxNLqtmTklKblSzHJ836HN0lEWdRkbop04itjz1RiV7ryheC20+1WduMbSrteovwLfiHEYpF8yU
 6Lk3XdogIKeMwCSynxSfwHHPlWf0R7Kefju/R03Navx7P9h9cRHwr7CO6HFwtOkKRrLZ9mj5UK0
 4KokZ54p00TEaeI50JA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55dd08 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9XzChZoegFnburFei4AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Q0e5el-nN1qXGukFSOnGDKIRmyfT8oBh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfXzYhffkn+op4y
 W2K879KPMVGyEUgs4yGxUCoDqVV8/5ZV/oQGAudgTuwL6dj7tw5N/xI6TroMSKi2FbbOKFMwzfD
 bNMBw8Ne9+GDOjpOjeAFw3Mg+7J2Exo=
X-Proofpoint-GUID: Q0e5el-nN1qXGukFSOnGDKIRmyfT8oBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140070

On 7/13/26 10:05 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases
> and can serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---

[...]

> +#define LPASS_RATE_GEN_CTRL		0xD000
> +#define LPASS_RATE_GEN_COUNTER_0	0xD004
> +#define LPASS_RATE_GEN_DELAY		0xD010

lowercase hex, please

> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct regmap *regmap;
> +	const struct lpass_va_csr_data *data;
> +	struct clk_hw hb_hw;
> +};
> +
> +#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
> +
> +static int heartbeat_pulse_enable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);

regmap_set_bits()

> +
> +	return 0;
> +}
> +
> +static void heartbeat_pulse_disable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, 0);

regmap_clear_bits()

> +}
> +
> +static int heartbeat_pulse_is_enabled(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +	unsigned int val;
> +
> +	regmap_read(csr->regmap, LPASS_RATE_GEN_CTRL, &val);
> +
> +	return !!(val & LPASS_RG_CTRL_EN);

regmap_test_bits()

Konrad
