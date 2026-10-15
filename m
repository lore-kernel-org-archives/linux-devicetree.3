Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952194E8E0D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069775; cv=none; b=CRsPng2RJ/4SL5bwtkaG4jKrYvQbagA2/d1hQiTNCXiwZCyHoOWH2lqMQJSRKb3/F1yX/fodiBAzZsKDCJAwn6JHhCimVnGK1pbu0MXcGbJFDxsbI2w6n11eK6jXI26efFcoF+ESR+vzyZ0CL7VuhWwmgYVE7Ku0Ggn1kAL2688=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069775; c=relaxed/simple;
	bh=ZEJFLkENJEZMuERAZJzGLz/b6lXl4CH8KP0Xbyu9rDA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pF+11Wcd/ZkmEHkJYxMD36j4DdTnMddXZbAKwb8UWD7hSFu/rp/ICuOS2ry36T/TxSJP1NkiqUEqYeXu1TgnFWkzWlenP/x/Mqxm1PQXj8wC8yn+7n007Iz99lVcVIObpRw2TQFbjFfhNO9vNyHDmBaUeOQITlUOANHEOtDuiIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLGATJ5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLGATJ5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6CC1F000C4;
	Thu, 15 Oct 2026 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069773;
	bh=TWMToRltBkW0AUlmAtzeT7tgoRxrPKUDsovHZmJg7a0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLGATJ5F89zCmheiYctWB3PAIsQ4vUTBq4riJ1r3MjVvl7nx9uwRpkc1cO6N6M3Xx
	 Ov2YHykMJATszW0kYkpJHkv/tgRxuu23rj8xEeQ2lNRibC1EgoRxsCBw+83pTwu0UD
	 WaeOgmkCBDI50+stMg9CSZfNXPT8NOc4GsXPEHbrRJS5FCiQswTYk5RSfTCS2qDSX6
	 Vs5nJO5IbYdz7Yb6cd7qqZ07hzopwvEzvI6vMTUTpkHwXahsc9Qjfn5TPf8smrEZvM
	 SSWRNtk2CaoBvf7uZmyzjGeNKlOK2ywwYCfEpOfXJtzneuq0Qnh2PieId+HStDxfNC
	 hYdRYp6YNdOQA==
Message-ID: <sashiko-outbox-172899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] riscv: dts: eswin: add hsp bus node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
 <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:09:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: unclocked syscon MMIO access due to missing clocks property
--

commit 411f5ceff131ac2449926a00c5f169d3aa665b6d
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

riscv: dts: eswin: add hsp bus node

This commit adds an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR registers
and the register spaces of HSP peripheral devices.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =20
> +		hsp: bus@50400000 {
> +			compatible =3D "simple-pm-bus";
> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			syscon: syscon@50440000 {
> +				compatible =3D "eswin,eic7700-syscfg", "syscon";
> +				reg =3D <0x0 0x50440000 0x0 0x2000>;
> +			};

[Severity: High]
Will accessing this syscon node result in an unclocked MMIO fault?

The syscon node lacks a clocks property and seems to rely on the parent
simple-pm-bus for clocks. However, generic syscon does not trigger parent
runtime PM.

When looking at of_syscon_register() in drivers/mfd/syscon.c, it only attac=
hes
a clock if the clocks property is present on the syscon node itself:

drivers/mfd/syscon.c:of_syscon_register() {
        ...
        if (check_res) {
                clk =3D of_clk_get(np, 0);
                if (IS_ERR(clk)) {
                        ret =3D PTR_ERR(clk);
                        /* clock is optional */
                        if (ret !=3D -ENOENT)
                                goto err_clk;
                } else {
                        ret =3D regmap_mmio_attach_clk(regmap, clk);
        ...
}

Meanwhile, looking at simple_pm_bus_probe() in drivers/bus/simple-pm-bus.c,
the simple-pm-bus only enables runtime PM:

drivers/bus/simple-pm-bus.c:simple_pm_bus_probe() {
        ...
        pm_runtime_enable(&pdev->dev);

        if (np)
                of_platform_populate(np, NULL, lookup, &pdev->dev);
        ...
}

Since simple-pm-bus strictly relies on children to wake it up, and syscon
bypasses platform_device PM entirely, the bus is never resumed. Does this
mean any driver or debugfs interface accessing the eswin,eic7700-syscfg
regmap will perform MMIO without enabling the HSP_CFG_CLK?

> +		};
> +
>  		uart0: serial@50900000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0x0 0x50900000 0x0 0x10000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015125454.1381=
941-1-pinkesh.vaghela@einfochips.com?part=3D4
