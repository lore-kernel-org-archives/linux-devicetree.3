Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDC3DFC93
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587525; cv=none; b=XdPqSP2b1uadXrLU6PQnry9OEdASt86TbixjiX/RlOw5Lv/1GG78R30CwXPY7hNpsE8K4XvYqmXoEnblV5oAKDhvaz/LH64B2Vf+U04Avs1swDl5wK7vl8lEaXYYvDyOzKhWpPdn/lfl3PEr+vl0MMXZ89xnmOCs2O3EauDrlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587525; c=relaxed/simple;
	bh=lA4D0VVOJNcj9Zx44cypyx/73uvxtGWB0qA8l7giOqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T6nfDb5rm7yGBS6a5XZFyWf8d9LdAZNG8Oc3mtFbr/ZIJUoRk9hngaKyLwvowjM7Ow4Xe+onE7L+tWYTwom4XtqQSjY+weEC8gzLSk8gfRPDrdE5E9mBXcjskf/qTS/XDUKlNclT6acejZrFpHjPHNJ8tv9y6f7iytV+NTkR9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOQVQroa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOQVQroa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C09E1F000E9;
	Thu,  9 Jul 2026 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587523;
	bh=rLK5S1L3rA0vu1LXd7/vqGkux7AeRUGN0xaEr4f/g08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kOQVQroamHwMWmILTKx5PtSsBNVLtV2uXQ9/nI+DMouU+pz80Bq++aC3HuOSCfnE/
	 Fb1cbSJLPvsDCQAl9ZtcCNPA/+Q9KQI+n8dx5Da5152JRMdByKzpPcbiZHoEgJi3Wl
	 sGpXxNdb1YAzm9X+Ue2sEKv+nt8FkCBqxG73F5I1X2lvss9c+auHY4c5AuclI7hjoB
	 uFFoNbutFxFmbyL8ciU4PpLJWW15ZqAdWzXrfiTLBglkPXf0Rpzh32HfwBqZeYf25p
	 KtdcPLs8gldKPiOvabzX1fqMw96hhLmmfPTC85dao3YvyDUtIKvQ2x/9tiICJ7kBaa
	 KihA74vTJUwew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] pmdomain: mediatek: Add support for Direct CTL
 simple power sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709084635.24912-5-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
 <20260709084635.24912-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:58:42 +0000
Message-Id: <20260709085843.6C09E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete error recovery in `scpsys_power_off_internal` leaves ha=
rdware paralyzed and causes clock refcount underflows.
- [High] Unbalanced lifecycle operations in `scpsys_power_on` fail to rever=
t hardware state on error.
- [Medium] Malformed device trees lacking access controllers guarantee a NU=
LL pointer dereference in `scpsys_bus_protect_get_regmap`.
--

--- Patch [4]: [PATCH v3 4/5] pmdomain: mediatek: Add support for Direct CT=
L simple power sequence ---
commit 0a6955778a8abcdf284811fe9a9089e2c1cff6d6
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Add support for Direct CTL simple power sequence

Some new SoCs like MT8196, MT6991, and others, have got one
additional power controller (usually in the HFRP Multimedia
block) which needs a simplified power on/off sequence while
using Direct Control strategy.

Domains using the "simple power sequence" are not backed by
the RTFF hardware, have no Bus Protection mechanism, lacks
the ISO, PWR_ON, PWR_ON_2ND bits, and therefore get enabled
automatically after getting out of reset.

This simple power sequence is then a subset of the full one
as only needs the enablement of the specific power domain's
clock input and reset (where, again, after getting out of
reset, the ISO and PWR_ON bits are automatically internally
getting flipped) to enable or disable (power on or off).

