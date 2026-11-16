Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824716;
	b=y3USbLO/rKh3ybPJehE1r4rnpsq+aDXXnRT59QReFToQBtWjcLG3+wX8OnxZ5+WgbFmg
	 E7309iG0XOPLYsUb+7iH28DBSVk01iALiR45X7pyWs8cF2khydPFXZSKzZ7dCxij71vqD
	 VyBfMgsU12nn2CY53NoYkARYSA4Dxaykc/6DUvJHv7h0gB00s6wLYDQa7dsyh82KQ6LdP
	 dutQ2Yb8KswkQaa65kEg5d7EM1mvFejTr5i64xHRErzMl8GK52cKmUHyS8jQ4/8bEu17F
	 QrBr49pRkrRfcsNzFNfca85jqJWRIlc69IbJf94wpvee0FIgMUYbLtT5ge6WY3TPJiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
	b=mELHvPnsZ6s89Hqni0AdAxTLD1FxK0n6JK4sDmA8pzlDiN7vU64Y+32gbw02BmLPDqJE
	 sWp9ClskkG+52TZ60AKNeE0wbICQatASC+OjT8GWQVUJIcrzXgunkzhJPsHD1lK2ihS3F
	 PL6YlPz+55yTEnZ1AjUcBMb8shKK6NpBMkiRLyDNfOpjOhc98bCIpaPrjRBM5ZdbgGgU6
	 Cl43187XF6t+RslfVc83rlbiySRdFqnSxCvphaG3qB3KSVwV/Ebgx7j6PhTfKqvYX6Par
	 V3SWg5lu6NzjaUnqGl0k9fDalQ2mFlxzf2C9gtRpPcpdAlxI41/DNEShxO/GMTYQNfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypD4cjus;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77733606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77733606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypD4cjus
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-537548b811aso22253131cf.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824715; cv=none;
        d=google.com; s=arc-20260327;
        b=ViRQ544YQws5F45lTXI4GGBt69/L7JwRFzG3BNYCtpijmOzsmzelDlUoOoncOp16hm
         Amre+hIxPCHRjygJyOQiIOlemzIycFtXkLsS25SyeTH3QFXqc0xa7bCInTNjksADbJEI
         4WoXhXrOJu7RVBn6MD8pjmlfYD644uu15As+vxWVDrz+WJQbXwMsAwg9g4D1k6ZgIFHL
         BMb7l7ZWB7/dxK7xvC1Vy1z++YG0ZbQdUWHlyMH40ky4oa2V+qDhj6GPWiJHYS9QsMz8
         k/Fm1IPayZLnqNl0kafvwytihQIY9aEDrltqGkIJHHOo7q+6/uUQI68zfSKWhn+NcWhz
         gYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=i01JmD0NFbou9FNBNkHXQSRPSwVPgrqn+XDIW7IW4Lkz8lo+IiePqgsql/+xRQFAta
         JcXtt4N4jvesQPFDa8qlByed0ydsD41OokOkFjbs+3viT7/BNSnOOfPPWuXNIzIHDI/V
         /quwJCcynI5RvMn1XNGExM42U34qZDTM+P7TQe7Uv1BiRB7VNquD3NPdBNKGomCOhnmC
         i/hoxk3kRc35irjndcoo5rNdvPwnYqsr8A0E3wCLDz9tCEG5dFL2GSMWEMOLTqIe4Yff
         NxjA7JzdTF2NywHQJr3h3OSmN7g+Zv6S1bCwOxkcsLY74qd16xlywmrjMBRZy9Ai9cgG
         ixBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824715; x=1795429515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        b=ypD4cjuswqAXcR7m2I3FYt61Mr4TAkime2jKwPfyDkA0ZuFufBbNqtBWCe9+MDLB7l
         qzmz1v7LgYkQTVzmdM7Npebf3eMADkVjo6SQlOJDrpY+WJy0UWT04CKEP0NAgbbBi7f+
         hoOGd6dsBBLNw24YxEFxKKEQwsjmZQHaPKLgcDnRxyZk8iHQUujzV0QJesbwg/By1N80
         4hOHecijBlvNlCRnCoLyqPqpm0jOeqM8iYmzpKBX6s9lkeZ0TCI0bb2804ig+BSPP7ua
         THwaTewbsdwhh4EzPNE080JK4OgJf1o86SS1dEYKA0T+U/iAWGgeeaCHssll4dR7cVS9
         C2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824715; x=1795429515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        b=ijWfCRx/d+zhRL7rySRgZP8dQ4/+U8uBibrKbj46lRzfaNdVRpMFs4amjZiEs3As4G
         goG6VG2bkZJWuSl2emZ0DOvzB4DvwkG5FDILNsykBz7A4lUf2qwW2/4WWz2ALjSk8u0n
         kqpVEXhFXVLx64gnhw6JeF2cUgGiCvFRVU71DxB2lJCIxtJm9VyOEXA7G//5DrPm1t8G
         J/wvrgyqrB79j+LtIRO3b6OwXchCNruLrYIcmwKRRF1esWOhuL6BZslHlIfjQr/u5TSC
         T18AZcMcWFY667U1H8csN0lHuFaB1h+fhFN6zncP8+yP55FryC3JV8eys52kOP6BCAmt
         gV7w==
