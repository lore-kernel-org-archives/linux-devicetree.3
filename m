Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824747;
	b=PcPm9TjVXFmnM9aAf6T31IkNqhvUnyEXMm3Tfmtt88eWDzTWRlYR8PvxosQXJgCKRu0G
	 fErmA0/oOvynr6lU1xL2htPdzkpZKDi7BXZfSvEmkUmYVZjOXnVbxqxoJPKFdwvUGm+8s
	 ZW9R8a0lV9VJlj5xVd8XTvNW/yXDMqg4pY35S1TNVS3Pjfyp/BkKlxWMzCXxIXQ1Kgp5i
	 TEbE6RmP4oZ2vMpEg43mjpyVJRMbpi+/5bjzxhalcPGfx2/6vTrkffiijTl6alFHKF9Hr
	 8sTiu+ZVZF0MKsFF/LZAP3bmFimc9+pMaEs6HSDqbRlidOncSN67is+c4Ez9pe1r5TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0XDjbp+Hr2IX5Ge48cV7KKYqG+NcCpQTMYHRwi2dGjw=;
	b=j1yp++g+ThW/Vr4YuXrfVlOUPb627WT16sTUuJRTRatsN3d89C0BeZBZlh8992qMtqC2
	 CRekqOywKnWpgzTKE6KsCDdyElJgiT+U8FuX+dFbcMHkp6D1YrInEcJcD5i8+lc+h6z0U
	 f/qSiqb/w7KuZ7gzd34Q6XyW0gYACJExnoK+UPQ0wxzVBvvSaaRksjvfp4OI+qHa0XGmE
	 xdN+PBWvF3v8ytZc9tP17/lnZ1V2uOUKgUiacWBveAiyqb7AzkTuCpnxcoejYGzd0g1BH
	 18Q1+uNyHuhyS1XIZDAvYRy5m5evwZM5RfH02KjZlvnS/ax1AjNU1CvU4Ed9yGjNSeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEyGhZUM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE0606A339
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEE0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEyGhZUM
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5430f70c827so46898821cf.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824746; cv=none;
        d=google.com; s=arc-20260327;
        b=r7E0fd6G4ugG9ONd0THaZpsYTl9Fv2AkFQi1Hgh06ZL5fwMJurET3KoCsMKGCoFg49
         TqFUwalIHsrTgcS7RIi0WQeiXY8t4xOqpG7oEZg+jxFKQh0KWgykAlTPemiKsR1dGoUU
         eBjNR2/CqulFJWkfMAk2uDaogiB+EE2pZYlZbttNFzJnWFwP9dtgsDUoEhlwuETi3OqP
         2P8kkvOxcDXSruR/U6XhmIZOzArfyYnxydrlVDZoYJMTX4rRZgPxGxdFqVchpGT9cvht
         9hzCc+Czr2KHmIXQNowlUZ61WOI0W2w7yNDiOlgtwn8jtllLH1ujjX0wTyAh1bwSLENp
         nJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XDjbp+Hr2IX5Ge48cV7KKYqG+NcCpQTMYHRwi2dGjw=;
        fh=ngyFeA946UJ3V8f9Jet2Gigv3EE39eM2582I2LMQU3Y=;
        b=Nw76zThwZIQ7Otpbm9zy2caGkHp7sk66oY07wwqiG20xxGq3zcXCBGJyoDvKzKT7TR
         Ocbi+kH88cbfE8xR4JsNljxBpo5hGyGaQLsgInEe82L4OKeae/TYQO6dSWlesqWAxBPh
         6V2bRTaetaadRHviqwV+HP23aYjA6ty8GyhKK4lY8uL02tEwGOoFn4M1244/NJWzB8ke
         +akDUEX3DJMGc0b2qF6jtUI421RPt80mYPJskf/qCMvOztr5a5ryzZZcxWRCedROI3Ve
         trbZDpMyTi7SbIuxzxry6h3myfGsMWnq12KwV49a6MgJ5bdcitpx/cAol15VGTrp3Kb5
         lO/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824746; x=1795429546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XDjbp+Hr2IX5Ge48cV7KKYqG+NcCpQTMYHRwi2dGjw=;
        b=AEyGhZUMcZpQqrBmVqU+z3dbybjq9z3X7LqRfbcpCs2wZ4H0kPBk2rwN44Kks6Y9Pq
         mWWOq+koVEKme0JQ9Nstwpcx/Da5o6Jr9HKz+886fv8g5BL3wlXVAgcBI0rfybLnkA0o
         dUa4X9WkGf2UeN0ZVQAp4eRoYzrAp1Gt8dcGf7BE5AwMcUvTVzS7Mp84bOuckXsjmbeC
         a2QXePZ/MYabP00/DYAma0iDfcnmGoK0MXc6qxVfwVCOc0nFqT5TRhsjMwHlSb7ZT5LR
         VcNP7NyrV5RHheMg6M6QnPZgmYECgWOCSPdmdHPZySb6CDBKQMTDBwuM2g4Ex9Bs1WEu
         w0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824746; x=1795429546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XDjbp+Hr2IX5Ge48cV7KKYqG+NcCpQTMYHRwi2dGjw=;
        b=UhkdctH3A/dryKXlLcx8u9hxbTE3vspA2P7sbG4/4jJ6fisxZbKU6IFM5aEsrCLOJf
         xtLh9D7BBMnPt57sfrK2dsEUcWMQZBJceuCrBDwKL3VFMu85HZ5W1cjX3Js6sFrrCkgP
         8wDJHU8XdtTHdU1qSXveWhTW26txoDCvTGlLfppXit4o6QnWPVt7hEn22uxZLoGAaOOC
         jAs+TdKQtvHKqq8CXlUHWvRALqMcBmA0P+5LIgTcXHUlXrV/6ObWnptVgpInQYqIw1Ls
         ery32E0yfwZz1gyOVoY+JnA9ez8m9+VYOlpSGQ9x35G7K7gHiXAfEdySfvF1Z0a8mFfP
         MZXA==
