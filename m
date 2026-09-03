Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D103F7AAC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464661; cv=pass; b=YoJ75kZiQq+4VSRYmNUFc3VA3keudvGWsxqzmV04EZBP6mR8iHKsBmm4fFW4mp7zrtu21kWTN6htzPIUwYvcZgm/rfD+XKTsEovjvXD5BaYadMlXOdAeP2HpSjsWYNK3QbQZyOikRizAoqrXghz4UwtsHZh+cUpASqGMnylDLyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464661; c=relaxed/simple;
	bh=5uwxxeZPYN4Ij6akn4bwbxGcDtLNY+69BXfmEyQCBcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMsPkg8QBHFuaY94gExze4b/Q/fUCHh3p/B59cfzNifi1bbvXdcwLq17mkYJseIvmf9czlHx2MumrpDFiGv0AZHrw3Uv8wFDxPjPxli1wopCsZ71DMdM7Sw4UcUQBXcvpEKMttXlCd+inVN3CmIejn4dxMV2rp5y1kf0YdDtnoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfTP3BHC; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfTP3BHC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5f5d37778so18977a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788464647; cv=none;
        d=google.com; s=arc-20260327;
        b=cInkkjPbfXS0LWLbtyGi8Y/2PSYFMx/23nvSFgYBHG/1kybUwaWp2fasKf7NG9lvAS
         UU9eOb13eHkYLuuK+vEx7KG2W1b/GsURZpf4J/gC7mB+gyK5QdnoU23IDt9h6y4/Ffyk
         kfaTmco6z4OQdGn2gz5KPydyPu+6l0MQa4cNxZJC/KjMeVQbCPuDrgxfvHjTjHmy7O0Y
         rV+y0XCrIIjUXxbeHw6XY8i6vjG9dfdH4Uu5MeTyp9/LLq/oHgBTe9vjemBjvaHigoO9
         VJE2pCJRb7/ElWDam51hd86I0zVPX/hNDOd/r6OYBlo7Go9H805VuERn1cdW6Zqd5XR5
         xtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        fh=cHbIsUU/Gy1KdnKUW6wHY8bAbeTjI8U+l7IA5OXDm4Y=;
        b=d4BR0Jj0XIDA0MxE40KQg8XyDA1e+itiW8bGA5U8gJSjeCtqOXoOwrdJktU8+wrmuT
         HwW8orncXrR5MQjbVS12f5UOP4TukyRxy++YNYzWywOo/caeHZa4aJTA6ujnJIyAtO4a
         kZs4s3fApRFbK3GDt7dXxVfoIMX0wS+i78xGIVXMZEYWHwf3DJmL7gaO6RNVLTKmzNnK
         QxyI3SM9YKD9LTx383lBnpQom1WClGTtbFpxPYfXgf1mC/Lg3I/GLo06mlxZ8nGooJEt
         ID3CmwJuvfoxP2hKsNZSIDHTQLwEGFuVgX1ePCmRygm+C5YJlmFN12LF4rdLAmisjkB2
         JXsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788464647; x=1789069447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        b=IfTP3BHChN+WgwQWFEhAvkOCgDBJV5XK0HWHz1E3oaOmWI5qtksAUxUuH807T0ivCW
         yyLlpKb7GLWb/SJy4iiM4/BtIkgPPHLPB3sjP35X7RZsf6Cnv1IgV7TbXDQb6YQIoTAc
         TYMx1TiI8II4jd5M1DuaIV1QagmeNgDmci1T3qbE40yyfZJ5LekJ7rsUbm0LtO7wYkZH
         rABDQ5tRhk96rMoQC8H1VyoqjGERJW3E/2S+leBO0RiYLVREN5NHKSogpKfZQxakCcIk
         IUK4OPzGB0WSZJl4S97smVosq7IayejGyf2V4npgo5p9JTMNHZnAGOv0JIK6qOU91qvq
         II0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464647; x=1789069447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        b=jLxEcf2TMiq4LJV0EuBJu8WEjlN4iVbbd/9HulnOyY5swEY163tThzsJ8/uRRtOXCW
         w8Zm3IfXd7eXTOVvmum9CWZfahK0Fh3SPC/ngFk1NUDxs0QL/wlC8rMab9D2Y10ZGmlY
         3Rnn8d1ju1AukyuL4FoUjDgx50x0pqYIANjZqWeI4hn1mv/RSE4qgGyMquXqNjU69YJE
         TXn99r188PNVKUAn02v0RRlMf2xMQNkcBNEFxfTG1f2drFsDiKYmqa8pj3hD/PrU9UrN
         5KyGRMW72SxkT9PAFY4rH4s0IZwNAN48Qb85jcpXmNWSqxNBtUXY2V5khKAkHMnKTzNt
         AjSw==
