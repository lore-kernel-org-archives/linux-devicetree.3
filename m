Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DDE3624DE
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090368; cv=none; b=hxtb0BVe+rgJbTKCJRpTtkQChdtfC/lvwIBtl2cqpX7jXuiYB+uqvUnIVmlvtpcjJoSHhW8ekTLts7cZLVa6fCW17sQKdUy4ekLVMVDz/w/9nL+ul276fUTVwVDtS3FGk8b7MTOsiuxCzk3p1h0oINFUpWU9bd0S5B9X6xHoh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090368; c=relaxed/simple;
	bh=D4pdTQ0M7OtzPCyF6Od/Q0aa3o2L1ktk1ypsgyrydRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpR9DmwIfDGihe1VHLUvfQhChl7TFhtJNy/n1nEuJ3jUtGB4rXVzlYTWxbIGEFfINGSwTbw4IzgUWgb3zW06g1q2XjbQWJJuR+kE4evp7Hdis1Hs0IxUcNjOxpgqEHdayQQm9HVmxxwpHpU+ilmFRzNvrVghboKbdjXZhyEaUqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfQa8djy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfQa8djy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B596E1F00893;
	Wed, 10 Jun 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090367;
	bh=k8KbHJ8LO54nRskpwG0IjXtWB6ylJwaMU1w0EHunO2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfQa8djyC3glTg7ekzD/IUollSayklaF0rvK8BdB6OcJl2qHCb/szqDIf3umY28Aa
	 IR1ANRYMmioz27sU7qMlAtVu4+GbRvRw4ev/xqe9yGMd9KIWmxS0z2fZQFTjvdEUDW
	 /6Ax7oa2IVMee7KswOVQZdFFn3B3YsqrKINfFSKbInfneuKXWcIW5mqIV0gEg4fQLO
	 wj5apnYrIBt4M2eI40fjGsQpv5KQPpDpcOffHNxpZArADUU+pP97C+yaGeODmaht2U
	 GuPGjhFywkyTw9vSK1N+S2cxPktGSv56G1VHEThNUIe9pE2OIYHa0Qbl6CETuORWwv
	 EDHOgk5wW+KtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610111136.1514155-2-chenyou910331@gmail.com>
References: <20260610111136.1514155-2-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:19:26 +0000
Message-Id: <20260610111926.B596E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The device tree references a non-existent `&porte` phandle, which w=
ill cause a fatal `dtc` compilation error.
- [Low] The device tree references a non-existent `&usb` phandle, which wil=
l cause a fatal `dtc` compilation error.
- [Low] An unnecessary trailing blank line is added to the Makefile.
--

commit 789d472cb56d573e2ba1106b883551407093dd43
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: Add Milk-V Duo 256M board support

This commit adds basic device tree support for the Milk-V Duo 256M board,=20
based on the Sophgo SG2002 SoC. It configures the UART console, SD/MMC=20
controller, USB host, and a status LED.

> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/so=
phgo/Makefile
> index 6f65526d4193b..e49c8233ae1ff 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
[ ... ]
> @@ -2,7 +2,9 @@
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-milkv-duo256m.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v2.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> +

[Severity: Low]
This isn't a bug, but is this trailing blank line intended? It adds
unnecessary whitespace at the end of the Makefile.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/r=
iscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 0000000000000..882fba441396b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
[ ... ]
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-blue {
> +			label =3D "milkv:blue:status";
> +			gpios =3D <&porte 2 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Will this compile successfully? It appears the porte phandle is not yet
defined in the parent dtsi files, which would cause a fatal dtc compilation
error.

[ ... ]
> +&uart0 {
> +	pinctrl-0 =3D <&uart0_cfg>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&usb {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};

[Severity: Low]
Similar to the porte phandle above, is the usb label defined in the
parent SoC dtsi files? Overriding an undefined label will also cause a
dtc build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610111136.1514=
155-1-chenyou910331@gmail.com?part=3D2
