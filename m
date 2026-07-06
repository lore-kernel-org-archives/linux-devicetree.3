Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0C230D403
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344838; cv=none; b=FOGiX0IOrlTPZVrxmlsGMVxh9Oaac3cBJRDdu+5Lp2V5VATqhT1HLroXS9vd7NCd/vvLJBA5JaN99KpTumAK7FzAQ+qTG3PNBySoijSfn9hmKHbCf8CJ2kpfspN7mwBJgI7MnsfD6JyITbb0pJwok1K+mhQTflq6i5FUSk59j5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344838; c=relaxed/simple;
	bh=b+N2ltO9hfYIVw7XE/WKtBsmL93m/K/hmF71syk0xhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HupqeGnz9BQMJGKqmi4bJ/q1gFW7p+d18Tsolgf2QTmF7MS84yQFUKg8sU1oI13uX5JLMFADTS78JhlmJVHE/9pnNZhmZbOF9Uwv62hEBErCpg843fFwssSfOU17U3zoJwEOMfzAazRm0MNQAXEtifIq4rAqtGg5FGZIadYqvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYNPXADb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYNPXADb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728A71F000E9;
	Mon,  6 Jul 2026 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344836;
	bh=k4iogVNN7CpE6+4wuDYK2+5KXzNHfH9ZA9btD58E+H4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AYNPXADb5FDBziV/fyTdpZMBNIgAoq3Zk9dqxDRhcAvS0K4OOzMpkU2cEFScCphzi
	 WWVRrqe/VdGBgvXfYKYULJHUji+2huvK8Xl81d1nMCzIx50LZtF+xv8oLogeGQSGyW
	 qyTfY0jnKmgfeIQ0Jiy1hkGnE8HZs2sMSpYelgIzXweHC4Nmhw75iQQBWWXcC8V4Zf
	 JO9psOIudoqrQYpETJOzc3Pz56lQUYEMjF7Ii9nKUCnkot85CMoJzwX2vkE2eODqlf
	 rZjWsEryK5Zfi8xd/Fdl+PzqaWpw8VW/ZC0I8zhvod9fkfqt67PbUPj2vFe8DqhS/r
	 xI7svs+1zIH4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 13:33:56 +0000
Message-Id: <20260706133356.728A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Clock references acquired via of_clk_get_by_name() are leaked on e=
arly probe error returns, driver component registration failure, and driver=
 unbind.
- [High] q6i2s_set_sysclk() silently ignores frequency updates if the clock=
 is already enabled, preventing ALSA stream reconfiguration.
- [High] MI2S clocks are disabled before the DSP graph is safely stopped du=
ring DAI shutdown, which can cause hardware lockups.
--

commit 194ae39f86b1dc7d38cb5e3de67fcbfe435cfeea
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control

This commit adds support for MI2S clock control within the q6apm-lpass
DAIs, handling MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
It allows per-port clock configuration and proper enable/disable
during startup and shutdown.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qds=
p6/q6apm-lpass-dais.c
> index 006b283484d9e..461e655265060 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
[ ... ]
> @@ -251,6 +262,73 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_su=
bstream *substream, struct s
>  	return 0;
>  }
> =20
> +static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct=
 snd_soc_dai *dai)
> +{
> +	return q6apm_lpass_dai_startup(substream, dai);
> +}
> +
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

[Severity: High]
Does this code disable the physical MI2S clocks before stopping the DSP gra=
ph?

Since q6apm_lpass_dai_shutdown() sends the stop command to the DSP, disabli=
ng
the clocks first could violate hardware teardown requirements and cause
hardware lockups while the DSP is still actively streaming.

Should the clocks be disabled only after the DSP graph has been completely
stopped?