X-Forwarded-Encrypted: i=1; AKwUvBzLS3Pi7pZe3s6333N2eLZn1zhXb7XVKstNkZkHdU5cjJ1urpbCSIOey0o/utWh2PJctTFZaRRGgYdd@vger.kernel.org
X-Gm-Message-State: AFuF++n7hDckK0m/yzt6F9Uxdati26X0tsMNo0Zq/hIhKt8AsJqKJtM2
	i0ebNumVMBV4QEm0gob0bKfJ39+Jy8rRiZg2ysxDYmnXaw2/Qn/stJtbMnlX9+ocDrW8Fbk+Lci
	i7xNvoiR/JwB8B/Odk8mm4GlKtiJpsrU=
X-Gm-Gg: AYBFou0WLLgP4lrdFcTdNH7wC2NaJUipLbEbr1uUUbSbMOpikZX++W73MBE/cNALyQv
	xppbgblbhVutytLwgS63Yh5paQqrSN3zZUEsrsWVebjl0f8A89ZARWfdMCbePbYk67ollIKP/Dk
	yrYWJvbCkGCnnTtvzZEDhDoJuM6eClW87vuNHkHl/0F4Mm0P+Jpgpr1legY+GfO3jZQnAdhTl/r
	8iWhSsh0bVzG8Cs2ZsOqkgIqym7/0eNM+AImwp63JDkQc6CFYRBNBXgVFlDmR22YKanaotP8WSF
	nSoPz+JpIwn7I6PrdP1APXOh+hWD+rHkAgpnHNelsvFDmLd/2Dd01HSM7Gs99RxK5nZRyBPlcOQ
	xwg==
X-Received: by 2002:a05:6402:4585:b0:6a6:32f6:ee8e with SMTP id
 4fb4d7f45d1cf-6a7e8e9c97bmr78640a12.3.1788464647094; Thu, 03 Sep 2026
 12:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-ti-davinci-emac-v3-1-db41e32f3f6d@gmail.com> <178844863252.3394541.10006643092711574384@kernel.org>
In-Reply-To: <178844863252.3394541.10006643092711574384@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 4 Sep 2026 01:13:54 +0530
X-Gm-Features: AcwNN1VED6faEgcpjoUkRbm5zQtgZu9zqcqs2cQMMmJnQoBHnsr_ZAdYEEo-k3k
Message-ID: <CAOWyW_6qRhoUts2MtvDL3JiBx74UOBs73Fye=1FKrky-brmS8Q@mail.gmail.com>
Subject: Re: [v3] dt-bindings: net: ti,davinci-emac: Convert to DT schema
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tony@atomide.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 8:47=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] The new schema lets `ti,dm816-emac` nodes carry either 1 or 2
>   `reg` entries with no further constraint, while the driver derives=E2=
=80=A6
> - [Low] The schema makes `clocks` required (justified in the commit
>   message by 'driver probe fails without it') but leaves `power-domains`=
=E2=80=A6
>
> --
>
> dt-bindings: net: ti,davinci-emac: Convert to DT schema
>
> This converts the DaVinci EMAC text binding to YAML, documents clocks,
> clock-names, syscon, power-domains and ti,hwmods, and adds per-compatible
> conditionals restricting reg, syscon and clock-names.  clocks becomes a
> required property and ti,hwmods is marked deprecated.
>
> > diff --git a/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml=
 b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> > new file mode 100644
> > index 0000000000000..f0c539d1bac79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> > @@ -0,0 +1,127 @@
>
> [ ... ]
>
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,davinci-dm6467-emac
> > +      - ti,am3517-emac
> > +      - ti,dm816-emac
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: EMAC core
> > +      - description: EMAC control module
>
> [Severity: Medium]
>
> For ti,dm816-emac this leaves reg free to be either 1 or 2 entries, but t=
he
> driver derives hardware semantics from the entry count.  In
> davinci_emac_probe() the presence of the second region is the only signal
> used, both for the control module base:
>
>         res_ctrl =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>         if (res_ctrl) {
>                 priv->ctrl_base =3D
>                         devm_ioremap_resource(&pdev->dev, res_ctrl);
>                 ...
>         } else {
>                 priv->ctrl_base =3D priv->remap_addr + pdata->ctrl_mod_re=
g_offset;
>         }
>
> and for the SCM eFuse MAC-ID instance:
>
>         rc =3D davinci_emac_try_get_mac(pdev, res_ctrl ? 0 : 1, priv->mac=
_addr);

