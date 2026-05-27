Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7340F8DA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889139; cv=none; b=VyQbODhxlow6tatvGIMyC+G8zzpoKp4CYMYeiP3pmdHLH7lqireO5YcHbDf7u9ZyKe16lHARoX6kxLU+dRcQoS1Kn3IbUVeOar43FcYS9YvQBYFANq8VaOUUJQuULYMenJYlwu5dRmKRF1Co3WtzldfVCwZJZtelUVH4OHnKzuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889139; c=relaxed/simple;
	bh=cCQTpQ4V9iF2hZnK7U8grd1nkoa9AA1qYWqA/7+ThL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUZ2z0B/NWGmSxMUX/SUku9wREZ5uvXcZaQLcKcfLvbFClW9iCBrE8Aau07UoWS4LkGC0Aze3VQ352Kw0nTejfdOiv0RuRlnYcBpmhoyDgVoHAPAPiVgzI8KzZ/GjcwbtWgB/zCtIi3abMI3QLiwZIve2yTtfgSZ6if+GxV0Jxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4eJyQo+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4eJyQo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A031F000E9;
	Wed, 27 May 2026 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779889135;
	bh=+JadgpGdQHus+W9nuQHoGupRihc55wmjeGTt8KnpKe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i4eJyQo+bkkUTUEWK/1xHQfKP2PIRfaGCTtTSZvrFrSf6QWgUBqBGQdmdOTbHKkr8
	 BHAHXjw2kxmz0e8bErMtC/w/uxyPczLCunkuziRdiTsm3gy90qpQvCZeDYcpekRljJ
	 ah/B/2WUpI7vszPwlCp+xZwlv9GvrFjXDmK4HH0aV+XL2ONsqB/RpeZ9VTqK5QZEqK
	 GnJys1agWzGD9YINnR0xJBNlqafMBkg+JmSIZ8FmiDmiZ5jhsD5lFbMaqlx2GF9gjw
	 +3L2fvGI2GOx6ZuSR5Kqf8V9P/BAJDwl/Tj96yYlbBny0lqkCGdzEbEuICs92soPHK
	 2jYandUOxlJGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
References: <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 13:38:55 +0000
Message-Id: <20260527133855.94A031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Migration from legacy gpio to gpiod incorrectly replaces physical =
line reads with logical value reads, breaking IRQ polling logic for active-=
low GPIOs.

Pre-existing issues:
- [High] Negative error codes from GPIO reads are implicitly treated as boo=
lean true, causing an infinite loop in the IRQ thread on read failure.
--

commit 2b527ef2c7b9b60397ceb6125cd15341ac4e28ff
Author: Linus Walleij <linusw@kernel.org>

mfd: arizona: Convert GPIO IRQ handling to descriptors

This commit converts the arizona polling GPIO handling to use a GPIO descri=
ptor
instead of passing a global GPIO number as platform data.

> diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
> index 544016d420fe2..cf8e42662585a 100644
> --- a/drivers/mfd/arizona-irq.c
> +++ b/drivers/mfd/arizona-irq.c
> @@ -136,21 +136,19 @@ static irqreturn_t arizona_irq_thread(int irq, void=
 *data)
[ ... ]
>  		if (!arizona->irq_gpiod) {
>  			break;
>  		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_RISING &&
> -			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> +			   gpiod_get_value_cansleep(arizona->irq_gpiod)) {

[Severity: High]
Does this incorrectly check the logical value of the GPIO instead of the raw
physical state?

The legacy gpio_get_value_cansleep() returned the raw physical state of the
pin. The new gpiod_get_value_cansleep() returns the logical state, which
incorporates the ACTIVE_LOW flag from the devicetree or software node.

Because the IRQ trigger flags describe physical voltage transitions, compar=
ing
these physical flags against a logical value might be incorrect. For exampl=
e,
if a user defines irq-gpios with GPIO_ACTIVE_LOW for a falling edge interru=
pt,
a physically low line becomes logically 1, causing the polling condition
!gpiod_get_value_cansleep() to evaluate to 0, which fails to poll when the
interrupt is active.

Conversely, when the line is idle, it evaluates to 1, causing the IRQ handl=
er
to poll infinitely.

Should this use gpiod_get_raw_value_cansleep() to preserve the original
physical semantics?

[Severity: High]
This is a pre-existing issue, but can this loop forever if the GPIO read
returns a negative error code?

gpiod_get_value_cansleep() (and its legacy predecessor) can return a negati=
ve
error code (e.g., -EIO) if reading the GPIO state fails over the bus. Since
negative values are non-zero, this evaluates to true for IRQF_TRIGGER_RISIN=
G,
setting poll =3D true and causing an infinite loop in the IRQ handler threa=
d if
the read continues to fail.

Conversely, for IRQF_TRIGGER_FALLING, !(-EIO) evaluates to false, which
immediately aborts the poll.

Could the return value be stored in an integer and explicitly checked for
negative errors before evaluating it as a boolean?

>  			poll =3D true;
>  		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_FALLING &&
> -			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> +			   !gpiod_get_value_cansleep(arizona->irq_gpiod)) {
>  			poll =3D true;
>  		}
>  	} while (poll);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-mfd-arizon=
a-irq-v5-0-ebeda2e925da@kernel.org?part=3D2
