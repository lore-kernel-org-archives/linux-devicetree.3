Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215402609C5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516263; cv=none; b=HBv2GFJJq+J7CqTp5bsNdfcWDFI7cLsXa71Xj3vOGsIiOwxDOjrkYn1e2kkev5KOVwVjlC7eRy1k2Ao99TmzZOgODtkOpGLRrGL7PDvXEOSO3gHJ7yJiz30PLwQHgyOcXgcNT2pQZ4+q4YhWkA4oAa6AhI/emtC/6ZJ1WeOHN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516263; c=relaxed/simple;
	bh=K/EdhfKg/bcpyJF4mDxcsSsK3DECpg5fifnzwjLSd54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d2+NrcWjtvyKnQav6r9tEz2APLgMha66x6irsjW5ARGaAelz0LfLNiMKeacfkZNMwsFKMCeuzsSaaxd3TZzgUN/0KcgWINKY/HiqSfJbvqD37nlQuYnvpJoB1TaBPWqb8kbhkOZOLT45MI1JnCqIRwQKYFA557q2SOK0JPUPTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi2CI+WM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi2CI+WM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23C91F000E9;
	Wed,  8 Jul 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783516262;
	bh=FnMo95FOuFvaYmb7Zf3092GEdot1gPB9OqiQ0ik5QbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mi2CI+WM3vJcgxmwQfgM1RbmZ8ZDsBrzKifTzR5jTxQNSDgGQgankRQOQgYkOyozu
	 QcUde94wFxyec2T803dgRcinUNEad7UrJ69TxnzGeJW11fJ6VMzzGspdbw82k+Ij6V
	 RV1k0g5HZySzKql3g9c/oGPOURTDan5cTldZJ4MDEwgEZgu5r08ByyRwra1QnVoAx7
	 HvW2gm2wGreH9+/aeP5QaCyE+ntZwRkTYXWRSTTxagqp3t9WlTjvKEbIzomwSX06h9
	 RngR2nxb5R4rHh+ceFJgNakbJcOIGgv82Wf8lBpeZZxhTYLEAWrS84gkDQtfA608J/
	 JID8Yy4UxacKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708125352.1915040-4-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
 <20260708125352.1915040-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 13:11:01 +0000
Message-Id: <20260708131101.C23C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] The `fiu0`, `fiu1`, and `fiu3` SPI flash controllers omit the re=
quired `memory` mapping region.
- [Low] The `pspi` (Peripheral SPI) controller is added but not documented =
in the commit message.

Pre-existing issues:
- [High] The IRQ name passed to `devm_request_irq` is allocated on the stac=
k, leading to a dangling pointer in the IRQ subsystem.
- [High] The fan ISR calculates the module index using virtual IRQ numbers,=
 leading to an out-of-bounds array access and memory corruption.
- [High] The USB device controller driver fails to save the allocated `ci_h=
drc` pointer, causing a deterministic NULL pointer dereference on device re=
moval.
- [High] The EDAC driver frees its main control structure on the probe erro=
r path while a device-managed interrupt is still registered and active.
--

--- Patch [3]: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add peripheral =
nodes ---
commit f606ce99eafc7d4c8e2d67d9d5119b1c25593a16
Author: Tomer Maimon <tmaimon77@gmail.com>
Subject: arm64: dts: nuvoton: npcm845: Add peripheral nodes

This commit extends the NPCM845 SoC DTSI by adding peripheral controller no=
des
needed by the evaluation board and downstream platforms. It adds nodes for
Ethernet, USB, MMC, FIU, memory controller, RNG, ADC, PWM/FAN, I2C, and the
OP-TEE firmware.

> Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> by the evaluation board and downstream platforms. Add the Ethernet MACs,
> USB device controllers and PHY, MMC controller, FIU controllers, memory
> controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
> OP-TEE firmware node needed to describe these blocks.

[Severity: Low]
The pspi (Peripheral SPI) controller node is added by this patch, but it
isn't mentioned in the commit message. Should it be included in this summar=
y?

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 0e5feabf2d718..7608dcf5489c4 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
[ ... ]
> +		mc: memory-controller@f0824000 {
> +			compatible =3D "nuvoton,npcm845-memory-controller";
> +			reg =3D <0x0 0xf0824000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +		};

[Severity: High]
This is a pre-existing issue, but adding this memory controller node exposes
a vulnerability in the EDAC driver (drivers/edac/npcm_edac.c).

