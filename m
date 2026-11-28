Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874343;
	b=efwqu/6o/5ggYutDRP+AFFOEVYNCWlQLTd9U5/NjLFqOJSvdHtWqjbBi6jEOY/wiS0FL
	 ZAnEcLJU54z4P+ZSirXGaRERHCuxc316gDJlUe6d3dkAI5NRpsyUHewlT44A/716yjF/4
	 o6FCaH2nPwpZ51c4d1f+h6ZatFbGPwMY8h4l2QJz0PNHlSU21ugl2LswU9UMaIykwjDRB
	 oM9ExV0JfoZ99HqczeuH4ISTTBrSQC+smeF17Elr/8LNKnCYXosSYrQnMgzCSeuNTglGQ
	 buozV/o0fILjeb2iI9d+ax1W5K4gf5Us00GT4hJqfASJhgIyQ9N3+XMIfRzsHyqh1gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WyT0rkq21zXsomGxV/+L9235HUZQEkUf5I+LcmsMRfo=;
	b=e8/Og8VrD9r6CqdpMzOpMud+j363NNTy7KiJefj6mEOSWn6CxdSkV4WXpqkttmloF4Ls
	 jlBSfiGlMK6w9jZwlP2I0IT4IK+chho5SAMOEg8gh6H31o3XH7socYjbWeWb9DzWM6DgV
	 wj8Xhgw23IbMo2jKHQSpYUXiGkpfF+Dw4vEDJSxr8HJ5KRHjorwjnI5tYPa/wHJIw8pe/
	 jpczSkreDrFh1EHKH15uyVXziuhJfBIi8ET0zx1Z+HpQgscRY5rw8o7ED4+d4yiuOEYp2
	 lfhl/VnrC+59xdEPw0dVkQlwquzoOKNRdRRkZXA1gH7UepE4sQw1oB8MOfuomi7qFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=favbsUDB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD06606A31C;
	Sat, 28 Nov 2026 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=favbsUDB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A811F00893;
	Sat, 28 Nov 2026 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795874342;
	bh=WyT0rkq21zXsomGxV/+L9235HUZQEkUf5I+LcmsMRfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=favbsUDBlB1KNzxEfGfC5p6Lfw66dXAfGxo9nYCNpl1zMLvnmbsGM8GORQZ1tONK+
	 Yy41tnevahxHKG4J5E2IClQDOowvHw4dgU3SqfzUT/cv1mG2vJnk0NSv44meYDyTj3
	 6YreSqDzLfrFD5MIASNlKBDiqEGKSJPr4imVr1FPrtvJUVGQeZNA2VHQG6LzTuhxdt
	 KuG/zdThOT0II4/d/MPJ6O3DZO0GjpOK57RY7SSG/kr+V7awm1eKJYnKTW9offQvf2
	 Lmt1p/CBuq0VoDO8Xn+Zmwa1ylQqAWomHpkOT0UqLQkCR8IP54czUftZU1gHZOHVGz
	 Uhva/IxFdeJhQ==
Message-ID: <sashiko-outbox-238735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] Input: s6sy761 - add reset GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Timmermann" <foss@timmermann.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-3-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
 <20261128-lat3st-google-raven-touch-upstream-v2-3-1be5c1029087@timmermann.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 13:59:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] Input: s6sy761 - missing regulator and reset GPIO cleanup in
  s6sy761_power_on()
--

commit 3b9942690d73b1fee8779747d7c6d782289bf2e1
Author: Lukas Timmermann <foss@timmermann.space>

Input: s6sy761 - add reset GPIO support

This commit adds optional reset GPIO support to the s6sy761 touchscreen
driver, deasserting reset after enabling regulators during power-on and
asserting it again during power-off.

> diff --git a/drivers/input/touchscreen/s6sy761_core.c b/drivers/input/tou=
chscreen/s6sy761_core.c
> index e50d9b52e2c43..754c0997a0711 100644
> --- a/drivers/input/touchscreen/s6sy761_core.c
> +++ b/drivers/input/touchscreen/s6sy761_core.c

[ ... ]

> @@ -297,6 +299,11 @@ static int s6sy761_power_on(struct s6sy761_data *sda=
ta)
>  	if (ret)
>  		return ret;
> =20
> +	if (sdata->reset_gpio !=3D NULL) {
> +		usleep_range(10000, 11000);
> +		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
> +	}
> +
>  	msleep(140);
> =20
>  	/* double check whether the touch is functional */

[Severity: Medium]
Does s6sy761_power_on() leave sdata->reset_gpio deasserted and
sdata->regulators enabled if one of the subsequent s6sy761_read(), boot
status or s6sy761_write() steps fails?  When called from s6sy761_resume(),
devres teardown does not run on failure, leaking the regulator enable
count and leaving the controller powered on and out of reset while
sdata->irq remains disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-lat3st-goo=
gle-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space?part=3D3
