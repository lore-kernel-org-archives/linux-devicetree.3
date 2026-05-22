Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D543C585C
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456826; cv=none; b=jZeHneaL9gvV8ULfSm+kY4Sr5nHDTRkYYJZCAXfxWDIbxsnYZXYzH4smwPcCKI5/lm62a/jr6+otaJG4Y3NyTEGD6TIPKI95El0oOFPh9RMDaXQpEc7MT74taC3QZy3x+lEPrfqahjZVYMbcjeYzYCH3nVWvX0AJD0J9mOGNb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456826; c=relaxed/simple;
	bh=baa9PVGJ06rjbDKSMwLL5Qk4PBtU8i+dODqmDqTM9y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DZDjuAOxyyio9ILCMqUYmKQUw7kPoHdBTOXsUzWYsMjw6IOTaCfdRSlFOUvbt5Sj/EGU4aSXjeMdctDnb2TQONf13RCIATlWdXAOiIItOvXyJuvX/1FB7zGDHcssHVsd9nG3a1pA/w30NWKKjrXLD5ZcEUTxzooOJdcFKddjw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmmmkyJd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmmmkyJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE51B1F000E9;
	Fri, 22 May 2026 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779456825;
	bh=KruDMTe6arO72GJpDGMGE7A/i9l7loCdWIzErSmQzU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmmmkyJdqzJn7uaLCwXxN4u2rcWoB5Bk47ncMfgbD6s22FU8qgFlzSatlv5O5sRbp
	 adMJcCgtvKwVreBI+2B1BVC92YkCB40wwmYrD+wgtWFvwB9Y6PNCfiS3qS7povysLp
	 C4ilOAYMWJmxSbG9EVtLq3Q0MwJR+yt+fBpchoqaQKQIhiwvQRbpOX3Xf4Kpn1urs7
	 pi952KBbUkIQ6GLI42SlqMF2s1e9+NXWVeegejZ2rvpjy+emO66SUAtJkYQDqSHBeq
	 3AeUL4vr7zXuLgHCyo6EoeqnD8nVWzV7AaV1rY+/peXcxhVpm9ws1u6ozKvqoGIQl3
	 i0DK/uHBIF3Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: spacemit: add K3 SoC support with
 additional clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522-k3-i2s-v3-2-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-2-08e3eb811d93@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:33:44 +0000
Message-Id: <20260522133344.EE51B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unprotected rate changes on shared clocks `c_sysclk` and `c_bclk=
` can corrupt active audio streams on other I2S controllers.
--

commit f3c6244a03afa7c9321de2747d7f0c3a9bc65bd2
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

ASoC: spacemit: add K3 SoC support with additional clocks

This commit adds support for the SpacemiT K3 SoC I2S controller. It acquires
new clocks (sysclk_div, c_sysclk, and c_bclk) using
devm_clk_get_optional_enabled() and configures their rates dynamically based
on the sample rate during stream setup.

> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> index 5420ca2aefbd8..8871fc15b29cc 100644
> --- a/sound/soc/spacemit/k1_i2s.c
> +++ b/sound/soc/spacemit/k1_i2s.c

[ ... ]

> @@ -206,6 +209,14 @@ static int spacemit_i2s_hw_params(struct snd_pcm_sub=
stream *substream,
>  		    params_rate(params) *
>  		    data_bits;
> =20
> +	ret =3D clk_set_rate(i2s->c_sysclk, bclk_rate * 2);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_set_rate(i2s->c_bclk, bclk_rate);
> +	if (ret)
> +		return ret;
> +

[Severity: Medium]
The commit message notes that c_sysclk and c_bclk are shared across multiple
I2S controllers on the K3 SoC. If multiple controllers are concurrently
active and request different sample rates, will calling clk_set_rate() here
silently overwrite the shared clock rates?

Could this instantaneous frequency change disrupt the active audio stream on
the other controllers, causing pitch shifts or FIFO underflows?

Would it be safer to use clk_set_rate_exclusive() to lock the rate while the
stream is active and reject conflicting requests?

>  	ret =3D clk_set_rate(i2s->bclk, bclk_rate);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-k3-i2s-v3-=
0-08e3eb811d93@linux.spacemit.com?part=3D2
