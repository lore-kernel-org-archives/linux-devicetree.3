Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA626E165
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886282; cv=none; b=rNkDFq+w3M+2c9d5pKBge+apnE0+SO62s/ZvjTf8odG5Msjb4t6dEi3XF9GmFhtLSES0vXw9sntErpAevaWKdLmEwpE9/vb4FwwSKZn4UhWhTkTWhLKiAiSH/qT0bc4ctgw6M9YPY5GVJsCwEPRt3/i50KmkBlUoPzG12E6hoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886282; c=relaxed/simple;
	bh=eFrijx7ZA1QWUNRyATk4/xMjtGNNOlUvL1Ca5ljDA2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J8LdQSJ5RaUtBqgZXA4yUwblKMITRwgiTFAdkNVAsqDU4o+2upok5i6bsrZGcKrqAtEpv3f58KGhEn1DmO4fLv2BzMiTwo6g9aH6Mh+QgQzDXk6N5YTqxPM3t7AWUnS8uOcsTmM72QYUQx9JD+JLGb7J1+Po7+58EGGe/5tISWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AupZy8fW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AupZy8fW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22171F00893;
	Mon,  8 Jun 2026 02:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780886280;
	bh=I/S++X2GEdIbt7I4van65+iRPUnC0chQq17/Ei/eooc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AupZy8fW1XVHC6ZD8+/1DY/zYIruMTpjsPmQ73hgu1DY0B343M3ZSz/q0/qXLnf/Z
	 nEzFmK5Mkbg6OiDXpzrKGmRYniLeIrKwl4ZzuT5H3rW+9xPQtPn15R846/t/ZgD81A
	 4N1OP03ngtLU3TVTg44SWz/p3Z6PGAsEbs2YtXZIQA64dlbN2HjeqID/rsN4zcyTGb
	 Oykypnc4CgkGtja6WfVcLUpbgI4gBbTxbRt/uWU85DzntNMLJDLPzPbJyiyHte+RGS
	 PYhEc5w2n/RVLJ7zSmUC7i1UaNtay7Xf+tlrxM6UpeIiSgZ6Pstzg2ZHeJ5p4fN5OE
	 sTxMmhyHAxt3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:38:00 +0000
Message-Id: <20260608023800.B22171F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Uninitialized pointers `sysclk` and `enabled` in `q6i2s_set_sy=
sclk` can cause arbitrary memory writes and kernel crashes.
- [High] Clock references acquired via `of_clk_get_by_name()` are never rel=
eased with `clk_put()`, causing permanent resource leaks.
- [High] Unbalanced clock enable/disable logic between `.set_sysclk` and `.=
shutdown` causes clock enable count leaks and hardware state desync.
- [Medium] Missing `of_node_put()` on early return inside OF node iterator =
loop causes device node reference leak.
--

commit bb83de598c284e0e9f9b088d18eb243bc21c7bbd
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
   =20
Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

[ ... ]

> +static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream=
, struct snd_soc_dai *dai)
> +{
> +	struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->dev);
> +
> +	if (dai_data->priv[dai->id].mclk_enabled) {
> +		clk_disable_unprepare(dai_data->priv[dai->id].mclk);
> +		dai_data->priv[dai->id].mclk_enabled =3D false;
> +	}
> +
> +	if (dai_data->priv[dai->id].bclk_enabled) {
> +		clk_disable_unprepare(dai_data->priv[dai->id].bclk);
> +		dai_data->priv[dai->id].bclk_enabled =3D false;
> +	}
> +
> +	if (dai_data->priv[dai->id].eclk_enabled) {
> +		clk_disable_unprepare(dai_data->priv[dai->id].eclk);
> +		dai_data->priv[dai->id].eclk_enabled =3D false;
> +	}
> +	q6apm_lpass_dai_shutdown(substream, dai);
> +}
> +
> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigne=
d int freq, int dir)
> +{
> +	struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->dev);
> +	struct clk *sysclk;
> +	bool *enabled;
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
> +	case LPAIF_MI2S_ECLK:
> +		sysclk =3D dai_data->priv[dai->id].eclk;
> +		enabled =3D &dai_data->priv[dai->id].eclk_enabled;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (sysclk) {

[Severity: Critical]
Are the pointers sysclk and enabled initialized when clk_id falls into the
default case?

If an unsupported clk_id is provided, the switch statement completes without
assigning values to sysclk and enabled. The local stack memory could
evaluate as non-NULL, causing clk_set_rate() to be called with a garbage
pointer.

Additionally, does this lead to memory corruption when it executes
*enabled =3D true; writing a boolean to an arbitrary, uninitialized address?

> +		clk_set_rate(sysclk, freq);
> +		ret =3D clk_prepare_enable(sysclk);

[Severity: High]
Can this lead to unbalanced clock enable/disable counts and broken concurre=
nt
streams?

In q6i2s_set_sysclk(), clk_prepare_enable() is called unconditionally,
meaning multiple invocations will increment the enable count multiple times.

However, q6i2s_lpass_dai_shutdown() runs per-substream. If both playback
and capture are active on the same DAI, shutting down the first stream
will disable the shared clock and set the enabled boolean to false. Does
this prematurely kill the clock for the remaining active stream?

Similarly, if the enable count was incremented multiple times, but shutdown
only disables it once before clearing the flag, does this leak the clock
enable refcount?

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

> +static int of_q6apm_parse_dai_data(struct device *dev,
> +				   struct q6apm_lpass_dai_data *data)
> +{
> +	struct device_node *node;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
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
> +			priv =3D &data->priv[id];
> +			priv->mclk =3D of_clk_get_by_name(node, "mclk");

[Severity: High]
Are these clock references ever released?

The clocks are acquired here via of_clk_get_by_name(), which increments the
underlying refcount and requires a matching clk_put().

If a later clock lookup within this loop fails with -EPROBE_DEFER, the
function returns early without freeing previously acquired clocks. Furtherm=
ore,
because these are not managed via devm_ and there is no teardown logic or
.remove callback provided, does this cause a permanent resource leak when
the device unbinds?

> +			if (IS_ERR(priv->mclk)) {
> +				if (PTR_ERR(priv->mclk) =3D=3D -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
> +							     "unable to get mi2s mclk\n");

[Severity: Medium]
Does returning here leak the device node reference?

The for_each_child_of_node() macro automatically manages reference counts
during iteration, but an early return requires a manual of_node_put(node)
before exiting. If this loop exits early via return, will the device node
reference be leaked?

> +				priv->mclk =3D NULL;
> +			}
> +
> +			priv->bclk =3D of_clk_get_by_name(node, "bclk");
> +			if (IS_ERR(priv->bclk)) {
> +				if (PTR_ERR(priv->bclk) =3D=3D -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->bclk),
> +							     "unable to get mi2s bclk\n");
> +				priv->bclk =3D NULL;
> +			}
> +
> +			priv->eclk =3D of_clk_get_by_name(node, "eclk");
> +			if (IS_ERR(priv->eclk)) {
> +				if (PTR_ERR(priv->eclk) =3D=3D -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->eclk),
> +							     "unable to get mi2s eclk\n");
> +				priv->eclk =3D NULL;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608023011.9422=
28-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D2
