Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0333ADB1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266115; cv=none; b=NCzx8jCfJJMl2VkydLaVHhz118PflRTHorToXre4Hc2zPq7y9bAIMoL6Uq52QOa0bfPXud5YxxXL0gmlyMUKZhq4/uWj+7wsda+mXO4KSzDtEaxZF5nCuxeb/vmMgOoYDBxskxO4l52PKK+psFdkL68FSmu5SAGL1jv64MgaU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266115; c=relaxed/simple;
	bh=StTGF5eht0BkBDZtukxxvJi4MT5hMDzPFO0r1Ler2l4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BixH9i//3UjF6nlYj6t6oRIhTRGuewjs/Ucp4yVWeBZdfx7EnGn0isnm87Uk/WQ0LjtiETviAKFOQlN61UT1y7pDqEblIUwrDjzoOArHHuYa9qearSMo9V+HUHy0SyH28JQPH90JySCGG2NapWRwOsynl3AmpMf3Texqthp/uKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF+yRhZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF+yRhZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B004D1F000E9;
	Tue, 28 Jul 2026 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266114;
	bh=6kLLIdjBOZP22L1CAO9wh6wocv7+PgIO6GeU2iP55lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mF+yRhZC9STtNv94BZrf3pQaxlSKdMPLpUcK+8Py2TPFh18exGDNNVhOX65jjd6Fe
	 AhtMJDlcVIW3zNgKygIzPBLR8f2zfI/5UlgdHVKxPz0Fluu7ZIt6jvirX4UO34cdv4
	 2alZZLVbSrIjI1hhZF2miHiQ8bD+n6+y7qvL2qjjt5HWsEhn1Fdx2wrdUstV80UB/E
	 h1wnpK+UwY4QC5+XS2DS/OvGJTOl2a9lFDfl5IwfyljET1+qvd58MM5tkUn/BlOpVs
	 LTu92cvaw2bJpUklXG0TCPAkIl2cYT61qs08Jng0SgkyfiN65mBDg8LeIJd56nqacF
	 hEioUFFzfgBiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] mmc: core: Honor keep-power-in-suspend for
 (e)MMC in suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728190314.2325906-3-kamal.dasu@broadcom.com>
References: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
 <20260728190314.2325906-3-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:15:13 +0000
Message-Id: <20260728191513.B004D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `MMC_PM_KEEP_POWER` flag is permanently leaked in `host->pm_fl=
ags` if the fast suspend path fails during `mmc_deselect_cards()`.
--

--- Patch [2]: [PATCH v4 2/2] mmc: core: Honor keep-power-in-suspend for (e=
)MMC in suspend/resume ---
commit 575375a652461af659583ed563eb72a97ab24900
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Honor keep-power-in-suspend for (e)MMC in suspend/resume

This commit updates the core MMC code to honor the keep-power-in-suspend
flag for (e)MMC devices. When this capability is present during suspend,
the power-off sequence is skipped and the host is reset to its initial
state instead. The MMC_PM_KEEP_POWER flag is set to inform host controllers
of the preserved power state.

Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli=
@broadcom.com/

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c

[ ... ]

> @@ -2157,6 +2157,35 @@ static int _mmc_suspend(struct mmc_host *host, enu=
m mmc_poweroff_type pm_type)
>  			goto out;
>  	}
> =20
> +	/*
> +	 * Keep the card powered across an actual suspend; shutdown, unbind
> +	 * and undervoltage still need the normal power-off path below,
> +	 * since they aren't guaranteed a subsequent _mmc_resume().
> +	 *
> +	 * Check pm_caps, not pm_flags: unlike SDIO, (e)MMC has no
> +	 * per-function driver to request this via
> +	 * sdio_set_host_pm_flags(), so it's a fixed platform trait here.
> +	 *
> +	 * Set MMC_PM_KEEP_POWER in pm_flags so host controller drivers
> +	 * know card power was preserved during suspend and perform a
> +	 * soft resume sequence.
> +	 *
> +	 * Reset the host to its initial bus state like _mmc_hw_reset()
> +	 * does.
> +	 */
> +	if (pm_type =3D=3D MMC_POWEROFF_SUSPEND &&
> +	    (host->pm_caps & MMC_PM_KEEP_POWER)) {
> +		host->pm_flags |=3D MMC_PM_KEEP_POWER;
> +		if (!mmc_host_is_spi(host))
> +			err =3D mmc_deselect_cards(host);
> +		if (!err) {
> +			mmc_set_clock(host, host->f_init);
> +			mmc_set_initial_state(host);
> +			mmc_card_set_suspended(host->card);
> +		}
> +		goto out;
> +	}
> +

[Severity: High]
Does this leak the MMC_PM_KEEP_POWER flag if mmc_deselect_cards() fails?

If mmc_deselect_cards() returns an error, the function jumps to out without
marking the card as suspended.

[ ... ]

> @@ -2220,6 +2249,7 @@ static int _mmc_resume(struct mmc_host *host)
>  	mmc_power_up(host, host->card->ocr);
>  	err =3D mmc_init_card(host, host->card->ocr, host->card);
>  	mmc_card_clr_suspended(host->card);
> +	host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> =20
>  out:
>  	mmc_release_host(host);

If the system then attempts to recover from the aborted suspend by calling
_mmc_resume(), it checks if the card is suspended and exits early:

_mmc_resume() {
	...
	if (!mmc_card_suspended(host->card))
		goto out;
	...
}

Since the card was never marked suspended during the error path, it will
take this goto out path and bypass the host->pm_flags cleanup, leaving
MMC_PM_KEEP_POWER set permanently for the remainder of the uptime.

Would it be better to clear the flag in the error path of _mmc_suspend(), or
perhaps wait to set the flag until after mmc_deselect_cards() succeeds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728190314.2325=
906-1-kamal.dasu@broadcom.com?part=3D2
