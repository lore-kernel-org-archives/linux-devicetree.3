Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762836;
	b=t/huw7+Wisb3fmmh26slv0U7hOIdzeKmhwUes6ksbppECJOyjSgGD6eSMceNVLF2vOm6
	 2XHji+pZCCJ29UhU0zyGOzrLRJAPskCz1ZKYfJjUFjrL8Qeh8aD+xUVOKktPVZiJvvOPH
	 A3pSxL/efYmbET+JrwVhaZSydtKthrUIaeVtP/gOKoaZC+Hgrt4o5N+UyWOIjSlHuN7ht
	 V1i5dLm2n0LKRCtEp/Ij/xbEQbktE2ieQ1TuQ7Cb5QFT06h7WlaEgl4iWGtXGjLoaOkkL
	 CK751JzefMtWY5o4+/ZeRn2flPCMd/oKU3SwwWBAkQb1yYcELeAygPOq5CmSYPPyGdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0nmQ5nX3EeU85O4H2Uq70Gd7ugH6G+ajWYuH087GNPM=;
	b=gbA982ShFnSispfypAMzJ6vESS5bnCbgvzraG5CLuS/1irF/pbkGfn5fT+feXP6qvpsd
	 eRw3umuneMX3Vcvjg+R9srUPYopJg6ROl1adOQpnxn+uoCt4igW0ZfWEEnanlNfmDWvqr
	 l/XWwN3RDaoVZCIti8/kCl5eDmKD5f5qv9WCPunKtBoHuwtlH4CenwpCZk43GLPLwzdc6
	 hHHDUrjGLHkyBTSSVjL3IwwyFqdRGOhPS+Cn979t1j/KAK2vIJDWUiKE5YXMPXKsGml2w
	 cG4pGTUEfafmdTnWDpvTuHDHl84JulUfWdMFBIeBDB12OMP+LHuyPmHwU/GqFiMS0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CePAUvk1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B2606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CePAUvk1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7451F000C4;
	Sun, 15 Nov 2026 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794762836;
	bh=0nmQ5nX3EeU85O4H2Uq70Gd7ugH6G+ajWYuH087GNPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CePAUvk11r7NiQeYD8mfZWVzOihOAkR/KKvYl68lrXATntMUd1VZVCy9huvSaZclf
	 Zi7QUgZ3HfJzoUfZRlNm53IenW3LKqsNTq4cbBIWi6KWqp97lt6sRMkR5oYys77S83
	 p1olq7dA8BN/vCTr0+VgB4wBWukTnId1F/qzy8uTiGm0dwGuJWBLbyjseoLgjsxphA
	 qrbPMr3wCL+JtWl/9JqKbxJflpOqKDaNzmylkOzeIujicmB0JDmu++sHPMuGZOIJs1
	 9VP52Fg2UojTI+oLcC3otzdBT7t/VtxMwGAXcoZu0IfNYsroTFYAyONcqAyBRpfNqD
	 D6t4J+YyBJ4gw==
Message-ID: <sashiko-outbox-215670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: Add Cortina Systems CS75xx I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115-cs75xx-i2c-v4-2-4b16eea98a78@gmail.com>
References: <20261115-cs75xx-i2c-v4-0-4b16eea98a78@gmail.com>
 <20261115-cs75xx-i2c-v4-2-4b16eea98a78@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 17:13:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] i2c: cs75xx: CS75XX_I2C_ACK_AL handled before CS75XX_I2C_IDLE
  in cs75xx_i2c_process()
- [Medium] i2c: cs75xx: Kconfig depends on undefined symbol
  ARCH_CORTINA_ACCESS
- [Low] i2c: cs75xx: unused CS75XX_I2C_CTRL_DONE macro in
  cs75xx_i2c_isr()
--

commit a796a9d6a4def2db9ac47c7036d59a29ac7bf6d7
Author: Fil Dunsky <filipp.dunsky@gmail.com>

i2c: Add Cortina Systems CS75xx I2C controller driver

This commit adds an I2C controller driver for the Cortina Systems CS75xx
("Bi-Wire") controller.

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 275aaa7f35833..db1b218a66a23 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -550,6 +550,17 @@ config I2C_CPM
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-cpm.
> =20
> +config I2C_CS75XX
> +	tristate "Cortina Systems CS75xx I2C controller"
> +	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST

