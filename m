Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911A48167D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909851; cv=none; b=Qno75LZnszCd+tkZQ3p3BJJTb2WyHEoj7bUktMXeD9ELwxEPESuTTkoLOIXKG3TqvU13vC8JQmP9kXLDhSKxop4ucKmBbobeHcD7jva18wdyfeIJz56A6RRDwpj+N6u2+rJ5EgSAd6PkVpPhJKZSopITy/qk5IKj8cSODsTzTOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909851; c=relaxed/simple;
	bh=A1SIXtn3ZrFNa+op4nWaQYX/DZT+USy9HKqa5V3aiu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NE5R0KnfaWmGZMMypXkzubrRtVEQ4oeERW5NIN7mjFIAmuWju994HLcmgCjwojVoiyKY6m8wa3N//hvfsQmSmgtJbs5bWzaobt4kxCOZXmAvAZU5WPChsB88xSjUpjfQD0l7uqQ7S0NTsplly+da5eZGZtNXqEemhIfATlpnxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPpUqoY6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPpUqoY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9241F000E9;
	Wed,  1 Jul 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909849;
	bh=QWl+kWMEH5b4rwUEreR6VRH5bFCkRa9rs8RhGFwRugA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPpUqoY6nPw9FLvgIO75HBUe+3ZqzoPPNv/fkgAeppMUhRG4v6RPVjIzroE7HY2YN
	 AzL6IX+SaCoP8gBr8sr/UJhrgy1Xch+sLtf1gktqyPF3wcuH73pr6mL5bc5/l3RoCG
	 ZVz1rd+5CP/jASRfYW7R8OjkH2Zk8/P5IKkIKDAlLc/doiOMM8SgVk+w85MVSQAIWn
	 AWoxq5PmzhrwULXv5kZ1Ap97mz/fLB+pChd2zLCNSfujNACgZmPxQUd5MMo47Cmoye
	 fC2NdTJwi8qWOCJCWT9j1L6Ymu+roVU24MgTLl9s0sXBhnjIOe1gmmES+lFoVw+BwY
	 5s6vDsVEizQWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] pmdomain: mediatek: Add support for Direct CTL
 simple power sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701121920.19347-4-angelogioacchino.delregno@collabora.com>
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:44:07 +0000
Message-Id: <20260701124408.3B9241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The return values of the power-off sequence functions (`scpsys_mod=
em_pwrseq_off`, `scpsys_ctl_pwrseq_off`, and `scpsys_simple_pwrseq_off`) ar=
e ignored in `scpsys_power_off()`, silently dropping timeouts and masking h=
ardware failures.

Pre-existing issues:
- [High] Incomplete error handling in `scpsys_power_on` leaves the hardware=
 domain powered on if subsequent initialization steps fail.
- [High] Subsystem clocks are left permanently disabled if the bus protecti=
on enable step fails during the power-off sequence.
- [High] Missing GENPD_FLAG_NO_STAY_ON for domains supplied by regulators r=
isks delayed regulator cleanup while domains remain active.
- [High] The function `scpsys_power_on()` fails to restore the ext_buck_iso=
 hardware state on its error path.
--

commit 893d0afc69c059985945081fa1e299e1362c2611
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: pmdomain: mediatek: Add support for Direct CTL simple power sequen=
ce

This commit introduces support for a Direct CTL simple power sequence for
new MediaTek SoCs. The simple power sequence applies to domains without RTFF
hardware or bus protection, simplifying the power on/off process. It enables
the specific power domain's clock input and reset without needing to poll
for a power acknowledge signal.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index db543d4b1813c..5276adea1d041 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -721,15 +774,11 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
> =20
>  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>  		scpsys_modem_pwrseq_off(pd);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		ret =3D scpsys_simple_pwrseq_off(pd);
>  	else
>  		scpsys_ctl_pwrseq_off(pd);
> =20
> -	/* wait until PWR_ACK =3D 0 */
> -	ret =3D readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL=
_DELAY_US,
> -				 MTK_POLL_TIMEOUT);
> -	if (ret < 0)
> -		return ret;
> -
>  	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);

[Severity: High]
Does this code silently ignore the return values of the power-off sequence
functions?

By moving the timeout check into the individual off functions and changing
them to return an error code, if readx_poll_timeout() fails, they return the
error.

However, scpsys_power_off() does not check these return values (nor the
assigned ret variable for the simple sequence), meaning the timeout is
completely ignored.

Could this cause the driver to unconditionally tear down clocks and regulat=
ors
despite a physical power-off failure, potentially causing a system hang?

[ ... ]

While reviewing this patch, I noticed a few pre-existing issues in the same
file.

[Severity: High]
This is a pre-existing issue, but does the error path in scpsys_power_on()
fail to call the corresponding power-off sequence before disabling clocks a=
nd
regulators?

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_power_on() {
    ...
err_pwr_ack:
	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
err_reg:
	scpsys_regulator_disable(pd->supply);
	return ret;
}

If a step like bus protection or SRAM enablement fails during power-on, the
framework considers the domain off, but the physical hardware may remain
powered on without its necessary clocks and regulators.

Could this lead to state desynchronization and potential crashes?

[Severity: High]
This is a pre-existing issue, but are subsystem clocks left permanently
disabled if the bus protection enable step fails during the power-off seque=
nce?

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_power_off() {
    ...
	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);

	ret =3D scpsys_bus_protect_enable(pd, BUS_PROT_IGNORE_SUBCLK);
	if (ret < 0)
		return ret;
    ...
}

If scpsys_bus_protect_enable() fails, the operation aborts and returns an
error, leaving the domain considered ON by the genpd framework.

However, because subsystem clocks were already disabled and are never
re-enabled, could subsequent accesses to the domain cause a system crash or
lockup?

[Severity: High]
This is a pre-existing issue, but does scpsys_add_one_domain() implicitly
activate the stay_on mechanism without an opt-out flag?

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_add_one_domain() {
    ...
	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
		pm_genpd_init(&pd->genpd, NULL, true);
	else
		pm_genpd_init(&pd->genpd, NULL, false);
    ...
}

For domains supplied by regulators, if a consumer device does not probe
successfully, the genpd stay_on flag is never cleared because sync_state ne=
ver
fires.

The regulator core will asynchronously disable unused regulators after a de=
lay,
causing the hardware to lose power while its power domain registers are sti=
ll
active.

Should this include GENPD_FLAG_NO_STAY_ON to prevent this?

[Severity: High]
This is a pre-existing issue, but does the error path in scpsys_power_on()
fail to restore the ext_buck_iso hardware state?

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_power_on() {
    ...
	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO=
))
		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
				  pd->data->ext_buck_iso_mask);
    ...
err_pwr_ack:
	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
err_reg:
	scpsys_regulator_disable(pd->supply);
	return ret;
}

If a step fails after the ext_buck_iso bits are cleared, the function jumps=
 to
err_pwr_ack which disables clocks and regulators but fails to set the bits =
back
to restore isolation.

Could this lead to hardware state inconsistency and potential leakage curre=
nt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121920.1934=
7-1-angelogioacchino.delregno@collabora.com?part=3D3
