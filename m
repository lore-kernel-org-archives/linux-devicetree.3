Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8947443C24
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552214; cv=none; b=ZGAs/WhPSsufNcTbLjp+hlFDGbq2aLFSGiPE9206qwRYCyIxs5HRKfFDZkmc/KoFJEw7X0sEnSXKEfyrhJtu0eO6LaUUmTdQs6PEX/3INvxb8jw4aEHBcHjXeA1i4Jrx6XO/rHPgpkfnVIGiwj1e4MTPdGaX5HiSRaF9eV8YVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552214; c=relaxed/simple;
	bh=vZmadhl8HovBFuoYSgJ0l6yYPPai9xg7lnCos4x01KM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ip03l1+5qkgnHf+RWpPOhb09/UoNNyF+B8F63vgvjgiNLP0mNdGMJWTmLD2wARAa9V9VF5rsnsPEqRMW8cUjqDlj+zS17tWhjPzlbdXvM0zPTUGOYrS/mgDAndhBNwfHzZNx0i4dSCPgJ8oMwgmMeSDcoh3QE2LRFedv9AMZ7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMpOJOCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMpOJOCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE241F00893;
	Fri,  9 Oct 2026 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791552213;
	bh=4dxBjR0nMtZsiqCjM5ZazNzkdxHWcJqn8BaJ2q+Oclw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mMpOJOCq0C/vxQoKMieBHnmeDDlLY5WMVScu5lZ/5mF/mEggW9R75hr0SXs7pRlA/
	 OKbCyRlj3DsEiEhl0YW0rKW3NbS+HFv81W5Qbpo1tiobAm+xNJMbSG19QgmwUuEHj8
	 mTB6rMo6nKpvvEiWlPxzcXLaddxt5tCyporUBCa2dDUdsVlovSAg56q6R3Hcs8jA91
	 ure4vzloqE1GulY3aka3uIhBV9Zw2QJBSueAAEMQCcn7gpdf5iBYqCacz2Iy1moEv3
	 MSNAe9CaxqA1C60pSP/PBO2Fw/Rb314YGTVz+mctHtLVBtB7fP7uVWD9xTrUMyuqEW
	 JX7YRBZQGZ58w==
Message-ID: <sashiko-outbox-165625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 13:23:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] snd: soc: pcm1681: Devres teardown ordering bug leaves component a=
ccessible with gated clock
--

commit 0a50ee85ef797e0816bf4c1d1aa2f3b04e25ef3c
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support

This commit adds support for an optional sck clock and runtime PM to the
PCM1681 codec driver. It enables the clock before accessing the device, wai=
ts
for a reset sequence, and uses runtime PM autosuspend to manage the clock s=
tate
alongside regmap caching.

> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e054..a1ccf1edf4819 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
[ ... ]
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
Does this devres teardown ordering leave the component accessible while its
clock is gated?

In pcm1681_i2c_probe() in sound/soc/codecs/pcm1681.c, the component is
registered via devm_snd_soc_register_component(), which defers unregistrati=
on
until after pcm1681_i2c_remove() completes. However, pcm1681_i2c_remove()
manually disables runtime PM and gates the sck clock.

When the ASoC core later unregisters the component during the devres cleanup
phase, it may attempt to power down DAPM widgets or mute the codec, resulti=
ng
in physical regmap_write() calls. Since the clock is already gated and the
regmap cache is not marked as cache-only here, this regression could cause
these transactions to fail, potentially leading to I2C timeouts, bus hangs,=
 or
kernel warnings.

Should devm_pm_runtime_enable() or a custom devm action be used for PM and
clock cleanup to ensure proper ordering, or should the component registrati=
on be
changed to the non-devres variant?

> +	pm_runtime_set_suspended(dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-nord-asoc-=
driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com?part=3D2