> +}
> +
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
> +	case LPAIF_MI2S_ECLK:
> +		sysclk =3D dai_data->priv[dai->id].eclk;
> +		enabled =3D &dai_data->priv[dai->id].eclk_enabled;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (sysclk) {
> +		if (*enabled)
> +			return 0;

[Severity: High]
Can this prevent ALSA from reconfiguring the sample rate?

The ALSA framework can call set_sysclk() multiple times for a stream, such =
as
to dynamically reconfigure the rate. Because this early return ignores
frequency updates if the clock is already enabled, the physical clock may
remain at its initial rate and cause audio distortion.

> +
> +		clk_set_rate(sysclk, freq);
> +		ret =3D clk_prepare_enable(sysclk);
> +		if (ret) {
> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
> +			return ret;
> +		}
[ ... ]
> @@ -297,6 +376,73 @@ static const struct snd_soc_component_driver q6apm_l=
pass_dai_component =3D {
>  	.remove_order   =3D SND_SOC_COMP_ORDER_FIRST,
>  };
> =20
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
> +			if (IS_ERR(priv->mclk)) {
> +				if (PTR_ERR(priv->mclk) =3D=3D -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
> +							     "unable to get mi2s mclk\n");
> +				priv->mclk =3D NULL;
> +			}
> +
> +			priv->bclk =3D of_clk_get_by_name(node, "bclk");
> +			if (IS_ERR(priv->bclk)) {
> +				if (PTR_ERR(priv->bclk) =3D=3D -EPROBE_DEFER) {
> +					if (priv->mclk) {
> +						clk_put(priv->mclk);
> +						priv->mclk =3D NULL;
> +					}
> +					return dev_err_probe(dev, PTR_ERR(priv->bclk),
> +							     "unable to get mi2s bclk\n");
> +				}
> +				priv->bclk =3D NULL;
> +			}
> +
> +			priv->eclk =3D of_clk_get_by_name(node, "eclk");
> +			if (IS_ERR(priv->eclk)) {
> +				if (PTR_ERR(priv->eclk) =3D=3D -EPROBE_DEFER) {
> +					if (priv->mclk) {
> +						clk_put(priv->mclk);
> +						priv->mclk =3D NULL;
> +					}
> +					if (priv->bclk) {
> +						clk_put(priv->bclk);
> +						priv->bclk =3D NULL;
> +					}
> +					return dev_err_probe(dev, PTR_ERR(priv->eclk),
> +							     "unable to get mi2s eclk\n");

[Severity: High]
Does this leak clock references acquired in previous iterations of the loop?

When a clock lookup returns -EPROBE_DEFER, the current code properly cleans=
 up
clocks for the current node, but it returns without cleaning up clocks acqu=
ired
for any previous child nodes. Since probe deferrals can occur multiple time=
s,
this could accumulate leaks over time.

> +				}
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
> +
>  static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  {
>  	struct q6dsp_audio_port_dai_driver_config cfg;
> @@ -304,12 +450,16 @@ static int q6apm_lpass_dai_dev_probe(struct platfor=
m_device *pdev)
>  	struct snd_soc_dai_driver *dais;
>  	struct device *dev =3D &pdev->dev;
>  	int num_dais;
> +	int ret;
> =20
>  	dai_data =3D devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
>  	if (!dai_data)
>  		return -ENOMEM;
> =20
>  	dev_set_drvdata(dev, dai_data);
> +	ret =3D of_q6apm_parse_dai_data(dev, dai_data);
> +	if (ret)
> +		return ret;
> =20
>  	memset(&cfg, 0, sizeof(cfg));
>  	cfg.q6i2s_ops =3D &q6i2s_ops;

[Severity: High]
If devm_snd_soc_register_component() fails later in this function, are the
manually acquired clocks leaked?

There seems to be no error handling path or devres action to call clk_put()
for the clocks acquired in of_q6apm_parse_dai_data(), leaving them permanen=
tly
leaked on registration failure.

Additionally, since q6apm_lpass_dai_platform_driver lacks a .remove callbac=
k,
does this also guarantee that all acquired clocks leak during device unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706132009.1496=
321-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D2
