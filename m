Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958131ED68
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113429; cv=none; b=Q/cQSgq6oF2sO0we795hERXmOfw+eIBPm5/LX+LDDcg2Jjm3KMWzM0Ub2FyQmn+tgo8yCjs7pJaFgkIFY3yyQvZs3NIGcgefi/KlllR9dNxOLY4JwwLXVJRH599bIuf64BIstdtwQG7gXwiW7bCVnZQJ0HR3uyq2VYuW1/JjdBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113429; c=relaxed/simple;
	bh=ZbTq2irhqSeicfiYQrdj9hGwvX1e4BlYcQMTjzHstM0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W3VUyN4Xxk+eZdn/2NnTpj7StPyj87JlLgB3CuB0WKhIZTFENEcQ7M4x5aweeVG2/tEDQacuXat0cW/5gHGuyc0tEmjNNHdc0iXDcxWknQyTwqcO0ta9Cpko+ro/JYuqenLOX9U/mVZDHotTcJrdWAsL54Fqa+VleUNU9D7aAKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8u8pCUK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8u8pCUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C32C1F000C4;
	Fri, 16 Oct 2026 01:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792113428;
	bh=nw7ZcXszwb3R1vQyqxSj57i4DckjA9PQk5BNKBe9F4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8u8pCUKR/rKkv5cBvtaiqvkptabsU/ht0pob7ibQJi9otwRv8mUFRPO4EgO54/aD
	 udwYeSwSQ6wchEFOkuN97NYp5k66m3COeF5eDf4xpm3AvVoRA4wqexJlGkqU6nsoQ6
	 IBKFlS0oEbr8+IXPLWPiJk/i35NYavE3EKYgXV37UANAZDGFKaj/DZYHnNs979U2Qh
	 O1964vG4/OFvxpAApLm5D8BG92zgLfV08FTHqscApWnWHaY3fMe9U6WR/4v4BzccmU
	 0jVCY9eVECkHaxYVeeuBDcv2Ql0kV3BrbCHStiUY3nDyAgvtEHefWFfnzlasWS4Tqt
	 Vu4FAfnh/Pc1w==
Message-ID: <sashiko-outbox-173541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016010448.324856-3-zychennvt@gmail.com>
References: <20261016010448.324856-1-zychennvt@gmail.com>
 <20261016010448.324856-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 01:17:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] i2c: ignored return value of I2C_SLAVE_WRITE_RECEIVED breaks flow =
control
- [High] i2c: zero-message transfers bypass wait logic causing OOB reads or=
 bus lockups
- [Medium] i2c: ma35d1: multi-master target arbitration broken by clearing =
AA bit
--

commit cb2d83f6d803405066915dfcc01410b98bdff1a8
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

This commit adds I2C support for the Nuvoton MA35D1 SoC, including standard,
fast, and fast-plus modes, and provides controller and target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..29bed9eb28f67
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
[ ... ]
> @@ -125,12 +125,12 @@ static inline bool ma35d1_is_controller_status(unsi=
gned int status)
>  /*
>   * ma35d1_i2c_write_ctl - Update the I2C control register
>   * @i2c: Pointer to the ma35d1 i2c instance
>   * @ctl: Control bits to set (e.g., MA35_CTL_STA, SI, AA)
>   *
>   * Read-modify-write the CTL0 register while preserving unrelated bits.
>   */
>  static void ma35d1_i2c_write_ctl(struct ma35d1_i2c *i2c, unsigned int ct=
l)
>  {
>  	unsigned int val;
> =20
>  	guard(spinlock_irqsave)(&i2c->lock);
>  	val =3D readl(i2c->regs + MA35_CTL0);
>  	val &=3D ~(MA35_CTL_SI_AA);
>  	val |=3D ctl;

[Severity: Medium]
Does this unconditionally clear the Assert Acknowledge (MA35_CTL_AA) bit
unless it is explicitly passed in the ctl argument?

If arbitration is lost during the START or address phase of a transfer, the
controller will read AA as 0 and NACK its own target address, causing the
winning master's transfer to fail.

>  	writel(val, i2c->regs + MA35_CTL0);
>  }
[ ... ]
> @@ -262,17 +262,17 @@ static irqreturn_t ma35d1_i2c_irq_target_trx(struct=
 ma35d1_i2c *i2c,
>  	case MA35_S_TRAN_DATA_NACK:
>  	case MA35_S_RECE_DATA_NACK:
>  		/*
>  		 * Data byte or last data in I2CDAT has been transmitted and NACK rece=
ived,
>  		 * or previously addressed with own SLA address and NACK returned.
>  		 */
>  		i2c->target_reject =3D false;
>  		break;
> =20
>  	case MA35_S_RECE_DATA_ACK:
>  		/*
>  		 * Previously address with own SLA address Data has been received;
>  		 * ACK has been returned
>  		 */
>  		byte =3D readb(i2c->regs + MA35_DAT);
>  		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);

