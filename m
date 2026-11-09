Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243424;
	b=CakDGF2JFf6/hliTXEsG7kiG/292+w4mJZqmE1lhQ/TtLDA1YcKOa3RFte5YN7ZQegZT
	 sSqqGnmk7ABfVw9La1eLNneKK7KiftYYIltIQ2usEz5y4tXKwLi2gko4E/Ciq0J2rv48a
	 RiGCtbvhLJFNwicIYNFKDE5YjVSNEnVw5QjQNfMTfNsH1Cf2AH+jxqNdKOEz4r8koOq2V
	 gi8HJ9+opQji0dBJjFmJHq3YcKdVRPAFxtMbkyfu6D2rlv2esFT9gcvpXpHHVTrqrJP8o
	 uHZT3amejwGsu8A7MUPREr2947F9IvI7RBsJl9Np0XEiAsK73+f+RZ16VmXPppZ2+2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243424;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=urZYeWhibdtU/Zlp2oYCc0mLuov/V5TOYLzLDDHdsnc=;
	b=KQoZMmn1lVnzyRu+Y3eAtAw3lwpF3dn2aHl44g1xdq/0h/262Yx2m2bBWEduW5vYj3m9
	 HeKzto7JM17gaXH62behfOr/pNT7KWSg4KYigOD0EtC9ylEKykies38+IEADPkN7Kgd9/
	 ggYdEdMQwnwT7fxWcyFyke4OERQqRPuO5DmHMM8LEBZA9jSbJJ1qx4/p3xe2XAgTsXBDg
	 QSQ67KZwSk+wVDFpN660K/T4SJOasOd07orFaELquH/d24y1VDvxnBTn8NJePkly7lB+R
	 93PaDfqcpMVVkMsstlrT9sQIswgiz0gMnIYSnHefPur2oMhjT/dK1zAVoT7d0GOxtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwolJh2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F460606A896
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwolJh2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CE11F0089F
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243423;
	bh=urZYeWhibdtU/Zlp2oYCc0mLuov/V5TOYLzLDDHdsnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IwolJh2yBbzb9ttEyaLXZsHmVdoj1UmISMMxmTj5K4898I4Up+SxG4VmKiIqNbtmx
	 ukvlBxj/NQfWSI2PoFOiWGlGLwUEGRVKDQbpQxQulVC3trqXptb71t/jmUIo8cPPRQ
	 oNmUJbptOozfgc6Gzs8mtd2RKJCJp0NBT+RHdIBzOqbPCEMBN0PWuc2N4Pr0dxqNYW
	 7nwivTY8kP5bYLsud+PzZ7yneqq8VbV+3yosDmR2hKijX2eDE2+pqWKDn6LjGpORsw
	 J5MXm+SXtjkrSLbQqkcFx5o3I05ZXa0nmspcXNh8zjhpBt72djkGqfudJ4EVUpLb+D
	 qVb/yjHfO78uQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2511867a12.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:57:03 -0800 (PST)
X-Gm-Message-State: APuU4Z/AlK9Vm9AnJWF22je8O3JN0DlQQZ2hHocwZBTyKE72CnJrUotD
	uX8EkNK0ByIpqqaWn36XDEWDIqyX4nU/SAMcKS5LWXoAYRX3NFXoIOja21gnJJfmJrY9K28plTA
	TUEU0uBovJaCnbcjPDomNhimGRAe/6Q==
X-Received: by 2002:a17:907:d8e:b0:c32:110d:682f with SMTP id
 a640c23a62f3a-c4d6db1ee0cmr361581266b.18.1794243422197; Mon, 09 Nov 2026
 08:57:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109161812.3629546-1-robh@kernel.org> <sashiko-outbox-205230@kernel.org>
In-Reply-To: <sashiko-outbox-205230@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2026 10:56:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2GYF6YOjT4PcEA3sFXZ9nBWGfTFbJtMaxHOMD2pSweA@mail.gmail.com>
X-Gm-Features: AclHuK-sQPk6w1BbAKz5ufpcVmOX4WI72SXQ6mekCEPL_UO_W0K8T6-3I822OgA
Message-ID: <CAL_Jsq+2GYF6YOjT4PcEA3sFXZ9nBWGfTFbJtMaxHOMD2pSweA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, 
	Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ARM: dts: imx6: pinmux hog and GPIO conflicts on pico-dwarf
>   and pico-nymph
> --
>
> commit 92feeab6397394da98e778808f51f6d2369101e3
> Author: Rob Herring (Arm) <robh@kernel.org>
>
> ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes
>
> This commit updates the imx6dl and imx6q pico-dwarf and pico-nymph board
> device trees to include their respective baseboard .dtsi files instead of
> imx6qdl-pico-pi.dtsi, and adds missing properties to satisfy DT schema
> checks.
>
> Link: https://lore.kernel.org/all/sashiko-outbox-199279@kernel.org
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts b/arch/arm=
/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > index d85b15a8c1272..dd8ce2df876c0 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > @@ -9,7 +9,7 @@
> >  /dts-v1/;
> >
> >  #include "imx6dl.dtsi"
> > -#include "imx6qdl-pico-pi.dtsi"
> > +#include "imx6qdl-pico-dwarf.dtsi"
> >
> >  / {
> >       model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf bas=
eboard";
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts b/arch/arm=
/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > index 32ccfc5d41cee..4ce0d0d0756c4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > @@ -9,7 +9,7 @@
> >  /dts-v1/;
> >
> >  #include "imx6dl.dtsi"
> > -#include "imx6qdl-pico-pi.dtsi"
> > +#include "imx6qdl-pico-nymph.dtsi"
> >
> >  / {
> >       model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph bas=
eboard";
>
> [Severity: Medium]
> Does including imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi cause
> pinctrl and GPIO conflicts with imx6qdl-pico.dtsi for /leds, &pcie, and
> touchscreen@38?
>
> In arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi, &iomuxc hogs both
> MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21 and MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31
> via pinctrl-0 =3D <&pinctrl_hog>:
>
> arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi:&iomuxc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_hog>;
>
>         pinctrl_hog: hoggrp {
>                 fsl,pins =3D <
>                         ...
>                         MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21       0x4001b0b=
5 /* PICO_P26 */
>                         ...
>                         MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31       0x4001b0b=
5 /* PICO_P44 */
>                 >;
>         };
> };
>
> However, both imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi define =
a
> /leds node with pinctrl-0 =3D <&pinctrl_gpio_leds> claiming
> MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31, and imx6qdl-pico-nymph.dtsi enables
> &pcie whose pinctrl-0 =3D <&pinctrl_pcie_reset> claims
> MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21. Because imx_pmx_ops does not set
> .function_is_gpio, pin_request() rejects a second device claiming a pin
> already owned by iomuxc, causing pinctrl_bind_pins() to fail with -EINVAL
> when probing /leds on Dwarf and Nymph and &pcie on Nymph.
>
> In addition, /leds in both baseboard files requests <&gpio5 31
> GPIO_ACTIVE_HIGH> as an output, while touchscreen@38 in
> imx6qdl-pico.dtsi uses that same GPIO5_IO31 line as its interrupt input
> (interrupt-parent =3D <&gpio5>; interrupts =3D <31 IRQ_TYPE_EDGE_FALLING>=
;).

I give up...

Rob