Moreover, the simple power sequence power domains guarantee
that they always get enabled/disabled after executing the
relevant power sequence (on/off) so, differently from the
others, there is also no need to poll for a PWR_ACK.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 8d49d9ee3cd29..632c5dcdcedaf 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -688,7 +739,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>  err_enable_bus_protect:
>  	scpsys_bus_protect_enable(pd, 0);
>  err_disable_sram:
> -	scpsys_sram_disable(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
>  	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
>  		clk_bulk_disable_unprepare(pd->num_subsys_clks,
>  					   pd->subsys_clks);

[Severity: High]
This is a pre-existing issue, but does this error path fail to revert
the hardware state if an error occurs?

If scpsys_bus_protect_disable() or clk_bulk_prepare_enable() fails after
*_pwrseq_on() has successfully executed, the error path jumps to err_pwr_ac=
k.

This path disables the domain's regulator and clocks but fails to execute
*_pwrseq_off() or revert ext_buck_iso:

err_pwr_ack:
	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
err_reg:
	scpsys_regulator_disable(pd->supply);
	return ret;

Could this sever the supply while leaving the domain's internal logic activ=
e,
resulting in hardware lockup and state machine desynchronization?

[ ... ]
> @@ -725,15 +778,21 @@ static int scpsys_power_off_internal(struct scpsys_=
domain *pd)
>  		return ret;
> =20
>  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> -		scpsys_modem_pwrseq_off(pd);
> +		ret =3D scpsys_modem_pwrseq_off(pd);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		ret =3D scpsys_simple_pwrseq_off(pd);
>  	else
> -		scpsys_ctl_pwrseq_off(pd);
> +		ret =3D scpsys_ctl_pwrseq_off(pd);
> +
> +	if (ret < 0) {
> +		/* Re-enable clocks so that next power off doesn't break the refcount =
*/
> +		int r =3D clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks=
);
> +
> +		if (r)
> +			dev_warn(scpsys->dev, "Could not re-enable clocks: %d\n", r);
> =20
> -	/* wait until PWR_ACK =3D 0 */
> -	ret =3D readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL=
_DELAY_US,
> -				 MTK_POLL_TIMEOUT);
> -	if (ret < 0)
>  		return ret;
> +	}
> =20
>  	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);

[Severity: High]
This isn't a bug introduced by this patch, but does the error recovery in
scpsys_power_off_internal() leave the hardware in a paralyzed state?

If pwrseq_off fails, this block restores subsys_clks but leaves the domain's
SRAM disabled, isolation applied, and bus protection disabled, while
returning an error to genpd.

Because an error is returned, genpd treats the domain as still ON, allowing
active consumers to interact with a paralyzed hardware domain.

Additionally, if scpsys_bus_protect_enable() fails earlier in this function:

	ret =3D scpsys_bus_protect_enable(pd, BUS_PROT_IGNORE_SUBCLK);
	if (ret < 0)
		return ret;

It returns early and bypasses clock recovery entirely, causing a permanent
clock refcount underflow on the next failure.

Can we ensure consistent state on power off errors?

[ ... ]
> @@ -1109,6 +1168,12 @@ static int scpsys_get_bus_protection_legacy(struct=
 device *dev, struct scpsys *s
>  		regmap[2] =3D NULL;
>  	}
> =20
> +	/* If no access controllers are needed, don't allocate and don't fail */
> +	if (num_regmaps =3D=3D 0) {
> +		scpsys->bus_prot =3D NULL;
> +		return 0;
> +	}
> +
>  	scpsys->bus_prot =3D devm_kmalloc_array(dev, num_regmaps,
>  					      sizeof(*scpsys->bus_prot), GFP_KERNEL);

[Severity: Medium]
This is a pre-existing issue, but does this result in a NULL pointer
dereference if the device tree is malformed?

If an older SoC's device tree is missing required access controllers,
num_regmaps becomes 0. The probe function succeeds and explicitly sets
scpsys->bus_prot =3D NULL.

When the domain later attempts to power on, scpsys_bus_protect_enable() sees
that the hardcoded SoC domain data still requests bus protection and
unconditionally dereferences the NULL array in
scpsys_bus_protect_get_regmap():

	unsigned short block_idx =3D scpsys->bus_prot_index[bpd->bus_prot_block];
	return scpsys->bus_prot[block_idx];

Should we ensure scpsys->bus_prot is not dereferenced when NULL, or perhaps
fail the probe if required controllers are missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709084635.2491=
2-1-angelogioacchino.delregno@collabora.com?part=3D4
