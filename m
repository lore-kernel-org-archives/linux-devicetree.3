Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6A3E5EF6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969485; cv=none; b=R5X2dUApXy0p/EJcxjLATUetDj9kF9FlsJBBNLMtQtp6g421WqkbcA4VqUAJbDi/vxr8XhqzgvZ5L21ivWFFuryyhWlaQ9zUD2o5h5VPxMBD3F8bqKmOB+xkEHxE3FlVCnq0/x2sLkH7pGWwVCWR60zmvJAadL6pscWz0aI31Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969485; c=relaxed/simple;
	bh=dZuiH5tOO8w2ZGg7bJwDy8IQ6pWzvvHlLgXpLTTPU2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JBx9mIOcNT+u1uT583cMlAVUQsvew0Gsh2utKuLwc+w9fnq5yzOeXmKA9XssAYVDGZQ+VA2n59NBES8qnKoE/U4XYLV+EWEC01DjZnhnwtjFlo3Cn3F87u+lobEAGxSxj1UnZJmTjf9gYHj/GdC5Y2LkUxKUh1IkMpKTeoek7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIB1fKYS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIB1fKYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544C81F000E9;
	Wed,  5 Aug 2026 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785969484;
	bh=v8adGSpzuAq78yC7+P3vtMYeP7yhpIaVr6X6Y4jTok8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIB1fKYSCZffcZZg64udrFND44pzQQb3swNhbEigKIpvQMuY/J6BD38+MCQuzFfvS
	 +Ft6cjP40nxcNM0qXy70SLk1Bz88PbTtZLwmUB4WpzxhHRUDZ4Db9YALDdTU5thkhM
	 SVvBuxvBK97Q3CQxsPpn+kqOrpnFivicZ1x7MDYybelyyQgAeMGwZ/YsFWSBTd+4y6
	 QpxBjuqj7+PuzhQfc1micVMPhggec4V5B7A7z+T6gDncWJUbBTMCfX0nPBHLRwH0cD
	 6/+lMmgSsJ1R5uOefeoJZdC0ipKbkaeIbsJP7h37v6CbNcy88wKZqQrX5VXSXI/gwm
	 CflKSl8iIJfNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] mmc: core: Honor keep-power-in-suspend and
 reset-card-at-resume for (e)MMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805222500.2567801-4-kamal.dasu@broadcom.com>
References: <y> <20260805222500.2567801-1-kamal.dasu@broadcom.com>
 <20260805222500.2567801-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 22:38:03 +0000
Message-Id: <20260805223804.544C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The fast-path in `_mmc_suspend()` for `MMC_POWEROFF_SUSPEND` sets =
the suspended state but leaves the card powered on. If a shutdown, undervol=
tage, or unbind event occurs while the card is runtime-suspended, the pre-e=
xisting early exit (`if (mmc_card_suspended(host->card)) goto out;`) causes=
 the function to return immediately. This bypasses the critical `mmc_powero=
ff_notify()` (which sends `EXT_CSD_POWER_OFF_LONG`) and `mmc_power_off()`, =
directly violating the commit message's claim that these events "still need=
 the normal power-off path".
--

--- Patch [3]: [PATCH v7 3/3] mmc: core: Honor keep-power-in-suspend and re=
set-card-at-resume for (e)MMC ---
commit 50bf6f999dd980cb9368096f4fc9122b882d9a42
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Honor keep-power-in-suspend and reset-card-at-resume for (e)MMC

This patch introduces support for keep-power-in-suspend and
reset-card-at-resume in the core (e)MMC suspend/resume paths. It adds a
fast-path in _mmc_suspend() that leaves the card powered on if these
capabilities are set, and a corresponding reset block in _mmc_resume().

Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@b=
roadcom.com/

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909f..62cc009f2a2bf 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c

[ ... ]

> @@ -2157,6 +2157,33 @@ static int _mmc_suspend(struct mmc_host *host, enu=
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
> +	 * Require MMC_CAP2_RESET_AT_RESUME too: without it, _mmc_resume()
> +	 * has no way to bring the host back to a state mmc_init_card() can
> +	 * use, since mmc_power_up() no-ops when power_mode is already
> +	 * MMC_POWER_ON. Keeping power without also resetting at resume is
> +	 * not a safe combination for this driver.
> +	 */
> +	if (pm_type =3D=3D MMC_POWEROFF_SUSPEND &&
> +	    (host->pm_caps & MMC_PM_KEEP_POWER) &&
> +	    (host->caps2 & MMC_CAP2_RESET_AT_RESUME)) {
> +		if (!mmc_host_is_spi(host))
> +			err =3D mmc_deselect_cards(host);
> +		if (!err) {
> +			host->pm_flags |=3D MMC_PM_KEEP_POWER;
> +			mmc_card_set_suspended(host->card);
> +		}
> +		goto out;
> +	}

[Severity: High]
Does this fast-path interact incorrectly with the early exit at the top of
_mmc_suspend()?

If the host is configured with MMC_PM_KEEP_POWER and MMC_CAP2_RESET_AT_RESU=
ME,
and the eMMC enters runtime suspend, this fast-path marks the card as suspe=
nded
but intentionally leaves the power on.

If a subsequent system shutdown, unbind, or undervoltage event occurs,
_mmc_suspend() will be called again. However, since mmc_card_suspended()
is now true, the function will hit the early exit:

	if (mmc_card_suspended(host->card))
		goto out;

Will this bypass mmc_poweroff_notify() and mmc_power_off() entirely,
despite the comment indicating that shutdown, unbind, and undervoltage
still need the normal power-off path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805222500.2567=
801-1-kamal.dasu@broadcom.com?part=3D3
