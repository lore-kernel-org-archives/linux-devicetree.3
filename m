Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271C43DA31
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069260; cv=none; b=VU7R0O4no0mCMgWE37cIogtDLLhhQZFadsVP76+K8cq0vszyAof+raV89iEhwytzvlGQydHnH4I1sA5+L7XBFexHPix5ZpgnaApyX+2XidgxUF7ss00G0TZEtboQGInxibF2/91iaQhBn3PiNNuYekzA7bmPMh/QW5a6VTCvcLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069260; c=relaxed/simple;
	bh=soAn2vrnq+NZwkeJhBPM72OE9WgHbaIcXvtyW2rribo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSLyRSMuBECChSltyF7j0NDkdykxU8sGu9x3GOoXMsSE/Ayc9AjIFuf6rGc3GFSvR7kyFcrTUB3X48beKE6GqoMfYKDM1PuN3tSGC8H+1gbe1ZvfcMxr1sIvU4zE5lJxSpZuN6RKCS8F7TJB/ZGorNtIq4uE6vXCucEwI/BOUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a857578a8so2213458e0c.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 05:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069257; x=1778674057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1b6tMUtONBmgXqH4JWcLF8QY3yG7D5JUUuZo3u2Uck=;
        b=aHtiSn0M4ZahsOfP+tDaixgp5xyenWMIZQdYYw40ColOqDL7wMt4rUzTptodSXESfz
         AykdtXvI3T1HVu089HO1YeAS1N1eCSdKWGYRyBX3RRvA3Ud80k9gks3JBx9aeb0AR2Qu
         tgkrwATj7DFk27iKLUvuAJpkQgZRCyhOn/gz+OsUsFxsAfxsG7pDtQao/A8usYaN7Nph
         xGTvpSj63S8H3yRqVQGgy0v4A/W6EnxNYKxhN/9TgpsYzG93LY7RyhHRrl92Zg9dqSO4
         YyiYNGghByCqf/R9x+fCeykBt/4TJCOwMdr1s58BGoXZDsIRVA68jPlAufdWd1/YdBFc
         Lf1g==
X-Forwarded-Encrypted: i=1; AFNElJ9WPr28K4Kw42IrMhokKI87OSP4fqEv0xZyVTE1GjC7LP4p0uHK3BkcX0zUTeTi71XdmQnW+OJXoLiO@vger.kernel.org
X-Gm-Message-State: AOJu0YxxQkM6e0yGcglDqTswz2mqQGS6YB+vAkrfRSrgdFSSMPmfJu/p
	lM0VDS7acTnnCpJTBf3KgtytFGzpVeWErJrRinAATwWrnyYUiRczPQxUnvEwAZH7Sv4=
X-Gm-Gg: AeBDievRybJX1XD0olg1p7K6CqeldMPEAEk1RXHYXW+BmrhMFQgbFRNHe60cQq756ej
	l0M2VRwHeAEEcYCW7XVAwkzOd0DU9Z1400L6Zddp1RaLgvQFx9ZteitatXQqcKQdIAe3915WvQr
	+WUVgotRSdP9nQ7Y+atp/r+s0fLOvDC8ywnsSuftOUADbMO8e64Rxqk2q41zVa+HonFbKbmBhcg
	PNgi+awbxvhgJW5vrayFmyiAaf0uhih56dabHojvlbC4PGfLDIqGsDt1l0lnwTzU98Gm5xe/nkX
	ZQewwPDLmgqtJ04ELHBpyNQynQnD0XwQQce0Q5I+m2uTVwVas8xmOa0w/BUy1nWANkuEWeGxk7b
	UhxaibcFW6a74BM4dM84ayeFqSvIztKjqdYzEu57st7QK8+/iVVORCgKUB69p9qXG/7e6ULU/c7
	DZ35/jeWrsK8owWHIu0usMm/MnICUlTkEFl5jeSAOebksLIdqDZ9qNaBRU9uN2MdXD+EjUuVo=
X-Received: by 2002:a05:6122:e26d:b0:56f:1ed6:1d29 with SMTP id 71dfb90a1353d-575596891f1mr1425287e0c.9.1778069256931;
        Wed, 06 May 2026 05:07:36 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm10391618e0c.18.2026.05.06.05.07.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:07:35 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-62dff2771abso1375636137.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 05:07:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88vOjAb7BOKzpf7zyMyYPMRsgG6m0P6FOI5S0hJz2dpGJgrU/U+kes3XrPUJ53GwQKMA1PaBK2iBUh@vger.kernel.org
X-Received: by 2002:a05:6102:5693:b0:611:7c7b:4d40 with SMTP id
 ada2fe7eead31-630f907cbb1mr1000566137.30.1778069254404; Wed, 06 May 2026
 05:07:34 -0700 (PDT)
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
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
 <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
 <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com> <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