[Severity: High]
Does this code ignore the return value of i2c_slave_event in
ma35d1_i2c_irq_target_trx?

If the backend cannot accept more data, for example when the backend buffer
is full, it returns a non-zero value. Because this is ignored, the driver
unconditionally writes MA35_CTL_SI_AA at the end of the ISR to ACK the
byte, which breaks flow control and allows an external I2C master to
overrun the backend buffer.

Should the return value be checked and i2c->target_reject set to true to
properly NACK the next incoming byte on error?

>  		break;
> =20
>  	case MA35_ADDR_TRAN_ARB_LOST:
[ ... ]
> @@ -333,13 +333,13 @@ static irqreturn_t ma35d1_i2c_irq_controller_trx(st=
ruct ma35d1_i2c *i2c,
>  	if (unlikely(!i2c->msg)) {
>  		dev_err(i2c->dev, "Spurious controller interrupt (status: 0x%02lx)\n",=
 i2c_status);
>  		ma35d1_i2c_restore_idle(i2c);
>  		return IRQ_HANDLED;
>  	}
> =20
>  	switch (i2c_status) {
>  	case MA35_M_START:
>  	case MA35_M_REPEAT_START:
>  		ma35d1_i2c_set_addr(i2c);
>  		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);

[Severity: Medium]
Since MA35_CTL_AA is omitted here in ma35d1_i2c_irq_controller_trx, the AA
bit is cleared during address transmission. If arbitration is lost during
SLA+R/W, will the target fallback fail to ACK its own address?

>  		break;
> =20
>  	case MA35_M_TRAN_ADDR_ACK:
[ ... ]
> @@ -438,15 +438,15 @@ static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c=
, struct i2c_msg *msgs,
>  			     int num)
>  {
>  	unsigned long timeout;
>  	unsigned int val;
>  	int ret, err;
> =20
>  	disable_irq(i2c->irq);
>  	i2c->msg =3D msgs;
>  	i2c->msg_num =3D num;
>  	i2c->msg_ptr =3D 0;
>  	i2c->msg_idx =3D 0;
>  	i2c->err =3D 0;
> =20
>  	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);

[Severity: Medium]
Will this omit the AA bit and thus clear it when initiating a master
transfer in ma35d1_i2c_doxfer?

>  	enable_irq(i2c->irq);
> =20
>  	timeout =3D wait_event_timeout(i2c->wait, i2c->msg_num =3D=3D 0, HZ * 5=
);

[Severity: High]
If a caller invokes i2c_transfer with num =3D 0 to probe the bus, does this
wait evaluate to true immediately?

When num =3D 0, i2c->msg_num is set to 0. This causes wait_event_timeout to
complete instantly while the hardware is still initiating the START. If msgs
is a zero-length array pointer or NULL, the subsequent interrupt could
either read out-of-bounds from i2c->msg or fail to assert a STOP condition,
leaving the bus permanently locked up in a START state.

>  	ret =3D i2c->msg_idx;
> =20
>  	if (timeout =3D=3D 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016010448.3248=
56-2-zychennvt@gmail.com?part=3D2
