Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83630569C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863060; cv=none; b=E2iguQB697KNX2MZPoP9VDI1yGBYZ6baSx7kP2K4CjeUdJSB8GKMzTxQe/qUzWZauePjyGrQPGvRMACSI9fj+om1OeEGPYCSk5UVcr1xk5Ny8M0LzOrdf3w+B6pYT1bTb8wy5DLevYUQNwzlba6MlTk6FmGxHpZ1vLpRWU8QOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863060; c=relaxed/simple;
	bh=RyWbNKtfkklrErXLZ2lmc7OeeVHzC7+ZTsVOdjNs+4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cd2FkN5ICSvxbRuc+1wqHv3CIjYxsfVi69tyt1AHxV9NNjtLsRtBaCL7EeMv+JUQh3sf5ICaQfH4ZysPhTfa6shrF2pijRef/177VAT3iTaa0GRpN/LpO6G4YTXb0d/zQ6w/WGoeoiYf6H9xOAfM8pFYsmUyIKkN8I5+90qjrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDwhw3sC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDwhw3sC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDE2C2BCB0;
	Fri, 15 May 2026 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863060;
	bh=RyWbNKtfkklrErXLZ2lmc7OeeVHzC7+ZTsVOdjNs+4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aDwhw3sCG5a7GL6kFXf9rMC6J0qwWvCp2ISA0aXv28pSPiiJXgGgO0Z1MCY2XNbCR
	 LNacqevGXfGVUcZho8v3sxXn+szk2EBk5Buo13wclmRp3FvGSLdlDyU8KVc9ENnUsZ
	 satcizlX8PcbHhj/iONxNNLt/2m34X5odtOGZgbMTN4YlCGmth1UjsH0PBwYkq5JHH
	 HNQ1ObMu7mAH30SU5hP7d1VeQzz/fZo39lOROxcfsCgJnVbU8RINeXsI+b1HzdPZIl
	 YunQcpt66iuUZK4FskivW1wKUKIcl3qam7/mM9I88Ot7WHpWeZ4ojV35wHXlnb1Tnn
	 kMZzg0ci+AEnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: simple-card-utils: support system-clock-id
 DT property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sen Wang" <sen@ti.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260515161358.1462453-3-sen@ti.com>
References: <20260515161358.1462453-3-sen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:37:38 +0000
Message-Id: <20260515163739.5DDE2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit introduces asymmetric sysclk configuration by failing t=
o update `clk_id` in the shutdown path, leading to incorrect hardware state=
s and resource leaks.
--

commit fb04cb3ea63c6e1c03c9835d2530dab5d343394b
Author: Sen Wang <sen@ti.com>

ASoC: simple-card-utils: support system-clock-id DT property

This commit adds an optional system-clock-id DT property to the cpu/codec
sub-nodes. It updates simple_util_parse_clk(), simple_util_hw_params(),
and simple_init_dai() to read and use this clock ID instead of hardcoding 0.

> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/si=
mple-card-utils.c
> index e5cb602fd2487..441f68df85220 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c

[ ... ]

> @@ -506,14 +509,16 @@ int simple_util_hw_params(struct snd_pcm_substream =
*substream,
>  			/* CPU first */
>  			for_each_rtd_cpu_dais(rtd, i, sdai) {
>  				pdai =3D simple_props_to_dai_cpu(props, i);
> -				ret =3D snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
> +				ret =3D snd_soc_dai_set_sysclk(sdai, pdai->clk_id,
> +						mclk, pdai->clk_direction);

Does the teardown path in simple_util_shutdown() also need to be updated to
use clk_id?

It currently hardcodes 0 when disabling the clock:

sound/soc/generic/simple-card-utils.c:simple_util_shutdown() {
	...
	for_each_prop_dai_cpu(props, i, dai) {
		struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, i);

		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
			snd_soc_dai_set_sysclk(cpu_dai, 0, 0, dai->clk_direction);
	...
}

If a device is configured with a non-zero system-clock-id, will the shutdown
path disable the wrong clock, leaving the intended clock running?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515161358.1462=
453-1-sen@ti.com?part=3D2
