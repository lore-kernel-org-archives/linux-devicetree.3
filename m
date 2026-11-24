Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536760;
	b=1AWggXGMWuiEDQ0pveQQvCFiWTZK6klF6cFEzt+jNkEaLbaaqx1x9ShYhPOZyeQr0Io0
	 Y+bupAlW1829zwTWHWgZAkJ1DttuOPthgK48ZnselpDrsBLmzK9ziDdbEGr/ximkdnO0k
	 PcQFxMo0s3XbbRcjHiJYhGfUF6GxncrQSbFmK2Ebn2yk31RQFu6Mn2HYD916sPOmDCdge
	 vYIuN02zOOMEUhnJsUODpiKN0WXfq8JTr6mxxxl0Cbp17r9puzaYCFxM9KBmifouKU4KK
	 EhRVlIG1cZOZPj5b3I/KsZgutldNp5YbJ41S7Q674a6WIxmJbWYJox5mieFo3hFe72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gNy25Okrf92wqeBD3M5rZLW7dKuUygXa1dpAWhMmCnU=;
	b=IBtTQLzSSVo6ZP+GjD4ZRxBdmTy6jx7jLrZg6DF9iVBp7rMgrlLcNpVCoW5X2IG4O3qB
	 PrLmImZB2Mgo30gtBuB47xUViqDcy8dvPQJUtj2+99D0OihHasu+qi958tfAEYbVP3xFx
	 fRJHhMcc6l/bLvOx7cAIfwNRoc+z0xReLUIaGm0lgLeavRq/MVhw3lRAmjxNs1o+9euDX
	 xm2yG74B2V0va73MYJySv0X+0gjN1tG9oyCtM2DXP3jD4mDRtSZNjJRS7m68SOtD54iMR
	 axjfQrm5k7kibofE4NwAHfIuVbEhkmk0dD61ZVIYyH0JF3oVcpOtM0s2HmU6bRUb0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHimvtrA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277D606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHimvtrA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EA81F000D0;
	Tue, 24 Nov 2026 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536759;
	bh=gNy25Okrf92wqeBD3M5rZLW7dKuUygXa1dpAWhMmCnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHimvtrAZPWQ2aDw3pAFncGqi1luwqfx71yT56QeqPPBGktZkdZ1afRAwXwceEHpf
	 YPbXYoOxirdodqooomOA/s9nRpUvomRFWpZe91r1T1tH0ImANbTljrNS0OCTe0O1H/
	 hlPTqCnLtAt/iDgXdkg7Q2EKDq92vwOD0v40BXZWW0A4PkBrZtIqZm6cDgLONxIaai
	 on2RVi2PHHwGyo8tjYALjXBqUx/kjsoSAmGf30bkG9SRr/GipW/h8lgLT54DMdq6LS
	 LUtd2xUWicuKy8knwKNeCYusehBsoTgtr7/xh8UKZfcqLYez1hGg27J5fU4FiEOXHm
	 M64xCC3VXPvGg==
Message-ID: <sashiko-outbox-231537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/18] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-jh7110-clean-send-v8-17-de92635dd857@samsung.com>
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
 <CGME20261124155431eucas1p18761b3a7bbc4e018c6840db83d1c64fb@eucas1p1.samsung.com>
 <20261124-jh7110-clean-send-v8-17-de92635dd857@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:12:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] riscv: dts: starfive: CMA alloc-ranges in jh7110-common.dtsi
  breaks 1 GiB RAM
- [Low] riscv: dts: starfive: duplicate 24 MHz xin24m clock node in
  jh7110.dtsi
--

commit 7ebd6a4c9bd05a6b380264edfb6e56553f4653a0
Author: Michal Wilczynski <m.wilczynski@samsung.com>

riscv: dts: starfive: jh7110: Update DT for display subsystem

This commit adds the JH7110 video output display subsystem, DC8200 display
controller, HDMI subsystem, and default CMA pool nodes to the StarFive
JH7110 device trees.

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 64de468f2c317..3eadb5732b011 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -33,6 +33,27 @@ memory@40000000 {
>  		bootph-pre-ram;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/*
> +		 * The display controller allocates its framebuffers from CMA,
> +		 * and the default pool is too small for them. Keep the pool
> +		 * inside the range the controller can address; it fits in the
> +		 * memory every VisionFive 2 variant has.
> +		 */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +			alignment =3D <0x0 0x1000>;
> +			alloc-ranges =3D <0x0 0x70000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};

[Severity: High]
Does pinning alloc-ranges to 0x70000000..0x90000000 break CMA reservation on
1 GiB JH7110 boards?

jh7110-common.dtsi is also included by boards that ship in 1 GiB RAM
configurations (such as Milk-V Mars and Mars CM), where DRAM starts at
0x40000000 and ends at 0x80000000.  With only 256 MiB of RAM falling inside
alloc-ranges, __reserved_mem_alloc_in_range() fails to reserve the 512 MiB
pool with -ENOMEM, leaving the system without its default CMA pool and
causing DC8200 framebuffer allocations to fail.

Even on boards with 2 GiB or more of RAM, matching the 512 MiB alloc-ranges
window to the exact 512 MiB pool size leaves no placement slack, so any
earlier memblock reservation (such as an initrd) overlapping
0x70000000..0x90000000 also causes the CMA reservation to fail.  Since
vs_dc_probe() sets DMA_BIT_MASK(32), can alloc-ranges cover the 32-bit
addressable DRAM window (for example <0x0 0x40000000 0x0 0xc0000000>) or a
smaller size that fits within 1 GiB configurations?

[ ... ]

> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 82ea63f715b0e..4c3ef68c16bb6 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -352,6 +346,13 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	xin24m: xin24m-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "xin24m";
> +	};

[Severity: Low]
Does xin24m duplicate the existing osc: oscillator node in jh7110.dtsi?

The SoC 24 MHz reference crystal is already modelled as &osc (with its
24 MHz frequency set in jh7110-common.dtsi), and starfive_hdmi_phy_probe()
acquires its unnamed reference clock at index 0 and queries its parent name
dynamically via __clk_get_name(), so hdmi_phy can take clocks =3D <&osc>
directly without adding a second 24 MHz root clock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-jh7110-cle=
an-send-v8-0-de92635dd857@samsung.com?part=3D17
