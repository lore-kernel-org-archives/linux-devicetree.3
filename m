Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68443F4B9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764568; cv=none; b=K6B+pAGFA7nfqubLHxwo6VHkyhFzYUYWzXSM3CfRsJAcXhxTyy3p3J6ZslKEC81Q2LKeT+3BR7B8Gjby5kdEgh38PRXXSjEank81YpfqnBAUlMMEa60s3/BVk53BxJlJRYB6smfogWvjnoSl4BEfHDvlkq5h1AGYD87vkRinuSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764568; c=relaxed/simple;
	bh=bPfCxJQh+FkYal3HwWTpKEM3O3duen80upPvwkqDnoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ujmeVQJ4VAQeTgt878unCf8igm3Pi2SLvScaxx4f0AEBwt1JhICbc45nb8DZFqRPS40cKOTs3+GBlmDBpqMSF2tmtPR/QqxXqY4iH4Gv1+XH51sIBzXrPmExrYgBkwUce04u8lwgnionW4VS6TyjzkUDhx6Di7ZoKtdZb+ts9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgVWMLWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgVWMLWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E9C1F00A3A;
	Wed, 22 Jul 2026 23:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764566;
	bh=RyyZaUWZnbTmgjWod1+WnlvgO5+RkrKh5emnNna949E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgVWMLWcOh6JmvqeJKaakXUUNltVAS2hR5c40r1yhTRol6gG355D6KtIXetwITjVs
	 QaquLtxdpnNeERsAXo1jxB6NDZXwhedXVBdDPrsW6WHYQytuON+/rjUle0bF2fek6M
	 O6TYuQ+hV7RWIp7BUZ0Ic23np+xHogK4VDf94KKksqobTNVFYt1dN+6d5jJ1HeXpxX
	 6X4QDbqCnwOd8+YTQH5YL+Sexr4VhpR+MZ6DvD/YQqncSr2LeUPlTq3PA+KejoC5dC
	 0Ewz8IT39fW+BvEguywnW/FHH3TKC5S8vcXLgv3HVw9p6o0x7TfHZPxibBACr+FTfe
	 dMC+GXunOARrw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/8] ASoC: SDCA: add PDE pre/post-pmu hooks to
 hw_ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:56:06 +0000
Message-Id: <20260722235606.A4E9C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Errors returned from the new `pde_pre_pmu` and `pde_post_pmu` ho=
oks are incorrectly swallowed or shadowed, allowing DAPM transitions to pro=
ceed with invalid hardware state.
--

--- Patch [4]: [RFC PATCH 4/8] ASoC: SDCA: add PDE pre/post-pmu hooks to hw=
_ops ---
commit 9ebbdf1f4165266d78edf14f3e10a54fa79025c5
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: add PDE pre/post-pmu hooks to hw_ops

This patch adds pde_pre_pmu and pde_post_pmu callbacks to struct
sdca_class_hw_ops. These hooks allow codec drivers to stage state and
commit pending writes before and after DAPM PDE power-domain transitions.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index ac688cd629706..795498b9a314b 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c

[ ... ]

> @@ -432,6 +433,8 @@ static int entity_pde_event(struct snd_soc_dapm_widge=
t *widget,
>  {
>  	struct snd_soc_component *component =3D snd_soc_dapm_to_component(widge=
t->dapm);
>  	struct sdca_entity *entity =3D widget->priv;
> +	struct sdca_class_drv *core;
> +	unsigned int fn;
>  	int from, to;
>  	int ret;
> =20
> @@ -439,6 +442,19 @@ static int entity_pde_event(struct snd_soc_dapm_widg=
et *widget,
>  		return -EIO;
> =20
>  	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		core =3D dev_get_drvdata(component->dev->parent);
> +		if (core && core->hw_ops && core->hw_ops->pde_pre_pmu) {
> +			fn =3D SDW_SDCA_CTL_FUNC(widget->reg);
> +			ret =3D core->hw_ops->pde_pre_pmu(core->sdw,
> +							component->regmap, fn,
> +							SDW_SDCA_CTL_ENT(widget->reg));
> +			if (ret)
> +				dev_warn(component->dev,
> +					 "%s: pde_pre_pmu failed: %d\n",
> +					 entity->label, ret);
> +		}
> +		return 0;

[Severity: Medium]
Should this return ret instead of 0 when pde_pre_pmu() fails?=20

Returning 0 allows the DAPM power sequence to proceed even though the=20
prerequisite state might be invalid.

>  	case SND_SOC_DAPM_POST_PMD:
>  		from =3D widget->on_val;
>  		to =3D widget->off_val;

[ ... ]

> @@ -451,6 +467,20 @@ static int entity_pde_event(struct snd_soc_dapm_widg=
et *widget,
>  		return 0;
>  	}
> =20
> +	if (event =3D=3D SND_SOC_DAPM_POST_PMU) {
> +		core =3D dev_get_drvdata(component->dev->parent);
> +		if (core && core->hw_ops && core->hw_ops->pde_post_pmu) {
> +			fn =3D SDW_SDCA_CTL_FUNC(widget->reg);
> +			ret =3D core->hw_ops->pde_post_pmu(core->sdw,
> +							 component->regmap, fn,
> +							 SDW_SDCA_CTL_ENT(widget->reg));
> +			if (ret)
> +				dev_warn(component->dev,
> +					 "%s: pde_post_pmu failed: %d\n",
> +					 entity->label, ret);
> +		}
> +	}
> +
>  	ret =3D sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
>  					   SDW_SDCA_CTL_FUNC(widget->reg),
>  					   SDW_SDCA_CTL_ENT(widget->reg),

[Severity: Medium]
Does this overwrite the error from pde_post_pmu()?=20

If pde_post_pmu() fails, ret is logged in the warning above, but then=20
immediately overwritten by the return value of sdca_asoc_pde_poll_actual_ps=
(),=20
losing the original failure context.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4
