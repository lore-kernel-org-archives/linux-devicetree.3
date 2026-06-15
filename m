Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D03F6C3B
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532694; cv=pass; b=m03qd7Qbwh6H54m/3JDkCWQQ5GXDNJOdZJvP63hR8YRPeMJxr35i0QQ1lZfskS9lO7Qu/6URTzZgS0a6azmXMLKvHF3pzRx85gYyIntwJMszUn46l+eizg3n0P/93E7x6ERk501fclRBpFHOTeYATv+oTrBlGprsXw3lG3jHoz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532694; c=relaxed/simple;
	bh=UKZhWeWAfm91Tl34gD1jUYGw1Gj8LP6juUfsejBIZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBWrUyITTd6ock5+HX6f+2k8Jr5B5CRcxq4jvCr2k4/Ohk14bRz9FkNe8rp9puu840vJ62zp9FIqanDS6OGGZCJx54R5nOHFU58TdKyW+pRug6sQSZA12rw7k2QI6z8835lS0AzBzpyQ3cucXq6JJgYTKOiBOV0QvjgiiDudeis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldLfCqI7; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldLfCqI7"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6608c1a4215so3551234d50.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532692; cv=none;
        d=google.com; s=arc-20240605;
        b=ibEj97CdpHdZhrfTwB/O8oGOIkEnUVr2NOu1G4a+KIGjcUWNMYQoD3c6RUt6Zh/gyT
         nmj7vSk9D/t3gd5oGEhwX7Hu8qYLaGOt6Jqs+3xP+87t1ksNJ4wN8kjDg/V/tCqmfhWF
         wDJkWPbU+FPfBNEe5J/RUIs1v6BJjQ8691TqjR2cUuN4kHLABDGIVayPWeGJtS+h4I4H
         o97hWKDgdEaPmMcaX9K4gTL5WUFtiBPUNZY+QtY/huufMaoPNOqFhaydeXIJuMH97upb
         hIB1KyuxwtijnlZ4hxK3n263MoKUopvaFVI5Psq2lFZhwlpj0jTmJ/MtdiDCP22H8JvA
         eKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=Pn895Q47/jfmbwyTsRDqzxnewuczPnp/CeLL8DqYsIPzpsGDbDxv2yOI1Su2p3IvWw
         K9BTOr7UGtRmw1P4KBd9h7exgf3wJ6hFOnohXLuKas28a3c2j+wSn5mZC2Kl+TE5h96M
         E/nQeBn6U68NTLoNkU8pIFe5SInGODSrNfsMWdU5dKt3skn1kzC8O5N1QApU+QqgrB9T
         RCKEhaapr+jLs70AdBlnP2IaL9bPfH6DQ2g1Dcp0qfNrntZaXaMqRvE/hSLuJDyLXXOl
         2upTxquLOXCOu4cZ6ePZdOVo0RfncjKmZBQnfP32OdFaOyCUGnE7yXLixN/oSF9K37cl
         vrsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532692; x=1782137492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        b=ldLfCqI7WDgMp8G4xmxzrS/3isNjfPbiSwDsa9Y8n80MxwrWkay4C69vYSezBhhnjp
         SaROb25uagPinxwrp/tGIMXNpAeBwC3Xh8tv7jF/CijuEBuUVdeuq/SnTUc+RhKwTjmL
         UTUhnAd5dzimh/MCntgitXbgoxCnOx52lRbeAujp9krw/70/wejGYLQe/gBnyqmxdZpb
         WfdDM7XAea44ukd3T1cXzeisELTLT7+vSuc7mcDQsmOsEnOzT4BXoFGR7UmwlAt9xBXc
         ZvtKghuOcJOJ2Va+bVNnPIN1qnQJYQeWN1vhadzKmbNsdvdhjq1CXZ07J5sS1ixWtCjU
         BYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532692; x=1782137492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        b=Qy9YU2o557oGH0DAqxrSRfMv+SIm2o+6vVdfwdn89r/2pl6/FPhqDXPIVsEK/D+5DM
         yWX8BPz3bbKmgJVj2orOB6qMVGjWymPhy8Y3Zi0pEjZURAaGLt2ZN82uI7h5QYbrHYja
         i7paaB5sEe9oz83RfQgQas5GWBnFvvghrS7gzEYQCGmjWdoJjqyrhFJh9NQTCjYnFTFM
         PGWu/zV+OWIyDTCZmahWSIAPrpjAOORlfa6NvfB/9dS7d0VeDY1ZDKE3md5nWCrjhEJ4
         P5oaQ9D2cwk8U6vRo0hLA2NHySjL0ZMbX6OGCUBODaKKEZ/NSqbFggXXerKCefNjM/wK
         82UA==
