Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0423FD15E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884794; cv=pass; b=SNpGjlR2OepFleqdCKz1Xiu75vOfgui0LoEJ1NCjhp10+TNtrMY7wglrwvpsQ2lxxdXRzTpfh/JNWkWfP/vL1rW8pSZuzLtO8MDZiaa7jCHTJhb3D7QGtknaHUuAov43E7t3LfuET5yASNLPpOOdeEZH/kKkbI3hY2RrsrE1L/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884794; c=relaxed/simple;
	bh=6ZMU4lW6pYzhBZFEupznRgcRzfwIjb09StuSviQb75I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0gPBm9DeWu3gaTJiSfrp0sfrmlyTiwqjHO0uQhwOU43SZ1nGep02SHiZsg8MBsIIoM4f68zFSAu+LR9uDTIv6ioclz4q8BMby4TOUOv5MPfIGYqrO/lsBTKBfYkpzvxVffsUxk/Ts3nv2T+yesgFC/F8Ny+Ej6zabPfk8GBoIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ro1GsPx7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ro1GsPx7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44e1860558fso7385447f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884791; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+2Yg3h3w4EW69ErMpgIiqvay4KQaiT6UWDVBRWWf2Dw8VgCNtllwTw/c+VH2xYIf0
         Yu9u1VXRCc0L/ZfLElrOuprC7gh79KSXbRYgep0kuac3x47jWVG/7PT6ujf4uVpRre18
         YIvfzQu9+RteizeuvU1pOZKIVKgNDidX97AoP+KgkpXO41jE1oG8LQcQAWmOdZFnfMyv
         T/UtT3dtF2QlLZK0FcUiWzn9RdTsZlziTxQkQWAx9lXXxhBhNmXFtiVwLJjxK0id/dZo
         L2w13kLjHpR4AQsBiRoQ078C5vFA1ZCY3cHklUCkAGQ+hrNxi9OmIuhvYTZYDviaMVVz
         EBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        fh=WE7vQzIx3R50tf/4gk6Kl/XNButnjl7z5BARz0Cxw08=;
        b=H6VgKqAsuuvbobv6pegO1491GZVDGG3PJz/SeMaqpVWXUI5YeYcUJdHGVP+jn8iVoA
         XXY8+D1b+8UUCpz/IvtAzPelzukELOTG1kwJie5QX4aEj1GEC6wMnP95G45X/zfPziJA
         K3Mx4QuIfqndr8K/t3rdZ3F60GptY2MsUUwopkZh4Op53atZ6J4jeVjVd4GFLYS02Y1U
         bJgEp0xu5teHjbCKXdwbxSNBeCbDWO+/WJ5F4Zi7bXttAIjE8tLBM/Z82fzWrSA3ieDJ
         LTF8nwenQ4ySure792l4Z7qLiRNx/qnk9VTNFGykcpUN96UQ1c4IY/r0Rztxog2WZK0J
         um8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884791; x=1780489591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        b=Ro1GsPx7NSysyHsNIkceFw9DnbgIyzl6xXhF9rFe8VJ/6L1XkDeSlPSlstQ2U+ZAt3
         XbvA3EhFKsR85z0uy6XZLblornfRuGe/ZbzqF7VZ5yxg2Bjgg9xOS2HbWZBdOvdG8gwT
         2nKSeSwFAZD4ugNtMED5aamFGJw+7RvAfpicbicQOPj+1PKcPMLbIiA9mM9w7UG8LZIW
         PYah9ArBt0swN83uaJI/CR8NWOyJiGeoZiU92KNp1zWM/B8e00DKNTl5mMxOrdfwn6r8
         QL6qzPXq5DrzVQy6L7RUPs+2fgZe0tbs5btZdzHTa4EkWhXy9Mx+4QaYmVlr9KS9vc+3
         S7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884791; x=1780489591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0unYbIUfrk39HwFjBZy82CeKdBA84Qzv0p5UdmWw7Mk=;
        b=hJ09rXs+xEHCa3FxjcXkmiEduYH3RB7XSWjVZsIjUPIlW0EnEKiBcpvQx+7lxeDT2/
         Awl3KTYi7xwv2bGEP2WxIQ/fqRm/IM+dE+pDIZgpQrSL3BbzQTWNOVmkZjX5YljNEuaP
         29Nv5S1gQFX8R+JBq/Vd5fIAqw5XVR78UV5nu7Ue5GfHPsAGvIjDzlgKMMDf1hlCFJ+r
         Y9kpPadE0BOki4I6b61TJjU0xxQ0dRhNSJmGhhLkktyiCVUwI9N1EXKq8qRtYNs6PT+P
         gKHm8NznUsc+N2++N48s8KX0HvJe31j+jV1IpPP/yp/E1IND6n9Fmdi3s/U4gkSl5j5X
         zOhg==
