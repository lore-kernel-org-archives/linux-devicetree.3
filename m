Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707770;
	b=4GbJHV2MSh04Mcxm7t/+1DpcKI6JPQL1hA61qRDZ7oZWpxGHZRm9xuFGZAkj4TZYTjMr
	 aIYJzc5glq19wTa/shPnL1HmM+udh5JRcWoeIrkb44zDwElyV1v8lbpNO4tuj6sPQqwBT
	 WW2r9dE0nt4qDK0T9ypXj0y0+r+sbztv+YwEYgYFM3SCkJd6BGqg38PznH1LExwZ+Y+Uj
	 no/DgpciB0+XxCQC0ccntleiQnpqYn/EBYWU+mtVUQ58ERXqoAoAdxb4tUsV1l30KwH+0
	 Wbn01cuyEZFnzRUe3xOgAUWIrEYUwMo75OE20NCgpR+JArFjq/5sceoxMCoaKeRAaVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707770;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F9Nq6xXSDAhqR0oQcX9hdN1OZL/n9rDxlf/0A6fLVEo=;
	b=KYHs1dmz65rc1CHCtqSKyERHt29YeYkephQAoJgO3GiFJDKH1AxTKyTV9aaUxHFQOddv
	 3cuwkC4z/TkwsAnRI6nX9ecyrO2Ke7Vij2tgdPZzDMnmiH+fAPhnF6LG6xVUlMzwbYT3I
	 UAxgDKIlmG1Fs06oYpRfSgNZ7y9GO+CMHn+iEFtZnfXfC8xLeP0D+w4zWjtumpzSYKgsx
	 5ozN2205R6ilE2vxpg+rhPThR9se4mtd+cBdQPvkHMOt2AHynFqtlnboSFKVuro2nyKPh
	 s2xuNVawwWnK9hlbk450zOKuc5B+rIioE/BncvsjMEvLaEQ0juEEkrlh2PcAwnRABiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbLsDA90;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB93606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbLsDA90
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9291F000C1;
	Tue,  3 Nov 2026 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793707769;
	bh=F9Nq6xXSDAhqR0oQcX9hdN1OZL/n9rDxlf/0A6fLVEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RbLsDA90kz0E2f6C0wOrRXdN2fw1G/3uKejI6XrgAeXCeSOMpEWSy/9XYJ8ltHwrp
	 oCxGfaUi8FMVPHJkMP/aQ0758eG3fUCnAZIbfpbLwRpjmgumYL+87tqcbTDs90VNQD
	 paXKzpQey14mz2tr4hnw7/M+lzjtBeIg9fGvK9TIl5Vx4jeCSpzp41JjmTi2Ry6U+1
	 a50UWbKrBS+XXt/EtgMJ0j5jrxoH/cunMjtR3I/EpRh88ebK5yRSaDMUJGkBTF24Jy
	 kpwW0aTyyrgwtHjl4Pe5ynnWqNgwV78Uqoo43YaJ3nISBtzoGfVmOyYguNySk9+xoc
	 9PaX/tfCwmr2A==
Message-ID: <sashiko-outbox-195218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>
References: <cover.1793705210.git.jackyhuang@nvidia.com>
 <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 12:09:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ARM: dts: aspeed: vr-c2-bmc mac2 pinctrl conflicts with gpio0 mu=
x pins
- [Low] ARM: dts: aspeed: vr-c2: unreferenced framebuffer shared-dma-pool n=
ode
--

commit 07cf82ff2465e47eff9ccc7235e61fcff4d5b27a
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

This commit adds the device tree for the NVIDIA MGX Vera C2 BMC based on
the ASPEED AST2600 SoC.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> new file mode 100644
> index 0000000000000..a044dfa004fc1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts

[ ... ]

> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		framebuffer@9f000000 {
> +			reg =3D <0x9f000000 0x01000000>;
> +			no-map;
> +		};
> +
> +		ramoops@a0000000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0xa0000000 0x100000>;
> +			max-reason =3D <2>;
> +			record-size =3D <0x10000>;
> +		};
> +
> +		framebuffer {
> +			compatible =3D "shared-dma-pool";
> +			alignment =3D <0x01000000>;
> +			reusable;
> +			size =3D <0x01000000>;
> +		};

[Severity: Low]
Is this framebuffer shared-dma-pool node intentionally left unreferenced?

During boot, fdt_scan_reserved_mem() -> __reserved_mem_alloc_size() ->
rmem_cma_setup() allocates 16 MiB from memblock for this pool. Because
linux,cma-default is not set, rmem_cma_setup() only stores the struct cma
pointer in rmem->priv for per-device attachment via a memory-region
phandle in of_reserved_mem_device_init_by_idx().

However, this node has no phandle label, no device node references it via
memory-region, and &gfx is not enabled in this device tree, so no device
can allocate DMA buffers from this 16 MiB pool. Should this node be
removed, or labeled and referenced by an enabled &gfx node?

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D
> +		/* A0-A7 */
> +		"", "", "", "", "", "", "", "",
> +
> +		/* B0-B7 */
> +		"", "", "", "", "", "", "", "",
> +
> +		/* C0-C7 */
> +		"SGPIO_I2C_MUX_SEL-O",
> +		"", "", "", "", "", "", "",
> +
> +		/* D0-D7 */
> +		"", "", "",
> +		"UART1_MUX_SEL-O",

[ ... ]

> +/* NCSI MAC */
> +&mac2 {
> +	phy-mode =3D "rmii";
> +	pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +	pinctrl-names =3D "default";
> +	use-ncsi;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Does pinctrl_rmii3_default on &mac2 conflict with the gpio0 lines
SGPIO_I2C_MUX_SEL-O (GPIOC0) and UART1_MUX_SEL-O (GPIOD3)?

In drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c, the RMII3 group includes
balls H24 (GPIOC0 / RMII3RCLKO) and E26 (GPIOD3 / RMII3RXER):

    GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
    GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);

When &mac2 probes with pinctrl_rmii3_default, pinmux_enable_setting()
claims both H24 and E26 for 1e670000.ethernet and muxes H24 as the 50 MHz
RMII3RCLKO output. Because aspeed_g6_pinmux_ops sets .strict =3D true, any
subsequent GPIO request for GPIOC0 or GPIOD3 via aspeed_gpio_request() ->
pinctrl_gpio_request() -> pin_request() will fail with -EINVAL.

Since &mac2 uses NCSI, should it use pinctrl_ncsi3_default so H24
(GPIOC0) is not claimed as RMII3RCLKO, and is GPIOD3 (E26) expected to be
used as a GPIO while NCSI3 is active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793705210.gi=
t.jackyhuang@nvidia.com?part=3D2