In drivers/edac/npcm_edac.c:setup_irq(), a devres-managed interrupt is
registered and the hardware is unmasked:

    ret =3D devm_request_irq(&pdev->dev, irq, edac_ecc_isr, 0,
                           dev_name(&pdev->dev), mci);
    ...
    regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
                 pdata->int_mask_master_non_ecc_mask);

If edac_mc_add_mc() fails later in edac_probe(), the code jumps to the error
path and frees the main control structure:

free_edac_mc:
    edac_mc_free(mci);
    return rc;

Since the interrupt remains registered and active until devres teardown,
could the hardware assert an ECC interrupt during this window, causing
edac_ecc_isr() to dereference the freed mci pointer?

[ ... ]
> +		udc0: usb@f0830000 {
> +			compatible =3D "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0830000 0x0 0x1000
> +			       0x0 0xfffeb000 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM8XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};

[Severity: High]
This isn't a bug introduced by this patch, but adding these USB controller
nodes exposes an issue in drivers/usb/chipidea/ci_hdrc_npcm.c.

In drivers/usb/chipidea/ci_hdrc_npcm.c:npcm_udc_probe(), plat_ci is
successfully returned but never assigned to ci->ci:

    plat_ci =3D ci_hdrc_add_device(dev, pdev->resource, pdev->num_resources,
                                 &ci->pdata);
    if (IS_ERR(plat_ci)) { ... }

When the device is removed, npcm_udc_remove() passes the uninitialized ci->=
ci
pointer to ci_hdrc_remove_device(), which immediately dereferences it.

Could this lead to a NULL pointer dereference during device unbind?

[ ... ]
> +		fiu0: spi@fb000000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb000000 0x0 0x1000>;
> +			reg-names =3D "control";
> +			clocks =3D  <&clk NPCM8XX_CLK_SPI0>;
> +			status =3D "disabled";
> +		};
> +
> +		fiu1: spi@fb002000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb002000 0x0 0x1000>;
> +			reg-names =3D "control";
> +			clocks =3D  <&clk NPCM8XX_CLK_SPI1>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi1_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		fiu3: spi@c0000000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xc0000000 0x0 0x1000>;
> +			reg-names =3D "control";
> +			clocks =3D  <&clk NPCM8XX_CLK_SPI3>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi3_pins>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Do these FIU controller nodes need a 'memory' mapping region?

Without the 'memory' register range, the SPI driver might fail to use
memory-mapped direct reads and drop to UMA (manual) mode, degrading
performance. The fiux node below includes it, but fiu0, fiu1, and fiu3
do not.

[ ... ]
> +			pwm_fan:pwm-fan-controller@103000 {
> +				compatible =3D "nuvoton,npcm845-pwm-fan";
> +				reg =3D <0x103000 0x3000>,
> +					<0x180000 0x8000>;
> +				reg-names =3D "pwm", "fan";
> +				clocks =3D  <&clk NPCM8XX_CLK_APB3>,
> +					<&clk NPCM8XX_CLK_APB4>;
> +				clock-names =3D "pwm","fan";
> +				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]
> +				status =3D "disabled";
> +			};

[Severity: High]
This isn't a bug introduced by this patch, but enabling this PWM/FAN
controller node triggers a dangling pointer bug in
drivers/hwmon/npcm750-pwm-fan.c.

In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_pwm_fan_probe(), the IRQ name is
allocated on the stack:

    char name[20];
    ...
    sprintf(name, "NPCM7XX-FAN-MD%d", i);
    ret =3D devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr, 0, nam=
e,
                           (void *)data);

Since devm_request_irq() stores the name pointer in the IRQ descriptor, the
stack frame destruction upon probe return leaves a dangling pointer.

Could this cause a use-after-free or panic when userspace reads
/proc/interrupts?

[Severity: High]
This is also a pre-existing issue, but there is another bug in
drivers/hwmon/npcm750-pwm-fan.c that this node exposes.

In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_fan_isr(), the module index is
derived by subtracting the first virtual IRQ from the incoming virtual IRQ:

    module =3D irq - data->fan_irq[0];
    spin_lock_irqsave(&data->fan_lock[module], flags);

Because the kernel's irqdomain does not guarantee that virtual IRQs are
contiguous or allocated in order, could this subtraction result in an
out-of-bounds array access and memory corruption when acquiring the spinloc=
k?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.1915=
040-1-tmaimon77@gmail.com?part=3D3
