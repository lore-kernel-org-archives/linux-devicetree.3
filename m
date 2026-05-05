Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985F345736
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974885; cv=pass; b=nYpuFecS+eu5pMKTOnA+NberH+iQIHvploarsiHu18UO/3OxRgKp7YiofVn1XJ1/UZ7dDXE00laRB0uoUHyXmH3dwcqbeLilkYbPWSl+Q4vpHXQ1cBdYRTOekW+j0UAo+joR/KUlh4ubeRaO/YGIhRon+k9/ZnDOfBKt9tEBrzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974885; c=relaxed/simple;
	bh=E35b9v/9N86s+jnlEC41wZVsmhcr4qcpURavxyfZD9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us85BxNf6qD+w0WDSSm2cfPaCiEiUZXIo8N9Z7/kF7CFK7tlipI4ZZuy/A+1iLupRrGxTaG2FGQCNMzjAnMdpMU+xeIdpOkQIpSfjw6I/oQTNPcEIdqd2B9XJvZ7+j7rVTPDU27UvEDu4l9teUTnEsejfzHU7ghhAwtRbZoBQlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEHsKYha; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEHsKYha"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d146705b4so8970495e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 02:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777974882; cv=none;
        d=google.com; s=arc-20240605;
        b=JFii6EkA8vh8jsXn1RRLCEsta/YFODSdhFF1iOGr54pltNImYTicC2MnQginSBYwg4
         /7gbPjVT9docQ76eNU/kntvacMZF6+41snbi5tngo2MXzrjpXtVZ3AyVGFOQe4Awa1ol
         Ityjipv+KsV1F9V9tv8A1N3r6J8CZd3+2HXrvfh2veuXdMgrBCmXP3r2BKFVyxKbDC0d
         aifncVg0XhsPc62U/sq2+o3culO7uwgQL5mXJeLlX5M4Rh9fzDOuzyVsWTKFZYAc/fsG
         rSCeSxZ4La8KfiZIVD29DrxOj21s6DXSMnflTWiSMmDonBA4+Qf5XqWoJjh/GlhMZTuc
         W9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        fh=V6nClAIddMxoLMjJwuTn4CIChXCmAoKolVR4Rkf2Czs=;
        b=dK/PcgXnQ4W55V9q2nsWzeQM0chBLJDvVfc8QlO4QreZ/0E2+MGCHWChBwAA2CbTJ4
         HjGEFlqMtnC4K81q3X9S2HGOtSR1leHGzYc7jk6mpQhVp/BhCs3ntw4SPJF7LS/x45Dd
         udmXOFd1qVB4vNIRqLUJeTkiBzX8AzUJ3WX3NXMVrfzpN20i5m7z+XX0AgeQZ3O8qem7
         2TKrAFapg7dV/eN3hejaThGJjAe0AF+yJvD9KLe4gJY2Wd3xNyqInliN7fHqxJHAjEIg
         fszBX13Pj9vztkG4E3DrjI+bi3sJKbEexDTCITusVm+T2/cjIAfHGsTgzjedoU+eK2Fx
         1XCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777974882; x=1778579682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        b=ZEHsKYha81Il5yhbFlSBZdApQeIN0/u+vgCZx7aHUilChCBH9AGMZflSPaNQimVOQY
         88cYh887Jm9nWH3PzwP0UMY/M3Zecx9lmweanyrS319w6o8AZ9P7jg8acXRRyLhjClUE
         VAVuKwroK74wgcA61/JWu6dWI3R0oB8oLCzxgB+dQfSDgF4+1xbMN/bENUw8qolOCRrM
         NkmuHLsJYZMi9YtW01gRlrkREYQg+knJq/HDrP8TIcs6NirW5hxhSUMZrhsT44sl8XCa
         4noUOHrRdLp93S5/q4LpNfnphQ/icZGjITewT0u9jN0Va3It9ZLx83zIVVzS/brrQhxJ
         eShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974882; x=1778579682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OFVXXRgPbKb/k/EVNaXDuuccfuOclNAixih9iVgxqg=;
        b=pYfeWO9YJrlsAVuSYz2cXaNxF9q6EOTk4Shko+61ESkyOcWEeKtpr5EdTSMZjwZ6bv
         5F2WmN7E3BVdyKiDXeZdLqvCYNDBkC7Nkldedc1LsCD1MDHU4XpQ+rmoXUJfSY8D6F7N
         aeVc4pNgFSt+7PIX2NP3EY/4bkQEz9lzjJO1wVQFLXPWPisa8OOa4RLU5Qj+QyhwqYuw
         pzbc1IojqPuWhqNEZwkXMMya4SlNjziK8LuRQFJArNs02ZOlE4xTNQdioyZEekqw+l4m
         v8jT/2RYKmRyY5ifulydJjgDE0AuxTU1yqn0i+OUazMkXO1+qfnXwhe/RoDnbtVBpXeK
         QyAg==