X-Gm-Message-State: APuU4Z/SF93AFICwyD+Vd7pZewP7tFwUCTGTXJXO+JLRTTFypMy5dYt7
	U3sKKMlxsfRjQ0BWAIjdEqnOVYCG9WZfKQ7trJ+e37EqosNTC/kC9ETjxc1dcgFqIANtrKCuK5f
	qxTyGnzuONw9PF+Mc9xm3d724XhnZtjc=
X-Gm-Gg: AYBFou00tmbZ8gu0u48TZdUTX5St04T0DRDMqQJLSJkDY1bxerQqGciULwcWQEHsOhL
	JiTVvQgk0aetAt5Wb5Dwa1fqy7nB6hT7/9u3/WoKMUfzIUK7cfMT1JRpQCsU2tvLHdq/mfGEpNe
	+ZsU4/tH/92T5vvwSaxhL1qPWGppqLEULIkUxFQSKZ6sXzCOV9K/jder9IpOaYDYne19MJUdPOI
	OI+wYEkfD35ose3kJNLZHZx15d7B9Ebu2FVRaH6b/tC2ptDoqSKx65H0s1QJ/r4h27YdNdSUOZu
	zIhb61bK4p9SQIoFPGnN98RsOml4X+4ifZXRifjLbhQpcdlyyAjZsLYUFC+kMHJSiCbpo4ISsiD
	LvUmMWbHAAnLr73NS3B8nJ2lINObQ8FSok91tFrw0Q2db0sZ7o/5SvCm04VcFftYYgmeGSA==
X-Received: by 2002:ac8:5e4f:0:b0:55d:2c49:c258 with SMTP id
 d75a77b69052e-55d2c49c456mr86126021cf.42.1794824745567; Mon, 16 Nov 2026
 02:25:45 -0800 (PST)
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
 <CADT+UeBxUecV10oAzTDn+rPas43iGLgpuHKHYZUKd_o=gN9Znw@mail.gmail.com>
In-Reply-To: <CADT+UeBxUecV10oAzTDn+rPas43iGLgpuHKHYZUKd_o=gN9Znw@mail.gmail.com>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:25:34 +0000
X-Gm-Features: AclHuK9WOpwmKEvnuzRSoHFtqQDCb060zuujnEK9IFM5WFLehV8teLCU3Q8BJ28
Message-ID: <CADT+UeA_5Xpq1AEyOcPtOJ13soqXXb=NdmLP0NGvJ1P_KMApCA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+linux-renesas-soc@vger.kernel.org

