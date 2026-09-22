Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143205650FC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093833; cv=none; b=RL75SIP/Dlq4KdN7NpX2gBOEy4xhsNmsdmihfQM1BXMyacIn2EBqSe0Efue6g1+zBEJQAS2WKleeBOZs+AAUrVbyBmKbQiiYvUpLHQjE0t5VfUl9itpo++tlZb4yo192HB9M2U3Eid/0S8oEQIoguhBgAPUZ5NocEBrgI24+UCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093833; c=relaxed/simple;
	bh=RR8VvNhLejpnu1zlz+rBVZfBRBM/i3/gANGSKjEU0aw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TVOy/9kvtN79zw5jq/4fUxvcXnzeqJhy1+5FQZ1a8l8ELOhzQS5ukwPyXRp52s+/xpFhdBlDqJ+ksJxY4F7Sun7QSqgFnJoFRZVP5hxuYf6B56LNdOWg8Gg3qMhM8ALw5rV4BDVyjHk6oeTdmJG030GmvzMGINW6m6CR5T/WNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrFJTaDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrFJTaDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B61F000FF;
	Tue, 22 Sep 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093831;
	bh=7SCACIMkovCAQWYJ3tWhlfrEAq98q3CMl/z7bMnXMb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrFJTaDO3mR17/hKsGYBsCLmkp6civzOArLa0w0GGIl1BhQ01wig/m0wKG05VMyKc
	 CjN8Tpp5LdKCiEVFGf6oY3feB7A2/czWMRbUOfmgUPXavTgKFlzvbkvpiXYR11I6q0
	 pTBjSiZOaPS1fBx9xd5l+4YK7AuJB/sLF5RzOB/bhh0qxzVOzx/hOsYAdD+5vjG8Yh
	 ix3PhNI9LtfMGiLqQ3B/mTiLvv4VrHiVQikDbNCVpSYQF8Q2iHIpzgAG/qe6z+aLoN
	 rmeplLX5iO8J7K4olnTBCmpXIx/8NgF+GlzrT5FtSkgJkbKnls52g6gzAgM4lEgyiH
	 eAcKb/2q6L1jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] ASoC: meson: add AUDIN driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260922-audin-v3-4-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-4-a760312c076c@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 16:17:10 +0000
Message-Id: <20260922161711.596B61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] sound: soc: meson: data race due to global state modification in pr=
obe
--

commit 19f0be491d181acce1da0bdd85fd37b9549fa25c
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: add AUDIN driver

This commit adds the AUDIN driver to provide audio input support for Amlogic
GX based platforms. It incorporates FIFO handling and an I2S data formatter=
 to
route audio streams.

> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
> new file mode 100644
> index 0000000000000..15824354abede
> --- /dev/null
> +++ b/sound/soc/meson/audin.c
[ ... ]
> +static struct snd_soc_dapm_widget audin_dapm_widgets[] =3D {
> +	[AUDIN_WIDGET_I2S_FORMATTER] =3D
> +		SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
> +				   gx_formatter_event,
> +				   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_MUX("FIFO0 SRC SEL", SND_SOC_NOPM, 0, 0,
> +			 &audin_fifo0_input_sel_mux),
[ ... ]
> +static int audin_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D gx_formatter_create(dev, &audin_dapm_widgets[AUDIN_WIDGET_I2S_F=
ORMATTER],
> +				  &audin_formatter_i2s_drv, regmap);

[Severity: Low]
Is it safe to mutate the static audin_dapm_widgets array here in audin_prob=
e()
with a per-device allocated pointer?

Calling gx_formatter_create() modifies w->priv where w points to the static
global audin_dapm_widgets array.

While ASoC's snd_soc_dapm_new_controls() uses kmemdup() to clone widget
templates, modifying shared static global structs without synchronization
introduces a structural data race if multiple instances are probed
concurrently. This also appears to violate driver design principles against
modifying static templates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-audin-v3-0=
-a760312c076c@baylibre.com?part=3D4
