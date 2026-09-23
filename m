Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC5346FB3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146846; cv=none; b=XwRpg0DHBPek38+kCSvp3uY7XAjXcjH9NLWslb6T7ciojGKDbWWxVw6mXPnGWaWnqLNW2GvyTKmG1bQ3Wq27pG3dhiEC/InQz+i82Hi6+rmG4YGbCMYSKG/ngtPSRZB3SLGVE7ASjngTigwHltgmA1HjuNOtFwLerQRqwbFxxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146846; c=relaxed/simple;
	bh=OlEV7/PLzAIgnkzntIrJXvUyHqOboQ7Jq/z6i0uzbHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cr5CIA6HZ/pe1KZhiWvuZzf9fX8hnoc+g78Tqsrxz5GYu9j9MGfjH/ca/QgJKbBXAGWB2SWXZC1tgcausKmIlt+i/tleC+JGCivV144RwbEVhTyBsZf9bAGnQ7cTVkLhWUwVZIzUQfr1m8qEDjul3GddOf955MW9tdX25qXnkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYXegcu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYXegcu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED9D1F000FF;
	Wed, 23 Sep 2026 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790146845;
	bh=hXWQPHLsNXoWJ2v9CSpI59Jd/N9YLcCPUeWj9q0EDuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MYXegcu95xqC6RpyHjsiNb3fUIna/vUPzJIXRIkh6bADzUNAWwEUX1rI+iFdjE0ou
	 ki4XyFlrbGIkUWE3qvfrwQYH5wBG6PVq0GibFwe2LdSiZpVRfh3WyYFMpTExMmm8rb
	 c+1LFSD94jsdcYox5ymIOhW2Du6V93SlvuXEGgtPQyTCwizMVc38qZo0lpxr8pHWoK
	 BL+ONU+xLVRA1RWQDizTD6/PDWDCrVhmm7raV+gy6hKDFIdd2EBRlY5av05qQTp4Eb
	 AuZ/oEUG/oKfntKmiIY0byjG8yOHAtGNxu1LFDVysMq5oF8GFTLPG8IlvsQ7l3KjC8
	 jcvTZVPBOFCKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] ASoC: soc-core: Add
 snd_soc_of_xlate_dai_name() generic helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-5-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-5-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:00:44 +0000
Message-Id: <20260923070044.DED9D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] soc: build error due to implicit snd_soc_dai_name() declaration
--

commit b16b9f309d3d8ca044a5a756ee464aa98d0ba452
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper

This commit adds a generic helper snd_soc_of_xlate_dai_name() to soc-core.c
for ASoC CPU DAI drivers. It resolves a sound-dai phandle argument to a DAI
name by iterating the component's DAI list and matching the DAI ID.

> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index b9c70268d49fe..fc3f1606f0837 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
[ ... ]
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
> +			*dai_name =3D snd_soc_dai_name(dai);

[Severity: Low]
Does this code cause a build failure due to an implicit declaration of
snd_soc_dai_name()? It appears snd_soc_dai_name() does not exist in the
codebase. Should this use snd_soc_dai_name_get(dai) instead to successfully
retrieve the DAI name and avoid an invalid assignment?

> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D5
