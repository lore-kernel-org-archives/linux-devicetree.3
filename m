Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E76339395
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775464; cv=none; b=FM5cB3MYHL1abh5nAdeo04ihD9jxnb6M3+4OvRv6RhaSGU0YI3msqkA4JUu/kRgtKlYF4Tw/m89YDjgOJzuig+huBu3f+IPpvBVP2ilYCedcBV11FLRCO3EfVoDbVpSd0hi8ny021RlK5xOroLEwa+NwDAewwsjwY2Sbb47NPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775464; c=relaxed/simple;
	bh=kJ7Vh7i1g3DcIwGuaWbb3agUlXqJwwb21IlzFTIDB+8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3IlA36HU6rXOsxo5HiZ3VvpzkjT9ojnCVnZ6iC9FueNq7s+oj3XBE1ZkRVz42wQqbAgLLlvWF5UsNjn992IUGxtDPmYzLpEbRPGJTwv+kHLnPvZyb7MmGFC7ZPTE2DqcqUVaCp/byrzuXor8e47T0gEjutzJNdHJzDTMILyCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyUxdSSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyUxdSSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF0A1F000E9;
	Thu, 23 Jul 2026 02:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784775463;
	bh=kHZsmaIBtiXtEr6FEyopFm7NOljKRznAk9yACt5PL7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fyUxdSSU58Fhil7S0FJc4bTydEcYf/rNXzyrlBIwsm/i59I6nf9GCE0ocGuNMhuro
	 qJc0mJ8B6PtUi+49rUiVoPPkCGbKK80n5cYGLviVUVtLlfPc8Ux0LufZ2eaQNjtDok
	 8FKzbrDEcsEZ/i5jfpi5C30UforPWQ7d9HQynzPowWwEZ5Tr/586jmb/qL+YcRE67D
	 OXxsmifLLUU1kHAHyNEOx2HHzMa0MIU76R5k6rsYpX+M6qwTjjDu/kUqB2hV10WZmI
	 VOZGVQ6e75v6jjxjAUm2iu96PuIsvfhCSADm6MlmZCSh4O1IOoNcEJT7XJI0RSYl+5
	 pa4OROs9lJjlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] soc/tegra: pmc: Add Tegra210B01 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-t210b01-pmc-v3-2-1c5b970788f2@gmail.com>
References: <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
 <20260722-t210b01-pmc-v3-2-1c5b970788f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:57:42 +0000
Message-Id: <20260723025743.0EF0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented behavioral change: MBIST workaround disabled for Te=
gra210B01.
--

--- Patch [2]: [PATCH v3 2/2] soc/tegra: pmc: Add Tegra210B01 support ---
commit 5ceea53482957796a181bc224b13a9428679c927
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

soc/tegra: pmc: Add Tegra210B01 support

This commit introduces support for the PMC in the Tegra210B01 SoC. The
new SoC is described as being very similar to the original Tegra210,
with specific powergate removals for sata, venc, and ve2.

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f419a5395545f..d133f445e4ec4 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c

[ ... ]

> @@ -3897,6 +3897,66 @@ static const struct tegra_pmc_soc tegra210_pmc_soc=
 =3D {

[ ... ]

> +static const struct tegra_pmc_soc tegra210b01_pmc_soc =3D {
> +	.supports_core_domain =3D false,
> +	.num_powergates =3D ARRAY_SIZE(tegra210b01_powergates),
> +	.powergates =3D tegra210b01_powergates,
> +	.num_cpu_powergates =3D ARRAY_SIZE(tegra210_cpu_powergates),
> +	.cpu_powergates =3D tegra210_cpu_powergates,
> +	.has_tsense_reset =3D true,
> +	.has_gpu_clamps =3D true,
> +	.needs_mbist_war =3D false,

[Severity: Medium]
The commit message mentions that the new SoC is very similar to the original
Tegra210 and specifically lists sata, venc, and ve2 as the only powergate
differences.

However, this line disables the MBIST workaround, differing from the origin=
al
tegra210_pmc_soc which has it enabled.

If the silicon erratum was fixed in the B01 stepping, could this hardware
behavioral change be documented in the commit message? Or is this an
accidental omission that might lead to powergating failures or hardware
instability on this silicon?

> +	.has_io_pad_wren =3D true,
> +	.maybe_tz_only =3D true,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-t210b01-pm=
c-v3-0-1c5b970788f2@gmail.com?part=3D2
