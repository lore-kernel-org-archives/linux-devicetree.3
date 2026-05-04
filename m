Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272E346A13
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885836; cv=none; b=THu56XM2uA0cBPF3vLFGZ5HSzqYt9VT0s+Yl6wRCM2pT7WEiCiXs4UDYdcRJHh41KrxndYzNLUwCJp3qU0wZnDPCsxzTWJ7MkK5OVCDafr/L8xW/Gt/YghXcZvkVOuY/jD0mmS0hiS/pKWGlMzYm8t4Rp8g5zU0LGoqz05uh9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885836; c=relaxed/simple;
	bh=NvZkJz2oTmRF8PSVjwwY5oHKDCA/yV3ifrPuiMpUAaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYAEmDHkheXb582pIvpbNVDH3dGVPsWbNdrGX+4qYE1x0Fy0FiT+/5GR1Xk3pwMZzD/hs/aO7YZv/Dzyo7wXvIa6huwerNo4WU6jI3NaxOPIupX5+fmrshug5RC4M0LQ2XKDYYsim9aeYOTT8CZOVWkMUkzRwSyXlM0lr6zX0xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-365425c98c6so497175a91.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885834; x=1778490634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plo5P6qpAaOBS1LGxtH3kAqckE95GaSrW4sXgxkjnV0=;
        b=Er+9RMpE9zsaZq9NsGyALI0XtcWU4hq/mCs1iIzpTRDuy8d8NEilD+KUAfqGME6VXV
         czjvcFEPrZV/iHCP2ruU8vtVfeja49kF5oECo5enQnQ3qrNAgAfevqj0SL9PmJK8+gpA
         O1lVytv+HLzl4KL8g/bUHNCeR/nkx5V+V2z7ZI5tQoTzEhRXU6zURVw2+g/NcCJxP0fY
         fwCsRuwlTquYcPNsSjAAX2YfjYaaupsX7S/vsbW9aHF5PN1xkV/Mpt47TKXkjfR0P+hx
         CAYgRij0/3IBAW5s3YqdChvOWt8MzS20oYC1Xx0LkYtLtHR/nYTVg2w2Xishgzs4BJml
         GQHg==
X-Forwarded-Encrypted: i=1; AFNElJ80haQo5P1MepIS07xX9Q/LrsscidypC871IWaFe5VETaQswxSgcugeXY93DjlCGowDuIgimkFvjR6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0zyeoY3mNE1NkGxYTlUgK5Tf3ggy1qv6P6OXIOV4UaNEKpWpb
	vw/M7QNyqU8K27WhqlCXp/NsrvovUZM/JklCFxu6q9efx5gSzcNflMgG1Ib1B/od
X-Gm-Gg: AeBDieu5/tVmoD6JsCcYVqWO9Ffggee3gGBzapm3akCq7GVmxaZS/vG7y7YR6al9+ni
	jsiQ5+4iMp1XWQbmohdNyOc6OlE7d2hg5yMkEAJbAB8JdnIPdmKKD4Sw4/779bTTnA7aWxFb+Md
	xx9xG6mp2cpNxQzZZOxWJH/7r85tEiPsD+eQBqDJWm0W7Wh5dybolZkeOQHXf8id5SOSjseQTGa
	nL0f5jsFkwFFhS3xUXmZXxcvqxhP0B2gLmfCerTPs8+O+AzhQ0dCnWnooLEgZ2EOCDi5xrlWc67
	JbPxLxDn1dneLh9hEKNI91q2pzOteX6Ll7muph2a3zmShWRJynzdMOhqH/V89Gm6C1vGCN4xGxM
	c3c+l1X1novOGi9tJGX/4ItqxkP5ODMuaXvBAfttyKf0DpiUdyQjqV2PIku6b+Tdc5TA0sZeNlw
	2fKQk8NPE+jNva9aP0DAGix2lt0sewOTsJoNuARHdmrWH4z/y8WMWDV83ETA506eU35RmbQg==
X-Received: by 2002:a17:90b:3891:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-3650cd445bfmr10134701a91.9.1777885834015;
        Mon, 04 May 2026 02:10:34 -0700 (PDT)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf5312fsm14257349a91.6.2026.05.04.02.10.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:10:33 -0700 (PDT)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12dcdcd54adso5263200c88.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gS4xZn+QUnzSvJjZlBaAQMXKSpeHQVUP/7N1TG+S5gE0eDwh71qcx90fN6MyFyW5hnBDpoisHnCgs@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:628:397c:ecea with SMTP id
 ada2fe7eead31-62d854946bemr3171395137.10.1777885522827; Mon, 04 May 2026
 02:05:22 -0700 (PDT)
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
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:05:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
X-Gm-Features: AVHnY4LeZA0N6FCy7UX3qdh0-rhPGX17H6io1xUI_gkSOdYz_S3cRhnSj4PBBRg
Message-ID: <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
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

On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > On Thu, Apr 30, 2026 at 4:26=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > > > <claudiu.beznea@tuxon.dev> wrote:
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
> > >
> > > Can you explain what is the limitation with 'linux,pci-domain' proper=
ty?
> > >
> > As sashiko pointed out.dev, The linux,pci-domain property is generally
> > an OS-specific logical property intended to assign a stable PCI domain
> > number across reboots. Restricting it to [0, 1] would prevent system
> > integrators from using non-conflicting domain numbers like 2 or 3 if
> > the board incorporates other PCIe controllers.
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

Sounds like this overlaps with pciN DT aliases, which are in use on
some (PPC) boards?

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
