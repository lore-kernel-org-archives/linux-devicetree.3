Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3C41DE18
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175778; cv=none; b=BXSw0BMfq0Vjr+Xt6al9QYf2L38f4XGCxlX1S8aUxx5V1GzovjsLhWbYhMh8olno4LrsH2gFvO/y4VN0MqT8J351hAMNejfGZbdAD8vhdswgIbQA6fJkpFf3Kz+Zul4/vGSEbljMG00j/b/vfcxVZWiPT3X5WfngDefct/NZnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175778; c=relaxed/simple;
	bh=bkIcs0i+QORQgtDywO+X8RFcbLaeWyjEND953STREf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bJ9gZVW26rro9Xv/VTAb+jtSTY5VyXjKsTxvrZB4x4+a0M46HPtvHMYdVSQXLR8F36f/3NrkUiFq/piHsV62wF9RKWqM54mVw+xJ0YcxNRhIKTMKFZZy7zK2Y62IWhhtd+qNzjhh8n5wcJ7Sw5vOvuJRXg3faJm65VUUIhf5Qx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHaSjkGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHaSjkGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212DB1F000E9;
	Mon, 27 Jul 2026 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175777;
	bh=hlhEa6/8Rh5A8cqGZKS5mpe5bTtIuV/5gRHYMXU9lMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHaSjkGQbxn2KpT/X7Zh41vJD3GHMZkCcreXwIG5PNht5+AMyCmSVVKEqoUynSxel
	 bKeXEhkLHYV9EsXtlTGHmG4s4UrhE8upbH0xVM6ngpMgBNrzROAbdD9d0Vmgh8a1WR
	 xXfiholLXI/N3AQs5paN24MsLvB/Gdb3RI/q80/5/NXV1P45VrRHFEVhzBU1GuWt0A
	 T2lbEl96scUDbQKhAskyEFYIPB4xuZOsVMRC2X34OzSTykB4pWy19oYigOYDWnXew2
	 A3UEt8yUdJdZrnvVBKsJJkYMHZPsi8He5ClMIIsAD3nG1msDXhQXqy+W+PwxfOcCxU
	 bBY8HJhSX7Hgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/35] pinctrl: airoha: add set_direction() helper
 for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727174141.664933-15-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-15-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:09:36 +0000
Message-Id: <20260727180937.212DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling `gpiochip_get_data(chip)` in `airoha_gpio_set_direction()`=
 before the gpiochip is registered will cause a NULL pointer dereference.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is a race =
condition in `airoha_irq_handler()` causing dropped edge interrupts.
--

--- Patch [14]: [PATCH v8 14/35] pinctrl: airoha: add set_direction() helpe=
r for gpio_chip ---
commit eb63a4efb412071440e4fba2d54338fd8926dfaa
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add set_direction() helper for gpio_chip

The patch creates a set_direction() helper for the gpio_chip abstraction.
It implements and reimplements some functions using the newly defined helper
to group gpio_chip specific code together.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 40b1e4b110c2e..67ee205e2b5b4 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2519,12 +2519,42 @@ static int airoha_gpio_get_direction(struct gpio_=
chip *chip, unsigned int gpio)
>  	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
> =20
> +static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned in=
t gpio,
> +				     bool input)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);

[Severity: High]
Can this cause a NULL pointer dereference during device probe?

If a pinctrl hog sets an input or output direction, airoha_pinctrl_probe()
calls pinctrl_enable() to apply it. This invokes airoha_pinmux_set_directio=
n()
which now delegates to this airoha_gpio_set_direction() helper.

However, pinctrl_enable() executes before airoha_pinctrl_add_gpiochip() adds
the gpio_chip via devm_gpiochip_add_data(). As a result, gpiochip_get_data()
will attempt to dereference chip->gpiodev which is still NULL.

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a race condition in
airoha_irq_handler() that can cause dropped edge interrupts?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
...
			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));
...
}

The status clearing write (W1C) occurs after handling the interrupt. For
edge-triggered interrupts, if a new edge event arrives on the same pin while
generic_handle_irq() is executing, the status register will latch the new
event. The subsequent W1C operation clears the newly latched interrupt along
with the old one, causing the new edge event to be permanently lost.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D14
