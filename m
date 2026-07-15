Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097B3E3DA2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106177; cv=none; b=Vp+6Otz6O9A33MuZeF4+7rMWgRR6fZYblshNSWnBoTaEuZ+Tr8DlGAJlMSlmsTw1+hC8KOOe3KMka47KIsRtTopfrcLvxNIT/lFIaMi84Sc6gMph9AzSqQc1Lxj/+uKDGEqpmjxWHdLK2ker2mO580F9aHzgFJsi+2m0FDvd2Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106177; c=relaxed/simple;
	bh=4p7JA6EZMNI8+iBrijHrUHNSvFWoAG8Fnu6BsUPc+bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD8TlhlS+3CpWPNQLk5QsIFA57SCmBP6RbrVVhWOn4ndvKoayeCAjHHnU7+D/hq7rvY7KO9LD5ToCOgB23/dUnjvO8llcnKFSPoTHVPTlfNU7D96f7SnBOqfvO+MFbbQGhYyAVw4Tmcx5fXo5dJ72513vJ4suOY3ROOV6Ru2LrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfd1df4835so2064079e0c.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106167; x=1784710967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByrjGjRxl6chD7mBfQkVFOKBnkOxHgRz/c3eqExfhhU=;
        b=Mo1J9ekV/3bg2RUg4xeaSF+WESuQpuuhILZPcHB6az9kEUBid+1NE+iFdqgK5JH4av
         KbdGlMwkwURO6dGW+ZYPelUNMMh7Fb2x2yJc7HkcyYjZZopoyY3tyJuDN0o24xmeGf6v
         SRrX5qfZu/S1zCK9fUtavj0y6QVqTVier5lQKDZJyPiu2fjJgFhlv5BSKj95wuoKxo1M
         SLWQSwyVkBTMAv158j9z2P9AM56q14bOtS/612JX/5iCGRP0ixj9fPbZGzpPZxlJf9Kx
         J/nsDzd61lQWWLyzLGin1bRSul6ZKOkb9HR40vTyMUU8hBWeqSWwPiKitZpUlFufXTYD
         3h7g==
X-Forwarded-Encrypted: i=1; AHgh+RoOxnlxo3gDF18/UwcsSwn4HxX/kRWbXYppK1lZeIXXU2sIA6wF5BaTbVUJ7V5WSYrMgIvLU5WBfsyj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnbijlE/EosHOQOdY8cj3lyi/hd1hfiynJ1Fs17ytyefThHcn
	Z66/YdBMcZ0G4nNVDkL1QpVLxeJDYt5OPDwvYAwuERPXP9Z3YzARUcn6QYwJV9Ghm/w=
X-Gm-Gg: AfdE7ckQtTsM4rAfaZ0eFQtTvwVMD0ceC8Ughrt6Ly4rieV+8XY2SVMvt6LnUAQ9em5
	bwcZ6BBQUYRlM8laAfgcoWf9stUmPlsrosxOhNUfmA08ACzT+k7+rtKaC0rsILzgTvpDO3pfy67
	uCaWUURmSad3e2leCChynyg0WtAzdzSLqPSVkugEuN40vh8v+B64lCgrpv3g/8FXwb/VUfkzkub
	2u8jkrBpXnSccrtTxgF6IHydiBmp2lQtn0L5PnDuy//ZKonW+hEl1DRBfBKjgFMWDOB6CtvhO4Z
	D1MjN5WIdRFu511T1F30HMUp6ItNvV1vzDyrh0ncnl1czXrCPeXY+oQaIfY7mK4fTLe1yMLNluq
	nDDljajlhvagpiOA1lstJ7UImPqpWAq2bfboA1uFUcUQJ37+laqv5Aeu3T9W2Pn+iMkGQF79WhZ
	iz6QcYo6DtemzVpkUCj9HhXmpKOoul66MWEtbcZ+PIGSpiRNalOrNodWAaiIWn
X-Received: by 2002:a05:6122:7d2:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5c11628b0c5mr3371857e0c.6.1784106167008;
        Wed, 15 Jul 2026 02:02:47 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfd84a1e6csm5396128e0c.14.2026.07.15.02.02.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:02:46 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9691bfc9f81so2953379241.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq//bPjPn2MqqJofBfmXUXynzdb9UhvGLyRxbjEUEVPRjVeej6C9B/6wORQW3lX2ZtEIiFLvGi1NMcP@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:738:fd01:5b60 with SMTP id
 ada2fe7eead31-74587311ce1mr3372984137.3.1784105677124; Wed, 15 Jul 2026
 01:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:54:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
X-Gm-Features: AUfX_mxDHx3n63ocxRYS-KeudKm3TNmAE-PyMFFvcB9KNeYvoVs9ROnUvj_T4n0
Message-ID: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 14 Jul 2026 at 15:27, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > This series adds support for the System Controller (SYSC) blocks foun=
d on
> > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-=
power
> > > management and access control functions.
> > >
> > > Hardware Architecture & Dependency Challenges:
> > > ----------------------------------------------
> > > The SYSC in these SoCs is a multi-functional block responsible for:
> > >     - Clock & Reset Control
> > >     - Low Power Management
> > >     - Clock Monitor (CLMA)
> > >     - Access Control
> > >
> > > A key architectural detail is that these SYSC blocks are physically l=
ocated
> > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software =
Reset)
> > > address space. While the CPG/MSSR driver is already implemented and
> > > functional for these SoCs, the integration of SYSC adds a layer of
> > > complexity due to a cyclic dependency:
> > >     - SYSC requires CPG: The system controller needs a clock to opera=
te.
> > >     - CPG requires SYSC: Access control registers within the SYSC con=
tain
> > >       bits necessary to control the PLLs managed by the CPG.
> > >
> > > If implemented as a completely separate top-level system controller n=
ode, we
> > > would face a cyclic dependency between the CPG and SYSC drivers durin=
g the
> > > boot process.
> > >
> > > Proposed Implementation
> > > ----------------------------
> > > To resolve this, the SYSC blocks are represented as child nodes of th=
e
> > > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > > directly against the CPG device node. This hierarchy correctly models=
 the
> > > hardware address space while allowing the drivers to share resources
> > > without deadlock.
> > >
> > > I am sending this as an RFC specifically to get feedback on the
> > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > dependency cycle.
> >
> > Personally, I am not a big fan of subnodes.  I assume you are using
> > subnodes because you can register only a single regmap per syscon node?
> Yes so that the consumers don't have to specify it by indexing.
>
> > Would it be possible to just extend the existing clock-controller
> > node with two more reg entries, and expose them through a single
> > combined regmap?
> >
> That should be possible. Or would you prefer just to extend the sizes
> and create a single regmap for it?
>
>                cpg: clock-controller@80280000 {
>                         compatible =3D "renesas,r9a09g077-cpg-mssr";
> -                       reg =3D <0 0x80280000 0 0x10000>,
> -                             <0 0x81280000 0 0x10000>;
> +                       reg =3D <0 0x80280000 0 0x20000>,
> +                             <0 0x81280000 0 0x20000>;

Yes, as they are contiguous.
These registers are not accessed unless there's a user specified in
the DTB, right? So there is no issue when booting an old DTB that has
the short reg blocks.

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
