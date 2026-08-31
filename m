Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCB3AF66E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180441; cv=pass; b=iAzdyvK0RVfNrLBmEVdpmSzaK5eZj2Yf28gttcl1+vWINi+6LGKKXAjLHMwstQlyQDz35U0eLfbXpTImYG+gX8TDHoLnDh58TdbG0fPthHmSD3Q/J0/g6KIhIEf4XstDb9NrajGHoN32kg66A+iHYUXYXp3eX3d9xBzcFXAgvzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180441; c=relaxed/simple;
	bh=Se/KxHv+wKCtXiceCMCBlL7rWl8p/0OTHf8X9oOErOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMuLFI3VfQd6MLW63jPcTVf+McD9ikGXbT5o3zwH96qxyn1PcvNIc7KuAafTkzp0SnQdvYHL1/yw1mJH7r49oEHrBbbk6JadM5mR80X90YHoArtU4+1RcU+hqyi0YhMhWs93K+bX9ezEpaSSpZfOILHUClWdRNkT+cqF+A0Vf9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaRhsqXP; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaRhsqXP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c252e703fa3so504527966b.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180435; cv=none;
        d=google.com; s=arc-20260327;
        b=C27xhZJYRWxMelySmaWNlp7iqPTeIpglfvWy+qmejIOg4nUpHN+NTqn1uDFW0FmzyF
         WYvpo/AJbQL0B4DixwU95vpU52ScQL9XL8IK04Tda3BeqcjRuvEnUSEatRf+bV2uUzud
         SfrTxOMhqn1kTB9AnY0Nfj6hA8wpUux7lmF0UUC0vv36tbGqambH4suyQlwpioSvIP2f
         YG11TQt4AB7fUZZ3DkvuedzDLdyzeCgLV/5X4fIVhEGYYBp/0Q4AfLxCB2k5/upqOzBQ
         KhgV+Zcg1s4kaY+ePGzobsVLS5jx1GhREgTCG9AmLhkFdcZoum+ZjVcHIlwsf6jtoRDt
         dJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        fh=242GFB9iudUHxPWAXnl2o/LHSKfYNpVzvvH+ihEg4is=;
        b=jJWFPUNWhW6oFLomhT2hcIDZ9z7yvZbWFh7DL/+rhagHARwamk/cGa1fVeicEa0A6y
         8G3T6s3zybhicwjWjVuUfCU7zqO+arDCdQ4djRiyM/9VdDar+BIt+FW+OjbE8ZvbqYe6
         PPozieFPpAnT1qqmcX8ApZ+Y9LKHhXO0cIRWOdWoNk2Lvh7QOngwa7YsRjEaiVF3iQPd
         k6NaQUqFjaz0pcXdyeCY1zZadzYZMrVDbXM200S2l4kri2ASi4OQq/pQzK7Z3gFtWj+F
         12TTJfpAhMmL0KpV6eLDI4UWi8LAZgFnAIToUY2nSlJfzDw+ctfp3sJQUl2U8cWxTAWh
         qgoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180435; x=1788785235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=HaRhsqXPzPom2G0Rk6v20+cLVhq93R4JinVaHq11h/DMVhiDOYorJMP/A6KWvhAw2Y
         jZc2VbWjUmLrBaQxviryyYfaoZHfrDqv+RUjfxYG1hN2Jjm4VDihlAXyvzQAzCV4lPdZ
         7JParGxkKnktq1E4enxBxEuYG0wnMNHNpFwvA84Mzts0phjxAg2RTD83f1DuYQQwF/nr
         dlCeK7SEMg+6AHcxDxw3bNd6aeZ1bwXCPloTJt2+WGAh3vVmq0mbJnbVoq3XOo+l04K1
         7ybjnEWO3UiD5zdOwKDyNk3JalVfd1eqxAdw1YXz2T+LcfRoxzuTRB7PJzE34lBZGbYn
         PM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180435; x=1788785235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=fCzcUr7pZYeWzsJxBgRAH6UOmfWOSOzqSuUhH3ABhMx/qnrHkWBi5hx1eFMWO9HK4q
         HlAn2c2tPvDNiWX5LekwYMgce+qvN0rZICUd+iOarr761YUB2q2lBbN6FYBGfgGRoYjD
         IhsKMkkDiPoDgGPaF5HnS4SDU4GSOAk4uZHXeyKr5OhpFpkXHKl1+BjVGcsnRo7UkFZs
         X6YrsFXqawhL8sOdsEdXhQYtMNgdX3XNwwmdlGNA4t+lABFUsWio1nUIgkMayix0RtuF
         3pzxee5GiZro2kRwI2JTFtsZelX8pBGLBdTkUU/nGHymYidPkR0x05QqUVz3JOP6InJM
         8XBw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ6fdaFDiTb49WJL5MPWi9h6MboRCXi7E/7lnabXcr738tqLzaidnkFSHgrXGu7ej25C7OJb+5289M@vger.kernel.org
X-Gm-Message-State: AFuF++n2RolK0Wl/3mf0Pr2/YMPTZCiGG/W19PLVXP7TRYQr8TA3uOWG
	gBIbEEBy+lOkf71RI5S+GuHSFHuRsMvxDhrWyN63c9/GzBqXCHY4FSV2/O5oX2h/SH0NkLnefRK
	kMxeu2VZ9LYAYhadsHUYB+g8j/fwG4r4=