X-Gm-Message-State: APuU4Z9FnpZf9yMmxk+Uw0F4hLFHxjyUqBoTCoXlVEVfwR3dyUGmVmeL
	9BHjE4IoWHW7/H5b0TPEjNEBE1OfivXS/AXLoXngN/3VVMjqkjfrVXyBuEb1l4GDKNybDaiXoE9
	0TpWeWeXBBjypE5vWaVqZd9sg3q/byAg=
X-Gm-Gg: AYBFou35N9FD/AVmcaIyPaZJ2+swlziqDrMjOeCbZpldjjrE8EttgdGlmBY2caHVQ3Z
	X5EthAsfD8w0hua6+StTt+qHxkFaKXomACQ///avNZdJ/eURWmPUx5b1tpgo4V2hxzKJxXqWnaL
	PhK+yj84TfJN9N/47mcG6VB/GwUjAWTx6pI/Blnz2E67a4IYIDUlb4uOTKHHVaQUBPxW6XQ+rEj
	C3gWtoW4Vvtc+hpF++id3mugmpgMbvTCJVlQRBLiOzw7Q9+JAKBiYYlvmc7UooNYonpM7VhIqME
	3afBUTkaYQhXvKM0T8IqD74i+ZBx5IecPczyr/7gb36NCLrZbNg6Bk609Tz0hQ0bzmGE0aVWt8c
	ggsnkm3xMTFh5mSNMHyT+z/BjfXqwIPoHryV3mD4VYScEDihOUdknxi4r/DS+898N5dw7Jg==
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id
 d75a77b69052e-55c37c1b4b8mr115585791cf.77.1794824715319; Mon, 16 Nov 2026
 02:25:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com> <sashiko-outbox-211760@kernel.org>
In-Reply-To: <sashiko-outbox-211760@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:25:03 +0000
X-Gm-Features: AclHuK8X75tCZs1GrS1mQ7GgS6O10f61ls9OHBbkjwh4tusAHwGuZrKUIJeR4cY
Message-ID: <CADT+UeBxUecV10oAzTDn+rPas43iGLgpuHKHYZUKd_o=gN9Znw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
>   clocks, and resets
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: sdhi1 left enabled
>   when RZ_BOOT_MODE3=3D0
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: missing pull-up and
>   no-op UHS pinconf
> - [Medium] arm64: dts: renesas: r9a08g046: SDHI power-source not wired
>   in pinctrl-rzg2l
> --
>
> commit c182c80f2e51018770e032cd10fb901dca56ea0e
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 p=
incontrol on SMARC EVK
>
> This commit adds device tree nodes for the three SDHI controllers on the
> RZ/G3L SoC (r9a08g046) and configures SDHI1 pinmux and voltage regulator
> nodes on the RZ/G3L SMARC EVK board.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a08g046.dtsi
> > index c63a857f0e5b0..3665ccbdd91be 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
> >                       dma-channels =3D <16>;
> >               };
> >
> > +             sdhi0: mmc@11c00000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> > +                     reg =3D <0x0 0x11c00000 0 0x10000>;
> > +                     interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI0_IXRST>,
> > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: High]
> Can sdhi0, sdhi1, and sdhi2 bind to the Renesas SDHI driver or pass
> dtbs_check with these properties?

The dtbs checks are passing.

>
> "renesas,sdhi-r9a08g046" has no fallback compatible string and is not pre=
sent
> in renesas_sdhi_internal_dmac_of_match or
> Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml.

That is correct.


>The binding schema
> also restricts clocks and clock-names to at most 4 entries, restricts res=
ets
> to 1 entry without reset-names, and only permits the vqmmc-regulator chil=
d
> node (added under sdhi1 and sdhi2 below) for "renesas,sdhi-r9a09g057".

Binding clearly specifies 5 clocks/clock-names, 3 resets/reset-names
and optional internal regulators.


> In
> addition, renesas_sdhi_probe() only requests a single unnamed reset via
> devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL),
> leaving the axim and axis resets unmanaged.

These resets are managed. see below

priv->rstc =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev->=
dev,
NULL);
if (IS_ERR(priv->rstc))
return PTR_ERR(priv->rstc);

priv->rstc_axim =3D
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
"axim");
if (IS_ERR(priv->rstc_axim))
return PTR_ERR(priv->rstc_axim);

priv->rstc_axis =3D
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
"axis");
if (IS_ERR(priv->rstc_axis))
return PTR_ERR(priv->rstc_axis);

