Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6B18BC3B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974606; cv=pass; b=TUDIY0Xuay+SepU0Pbb+I7WOmzTXoK6d9iqCoE7dIgX/6yfjCxcuf6lB0y3Kgoh19CnqalynyUJ8SA9eesNB+mgDMdUWHWmbtEb6bROGIjqeGx0WD91Kzo7+3oTPSeCSKtzZXovLcf4x7FEB9rySgf2lIR4zXXGhW9FYPe8I2jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974606; c=relaxed/simple;
	bh=qQ0fdreUZzC/7HdkK25NxWYh+tIDDlH4eCp9sTOS4JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBbMOaTzVzjo9CQb6+wFD93WbhKAIf2ypAiFh0l36SlGQODQMUKpoO8MBLQAeXndioYBNZ2qabgLAlzgEz5AVAuuTIZiJRKk061iq6oRbLhViRabxVR5TpdujgzmGyd4wTsKTiLU1epTBZgCJGpMxfeW4XUxvW8z9Tx1uOVTE7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBjs0fqi; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBjs0fqi"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a74032ff8so2664060f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 02:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777974603; cv=none;
        d=google.com; s=arc-20240605;
        b=F8HGPL+TW03n4wtZXNugkKnIV+oyl6SeGo4YxpQs2NARaaBqXTiXGq6OuwCcqVEQ8h
         Kz+R9PbT5I3PUM7cbGa0PDfYeO8E+f5lcYkRVLIZTEVFm5mnwM5jDmLhpfgnp20kiEKd
         6Pj+HWlpUvmiuhexkiduu+T13DFe6vfX1ro3feDWCzZ+nieJz0GZrIjOp5KxZTfFmhJb
         tpDi2N7fFqjknxP7SDKPC6r9VEgWkgeFyPvNsW84ATB7LIHd+ULLVQ4cGc/PbKzS8EGZ
         zDiybHoO3sHws9arvs5mVp1WNVWbPrwoWRvFtp+MVxd6esiBry/v2XlRyxslqys7u1kS
         FQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        fh=j78bfcZ84Qa38vNUTkhWiLPmrpUsZTbCrd5CY5w7T+k=;
        b=Tq12WbFdoJCnwWoyA74U6vK9G80Y0Wb9SUyCq6nZpOIlumQZz4qU1ytXkCYQUyfnKU
         c7dpJ2F6LQksO7weaJ6z46DVPYcoeGHbbCeUyNQq7gYNBMvs5fccPChAN0zOPGEHlbNm
         VodxDy2hoCYxrWFe9ZmcDC8I/aoipphFKpPVAJTlgNt4dibg8ZH/+A8EaWTGQuc6whuk
         0zG+th72eS/BYhCXruvnSEKTrpfKiFFZQCGGorY1nNSCJwxZUINsyOa10BF1KKz0yNIA
         CxMbJxDjtAnz7sCQwgxYiYIwy7b56loQWpGtgFu8l0T+ia2W1iNuPwakYH4LpS98jyKZ
         2drA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777974603; x=1778579403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        b=UBjs0fqiICJTxUYdi61u826nIJwUieJ7vazwRcShSJMxW9foPK1eNRe0q8ckskaGxu
         rV6PR6bnTRgN0y0AT96FnCb5DAwCYEsiOPZqM+PPOuFo1eRV1J/Z4m5au9oxpj9whOEp
         wtyG8RaOkF6elETkRWWJoha+JfDj4I9bgsMR5ibuDP6A2cmSgjEYn3p/hhpuQcHEpgR2
         uActrKlpdRDKdqOGqPQuL4y8Dqo8Dqa1sGyhKaIXCq6pdRO5yQUyk9Ljm7t+CXXBda9o
         mfD7A9o4lADip55AeiJiXE4oZfmwKvPDQPqDMfn6gFboCGSR6WbwRk/I6u/V90MMTB6c
         mUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974603; x=1778579403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yM4KcG56R9vbDU06owym0pp3y5nB/08M1mIBueRT0Dk=;
        b=VlY3LNRkZIuwoJpDr3kQPk0RrAh5Azo8/la27hw9hUkc2z6P9hct48GmSERF2XKISP
         E4/3imZMjAzqvVikeqNAuwji2hQc9uyNoD9CjkBOBiComoro0aDCZBGxzUx37jHpCWo1
         7SPNR5vtB5TeHadvGfxfjRs3z3WChRPEvldEeAcc8w0z4MgfclQV/jSjYhBimpoVLJQn
         mjfYFdCFK8+xbhXGHB+Z9ogZPOVl4+5RfjBb9IJs593HzeRv+IQCkjIVMXGibDIEwtZk
         9xlZ8omXb1vv4ODUpqdHNh1UKM1opt9EjQyHUmre5p1TP8ZViJNiqdFR9qSmBrWW6Al6
         faqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mvjIH+PLhZ6l6rRC108yw1iMXqhWcVDc4LsrH8P6bnoyOv75VDWHqJkXuA5yWSIsqDPujl/UIJQMC@vger.kernel.org
X-Gm-Message-State: AOJu0YylH6/bcjMr0gzMuqZIU9C8ERJnEeWw8nHaG81vnpAyguuvh57o
	rxq25lkMK5tkzy8pizkLfDvBXqNFtUAXBi0nhvQEkfpFiWEOG8I2OBUMDDK55BucxyRYGcRU9Nx
	hqdZYnlyl8oiBIkmd8PNXO+L4Ucd/XBY=
