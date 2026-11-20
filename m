Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157912;
	b=VWUVwGLHGGAHPR930XaEiYr/unhGsOIXXerS/ujyXaZexKMk8k/AQEGYCyq0r0mECpRd
	 YBUvsnEzBhdjf0BhPCgPRBz2tb7f2F4/d+JFI+WNGchqz0mYhFQOkNhM00i6Wbwy0WJwB
	 V5tBW/EcEciD72LxvdMgiMmw+vd1/5VhH0h6gM1sQIznfNUbc8eiFQ41sIbBozKmZEvIe
	 DA4450LWjKAi4Z8DmeJ0gH7j6dMuhHZ7zMxACt9WQGz27DyNrfxakTVZPnWb3H5D5Dyah
	 S4vnJ7rt240D+IQpKN4kQfJTiZqX6+BzX6W88HVSIQdEgeRi06PGdmtLsK3is9dACaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157912;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wtJXqNs4gh+L/nfqvAr08xM5SSYXBgNDqahh3R4IJi4=;
	b=qww7OhucMv8IlLQzD5yJHXgWPl2ZZZEsOy2PcWFvMnWqqKfer8iDeKBbhI+NffA7VhdW
	 2rbcFTN6hnCRxzAWFVGYbuVEL2aPn8SulA9lsVieSR5XuIWg4UB+dxO29uXU+FN66ExOW
	 RG53BOWZQgDfecFHdziw5Stk2Rdlo/uu+7cePHtluQNwlqJyEH2MnZ5KZ158DxapFcchR
	 XyRBUizYV1ENTmuLShrBqGZ9+VuFRyuHGUsZU5ZRRMUNlxyV7RVAWazYhqHgAKonPq0ff
	 L6NXYYRioN+0S47VOXf7c9Tx8BCJTcxJ6t0V9nVpaNYfNNaV+Pr6bIO1GvyUxVhPvQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzBp9Ewf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFE606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzBp9Ewf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50C11F000C6;
	Fri, 20 Nov 2026 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795157912;
	bh=wtJXqNs4gh+L/nfqvAr08xM5SSYXBgNDqahh3R4IJi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzBp9EwfmTvSuXPY1/uOoKh6bE0dnWe9axyTB+yK77/TmUE5w7btzewenjzoyvAhU
	 UI5NdU5FP7QtYN/k36xvDk2crcorYPPttxq2SYoCZVpjC9yFOUVWFobUOMuJ9QTwxj
	 6GDSzIvBvqBP7wXmAdSFHcL1rkiPhX6SO8viO7D9GXGLCBdlVY15J/Dq6wUHbekHJN
	 7OtQkJOqXzznEAibsUAUxBJdjYN+kQUC02nQfcPYi+uMKLby7E6CQTC/Nz4x/XvTcO
	 5uBZlVHrBWEWlI/ZWFQUHDwlJiBF3BLtBfUzbLAhIKlJwifoEldkMYtpGcnoPxvXwn
	 feZJcBXLANBgQ==
Message-ID: <sashiko-outbox-224586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i2c: Add Cortina Systems CS75xx I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-cs75xx-i2c-v5-2-03bec242a549@gmail.com>
References: <20261120-cs75xx-i2c-v5-0-03bec242a549@gmail.com>
 <20261120-cs75xx-i2c-v5-2-03bec242a549@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:58:31 +0000
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
- [Low] i2c: cs75xx: unused CS75XX_I2C_CTRL_DONE macro in
  cs75xx_i2c_isr()
--

commit 3aed5f86a535b38a31abe106e39e42d273af7fd9
Author: Fil Dunsky <filipp.dunsky@gmail.com>

i2c: Add Cortina Systems CS75xx I2C controller driver

This commit adds an I2C bus driver for the byte-oriented Bi-Wire controller=
 on
Cortina Systems CS75xx SoCs.

> diff --git a/drivers/i2c/busses/i2c-cs75xx.c b/drivers/i2c/busses/i2c-cs7=
5xx.c
> new file mode 100644
> index 0000000000000..69e4c9b01d15f
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-cs75xx.c
> @@ -0,0 +1,394 @@

[ ... ]

> +#define CS75XX_I2C_CTRL_DONE	BIT(0)
> +#define CS75XX_I2C_CTRL_NACK	BIT(3)
> +#define CS75XX_I2C_CTRL_WRITE	BIT(4)
> +#define CS75XX_I2C_CTRL_READ	BIT(5)
> +#define CS75XX_I2C_CTRL_STOP	BIT(6)
> +#define CS75XX_I2C_CTRL_START	BIT(7)

[ ... ]

> +static irqreturn_t cs75xx_i2c_isr(int irq, void *dev_id)
> +{
> +	struct cs75xx_i2c *i2c =3D dev_id;
> +	u32 ctrl, ack;
> +
> +	guard(spinlock)(&i2c->lock);
> +
> +	if (!(readl(i2c->base + CS75XX_I2C_INT) & CS75XX_I2C_INT_DONE))
> +		return IRQ_NONE;
> +
> +	writel(CS75XX_I2C_INT_DONE, i2c->base + CS75XX_I2C_INT);
> +
> +	/* The done flag is cleared by writing it back */
> +	ctrl =3D readl(i2c->base + CS75XX_I2C_CTRL);
> +	writel(ctrl, i2c->base + CS75XX_I2C_CTRL);

[Severity: Low]
Should this write CS75XX_I2C_CTRL_DONE to CS75XX_I2C_CTRL instead of writing
back the full ctrl value?  CS75XX_I2C_CTRL_DONE is defined above but never
used, and writing the whole register back could re-assert any control bits =
in
CS75XX_I2C_CTRL that do not self-clear.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-cs75xx-i2c=
-v5-0-03bec242a549@gmail.com?part=3D2
