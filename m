Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DF3FD941
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003413; cv=none; b=P5ZyzSHgq4jVo4D4RjukdBXcTK08ZCqzjCUTRGkN41ASlqVVHRGMctabQHl+KkK4pR0L1LvRLK5+ifpMYqq58bjfxvG2ZU+Wp4Z5Bz1RLAoHIpd1xeslibivewLFXhF7oTgKq9CgTGeZAf9KVl7agvIeH7dCRBg1l1t/VkXX4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003413; c=relaxed/simple;
	bh=EiCrW0Iaiysq0ChVgMV2HJY6LsFdM+i/VgZDgomuY3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GJjmNJilGgbDQyWhwl9BeHAQSKp9O4EG8vrep8+r5Y9nM1j2P2GqGOJZf5chbw225/eARQyegl94bRhTPoXCaE9coS00GhGj7GHC4Tl6vyYuRjAlZ/vqP28wDx3xGhFJeuXkn9jPCUvAgro+4go2lgin3tk6TeAQNY4o+X3hU1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBLmfHyc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBLmfHyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E6D1F00898;
	Tue,  9 Jun 2026 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003411;
	bh=MUbffeF7oMxEf6VZpJOLGtU5rIB+AmFhwlDvj6Q+Bx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CBLmfHycHCwhHlZEzV8mjUSq7mGiOlyiC2OtbZIvG/H+1Od8IpfxYYtXGa6cmVYhv
	 q21ADEsUICEqX+/GNn8WUipsfW2qGuwtrvVqV27VLFxLLKKFZh0USkMP8vmr46xqXR
	 iM8Sll0XHN1JoSsIHl4I1GQjrwkrn3K5a2GN2f74X4rEQtSzg5sV95kq6loJCn/SW3
	 CRRixi7NW/flu/3BRO2R5bNEJAsqKApMzk/tV4kns8yYT5RT23t3WHZf0lcbcthBj+
	 OOnGO8Vr8AQr7t6aSaJzFS1eEF6i3X3aqFXwV0UJD6YfbVWvyjDsR4q9HwfTNQJWRc
	 wEBQC6A8lecmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609105924.962573-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:10:11 +0000
Message-Id: <20260609111011.89E6D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The new file rzv2h-cpg-lib.c uses EXPORT_SYMBOL_NS_GPL but fails to=
 include <linux/export.h> or <linux/module.h>, which will cause compilation=
 errors.

Pre-existing issues:
- [High] Multiplication of a signed 16-bit integer by an unsigned long resu=
lts in incorrect calculations on 32-bit architectures, breaking the PLL fra=
ctional calculation for negative values.
--

commit 160d4676b08e19a075d3da03680cc8c66148bc74
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library

Move the common PLL and divider parameter calculation logic from the core
rzv2h-cpg driver into a standalone library file. Introduce the
CLK_RZV2H_CPG_LIB Kconfig configuration symbol. The original driver retains
wrappers that call into the new library helpers.

> diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rz=
v2h-cpg-lib.c
> new file mode 100644
> index 0000000000000..98e789df5d7f1
> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg-lib.c

[ ... ]

> +				/* Compute (Ffvco * 65536) */
> +				fvco =3D mul_u32_u32(p.m * 65536 + p.k, fref);
> +				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
> +				    fvco > mul_u32_u32(limits->fvco.max, 65536))
> +					continue;
> +
> +				/* PLL_M component of (output * 65536 * PLL_P) */
> +				output =3D mul_u32_u32(p.m * 65536, input_fref);
> +				/* PLL_K component of (output * 65536 * PLL_P) */
> +				output +=3D p.k * input_fref;

[Severity: High]
This is a pre-existing issue, but since the commit message mentions this
library will be shared with the upcoming RZ/T2H platforms (which are 32-bit=
),
could this calculation corrupt the output frequency when p.k is negative?

On 32-bit architectures, input_fref (unsigned long) is 32-bit. When p.k
(s16) is negative, standard C promotion rules convert it to a 32-bit
unsigned integer. The multiplication evaluates as a 32-bit unsigned product,
which is then zero-extended to 64 bits before being added to output (u64).

Instead of subtracting from output, won't this add a large positive number?

> +				/* Make it in mHz */
> +				output *=3D MILLI;
> +				output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);

[ ... ]

> +			}
> +		}
> +	}
> +
> +	/* If no valid parameters were found, return false */
> +	if (best.error_millihz =3D=3D S64_MAX)
> +		return false;
> +
> +	*pars =3D best;
> +	return true;
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars, "RZV2H_CPG");

[Severity: Low]
Does this file need to include <linux/export.h> or <linux/module.h>?

The EXPORT_SYMBOL_NS_GPL macro is used here, but the necessary headers
are missing from the includes at the top of the file. Could this cause
compilation errors on some architectures due to implicit declarations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609105924.9625=
73-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
