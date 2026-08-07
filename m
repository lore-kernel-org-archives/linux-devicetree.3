Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814A39BFED
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133588; cv=none; b=ESBhc9p5QdSG8jbnM7Rrn4dE8c/X4XIuIsVJryO/Q3HzFleoRxAhP4XX59ONau5MW2/obbgbfJuWoFxdzQOiFnzWW4Eb8p+LyPCZNPS/zOYCcSa4dKIKLbRnVRsyJoEbzYaOk3HQxKxVAlI1XjoY+/4x4+bnI45Miyb/95s6mWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133588; c=relaxed/simple;
	bh=g28zuEAj8HMzxNeTufbG9BGFaqf826esY8ybIyePxDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tsgy+fspJeOH/kGvQGUM3NEaxID0ws7QkSIL/ItFswIoNPJPM1FQ1aOq3ad01pVmRuUag60o6K6mBWXCEPNBl2gwJ1b/w9iRuHm/bbXcFQUl8gFuUDrS8Eg2RRKVuGJngjXY0Jh8HisCWqqooEG81Ncy+SZrOzlbKdvSVMZq/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWsBVjQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWsBVjQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584FA1F000E9;
	Fri,  7 Aug 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786133586;
	bh=2GHSzTqMi6iUKqwlzQOMSK32YoveGEr45PaTiD3Zl1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BWsBVjQOQINr2TcHfyigfsbsU8skJ0BCBBfcJD2ixNldaUg+kp7D1kRZZa4XdL2S+
	 Wi0lkHRkpGlcO/Zls7OdenMPMyobaYYwBMtIy/8LFGI3e0UwShIm4VS7uxuTZKWyzK
	 6qOnLG5+C2e5uW45PYry/l7yh5D4dfAUHJM1kU67XuyQXpD/cGrBXRiM3tGuM4onNM
	 iWH6YO65N0c55MTv/6hrnGg726yr/ELRm2HW6iop4B8BvGhCv5lG/ivLS5OqMWxN3a
	 fDSXAsRknMuF8ywFyys7bDW57m0qPVbqL46cmgMjG979fdAhD/J76qbFuZqvfKisDR
	 QhLHyqqr+l4xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] mmc: core: Honor keep-power-in-suspend and
 reset-card-at-resume for (e)MMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260807200121.2590202-4-kamal.dasu@broadcom.com>
References: <20260807200121.2590202-1-kamal.dasu@broadcom.com>
 <20260807200121.2590202-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 20:13:05 +0000
Message-Id: <20260807201306.584FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The shutdown/undervoltage fallback path in _mmc_suspend attempts t=
o reselect a firmware-clobbered card without resetting the host controller,=
 guaranteeing a selection failure that silently skips the required power-of=
f.
--

--- Patch [3]: [PATCH v8 3/3] mmc: core: Honor keep-power-in-suspend and re=
set-card-at-resume for (e)MMC ---
commit 035aca0a123c885d88b4aa6c2a934f57e12bf03c
Author: Kamal Dasu <kamal.dasu@broadcom.com>

mmc: core: Honor keep-power-in-suspend and reset-card-at-resume for (e)MMC

This commit adds support for keep-power-in-suspend and reset-card-at-resume
for (e)MMC devices. It keeps the card powered during suspend so firmware can
access it, and resets the card when the kernel resumes. It also adjusts
_mmc_suspend() to handle shutdown and undervoltage cases when the card is
already in the keep-power suspended state.

Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@b=
roadcom.com/

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909f..a081907bbcf53 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c

[ ... ]

> @@ -2144,8 +2144,28 @@ static int _mmc_suspend(struct mmc_host *host, enu=
m mmc_poweroff_type pm_type)
> =20
>  	mmc_claim_host(host);
> =20
> -	if (mmc_card_suspended(host->card))
> -		goto out;
> +	if (mmc_card_suspended(host->card)) {
> +		/*
> +		 * Nothing to do for a redundant suspend call. Otherwise, the
> +		 * card can only still be marked suspended here because the
> +		 * keep-power fast path below left it powered and merely
> +		 * deselected -- reselect it and continue into the normal
> +		 * power-off sequence below, since shutdown, unbind and
> +		 * undervoltage need mmc_power_off() regardless of how the
> +		 * card got here.
> +		 */
> +		if (pm_type =3D=3D MMC_POWEROFF_SUSPEND ||
> +		    !(host->pm_flags & MMC_PM_KEEP_POWER))
> +			goto out;
> +
> +		if (!mmc_host_is_spi(host)) {
> +			err =3D mmc_select_card(host->card);
> +			if (err)
> +				goto out;

[Severity: High]
Since the firmware might have modified the card state during suspend
(which is why reset-card-at-resume is used), will mmc_select_card() fail
here if we haven't reset the host and re-initialized the card first?

If mmc_select_card() fails (e.g. CMD7 timeout), taking the goto out
path will completely skip the mmc_power_off() sequence. Does this leave
the card powered on during shutdown or undervoltage, defeating the
purpose of this fallback path?

> +		}
> +		mmc_card_clr_suspended(host->card);
> +		host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> +	}
> =20
>  	/*
>  	 * For the undervoltage case, we care more about device integrity.
> @@ -2157,6 +2177,33 @@ static int _mmc_suspend(struct mmc_host *host, enu=
m mmc_poweroff_type pm_type)
>  			goto out;

[Severity: High]
Just below this hunk in _mmc_suspend(), the cache is flushed:

	if (pm_type !=3D MMC_POWEROFF_UNDERVOLTAGE) {
		err =3D _mmc_flush_cache(host);
		if (err)
			goto out;
	}

Even if mmc_select_card() were to succeed or its error were ignored,
would _mmc_flush_cache() also fail due to the clobbered card state and
abort the power-off sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807200121.2590=
202-1-kamal.dasu@broadcom.com?part=3D3