X-Gm-Message-State: AOJu0YzCOmpSBWDl5dFUcun4fFfvIXGzuw3VaVtqXKrxKvYAZKILCRt+
	wpoBIg8n6kiMHSHWOdpVaPaTjLOm8FrMz+4bsENUaVBkKubjTlqYGl8cdXev/ex2jLGgTfHLIEU
	CeTjWNGEOYZTxzvdnZ6ULfIbums+4w/0gGw2n
X-Gm-Gg: Acq92OGL6LLZj+G2dxKHI9DMvhS5lPU909qJk3yY3mNwK6mXqSwkWf94uzWaz5Y7NsA
	AzBq9l8CIpg2vrwbV2czi/tt3EvSaQPvu7VADz0X7XcsuDjoI93Do+8cMv9r+Tjp0983LCxahkF
	NX8bdyamn2+95AaEmzDUWXau5eQx0VLwCvjm8Fw/dZF8CNJcGjXwmxx93XxW1m/gmg5sT100jfi
	fENqJtPRb+izcXkK9gCqSnEqZT3fOQGDrk54m6hoDssC8Zxss8T7LMUKETLeXllJ9F3yPe/lLUZ
	gtCB7ZAb1A==
X-Received: by 2002:a05:690e:1443:b0:65c:6bf0:fad4 with SMTP id
 956f58d0204a3-66278d4f1f8mr7941983d50.27.1781532692254; Mon, 15 Jun 2026
 07:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610160816.2828713-3-tmaimon77@gmail.com> <20260610162038.304A01F00893@smtp.kernel.org>
In-Reply-To: <20260610162038.304A01F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jun 2026 17:11:20 +0300
X-Gm-Features: AVVi8CfEc81qkCQBN8OJtoQ-_JIGYWvllSrsq9M306zQn2ux9pWdHNpYV0tje48
Message-ID: <CAP6Zq1iC_sLfZtBkXGB-3CEodftR1hNnq8BfRx8mYc5_Je7FNQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 10 Jun 2026 at 19:20, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] DTC Warning (unit_address_vs_reg): The `apb` node includes a unit=
 address but lacks a `reg` property.
> - [Low] DT Binding Schema Violation: `nuvoton,sysgcr` property is undocum=
ented and forbidden by the ChipIdea USB2 schema.
> --
>
> commit b1b96db36d76cd5dd1f935613798ed29aade275d
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> by the evaluation board and downstream platforms. Add the Ethernet MACs,
> USB device controllers and PHY, MMC controller, FIU controllers, memory
> controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
> OP-TEE firmware node needed to describe these blocks.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 7976baafb9942..1e21b2704784f 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> [ ... ]
> > @@ -51,7 +57,255 @@ clk: rstc: reset-controller@f0801000 {
> >                       #clock-cells =3D <1>;
> >               };
> >
> > -             apb {
> > +             gmac1: ethernet@f0804000 {
> [ ... ]
> > +             udc8: usb@f0838000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0838000 0x0 0x1000
> > +                            0x0 0xfffef000 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     nuvoton,sysgcr =3D <&gcr 0x9C 0xC000 0xC000>;
>
> [Severity: Low]
> Does this undocumented nuvoton,sysgcr property cause a dtbs_check warning=
?
>
> The USB Device Controllers bind to "nuvoton,npcm750-udc", which is evalua=
ted
> against Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml. This sch=
ema
> specifies unevaluatedProperties: false but does not document nuvoton,sysg=
cr
> internally or in any dependencies.
will be removed at V5
>
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             udc9: usb@f0839000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0839000 0x0 0x1000
> > +                            0x0 0xfffef800 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     nuvoton,sysgcr =3D <&gcr 0x9C 0x3000 0x3000>;
>
> [Severity: Low]
> Is this the same undocumented property issue as seen above in udc8?
will be removed at V5
>
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
> > +
> [ ... ]
> > +             fiux: spi@fb001000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb001000 0x0 0x1000>,
> > +                     <0x0 0xf8000000 0x0 0x2000000>;
> > +                     reg-names =3D "control", "memory";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPIX>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             apb: bus@f0000000 {
>
> [Severity: Low]
> Will changing this node name to include the @f0000000 unit address
> trigger a unit_address_vs_reg DTC warning?
>
> According to the Devicetree specification, if a node name includes a
> unit-address, the node must also have a reg property where the first
> address matches the unit-address. Because the apb node defines ranges
> but lacks a reg property, this might introduce build noise.
would be back to apb in V5
>
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <1>;
> >                       compatible =3D "simple-bus";
> > @@ -59,14 +313,6 @@ apb {
> >                       ranges =3D <0x0 0x0 0xf0000000 0x00300000>,
> >                               <0xfff00000 0x0 0xfff00000 0x00016000>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.28=
28713-1-tmaimon77@gmail.com?part=3D2

Thanks,

Tomer
