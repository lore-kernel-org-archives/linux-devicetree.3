Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF2D35FF5B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688544; cv=none; b=O0YGEoPWXUE3Buj3iGH0ro8NuOfDkQ5zdLGco/jXN5sVhTHnFzS7VL/KZbmqE9S6WBsZnYcxKcK1zTBcv1VycMZZgrBKeVksdn0N+KRW++U7W/iBYgDfDhNql7UzouQN70M8A0kATSV3v9F0Rq131AjtPWbBxBvVSjq2ytOkbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688544; c=relaxed/simple;
	bh=dcxrzhQWDeuGLCNImionzAHxTeFb4s4/ZQn94Igx+OA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tIiOsynejyZ3t4dzWGCtc7IS8NZ/6z2sjx/v8ovX9PnccbfVmtN7okC4Phkkh+2nYtZxgnk2MQDmXhOqhC+pnSz414C/zFfHLRGv0/m8O8/QkvM5Z0n/VINPG4HoE5qGywynTHePYkdnV2GE97KCMkqoe0rAWeQDlWuUxPkwR04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAWAk1CG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAWAk1CG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBAA1F000E9;
	Wed, 22 Jul 2026 02:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784688542;
	bh=H72XBUYPUP4oRvN/WrHN4KCOF3iM4C4tQSvvxrPOuIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NAWAk1CGzML61/XtLSLNXKQPjBUMbaa14V5gAhBcbUwPn6jju3GDnZo8cnlt3+Hus
	 bd4NoPJdLd8bSVWvzcgzwH7sNPMzWOG+571PEcC2vvotZPc37SyXVqT2h7soCYNPxm
	 WuNuTXlAf9JCwAZOb9PUOW0fwiYsdQV9sPQg2MBSwIYOhybiWjAh175SYkkoXStZDH
	 fAPZ9Ih1XmpTsyFAKQnSKx/wFTmHzyc7Jho4Ch70CMI/IfNACRgu81h5b70477FcDb
	 DFNRPZlu+EjymcT7UvjJd8x6gJaQE5515gxyCJwHlo9ZTqhlmnTmEeHV3BEYvQyOLO
	 sC7SOQ5Y3r0xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ASoC: spacemit: rename clock inputs to match
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-kx-i2s-dts-v1-1-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
 <20260721-kx-i2s-dts-v1-1-d22cb6cfaab5@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 02:49:01 +0000
Message-Id: <20260722024902.2DBAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing spinlock in trigger and hw_params callbacks for shared reg=
isters and state variables.
- [High] Unchecked stream capabilities lead to sound card probe failure if =
a DMA channel is missing from the Device Tree.
--

--- Patch [1]: [PATCH 1/3] ASoC: spacemit: rename clock inputs to match bin=
ding ---
commit 3f9179a8e0f739a34984ca4b3cbbfefcad4578c2
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date:   Wed Jul 22 02:35:55 2026 +0000

    ASoC: spacemit: rename clock inputs to match binding

    The driver requests the per-controller SSPA bus and functional clocks
    as "sspa_bus" and "sspa", but the device tree binding specifies them as
    "bus" and "func". This patch renames the clock inputs in the driver to
    match the binding, and updates the internal struct member for consisten=
cy.

> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> index 8871fc15b29cc..4247d8d3a6370 100644
> --- a/sound/soc/spacemit/k1_i2s.c
> +++ b/sound/soc/spacemit/k1_i2s.c

[ ... ]

> @@ -221,7 +221,7 @@ static int spacemit_i2s_hw_params(struct snd_pcm_subs=
tream *substream,
>  	if (ret)
>  		return ret;
> =20

[Severity: High]
This is a pre-existing issue, but missing a spinlock in the hw_params and
trigger callbacks might lead to hardware state corruption.

The spacemit_i2s_hw_params() and spacemit_i2s_trigger() callbacks can be
invoked concurrently on different CPUs for playback and capture streams on a
full-duplex setup.

Both functions perform unprotected read-modify-write operations on the shar=
ed
SSCR register. For example, in spacemit_i2s_hw_params():

spacemit_i2s_hw_params() {
    ...
    val =3D readl(i2s->base + SSCR);
    if (val & SSCR_SSE)
        return 0;
    val &=3D ~SSCR_DW_32BYTE;
    val |=3D data_width;
    writel(val, i2s->base + SSCR);
    ...
}

Could concurrent execution cause the hw_params callback to overwrite the
SSCR_SSE enable bit set by the trigger callback, or corrupt the
i2s->started_count reference? Should a driver-level spinlock be added to
protect these shared registers and state variables?

> -	return clk_set_rate(i2s->sspa_clk, bclk_rate);
> +	return clk_set_rate(i2s->func_clk, bclk_rate);
>  }

[ ... ]

> @@ -445,14 +445,14 @@ static int spacemit_i2s_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(i2s->bclk))
>  		return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable b=
it clock\n");
> =20
> -	clk =3D devm_clk_get_enabled(i2s->dev, "sspa_bus");
> +	clk =3D devm_clk_get_enabled(i2s->dev, "bus");
>  	if (IS_ERR(clk))
> -		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bu=
s clock\n");
> +		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable bus clo=
ck\n");
> =20
> -	i2s->sspa_clk =3D devm_clk_get_enabled(i2s->dev, "sspa");
> -	if (IS_ERR(i2s->sspa_clk))
> -		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
> -				     "failed to enable sspa clock\n");
> +	i2s->func_clk =3D devm_clk_get_enabled(i2s->dev, "func");
> +	if (IS_ERR(i2s->func_clk))
> +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->func_clk),
> +				     "failed to enable func clock\n");

[Severity: High]
This is a pre-existing issue, but unchecked stream capabilities might cause
the sound card probe to fail if a DMA channel is missing from the Device Tr=
ee.

When spacemit_i2s_probe() calls spacemit_i2s_init_dai(), the driver
allocates the dai driver struct by duplicating spacemit_i2s_dai, which
statically advertises both playback and capture capabilities with
channels_min =3D 1.

If the Device Tree lacks a DMA channel (for example, the rx channel), the
driver correctly sets has_capture to false but fails to clear
dai->capture.channels_min.

Would this cause the ALSA core to instantiate an unsupported capture
substream, leading dmaengine_pcm_new() to fail and abort the sound card
probe when it requests the missing DMA channel? Should the capabilities for
unsupported streams be explicitly cleared when has_playback or has_capture
is false?

>  	i2s->sysclk_div =3D devm_clk_get_optional_enabled(i2s->dev, "sysclk_div=
");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kx-i2s-dts=
-v1-0-d22cb6cfaab5@linux.spacemit.com?part=3D1
