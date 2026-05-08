Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D1387348
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278873; cv=none; b=dL9EJjbshsXSqjBuLFpc04o9kmarJa9jDTQ3g0c7uC8ucgTMToMm/Jd+6IlKT14N+cb3OoN3nfJLNds0m32/QsXKA3k61PmzRFKmPxxBkorobcHs4TuoIpk8KtoVkaPh0zMD0c/gGFHlXg4Jk3wdQUORFcSH/avH007Yz/C11nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278873; c=relaxed/simple;
	bh=+wBpdsqElJ4qZtzsZCtM2GEJ3qTayzgaafIlGZWKSLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W9+OsG8mu/aPn7ZQMZgZPJXqIXbfdWmk23UbBOYOP1gwENduwV7kW2xAOQdvVndf1peJZ/anKqUVeDn3Z20xHbN5uTsKtVC+KGPuKGsKcMBs4/H1hj6W4oa0BfHtWL4gfnnCP62zvZTAbVmDADQ6c8crOVdlrLd1bqiZA1ZbXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0Tkde8I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0Tkde8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6108EC2BCB0;
	Fri,  8 May 2026 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778278872;
	bh=+wBpdsqElJ4qZtzsZCtM2GEJ3qTayzgaafIlGZWKSLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W0Tkde8IIaGNdo202ruaOdIHIpI1/zazDal8dOrCJ1W2xyAc1o+REwfILweBSPRIR
	 zCIkFwWfq/g3Yjj5H1N5AfRlHr7iTW9b93VDri6KVt3teJto/TFpUCJw6VqAB3FfxE
	 H1v7lZYp3FqXBFZ4S9rYXJzCHke9g9LbfTzaexwgCZLASlHQDzmEB0tRE8DHLM8AzU
	 ipHG/x4yF+j/bk3Y58Bc5p2BGZjx24jzmhmLAuuLXMpF1B4zv1F2PF+kibdCHp4KG5
	 tS+vy9oSqXANewcT6uKwjjmYb9SaWl+7Dkv6scfLF2rNa94C3z2AOiHXtvYAHm3JzH
	 MoBPeD2EI8msg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/10] clk: realtek: Add support for mux clock
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508111641.3192177-7-eleanor.lin@realtek.com>
References: <20260508111641.3192177-7-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:21:11 +0000
Message-Id: <20260508222112.6108EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `clk_regmap_mux_get_parent()` masks hardware read errors and inval=
id states by defaulting to parent index 0.
- [Medium] Potential signed integer overflow in `clk_regmap_mux_set_parent(=
)` when shifting the `u8 index` parameter.
--

commit 462409aad9f9756e1384cae76faf89758f477e12
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for mux clock

This commit adds a regmap-based clk_ops implementation for Realtek mux
clocks, supporting parent selection and rate determination.

> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/c=
lk-regmap-mux.c
> new file mode 100644
> index 0000000000000..1b0b8419d651f
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
[ ... ]
> +static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *clkm =3D to_clk_regmap_mux(hw);
> +	int num_parents =3D clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0;
> +
> +	val =3D (val >> clkm->shift) & clkm->mask;
> +
> +	return val >=3D num_parents ? 0 : val;

Does returning 0 on hardware read errors or invalid states mask the error
from the clock framework?

If 0 is returned here, the framework might cache 0 as the active parent. If
a consumer later requests to set the parent to 0, the framework could
incorrectly assume the hardware is already in the correct state and skip the
set_parent call entirely.

Could this return an out-of-bounds index (like -EINVAL cast to u8) instead,
so the framework recognizes the parent as unknown and forces a hardware
update when a valid parent is requested?

> +}
> +
> +static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_regmap_mux *clkm =3D to_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, index << clkm->shift);

Could the shift operation index << clkm->shift cause a signed integer
overflow?

Since index is a u8, it is implicitly promoted to a signed 32-bit int. If
the clock mux is configured at the most significant bit of a 32-bit
register (where clkm->shift is 31), shifting a non-zero index into the sign
bit triggers undefined behavior.

This might trigger a shift-out-of-bounds splat, which could lead to a panic
on systems with panic_on_warn enabled.

Would it be safer to explicitly cast index to an unsigned type, such as
(u32)index << clkm->shift?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D6
