Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690243AE19B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658662; cv=none; b=OF3sFzEmg/NkUDNxK2zczu8PPzC0jl5KM7YHw8TirGwWBT8Flb+s0O9enWf0fX3R/AhH+gDEkzrI+9DzotjEvo69wzmsgKbA6i+tg/dQCipH6846hymesVFQmCYxcnA8GJRRhjv7wBmPjZxGH+SUgO+ZcNqu0crWNBknbbITRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658662; c=relaxed/simple;
	bh=wg/GMt5GrwIi9KzyRz2npzFtSpFFsK7wNcvupb7Pl40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mlbPEey65TZWWVpaImFLSqCQJz5QLlRsZXqDXffuAUf5zrFPYKi5+Rpmn4pXuXPzpTqDBDydhJEXBsPH6RxzsN7P9KF1JU/tE7rmFCGy/M/2lXOhOYeT4pOT+pbcuXuih+HOdjS0zSyPPoW1q6Tyd0i9//rdrau0qY6Y1A8UVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HI+0x98V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HI+0x98V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14051F000E9;
	Sun, 28 Jun 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658661;
	bh=GRyjqh/ycWetuJS5GRpDxch/VkdX28IDNYHy3x6kmsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HI+0x98VfQzXZsn1E19b927M6BLRB5pWqaaA7AoPMxwuQteuVU7RFo0pnZ55KCz7v
	 O0271KFP31zH2Pq5O3Li0BtTVqEie144/NwP35Iy8KlsV5JhJIcRKJONP8Gml2vzFb
	 CxTGQcL93LoS1KGCyHyhKov69qR1AzKUIfUmmAiKZ6V9j7dEP+Fz3VH0yueo92e+v/
	 Xjd9bkZEVbDZST2L8jLMedaYvqLGLvHcZL8OoPUpHeuP5IHgcm5TR52CnQLH/q0H4M
	 Dk7okwuTCCUiWCUMdsiTcIjGwLoyPpm1OZEOAM52L320FrOix0huQ+B1I1xcRm1GQV
	 jvhrxdNx2pFgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:57:40 +0000
Message-Id: <20260628145740.C14051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing and incorrect electrical configuration (pull-up, pull-down=
, drive strength, open-drain) mappings for dedicated IO pins.
- [Low] The device tree binding example violates the schema's `const` const=
raint by using an incorrect compatible string.

Pre-existing issues:
- [High] Use-After-Free (UAF) of irq_domain in the interrupt handler on dri=
ver unbind due to incorrect devm registration order.
--

commit 11bb118efd0b8683f86390269dd15e4752a654e8
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: add support of en7523 SoC

This patch adds support for the Airoha EN7523 SoC pin controller and its
corresponding device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.=
yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7521-pinctrl";

[Severity: Low]
Does this compatible string match the schema's const constraint? The binding
definition specifies "airoha,en7523-pinctrl", so it seems this will cause a
dt_binding_check validation failure on the example block.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
[ ... ]
> +static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] =3D {
> +	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(0)),
> +	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(1)),
[ ... ]
> +	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(28)),
> +	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(29)),
> +};

[Severity: High]
Are we missing electrical configuration mappings for pins 2-9 here?

Also, are pins 40-41 being mapped to the wrong hardware registers? They app=
ear
to be mapped to REG_GPIO_L_PU instead of their dedicated hardware registers
(e.g., REG_I2C_SDA_PU).

[ ... ]
> +static const struct airoha_pinctrl_match_data pinctrl_match_data =3D {
> +	.pinctrl_name =3D KBUILD_MODNAME,
> +	.pinctrl_owner =3D THIS_MODULE,
> +	.pins =3D pinctrl_pins,
[ ... ]
> +	.confs_info =3D {
> +		[AIROHA_PINCTRL_CONFS_PULLUP] =3D {
> +			.confs =3D pinctrl_pullup_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_pullup_conf),
> +		},
[ ... ]
> +		[AIROHA_PINCTRL_CONFS_DRIVE_E4] =3D {
> +			.confs =3D pinctrl_drive_e4_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_drive_e4_conf),
> +		},
> +	},
> +};

[Severity: High]
Should AIROHA_PINCTRL_CONFS_PCIE_RST_OD be included in this initialization?

Without it, applying standard device tree pin configurations (such as
drive-open-drain on PCIe resets) will fail with -EINVAL, causing driver
probe failures for dependent hardware like PCIe.

[ ... ]
> +static struct platform_driver airoha_pinctrl_driver =3D {
> +	.probe =3D airoha_pinctrl_probe,
> +	.driver =3D {
> +		.name =3D "pinctrl-airoha-en7523",
> +		.of_match_table =3D airoha_pinctrl_of_match,
> +	},
> +};

[Severity: High]
This is a pre-existing issue, but looking at how airoha_pinctrl_probe()
operates in the shared drivers/pinctrl/airoha/pinctrl-airoha.c:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
    err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
                           dev_name(dev), pinctrl);
    ...
    return devm_gpiochip_add_data(dev, gc, pinctrl);
}

Does this lifecycle teardown sequence create a use-after-free on module unb=
ind?

Because devres frees in reverse order, devm_gpiochip_add_data() is undone
first (freeing the irq_domain), and the irq handler is freed second. If an
interrupt fires in this window, airoha_irq_handler() will dereference the
freed girq->domain via irq_find_mapping(), leading to a kernel crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628143733.2736=
51-1-mikhail.kshevetskiy@iopsys.eu?part=3D15
