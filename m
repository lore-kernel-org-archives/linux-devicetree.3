Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21E2BD00C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171009; cv=pass; b=aw3UEMtaov9YL7fjLcVvatXLelMfqgY/TFCB8t4gLgJfvJiAIZw4itiPTEwnJf7uWPz7IPtqUoTiRnp6nyOaxHG0L42DkNO7KJjGBoDBW/8kW0UXTVXoEeUk7V57YSstxs2wjh0KXMahwFPA+RCoInOUiX1NDkF4BHonfedUVCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171009; c=relaxed/simple;
	bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgHi4JwZGugCwWRz/DeB21v6uloeaXckeVazxeJ++1bxPWIHSTaLOBJipkAQCv2tWAdJeIYzNkX9I1u55vlTOZLzKXa1yCX8nH6ZAe8ztXJb5SgpRAoZL/SUf4mmW9UgXVMLGD1Q8ChDn7pf0FTgIfrJRgiVD8iqtSKT1IcfwH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFD5jiBe; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFD5jiBe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44da2de25f3so814541f8f.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778171007; cv=none;
        d=google.com; s=arc-20240605;
        b=hY69F1hNc/UcshP0TSdDwoYFs/yzt4gV9kc6wx+FW6BtEmvODMI5rrmWFCWyH02bNP
         L1bFeICktXuEuTvmxnQodGEdqz98P2kIaJAMxAb+h3A4gioLZskcAJZmZxNqOWXfWay0
         P5wNyvIRy4A63fAKiGcET94sQ/+X2oOO6dkQ3h8kJ7nLOWzWOqfOPby9Me2Kj3E/e4az
         0G+ptWeqPzNwxl0r7iYqMAg9A1wAoGffkUOn8rJ+BKCK/9T1+CtoYL80hk9hF6Ug8NYb
         ZBm6E+/SmusWIKfp5uS+EqQ9pThcQSYZ+Yh9S93MdT2C/W5a+oPcu4MMHvBt/AplcDYp
         22hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        fh=V+g+gGZ2h9T8rR1DzSK3oFvrDCQY1wvxRrp7gDO9qyg=;
        b=NHwyz9rZ3WaLng7VSlT4/tUYMPQQEuQrmmNZ+ZWyDq1gAH3Fp24CJaN/dEZ3bV9ts9
         OY5jP+nsl/DD1prleXdwCJQ+Uxcg1KTIFCho5nzIVxSHpHulVuBf+5/k11LPbY4OgV66
         +kT6ppnCX66BWu1Zwj6mZs16XMBFmWP5wsQYekpXrbtxrnX2o9QJVRJdXNCuED2r4gIE
         jI0+lN3WIzrjntkvB3IVHBJIKWdyRLpK7XUONw/OdqPS7yUxGyEwXvH5XuXVCwD3nHDe
         DHIdBf6g/FoSyk4y7qwMh63sqqAkq6Gr9MXXUTFIwoTh3vSzJe4v+id0M19evj2OaCvU
         NwAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171007; x=1778775807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        b=RFD5jiBeugTjgunOG6HX677AfZppbuHbkSeDSdFJ7bzInULv/CbzlMWYdh5b4vWkND
         W7GYSoXqvpfo3rYs3ESi5wI6zaMGMKJiDpK7FLd4jQ0G4xhBxc/oN2YTPeR/yA2zdj4J
         KaVoqPzzxx2OsBWc/nY0zIHjnIZWovd7PF9rQWakA3g2Qg7nHw4mFfN6HPKpjqu3AzVT
         xzvbteQCBzQLhVpLTREckvLp+rOm12jKH5hDhfSyx59xT38FjKlR2iOx04v6s7RI7hka
         c3zMa7tfx+17AF4CPgvr18Qa9YsOVHXqdDKXriqzJL0BAULl++L1DtlLqMIg8ojs90SA
         cxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171007; x=1778775807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        b=n99ZnYU7u+s0+CuvT2lEqJoaqbAtByQTkpNzcHKWX2mCmByoaLLd483tTlOdF6B0LA
         8XrN1Z243Ii/UxXOwUuFv2urFfQtX76SmT8RvX0kIYXN+XmO5xtHtJpcdEUoDg4Hono/
         rKxniAN3LGkNh0klEGem+RGvCcAJMl3IalilR1DVEQFrDEAB47Ba1fZp5FU0xdEYUL2t
         Hr9OH7ei5V0MeAliiB67fxWudnetvwEOJK0xzbg6M/1kacKfx/luPfi99hIU9B+LkIkn
         xHeDvIAbmKxmZ0Go+pRuJbsZzAM+jTD8YJEiP7IF8boljJJldhY4PObTmkq7mEEzTt7P
         L3qw==