On Mon, Nov 16, 2026 at 10:25=E2=80=AFAM Biju Das <biju.das.au@gmail.com> w=
rote:
>
> Hi,
>
> On Thu, Nov 12, 2026 at 7:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 4 potential
> > issues to consider:
> > - [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
> >   clocks, and resets
> > - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: sdhi1 left enabled
> >   when RZ_BOOT_MODE3=3D0
> > - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: missing pull-up and
> >   no-op UHS pinconf
> > - [Medium] arm64: dts: renesas: r9a08g046: SDHI power-source not wired
> >   in pinctrl-rzg2l
> > --
> >
> > commit c182c80f2e51018770e032cd10fb901dca56ea0e
> > Author: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1=
 pincontrol on SMARC EVK
> >
> > This commit adds device tree nodes for the three SDHI controllers on th=
e
> > RZ/G3L SoC (r9a08g046) and configures SDHI1 pinmux and voltage regulato=
r
> > nodes on the RZ/G3L SMARC EVK board.
> >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/=
boot/dts/renesas/r9a08g046.dtsi
> > > index c63a857f0e5b0..3665ccbdd91be 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > @@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
> > >                       dma-channels =3D <16>;
> > >               };
> > >
> > > +             sdhi0: mmc@11c00000 {
> > > +                     compatible =3D "renesas,sdhi-r9a08g046";
> > > +                     reg =3D <0x0 0x11c00000 0 0x10000>;
> > > +                     interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH=
>,
> > > +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>=
,
> > > +                              <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> > > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> > > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> > > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> > > +                     clock-names =3D "core", "clkh", "cd", "aclkm", =
"aclks";
> > > +                     max-frequency =3D <150000000>;
> > > +                     resets =3D <&cpg R9A08G046_SDHI0_IXRST>,
> > > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> > > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> > > +                     reset-names =3D "rst", "axim", "axis";
> > > +                     power-domains =3D <&cpg>;
> > > +                     status =3D "disabled";
> > > +             };
> >
> > [Severity: High]
> > Can sdhi0, sdhi1, and sdhi2 bind to the Renesas SDHI driver or pass
> > dtbs_check with these properties?
>
> The dtbs checks are passing.
>
> >
> > "renesas,sdhi-r9a08g046" has no fallback compatible string and is not p=
resent
> > in renesas_sdhi_internal_dmac_of_match or
> > Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml.
>
> That is correct.
>
>
> >The binding schema
> > also restricts clocks and clock-names to at most 4 entries, restricts r=
esets
> > to 1 entry without reset-names, and only permits the vqmmc-regulator ch=
ild
> > node (added under sdhi1 and sdhi2 below) for "renesas,sdhi-r9a09g057".
>
> Binding clearly specifies 5 clocks/clock-names, 3 resets/reset-names
> and optional internal regulators.
>
>
> > In
> > addition, renesas_sdhi_probe() only requests a single unnamed reset via
> > devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL),
> > leaving the axim and axis resets unmanaged.
>
> These resets are managed. see below
>
> priv->rstc =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev=
->dev,
> NULL);
> if (IS_ERR(priv->rstc))
> return PTR_ERR(priv->rstc);
>
> priv->rstc_axim =3D
> devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> "axim");
> if (IS_ERR(priv->rstc_axim))
> return PTR_ERR(priv->rstc_axim);
>
> priv->rstc_axis =3D
> devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> "axis");
> if (IS_ERR(priv->rstc_axis))
> return PTR_ERR(priv->rstc_axis);
>
> >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arc=
h/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > > index 5289efd1a430a..0b6b7e109200f 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > > @@ -14,6 +14,7 @@
> > >  #define SW_GPIO4             1
> > >  #define SW_I3C_EN            0
> > >  #define SW_SER0_PMOD         1
> > > +#define SW_SDIO_M2E          0
> > >
> > >  #define PMOD_GPIO4           0
> > >  #define PMOD_GPIO6           0
> > > @@ -38,6 +39,7 @@ / {
> > >       aliases {
> > >               i2c2 =3D &i2c2;
> > >               i2c3 =3D &i2c3;
> > > +             mmc1 =3D &sdhi1;
> > >               serial0 =3D &rsci2;
> > >               serial1 =3D &rsci3;
> > >               serial2 =3D &rsci1;
> >
> > [ ... ]
> >
> > > @@ -175,6 +190,68 @@ scif0_pins: scif0 {
> > >               power-source =3D <1800>;
> > >       };
> > >
> > > +#if RZ_BOOT_MODE3
> > > +     sd1-pwr-en-hog {
> > > +             gpio-hog;
> > > +             gpios =3D <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > > +             output-high;
> > > +             line-name =3D "sd1_pwr_en";
> > > +     };
> > > +#endif
> > > +
> > > +     sdhi1_pins: sd1 {
> > > +             sd1-cd {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1=
_CD */
> > > +             };
> > > +
> > > +             sd1-clk {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1=
_CLK */
> > > +                     power-source =3D <3300>;
> > > +             };
> > > +
> > > +             sd1-cmd {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1=
_CMD */
> > > +                     input-enable;
> > > +                     power-source =3D <3300>;
> > > +                     bias-pull-up;
> > > +             };
> > > +
> > > +             sd1-data {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1=
_DAT0 */
> > > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_D=
AT1 */
> > > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_D=
AT2 */
> > > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_D=
AT3 */
> > > +                     input-enable;
> > > +                     power-source =3D <3300>;
> > > +             };
> > > +     };
> > > +
> > > +     sdhi1_uhs_pins: sd1-uhs {
> > > +             sd1-cd {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1=
_CD */
> > > +             };
> > > +
> > > +             sd1-clk {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1=
_CLK */
> > > +                     power-source =3D <1800>;
> > > +             };
> > > +
> > > +             sd1-cmd {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1=
_CMD */
> > > +                     input-enable;
> > > +                     power-source =3D <1800>;
> > > +             };
> >
> > [Severity: Medium]
> > Should sd1-cmd in sdhi1_uhs_pins also keep bias-pull-up like sd1-cmd in
> > sdhi1_pins?  Also, neither sdhi1_pins nor sdhi1_uhs_pins specifies
> > drive-strength-microamp on the PG0..PG5 pins, where PIN_CFG_SOFT_PS onl=
y
> > uses power-source to select the drive-strength table.
>
> These all are uses reset values as it is sufficient.
>
> >
> > > +
> > > +             sd1-data {
> > > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1=
_DAT0 */
> > > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_D=
AT1 */
> > > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_D=
AT2 */
> > > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_D=
AT3 */
> > > +                     input-enable;
> > > +                     power-source =3D <1800>;
> > > +             };
> > > +     };
> >
> > [Severity: Medium]
> > Does setting power-source on PG0..PG5 in sdhi1_pins and sdhi1_uhs_pins
> > actually program the SD_CH1_POC register during signal voltage switchin=
g?
>
> yes, it programs  SD_CH1_POC.
>
>  RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B)=
 |
>    PIN_CFG_IO_VMC_SD1),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
> RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
>    PIN_CFG_IO_VMC_SD1),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
>
>
>  RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B)=
 |
