Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72946DFF4
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934765; cv=none; b=sbJyxL3Lz5BZQBUvOEnekXKTFYYDyrI4g1LCAdgDN4aoBTwMT2e1AWvpF49Z82z7F9HKQDza1vc+JCleN86ZScHA5ud1sJffzYmmzqfsCs9O0G5bOYKc7gd52OHv1q4TYTYeJwQC7mOzCLpwM1J+0UDUkpDJPmrO9lvyMI4Bc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934765; c=relaxed/simple;
	bh=MlPYHZAzGvOGzbQ5yGv0D0s5fS7aSZFRiS9LyZL1ri4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cf0qZsXVXgX5ODhV9YmuZMQjwOE/vEzWU0uhsW88rKDx/oVTy3XW0aEF/j31p0WJTYm2n6+wDnmKUnoseIBD0TpF2MGQdRsBBDNzDp9CWfyLaU6gdG6fzeiva5musQEZOqpClNGJefkFadkLAxC53Pz6brsINVnKa4w09L5enUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnUd96Dv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnUd96Dv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10A41F000E9;
	Wed,  5 Aug 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934764;
	bh=n+Ot68UtktGU8tLyKtSRnGHB9wWeEI+k9bjOjjU4rE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnUd96Dv58XxrKkVDII6vQ/2wFWEz8gctgfFEex61dTHkyz0vqpqgquNaoavwkou4
	 vCTw7yFj1r1TRPyvtfH8yExE7vW5ArDFUD8u8xE1KWJVVuLBjKvap369aRQYFHdQsc
	 5NQ+TFIkW8vq2Ql4ESoJwigq77abvxX7S7kG5WX/wqV9XxIoZEqFrSlPdREZYk63iN
	 zR/4DWkBzGTxBOQH66rV0blDW2ILx6eLZAmPHylxtueKLJDwlE5QEtzgcmyfaFzg2S
	 w5KSiHn+zv0PQv5fQ6rXPxaFy+YrTMsMzQhJaufcsqujfZlg34aUNbHAK+hbRG/MFw
	 GZrd8Jq3pTI+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 22/36] pinctrl: airoha: statically allocate gpio
 regs structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-23-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-23-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:59:23 +0000
Message-Id: <20260805125923.C10A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The statically allocated `airoha_gpiochip_regs` structure is not ma=
rked as `const`.

Pre-existing issues:
- [High] Redundant clearing of the interrupt status bit in `airoha_irq_hand=
ler` creates a race condition for edge-triggered interrupts, potentially ca=
using them to be lost.
- [High] Interrupt handler is requested before the gpiochip is fully initia=
lized, creating a window for a Use-After-Free of the irqdomain during devic=
e teardown.
--

--- Patch [22]: [PATCH v10 22/36] pinctrl: airoha: statically allocate gpio=
 regs structure ---
commit 9c7301e7610a12f2a7f33d437ec5e58ef02929f3
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: statically allocate gpio regs structure

This commit refactors the Airoha pinctrl driver to collect all GPIO register
arrays into a single statically allocated structure. The driver is updated
to reference this new structure via a pointer, simplifying the gpiochip set=
up.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 8e418f27fd8bc..e8d5252b17f30 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -339,6 +350,15 @@ static const u32 irq_edge_regs[] =3D {
>  	REG_GPIO_INT_EDGE3
>  };
> =20
> +static struct airoha_gpiochip_regs airoha_gpiochip_regs =3D {

[Severity: Low]
Could this structure be marked as const? It appears to only serve as a
read-only lookup table of pointer arrays, so marking it const would move
it to the read-only .rodata section.

> +	.data =3D gpio_data_regs,
> +	.dir =3D gpio_dir_regs,
> +	.out =3D gpio_out_regs,
> +	.status =3D irq_status_regs,
> +	.level =3D irq_level_regs,
> +	.edge =3D irq_edge_regs,
> +};
> +
[ ... ]
> @@ -2698,7 +2708,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
> =20
>  			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
> -				     pinctrl->gpiochip.status[i], BIT(irq));

[Severity: High]
This is a pre-existing issue, but does this regmap_write() to clear the sta=
tus
bit create a race condition for edge-triggered interrupts?

The core IRQ subsystem already clears the hardware interrupt status bit bef=
ore
invoking the flow handler via airoha_irq_ack(). If a new edge-triggered
interrupt arrives on the same pin while generic_handle_domain_irq() is
executing, the hardware will latch the new event.

Would clearing the status bit a second time here wipe out the newly latched
interrupt before it can be processed?

> +				     pinctrl->gpio_regs->status[i], BIT(irq));
>  		}
>  		handled |=3D !!status;
>  	}
> @@ -2719,8 +2729,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
>  					struct platform_device *pdev)
>  {
> -	struct airoha_pinctrl_gpiochip *chip =3D &pinctrl->gpiochip;
> -	struct gpio_chip *gc =3D &chip->chip;
> +	struct gpio_chip *gc =3D &pinctrl->gpiochip;

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
risk during device teardown based on the initialization order in this funct=
ion?

Further down in airoha_pinctrl_add_gpiochip(), devm_request_irq() is called
before devm_gpiochip_add_data():

	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err) {
		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
		return err;
	}

	return devm_gpiochip_add_data(dev, gc, pinctrl);

Since devres cleans up in reverse order, devm_gpiochip_add_data() will be
undone first, destroying the irq domain while the shared interrupt handler
remains active. If a shared interrupt fires during this window,
airoha_irq_handler() will pass a freed girq->domain to
generic_handle_domain_irq().

Should devm_request_irq() be called after devm_gpiochip_add_data() to ensure
safe teardown?

>  	struct gpio_irq_chip *girq =3D &gc->irq;
>  	struct device *dev =3D &pdev->dev;
>  	int irq, err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D22
