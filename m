Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE538AC88
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458039; cv=none; b=iW89EQNbrKuTUMxYWaEEgM4xyiEJz/nvzMjzCXYKokpqfCYkVZOy322b7+XKrKLDM1PpRXiOpPKG0gDn37o9UaJiLzr88V4JJc1gEGJ76tgmQbABZD3UVKg1A4Ijpe7eE9eWiAdbheggnAMCikWFLDIS7F7WfNjaOAtfYM+/HA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458039; c=relaxed/simple;
	bh=mudWdDviHLU+eK4Sd0tY4T+jU/8HplxyIPYAdfADSTg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SxtuYXtdLFLtOa/O5YyYDiXPSzgvPoaFVuANSZAu83e7eqNRI5wT3OcLpDl+AKWv5XOGNFzcR7ZdNA8dCWSPdl7X2mYr/Bekfm3roSDH4BYIpqSrLLIsQMAQ9jPC1/o6gJ510sqvaz1WjbqNrO26rEhHGDRq6KNE4Wm54pzQ4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KotiRgvX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KotiRgvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF9E1F000FF;
	Thu,  8 Oct 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791458038;
	bh=5KIiEoFxQadhBbaAqWEZHj9ax/oi0kHfINsWIRUWnYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KotiRgvXCi5IEBwy6tgKUAFOSDU3qEqSF6qfkKG+x6brIii2mbgRMAXV8AVQ4ohZV
	 VX2a8s6uWmIlneShH+VTi9EHJdJ2wt0XPhur8/RVnN3xddPvlX/Z0Om48LOegzDx/f
	 WOeJGfz8QID5ASSqaU8f+fboDJufS2HcO7TsR9VJdSbD/oxi8b+CKW3seVF2pX0Mgf
	 2O7u6pg/YlQpRhdIcHE3sFsjhNm9ZJh9DToJvXhSQuytbKvDTRgHb5eF66oJB/9BHC
	 kvVC3YX8HWvO+f6l5k967V401DjD3vdV6t8JEF2o5o8BUFqMgH38Q2j8nvd17mPFZ9
	 G3AUbbEZovTGA==
Message-ID: <sashiko-outbox-164079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-2-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <20261008-nord-asoc-driver-support-v2-v2-2-0b6f7e94060d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:13:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: devres lifecycle ordering bug causing I2C access after clock=
 is gated
--

commit c3c4668080e08de3f73de6e53cea7fdcb695945c
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support

The PCM1681 requires its SCK system clock to be running before register
access. This commit adds support for an optional sck clock and uses
runtime PM to manage it instead of keeping it enabled permanently.

> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e054..a1ccf1edf4819 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
[ ... ]
> @@ -304,34 +335,128 @@ MODULE_DEVICE_TABLE(i2c, pcm1681_i2c_id);
> =20
>  static int pcm1681_i2c_probe(struct i2c_client *client)
>  {
[ ... ]
> +	ret =3D devm_snd_soc_register_component(dev,
> +					      &soc_component_dev_pcm1681,
> +					      &pcm1681_dai, 1);
> +	if (ret) {
> +		dev_err(dev, "Failed to register component: %d\n", ret);
> +		goto err_pm;
> +	}
> +
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		clk_disable_unprepare(priv->sck);
> +	pm_runtime_set_suspended(dev);
> +
> +	return ret;
>  }
> =20
> +static void pcm1681_i2c_remove(struct i2c_client *client)
> +{
> +	struct pcm1681_private *priv =3D i2c_get_clientdata(client);
> +	struct device *dev =3D &client->dev;
> +
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	/* Runtime PM may already have gated the clock */
> +	if (!pm_runtime_status_suspended(dev))
> +		clk_disable_unprepare(priv->sck);

[Severity: High]
Does this devres lifecycle ordering introduce a regression where I2C bus
timeouts occur during teardown?

Since the component is registered using devm_snd_soc_register_component() in
pcm1681_i2c_probe(), it will be unregistered during the devres phase, which
runs after pcm1681_i2c_remove() completes.

By manually disabling runtime PM and gating the hardware SCK clock here, the
clock is turned off while the ALSA component is still fully registered. The
subsequent devres unregistration phase will invoke ASoC DAPM teardown
sequences, which perform regmap writes to power down widgets and lower the
bias level.

Because regcache_cache_only() is not enabled here in pcm1681_i2c_remove(),
wouldn't these regmap accesses attempt physical I2C transactions to the
device with a gated SCK clock, resulting in I2C timeouts or hangs?

Could this be fixed by using snd_soc_register_component() and unregistering
it explicitly at the beginning of remove(), or by using
devm_add_action_or_reset() to manage the PM and clock teardown after the
component is unregistered?

> +	pm_runtime_set_suspended(dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-nord-asoc-=
driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com?part=3D2
