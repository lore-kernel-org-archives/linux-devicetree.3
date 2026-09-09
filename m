Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D857C703
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965973; cv=none; b=p6pVYZvHV77pDFmPlSmNH3i/17Jw8fjETwBwvn3aQp7fAq6KIZ37qCkEttksWeakhGxB4cQRKOU10KGkijkx3htp6BoQd/sO5/zccqg4TcpIvBb+HzT2N9gv9E0maBZjbyFeo2y+19i4F4+qkmczTFLgNps+PlXA7rpdMO6ZzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965973; c=relaxed/simple;
	bh=drY8kln+BrxQaXWQfZyFkLzaCoRxh9DNMq+5RNOp4Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teRE4yUF8qPBJKiazkYAt+1yn3BxMZY7ppfTzSuKKzN4h6KfzSHZSBluPJDVWHQFD6TmBBlz9PMYdrFL7TEhvAHUkxk/PF9/IeeyROhhCsyry0Nrx9uX9gTEMeY+jZC7ISCRxNaFw6AMGJsR8Wc8VRZ0Lmt1YLZPG2IQNl3R9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIq8wfEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hciY6m5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIq8wfEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hciY6m5u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3Nh1183677
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e54EbhbbjxbNn3hH0o0iVyQp
	ZJxdrsa3hetZg+vrQVI=; b=gIq8wfEdEzwY5g240avguM89X3tRMzosuKP6mN38
	GF7zqYjStaHTOeGgrPVFCksIW+B0IICzq3HloEZHvkMw9V9YTa1cVvSgWmnlDjWb
	LNLafD5QDt3j3mGaScpGu2pxYY3uK3TWmbmUThMTMETFKVXlKHHdhdKQBI2BFwY9
	VTv+XFmE0Fbi25lYKakrnvpJ6POApDBnmjBz6qR8KFdSbrZxDH6vPo+xfmhfKFvT
	j/U5/MrJWXThTak7Xo1YLBkdMRy6SxBThe6mxCMpMPLxHmeVbLAzfWkgCLHNANco
	/T1w5hPh2NdyxzKMOtGrYOZNSE4GFM4x61T0G5OATuL1CQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s8q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:59:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3390588a91.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965969; x=1789570769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=hciY6m5ukxAsKtpnsecDmLIV30eM2fHX8K7lJXBRZkKMiwKDg7Ha6R0jwbcGOPX6l1
         pfdbWTFs7u3kUfkEizYrP9bGD7oKzzWsD3LlQVDm3OV2eH6Dbc2UtTQftq6Wry3ZfzSi
         uNgD8uVzU7CYhxlVgwJWDgcB5wVY7nApAWXS5hT6SIMrySMT7casnurpCIxajPyQXBqK
         cpEH/X36/1oSFp1TvEir4TIN8Nu0WcHbF8z+S1bd+Lq+4Ih5TJewo8L8+6Q9LQY6UdF9
         J2TOo4CRk1DtWSnmC08pHxYEwCeqDCBteHBaU1vZ47H1unIeOL3nM6c3W8mv7HL5PLv/
         NVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965969; x=1789570769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=eiNFNEhpRqnWRMucJwocUKCftoB1RIwctJoAJZUKO5NCUHcoTJfv/gHvASo33jj8qk
         Sc8SbsGkbcsJ1xhouf2cSqHeTNPaYaajKu5qEePayPJJOwdspEVnNXbF3kQnhNMnKMYU
         Lmm5TNyjvuaynJeXmP0uc71j3Gtf2gMXikMDgzlFvvLsWN0E8esq3BMpKPhFlaWWT2Ud
         5sKevRl2Nfs+8t7kYvIKDkj1VLUI0KMlU0qqZicpNaNRlInU6NpNTCuzEuMNO4uk1t4r
         BJdDN/jJQSobuHisj/tc40JJU5DulWMBs48DUceKcob2NafftyzGHWNFnlGXH9hcbuHZ
         7CjA==
X-Forwarded-Encrypted: i=1; AKwUvBxasF1spSkoaj0zALo/ZdGyQknLEksHq7nbSMNunPrC4TzoVsGhcEtD80HeRnFTLpEPmnyKoX6QNCNN@vger.kernel.org
X-Gm-Message-State: AFuF++ly4IB+HnPFUDmM7lBIrLL65+iaGtb8CgZe7AD/8kDDo0ZneFR/
	X8HHF8xk+fxvLrm+4Xs9y//3r2LL4qDJpq1nO3Tuzhr69rxL3nRNe9INmoE7lhAsSB0u9WqVKA+
	mbY/Do0AcMxyh7Hq8ac6OiCK78cvkvH9D3wyPSUqDc920LsGxYM1yrfE2zpd7sY4LWD+8TSP+
