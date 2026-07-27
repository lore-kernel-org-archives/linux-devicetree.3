Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3B339872
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138862; cv=none; b=CZabMicPpyikDNncFV74WPJR7JapfEsg4HYdMzMpmwV3HphF6rVRhfJNRp6gV7Xye+dtAgkflCi50RF4gy/SW16IVUoRQfLvoWuUU6epMjCw5KBIPp91s/PlTRxngR7Kfh2GyVM6rWJQvZrTzKYS7lFU4fPzWkp+iZzMd1zMBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138862; c=relaxed/simple;
	bh=JDwagsaqx+9n6PmQFqF7mt5wqdmE2uTg98ih6bXLHlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VXmc9EKfPUoIqo3aHFpqrG1oZ7yUtXvD01xp0/CPi77tU47HZstQaMtoGqiSp1Y8616A27EwcVlkPpDnuFjuK+8PeAI9ybRkSXHpLkapbqyp0L03wU/E7uSNFdtGaZMJimjxz8OQQmPBcnd9X//kTLjvbiQZ8vSllTWZX+h6DHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8FkkpK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8FkkpK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133601F000E9;
	Mon, 27 Jul 2026 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138861;
	bh=BQRYHDZGM7Acn3Zfn05t2fYVYa6uNAbjbMhmKf3p9eM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K8FkkpK1xdX4ve/l0NvYwWhmOyq/r9XXBqswf5eVm4vnH+W6KzImEX7Is/YQEPUaj
	 XDqe9OQnDRoJjLEsDGVgHWEW/nQtGOpQZUP+t35lotQQXTqAPJxtVpUCLig/D9FeQg
	 iDB1RjrWnaNwtB7QDlCr3MiHOGvcFAvr+DEK//FGkevFzsVtaRXaCheEUcxjT0JmzY
	 E/Um57ubJmu4ougOraK9asek6yL0VNZu8hRkcpXuFuBXrrBd7S42IiErqTB/NWbGgS
	 jano8GA3hHOleQZ+/6jYGvxJBlh2mc96dcc7biH/iTozdnVdwbXbU8/zU/AY5I0tOQ
	 G6+QzPK8QkEWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/34] pinctrl: airoha: an7583: fix I2C0_SDA_PD
 register bit order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-6-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-6-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:54:20 +0000
Message-Id: <20260727075421.133601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver hardcodes handle_simple_irq and clears the interrupt st=
atus after handling, leading to lost edge-triggered interrupts.
- [High] The EN7581 I2C0 pins have their configuration masks swapped compar=
ed to their pin definitions.
--

--- Patch [5]: [PATCH v7 05/34] pinctrl: airoha: an7583: fix I2C0_SDA_PD re=
gister bit order ---
commit 71ba4b6ac3f1b7dcaded906468f0a3ce96cffdb2
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
   =20
I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 63c82268aa823..4076bd0261d17 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -184,8 +184,8 @@
>  #define I2C_SDA_PU_MASK				BIT(0)
> =20
>  #define REG_I2C_SDA_PD				0x0048
> -#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
> -#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
> +#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
> +#define AN7583_I2C1_SDA_PD_MASK			BIT(15)

[Severity: High]
This isn't a bug introduced by this patch, but while you are fixing
swapped pins here, I noticed that the EN7581 I2C0 pins also appear to have
their configuration masks swapped.

For example, in en7581_pinctrl_pullup_conf:

drivers/pinctrl/airoha/pinctrl-airoha.c:en7581_pinctrl_pullup_conf[]
	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),

Is it possible that pin 2 (i2c_scl) incorrectly gets the SDA pull-up mask,
and pin 3 (i2c_sda) gets the SCL pull-up mask?

This same swap appears in en7581_pinctrl_pulldown_conf,
en7581_pinctrl_drive_e2_conf, and en7581_pinctrl_drive_e4_conf. Could
applying these settings via device tree modify the wrong hardware lines and
prevent I2C communication?

[Severity: High]
This is a pre-existing issue, but I also noticed a potential problem in
how edge-triggered interrupts are handled.

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip()
	girq->default_type =3D IRQ_TYPE_NONE;
	girq->handler =3D handle_simple_irq;

By unconditionally hardcoding handle_simple_irq, doesn't this bypass the
core IRQ edge flow logic (handle_edge_irq) required for correct acknowledge
ordering?

In airoha_irq_handler():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler()
			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));

If an edge-triggered interrupt occurs while a previous interrupt for the
same pin is actively being handled by generic_handle_irq(), and then the
status bit is manually cleared by regmap_write(), does this permanently
erase the hardware record of the second edge and drop the interrupt?

>  #define SPI_MISO_PD_MASK			BIT(14)
>  #define SPI_MOSI_PD_MASK			BIT(13)
>  #define SPI_CLK_PD_MASK				BIT(12)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D5