This driver logic relies on the reg entry count to determine the port
instance. This is a software implementation detail and not hardware
detail. I believe it is bad idea to rely on the number of reg entries to
get instance, It's better to use of_alias_get_id() to get instance of port.

From a hardware perspective, eth0 requires 2 reg entries because MDIO
node occupies the 0x800 to 0x8FF.

>
> which flows into ti_cm_get_macid()/cpsw_am33xx_cm_get_macid() and selects=
 the
> register pair at offset + slave * 8.
>
> Given that, can a schema-valid DM816x node land on the wrong hardware?  T=
wo
> cases seem possible:
>
> A single-reg EMAC0 node with a 0x800 core window (as in dm816x.dtsi, wher=
e
> MDIO at 0x4a100800 is a separate node) plus ti,davinci-ctrl-mod-reg-offse=
t =3D
> <0x900> would make ctrl_base point 0x900 past the end of the ioremap.
>
To resolve this I can either:

Use nodename to hardcode exact address for eth0 and eth1 something like
  if:
      properties:
        $nodename:
          pattern: "^ethernet@4a100000$"
  then:
      properties:
        reg:
          minItems: 2
or
Enforce 2 reg for both eth0 and eth1, For eth1, even though there is no
MDIO, the base+0x800 to 0x8FF is simply unused, so describing it as
split regions is still accurate. But this will require a driver fix
for getting port
instance.

> An EMAC1 node written with two reg entries would be passed instance 0 and=
 get
> EMAC0's factory MAC address, putting two interfaces on the wire with the =
same
> address.
>
> In-tree, arch/arm/boot/dts/ti/omap/dm816x.dtsi happens to pair these
> correctly (eth0 has two reg entries, eth1 has one), but nothing here requ=
ires
> that pairing.  Would it make sense to constrain this per instance, or at
> least document that the presence of the second reg entry also selects the
> MAC-ID instance?  The commit message line:
>
>     - Allow 1-2 reg entries for DM816.
>
> reads as though the choice is free.
>
> [ ... ]
>
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ti,davinci-ctrl-reg-offset
> > +  - ti,davinci-ctrl-mod-reg-offset
> > +  - ti,davinci-ctrl-ram-offset
> > +  - ti,davinci-ctrl-ram-size
> > +  - clocks
>
> [Severity: Low]
>
> clocks is required here, but power-domains stays optional.  For
> ti,davinci-dm6467-emac, is clocks alone enough to describe an enabled mod=
ule?
> davinci_emac_probe() only queries the rate and immediately drops the cloc=
k:
>
>         emac_clk =3D devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(emac_clk)) { ... }
>         emac_bus_frequency =3D clk_get_rate(emac_clk);
>         devm_clk_put(&pdev->dev, emac_clk);
>
> There is no clk_prepare_enable() in probe, so the LPSC gate and local res=
et
> appear to be handled by the genpd reached through power-domains.  In
> drivers/clk/davinci/psc.c each LPSC registers a domain with
> GENPD_FLAG_PM_CLK and davinci_psc_genpd_attach_dev() adds the LPSC clock =
to
> the device's pm_clk list:
>
>         lpsc->pm_domain.attach_dev =3D davinci_psc_genpd_attach_dev;
>         lpsc->pm_domain.flags =3D GENPD_FLAG_PM_CLK;
>         pm_genpd_init(&lpsc->pm_domain, NULL, is_on);
>
> That matches da850.dtsi, the only in-tree user of this compatible, which
> carries both clocks =3D <&psc1 5> and power-domains =3D <&psc1 5>, and it=
 matches
> the example added below.
>
> > +allOf:
> > +  - $ref: ethernet-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,davinci-dm6467-emac
> > +    then:
> > +      properties:
> > +        syscon: false
> > +        clock-names: false
> > +        reg:
> > +          maxItems: 1
>
> Since this conditional already narrows reg, syscon and clock-names for
> ti,davinci-dm6467-emac, would adding power-domains to a required list her=
e be
> appropriate?  Without it, a conforming node describes a module that is ne=
ver
> ungated, while probe continues and later register access in emac_dev_open=
()
> and the cpdma setup targets a gated, reset-asserted module.

Yes, I will fix this in the next version.

Best regards,
Bhargav
