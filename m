Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3853DDDAF
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449117; cv=none; b=VuSdzJ9A4mixGT3asxYcXr8LNCzBxFIkVbMJL1secONFVbl+VAcOHHMVwPmdkEnnJZhF1ZNlKKI+45Qp6szaYrgl4h7gfApMC3GgHAx6GmP9LVV4N0UahDkOpL5d2gte7DEDPx2nhI13CRIbvUNihIq3G14ccZV6LlCkLw6GUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449117; c=relaxed/simple;
	bh=90mzF/quDtVOPoEqavlRf0YWJ/5lFJjjgdySQcY7PHo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n4mqs7kUYhPu7001JnFubQV8vnP3pONplv63Len8jn6Zmb+6zOFa9H92mwiV4JDdeKzXG492msNBkTCPRwCkNEPLuNrC0GnqbZM/k641X4CBcDRnvgAioAcOXs+Z3yRY+ADP+skQOw0vFo/P/AE98Ib3/9zLTZ72HlE7YMBDVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGxYQemE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGxYQemE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3110E1F000FF;
	Thu,  8 Oct 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449105;
	bh=Qm+vKeMwzoSceH2KFHzCSPeDcJtZre4uEnbZDmZFfhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aGxYQemEPl1gzkbrm+kLt7nNijIch5nKVdoO/zaAPJQ0Q6E5PT8J58hTp5yhMuq+b
	 smW/zH3tq96D+h9WTOTiHEW1/KpGHv801SU8/u9S72NsRWazvX/IXjG8VW8RZI8w1O
	 ZGfuE69WSyzjctV3GkxiwBu0PAor2cf1vcbwD2dfN1uDN6uh5DeU/4vBjete9fKMrz
	 hx6NLWRFXKNG9E6BtIG81SNey6xASolykFlFVkK1Gzm6BNrsj7qNcHA3ewv9NOetML
	 wg3+K2vYeQ62Lgw1ITBPgTodfnE5QKCpd1KrIDAc7zCM5VBAhj5QTF8k/0HP2bQOSV
	 9AfiLsPTAtddA==
Message-ID: <sashiko-outbox-163850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] iio: imu: adis: Add optional self_test callback
 and fix custom reset dispatch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-adis16607-v2-1-7c94df80878a@analog.com>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-1-7c94df80878a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:45:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: imu: adis: adis_reset() API bypasses custom reset operations
--

commit 94d1ab88cd933c9c52f4aca4a47015c8c3d32cd3
Author: Radu Sabau <radu.sabau@analog.com>

    iio: imu: adis: Add optional self_test callback and fix custom reset di=
spatch
   =20
    Add an optional self_test callback to struct adis_data, for devices
    whose self-test doesn't fit the generic mask-write/sleep/check-status
    sequence. Purely additive: defaults to NULL, no change for existing
    drivers.
   =20
    Also fix __adis_initial_startup()'s no-reset-gpio path: it called
    __adis_reset() directly instead of adis->ops->reset(), silently
    ignoring any driver's custom reset implementation. Invisible until now
    since adis_default_ops.reset is __adis_reset() itself. Dispatch
    through adis->ops->reset() instead, adding the settle-time sleep at
    the call site for custom ops (documented not to sleep internally)
    while skipping it for the default op (which already sleeps
    internally).

> diff --git a/drivers/iio/imu/adis.c b/drivers/iio/imu/adis.c
> index a2bc1d14ed91d..306777526a118 100644
> --- a/drivers/iio/imu/adis.c
> +++ b/drivers/iio/imu/adis.c

[ ... ]

> @@ -413,7 +422,20 @@ int __adis_initial_startup(struct adis *adis)
>  		gpiod_set_value_cansleep(gpio, 0);
>  		msleep(timeouts->reset_ms);
>  	} else {
> -		ret =3D __adis_reset(adis);
> +		ret =3D adis->ops->reset(adis);

[Severity: Low]
While this correctly fixes the dispatch here, does the public adis_reset()
API function in include/linux/iio/imu/adis.h also need to be updated?

It currently still bypasses the custom operations by hardcoding a direct ca=
ll
to __adis_reset(adis):

include/linux/iio/imu/adis.h:adis_reset() {
	guard(mutex)(&adis->state_lock);
	return __adis_reset(adis);
}

If a driver utilizing a custom reset callback attempts to use adis_reset()
(e.g., during error recovery), it would still bypass the custom logic and
write directly to the default global command register.

For a device with a custom reset, like adis16550, this issues an 8-bit SPI
write (ADIS_GLOB_CMD_SW_RESET) which would fail because its custom SPI
transfer handler expects 16-bit or 32-bit transfers.

While it appears no in-tree drivers with custom operations currently invoke
this wrapper, it seems leaving it this way breaks the API contract establis=
hed
by this patch.

> +		if (ret)
> +			return ret;
> +		/*
> +		 * The default reset op (__adis_reset()) already sleeps the
> +		 * settle time internally. Custom reset ops are documented
> +		 * (struct adis_ops::reset) not to, so sleep here for them.
> +		 */
> +		if (adis->ops !=3D &adis_default_ops)
> +			msleep(timeouts->sw_reset_ms);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-adis16607-=
v2-0-7c94df80878a@analog.com?part=3D1
