Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9133C1BE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996587; cv=none; b=GyOXNymlcl2T4qIAS+i3+1LDgkZwtyo0Cg07ipbSwyUmJnyjCxl+EB656TUcaC1PBl4XQ93quJaEB5UxAzSr5jpZBgGhWWniAfjmluFlJWYIr0dc1kuz9ktfKP5uhALTcem8GKxtiLDDD+RxEwZw4uFLm+U5SyX0rC+d48NPGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996587; c=relaxed/simple;
	bh=mrI7zAKFiC56vcl1sF4dw+YzS9Lt4H8vPuOcPKeIy/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o1OtIUs7u7WHS4tcAN4njvY830JLiylbdUU8CgmYHTqpkkjOsMs1TJ1OO3o/4n0Vih/3HR03SHTP4Ty6XGQ0a53VpeFTzhcJxdn6TAC751cKjw/hYu+mR5FZ0mYNH38iIbQ8fvLz9RkS2PP01KDnBmLK8B+fATgN3B6x2dxKHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbG73QpC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbG73QpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892CE1F00893;
	Tue,  9 Jun 2026 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780996584;
	bh=Mys4joLw+ab5a3C5T0ob4KbWOjuH/kiPdNLT9//fK54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbG73QpC9QrThpt4d/JryS6h1bX0WW8Rg6wZR2m2mc2qYvWLL/7PdVGSeyDKFh+HK
	 ZLmhL7sk5ei0yM6ESdoWrkUb5IM5Tbz84TfKpexanUCKQKpSzp4UUrFimXnN00yfoK
	 QkrXRdmf2wshMSvlXEz3doFUk4eXnukFNeHDXPQSLZ63EK7l2/YnJBqO5ngdNjhBkF
	 iiUzqfaUwYPlkCjsmdz+w+sxfId2WQtVzs5Yo8CO8aMFolHelPqaA1/HzWbpjSDVp7
	 Sr42PfUcH4UMugszRpsGpjvzk9Q7vmTUoi/1Pgh8UInU3UE1CHxCbyvOqQZJbXsisr
	 sRl8KO/OQSTqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] LoongArch: dts: i2c: Add clocks and
 clock-frequency properties to 2K1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609090543.1462-3-wanghongliang@loongson.cn>
References: <20260609090543.1462-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 09:16:23 +0000
Message-Id: <20260609091624.892CE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `ls2x-i2c` driver ignores the `clocks` property from the devic=
e tree, uses a hardcoded 50 MHz input frequency, and fails to enable the AP=
B clock.
- [High] The driver enables hardware interrupts during probe but fails to d=
isable them if probe fails or when the module is unloaded, risking a shared=
 interrupt storm.
--

commit cddbd9c87b8c7d30fee92d277ef3f18390c5b560
Author: Hongliang Wang <wanghongliang@loongson.cn>

LoongArch: dts: i2c: Add clocks and clock-frequency properties to 2K1000

This commit adds the clock-frequency and clocks properties to the i2c
nodes for the Loongson 2K1000 device tree.

> diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarc=
h/boot/dts/loongson-2k1000.dtsi
> index ab6a55937e9eb..e6f0fe093ab3c 100644
> --- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> +++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> @@ -311,6 +311,8 @@ uart0: serial@1fe20000 {
>  		i2c2: i2c@1fe21000 {
>  			compatible =3D "loongson,ls2k-i2c";
>  			reg =3D <0x0 0x1fe21000 0x0 0x8>;
> +			clock-frequency =3D <100000>;
> +			clocks =3D <&clk LOONGSON2_APB_CLK>;

[Severity: High]
This is a pre-existing issue, but does the ls2x-i2c driver actually use
these clock properties?

Looking at drivers/i2c/busses/i2c-ls2x.c, the driver appears to hardcode
the input clock frequency to 50 MHz:

drivers/i2c/busses/i2c-ls2x.c:
#define LS2X_I2C_PCLK_FREQ  (50 * HZ_PER_MHZ)

It uses this hardcoded value in ls2x_i2c_adjust_bus_speed() to calculate
the prescaler. Because the APB clock can scale, wouldn't ignoring the
clock frequency from the DT lead to out-of-spec I2C bus speeds?

Additionally, the driver never seems to call clk_prepare_enable().
If no other drivers request the shared APB clock, could the clock
framework disable it via clk_disable_unused, hanging the system on
register access?

>  			interrupt-parent =3D <&liointc0>;
>  			interrupts =3D <22 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
This is a pre-existing issue, but does the ls2x-i2c driver correctly
manage these interrupts during probe failures or module removal?

In drivers/i2c/busses/i2c-ls2x.c:ls2x_i2c_probe(), hardware interrupts
are enabled via ls2x_i2c_init() before the fallible devm_request_irq()
and devm_i2c_add_adapter() operations:

drivers/i2c/busses/i2c-ls2x.c:ls2x_i2c_probe() {
    ...
    ls2x_i2c_init(priv);

    ret =3D devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, ...);
    ...
}

If probe fails later, or if the driver is unbound (there is no .remove
callback in ls2x_i2c_driver), the devm framework will free the IRQ handler
but leave the hardware interrupts enabled at the controller level.

Because the interrupt is requested with IRQF_SHARED, won't any subsequent
interrupt asserted by the I2C controller go unhandled and cause an
interrupt storm?

>  			status =3D "disabled";
>  		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609090543.1462=
-1-wanghongliang@loongson.cn?part=3D2
