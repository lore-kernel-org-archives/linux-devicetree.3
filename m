Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009E40097D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197753; cv=pass; b=RJ5neyjdTgoIl3e06G1D+EaZptTwrIqC+bUBvswzr5sPDHvC5VSrGlCU0fso9DwRxewNCUxWNMtOIuKQoFVkWhYmqBYf5VST5NvGcU7DGsiGK6dQqWF0nN87yoHPmffhKL5FNi0B8liONcxutgvXJSLSfmXj/gAYX6oug0g8mTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197753; c=relaxed/simple;
	bh=zfnHsn+znD5AFRoID/3JHCX/8uoL2W1bVn6UdULEWAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLF2hTLWH0OT32shPLD+cZG+fMUkmKlLf3WCJi4Iff3WZGycfzEjR8+ipqQkwNOfknFwbZ5Y+3+ApXODuVwYWa2NN6n0q6ts0ZSpiH7UKvcqN/bWUTH/ORhx+mgOWd37tZmG8/HOY3CNJfjpE+k11a1STJQWPyrqNk2H0DGkEhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+X0VT0; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+X0VT0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47362928f65so5809808f8f.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784197750; cv=none;
        d=google.com; s=arc-20260327;
        b=jFLkTV5DiQdyPO98CxgrFKUecFPlHX06NoSNiu/gCcE5eDXvdFu5UcVJHL1tviat4h
         5j2/BWrfCWRrLLS/CY9s2J5hh6uHoFCuHvjfsvP5DLZArRGhkJZJhiANMggs/d7VmGZG
         8MJf0MqbTB+ZDxN+pih0RK7yn7pgh8Fyi7S5dSJ81arnPsm12wX4oCbbPf2V5KW4NMhC
         hisCINQ+FElTC5/l7n0Nw9AvfE1muHl58X5dPRgbJ+msRANmgxeGg4TEvqFzx1dt3qJU
         7FljWUMpaX80hHpq14l9YMroCKPhfjwBhQ2YyFBkZdcgOMayBbaEqoEW90XYETRSLA82
         grsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        fh=WtYh6KWWfA5IkvVRdvhbrYsVkA0L/FSR5wW7Dgs+RUw=;
        b=QRT6MivNLAICdrvijxdkjcWl2V/FwJE7qHQhk3fHuNq1+nMo1XRR/7wM9VeI2caG1y
         fSNaxnN0rrpoH/4v8Zd3hTDAWlowQHamI0ftb8s4bFBtiLuT1CYBduZHoej+BD8qwcRY
         X1KLI9KjQjvOr59ZbCP6GQbcySd4iWf4X9a89NH3zV0xwQUhKDOyol/XcVZQdB6tduCO
         SCfWonaxkcT2GseZgspkpc5ubOxnlUf4WaMFES3FPTfdU2ccnGWyrmw6R067/iWRzsP9
         beHRq00QUMVfer2PLokMTrW74Vv9IgJkg0VzOE8Y+HWYin03cSGJEL7xdB9fbgBrzI7Q
         WCZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197750; x=1784802550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        b=h/+X0VT0PvFQvWnZ7Ol74Iq13RC3boYXbVXtNh8irtf/YdGyvxLRzUB4w4uiy2To4/
         a5VGh/NDKx0XIBj4I9bTI+tBCS54GGoOwZLvdXWnOnSGd6yjCL4pAYmpND6U9wZ3SYfE
         7zv3dl5jw73DBSrJ6KabTuCFvdb/QEgUXrfa3CNzaKq/80rYJeg/Y9O8sr+kMwRjssmR
         9zu+a6/7f/rifiv31eOoA0N7bmfPIb4EtscWoAu2yV/fiIXIou4UclRRgS2c1DoIy+dt
         A6VCyLplrCX7vSmxlovU5Hg2qJvBZ9Jd9ADm4MmXIp9d+DT1yt0G0dAq4UMV6Q8LJ9B0
         Xxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197750; x=1784802550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        b=A/H421GDFDvy37pXQLUxtd18aEFGZfbKZzIbN0g1kUZAs/3M2Lmj7T91YpWNQDfYV0
         YwjbOdEniqybmpCimRZz7QydMYZzr3berxzVMVsrLXjz8P08Xx0NMWbuTyUxqH9VA4Jx
         POyAT5skcId3eusexDyV4nowiIRbjdgtp0bjaX57oPzwVdweleKZgZ94vl9/qlTen1bp
         fR628rklMQasj+mN4mdY54bXuITyIu3iCxbDuqvFLNxHidazx3BbIthw6fkO3qtr5D0z
         kfzgwJeFIye1EO2vkly69O5KSuOe2LGT3/hpYIBMmCkQ6SXxT3WDDx3lANVuClI9oSBA
         srrw==
