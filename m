Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349684399D7
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755504; cv=none; b=Nt4Ei+MKoajZwnqw90qRyG+ayJxQMHeVf1jLshBo+goP1dvAqtlIZPMtYMn16zwqDJjAUnYgpjpDHr4zJg/FM1GK0pZ5s+fsFleT8xG4VzyubLJveJ2NQla/B1Z7qdu+0SAQl+skXouVmMjqCPVzfZaKI54pa4z4U+RN8JmxsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755504; c=relaxed/simple;
	bh=/H1z752+2IonNbBPGEve5njyexKRAIGH3mgMPbwmQjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NjZ2HuFhKhjmGuLqTC81m4Q7TT8hKI9kaVdmgJyU25BjWFOz2ltWJZxVnFAcQyxR28PfBT+ZCCoP/6p8sThR3uCQCmXa3/spAO3gR37ZI3otaRbEp6v6MnIO+LRPNvAMgqTqGFCyoKkqNPxsHE+Q5jUJjPg8auUfHcfmlNzB5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9xkMBld; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9xkMBld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2914A1F000E9;
	Wed, 22 Jul 2026 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784755498;
	bh=AQTvDswGjcZJYE4m7eV8mlibqHWT8BmDJ5uT8aYUonY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T9xkMBldYM6FWSdhycmoRTkXucV8Q3okz/1aBCaknyTo2LxV5bxZMRT9McmspRQXF
	 bpHYVuNDI19yXBSugHZ9r3xFrLTLZfLWtpkN3PgzmxJOGoD9k8lkgYuasYBMYuRe8Q
	 8wjU/MGkZ+jufcfAQKOJ3iartm3lT03fNd1qkazCedK51bNpxX+mxNEjxJ8QW/Thd4
	 DY1+3iuKH2vjj+p/CmUPgXMv1Ro2yOtXn/Ett4uQ3roNM2J9tx8rv/RnubbDIq/tiA
	 /0MSYCXTG8IoWBuQIh9hlCe57g+mOyjpmc9efZGfGJgxKLzmAMj/cbndD07vHzg1oU
	 dB15taqZIk7UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mmc: core: Add MMC_CAP2_NO_POWEROFF_SUSPEND host
 capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722211417.3702709-3-kamal.dasu@broadcom.com>
References: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
 <20260722211417.3702709-3-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:24:57 +0000
Message-Id: <20260722212458.2914A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The MMC_CAP2_NO_POWEROFF_SUSPEND bypass unconditionally applies to=
 all power-off types in `_mmc_suspend()`, preventing power-off notification=
s and emergency actions during system shutdown, driver unbind, and undervol=
tage protection.
- [High] Skipping `mmc_power_off` during suspend leaves `host->ios.power_mo=
de` as `MMC_POWER_ON`, causing `mmc_power_up` to return early on resume, wh=
ich breaks card re-initialization by failing to reset the clock and bus sta=
te.
--

--- Patch [2]: [PATCH v3 2/2] mmc: core: Add MMC_CAP2_NO_POWEROFF_SUSPEND h=
ost capability ---
commit d167c50cff315ae6b0704bc19e48556178313b8a
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Add MMC_CAP2_NO_POWEROFF_SUSPEND host capability

On some platforms, firmware accesses the (e)MMC card directly during resume
from Suspend-to-DRAM. This requires the card to remain powered and responsi=
ve
throughout suspend. This patch adds MMC_CAP2_NO_POWEROFF_SUSPEND to skip the
poweroff-notify/sleep/power-off sequence during _mmc_suspend().

Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@b=
roadcom.com/

[ ... ]

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909f..27a559e6fcc0b 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2157,6 +2157,21 @@ static int _mmc_suspend(struct mmc_host *host, enu=
m mmc_poweroff_type pm_type)
>  			goto out;
>  	}
> =20
> +	/*
> +	 * Some platforms need the card to stay powered and responsive
> +	 * throughout suspend, since firmware accesses it directly during
> +	 * resume, before the kernel's own resume path has run. Just
> +	 * deselect it and leave power alone; mmc_init_card() will fully
> +	 * re-initialize the card once the kernel resumes.
> +	 */
> +	if (host->caps2 & MMC_CAP2_NO_POWEROFF_SUSPEND) {

[Severity: High]
Does this unconditionally bypass the power-off and notification sequence for
all pm_type values, including MMC_POWEROFF_SHUTDOWN and=20
MMC_POWEROFF_UNDERVOLTAGE?

Since this doesn't check if pm_type =3D=3D MMC_POWEROFF_SUSPEND, could this
prevent required power-off notifications and emergency actions during system
shutdown, driver unbind, or undervoltage events?

[Severity: High]
If we skip mmc_power_off() here, won't host->ios.power_mode remain
MMC_POWER_ON?

During resume, _mmc_resume() calls mmc_power_up(), which checks the
power_mode:

drivers/mmc/core/core.c:mmc_power_up() {
    if (host->ios.power_mode =3D=3D MMC_POWER_ON)
        return;
    ...
}

Will mmc_power_up() return early, skipping the clock and bus reset in
mmc_set_initial_state()?

If so, could this cause mmc_init_card() to subsequently execute using an
invalid high-speed host bus state instead of the required reset state?

> +		if (!mmc_host_is_spi(host))
> +			err =3D mmc_deselect_cards(host);
> +		if (!err)
> +			mmc_card_set_suspended(host->card);
> +		goto out;
> +	}
> +
>  	if (mmc_card_can_poweroff_notify(host->card) &&
>  	    mmc_host_can_poweroff_notify(host, pm_type))
>  		err =3D mmc_poweroff_notify(host->card, notify_type);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722211417.3702=
709-1-kamal.dasu@broadcom.com?part=3D2