X-Forwarded-Encrypted: i=1; AFNElJ/yfiRuMMLcKwiL/bO5PUFRk3FBb2tBSLNSQRwdN/WkF1ExW1DzZbitWELdIsjp0oeIQiEZKoKGzSjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+J1ggbKMbaME3GqEXOPmQVpS/6FdIUdiLB3PMYCr4ftQrCZfM
	3sSDnqYElp+1a8BBkPTAwyQC2RjAdSwkcp9MDwxxEQNyjUyJEw2cu44Z8F5EQMTU5T8yVdg7YZz
	W/xBrCvz7NRD3ZNr7QMZ/wrOcLzYGbbQ=
X-Gm-Gg: Acq92OExl+QIdUAWCTGaoUjWWIMMQuLwxZsT8kDqJ7Gk0ro5IUkOHRahTu1yl3gq0qI
	pDmU7nzFTVppyP33hxe30/Y8csWBNWa4FR9cCLFmxeZPTVXJ8B+Bqe0kKQTowOU0VUUTqJHtdEm
	Qc7bYxA9ui2VKT3Vs1T4ZApg2+QDWHlkNm/OS7a8thq/X9BDJYSQEZyJw1Jnfa7UaeHg8zO1F7A
	p0QDDwpK8nPczz4p8rU+igJ/RumgyLzHBNd55X0CYkqvxD5tToh2xZqrcRSTaVIog3wgPgexg4E
	YTb3P02hCTi58z3alXAmdtTfBA45diTmVBFWAUSS1OzgNRp0j5HSlR3rxoLkuvQ4tlvkXts=
X-Received: by 2002:a05:6000:25f6:b0:45e:9115:2982 with SMTP id
 ffacd0b85a97d-45eb38d8177mr37043341f8f.34.1779884791248; Wed, 27 May 2026
 05:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