X-Forwarded-Encrypted: i=1; AHgh+RrEZGW39nfQviysYXscLJD2lCG7pfI0+7H5YSLTXjt9GrMQ4xqqGdoLJAOdavOXpVdD0DgpngcpK/Tx@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZi4I0nsLw7dnX8Q1BUAXdXcJw02vdWAGRpNxqZzyZOJT57Yt
	7gRHDW2vSff3ZSNEd9Em80GBeMo6wZi4WVh/Ut8lVbFXmIZSU1ke+gU0v4mpKTm12Ooai1lbqL3
	3LfOu9ZR/Knc7kjCUdFMO6HsngtMwImM=
X-Gm-Gg: AfdE7cn9yF5PSMe4nxCzzDsySbNNGbYtgTGgrp0Zb7Ug2W+18QiX/FNsyl5FsLJhipv
	YbYfMjOR6x/xYbqhI5Fk7xcwpv+7dB4V47zlMq1P4UpLgdg4FPDS+qtVz49FXrPx1O2fJFWpu+Q
	Y3sJ0wyhnAXKzMpAO2jEYMG4UMddo8aWYZO7HbUX9nJ1jThKAbfhP6Hq+ZKX+rKko1GWuopoQYt
	7xiZtQC8TwoDG1+aGy92HkGwJnkrjQUjuDJTu9WZ8yA0+0GGi+VKwiDWCTl6jv4rOez8vR+uWGw
	1r3tvYgltfb+s6S3eRzmUCyOdZXeLAy8Sn6xPgllAzq/PagRI1rLHnbX
X-Received: by 2002:a05:6000:2207:b0:46f:7d90:811c with SMTP id
 ffacd0b85a97d-47f4885699cmr12314144f8f.13.1784197749926; Thu, 16 Jul 2026
 03:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
 <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com> <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
In-Reply-To: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Jul 2026 11:28:42 +0100
X-Gm-Features: AUfX_mxnpT0eulW4NwRS30WvnQ9rPIX7xQABv4l_7unRYg0H_inTZ2rnzW_HB84
Message-ID: <CA+V-a8sxPmhEziG0NmL2VdXBOS75fzLPEVq3md7Hm9y8iCtp-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Wed, Jul 15, 2026 at 9:56=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Jul 2026 at 18:51, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > This series adds support for the System Controller (SYSC) blocks =
found on
> > > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical =
low-power
> > > > > management and access control functions.
> > > > >
> > > > > Hardware Architecture & Dependency Challenges:
> > > > > ----------------------------------------------
> > > > > The SYSC in these SoCs is a multi-functional block responsible fo=
r:
> > > > >     - Clock & Reset Control
> > > > >     - Low Power Management
> > > > >     - Clock Monitor (CLMA)
> > > > >     - Access Control
> > > > >
> > > > > A key architectural detail is that these SYSC blocks are physical=
ly located
> > > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softw=
are Reset)
> > > > > address space. While the CPG/MSSR driver is already implemented a=
nd
> > > > > functional for these SoCs, the integration of SYSC adds a layer o=
f
> > > > > complexity due to a cyclic dependency:
> > > > >     - SYSC requires CPG: The system controller needs a clock to o=
perate.
> > > > >     - CPG requires SYSC: Access control registers within the SYSC=
 contain
> > > > >       bits necessary to control the PLLs managed by the CPG.
> > > > >
> > > > > If implemented as a completely separate top-level system controll=
er node, we
> > > > > would face a cyclic dependency between the CPG and SYSC drivers d=
uring the
> > > > > boot process.
> > > > >
> > > > > Proposed Implementation
> > > > > ----------------------------
> > > > > To resolve this, the SYSC blocks are represented as child nodes o=
f the
> > > > > CPG/MSSR controller in the device tree. The SYSC regmap is regist=
ered
> > > > > directly against the CPG device node. This hierarchy correctly mo=
dels the
> > > > > hardware address space while allowing the drivers to share resour=
ces
> > > > > without deadlock.
> > > > >
> > > > > I am sending this as an RFC specifically to get feedback on the
> > > > > implementation of the SYSC as child nodes of the CPG to resolve t=
he
> > > > > dependency cycle.
> > > >
> > > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > > subnodes because you can register only a single regmap per syscon n=
ode?
> > > Yes so that the consumers don't have to specify it by indexing.
> > >
> > > > Would it be possible to just extend the existing clock-controller
> > > > node with two more reg entries, and expose them through a single
> > > > combined regmap?
> > > >
> > > That should be possible. Or would you prefer just to extend the sizes
> > > and create a single regmap for it?
> > >
> > >                cpg: clock-controller@80280000 {
> > I wonder wether we rename this to `sysc: system-controller` but the
> > compatiable string has "*cpg-mssr" postfix.
>
> I think the current name is fine, as clock control is the main function.
>
Ok I will keep it as is.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