X-Forwarded-Encrypted: i=1; AFNElJ883KdNWO68lH0+guSd1eud7Sr+f/jY0UX9Zd0Rnzs0PPJGFYC0ADRup8Lg5+U1oTvAU19vb8mQGEOX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7rLEcsMJWbUkL9KUwdCVkE2trCzB+gc/4nnGKNFn5fjGsSff
	A+bXo6e71R35rNjluXo6pdh47xmdwDlniCV4xwz1n4CEorIObEJ+Z70Oz/QMCY0qstUCaZdQao9
	Eglb8VOqAt8CD4ap7/E7GYkHs0eQbc0I=
X-Gm-Gg: AeBDievBuX5FsQTApEEmhrrDP14/rvGsrtUYkjtip4eKZ36b1LOEJ2EjbqGDDUIxpOg
	rzWk6Xp6mvgPraAVV7FKZVDSwHC1y2EsHrDqhk7YImivEf5yEl8YTkuC/wQ3UNUGc9KCww1mKe2
	Iq42TkoQF2Ngb8ymo1KE8C1iBP21z8b23tZSJSyMJCdNT3wWcWiEMkG5kgu9IeEBW7KL3i40xmy
	rkh3Tn4VW2ei84aXC601Qr5ZwZtnAB9tZHy1dkQlWFCRhM0iJ2RLU4Uy9zkHwJ/Nfrb0768PSuM
	mYEJ9pp9hxeOgH+7zgvxfJjko0DNZvROl2AZS6mKITirVRGI3Ckv7b2z7E8SF9iF/ceigS/k6uc
	AznO49y1sauU8Yw==
X-Received: by 2002:a05:600c:8b58:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-48d18be5b32mr36270575e9.14.1777974881868; Tue, 05 May 2026
 02:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev> <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXRtAOZrQbebng5pLXNENUeZenA1Hng1kER+1vbSwaj0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 May 2026 10:54:15 +0100
X-Gm-Features: AVHnY4LoB9VhkRhCHgWKDjlqC7kBQg0p7x7zE8Yn05GYW88TH9I1loXaSoAIan0
Message-ID: <CA+V-a8t2HhtMWT6v489PZbi+-Yzc0ybgYXFuPd2QeEndn-x+TQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Mon, May 4, 2026 at 10:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 8 Apr 2026 at 20:55, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
> > <claudiu.beznea@tuxon.dev> wrote:
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
>
> > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host=
 *host,
> > > >       return ret;
> > > >   }
> > > >
> > > > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *ho=
st)
> > > > +{
> > > > +     struct device_node *np =3D host->dev->of_node;
> > > > +     u32 domain;
> > > > +     int ret;
> > > > +
> > > > +     if (host->data->num_channels =3D=3D 1)
> > > > +             return 0;
> > > > +
> > > > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain)=
;
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
> >   Option 2: Explicit per-controller DT properties carrying the SYSC
> >             phandle, register offset, and mask for each functionality
> >             (L1 allow, mode, link-master, etc.).
> >
> > Both have trade-offs. Option 1 is simpler in the DT but moves hardware
> > knowledge into the driver, tightening the coupling. Option 2 is more
> > verbose but fully describes the hardware topology in the DT and avoids
> > a driver-internal lookup table.
>
> As this is SoC integration description, I think it belongs in DT.
> But adding many properties is indeed cumbersome.
> Fortunately the two register blocks inside SYSC seem to have the same
> layout for both channels, so you can just use a single property to
> refer to the base offsets (0x1000 and 0x1030).  Even if a difference
> would pop up later, you could check for e.g. =3D=3D 0x1000 in the driver.
>
Okay, something like below?

&pcie0 {
  renesas,sysc =3D <&sysc 0x1000>;
};

&pcie1 {
  renesas,sysc =3D <&sysc 0x1030>;
};

> > Are there other approaches the maintainers would prefer that we
> > haven't considered?
>
> Option 3: Look at the unit address.
>
Indeed but this might be discouraged by DT maintainers ;)

Cheers,
Prabhakar
