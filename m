Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519511;
	b=0zbRvKalemX0Wbpejf/90DivMXOyThjMjZ/vb+0VSeAqCpwGlYdZU91Kj0zHFpm2KlK/
	 4bDo86PQ9MCJ8rdBi2ekoTLxugp6i2GYfBDlpUAI/EeKuNQe1hyBHKSmNZ+MoK0FhQt3Z
	 CPZ2WlWHSS/VCmvOW1XHU52KTM+aPca2Gbqaqzay38TKXv709ikxZmcs5WZMVdvDUq5uv
	 FRZrhNd/SNfTC5JbrThkbfOXpXlaiE738DIn551enskVyO1BVvct0xTe1QJDH1IKREdKh
	 Kk8Pyn4d+2BjG24u65/wn4v/BW+Fd845Ei7sPc89Dv10W0hOILewOoHjbAWgAORboXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
	b=HMGwL4mBkh1cU6YwQTeQt4SJVqTrNZejVLEJIbuZlaw1qNpGocdx/8iSyzVQ/SWPVj1p
	 1REwqhpc6eNZKRp0NJd0A0QOqGu7wNMjgxuWqO0lMGJaeqDH83X09BbFznzN91G8+9z71
	 tMzSqwgzlD4ScuGRS8feQieSOHtF5YULjiniEApm89RVM0sEo9yVhKbaXFONlBwJCdszp
	 CO7Ne1pe4uL2mqfL7IysZroAXdP0Xk4yymDkBz74G/CXE/gdwXoj0pTDe3S8i+kR6a7bs
	 RyIhQpsXnRarCD+mHEb2CpV2kqSJfyaGawVPr7FxZw/7BDi50WjGfgxtTRBKr0OAlUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puheq1Mm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A290606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A290606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puheq1Mm
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c304f7031so57670471cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795519509; cv=none;
        d=google.com; s=arc-20260327;
        b=oZ0XcwelUxsYXPkQORjeBrrt56AJ5vrKvmNWoarObyhzyZ/M1n942LN8nOxloQBkh3
         fKndLOAwnGsDCajSqS6T9nHJ/kp+pD43YMIKOETcdkPCTdeGnizMYwx65+KDePs8tNYa
         QJFl708NNOPX0iqAxCMoy2NMHGLfqvogEEFUQaCEAmOvK2P8qacz5BRRnquhbqvdKf2T
         v8wAv6SN7RGKWl+zo5eZ0mKiMhpMp3gzwPbsR7c15LrGEKEd8LuzFf4nw/L5e2DceUu0
         s5JJ/cfMrrr3sP5xh4eOzBIgVTs43rFZTdjcJCE0J3ZBcwqWsvZGaQ0Y+X76kQouO/vz
         pPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=IK3a58Io/K8r1T8bQ/LlhwmhJvf0tr7Ph8UrNmFFUYZAxmS2UBj6etDnoa0sh1wpbJ
         nSBrP166VSYSTQSS7fUbi20LD1l7lK/RSaq+ubomy99uVNfkZFAPpcbz3dIAUCY6lFna
         3odUxnT+Ol7npi0w43wKn1IyiExh2mwz4P6ICPoIfZylsCQncbOpIUaVeSej8SRpC8GQ
         p5xpPL8wODzBB8Qspgw59Z5ZapqTp5rOZdTx+f/2qQbwk5QAfkuVuCYgyq7ufi2/qrF5
         EqjV6qTam58JOlfMCX39r4VPimYJBh9Vcwj2+cHHe0cuq5ZyC/NNee40pA0Ec+ihTOcX
         C2UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519509; x=1796124309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        b=Puheq1MmOxPb7jy0x5azII39IK7nkvvYMQvJF/5Pv5ueBptITjltbE76YzwFgEMz+U
         V8mVkgKtXZhz5GNvyCXXgydH8Nl7AeHIyE/RlIydvLBiUTEbjzZ7fC7XWozR6URmDobu
         yGtBARn8697KQNmf4AUSo1QxFH40th00C0GdsANc64bn7G2fZAdWYeU0RruEByGz0nfC
         eVKTUL7prp8IFWsQ0OPFWCu0dnLnd0V50stmsFivERMhW2Sr0siecSI+rR2LZ8rOF9Hb
         Qmta/I1POPDovcKIvcnTIsVuuwh/vHkSIixSZ4z8bEGcjJ2AGKl3cRWi+yAoBC6GFpFm
         woUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519509; x=1796124309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        b=X1exy3o46C3fAbPbweFknuh0NJ+QJ8j4rbs6vdgbVPMdk6vAdmwFoKuWm0/S52MtyU
         ep5HV3rd+aAf+McjpPF8tzN3pdMGWIzyKWlGKlo/lVBT6LVHxkjbvpnmcIAOMaZKR2m+
         4Q6aEsRp/lBhhnza/mYytZZksVsiyETm/5yNs+Rnsp5IxGi7cRTP3WMmxebWwx8AV/oL
         mGMbATKeSwvdbX+k64iOybEsjVxKv+eyGUFZxLx0vzYD5HpEHWSRy/gf1z6t2sSmSz8p
         HH/GXXCZm9jJQ8oATVdyZ/EGx658xpYiHfMmN/p2DuUWQSEROHuOze1mOXZMgzJYCcQZ
         2C0g==