>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index 5289efd1a430a..0b6b7e109200f 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > @@ -14,6 +14,7 @@
> >  #define SW_GPIO4             1
> >  #define SW_I3C_EN            0
> >  #define SW_SER0_PMOD         1
> > +#define SW_SDIO_M2E          0
> >
> >  #define PMOD_GPIO4           0
> >  #define PMOD_GPIO6           0
> > @@ -38,6 +39,7 @@ / {
> >       aliases {
> >               i2c2 =3D &i2c2;
> >               i2c3 =3D &i2c3;
> > +             mmc1 =3D &sdhi1;
> >               serial0 =3D &rsci2;
> >               serial1 =3D &rsci3;
> >               serial2 =3D &rsci1;
>
> [ ... ]
>
> > @@ -175,6 +190,68 @@ scif0_pins: scif0 {
> >               power-source =3D <1800>;
> >       };
> >
> > +#if RZ_BOOT_MODE3
> > +     sd1-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd1_pwr_en";
> > +     };
> > +#endif
> > +
> > +     sdhi1_pins: sd1 {
> > +             sd1-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_C=
D */
> > +             };
> > +
> > +             sd1-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_C=
LK */
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd1-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             sd1-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +     };
> > +
> > +     sdhi1_uhs_pins: sd1-uhs {
> > +             sd1-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_C=
D */
> > +             };
> > +
> > +             sd1-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_C=
LK */
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd1-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
>
> [Severity: Medium]
> Should sd1-cmd in sdhi1_uhs_pins also keep bias-pull-up like sd1-cmd in
> sdhi1_pins?  Also, neither sdhi1_pins nor sdhi1_uhs_pins specifies
> drive-strength-microamp on the PG0..PG5 pins, where PIN_CFG_SOFT_PS only
> uses power-source to select the drive-strength table.

These all are uses reset values as it is sufficient.

>
> > +
> > +             sd1-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +     };
>
> [Severity: Medium]
> Does setting power-source on PG0..PG5 in sdhi1_pins and sdhi1_uhs_pins
> actually program the SD_CH1_POC register during signal voltage switching?

yes, it programs  SD_CH1_POC.

 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),


 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),

>
> In drivers/pinctrl/renesas/pinctrl-rzg2l.c, r9a08g046_variable_pin_cfg
> configures RZG3L_PG pins 0..5 (and RZG3L_PH pins 0..5 for SD2) with
> RZG3L_MPXED_PIN_FUNCS(B), which sets PIN_CFG_SOFT_PS rather than
> PIN_CFG_IO_VMC_SD1:

See above definitions.
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg2l_set_power_source() {
>     ...
>         if (caps & PIN_CFG_SOFT_PS) {
>                 pctrl->settings[pin].power_source =3D ps;
>                 return 0;
>         }
>     ...
> }
>
> Because rzg2l_set_power_source() returns early when PIN_CFG_SOFT_PS is se=
t,
> switching between sdhi1_pins and sdhi1_uhs_pins never writes to the SD_CH
> register at .sd_ch =3D 0x3004.  Similarly, rzg3l_dedicated_pins defines t=
he
> SD0_* pins with neither PIN_CFG_IO_VMC_SD0 nor PIN_CFG_SOFT_PS, so applyi=
ng
> power-source on SD0 pins in commit "arm64: dts: renesas: rzg3l-smarc-som:
> Enable SD/eMMC on SDHI0" fails with -EINVAL in rzg2l_caps_to_pwr_reg().
>
> [ ... ]
>
> > @@ -230,6 +307,17 @@ &scif0 {
> >       pinctrl-names =3D "default";
> >  };
> >
> > +#if RZ_BOOT_MODE3
> > +&sdhi1 {
> > +     pinctrl-0 =3D <&sdhi1_pins>;
> > +     pinctrl-1 =3D <&sdhi1_uhs_pins>;
> > +     pinctrl-names =3D "default", "state_uhs";
> > +
> > +     vmmc-supply =3D <&reg_3p3v>;
> > +     vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> > +};
> > +#endif
>
> [Severity: Medium]
> Does &sdhi1 remain enabled without pinctrl or regulators when RZ_BOOT_MOD=
E3
> is 0?

Yes, this needs to be fixed. on the else case status should be disabled.

>
> renesas-smarc2.dtsi unconditionally sets status =3D "okay" on &sdhi1, and=
 mmc1
> =3D &sdhi1 in /aliases above is also outside #if RZ_BOOT_MODE3.  When
> RZ_BOOT_MODE3 is set to 0 (routing PJ0..PJ3 to JTAG instead of SD1 CD, IO=
VS,
> and PWEN), &sdhi1 lacks an #else branch setting status =3D "disabled" and=
 will
> probe without pinctrl, sd1-pwr-en-hog, vmmc-supply, or vqmmc-supply.  Als=
o,
> SW_SDIO_M2E is defined at the top of the file but never used.

yes, it corresponds to default switch setting.

Cheers,
Biju
