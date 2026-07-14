Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2E314A84
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047872; cv=pass; b=L3HmE1GCrQv2n0wT6SGcdJQdGEHriCdASC9olX5DU3kOCoXSAtaCpAl8JPV5PyEmc09D8vmbzXNqGZNdwlMcexaNZBlQaeeAmMm/Rz3qgxlW2k/1Nx8cPgOtY9FGcspKXLpojcTABaCD9HNw79D2ZtiiYeyKJo+g+cfz7YAACqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047872; c=relaxed/simple;
	bh=UKuXmnxAZy4X4Zfjms3mGb3B8NsNDeeH3MZJWfiGhEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XodvooVKeTyxHG/054xKPcsw4titgtVHBJg3Z9alnU1G8lWV/xr+JuDBDi/jly0h7lAzFnPCU469sG8Iiw/oLjjFHo0Zh2+w7I37E1ZTPQ4n8vOVDBdKkG0reCWDz+geBTfo+eo2MDvSh4KTCqmFh+u4EYZeaoJ30zo0TtXgfV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUB+07b9; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUB+07b9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47d6c634f45so2537489f8f.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784047869; cv=none;
        d=google.com; s=arc-20260327;
        b=lL6J4pvMgzNUUZjCG4i/hGA0XI+5rGjmskHcyb+PTvzXVQdaFzsrh7zkZXlgkVCM3O
         GyHShAc7KjjIl7ggDtclkNU137i6nllyCzh6iNowx9ZC0/Z8mAiZnp9+diJocWkLUnAw
         qIliu0omHTsEQIY6lDG601vV3PCqONR6WnU7osc5tSZ4vvX3V6N0TANQ1KVeZ3CmIYuS
         mUjVWhWtseN02+52tuJcXpxPDjfpZd+hkZDTcYaDFTnhvHr2l6Q8z6cvALt22tMQaSG6
         LPlWFSwZ0YFChThzfFwm0mMaCMhg0aUURe8pZ1caXp9gUx3TxcDSLAhsiuSaTmpcWLxO
         WUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        fh=byJQVGDOSC0FkLPvnOY9MNshNl5qRQ8Cr9OvVLK0z0M=;
        b=hdvEtOsTJbaBRYYzZccC/QdzHZZBASXfqgnWAkb3ycB9p9GlNR0gjlvj8oCZQCwYeE
         g8twgOUe1eHlKgje9KsqL1e2D1DAilWmFG/MBl7uSbiqXgzzHcKG67QhxvIojD4Zhiyh
         YiOUHcmPjoW+6x2arg7RBEXAV3p65sFjqUEcscsGIsYlfGGmBFDu/GtbdzvbSG5nnfBp
         cd+t7thUCnZWbZfFoyIKkZf67pEPWIb/oiIK7UkAk+sgWXTRkpbVe9nfydZUoIYlGmmU
         kgi7CY8TSlYXju6BSBKjNQF0uIhil7+pEGG4lK0/xqp4JzHgY6CPVajqsN7BHyKUiTD5
         4E0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047869; x=1784652669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=sUB+07b97KGV3ebDMkf0d3LU/JbugGI5wAiuag6v2+UK398tluefGUR03Qt2NGVOt3
         poU3WOZaYSn4pp7yER5a/Tzddw/uxLuMGI+r8BlwLUNOMQpmkEYJ5fOQNP7Rp0zMyeDI
         g4deAY34diw6dPfpcjDMqPsuLXhuI+1fX4H8oicc3qt5mN0Dw6/KHBTch5etD6Dr3LpF
         Vo2XBs61rXFmCWC82PizuiU7IC0sO4juLej9ZePmzKnC3CXA/egtX60IONCorzuqrqx9
         t+T+fSoyeH3ErkF+ezlR0c7Tqpx+FocK+eTnhmz0ZTOTUYKAOcZUUqLhbFWff6hiTyhq
         fFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047869; x=1784652669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=R5eLBrBzmTQdKj0fTEigrPtaM+qduJUONfAVG8qPmQzSwPJhc6NqiAKsUh+1Mv5O62
         VxbFeFg1LC0zZGH/jxQLvCuCAC6fXFJJGaEoLuRFMTtLJ3IDOvfOqXIKqBGhflPYM10/
         2LDhF2Rq7VPGLlqMCxgRRKmskM2k8OkdU85/XAVBFEFCzA87I5hb5sjc1xydSM4uMLz1
         1ABtebSJmkjvAh/IQ8mTzx4m7FFMKAacHMGo+Ljzzn32irBIm4XKgXNVmFhmk93ypADD
         BNTaXevp6lu+ibJ9w7/JMc04fJzd+682W5wDjGeOuQUAGZSKlzPVsYnE+Y1Zfb0Wo2T1
         NMYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/U2ic6OhbYLOzTVUX/X3lL3XBXq6R9GnzWORRsDVxPgFpX8vJJsNbgCOL7DjF6rG5iVFuZjmQgeC4@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYj8lcZZYbzokatRAa9Bf9wnt8VH/rexi1XAsDXi8scCtCNJe
	aS2jh0KMPbLnIs+33p75V2BdH/+ol2j6zygZAXwLWHkFBIoD0CaxX9+aBpNNxbhBFmZS2e1zlKf
	cxkyF/K3eWkwdYooBlB130IXRisXOfwo=
X-Gm-Gg: AfdE7cmtfHfhMjIGb96qYyho9Tf58zea9/G73xQYayH062rzJGFGvOCTxE8osJlR85r
	SUOtqX7vmEo8I90iXsa9nFrUxkQQDve47AKn8n48/QuQgtDbvBpq5JBmagCmkuzbGJLI/HTPBWO
	GxDGt7P/4s5TS+mXgDwJ+lsnAVMQoCRWFHFvKhwjDOGOt+2QezOPCEpxPwdF5hi1dOuipw3xfbL
	9yw7U+I+caHASMqsD26FOsUGNwTOasr2t1ctb4ETxYt1qkE3UaVMYUKoLtZlbx0vfmfHC0F85ga
	piGRndajMEoY3ccIns4QxZJKC0j69vj0YfIJsYhJAFyVUo0AsgHKCe/l8NdG+VDcM/MGwQ==
X-Received: by 2002:a05:6000:46c2:b0:47f:4c49:4318 with SMTP id
 ffacd0b85a97d-47f4c4944a5mr1473055f8f.49.1784047869366; Tue, 14 Jul 2026
 09:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 17:50:42 +0100
X-Gm-Features: AUfX_mwxd6v5gFWCuMlhAPL7PON29wGJJEnO7K61SQDYcZ5CBYFFPz5abzgomRI
Message-ID: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
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

On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
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
I wonder wether we rename this to `sysc: system-controller` but the
compatiable string has "*cpg-mssr" postfix.

Cheers,
Prabhakar
