Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BCF2857EE
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356712; cv=none; b=T+QoQIMAJx1IJSfozpL+0QzPRj17gfAMs1d5xUKhOAofdGwTKWWwlEvjGxsBL+FcqPQWiZsMKN1g1HDir1aZe77S/G5Rf2tVggMh6P6oKilkbrS2EOaTXh/zzR3NgjFZd+T1mbd15eMezDdyW1gxOr+b60soVFCv7BxJNRumc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356712; c=relaxed/simple;
	bh=AlIl2f/jJ/1mNO/VGYirui0grQYtG3u6WwQm+pxN8Ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RuADmLb1u513Q432eg4o9HsET93WcPrymL7A0ib+t8QKyKsEYl/1HClFlIEsdroXbJ+uU4xUGc/O9lrs+nIvex3nz5LwQnfso+n5AqXB7jN18TMmBRjePs+WiRaITOyNxfRe7ydG2CC1Q1T2Vgb2Qgy7TKB6snWnoL3iKuNpPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZv7CNtd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZv7CNtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F13C2BCC4;
	Sat,  9 May 2026 19:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778356712;
	bh=AlIl2f/jJ/1mNO/VGYirui0grQYtG3u6WwQm+pxN8Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UZv7CNtdk7S4TWl4KV3W5cy5xwfbvZygk2h51kg3AVYzd6wOvN7bwEadXWPMr+rLU
	 8sb8MCiwtvnXMI/4xL8AmYAbRu/MeysexvOSjs1Q1QvxxCJpzflqneQKd4d7Wu+7D7
	 CklOE1QODmNeOvRlUPc6tBQLVHonODry6UAUTqxTEKDjQ/arUJW+i4hyDe3+t/OtCm
	 BCC79f5v8Tfxa4+8FSPMq1dDI+X0t1tFFddacHGQZyRvJpL9y95XdLLRiL3pLx5ro5
	 k0iceP1ZSYdVlZnzwp9EaKnve6dH9qmd/cLU/dQNyqCZJXaQcF2F0nRf1MD6WseyFG
	 lkLO7U3W7d5ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 05/11] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509191907.24734-6-macroalpha82@gmail.com>
References: <20260509191907.24734-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 19:58:31 +0000
Message-Id: <20260509195831.D6F13C2BCC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced regulator disable upon driver unbind due to incorrect d=
evres ordering and PM status check.
--

commit bd7f7b2e2bfc8853252ca783dc08bb6dfb4d8df7
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607

This commit adds power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 8ff51711ab1fe..047de1b405507 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -192,8 +249,10 @@ static int inv_icm42607_enable_vddio_reg(struct inv_=
icm42607_state *st)
>  static void inv_icm42607_disable_vddio_reg(void *_data)
>  {
>  	struct inv_icm42607_state *st =3D _data;
> +	struct device *dev =3D regmap_get_device(st->map);
> =20
> -	regulator_disable(st->vddio_supply);
> +	if (!pm_runtime_suspended(dev))
> +		regulator_disable(st->vddio_supply);
>  }

Can this lead to an unbalanced regulator disable upon driver unbind?

During driver unbind, devres actions execute in reverse order. The PM runti=
me
cleanup added by devm_pm_runtime_set_active_enabled() runs first, calling
pm_runtime_disable() which increments disable_depth, and
pm_runtime_set_suspended() which overwrites runtime_status to RPM_SUSPENDED.

Next, this devm action executes and checks pm_runtime_suspended(dev). Becau=
se
pm_runtime_suspended() requires !dev->power.disable_depth, it will
unconditionally return false here, causing the action to always call
regulator_disable().

If the device was already runtime-suspended prior to unbind, its regulator
was already disabled by inv_icm42607_runtime_suspend(), resulting in an
unbalanced double-disable that can shut off power to shared devices.

Simply changing the check to pm_runtime_status_suspended() will not work
either, because pm_runtime_set_suspended() has already forced the status to
RPM_SUSPENDED, which would cause the regulator to leak if the device was
active.

Does the driver need to ensure the device is resumed before unbind, or use a
custom remove function, to correctly balance the regulator?

[ ... ]
> @@ -251,10 +310,97 @@ int inv_icm42607_core_probe(struct regmap *regmap, =
const struct inv_icm42607_hw
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D5