>    PIN_CFG_IO_VMC_SD2),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
> RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) =
|
>    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
>
> >
> > In drivers/pinctrl/renesas/pinctrl-rzg2l.c, r9a08g046_variable_pin_cfg
> > configures RZG3L_PG pins 0..5 (and RZG3L_PH pins 0..5 for SD2) with
> > RZG3L_MPXED_PIN_FUNCS(B), which sets PIN_CFG_SOFT_PS rather than
> > PIN_CFG_IO_VMC_SD1:
>
> See above definitions.
> >
> > drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg2l_set_power_source() {
> >     ...
> >         if (caps & PIN_CFG_SOFT_PS) {
> >                 pctrl->settings[pin].power_source =3D ps;
> >                 return 0;
> >         }
> >     ...
> > }
> >
> > Because rzg2l_set_power_source() returns early when PIN_CFG_SOFT_PS is =
set,
> > switching between sdhi1_pins and sdhi1_uhs_pins never writes to the SD_=
CH
> > register at .sd_ch =3D 0x3004.  Similarly, rzg3l_dedicated_pins defines=
 the
> > SD0_* pins with neither PIN_CFG_IO_VMC_SD0 nor PIN_CFG_SOFT_PS, so appl=
ying
> > power-source on SD0 pins in commit "arm64: dts: renesas: rzg3l-smarc-so=
m:
> > Enable SD/eMMC on SDHI0" fails with -EINVAL in rzg2l_caps_to_pwr_reg().
> >
> > [ ... ]
> >
> > > @@ -230,6 +307,17 @@ &scif0 {
> > >       pinctrl-names =3D "default";
> > >  };
> > >
> > > +#if RZ_BOOT_MODE3
> > > +&sdhi1 {
> > > +     pinctrl-0 =3D <&sdhi1_pins>;
> > > +     pinctrl-1 =3D <&sdhi1_uhs_pins>;
> > > +     pinctrl-names =3D "default", "state_uhs";
> > > +
> > > +     vmmc-supply =3D <&reg_3p3v>;
> > > +     vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> > > +};
> > > +#endif
> >
> > [Severity: Medium]
> > Does &sdhi1 remain enabled without pinctrl or regulators when RZ_BOOT_M=
ODE3
> > is 0?
>
> Yes, this needs to be fixed. on the else case status should be disabled.
>
> >
> > renesas-smarc2.dtsi unconditionally sets status =3D "okay" on &sdhi1, a=
nd mmc1
> > =3D &sdhi1 in /aliases above is also outside #if RZ_BOOT_MODE3.  When
> > RZ_BOOT_MODE3 is set to 0 (routing PJ0..PJ3 to JTAG instead of SD1 CD, =
IOVS,
> > and PWEN), &sdhi1 lacks an #else branch setting status =3D "disabled" a=
nd will
> > probe without pinctrl, sd1-pwr-en-hog, vmmc-supply, or vqmmc-supply.  A=
lso,
> > SW_SDIO_M2E is defined at the top of the file but never used.
>
> yes, it corresponds to default switch setting.
>
> Cheers,
> Biju
