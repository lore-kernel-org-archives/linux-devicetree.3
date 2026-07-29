Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39214900E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357001; cv=none; b=I+oH1Th3230JRsal9Lwuit0GvNgM9sul9H4QEOvPKxjfurLvU3gu6ZdiJaix70CVlM+r5rG/9LZtIXvXiJK/KnRoxvQpgHfcX6yv+3x/Lt/XgsytNErkCinD6qCgDTdWSdgFkEDJ8HYgJxK93AYEOjt97QIzKiSrndW2Gj8rvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357001; c=relaxed/simple;
	bh=MN/p7co7LLc5bmfDzoNHYa2q0e0cGBUQDeSv1icjxUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lILmsexCx226OvqSPIDQDIZKLLWcHPPmE+dwdartlwlUj/kmdq1ZMcL9iXMoD0Qrgc7+irfmYUJpeTnfzHedP4xIENpBR1O1SBTT8XR5xXWoKt0I3hsHTfXk1UWKtDX7oxIT3p8eJGwCMIAxnaP4ovtI0Jz4byIfUraMgnI8k5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPzIk6Qo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPzIk6Qo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA121F00ACA;
	Wed, 29 Jul 2026 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785356998;
	bh=O8UEDf/kNRbmy9Y1t6po/HMKvbl+rmCmU90Gk4brSaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XPzIk6Qo8Ww0s9L8brVPgJxWGPsnDm+dvxo4XJBUypBiceYSJyXxzTY4c0WXLWGYA
	 GrZnpjSoFoiXdxrgps27j0UUYosbuaq+DDV3O0FUuO9XOuzA+0H+cb+uTHu2CRA00z
	 CWYxR2YTn61Dg8ZJYNLPuqdl3xSu3gO8OvGWFcGAee3tVjA0Sn9Bix0OotTmZ/wNtF
	 zOeY3Z+ASxGK+yQz7+/DpQf0hijcM8UrCTDfjmwOUfHxBSQtc2bKm7NWxNekAFF44d
	 89xpMt7VQjB+zUEIs0RT4VOGm5OLVvo+nYjhCfldAVyRge295XpzlP0BPMcrYee/HX
	 SGemInD3t7mdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] mmc: core: Honor keep-power-in-suspend for
 (e)MMC in suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729201420.4047677-3-kamal.dasu@broadcom.com>
References: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
 <20260729201420.4047677-3-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:29:58 +0000
Message-Id: <20260729202958.6AA121F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Leaving the eMMC card in high-speed mode (e.g., HS200/HS400) while=
 abruptly resetting the host controller to legacy timing causes DLL desynch=
ronization and breaks communication upon resume.
- [High] Missing eMMC Power-Off Notification during shutdown, unbind, and u=
ndervoltage when MMC_PM_KEEP_POWER is active.
- [Medium] The static MMC_PM_KEEP_POWER capability unintentionally disables=
 aggressive runtime power management (Runtime PM) for the eMMC.
--

--- Patch [2]: [PATCH v5 2/2] mmc: core: Honor keep-power-in-suspend for (e=
)MMC in suspend/resume ---
commit 1dd1eea6a2934ec02e25c3c7fb1a083b652339a7
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Honor keep-power-in-suspend for (e)MMC in suspend/resume

This commit introduces support for preserving eMMC power during suspend-to-=
DRAM
on platforms where firmware accesses the card directly during resume. It sk=
ips
the sleep and power-off notify sequence if MMC_PM_KEEP_POWER is set.

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909f..7cbe655327264 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
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

[Severity: Medium]
Since mmc_runtime_suspend() also calls _mmc_suspend() with
MMC_POWEROFF_SUSPEND, does matching the static host->pm_caps here
inadvertently skip the power down sequence during routine runtime idle
suspend, effectively disabling aggressive runtime power management?

> +		if (!mmc_host_is_spi(host))
> +			err =3D mmc_deselect_cards(host);
> +		if (!err) {
> +			host->pm_flags |=3D MMC_PM_KEEP_POWER;
> +			mmc_set_clock(host, host->f_init);
> +			mmc_set_initial_state(host);

[Severity: High]
Does this abruptly drop the host controller's clock to f_init and switch
to legacy 1-bit timing while the eMMC card remains fully powered and
stranded in its high-speed state?

Could this cause the card's internal DLL to lose lock, resulting in
communication failure upon resume when mmc_init_card() sends CMD0?

> +			mmc_card_set_suspended(host->card);

[Severity: High]
Since the new MMC_PM_KEEP_POWER fast path marks the card as suspended
without powering it down, will the early exit in _mmc_suspend() mistakenly
skip subsequent power-off notifications?

If a shutdown, unbind, or undervoltage occurs later, it hits this check
in _mmc_suspend():

	if (mmc_card_suspended(host->card))
		goto out;

and skips sending EXT_CSD_POWER_OFF_LONG and powering off the card?

> +		}
> +		goto out;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729201420.4047=
677-1-kamal.dasu@broadcom.com?part=3D2
