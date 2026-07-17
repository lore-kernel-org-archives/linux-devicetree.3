Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAD3ACA6F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273823; cv=none; b=UI6gVALoorfpGposL3CvVACPZRMijbvmSBZkTZ2aeQHw06NiP+r1sfH5pes6r2exJwT3VTIW8Wv1YjB2JSK0Gei7e3+EeRbIlrIyltQVknYFukp2pLLjS4FLE3IiTcKgt6ZL5OH4Njtna1pkpd3f4EUvPsEx9J57/dMjTbAVVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273823; c=relaxed/simple;
	bh=N7TRc/IALjT7cQ1NPTohOxma00X43/wjC9r4ZIJEZCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gkemyj6VimBu9tFhoLMba5tQ7LPajdknj/tIpxP0woXcammgUwBITlmDynRJxJciiVe7NM2T6F/4f11h1B4FkipEBJoFqwWdUGg/JarKrrA/KiE+YWsyzCx+/sHPYxFyk3SxgImb4HrSkLo5wWOQ6DVc3JEqh0HFlbMFk3vmjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvDNUGyO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvDNUGyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A511F000E9;
	Fri, 17 Jul 2026 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784273821;
	bh=qJ44VYICKRu7NTJkrWqGuJBunIAeihG/t5fKHcvpSrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cvDNUGyO9FodPYbN5IpesgLSqfTAeSHxvo0q2ErKiuGrq/uFEZH+v6GcRqzmONB+i
	 10oRp0EUOhYPSD6mMNUVGgLNNqbRNmJTQ7hxhF8VaEXkVSlyd4T41zVv3hPcdeLzV5
	 TzHvKevBoOPD/fJwqh2Yq6t1iQ/LxsDYIBU73AZ50826eIs9ZsnAKkCWr5LeySyudv
	 qDp5AOZWRXTdHxs0+MwNBDDpNSCns9Mfc663qgDwbFjD19XkvEM709dVHDNWru3mMc
	 F+8OxTOaMzI837hfGQNtLMQgP3MZV2vGjnMIhX+8t9lVuHUXE9ewuvd+P+9fsyiT4l
	 Ggos+eh9sYbbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s
 sysclk dividers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
 <20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 07:37:01 +0000
Message-Id: <20260717073701.94A511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message mathematically contradicts the driver's actua=
l hardware implementation.

Pre-existing issues:
- [High] Kernel panic due to unhandled zero divisor (`num`) in clock rate c=
alculations.
--

--- Patch [3]: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s =
sysclk dividers ---
commit f6d65354cd50f2c66ffa439212d0df739e8b5882
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

This commit updates the i2s sysclk dividers in the spacemit k3 clock driver=
 to
set pre_div to 2. This accounts for a fixed 1/2 hardware divider after the
configurable divider.

> The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
> divider in the hardware IP after the configurable divider, so the
> real output rate is:
>=20
>     rate =3D parent_rate * num / (den * 2)

[Severity: Medium]
Does this formula mathematically contradict the driver's implementation?

The code in drivers/clk/spacemit/ccu_ddn.c calculates the rate by multiplyi=
ng
by den and dividing by num:

drivers/clk/spacemit/ccu_ddn.c:ccu_ddn_calc_rate() {
    ...
    return prate * den / pre_div / num;
    ...
}

The file's documentation also notes:

 *              Fin     denominator
 *      Fout =3D ----- * -------------
 *               2       numerator

Could the commit message be updated to reflect the actual hardware behavior?

> Set pre_div to 2 to account for it.
>=20
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>=20
> ---
>  drivers/clk/spacemit/ccu-k3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index abcc5caa67bd7..675cf03d98f05 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -244,11 +244,11 @@ CCU_MUX_DEFINE(i2s3_sysclk_sel, i2s_sysclk_parents,=
 MPMU_I2S_SYSCLK_CTRL, 12, 2,
>  CCU_MUX_DEFINE(i2s4_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL=
, 16, 2, 0);
>  CCU_MUX_DEFINE(i2s5_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL=
, 20, 2, 0);
> =20
> -CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16=
, 16, 16, 1, 0);
> -CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16=
, 16, 16, 1, 0);
> -CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16=
, 16, 16, 1, 0);
> -CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16=
, 16, 16, 1, 0);
> -CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16=
, 16, 16, 1, 0);
> +CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16=
, 16, 16, 2, 0);

[Severity: High]
This is a pre-existing issue, but can this lead to a kernel panic due to an
unhandled zero divisor?

In drivers/clk/spacemit/ccu_ddn.c, ccu_ddn_recalc_rate() reads hardware
registers directly:

drivers/clk/spacemit/ccu_ddn.c:ccu_ddn_recalc_rate() {
    ...
    num =3D (val & ddn->num_mask) >> ddn->num_shift;
    den =3D (val & ddn->den_mask) >> ddn->den_shift;
   =20
    return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
    ...
}

If the register contains 0 for num, ccu_ddn_calc_rate() will divide by zero:

drivers/clk/spacemit/ccu_ddn.c:ccu_ddn_calc_rate() {
    ...
    return prate * den / pre_div / num;
    ...
}

Additionally, in ccu_ddn_calc_best_rate(), if the parent rate is less than
ddn->pre_div (for example, if prate is 0), the calculation
prate / ddn->pre_div evaluates to 0. This causes rational_best_approximatio=
n()
to set num to 0, which is then passed to ccu_ddn_calc_rate(), again leading=
 to
a division by zero.

Should we add validation to prevent division by zero in these paths?

> +CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16=
, 16, 16, 2, 0);
> +CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16=
, 16, 16, 2, 0);
> +CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16=
, 16, 16, 2, 0);
> +CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16=
, 16, 16, 2, 0);
> =20
>  static const struct clk_parent_data i2s2_sysclk_parents[] =3D {
>  	CCU_PARENT_HW(i2s_sysclk),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-k3-clk-fix=
-i2s-v1-0-e95001a692ee@linux.spacemit.com?part=3D3