X-Gm-Gg: AeBDiesO6UR3jCXtl4UOtnqT07lzqJGd7HMdaisf6xJxD8fQNw6xhCSYZUbNqRtFdRU
	QZURB/26D5KAPZDryyPQGm9CeEXyfNM1rK6X+MpYKkU9u2+zzMzfR8u58F1xHOfxBn5yzna/z/t
	PO34FVOfQDb0UiZediEqc7neiboW7Y0AxUya6VfLzH37JB3BTtZwxYvt7td5OeGeyp+qVq63nyR
	YnfftilBsHYYoVpvGllvR+YNAFlwKWkHE1MjijnvoMccBRpni4/LdTJdMjnX6lY7vmqVR8bD4T8
	P+i+iDSUDn5DwyREixUF4jXguuz75ylELvT+BufujX/77BDv/fmpgXiXbu5uJwdn+iN+v1vFe21
	MVXQ=
X-Received: by 2002:a05:6000:18a5:b0:43d:7c1b:b8c7 with SMTP id
 ffacd0b85a97d-44bb65e0664mr22072385f8f.21.1777974602954; Tue, 05 May 2026
 02:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com> <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
In-Reply-To: <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 May 2026 10:49:35 +0100
X-Gm-Features: AVHnY4IoCllXpa4rpkEn8ddmDkn7rn864MKfmonI0Q9JZNQwspbW0qaX6F7JYzw
Message-ID: <CA+V-a8ve9+Dz1kxZDXUROAuiKMYp=+q0BqMfGo12dsy=SXjyfw@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Helgaas <bhelgaas@google.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Fri, May 1, 2026 at 3:42=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > Hi Manivannan,
> >
> > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > Hi All,
> > > >
> > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > >
> > > > > Hi, Prabhakar,
> > > > >
> > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-=
host
> > > > > > driver.
> > > > > >
> > > > > > The RZ/V2H(P) SoC features two independent PCIe channels that s=
hare
> > > > > > physical lanes. The hardware supports two configuration modes: =
single
> > > > > > x4 mode where one controller uses all four lanes, or dual x2 mo=
de
> > > > > > where both controllers use two lanes each.
> > > > > >
> > > > > > Introduce configure_lanes() function pointer to configure the P=
CIe
> > > > > > lanes based on the number of channels enabled. Implement
> > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels=
 at
> > > > > > boot time and program the lane mode via the system controller u=
sing
> > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > ---
> > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++=
+++++++++
> > > > > >   1 file changed, 142 insertions(+)
> > > > > >
> > <snip>
> > > > >
> > > > > This introduces some limits in the systems with RZ/V2H(P) SoCs wi=
th regards to
> > > > > the usage of linux,pci-domain. I would like the PCIe maintainers =
take on this.
> > > > >
> > > > > As this is necessary to index in the system controller driver spe=
cific data (as
> > > > > there are different SYSC offsets for different PCIe controllers) =
I see the
> > > > > following alternatives, if any:
> > > > >
> > > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-contro=
ller-id
> > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used=
 to specify the
> > > > >     system controller register offset and mask for different func=
tionalities.
> > > > >
> > > > >     E.g.:
> > > > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >     And use them in each controller DT node. E.g.:
> > > > >
> > > > >     pcie0: pcie@add1 {
> > > > >         // ...
> > > > >
> > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >         // ...
> > > > >     };
> > > > >
> > > > >     pcie0: pcie@add1 {
> > > > >         // ...
> > > > >
> > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > > > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > >
> > > > >         // ...
> > > > >     };
> > > > >
> > > > I'd like to get a clearer steer from the PCIe and DT maintainers
> > > > before investing further in either direction.
> > > >
> > > > To recap the two approaches on the table:
> > > >
> > > >   Option 1: A single renesas,pcie-controller-id property used to lo=
ok up
> > > >             SYSC offsets in the driver.
> > > >
> > >
> > > Can you explain what is the limitation with 'linux,pci-domain' proper=
ty?
> > >
> > As sashiko pointed out.dev, The linux,pci-domain property is generally
> > an OS-specific logical property intended to assign a stable PCI domain
> > number across reboots. Restricting it to [0, 1] would prevent system
> > integrators from using non-conflicting domain numbers like 2 or 3 if
> > the board incorporates other PCIe controllers.
> >
>
> "linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.dts. =
AFAIK,
> the board designers have no reason to change it.
>
> Yes, the property name implies that it is a Linux specific property and i=
f you
> want, you can propose a generic one (not vendor specific one). Other than=
 that,
> I don't see a blocker in using this property. Many SoCs already do this a=
nd
> other DT projects like u-boot do not end up parsing this property.
>
> > > >   Option 2: Explicit per-controller DT properties carrying the SYSC
> > > >             phandle, register offset, and mask for each functionali=
ty
> > > >             (L1 allow, mode, link-master, etc.).
> > > >
> > >
> > > Are the register offsets going to stay the same across controller ins=
tances?
> > >
> > > If they are not going to change and you can derive the offsets using =
the
> > > controller index, then there is no need to go for individual DT prope=
rties.
> > >
> > The offsets will remain the same across the controller instances. So
> > instead of using linux,pci-domain property we could use below is that
> > OK?
> >
> > pcie0 {
> >   renesas,sysc =3D <&sysc 0>;
> > };
> >
> > pcie1 {
> >   renesas,sysc =3D <&sysc 1>;
> > };
> >
> > Where 0/1 are the controller instance IDs that the driver will use to
> > derive the correct offsets.
> >
>
> What if you have other register blocks using the same pattern in the futu=
re?
> You'll end up with renesas,xxx =3D <xxx, N>. You should stick to
> "linux,pci-domain".
>
As Geert pointed out this overlaps with pciX DT aliases on PPC boards.

Cheers,
Prabhakar