X-Gm-Message-State: APuU4Z/nJifZ3L2FgwL8Q5uOjXkJySgPk2F4eiOiWjP/+5ftmL3XhDdK
	RiCaDfIH1TN1TXKKFr/ane2oe0dCHBrSbRdSFgG64cUVF6vFyVebYIDu3JdNDY9+1TuUVl0+PZK
	oq0+L26UX5/KCeJbXIo4AbNtJWvv405Y=
X-Gm-Gg: AZFdTZckc2moBJiK/XDQqIx5fwzyZ2z1MwOkeyN3dq0bDvBp1RAuQbKDzbxqOdMSTkg
	r5eR/4umfxedpKGXuO1Iy0VMcCK2ftX5/Fddy7UwsffVxLoUk+xIp9cqAaG0wrtQ0BJF+QYe+9D
	iXi78orDy4tl18dSoGamYzv5gDSk5vyWtFroaATWGPzUSotlfqUUhsFDl+gbOBSfjXUb4sEFCLa
	KQ2ZTytCHqo97VCBa3K1BucrZqnfULtAFDugRkvWXAofdpaOqRamFxMY7VsB+64xrA408aBs+9y
	ctYyWuOxyrWmDQDdJzpUH2L4tMtElg2B2Ub38xVTfxjU50OmR7Ek0Eq3mRMl98pDcTfTz0r8bUY
	JK15khOHzgBV0d9gIReRF1znOakBTLNaMGV6Q24YPd7T6Hd1b1CVTnbUCmAY0f7G2EEzX4w==
X-Received: by 2002:a05:622a:652:b0:536:64ee:73e8 with SMTP id
 d75a77b69052e-55d769c8a8bmr247880221cf.8.1795519509553; Tue, 24 Nov 2026
 03:25:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
 <20261123-sdhi_rzg3l-v2-1-bad3a6358849@bp.renesas.com> <sashiko-outbox-229381@kernel.org>
In-Reply-To: <sashiko-outbox-229381@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 11:24:58 +0000
X-Gm-Features: Aa3M54pDTkymqBGURe3Pj6U5WPV5YSKg8Nl2GM3dC_SaLCa0n-aneKX6oiqXn5I
Message-ID: <CADT+UeBxPq-HDLNNgEWObK=CpwJaHh3ss7FyOHQ3b3r5AiWk3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
>   clocks, and resets
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: syntax error in
>   sdhi1 #else branch
> --
>
> commit 527fb6eb84a5c0b07ad82e70e9460e0c1834eaeb
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 p=
incontrol on SMARC EVK
>
> This commit adds the SDHI0, SDHI1, and SDHI2 controller nodes to the
> RZ/G3L SoC dtsi and configures SDHI1 pin control and regulators on the
> RZ/G3L SMARC EVK board.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a08g046.dtsi
> > index bb69e5e3528d0..b710f47d3f030 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -1068,9 +1068,80 @@ dmac: dma-controller@11820000 {
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
> > +
> >               sdhi1: mmc@11c10000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> >                       reg =3D <0x0 0x11c10000 0 0x10000>;
> > -                     /* placeholder */
> > +                     interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI1_IXRST>,
> > +                              <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +
> > +                     sdhi1_vqmmc: vqmmc-regulator {
> > +                             regulator-name =3D "SDHI1-VQMMC";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-ramp-delay =3D <1200>;
> > +                             status =3D "disabled";
> > +                     };
> > +             };
> > +
> > +             sdhi2: mmc@11c20000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> > +                     reg =3D <0x0 0x11c20000 0 0x10000>;
> > +                     interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI2_IXRST>,
> > +                              <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +
> > +                     sdhi2_vqmmc: vqmmc-regulator {
> > +                             regulator-name =3D "SDHI2-VQMMC";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-ramp-delay =3D <1200>;
> > +                             status =3D "disabled";
> > +                     };
> >               };
>
> [Severity: High]
> Are the prerequisite binding and driver changes for "renesas,sdhi-r9a08g0=
46"
> missing from this tree?
>
> Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml does not list
> "renesas,sdhi-r9a08g046", limits clocks to 4 items and resets to 1 item
> without reset-names, and only allows vqmmc-regulator for
> "renesas,sdhi-r9a09g057", so dtbs_check fails on these nodes.  In additio=
n,
> renesas_sdhi_internal_dmac_of_match[] has no entry for
> "renesas,sdhi-r9a08g046" (and the nodes have no fallback compatible), and
> renesas_sdhi_probe() only requests a single unnamed reset, leaving the
> controllers unbound and their axim and axis resets unmanaged.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index 517747aef36ef..e9b7b3280615c 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> [ ... ]
> > @@ -312,6 +389,19 @@ &scif0 {
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
> > +#else
> > +     status =3D "disabled";
> > +#endif
>
> [Severity: Medium]
> Does building with RZ_BOOT_MODE3 set to 0 fail with a dtc syntax error?
> Both "&sdhi1 {" and its closing "};" are inside the #if RZ_BOOT_MODE3
> branch, which leaves "status =3D "disabled";" in the #else branch outside=
 of
> any node block.

Will fix this in next version.

Cheers,
Biju
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg=
3l-v2-0-bad3a6358849@bp.renesas.com?part=3D1
