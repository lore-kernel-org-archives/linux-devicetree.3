Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E783BB126
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197711; cv=pass; b=Bsg7Yd00sprIvTiTyqjnE8HOG+zYT+BqF9cLu3C8FTSAfalIlENXPQNCUc4kSzVj50RIw9VF1rw4xR8Ih5H5P+5raJSxqJnjYTLZ96Ek5TLJZPZ4PPWdseKuNC2bJ9X7UBeVStbj0bVeR6SyEGce0BwS6G7S25FeaRzx9a+dYQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197711; c=relaxed/simple;
	bh=9CMRtIwZMesVCw95SzVrTvn4z9Ju3sAFefPlV/JvBug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJDbswJMwIwXn9bv20DDU5OFNevUsjLoGfv8BreKPNquCBsO2C3gqwhe8+uGeJNrqp3EpCuIOJnPwJ7gD1frRiT1AUGCE3zcgfFYftDrCt/2L4sQsutOpj1bLS3FBYDZ9Q84tiDRxm87DAfLgc6VtQJorJzlVnjxc1Li8YCS/E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYWAcsUn; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYWAcsUn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3663268f8f.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784197709; cv=none;
        d=google.com; s=arc-20260327;
        b=ceWlor5Zc+L4aL76fYjDJfA+PUQ9YxUWkBHRpBwIjQIhIAPT9cN/ra8800BiybVF28
         EH3QvpXbJnvqrJZwQIfQKDUVOvnHXvneXBt1LzIvJT8QBxxnpqGSli5N1Ih0Wrr2lP52
         9cjO8PVoOGaByeyUnSNwEv6HhmSjotV7PwsCn9OxZez5+zNBtW8iYYJdxtkC5zg078KD
         inu60pt3dDNZpAeWxQf4xqbWiuVvY4aXfndILC+8LWdyWfr6APyOxd3mCl0ZX7dZhbOm
         cZLIIx3dfT4RmAGeIZyGmgXMy1MzxI2FgQHoU1YXABe5CEijmz/B1H6nQKPjKAsdtyNH
         I4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        fh=aFvppVhpqZNKbWbD+87DV37yf0sbAQUlnLO4/6xpTUw=;
        b=dirsNS61sEsIv1SzjMBc+owlxGfh8nbPdJv/hOqzxWr4UF5D4EkpIDkPF3ycdVt/yp
         VOrpnIoFVxlIAJImKXQhLWuHB16SIS04ZUgJVMaZ7aKxXjC2a6HARuphLpMn5iF4UXKS
         0DPTjYk5Yq4AxTUxCuZLg84sj9OFzwerx5sUFJy5Z+vQKpH8nJg2tdztdw5wcFwy0Avf
         l0bypvdgnI1txGikMF+28nxhBQ+Idvi85r4jQg7FcU2NuZC9ghRy4gnXUfVdLDoljXY7
         f0mQsVNDDn55tn806TdymkPFDLO/dmXjQ7f6+iBOJ0o+jJtn3ZJ/tA3/xwpAxmxKPhCh
         /v1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197709; x=1784802509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        b=WYWAcsUnVdAwqOs5vyUxESIrESaVcvK1AzNtEF6hYOTLm4fEEgRiMCNGfop6hq2GvF
         0MBVKl9gEuvgzQZ0d8GMIY3tWdPE1hfWyqGEszJa7SKrDK3cKJ3Il67CprncRpkncFSK
         yxeCZ7K2DJULFP045p5gwD1eQjTczqPQOyG02VWbsgRK564EYH6va8fXIbT8tWSdnxsY
         uUUYjN2bKpRoFBPb0q7aNM6e0ZpuOp3Lho/KbPFsqqillaKynFr24nBDRg61DAfMIS/Y
         BljKPs1Nxin3pb9sieHzMCoJnFQjFsvB4GhMVAkTGCzNwJrMUUfC7NtDUJJBPrzJ2/Ks
         YtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197709; x=1784802509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        b=f/jo62T1rWsmoyPu9j83u+aRG+KPfGqjv4u2HD4geaZcVj9bZFSBlo+JLKvU2gINJH
         pkEH6iE/YM0XxScAPj1fMiz5/vPerGlAJByGfchqbuPqMTg7kJW3EYmtvQZ2gH8Ch1ap
         Zv2d8yUqbncbqypNr8JsSOLOCt46VQ8ISAOJv+ommy0xc629FpfKG6SqamSc78yKhu0q
         W27eDbyewsdPOMi55bv/p7yfcC59REzcBTxo9zDdqwXIuyU2z8svMEqYlxilQ3Fevw3H
         xsD95yYOQhmgZVC8aSDJrZTEfCbwqxtgkhWqwOU5OMQfP2xdpUrA+dVQMBo1jWTTqOor
         twrw==
X-Forwarded-Encrypted: i=1; AHgh+RpiostOe1VG5auWFXxb1UVvB6KrWo33Z153WqB/BzjaFVQXwbqPMPVjxQedRRDG/ZO2XlVHOITELzxf@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmY+vkTrLcX91S1nWTze1Q1oDP0DkDqztxQcJTD+F443vp/NI
	gjUVHLjOzdgXmBw8LGsMqclVFBcyLb3j4X+Vwtf3RqvXPnbIxyBYp+aLMA4y9U5CYUW4VpK06rG
	vJxuyXy5IUsl6/Gee6S4xDNlKEgAhtmo=
X-Gm-Gg: AfdE7clSaXeHvtDSHLJhjKHADK14og+l5ElzPgj2sOAM3LZow9zRDLAmITKaOspCMYa
	BmDOVBfSQr4HKOCYwBNoTyWRIOtoEjXaAQWs+JhQ53mNriyyZPviBeLEyrlVs2Ons4mbOzqjPns
	CtnSzDmhWjUTUPA9crEbgd8SmsSz0XMI6sMFFVNVKbt9tsnKSgqTV24sXWLDhjtFJ8UY59tgxBW
	oU/fBdaNHhGxokIoVj+LD5wv6gqnsaUUKSereuub7SXEEA2E1TZ6yPG0qqGnejLmSUbdIpTYwhR
	TIaji4/fMjknb593qvSkIgfF1Glth97XJJvEmW8XEU6szg==
X-Received: by 2002:a05:6000:4a1d:b0:475:f0c2:5afa with SMTP id
 ffacd0b85a97d-47f488bfd4dmr12527545f8f.48.1784197708365; Thu, 16 Jul 2026
 03:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com> <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Jul 2026 11:28:01 +0100
X-Gm-Features: AUfX_mwAsz7gRD0YYf7KOaOpLk2KMZANDyil4268FtHPqCze6MPfCsZ7dyXCIpE
Message-ID: <CA+V-a8tjT8bSy83FcOypSjry8WoVN2w=4hp7yBWNEH0mx_kj0A@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 9:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Jul 2026 at 15:27, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
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
> >                         compatible =3D "renesas,r9a09g077-cpg-mssr";
> > -                       reg =3D <0 0x80280000 0 0x10000>,
> > -                             <0 0x81280000 0 0x10000>;
> > +                       reg =3D <0 0x80280000 0 0x20000>,
> > +                             <0 0x81280000 0 0x20000>;
>
> Yes, as they are contiguous.
> These registers are not accessed unless there's a user specified in
> the DTB, right? So there is no issue when booting an old DTB that has
> the short reg blocks.
>
By checking the size of the resources, we decide whether to create a
regmap to maintain backward compatibility.

Cheers,
Prabhakar
