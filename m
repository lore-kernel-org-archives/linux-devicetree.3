Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831583D6497
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105801; cv=none; b=S12NJsxU8VKcc5N3clVgXhSe6IGkcKV4Vktj6wjVCFAwWYSAd+J1iCs4DNAfpRr/taaW01dzF3YToLagG17eMQ+VvBJQA09Myx49oTPHCTzJNjqFb/wxc+hmx+mkbQiE4+M8JdYWf3JXAI7lnQ3+wGFmUjsXnwFxelK+mHmQK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105801; c=relaxed/simple;
	bh=UpStxGVYslbxooun+2Y901dqVJN3H5rYG1yY1FSZ/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUdqtFPAwwVx5uklB4+OYh177puqZtlF3K0dTt9xzyC+lje9xsQkx+pvdMKwMnUB8ETas1vrFUioaN+YZJzHbrJlVSG8dT243fI4TG2S3uy6EimY3IvwDvrh3tOd6zcbnPLGpSOCDPlA5zH6hwsITeSNP7hnEje9zLb51Mbjn1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so3242514e0c.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105799; x=1784710599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIyweZY2e0/6Tej8S0XE9Agd9YDC5DXPE+LxKJOtIuM=;
        b=LoBc6zb6oF4/zVfIWsZHyL69WujgXMukD1J+fsVYoxE/z3McJ462RUNPGAGAoz/cIp
         MkJkl+Nr2CZ5bzyt/Wyogbz4vGEGq8KujhrQXgn6DGP0oCi1TektEdZd136j0XpNjEyk
         Ir6D/Dk69uTkagnfmrEnCL61gH6IA7p0huQ/4BIiYydO67IisZ+CMsgeApOhSYT2GjU7
         8K0L5oBbsm/aMgOUl8sK95iHtDvWXolWHRna1K1ytlO9R7WykokS3QwYVUuWxWlQSObi
         8Yo05yzTFtX0T2JM917pBzq+I10MwF38r6Fe4mz4vUTr0jsmlYm+uaEW0fd2ZnEhXEZ6
         G3mg==
X-Forwarded-Encrypted: i=1; AHgh+RrWTyFvU+ccf3MZ5nuO7t0JZ68vzTrBEX1GAQ5lB1TGygtqxOjxV6yFe3eb3DYBOouQpzjNJwDDUojr@vger.kernel.org
X-Gm-Message-State: AOJu0YzfogFidmUvb59rX3Cqeh9jk5ZfEQBIGp2xEkBY1swglBGvTcQp
	1k+XEmCeUCGWnEw3ud5arDOsEkFWgv2QCmXFAojwlM0X8puZHQl3r7zi3QNZyJhK5kQ=
X-Gm-Gg: AfdE7cnIflwZ28DhMGON8IWpk1GSwtIQbE7gbKOkvOnNIPFeOAnjMU5T5HUrwfiUtVz
	SPI9uFjDEz6za+qO8KBysnzpJJTySP3ezOyud7p4J/3Z6xnOAFQiOeJtBt+5n3mHV2DL8WchmVW
	w0FmisNPRKVtQvji189p0Qxqfn6cEvK4CicF0bLd+gANkNiYYwd6I0MUwRU2BQoHSCjbSw9itvz
	t9S5gyI/He3XO/ToSCj98lGyRAQAnsAL52yrjFdeTNpm64T09Xx9WRCkOA3DSn+vc9csxOla00n
	REeIC83bO9JrXhyomZRAeeemgtB7WISLmYjwizZStkBUvs5r5cFtctzgDKxO3QZU+4AcBApvSrh
	ZsDxA/3DDvREQHChTpE/mmK8QxEuTs6JNWk9f19+mnjIGCH/JxvrabWfAjprNtyOJ1gkDtJFXd7
	NYFaRO7U7lINPtsEl4LX5cwIsv1P5VtZhVW+hNwati5+iYyg8+dQ==
X-Received: by 2002:a05:6123:91:b0:5bf:8109:dc81 with SMTP id 71dfb90a1353d-5c1163d46f6mr3305691e0c.14.1784105799030;
        Wed, 15 Jul 2026 01:56:39 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c110f6e64dsm3231867e0c.17.2026.07.15.01.56.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:56:38 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-73b909fbb6bso3344814137.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrSzUNfvcTF7DG5zWCp2/RGWT4xLDq7RFk4CznUDyFINqLOmdcp9nJbbYwyIUG+0nFfn6G4WONaCqho@vger.kernel.org
X-Received: by 2002:a05:6102:1499:b0:737:ba2e:8a26 with SMTP id
 ada2fe7eead31-745875931d5mr3323342137.27.1784105797210; Wed, 15 Jul 2026
 01:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com> <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
In-Reply-To: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
X-Gm-Features: AUfX_mwT5leJvJcjodDPFjgFmedyheuuombdI-qCHkgNmnfgE8I_sxJbNtJF5DY
Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
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

On Tue, 14 Jul 2026 at 18:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > This series adds support for the System Controller (SYSC) blocks fo=
und on
> > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical lo=
w-power
> > > > management and access control functions.
> > > >
> > > > Hardware Architecture & Dependency Challenges:
> > > > ----------------------------------------------
> > > > The SYSC in these SoCs is a multi-functional block responsible for:
> > > >     - Clock & Reset Control
> > > >     - Low Power Management
> > > >     - Clock Monitor (CLMA)
> > > >     - Access Control
> > > >
> > > > A key architectural detail is that these SYSC blocks are physically=
 located
> > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softwar=
e Reset)
> > > > address space. While the CPG/MSSR driver is already implemented and
> > > > functional for these SoCs, the integration of SYSC adds a layer of
> > > > complexity due to a cyclic dependency:
> > > >     - SYSC requires CPG: The system controller needs a clock to ope=
rate.
> > > >     - CPG requires SYSC: Access control registers within the SYSC c=
ontain
> > > >       bits necessary to control the PLLs managed by the CPG.
> > > >
> > > > If implemented as a completely separate top-level system controller=
 node, we
> > > > would face a cyclic dependency between the CPG and SYSC drivers dur=
ing the
> > > > boot process.
> > > >
> > > > Proposed Implementation
> > > > ----------------------------
> > > > To resolve this, the SYSC blocks are represented as child nodes of =
the
> > > > CPG/MSSR controller in the device tree. The SYSC regmap is register=
ed
> > > > directly against the CPG device node. This hierarchy correctly mode=
ls the
> > > > hardware address space while allowing the drivers to share resource=
s
> > > > without deadlock.
> > > >
> > > > I am sending this as an RFC specifically to get feedback on the
> > > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > > dependency cycle.
> > >
> > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > subnodes because you can register only a single regmap per syscon nod=
e?
> > Yes so that the consumers don't have to specify it by indexing.
> >
> > > Would it be possible to just extend the existing clock-controller
> > > node with two more reg entries, and expose them through a single
> > > combined regmap?
> > >
> > That should be possible. Or would you prefer just to extend the sizes
> > and create a single regmap for it?
> >
> >                cpg: clock-controller@80280000 {
> I wonder wether we rename this to `sysc: system-controller` but the
> compatiable string has "*cpg-mssr" postfix.

I think the current name is fine, as clock control is the main function.

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
