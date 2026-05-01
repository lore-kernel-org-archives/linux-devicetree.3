Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1319394483
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777634066; cv=pass; b=nFfeXcP7jVbOJj2jv0hmOdzP+z0EiClSZCJIRwykKm0mpsRGshsGUcUEJXk51asFM2nZQFhiWhziEOqck8zUIsEG50S48hqixBe07wb64Mma2zEkdMc5fhTGlnc/9FH8b6kvuc62F76StpimXT5nMRNfWB7hPTspah/6F/3m/sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777634066; c=relaxed/simple;
	bh=amzQLH9a7l5X3HtjNoS0vYiDRBkqF7DhfSZuVRXwufw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwRpq+0bKuT0Oib5YuD8+EL7YoSiPHdWpvzhTc06G21uvh133R6UPpMLnpL/8yiK5lmuaagcxBmdaF3j0YhXKF9NhUpXRgRhfsBwDtkHFOPXbT7Q7/uRSshgLpQ2v6x3/j5puVhiBeBWJtGwk1pMdqrCx/0vbJqtb0E0ApBzFlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axIijkgI; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axIijkgI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891b0786beso12480945e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 04:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777634063; cv=none;
        d=google.com; s=arc-20240605;
        b=ipG2jdMKblzQ3DidA1intNwHpbhHKpOiEXuwhZD5qY5f+mz1ZP9g6fifJPM/b67Jaw
         jQkMjJj0uwa/OXlT9bQySRz8Br+9g6pvnabX7aQn87y19p//tcT+a1sP7LaA1MDJg4D6
         Vm1DdUJDavhh4tyqvdf6hGh94BUQvCULrMHR//XEGFu0IL1H0RohdktjnBYKefyBwgLe
         voJKBZPEauSnlpvSVJoA2hSwQja7goSgEdLosyAegb2nuIjIiVWtCvgozIwHwA/D/Rpw
         j8PtYWHjyFmFxKT8bslpch7qBBJ+4mjPiBJ78EZT/5iMypDz96RsZApc/OEmluKcHRRl
         f/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        fh=cOrGcrs8Qq8b+0vdu+QfGqnWkqJmvOtquXb8sAn2O0Y=;
        b=DH09jyM4dKdjr1IYhYbJLS077BKewcJcLfZBoSlvgTU/61uDc68MMD+X/4VRGucVht
         hLhcdix9Bdz7vf0oBad4u8NYMgpoo25+YnWCRKz/E+NXEiFCSlYdiVbwYwjmQO9W7DAC
         k8oEDsiblFRoJ+e0XSzNBvCbqvA6hb09bPXwVUxfu2yn5kVZaglZO0vwP6Hna/QifIJE
         T9fucjldrBuG0A1NRpaalD+wA+Tn0lKQrmoKJr8dtRXo/Wvjn23oIzG7l5mJfjCbGDaX
         gS1moG+ymJoECJZyZBfuOOLDaqwe08eZ/rN7gqxFfBR/z/Ka9XAh61tBETmCnPYxQGFq
         6DRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777634063; x=1778238863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        b=axIijkgI8qYh6KES+esGquTjrZh4KWxebgLpqXZcMkHYIceooGul6jafXCvWQmu9O4
         URMQQseZdbrTiXdKMFRSpMgDOUPLMtGUMSd/Ad00OSKJitCa4aMdhhmycvTwrr0iOUPf
         ne4sPP0GlQ+zr6cUU9DurnRPkqLkZDKlOnRvULy+amncVc5b+V7hrgLB83Eovy8upntI
         Ufy6TF/3bDGFoyDuDI6ZyilMK3KBIgX+ivXWLw8nSq1E5M8H7yqNTp5QZmeFUBF2UlQR
         eZn6st/5+jJLT+0UFwqREMTS1BbtgzLmTJBIppxovqE/NgI5ZR/9RJLaEiHncxM4xl8N
         Esxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634063; x=1778238863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Koqn950l1gySxE0fMmqFZj9e/r7BOpcLy/k7MMhQ7Aw=;
        b=WkvZ+kbETmAYiK0fCEdEzL2Tm4JeU1xTH/ry2tOrzvuFEfBfkQusz03fJCUQW85+mm
         8PGhHJJMOMDreTr3Lj/qu8KD+i1d65PfdJPsHsOd/nSC99IUVftrntt0enDNVXnjR6IZ
         paFq1Dc5vLezj/s2J+ZKSsjjdyRDTvWb/ncapLv0rs2jBt2L7QoyArEVi7A3p/cSvTlu
         KR6ta89va0EyweeJZ+3FvUvf/7xB+Wh4JwOcoJdTE7exDngXgcyxUeiFs3DZNtNyi7la
         5L1x9ZHlbMni7T6aWf1q40lctfiJH0FrSxznDLXukhu1i9MvG/qpWPGhYXgokGVnHd7o
         WiAA==
