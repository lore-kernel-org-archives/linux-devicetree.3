Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07823EB11C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964488; cv=none; b=HYHDZruAc93Zi6SFE3FQIt/PJnXIcC1AOizZuyEXNGwpuNOYBzMyCmCZCmkLn6E91S8i50bfgB38wmn2+LZaITFnPJ7yOpSsFjK1QGuQ5dBbJz7IlUOQBIiAeMgU3SAhKeWshCD+Kp4ryDqjbTrjceOuEpdZr3MOePEJHE5W9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964488; c=relaxed/simple;
	bh=VUc5+ND/v7pzxG+KPZ80OAFtzgUSynvs3lueSvM/Mss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PlU98cJKQSIG4JOFtUGhTLjjb01ik/FJ/cct1pbUklWaguwit3W1N5GaFfuAWmvbNCtisc89UkZxgWWSqNozK7vmdk7XqNuwjrOIXmk6V125g4gqbT7zoxvpdkO7kdYQ7xB6a9gpe93TJRXNh29VZoDu4LhwtbL7oZnAptOI8v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7Ej7Dfx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Ej7Dfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571E71F000FF;
	Wed, 14 Oct 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964486;
	bh=Yc5iR8hIPteiVWHjbFid+JJX/g95yOHIBcHOufID3jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7Ej7DfxpD4sr9eu2Q14DRC3N2K1BYdN/dEj2upuUjf3goEmAqfZx1+K6ymnWhxRO
	 WCQBtiTMj8tFAmO3F9S0/9O40RdSIR5o8AHklcZOpCEQjXLNjgC03719zj2z4ih4Zd
	 fqHpF6Kw0teJjiMhHoRyaM5X4uLYA+S4uh2BDN4sooAdqNs7JPSqKfum5OAwfBroL2
	 sovFDcG6yyWgTY1D8j/YDqi4xtmPDvYkAGgSA6uKGOCQh8hhT+J1BbRgaQvETcDYx6
	 ifePsgKqEhlk/IK6m28g4qjWXPtdnT6vtJljdi4Gvx7hCxh76jF0VcvOaktaW6MyAV
	 2F21rxmoJxe6A==
Message-ID: <sashiko-outbox-170970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 07:54:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] nvmem: sophgo: heap buffer overflow in sg2044_efuses_read()
- [High] nvmem: sophgo-efuse: uninitialized mutex usage
- [High] nvmem: sophgo-efuse: missing reset line deassertion
- [Low] patch: undocumented driver code modification in a Device Tree patch
- [Low] nvmem: sophgo-efuse: sg2044_efuses_read_strip() return type mismatch
--

commit 9dc44262e764574361fe929e8bb24ed2e5ee7f12
Author: Inochi Amaoto <inochiama@gmail.com>

riscv: dts: sophgo: sg2044: Add eFUSE device

Add eFUSE controller node for SG2044.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2044.dtsi
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi

[ ... ]

> @@ -408,6 +408,18 @@ sd: mmc@703000b000 {
>  			status =3D "disabled";
>  		};
> =20
> +		efuse0: efuse@7040000000 {
> +			compatible =3D "sophgo,sg2044-efuse";
> +			reg =3D <0x70 0x40000000 0x0 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			clocks =3D <&clk CLK_GATE_EFUSE>,
> +				 <&clk CLK_GATE_APB_EFUSE>;
> +			clock-names =3D "core", "apb";
> +			resets =3D <&rst RST_EFUSE0>;

[Severity: High]
Does the driver need to deassert this reset line during probe?

The device tree node specifies a reset line, indicating the hardware requir=
es
it.

However, looking at the probe function:

drivers/nvmem/sophgo-efuse.c:sophgo_efuses_probe() {
	...
	efuse->num_clks =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks=
);
	if (efuse->num_clks < 0)
		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");

	config.priv =3D efuse;
	...
}

It seems the reset control is omitted entirely.

If the bootloader leaves the device in a reset state, subsequent MMIO acces=
ses
in sg2044_efuse_wait_mode() could cause a bus hang or timeout.

> +			status =3D "disabled";
> +		};
> +
>  		i2c0: i2c@7040005000 {

[ ... ]

> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> --- a/drivers/nvmem/sophgo-efuse.c
> +++ b/drivers/nvmem/sophgo-efuse.c
> @@ -14,6 +14,7 @@
>  #include <linux/mutex.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>

[Severity: Low]
This isn't a bug, but is it intended to include an undocumented driver
modification in a Device Tree patch?

The patch is scoped as a Device Tree update for the eFUSE DT node, but
silently modifies drivers/nvmem/sophgo-efuse.c to add this include.

Separating driver modifications from DTS patches helps maintain clean subsy=
stem
boundaries and facilitates bisection.

[Severity: High]
Does this code overflow the allocation for the read buffer?

When sg2044_efuses_read() calculates start and end indices:

drivers/nvmem/sophgo-efuse.c:sg2044_efuses_read() {
	...
	start /=3D SG2044_EFUSE_ALIGN;
	end /=3D SG2044_EFUSE_ALIGN;
	...
	buf =3D kzalloc(end - start, GFP_KERNEL);
	...
}

It converts start and end from byte offsets to word counts, but then alloca=
tes
the buffer using the word count rather than multiplying by 4.

Later in the loop:

drivers/nvmem/sophgo-efuse.c:sg2044_efuses_read() {
	...
	for (i =3D start; i < end; i++) {
		ret =3D sg2044_efuses_read_strip(efuse, i, &value);
		if (ret)
			goto failed;

		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
	}
	...
}

The memcpy writes 4 bytes per word into the under-allocated buffer.

Could this write past the end of the allocation and cause memory corruption?

[Severity: High]
Is the mutex inside the efuse structure properly initialized?

In the probe function, the structure is allocated and zero-initialized:

drivers/nvmem/sophgo-efuse.c:sophgo_efuses_probe() {
	...
	efuse =3D devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
	if (!efuse)
		return -ENOMEM;
	...
}

However, it appears devm_mutex_init() or mutex_init() is never called for
efuse->mutex.

When the sysfs read callback executes:

drivers/nvmem/sophgo-efuse.c:sg2044_efuses_read_strip() {
	...
	guard(mutex)(&efuse->mutex);
	...
}

Could locking this uninitialized mutex trigger lockdep warnings or system
crashes due to the uninitialized internal wait lock and wait list?

[Severity: Low]
This isn't a bug, but could the return type of sg2044_efuses_read_strip()
cause issues if negative error codes are implicitly cast?

The function is declared to return a u32:

drivers/nvmem/sophgo-efuse.c:
static u32 sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
				    unsigned int offset, u32 *strip)

But it returns negative error codes directly:

	ret =3D sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
	if (ret < 0)
		return ret;

While the single caller sg2044_efuses_read() assigns this back to an int and
checks it correctly, returning negative errors as unsigned integers might l=
ead
to unexpected behavior if future callers check for less than zero.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014074516.2402=
47-1-inochiama@gmail.com?part=3D3
