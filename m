Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36E3B6354
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861553; cv=none; b=EMdv0QSXXMqM+O9D1U5WresddTX9hY1uZHanujGPssPlZAmaDqwaEAw/PGrlgNxZYBM7bXIixMoq70xoLg5uJD2COCgmOr2ukogv67EMuobNNXGMC73+ESIZxX/NOvk3vkdpWuTYccrx2vhupwKnHvHXMAdPeQHebv5OZ1b07IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861553; c=relaxed/simple;
	bh=ajfMeNlbacyrJhotvON69vV08gKAAPbB+tQGK/f4yF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uV8R2CdrSuvWQ6LIypDXxl74EayJ3Wz4UGJBhs9onqRh1+Y2VGT9LgYG1cd11LlEQDlhpj9i3t/mTEhfHwgv3WRF2xUImivLb18HFEnGzJCEMdoiIqX8zi/PGHih/tZP0JB0K/HGCKDWZ0xuteNUr5DOf8tvSQKdP+YpnWvbMjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNsiVpgz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNsiVpgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE04C2BCF6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861552;
	bh=ajfMeNlbacyrJhotvON69vV08gKAAPbB+tQGK/f4yF8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lNsiVpgzp/XRQAqxwaKH8NMC9j740bxLutzSLti6/867t9T6oFIX05Traa5lD5Nh+
	 QlCJAfzz796aQqNjkyXOObduMn9RyJ7i1k62pLM+jQXG1O7enPpH6BhoSgW+32+UJ5
	 s6PNasBCryu59ytr6teI9OLO88zIhs5SVmLvmOumTek3x62V/gU5aUeF57E+oJ2IA1
	 rs+9k5mA/O7Bk34GKOARd0wm8SZSKRIXQrUFuANdE5+jvhE4IWOHMyiZsHJOCL6T20
	 /M7G7Y+OKX/TlsM60dkUS1hKzzhfJnrqTsfZjxj0WjeJqnQjz3inzIZCz3jUknFSah
	 74iL8643V8RnA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-394413a63d3so221711fa.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8b6fzh4BQX2Uj7zwJR8qSDQ0qQ1GjaAQZOvxhrqw6cLQ+r4P5In8OM/fXyRYEgJBndWzOxqt67oPTv@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSTiTzXQadvlT8VqiZQhlLEOdoSOT/D8XiJybZkngFOaZLWa5
	+vsFuEk0femD8dzQzyo5vQ/9cFN89pE3OmzW7BjNTBI+bh/MHCVVcQKkkl5May0DCnzq792emTE
	UMxGdIFg6WZC/Zy2iXB/Na2RkMRWcH6A=
X-Received: by 2002:a05:651c:1593:b0:394:331:c26d with SMTP id
 38308e7fff4ca-39561c07bf6mr16170691fa.6.1778861551206; Fri, 15 May 2026
 09:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511221741.25888-1-andre.przywara@arm.com>
 <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com> <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
In-Reply-To: <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 16 May 2026 00:12:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
X-Gm-Features: AVHnY4IAiy7whTy9FnGtvfBRFabJs2Ii_3tvaDmPh7Gdax0WMKu2QkVOACnxggs
Message-ID: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 5:19=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Chen-Yu,
>
> thanks for chipping in!
>
> On 5/13/26 07:21, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> >>
> >> The Cubie A5E board comes with 16MiB of SPI NOR flash.
> >>
> >> Enable the SPI0 DT node and describe the configuration.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> ---
> >>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++=
++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b=
/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> index bfdf1728cd14b..7ad22fc85d1fd 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> @@ -344,6 +344,21 @@ &r_pio {
> >>          vcc-pm-supply =3D <&reg_aldo3>;
> >>   };
> >>
> >> +&spi0  {
> >> +       pinctrl-names =3D "default";
> >> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> >> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> >
> > This whole thing needs to be an overlay. The HOLD and WP pins
> > conflict with eMMC usage, so it seems that Radxa only populates
> > one or the other.
> >
> > If you look at the pictures on their official website, you'll see the
> > SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> > page, you'll see the opposite.
>
> Well, I have a hard time spotting any actual eMMC SKUs in the shops anywa=
y.
> But you are right, the hold and WP pins conflict with eMMC, whereas the
> other pins are not.
>
> > And you probably want to enable QSPI, like Sashiko mentioned.
>
> Well, in the interest of keeping this simple and enabling the usage of
> SPI flash for all the users out there, I'd rather drop the extra pins.
> This is mostly really useful for booting the firmware, maybe loading a
> tiny kernel or other data once, so performance is not a big concern in
> this use case. The BootROM surely does not use QSPI.

Given that the pins are tied on physically, if someone then enables mmc2
for a potentially present eMMC, the two pins could be toggled by the
MMC controller, causing the flash to misbehave. I'm slightly concerned
about this possibility.


ChenYu

> And as you say, if people are really interested in the last bit of
> performance, they can use an overlay.
>
> Cheers,
> Andre
>
> >
> >
> > ChenYu
> >
> >
> >> +       status =3D "okay";
> >> +
> >> +       flash@0 {
> >> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> >> +               reg =3D <0>;
> >> +               spi-max-frequency =3D <40000000>;
> >> +               #address-cells =3D <1>;
> >> +               #size-cells =3D <1>;
> >> +       };
> >> +};
> >> +
> >>   &uart0 {
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&uart0_pb_pins>;
> >> --
> >> 2.46.4
> >>
> >
>
