Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005B386C3D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918767; cv=none; b=F+iT0NGkCEsJuYp9pSOC3tC5nUENgc8YbUExpJcfEoeakF4TEbzuaXKIWocLGA/GnEKYHTUILckiyfB3t+j3IRqB0/EvpoGEygiskFOtE5Kzx1DZJACHZ+dWx+wru9v8gzKToGgOgV4QcTzwWpdzou1zzne5YuLdtYkPuNueDNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918767; c=relaxed/simple;
	bh=UTRq8wu5ajeLGiuQPhIU+unnVdPePA41M/tcuYQJi6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtJP/1ISRmPGt/9HeAob5njbzBEqGcQrgImrLEWfmmI22/vesUksthNOoQDXfAS4+5xK1nO9Ot5Q2SGjhucmQQ9aJyRxKIlM2oqotekil9V4hzlB6UMPO5ZOrbnp+GX4NaL2MdD4Q+LeQrZ309W8AtO8ZdhV2QnzzurzBBw+I6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV7xI6eY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV7xI6eY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9831F01558;
	Fri, 24 Jul 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918765;
	bh=KxWVzTSK6E+V5LKLPnuxgxbbrUpDaKrPRcDJyrtSMlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TV7xI6eYMSQDXM1JwVAOwFnZvvUIgGTlhYS9PjZimI16wlne/qAHS6CIYuSkH0Kgd
	 z24VS5R/yTHdERjA2Q8Bc2wio6aO6AIViDl80sXNsnfyOqNiedvfFWPi8Gbbxo/9t6
	 BF3PteCk1D1jDYQHcy///+UyCxq3w7zVvyKl9n3fa/gfR3KgfMDV4VwUKBLS12SznP
	 8lKXH5URNGTFpElYghOcsYK8liif3BNu+OpRyh3Rq7xJcMalpRMfo2VCXB0P1JJzFm
	 byAe2rQdYRG3Mje6AO/P6f7PHLQZavAroPxOYJZ3utXYjTRNAFSepKxLH+sDJZkM8Y
	 zwOrYN/7m+6gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724182446.1484894-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260724182446.1484894-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:46:04 +0000
Message-Id: <20260724184605.2B9831F01558@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing freq =3D=3D 0 check in set_sysclk causes permanent clock e=
nable leak
- [Low] Memory leak of clock references on duplicate DAI nodes in DT
--

--- Patch [2]: [PATCH v7 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock =
control ---
commit bf9b1226eaeb15dbad44a1a60c78519c600713d4
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control

This patch adds support for MI2S clock control within q6apm-lpass DAIs.
It retrieves MCLK and BCLK handles from the device tree for each MI2S port
and manages them via the DAI set_sysclk callback.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qds=
p6/q6apm-lpass-dais.c
> index 006b283484d9e..e68e8b000e079 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

[ ... ]

> @@ -251,6 +292,62 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_su=
bstream *substream, struct s
> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigne=
d int freq, int dir)
> +{
> +	struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->dev);
> +	struct clk *sysclk =3D NULL;
> +	bool *enabled =3D NULL;
> +	int ret =3D 0;
> +
> +	switch (clk_id) {
> +	case LPAIF_MI2S_MCLK:
> +		sysclk =3D dai_data->priv[dai->id].mclk;
> +		enabled =3D &dai_data->priv[dai->id].mclk_enabled;
> +		break;
> +	case LPAIF_MI2S_BCLK:
> +		sysclk =3D dai_data->priv[dai->id].bclk;
> +		enabled =3D &dai_data->priv[dai->id].bclk_enabled;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (sysclk) {
> +		ret =3D clk_set_rate(sysclk, freq);
> +		if (ret) {
> +			dev_err(dai->dev, "Error, Unable to set rate (%d) for sysclk %d\n",
> +				freq, clk_id);
> +			return ret;
> +		}
> +
> +		if (*enabled)
> +			return 0;
> +
> +		ret =3D clk_prepare_enable(sysclk);

[Severity: High]
Will this leak the clock enable count if a machine driver calls
snd_soc_dai_set_sysclk() with freq =3D=3D 0 during teardown?

Many ASoC machine drivers call snd_soc_dai_set_sysclk() with a frequency
of 0 to explicitly disable clocks. If this happens after the DAI's shutdown
hook has already cleared the enabled boolean to false, this function will
see enabled =3D=3D false and incorrectly call clk_prepare_enable() again.

Without a subsequent hook to turn it off, the clock would remain permanently
enabled, preventing the system from entering low-power states.

Should there be a check for freq =3D=3D 0 to handle clock disable requests?

> +		if (ret) {
> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
> +			return ret;
> +		}
> +
> +		*enabled =3D true;
> +	}
> +
> +	return ret;
> +}

[ ... ]

> @@ -297,6 +395,64 @@ static const struct snd_soc_component_driver q6apm_l=
pass_dai_component =3D {
> +static int of_q6apm_parse_dai_data(struct device *dev,
> +				   struct q6apm_lpass_dai_data *data)
> +{
> +	int ret;
> +
> +	for_each_child_of_node_scoped(dev->of_node, node) {
> +		struct q6apm_dai_priv_data *priv;
> +		int id;
> +
> +		ret =3D of_property_read_u32(node, "reg", &id);
> +		if (ret || id < 0 || id >=3D APM_PORT_MAX) {
> +			dev_err(dev, "valid dai id not found:%d\n", ret);
> +			continue;
> +		}
> +
> +		switch (id) {
> +		/* MI2S specific properties */
> +		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +			priv =3D &data->priv[id];
> +			priv->mclk =3D of_clk_get_by_name(node, "mclk");

[Severity: Low]
Does this leak the CCF clock references if a malformed device tree provides
multiple DAI child nodes with the same reg value?

If multiple nodes map to the same id index, the assignments to priv->mclk
and priv->bclk will overwrite the previously acquired clock pointers from
earlier iterations without calling clk_put(), leaking the previous clock
references.

> +			if (IS_ERR(priv->mclk)) {
> +				int err =3D PTR_ERR(priv->mclk);
> +
> +				priv->mclk =3D NULL;
> +				if (err =3D=3D -EPROBE_DEFER) {
> +					q6apm_lpass_dai_put_clocks(data);
> +					return dev_err_probe(dev, err,
> +							     "unable to get mi2s mclk\n");
> +				}
> +			}
> +
> +			priv->bclk =3D of_clk_get_by_name(node, "bclk");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724182446.1484=
894-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D2