[Severity: Medium]
Does ARCH_CORTINA_ACCESS exist in Kconfig?  No Kconfig file in the tree
defines this symbol, so CONFIG_I2C_CS75XX cannot be enabled unless
CONFIG_COMPILE_TEST is set.

[ ... ]

> diff --git a/drivers/i2c/busses/i2c-cs75xx.c b/drivers/i2c/busses/i2c-cs7=
5xx.c
> new file mode 100644
> index 0000000000000..a7aec20ea5cf1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-cs75xx.c

[ ... ]

> +static void cs75xx_i2c_process(struct cs75xx_i2c *i2c, u32 ack)
> +{
> +	struct i2c_msg *msg =3D i2c->msg;
> +
> +	if (i2c->state =3D=3D CS75XX_I2C_STOP) {
> +		cs75xx_i2c_finish(i2c, i2c->err);
> +		return;
> +	}
> +
> +	if (ack & CS75XX_I2C_ACK_AL) {
> +		cs75xx_i2c_abort(i2c, -EAGAIN);
> +		return;
> +	}
> +
> +	switch (i2c->state) {
> +	case CS75XX_I2C_ADDR:
> +		if (ack & CS75XX_I2C_ACK_NACK) {
> +			cs75xx_i2c_abort(i2c, -ENXIO);
> +			return;
> +		}
> +		cs75xx_i2c_next_byte(i2c);
> +		break;
> +
> +	case CS75XX_I2C_WRITE:
> +		if (ack & CS75XX_I2C_ACK_NACK) {
> +			/* The last byte of the last message carried the stop */
> +			if (i2c->pos =3D=3D msg->len && i2c->last)
> +				cs75xx_i2c_finish(i2c, -EIO);
> +			else
> +				cs75xx_i2c_abort(i2c, -EIO);
> +			return;
> +		}
> +		if (i2c->pos =3D=3D msg->len) {
> +			cs75xx_i2c_finish(i2c, 0);
> +			return;
> +		}
> +		cs75xx_i2c_next_byte(i2c);
> +		break;
> +
> +	case CS75XX_I2C_READ:
> +		msg->buf[i2c->pos++] =3D readl(i2c->base + CS75XX_I2C_RXR);
> +		if (i2c->pos =3D=3D msg->len) {
> +			cs75xx_i2c_finish(i2c, 0);
> +			return;
> +		}
> +		cs75xx_i2c_next_byte(i2c);
> +		break;
> +
> +	case CS75XX_I2C_IDLE:
> +	case CS75XX_I2C_STOP:
> +		/* Late interrupt of a transfer that timed out */
> +		break;
> +	}
> +}

[Severity: Medium]
Can a late interrupt with CS75XX_I2C_ACK_AL set trigger cs75xx_i2c_abort()
while i2c->state is CS75XX_I2C_IDLE?

When cs75xx_i2c_xfer_msg() times out, it sets i2c->state to CS75XX_I2C_IDLE
and drops i2c->lock before cs75xx_i2c_reset() calls disable_irq().  If a
late interrupt arrives in that window with CS75XX_I2C_ACK_AL set,
cs75xx_i2c_process() checks CS75XX_I2C_ACK_AL before checking for
CS75XX_I2C_IDLE, writes CS75XX_I2C_CTRL_STOP to the hardware and leaves
i2c->state in CS75XX_I2C_STOP across cs75xx_i2c_reset().  In addition, case
CS75XX_I2C_STOP in the switch statement is unreachable because
cs75xx_i2c_process() already returns early for CS75XX_I2C_STOP.

> +
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
Should cs75xx_i2c_isr() write CS75XX_I2C_CTRL_DONE instead of writing back
the entire CS75XX_I2C_CTRL register?  CS75XX_I2C_CTRL_DONE is defined at the
top of the file but never used, and writing back all of ctrl risks
re-asserting any non-self-clearing control bits in CS75XX_I2C_CTRL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-cs75xx-i2c=
-v4-0-4b16eea98a78@gmail.com?part=3D2
