Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234D3064B5
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240844; cv=none; b=FPhELzLwuHxzsp3nXrg2LM8Oqmg2s1M09ABF6KYaOH52xEcNzolThmbWIFUq9pk6a2FsBAyCLsXJIumxRqrHGy5nfjpE1XEErRRzAIOEzf/JU0wqkb0uSflRuQDtiEyCpZojkdWy5RZdqTwF7uaNKsf4JJqzi9xG2+mR+/OOSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240844; c=relaxed/simple;
	bh=o8C/XVPWXH2h3MI69ROT8OrdjpC6XWFLy3tAcgRxTGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kaFDX8WkNrYIlnsnS9B8+313LzE/6zjjHoslkTKZyLAwGNU8BqhKhA8rM0QxSuWZWBboCNKkPEjdjzMk5+GK1syxQ75+agZIoy6xAlJllt5oiB1tcuWOhAIEKClxJorT4YnDZ/d1zqsTFsinE0cGZTevHABG0KTmLr/9eNiW4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnoLe1os; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnoLe1os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC4D1F000FF;
	Mon,  5 Oct 2026 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791240842;
	bh=6UOuRCE2hGtkBjql1Fz+Tdi66GYV+mswUEGHNE+sgAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnoLe1os87drMNhPeDbPmlHdyuSwcJQKeQ7ym21RGs2fJZd9RIVlsMN2uMRFHZl7O
	 WBVR+duTeInsdlGZvHCLxiaRXEYm+IQPeC3M5s76ayzeZPxhCBrWNqSCRjBcz1afx3
	 5WLU3AstAAR5lp+u2FkmdHkUDbqdqy9xodLJeZAUXxAuxL1vfCjO6eq2irHQOWvZGk
	 Y1xm04gQBIKwr2XrUDreOAcI/vveB9KrF569t6hz+SI36WDz62P3EBlXs5yApp08JP
	 AlAeNNYpHQRiXoZiQYNPQR2prxKoX1zP5fGQ/zDguSunfcNNCx/vrhu8rqldVrFrqh
	 qGoOanwkg6yyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX
 efuse GP_SW1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261005224623.1836410-1-jm@ti.com>
References: <20261005224623.1836410-1-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 22:54:01 +0000
Message-Id: <20261005225402.5FC4D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] nvmem: UniPhier eFuse driver causes fatal bus fault on TI K3 3=
2-bit MMRs
- [High] dt: Invalid UniPhier eFuse compatible string breaks chipid probing
--

commit 688c6bb3959f80cd34b037f0b11195f18639c24d
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX efuse GP_SW1

This commit creates k3-am62p-wakeup.dtsi which includes AM62P-specific
WAKEUP domain nodes. It adds the efuse node for GP_SW registers to determine
the AM62P silicon revision.

Link: https://lore.kernel.org/all/178942274041.683176.599438200260103620.b4=
-ty@kernel.org/
Link: https://lore.kernel.org/linux-devicetree/b82dec19-02a9-4b93-a2bb-3cbb=
6f33ae63@ti.com/
Link: https://lore.kernel.org/all/20260922165714.425576-1-jm@ti.com/

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-wakeup.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree file for the AM62P WAKEUP domain peripherals
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + */
> +
> +&wkup_conf {
> +	gpsw_efuse: efuse@230 {
> +		compatible =3D "ti,am62p-efuse", "socionext,uniphier-efuse";

[Severity: Critical]
Will this compatible string cause a fatal bus fault on TI K3 32-bit MMRs?

If the socionext,uniphier-efuse driver successfully binds (for example, in a
multi-platform configuration with ARCH_UNIPHIER enabled), it registers its
uniphier_reg_read() method configured with an 8-bit word size.

When the chipid driver subsequently calls nvmem_cell_read_u32(), the
uniphier_reg_read() function uses readb() to perform 8-bit reads:

drivers/nvmem/uniphier-efuse.c:uniphier_reg_read() {
    ...
    *val++ =3D readb(priv->base + reg + offs);
    ...
}

Since the gpsw_efuse registers are located in the TI K3 Control MMRs, which
physically mandate 32-bit aligned accesses and do not support byte enables,
the 8-bit readb() will be rejected by the interconnect fabric and trigger a
fatal synchronous external abort (SError) or bus fault.

> +		reg =3D <0x230 0x10>;
> +		#address-cells =3D <1>;
> +		bootph-all;
> +		#size-cells =3D <1>;
> +
> +		gpsw1: gpsw1@4 {
> +			reg =3D <0x4 0x4>;
> +		};
> +	};
> +};
> +
> +&chipid {
> +	nvmem-cells =3D <&gpsw1>;

[Severity: High]
Does this explicitly linked dependency indefinitely defer probe of the
k3-socinfo driver on standard K3 builds?

By explicitly linking the chipid node to the gpsw1 nvmem cell, the chipid
driver attempts to read gpsw1 via nvmem_cell_read_u32() during probe.

Since the uniphier nvmem provider driver is not compiled on standard K3
builds (as it strictly depends on ARCH_UNIPHIER or COMPILE_TEST), the nvmem
provider never loads. The read operation will return -EPROBE_DEFER
indefinitely, silently breaking SoC identification and any functionality
depending on it.

Reusing an unrelated vendor's compatible string to trick a driver into
binding appears to be an anti-pattern that fails here due to Kconfig
dependency isolation.

> +	nvmem-cell-names =3D "gpsw1";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005224623.1836=
410-1-jm@ti.com?part=3D1