In-Reply-To: <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:07:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
X-Gm-Features: AVHnY4JBLrNERmCgzgZxToIaKZzdpYZg7PBuCPB4L1Dje6XmwXVPrc9hRXm7oGY
Message-ID: <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

On Wed, 6 May 2026 at 14:02, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Mon, May 04, 2026 at 11:05:11AM +0200, Geert Uytterhoeven wrote:
> > On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > > On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > > > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.co=
m>
> > > > > > > >
> > > > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rz=
g3s-host
> > > > > > > > driver.
> > > > > > > >
> > > > > > > > The RZ/V2H(P) SoC features two independent PCIe channels th=
at share
> > > > > > > > physical lanes. The hardware supports two configuration mod=
es: single
> > > > > > > > x4 mode where one controller uses all four lanes, or dual x=
2 mode
> > > > > > > > where both controllers use two lanes each.
> > > > > > > >
> > > > > > > > Introduce configure_lanes() function pointer to configure t=
he PCIe
> > > > > > > > lanes based on the number of channels enabled. Implement
> > > > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe chan=
nels at
> > > > > > > > boot time and program the lane mode via the system controll=
er using
> > > > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.r=
enesas.com>
> > > > > > > > ---
> > > > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++=
+++++++++++++
> > > > > > > >   1 file changed, 142 insertions(+)
> > > > > > > >
> > > > <snip>
> > > > > > >
> > > > > > > This introduces some limits in the systems with RZ/V2H(P) SoC=
s with regards to
> > > > > > > the usage of linux,pci-domain. I would like the PCIe maintain=
ers take on this.
> > > > > > >
> > > > > > > As this is necessary to index in the system controller driver=
 specific data (as
> > > > > > > there are different SYSC offsets for different PCIe controlle=
rs) I see the
> > > > > > > following alternatives, if any:
> > > > > > >
> > > > > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-co=
ntroller-id
> > > > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be =
used to specify the
> > > > > > >     system controller register offset and mask for different =
functionalities.
> > > > > > >
> > > > > > >     E.g.:
> > > > > > >     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > >     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > >     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >     And use them in each controller DT node. E.g.:
> > > > > > >
> > > > > > >     pcie0: pcie@add1 {
> > > > > > >         // ...
> > > > > > >
> > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
> > > > > > >         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
> > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >         // ...
> > > > > > >     };
> > > > > > >
> > > > > > >     pcie0: pcie@add1 {
> > > > > > >         // ...
> > > > > > >
> > > > > > >         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
> > > > > > >         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
> > > > > > >         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
> > > > > > >
> > > > > > >         // ...
> > > > > > >     };
> > > > > > >
> > > > > > I'd like to get a clearer steer from the PCIe and DT maintainer=
s
> > > > > > before investing further in either direction.
> > > > > >
> > > > > > To recap the two approaches on the table:
> > > > > >
> > > > > >   Option 1: A single renesas,pcie-controller-id property used t=
o look up
> > > > > >             SYSC offsets in the driver.
> > > > >
> > > > > Can you explain what is the limitation with 'linux,pci-domain' pr=
operty?
> > > > >
> > > > As sashiko pointed out.dev, The linux,pci-domain property is genera=
lly
> > > > an OS-specific logical property intended to assign a stable PCI dom=
ain
> > > > number across reboots. Restricting it to [0, 1] would prevent syste=
m
> > > > integrators from using non-conflicting domain numbers like 2 or 3 i=
f
> > > > the board incorporates other PCIe controllers.
> > >
> > > "linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.d=
ts. AFAIK,
> > > the board designers have no reason to change it.
> > >
> > > Yes, the property name implies that it is a Linux specific property a=
nd if you
> > > want, you can propose a generic one (not vendor specific one). Other =
than that,
> > > I don't see a blocker in using this property. Many SoCs already do th=
is and
> > > other DT projects like u-boot do not end up parsing this property.
> >
> > Sounds like this overlaps with pciN DT aliases, which are in use on
> > some (PPC) boards?
> >
>
> Hmm. DT aliases are discouraged these days, AFAIK. Are those boards also =
need
> these register configuration? I thought only RZ/V2H(P) SoCs need them. If=
 not,
> then RZ/V2H(P) DTS can use 'linux,pci-domain' property.
>
> If yes, then it would be better to hardcode these offsets in the driver b=
ased
> on the compatible. DT's job is to describe the hardware topology and reso=
urces,
> not register offsets.

The offsets cannot be hardcoded based just on the compatible value as there
are two instances.  The offsets do describe the topology.

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
