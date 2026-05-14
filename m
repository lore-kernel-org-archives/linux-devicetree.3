Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B3F4F1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785895; cv=none; b=Y7aTifpdA6QmeQ4oRt7BvZfSIChOVXPEJb/Yo7ia4s0dc05svn3OGQ0OKWTIkquk3GamYEE8Wrllog99Y7y92Ixda0HrK2Pe/b91I3sxWeajs0OZpKXhNphBDoX7IQ9O0EDTM8f1o0NIipCUra6Gg6q7iBLCVi3nF4DAxDOHB20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785895; c=relaxed/simple;
	bh=H3Av9w7a9TlhNBItr+XC0xQ4nJ0HmpGC5W+TucOkofQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NApKbMFHwh5xR2oBK1LMPziPiHVtNiPwW9H/Tm0oPFBHEmNk5ysJsTUV4eGylW31Hdi4b6gw4G7AOSbnebpmxzrBUqbEin0Sr8E2PO7dKVCihcFfw88sOPFPRaK8JbfUtUEdBS1NzW5UKXqID/4GD+55SueIo/YS/R+z0GFUt6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udmQWk2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udmQWk2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736C7C2BCB3;
	Thu, 14 May 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785894;
	bh=H3Av9w7a9TlhNBItr+XC0xQ4nJ0HmpGC5W+TucOkofQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=udmQWk2RpWBl0mo70oOXmdaXEWS7mWJSeOUQBOkcVO0CbzANW6ZQvj2aM/9gipuoz
	 anZM/c0JjUPsHqDwAgvJogIKTCcK5kkN2396a/9THMtDJrXLRVAOsFbMIYvLpd7hSo
	 YlAP3Y418B7WoR0KL+AewWm3qEp02ftvCgK0hO5cRtfEOJmRtFPlmCosctodEkVubo
	 GEhDTXORzRSF9lu4prH42Xv2lDsCxJOs9unQdZtwcv4taEvTvdrwUmvgaKUmekHLiq
	 GcPATsQM22RJ74GDnKlgVe41CcONbyfrd8P1IIg1CPoRvm055HKch/vBqcoMOwUfne
	 g2Oqs+bIFfGEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Add Tegra238 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prathamesh Shete" <pshete@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514124856.108606-2-pshete@nvidia.com>
References: <20260514124856.108606-2-pshete@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:11:33 +0000
Message-Id: <20260514191134.736C7C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `tegra238_pmc_regs` struct omits the initialization of `aowake=
_*` register offsets, causing them to default to 0. This will lead to regis=
ter collisions and hardware state corruption during wakeup configuration.
--

commit 07ddf2c146f9b5cbae8ba71ab87489c0358d7d6c
Author: Prathamesh Shete <pshete@nvidia.com>

soc/tegra: pmc: Add Tegra238 support

This commit adds support for the PMC on Tegra238. The Tegra238 PMC is
largely similar to earlier chips but not completely compatible.

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 2ee6539d796a5..4724b98fb1b16 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
[ ... ]
> @@ -4595,6 +4595,156 @@ static const struct tegra_pmc_soc tegra234_pmc_so=
c =3D {
[ ... ]
> +static const struct tegra_pmc_regs tegra238_pmc_regs =3D {
> +	.scratch0 =3D 0x2000,
> +	.rst_status =3D 0x70,
> +	.rst_source_shift =3D 0x2,
> +	.rst_source_mask =3D 0xfc,
> +	.rst_level_shift =3D 0x0,
> +	.rst_level_mask =3D 0x3,
> +};

Does this omit the initialization of the aowake_* register offsets?

Since fields like aowake_mask_w, aowake_status_w, aowake_status_r, and
aowake_tier2_routing are missing from the structure definition, they
will default to 0.

Looking at tegra238_pmc_soc below, it uses tegra186_pmc_irq_set_wake()
and tegra186_pmc_irq_set_type() for its wake operations. These functions
calculate register addresses based on these offsets.

If the offsets default to 0, wouldn't the wake mask, status, and routing
operations collide with offset 0x0 (which maps to the control register)
and potentially corrupt the hardware PMC state during wakeup
configuration?

> +
> +static const char * const tegra238_reset_sources[] =3D {
[ ... ]
> +static const struct tegra_pmc_soc tegra238_pmc_soc =3D {
[ ... ]
> +	.regs =3D &tegra238_pmc_regs,
> +	.init =3D tegra186_pmc_init,
> +	.setup_irq_polarity =3D tegra186_pmc_setup_irq_polarity,
> +	.set_wake_filters =3D tegra186_pmc_set_wake_filters,
> +	.irq_set_wake =3D tegra186_pmc_irq_set_wake,
> +	.irq_set_type =3D tegra186_pmc_irq_set_type,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514124856.1086=
06-1-pshete@nvidia.com?part=3D2
