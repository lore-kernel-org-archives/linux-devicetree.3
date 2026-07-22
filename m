Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417283D954E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754407; cv=none; b=fDJ2HvcUjar+yrRihDw2qEq4n9jy7LoRpsc2QGQAZfQhit5ClHT+YmzimeFBLjxiwK4etq4dyI7K9v1E6+E3oja+F489/0Bd49/H0XxUpxLRMoWhyS/2kAmPUz7IaP8jNv+EFThEBb4Hn/BniSA7OSU1M2pbIPyOTzPvuVWojqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754407; c=relaxed/simple;
	bh=FWTLLRV0HXgB6YMwVP++4BETQb2YOlGIZWDzCWzydR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bTRG+i7MZtHEM0Xz/5DEBHxxxhqKReGhg2PxR//yzzy1tSg52E1uyswinVk0yVvDGloF3sefWQ78bljL739NHjXKlTx3cuw52mPFAFgEgffmCKSmW/TT4md95Li0xxIF7fhzQtLMZVGm+ISPWR8Xng6jKaxpvP1PYsOhu3XEB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLbjVLC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLbjVLC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E561F000E9;
	Wed, 22 Jul 2026 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784754406;
	bh=33Gb11YZcYHQDTtep+2By56J/9WAwmZXj5O0bx/89jY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLbjVLC43VcVF8yx5W6s+XX2QZByc7LHvTwutzvmX9D+TiJ1ZdLLEidmhtzRlTZl9
	 9QTNyCZU8lSEbtJtv3TzjMSdicvi0Wmaj6TB3IBNM5ly7GbxwDwKYiVJnuT30xB5/n
	 OS/2lao0gL4WnV4dEK4nd/i2bCTkqLq1qyQYvrHeijKfPc6VFnliLObAhcXMLj2e5G
	 AGqiZe3G10JSdBO/nE6MV503fa1nDMEveNhCKUdWABPhvS8kdJ4xuH2UuG/WI4Rzh2
	 SjYljrwLRvVnHGb3oMAsu6KREivvN+4WNnqVln5jSMxU97skiqgBhWT3rQnaeZ9oEN
	 k1I9mLF9on0JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mmc: core: Add power-off-delay-us support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722205701.372789-4-jm@ti.com>
References: <20260722205701.372789-1-jm@ti.com>
 <20260722205701.372789-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:06:45 +0000
Message-Id: <20260722210645.D9E561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Replacing `mmc_delay(1)` with `mmc_delay_us(host->ios.power_off_=
delay_us)` (which defaults to 1000) inadvertently changes the underlying ti=
mer mechanism from `usleep_range` to `msleep(1)`, introducing a latency reg=
ression of up to ~20ms per power-off cycle.
--

--- Patch [3]: [PATCH v2 3/3] mmc: core: Add power-off-delay-us support ---
commit 028a9284e6d11b892584840a7f05aeed49d66b60
Author: Judith Mendez <jm@ti.com>

mmc: core: Add power-off-delay-us support

This commit adds support for power-off-delay-us to specify a custom delay
after deasserting power during MMC power cycles. The default delay is set
to 1000us, but can be overridden to work around hardware issues.

> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1388,7 +1388,7 @@ void mmc_power_off(struct mmc_host *host)
>  	 * XO-1.5, require a short delay after poweroff before the card
>  	 * can be successfully turned on again.
>  	 */
> -	mmc_delay(1);
> +	mmc_delay_us(host->ios.power_off_delay_us);

[Severity: Medium]
Does this change introduce a latency regression during power management
operations?

The default value for power_off_delay_us is 1000. When mmc_delay_us() is
called with 1000 or greater, it falls into the msleep() path:

drivers/mmc/core/core.h:mmc_delay_us() {
	if (us < 1000) {
		usleep_range(us, us + (us >> 2));
	} else {
		unsigned int rem_us =3D us % 1000;

		msleep(us / 1000);
		if (rem_us)
			usleep_range(rem_us, rem_us + (rem_us >> 2));
	}
}

This effectively calls msleep(1), which uses jiffy-based timeouts. On
systems where HZ=3D100, this can delay execution by up to 20ms per power-off
cycle. The original mmc_delay(1) call correctly used the high-resolution
usleep_range(1000, 1250) timer mechanism.

Could the threshold for mmc_delay_us() be adjusted, or could usleep_range()
be used to avoid an unintended jiffy-based sleep?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722205701.3727=
89-1-jm@ti.com?part=3D3
