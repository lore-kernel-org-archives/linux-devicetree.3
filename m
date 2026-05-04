Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC813603E8
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886061; cv=none; b=DYnztO9nqxXqqJKR3Ch3KWECFfVnspupHHdwYgPTba8Nb3YhDz/GpcGfdV2bgnU34oOUpwkfHx7rWTPOylnBSZ0hYQtpRQExUNhMGRvwsM+5tD78Tr+QJQR2+JeHStuMN0vP4wOVXFa83AcIPJ2B1KxH7SydzQe7AZ5i2K5qRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886061; c=relaxed/simple;
	bh=Y30a/Oc/ZpLcfEvZRO6RE54BICXHkQ3pkt1I8Ae9uRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsUuSzODHj4Qmiy1LFOuH463/PK8wSDwohMtUJziCbltHl61xQuBI/sAmUrHCZkj4qfniebPEmyJ8v0T2EARhXSCgz6JUjAOPdzobWxnP4/FC9ds0+4QnFKEMDgCJOlxVP8D5MtWLcnKccgDM2+9rolfwzWw3dpkjnJKqkWbsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57516e08474so1093622e0c.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886052; x=1778490852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5hHHo+yfxt7H7E3OF8Dc5zPcnFuji78/mo4OM09ccQ=;
        b=rBb28fqNBD5JrhiJ4FNSREFc6vIsGsliuzmLYwDSKTI0LgWdjFmhNsXMCpZ9x3AVLQ
         kJXjj8MGMZgHeaSdudXd48cCZqbC/W2D/RKqsoognL3TGBcDLWqI1FW4Un73cCDC7oto
         QQRk2K+dfS4NbyAuuKJmWVWd9B6ffHG7HZa6iD5Y8BQK/6KAg1bD2TiV8VJFneaf5XIr
         k78RbxWfCXlA+9jCGCPODtgTnRrvnICC3E1KTa6ngW1JD46tPqTURTC9QxMiFsfEtT4j
         n9HXsGfWZ6BPumk/Quypg95P3Q/O+mlmuSnsOERmpeczAl7hq9pxVbDHWEMsN5XlECNq
         B7/g==
X-Forwarded-Encrypted: i=1; AFNElJ8cFS42VFf6BslZ/QvCBVmVaGLPtUxGiik2hIphvZIkP10NovY7clqkMrNhgT9vhl+tzXoyEb+D4908@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRV1wy6hrPPeBT46/gnyMGImE2Ki0eSFTGXtHi6lxNntL7fYa
	Wduc/Fy4UWPvB1P4FcvxO4kl7yqQ5DafGmMpd9ajUltS7V5nRhUB/AB7WJXtiukM
X-Gm-Gg: AeBDietOwDts96TksXWB905hPVeoplQuUQHmD/Cr0lj0febpB/AJwqCCZfpkUzEZcwA
	46QI2Nh0jd/+t83WTFq5Zzc4NctSzxhfwq1j0tcj1K4i2ixUiKkPY63l0YyQ/ihdrCc3HTgp9w9
	O2s/DDu7BTs9OTw1EPalx0/0nARDaYBX/4niStRGBF3NsYoN/RZrdyARxbqLzEzVmpUG/OheWJG
	ZvDpGu9G7rKW9NY3woRuHlCsTlvFLBYKECEUNTNk9QgvouREpe6GDMs38BIXLe1vbjzmisqQs+a
	W3rBVSktQDq3tEKjMoQJOFD8kcxeVXIvH6qN/lQp2dmIbINtGFT34bW7WtfGICfOMp6hvsFVGzW
	SgY3D7GETGnAUtLFz18UqjXBgezqJwVSDaSzd+WhRHdpVt11Tr8IK28nMgQDDjeW2h6xC4b3JSt
	UhW2ZOdMj6S7/w2LONvyBTrFYqElnlcp5WQIfTBMcac4JcCk3Sp64goytuVt7Kdr4LG8VI090HH
	Q0=
X-Received: by 2002:a05:6122:e1a1:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-5750c2282c5mr4020832e0c.0.1777886052241;
        Mon, 04 May 2026 02:14:12 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af5801sm4851883241.10.2026.05.04.02.14.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:14:11 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57516bb40b9so893949e0c.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YhwkoJQViVfjWYEPOF+zlSd/a91Fje7jPqHU0+WIxnQIVLSAV9gNrDbWDYM1+bnkjZ4lIB9JjJpWM@vger.kernel.org
X-Received: by 2002:a05:6122:8889:b0:575:19a7:ae16 with SMTP id
 71dfb90a1353d-57519a7c4edmr1523286e0c.11.1777886051499; Mon, 04 May 2026
 02:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
In-Reply-To: <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:13:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
X-Gm-Features: AVHnY4IwZDZQbmmfAhrkW3faVQFI1p5tavPs1Lp33uXjss7HBIDZ1-3ZwYbIoeM
Message-ID: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 8 Apr 2026 at 20:55, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> <claudiu.beznea@tuxon.dev> wrote:
> > On 3/18/26 14:44, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > driver.
> > >
> > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > physical lanes. The hardware supports two configuration modes: single
> > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > where both controllers use two lanes each.
> > >
> > > Introduce configure_lanes() function pointer to configure the PCIe
> > > lanes based on the number of channels enabled. Implement
> > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > boot time and program the lane mode via the system controller using
> > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *=
host,
> > >       return ret;
> > >   }
> > >
> > > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host=
)
> > > +{
> > > +     struct device_node *np =3D host->dev->of_node;
> > > +     u32 domain;
> > > +     int ret;
> > > +
> > > +     if (host->data->num_channels =3D=3D 1)
> > > +             return 0;
> > > +
> > > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain);
> >
> > This introduces some limits in the systems with RZ/V2H(P) SoCs with reg=
ards to
> > the usage of linux,pci-domain. I would like the PCIe maintainers take o=
n this.
> >
> > As this is necessary to index in the system controller driver specific =
data (as
> > there are different SYSC offsets for different PCIe controllers) I see =
the
> > following alternatives, if any:
> >
> > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-i=
d
> > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to sp=
ecify the
> >     system controller register offset and mask for different functional=
ities.
> >
> >     E.g.:
> >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >     And use them in each controller DT node. E.g.:
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> I'd like to get a clearer steer from the PCIe and DT maintainers
> before investing further in either direction.
>
> To recap the two approaches on the table:
>
>   Option 1: A single renesas,pcie-controller-id property used to look up
>             SYSC offsets in the driver.
>
>   Option 2: Explicit per-controller DT properties carrying the SYSC
>             phandle, register offset, and mask for each functionality
>             (L1 allow, mode, link-master, etc.).
>
> Both have trade-offs. Option 1 is simpler in the DT but moves hardware
> knowledge into the driver, tightening the coupling. Option 2 is more
> verbose but fully describes the hardware topology in the DT and avoids
> a driver-internal lookup table.

As this is SoC integration description, I think it belongs in DT.
But adding many properties is indeed cumbersome.
Fortunately the two register blocks inside SYSC seem to have the same
layout for both channels, so you can just use a single property to
refer to the base offsets (0x1000 and 0x1030).  Even if a difference
would pop up later, you could check for e.g. =3D=3D 0x1000 in the driver.

> Are there other approaches the maintainers would prefer that we
> haven't considered?

Option 3: Look at the unit address.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