X-Forwarded-Encrypted: i=1; AFNElJ8JLcEyx7VInlPX7AMmDtfHMcjx4Oh2kiDr8ig99MwMEi07ISItUIRC1uF+bkXytK+HC4MjdAn0YF1k@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDHq0ywmwTH9uFXLp/JKu/uTVgcWTzW7LiLZs7PZonc49eERR
	S4NNpcFJaKcsOglc8nPXNrCNRoeVVDApJJLHR0ZNsD1v+OX+jcW1qBtrMk2Ze2nKmP2lcCoQvLN
	B9tYi+bf5hJIOnqSFF1P9LihNijDzB3AlmBHhITw=
X-Gm-Gg: AeBDievbFGgey6j+MDd2HuNM8Iw3UXsBQwixQmS1cA5saC8Mx9BQ7uxxKyhkEBWlfng
	Pw8ae20D3RTfhliO1DRmd6eow/oTZmUj35TpoG4iiMHIGipAosiisgPO9E9JJwdoQ3Mbc01Kdsd
	+1ohd4mpU1Kr1BkWVRKeRWcKtewMwu+pn9e78yldgEy44AzaWpmcsZuSWJ6zyOLlOBcegGHpkk0
	r+zG4+v31lVU28JQNf+GTt67CAxxbq/NmdJ36lSM33t4JJZ50rKTn0Lp6H/mCXUQiVRfmq/+QBN
	Zy/771ZiwuEA+eeHsUgU2V0TtP2WoGvKjnvarqBdrPBlfJc3IOo20tIQNuDsw4ut31P8Aw==
X-Received: by 2002:adf:e786:0:b0:451:bbe4:b48e with SMTP id
 ffacd0b85a97d-451bbe4b4cdmr9706562f8f.5.1778171006277; Thu, 07 May 2026
 09:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506195002.GA1778786@killaraus.ideasonboard.com> <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
 <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260507103830.GM1778786@killaraus.ideasonboard.com> <TY3PR01MB113460CD4F3609EEA898FE648863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460CD4F3609EEA898FE648863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:22:59 +0100
X-Gm-Features: AVHnY4LRMvX5NWqGQvTosoP_Ri2LYKGR7IldmZ4eLshJruHuK1dfbRXarsoS31o
Message-ID: <CA+V-a8t+HHYNxet4Od9F2Hk980kQ5yfru4-hF1f-6i_yKZGN0w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
To: Biju Das <biju.das.jz@bp.renesas.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju, Laurent,

On Thu, May 7, 2026 at 11:54=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Laurent,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 07 May 2026 11:39
> > Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ=
/T2H and RZ/N2H support
> >
> > On Thu, May 07, 2026 at 09:24:48AM +0000, Biju Das wrote:
> > > On 06 May 2026 20:58, Lad, Prabhakar wrote:
> > > > On Wed, May 6, 2026 at 8:50=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Document the Display Unit (DU) support for the RZ/T2H and RZ/N2=
H SoCs.
> > > > > >
> > > > > > The DU block on RZ/T2H is functionally equivalent to the RZ/G2U=
L
> > > > > > DU and supports the DPI interface, but includes SoC-specific re=
gister differences.
> > > > > > Add a dedicated compatible string to represent this variant.
> > > > > >
> > > > > > As the DU implementation on RZ/N2H matches RZ/T2H, describe it
> > > > > > using an RZ/N2H specific compatible string with the RZ/T2H comp=
atible as fallback.
> > > > > >
> > > > > > Unlike other DU variants which use a multi-port model, the
> > > > > > RZ/T2H and RZ/N2H DU has a single output and is modelled using =
a
> > > > > > single port node with one endpoint. Add a port property to
> > > > > > support this and update the allOf constraints accordingly.
> > > > >
> > > > > Wouldn't it be simpler to always have a "ports" node, even for
> > > > > variants with a single port ?
> > > > >
> > > > I agree that, from a binding perspective, always having a "ports"
> > > > node keeps things simpler and consistent. Biju suggested this chang=
e based on earlier feedback for
> > the RZ/G3E series.
> > >
> > > From G3E feedback, I got the impression that going forward all future
> > > SoCs needs to have single port and multiple endpoints. That is the re=
ason for suggesting port for new
> > SoCs.
> >
> > Right, let's clarify that.
> >
> > TL;DR: it depends on the hardware architecture (what a surprise :-))
> >
> > When reviewing the G3E, I noticed that the LCDC has a single output tha=
t is connected to one or
> > multiple encoders, depending on the SoC. I think this should be modeled=
 in DT with a single port.
>
> OK.
>
> >
> > Note that this does not preclude using a "ports" node, containing a sin=
gle "port@0". If you're
> > confident enough that no future generation will require multiple ports,=
 then it makes sense to
> > standardize on a single "port" node and no "ports". If, on the other ha=
nd, you think that some SoCs
> > would have multiple ports, then using a top-level "ports" node uncondit=
ionally would lead to simpler
> > bindings.
>
> OK.
>
> >
> > I'll let you all decide what you think is the most suitable approach.
>
> Thanks for the advice. We will use ports that will make the binding simpl=
er.
> We will continue to use ports for SoCs which has single output connected =
to
> Single encoder(RZ/T2H) as well as multiple encoders(RZ/G3{E,L}).
>
As agreed, I will switch back to the ports property.

Cheers,
Prabhakar
