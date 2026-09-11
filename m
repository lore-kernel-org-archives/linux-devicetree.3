Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096223E358
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119165; cv=none; b=q0fmbtupl+tZ2TZirCf8RerhChKWvhabLOwlxRZ3KObiU7Ov0OQwJdP22P2/r6Ad1mKDvBeNP5mplUfjivVyxJtX5up88pmTztzShJyqGTZLppQgofst0nwQB7Or+WOjrRb4I9T6OYjxmZgyBadaJqR0H7alEYAXGAN9iX+CUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119165; c=relaxed/simple;
	bh=3UZu3ALaew63N3JyQVM/uCyQfaMSZucoqY//fnXXXEE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C5vQxZ9hXvM84R6cfeNxGENeBMpH27xvtA5KDigpeqlSAWNefHDSpJ2DNssU7/74INYTbBYrNYRgrbTzctLoXdCEdreSOQUiK71hpqJP7xx9VJdcTKj5sHH20ROrpgHXoKmxzusRT0mLN+JhY+hALJO5nvrl2FXI/4at14jCW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRF1zaLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRF1zaLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0B91F000FF;
	Fri, 11 Sep 2026 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119164;
	bh=p7YWJEFmWqNPFGi695XFFm8N/Q5eifxAkG3GXDZ2hFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gRF1zaLKaNat73Ps2OzLCbt+oGLyEXWM512FVhMBHCcDo2YMfofY/nSnZ67e/9a5d
	 ILg3Z16kXzVXFK90kBuVmaTTEenmohPVCZxD6MHu8JPrPF5vqURRImvCOlms7M8GIn
	 CekgAHH3TNEY1gLzFkQB61Ex+w/SB740hatPNJOhz5v1qEVU5sEX+Ft/mf12lhUvcf
	 n4T+68vz2AF/Qa2Twa0773q3MRJb2lGSLYU5XAMJyLr4GUAHbcy93iX314iwY9w9Wj
	 HEWC9NClk6hKsFoGAYlRFcfqlLytJtN/F0lZ7yUZD59G8dJMIBrjVLMFnARNeaSXPb
	 XmiP3IAELwkFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/10] ASoC: soc-core: Add
 snd_soc_of_xlate_dai_name() generic helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-5-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-5-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:32:43 +0000
Message-Id: <20260911093243.EA0B91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Call to non-existent function `snd_soc_dai_name_get` causes a build=
 failure.
--

commit d2ced32400830e456cc64d54ef5e9807fdbf58e6
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper

This commit adds a generic helper to resolve a sound-dai phandle argument
to a DAI name. It iterates over a component's DAI list and matches by ID.

> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 06167a1985912..0c868bccd3b43 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c

[ ... ]

> @@ -2906,6 +2906,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *=
np,
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name)
> +{
> +	struct snd_soc_dai *dai;
> +	int id;
> +
> +	if (args->args_count !=3D 1)
> +		return -EINVAL;
> +
> +	id =3D args->args[0];
> +
> +	for_each_component_dais(component, dai) {
> +		if (dai->driver->id =3D=3D id) {
> +			*dai_name =3D snd_soc_dai_name_get(dai);

[Severity: Low]
Does this cause a build failure?  It looks like snd_soc_dai_name_get() is a
typo for snd_soc_dai_name(), which will result in an undefined reference or
implicit function declaration error when compiling sound/soc/soc-core.o.

> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-qaif-sh=
ikra-audio-v6-0-e9addb358201@oss.qualcomm.com?part=3D5