In-Reply-To: <CAMuHMdV+6qVRJGUVe9noYWRnG1nEeq9SPJYnwsbOEpG1osaBVw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 May 2026 13:26:05 +0100
X-Gm-Features: AVHnY4JOosN5hDdtlUJOoB80nqu5nBarbvLX9T5TFXyo0j4X995ZvK_F-UFaGJM
Message-ID: <CA+V-a8v3+aK-+peT1G-raBMBKBshscc=pJh4mDgbTEhzpHHBYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, May 27, 2026 at 11:43=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.
> >
> > The xSPI0 controller is connected to an MX25LW51245 octal flash device.
> > Although the hardware supports octal mode, configure the bus width to
> > 1-bit (x1) mode. Enabling octal mode causes the BootROM to fail loading
> > the first-stage bootloader following a Watchdog Timer (WDT) reset.
> >
> > The xSPI1 controller is connected to an AT25SF128A flash device.
> > Configure this interface for 4-bit (x4) mode to utilize the available
> > data lines.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2025 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/net/mscc-phy-vsc8531.h>
> > @@ -20,6 +21,8 @@ aliases {
> >                 mmc0 =3D &sdhi0;
> >                 mmc1 =3D &sdhi1;
> >                 serial0 =3D &sci0;
> > +               spi0 =3D &xspi0;
> > +               spi1 =3D &xspi1;
> >         };
> >
> >         chosen {
> > @@ -331,6 +334,59 @@ ctrl-pins {
> >                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* S=
D1_CD */
> >                 };
> >         };
> > +
> > +       xspi0_pins: xspi0-group {
> > +               clk-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* =
XSPI0_CKP */
> > +                                <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XS=
PI0_CKN */
>
> XSPI0_CKN is not connected to the OSPI FLASH (zero-ohm "DNF" resistor!),
> only to the HyperRAM.
>
Agreed, I will drop it.

> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               data-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* =
XSPI0_IO0 */
> > +                                <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XS=
PI0_IO1 */
> > +                                <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XS=
PI0_IO2 */
> > +                                <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XS=
PI0_IO3 */
> > +                                <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XS=
PI0_IO4 */
> > +                                <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XS=
PI0_IO5 */
> > +                                <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XS=
PI0_IO6 */
> > +                                <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XS=
PI0_IO7 */
> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* =
XSPI0_CS0 */
> > +                                <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XS=
PI0_RESET0 */
> > +                                <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XS=
PI0_DS */
> > +                       input-schmitt-disable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
>
> As the three subnodes define the same parameters, you can do without
> the subnodes, and keep all pins together?
>
> Don't you also need P7_5 for XSPI0_ES, and SW5-6 closed?
>
Agreed, XSPI0_ES is needed (5: OFF, 6: ON). Since XSPI0_ES has
different DRCTL settings I'll keep it as a group but with only two sub
nodes.

> > +       };
> > +
> > +       xspi1_pins: xspi1-group {
> > +               ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* =
XSPI1_CKP */
> > +                                <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XS=
PI1_CS0 */
> > +                       input-schmitt-enable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
> > +
> > +               data-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* =
XSPI1_IO0 */
> > +                                <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XS=
PI1_IO1 */
> > +                                <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XS=
PI1_IO2 */
> > +                                <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XS=
PI1_IO3 */
> > +                       input-schmitt-enable;
> > +                       slew-rate =3D <1>;
> > +                       drive-strength-microamp =3D <9000>;
> > +               };
>
> As the two subnodes define the same parameters, you can do without
> the subnodes, and keep all pins together?
>
Ok, I will drop the subnodes.

> And SW1-6 must be closed?
>
SW1[6] needs to be ON, I will add comments for it.

> > +       };
> >  };
> >
> >  &sci0 {
> > @@ -395,3 +451,82 @@ &wdt2 {
> >         timeout-sec =3D <60>;
> >  };
> >
> > +&xspi0 {
> > +       pinctrl-0 =3D <&xspi0_pins>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +
> > +       assigned-clocks =3D <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> > +       assigned-clock-rates =3D <50000000>;
> > +
> > +       flash@0 {
> > +               compatible =3D "jedec,spi-nor";
> > +               reg =3D <0>;
> > +               m25p,fast-read;
> > +               spi-tx-bus-width =3D <1>;
> > +               spi-rx-bus-width =3D <1>;
> > +               vcc-supply =3D <&reg_3p3v>;
> > +
> > +               partitions {
> > +                       compatible =3D "fixed-partitions";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <1>;
> > +
> > +                       partition@0 {
> > +                               label =3D "bl2-0";
> > +                               reg =3D <0x00000000 0x00060000>;
> > +                               read-only;
> > +                       };
> > +
> > +                       partition@1fb000 {
>
> 60000?
>
Agreed.

> > +                               label =3D "fip-0";
> > +                               reg =3D <0x00060000 0x007a0000>;
> > +                               read-only;
> > +                       };
> > +
> > +                       partition@300000 {
>
> 800000?
>
Agreed.

> > +                               label =3D "user-0";
> > +                               reg =3D <0x800000 0x003800000>;
> > +                       };
>
> Given this is a 64 MiB part, I assume the reg entries are correct,
> and the unit-addresses are not?
>
Yes, thats right.

I will address the comments and send a v2 for just this single patch.

Cheers,
Prabhakar