X-Forwarded-Encrypted: i=1; AFNElJ8kdwi61yYq700ludxjgZURdSQ0Zlo/CVbwM6UEN9PUXm1ChvSgiricneqAiBx3hQX92a0JNGCz8xpr@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8X1B6zC7sKpRQKILEB09ZTROB08LpGsbgS6b3WuRB1yPkgLt
	f8FkvxAn9YdGJIPKuFsekZremQGf4ilk+Ida39ve4YHq7DNCvp+p8PWwl7b8vv4v9m/8ZHkrnbQ
	V2Hp9Yq4CjDyUGc/vP9zHwwuQx9ZmDfE=
X-Gm-Gg: AeBDietjkfEETVShqLd7iHUul0rOYQEvY5yZqONZAPehQm+ZA+ith9bvXG7Dh7GiYsF
	B6NWGFcVAY5rS2qIAvRzbaPgO+Phgh3P5fX/AB2eBt8EGTADLff293jbdusKuShtnnrpKE+mw4d
	p6r+YoB//SRawUZpRwpYpyAFFbHQWrGJiGOgqHPWucXEpTYlrUMXNK9RG1gqxANUeOooGPs25tp
	7231otRZa8iKCVwSFyxDY13IV+bBGIpsF+UXJxFeFGpIHKdJbzp62N68SDeIz+hHtDFIp42x596
	wJh5FGzn09EyhBbYFGHnUTAkezARfYIMzAC6seBBDeNFJtZON0WJ6GrRMqdZaug2IpiNmMiMIHJ
	IArhV
X-Received: by 2002:a05:6000:1445:b0:43d:309b:9c4f with SMTP id
 ffacd0b85a97d-4493cb42dfbmr12335940f8f.6.1777634062788; Fri, 01 May 2026
 04:14:22 -0700 (PDT)
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
In-Reply-To: <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 May 2026 12:13:55 +0100
X-Gm-Features: AVHnY4JvYGy7lDhdnr1gOrUfRCtB0xtova51_6-0ql6JWYIskMQxloPDeXCK7c4
Message-ID: <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
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

Hi Manivannan,

On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > Hi All,
> >
> > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Prabhakar,
> > >
> > > On 3/18/26 14:44, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > > driver.
> > > >
> > > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > > physical lanes. The hardware supports two configuration modes: sing=
le
> > > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > > where both controllers use two lanes each.
> > > >
> > > > Introduce configure_lanes() function pointer to configure the PCIe
> > > > lanes based on the number of channels enabled. Implement
> > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > > boot time and program the lane mode via the system controller using
> > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++++++=
+++++
> > > >   1 file changed, 142 insertions(+)
> > > >
<snip>
> > >
> > > This introduces some limits in the systems with RZ/V2H(P) SoCs with r=
egards to
> > > the usage of linux,pci-domain. I would like the PCIe maintainers take=
 on this.
> > >
> > > As this is necessary to index in the system controller driver specifi=
c data (as
> > > there are different SYSC offsets for different PCIe controllers) I se=
e the
> > > following alternatives, if any:
> > >
> > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller=
-id
> > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to =
specify the
> > >     system controller register offset and mask for different function=
alities.
> > >
> > >     E.g.:
> > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >     And use them in each controller DT node. E.g.:
> > >
> > >     pcie0: pcie@add1 {
> > >         // ...
> > >
> > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >         // ...
> > >     };
> > >
> > >     pcie0: pcie@add1 {
> > >         // ...
> > >
> > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > >
> > >         // ...
> > >     };
> > >
> > I'd like to get a clearer steer from the PCIe and DT maintainers
> > before investing further in either direction.
> >
> > To recap the two approaches on the table:
> >
> >   Option 1: A single renesas,pcie-controller-id property used to look u=
p
> >             SYSC offsets in the driver.
> >
>
> Can you explain what is the limitation with 'linux,pci-domain' property?
>
As sashiko pointed out.dev, The linux,pci-domain property is generally
an OS-specific logical property intended to assign a stable PCI domain
number across reboots. Restricting it to [0, 1] would prevent system
integrators from using non-conflicting domain numbers like 2 or 3 if
the board incorporates other PCIe controllers.

> >   Option 2: Explicit per-controller DT properties carrying the SYSC
> >             phandle, register offset, and mask for each functionality
> >             (L1 allow, mode, link-master, etc.).
> >
>
> Are the register offsets going to stay the same across controller instanc=
es?
>
> If they are not going to change and you can derive the offsets using the
> controller index, then there is no need to go for individual DT propertie=
s.
>
The offsets will remain the same across the controller instances. So
instead of using linux,pci-domain property we could use below is that
OK?

pcie0 {
  renesas,sysc =3D <&sysc 0>;
};

pcie1 {
  renesas,sysc =3D <&sysc 1>;
};

Where 0/1 are the controller instance IDs that the driver will use to
derive the correct offsets.

Cheers,
Prabhakar