X-Gm-Gg: AYBFou3LLH2hby9mh8P+C2HfWJOo3gR3gd/wNPA15KeNjRV0ZHWXY1Tbjx5EC+ynMIC
	+NVA48i67ZSoQ7O2dSy65KOoVm5tc/xMNbIPt9n9c0tRoYm1koij9tCz2yz2BDVoFy+rxBzBez/
	MbtEV5R+EWWm/tJYTdWys1kFsRI7k9eB6hKcSvv+qwSMauDGX3v7Sw3Smi6lcVBr6alSGludkd+
	ThFIkly2oIfR/wsJ7cawkmxikWCQsxB3F6EOhdT2JnUY54yic44me8h7mB/4gHmVcplMHQ16YM9
	sdEd4yq7Iawiw+iJ/4TKirHHa6iky3EvjjU217Q297VCnV1a2BBxprLr9YphLpiGZwNqXbdI9Gb
	hzV/Dlm73kE7HQm1EhZ1GYiif2VdNKOdlkadOeVLlerA=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355550a91.1.1788965969470;
        Wed, 09 Sep 2026 07:59:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355467a91.1.1788965968764;
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm32456833a91.13.2026.09.09.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:59:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <aqF0R0FVrnC3hi6K@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa17452 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0Zc5S7fWRYNTRwHQfoIA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: TpLPO812lwyk-sn0pTayl6cEJ-9YHCuq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX//AQ/fKKvnNR
 tLZt/q6zlmEqT5dHTgke7WKAQRbOHdSZIlXN/oispYQ8amwZO0Pyr/f8DdRCfoigKT0PaQzArR/
 7VTN6vY94zzeSlK+D3ooqU8a0NuW0aI=
X-Proofpoint-GUID: TpLPO812lwyk-sn0pTayl6cEJ-9YHCuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX6oIDiBGGgYyO
 i3alr1kHoABYe1EFa5wkoO6jkjfB0O16AHiJQh4NAjezYIV3pWve3hJ+jYz2w2q8p0fK4YZXOdQ
 2HSOksHBlKTYQePEiZlUybzRLJEZ7tAoXvRDEwy1DlE1gUh8OTP/uCCbArbLYqhjbSstuTURL3h
 lVqi6pvWd9UTxXJ4qCzWtcIWaFo2dc3wCOL7wbg1C2lmIO+VlLfVnr/JqJQt3hdKgh5Ln6zkOyo
 ugnrA75J5uQ3UPaiyNAMZvq2FhuwNZncuzTjNWk4vUjlsJQnRZUX9kWcb7wwNbsh75vlKBxGxN6
 N2ANY5QJZ0f62xELnYWcsz5XILDKtRW9FsHLSaJi4HZzw4MFPEc7CipP3XH6bPa/1H8nm3N2asc
 WOog8RLCiXbSwYigp3IfCjJeZwP3mK5ksenr+k7T/rytgyN5UabSoYE4XijGanKtK0n1DhUd701
 aLhM2qkkq7O5BR+9LtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 DAC requires the SCK (system clock) input to be
> present for proper device operation. On platforms where SCK
> is provided by a controllable clock source, register accesses
> over I2C may fail when the clock is not enabled.
> 
> Add optional clock support to the PCM1681 driver by acquiring
> the "sck" clock, enabling it during probe, and registering a
> managed cleanup action to disable it during device removal or
> probe failure.
> 
> This allows platforms to model the PCM1681 system clock through
> the common clock framework and ensures the device is operational
> before regmap initialization and register accesses occur.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e05..cfe549176d14 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -74,6 +75,7 @@ struct pcm1681_private {
>  	unsigned int deemph;
>  	/* Current rate for deemphasis control */
>  	unsigned int rate;
> +	struct clk *sclk;
>  };
>  
>  static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret = clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev,
> +				       (void (*)(void *))clk_disable_unprepare,
> +				       priv->sclk);
> +	if (ret)
> +		return ret;
> +

All three calls can collapse into one?

	priv->sclk = devm_clk_get_optional_enabled(&client->dev, "sck");
	if (IS_ERR(priv->sclk))
		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk), "Failed to get sck\n");

Also, priv->sclk is never used after probe, so drop the struct member
and use a local.

Shawn

>  	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> 
> -- 
> 2.34.1
> 
> 
