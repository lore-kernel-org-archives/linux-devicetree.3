Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF1429CFE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176108; cv=none; b=H9VMwFo2gE4TO37rPU3McjHYVb2xHttfr2cOlC8WTNwmyqgxrQgKXOr27CK/iKP5GmjcChZvl/Gl4Hov4wBFgrCzhBNorKc+PiLKMwG17w0LotQ9a7gfYxZOoYmM768mTF+lam+aW9Rf5cyXfyv3b2a7lzvRQcwfyW3tRFFOIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176108; c=relaxed/simple;
	bh=9J6bDUkVyY0mXz1WB8/OviKp03wRiKkBteyWC5R770M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jDY9tR9NrP/SZ7BtnzOG385NaKXNEEO6U7AEo/mg4rpYjLeNu0KBZA0953yff36b35ssPuNgqNMOhYC073Fj25FBpCX59cmgIqZizOx3s4j5lqGC4k6IU9jOT4tpOkq8bXb4FPELr5ZiMa9DmWQ5aAN9TauOuXJbfw1+cgYKbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGqm+oKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGqm+oKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF62F1F000E9;
	Mon, 27 Jul 2026 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785176107;
	bh=XROorok/8+76J1G9HN4QYxrtFpQ3SX4vHvzF87Ox49s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LGqm+oKSlgqH/EwTIiS/elbHlfz7odUXLFLVAnDsZ7RcgMH6wniAVNCZFj+5H+L8y
	 c9HUJm/8lakhbO7RA0xiuVIe4TKtHMceYfiLbndFmwnlDg6+VRMLaYYMCyjW7PZ4UL
	 1l5030Ham0pGV+Wu8yqg2+u3tgy/ppHlPIEShe1FqaLmKvkB65XumubFzpD/WPhxN4
	 hFjyOh300pZbJBjxJ8Hk+9G/NmYJUb6UV1iYTFMcLZCLU/ciCF4qc13AejW8GZ1V2d
	 twLTS2xpdDZFePFWJStN8HFIp5vrtLh3VWeSNhq7PjCoSnyNJhxFKWeStDqANg0pUy
	 tljB6uWGTF9aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 31/35] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-32-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-32-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:15:06 +0000
Message-Id: <20260727181506.AF62F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing pinconf mappings for dedicated interface pins (2-9) and in=
correct register mappings for PCIe reset pins (40-41).

Pre-existing issues:
- [High] The IRQ handler remains active after the GPIO chip is removed, lea=
ding to a Use-After-Free of `gc->irq.domain`.
--

--- Patch [31]: [PATCH v8 31/35] pinctrl: airoha: add support of en7523 SoC=
 ---
commit e474b38e912b2b107b5f734fda40d3805c427084
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of en7523 SoC

This patch adds support of Airoha en7523 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
[ ... ]
> +#define REG_I2C_SDA_PU				0x0044
> +#define SPI_MISO_PU_MASK			BIT(13)
> +#define SPI_MOSI_PU_MASK			BIT(12)
> +#define SPI_CLK_PU_MASK				BIT(11)
> +#define SPI_CS0_PU_MASK				BIT(10)
> +#define PCIE1_RESET_PU_MASK			BIT(9)
> +#define PCIE0_RESET_PU_MASK			BIT(8)
> +#define UART1_RXD_PU_MASK			BIT(3)
> +#define UART1_TXD_PU_MASK			BIT(2)
> +#define I2C_SCL_PU_MASK				BIT(1)
> +#define I2C_SDA_PU_MASK				BIT(0)
[ ... ]
> +static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] =3D {
> +	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(0)),
> +	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(1)),
[ ... ]
> +	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(27)),
> +	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(28)),
> +	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(29)),
> +};

[Severity: High]
Are the pinconf mappings for pins 2 through 9 missing from this array?

The pinctrl_pullup_conf array (as well as the pulldown and drive arrays)
starts at pin 12, which seems to omit the electrical configuration for the=
=20
I2C, SPI, and UART pins defined earlier. If a device tree attempts to=20
configure pull-up/pull-down or drive strength for these buses, will it fail?

Also, are pins 40 and 41 (pcie_reset0 and pcie_reset1) mapped to the wrong=
=20
register here? They are currently mapped to REG_GPIO_L_PU bits 28 and 29,=20
but the macro definitions above show PCIE0_RESET_PU_MASK and=20
PCIE1_RESET_PU_MASK belonging to REG_I2C_SDA_PU instead. Will configuring=20
the PCIe reset pins silently corrupt the GPIO pad configuration bits?

> drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip()
>
> 	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
> 				dev_name(dev), pinctrl);
> 	if (err) {
> 		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
> 		return err;
> 	}
>=20
> 	return devm_gpiochip_add_data(dev, gc, pinctrl);

[Severity: High]
This isn't a bug introduced by this patch, but does the devres registration
order in airoha_pinctrl_add_gpiochip() create a use-after-free risk during
teardown?

If devm_gpiochip_add_data() fails, or when the driver is unbound, devres
unwinds in reverse order. This means devm_gpiochip_add_data() is cleaned
up first, which destroys gc->irq.domain.=20

Since devm_request_irq() was called earlier, the shared IRQ handler
remains registered after the domain is destroyed. If a shared interrupt
fires before the IRQ is finally freed, will airoha_irq_handler() execute
and access the freed girq->domain via generic_handle_domain_irq()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D31
