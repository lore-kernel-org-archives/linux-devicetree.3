Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854241E6A7
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877185; cv=none; b=ELvT7Qq3jn3NT6mvFUerX8CJBPVsNB0QRn76b0y9C9c+Co5wNIR7cKVHn74mj7ppAJU6YwMXV9n5phqDsgZ0brMXOS6v9FwefOP9Aw1G2gU0FwhmxjWiTV4TfIDf7R1xS1s/aWoRgKV1tsCURmTOYmtFjXcf0+vcIfIsRrVrn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877185; c=relaxed/simple;
	bh=TuWRjIRjemj45zX34RbCIZlGeH+m9jMmMHNJhSHPNj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ax4kAXKVIu+fOKeLwLuAoCDqpKnqMmRFoEtmkRnzyz0a/rUmaYvRSjGqbzVO1LkUsZjiCRoVApsVhBCFQGVIDg2OiwYlGjTi/yIvBWWzILkv+BFcp42RxBMbHAn3JDk2M2UkNnzpXMWHPA2Wvwec0vpEG+5F1nwc7Fpg26x5PmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjkF+CdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjkF+CdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFABB1F000E9;
	Tue,  4 Aug 2026 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785877184;
	bh=d3lrPPc1Xu9fg67OlFrfVWCmVfdPU9mogEgTw1UYSF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GjkF+CdIuDTMCSSscL7l9YNzcqiMEglENiu6DKVDGsOXN84OyJA8BUZm+Ie/RU/OA
	 wb/2Gycf1w66LnLKv17fgGM6II/0E3ARTQmCRQxj5B6veqzrZY24Uyc0AH9KJgh5jV
	 O8AGpTG2ZhB4SZxvqgTzrisLyZshplGVRijAzTTfF+0eoeRV62JmYEitxWc+okRPzs
	 +7xm4TCg2e7xxXoMRA8cXv8RIp46IdxS0aPW83/KUruCkZ+5u/lLcgmROGF0acgN+p
	 JZEB5x0QgXlWQqPfZkKZtRPCH6EASR4fp/KkCSP7nEZkSJBET/Ft/LG19Wcs6AORcF
	 KIKlhkIzD02sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] mmc: core: Honor keep-power-in-suspend and
 reset-card-at-resume for (e)MMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804203818.881765-4-kamal.dasu@broadcom.com>
References: <20260804203818.881765-1-kamal.dasu@broadcom.com>
 <20260804203818.881765-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:59:42 +0000
Message-Id: <20260804205943.CFABB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Enabling `keep-power-in-suspend` without `reset-card-at-resume` le=
aves the host controller in a high-speed state, causing `mmc_init_card()` t=
o fail on resume.
- [High] Back-powering unpowered MMC cards by driving the clock before the =
VDD regulator is enabled when `reset-card-at-resume` is set but `keep-power=
-in-suspend` is not.
--

--- Patch [3]: [PATCH v6 3/3] mmc: core: Honor keep-power-in-suspend and re=
set-card-at-resume for (e)MMC ---
commit be3e1ca70917d880d996ee80f1806958a2aa8477
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Honor keep-power-in-suspend and reset-card-at-resume for (e)MMC

This commit introduces support for keep-power-in-suspend and
reset-card-at-resume properties for (e)MMC devices. It allows platforms to
keep the card powered during suspend to DRAM for firmware access, and resets
the host controller state upon resume.

Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@b=
roadcom.com/

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909f..f85e034c79ed7 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c

[ ... ]

> @@ -2217,9 +2237,22 @@ static int _mmc_resume(struct mmc_host *host)
>  	if (!mmc_card_suspended(host->card))
>  		goto out;
> =20
> +	/*
> +	 * Firmware or other hardware may have accessed the card while it
> +	 * stayed powered through suspend, leaving it in a state the kernel
> +	 * can no longer assume it knows. Reset the host to its initial bus
> +	 * state like _mmc_hw_reset() does for a non-power-cycle reset,
> +	 * before mmc_init_card() re-identifies the card.
> +	 */
> +	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
> +		mmc_set_clock(host, host->f_init);
> +		mmc_set_initial_state(host);
> +	}

[Severity: High]
If a device tree specifies reset-card-at-resume but not
keep-power-in-suspend, _mmc_suspend() will call mmc_power_off(), disabling
the VDD regulator and setting power_mode =3D MMC_POWER_OFF.

When _mmc_resume() executes this MMC_CAP2_RESET_AT_RESUME block, it calls
mmc_set_clock() and mmc_set_initial_state() before mmc_power_up() is called.

Could this lead to back-powering the unpowered MMC card by actively driving
the clock pin before the VDD regulator is enabled?

> +
>  	mmc_power_up(host, host->card->ocr);
>  	err =3D mmc_init_card(host, host->card->ocr, host->card);

[Severity: High]
If a device tree specifies keep-power-in-suspend but lacks
reset-card-at-resume, _mmc_suspend() skips mmc_power_off(), leaving
power_mode =3D=3D MMC_POWER_ON.

When _mmc_resume() is called, it skips the MMC_CAP2_RESET_AT_RESUME block
above. Then mmc_power_up() is called, but it returns immediately because
power_mode is already MMC_POWER_ON:

drivers/mmc/core/core.c:mmc_power_up() {
	if (host->ios.power_mode =3D=3D MMC_POWER_ON)
		return;
	...
}

Does this cause mmc_init_card() to be called while the host is still
configured for high-speed operation (e.g. 200MHz, HS400), causing the 400kHz
initialization commands to fail?

>  	mmc_card_clr_suspended(host->card);
> +	host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> =20
>  out:
>  	mmc_release_host(host);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804203818.8817=
65-1-kamal.dasu@broadcom.com?part=3D3
