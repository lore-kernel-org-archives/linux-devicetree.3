Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD5547F777
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055470; cv=none; b=FR8oEzkryNUED4vSOohPXPks5tD8rRbOtA8km9UYPsDp/vYO72XnDSsgsblIt8pII2tZktSCatdTj34YD9eo9DAgrIskED7m/BOowKTttPw9rlP+KqbA404vKUbuqWEqumUjiMi5XqQMRhSoKA7Of77r/xzi0oR93p2uPycIwQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055470; c=relaxed/simple;
	bh=lrzRLIeuJ0oyPjrnMmjdq6a9Oe9jT2AKLpIDVjDiHSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBlyRKIIj/y/f58b42WTCnCML7C6i0LVXqkBLJPFR/5fSLk+CPfrkncdDqXweqf4WDKSuMjig56vrMTipcJdPsValVyktllW2RznUX/QJhvQb0IvHljWi10013ujb4aPHWVP/eZnH+S7zUXlUZ9QJhUDzAvMC1FBzCQuBW/FT0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cvkj442f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cvkj442f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA771F000E9;
	Thu,  6 Aug 2026 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055461;
	bh=S6ajP+GCJXsfzk4YhstqplCv9ZPchNH5C29iAkbald8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cvkj442fPhCdjC8XGwT6aiGU4TNdjFEcA9tmxSbYSZSA/+hjoo3kSJOrljK5/J+/k
	 bIclWDX9on+JCikBS+HoBAdalGOIvXjtt9eiA3OqcMwyK2HofqPqWHN650dhicCMbI
	 jyXVBoBIcAxlRhUl5Gl70Ft3cIHaIkEnhEo9LlKDhlg1KjZMzQQCJHk7IrMK50pKGc
	 YhlFz6JwQPX26RuYyEFtiMYOXuIYCjD1jDEH1pys0lNjLwHIx7WyWOabqh7LgbfLFI
	 oGiqMCxc4iXrk7n7zwcXtN3I6r47wNqfUqwsLVWcC7fo5esb1i6rQagwW1s66RLke6
	 n2sZLFlosvn8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 23/37] pinctrl: airoha: statically allocate gpio
 regs structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-24-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-24-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:31:00 +0000
Message-Id: <20260806223101.5EA771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Refactoring pinctrl callbacks to use gpio_chip callbacks intro=
duces a NULL pointer dereference during probe if device tree hogs are prese=
nt.
- [Medium] Removing calls to `pinctrl_gpio_direction_input` and `pinctrl_gp=
io_direction_output` breaks pinctrl core synchronization.

Pre-existing issues:
- [High] The IRQ handler performs an unconditional W1C (write-1-to-clear) o=
n the status register after calling `generic_handle_domain_irq()`, which ca=
uses lost edge interrupts.
--

--- Patch [23]: [PATCH v11 23/37] pinctrl: airoha: statically allocate gpio=
 regs structure ---
commit c84002cfd05f8b4af2f361901c228a9a5666724b
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: statically allocate gpio regs structure

This commit refactors the airoha pinctrl driver to collect all GPIO register
information into a single statically allocated structure.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 8e418f27fd8bc..e8d5252b17f30 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2547,7 +2556,8 @@ static int airoha_gpio_set_direction(struct gpio_ch=
ip *chip, unsigned int gpio,
>  	/* set output enable */
>  	mask =3D BIT(gpio % AIROHA_PIN_BANK_SIZE);
>  	index =3D gpio / AIROHA_PIN_BANK_SIZE;

[Severity: Critical]
Does this code introduce a NULL pointer dereference during probe if device
tree hogs are present?

If pinctrl_enable() is called in airoha_pinctrl_probe() before
airoha_pinctrl_add_gpiochip() initializes the gpio_chip, applying DT hogs
will trigger pinctrl callbacks like airoha_pinmux_set_direction().

These callbacks delegate to airoha_gpio_set_direction(), which retrieves
the pinctrl context using gpiochip_get_data(chip):

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_gpio_set_direction() {
	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
	...
}

Since chip->gpiodev is not allocated until gpiochip_add_data() is called,
dereferencing chip->gpiodev->data during gpiochip_get_data() results in a
kernel panic.

> -	err =3D regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index=
],
> +	err =3D regmap_update_bits(pinctrl->regmap,
> +				 pinctrl->gpio_regs->out[index],
>  				 mask, !input ? mask : 0);
>  	if (err)
>  		return err;
> @@ -2557,7 +2567,7 @@ static int airoha_gpio_set_direction(struct gpio_ch=
ip *chip, unsigned int gpio,
>  	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> =20
>  	return regmap_update_bits(pinctrl->regmap,
> -				  pinctrl->gpiochip.dir[index], mask,
> +				  pinctrl->gpio_regs->dir[index], mask,
>  				  !input ? mask : 0);
>  }

[Severity: Medium]
Does the omission of pinctrl_gpio_direction_input() and
pinctrl_gpio_direction_output() break pinctrl core synchronization?

When a consumer driver requests a pin direction change via gpiolib (e.g.,
gpiod_direction_input()), the driver's airoha_gpio_direction_input() callba=
ck
bypasses pinctrl_gpio_direction_input() and directly configures the hardware
register:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_gpio_direction_input() {
	return airoha_gpio_set_direction(chip, gpio, true);
}

This leaves the pinctrl core unaware of the change, leading to stale states
in debugfs and bypassed pinctrl locking and semantics.

[ ... ]

> @@ -2698,7 +2708,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
> =20
>  			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
> -				     pinctrl->gpiochip.status[i], BIT(irq));
> +				     pinctrl->gpio_regs->status[i], BIT(irq));

[Severity: High]
This is a pre-existing issue, but does this unconditional clear operation
cause lost edge-triggered interrupts?

When an edge interrupt triggers, handle_edge_irq() handles it by first
calling irq_ack() (implemented via airoha_irq_ack()) to clear the status
bit. It then runs the child ISR.

If a new edge occurs during the child ISR execution, the hardware correctly
latches the new interrupt in the status register. However, when control
returns to airoha_irq_handler(), it executes this redundant regmap_write()
to clear the status bit again, which destroys the newly latched interrupt
before it can be handled.

>  		}
>  		handled |=3D !!status;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D23