X-Gm-Gg: AR+sD12iy/B6Rb8NkMmOyPRg74CKuQ5vAHXausi75wnHdo2lfVXRaBcSiQ+zOhzJSJf
	tD9THB0GL4Ppl2NrHy/8VsXSoaDfyPNBFvPwdWswUeW5xQie0VVRCeCJJFm9dEQ4DMdtrQHiVX1
	eg/jWuzYqExY8BnVz3F4GI6X/HRLfcZxI4x5REmoddTNWDlI/vyM3vdfZ0udXEy7IzEZDV4CCR+
	fKbvB8ztkrAf1ENhSXtwLV+jUyt/H18QQ5p16fBXQNOE942Go7WQmtPV2z02ex5UvCnkXyBgWUC
	kwRm2OB43fRH3B8zItHsaHQP4sEQ4FvNPU3et+B7NsSnWQ==
X-Received: by 2002:a17:906:6444:b0:c16:101d:7afa with SMTP id
 a640c23a62f3a-c25b3cde78emr15785266b.16.1788180435211; Mon, 31 Aug 2026
 05:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com> <178817979463.20922.10263529532171804189.b4-review@b4>
In-Reply-To: <178817979463.20922.10263529532171804189.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:17:02 +0530
X-Gm-Features: AcwNN1XIrIC7I6xOS5BaNQ3PLnAnWSJKPgHogQbkIGatLAVm1UY68sNUIGJAplc
Message-ID: <CAMFFDGi5eb_+ec5hGz6nE7OXpqYTMg7oZSPAzttXDPZJZw8v2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks, this is very helpful, especially since you have tested the same boa=
rd.

I will rework the next revision to use the existing ASRock Rack DTS
patterns, including the I2C7 EEPROM/NVMEM MAC address handling and the
standard 64 MiB OpenBMC flash layout. I will also investigate the
GPIOs and video memory reservation you mentioned.

For MAC0, I will change the PHY mode to rgmii-id and remove the claim
that the board requires RX-only PHY delay. I will also investigate the
ASPEED SoC-specific MAC delay configuration and the difference between
upstream U-Boot and openbmc/u-boot before sending the next revision.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 6:07=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> Hi Prasanth,
>
> On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console, and
> > MAC0 connected to an RTL8211F Ethernet PHY.
>
> Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128=
 to
> populate the MAC address on MAC0.
>
> >
> > The MAC0 RGMII RX delay configuration was validated on hardware.
> > The RTL8211F requires its internal RX delay for reliable operation,
> > while an additional TX delay is not required.
>
> No, it does not. The traces have the same length and don't require specia=
l
> delays. If you use u-boot/next, then it might be true because it still mi=
sses
> the correct SoC-specific delays. This is, however, fixed in openbmc/u-boo=
t.
>
> I know that this is not optimal. I'm already working on getting this fixe=
d in
> upstream U-Boot too.
>
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 6b68671f9379..b109491d5c8f 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-ampere-mtmitchell.dtb \
> >       aspeed-bmc-arm-stardragon4800-rep2.dtb \
> >       aspeed-bmc-asrock-altrad8.dtb \
> > +     aspeed-bmc-asrock-b650d4u.dtb \
> >       aspeed-bmc-asrock-e3c246d4i.dtb \
> >       aspeed-bmc-asrock-e3c256d4i.dtb \
> >       aspeed-bmc-asrock-paul-ipmi-card.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..aa623f0ca36c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,95 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
>
> Where's the reservation for video?
>
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
>
> That's already defined in aspeed-g6.dtsi
>
> > +             label =3D "bmc";
> > +             m25p,fast-read;
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-rx-bus-width =3D <4>;
> > +             status =3D "okay";
> > +
> > +             partitions {
> > +                     compatible =3D "fixed-partitions";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +
> > +                     u-boot@0 {
> > +                             reg =3D <0x00000000 0x000e0000>;
> > +                             label =3D "u-boot";
> > +                             read-only;
> > +                     };
> > +
> > +                     u-boot-env@e0000 {
> > +                             reg =3D <0x000e0000 0x00020000>;
> > +                             label =3D "u-boot-env";
> > +                     };
> > +
> > +                     kernel@200000 {
> > +                             reg =3D <0x00200000 0x00800000>;
> > +                             label =3D "kernel";
> > +                     };
> > +
> > +                     rofs@a00000 {
> > +                             reg =3D <0x00a00000 0x02000000>;
> > +                             label =3D "rofs";
> > +                             read-only;
> > +                     };
> > +
> > +                     rwfs@2a00000 {
> > +                             reg =3D <0x02a00000 0x01600000>;
> > +                             label =3D "rwfs";
> > +                     };
>
> No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.
>
> > +             };
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +
> > +     /*
> > +      * The RTL8211F provides the required RGMII RX delay. No addition=
al
> > +      * TX delay is required for this board.
> > +      */
>
> No? I do have this board myself with a custom BMC ROM and I can tell you =
that
> you don't have to set delays other than the described SoC-specific delays=
, but
> this is, as mentioned, already done in the BSP. (And no, I haven't upstre=
amed
> my DTS yet bc I haven't had the time to do it.)
>
> > +     phy-mode =3D "rgmii-rxid";
>
> `rgmii-id`
>
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
>
> No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see t=
he
> other device-trees for ASRock Rack mainboards.
>
> For me, it is a:
>
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> Tan
>
> --
> Tan Siewert <tan.siewert@9elements.com>
