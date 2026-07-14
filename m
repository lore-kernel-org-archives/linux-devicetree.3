Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E270F3368BF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035653; cv=pass; b=fynMvbcnZLXT8w5ahlLHeHtH8Cfei4ThY5GgNrThIY54IEagPrJ5Gb602PJmaIZibcHN08XHMPHjpgRFGuUg4iJ1Ft/Ufr0Lhxm8AZf+QGmM9mwhJEzk09y/r8LWN2LbuqRcGT64qE1HNkU3m9gj5fHtnez9nbazNO8OCXRALaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035653; c=relaxed/simple;
	bh=JwVJDiR+cBjS+r4fEWc8OMyrK+FkqxIoisO4S0dbaKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icmCjLiQPeMQk4fd8exUDyN/wT8H+lF6YarjD4iYnO8NvV4EDX182jczGNQsNkRhVSnDs3FW0ycbvwD8aQOaKEZAL5MRsyCoMo2BfI2ZMe9Aos3YOKSOcBgzoGLylt7dBrT1raZNav+XMcLJ19yVNenr/7L5eHGBlK3d+PWdpjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd1aObQl; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd1aObQl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso2911238f8f.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035650; cv=none;
        d=google.com; s=arc-20260327;
        b=NPS3+jclMnRHLx0NNY51nR3K0esupiYCuDcxJ/XD00YmwPpUcGX1oYiDVzxyaSeZqb
         xWXjKS+LsCWVbmclcwReF7fTlgFGsQSN1zODK9pg/zn+OYL8jNw/JZKiDHlZSPfU3gmi
         7em6gj6yAfBI4xEIwxvC/4F6tUdq2+dJ0vtcJfMuKvEBJDv6Z7Tw5fpsY4YIkxn1swUt
         xOTN/AB61zmBPFSbpQlyjuvxSLF6SS07Mod/3mrIEBkY+s+xWHW1Hhlc7DJInU9Ixj5U
         qOxGd4mP8MkRfDu3QujOyxCFrhJ94N8/SXSte4FqkHJrVVqz+56PdQtY+wXC0jOzdsmi
         c6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        fh=pR038krwILSD8CE/rXKnbqmufhcClAkpKC/x+dnzpgw=;
        b=IAdwWoBKJoOBLKa1HVhdfdq3qccLmxQ5HqxXhul+OLGDmKyhm1Ge4l+NZkubUmpLXs
         58tvZu+i+lx3UhxgMHbiB4I81H8SBu9pPTNjT6UWGp6ywX7ZqhaQIyRkcRj0v7tf9nhy
         7m3/ee1/e21DijQxkZK9h5cXDPZnik8Y6VcvUNFUGH1KJFvq7waJgTf4UXTDkARe4kDU
         r+zd8B+vVZzvW7jqo6cptCoSHnp4eiNxWWFUv3a04im1+34QsawbVeqnU3EYd74bTSL5
         XVCnkZhZuQjuLfQR+xbKY4sSotr37YQnBFksk3V9Mz54UtrYDrnIPygfB7adstBlADi3
         l55Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035650; x=1784640450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=gd1aObQl+qjxD929Ebl9GEw5vMjRAD5Ra9FjKX70snWGrmmHxmsnIeVpMD18Erdzkp
         UKkux6CpyLniULXKsfExXEZboQQVJkbJeBHN/C8OmQTYdq7wSEDnf5sj0EdAIX1xDPWH
         45N61XtWPmVHa1wbOEUhCtCTfUfV/BiihBjoUjZMsm5ffpc4a+NttdzMekEBufsYzzYM
         q9lRJ6931LUKwD/wZDr8+ZkavKK7+vUJX0St/6vsN9ETG2Fnr4macCZxiosPf4iC0Ojh
         YMF0QbXrxTkWmzl5LCmZkvMdEteA7C0TWqyYda1VrNJmvlxsro2+WdSFl9sW0dDvtlJh
         h7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035650; x=1784640450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=hw+hnCFo7HVRwPWEJvqvzKT8lYNqicEkioNnTyINnZRnZoyfkOY2xXWC88DZsKM8K5
         wAgeyZTr7hDFCbqS62siYgAjCEzNOwofJpUE5e2bvssrHoIBGjVlA+rBhLJeekYPYLyL
         HzReJbGstQvvAWUipELv+0GOdCL3vdlOzspeaj9REnmvrZuP58cw/+QXpeXaA5qNCsms
         NveaipDdKgQML5Ezp+PO/NkqJa78MVeGrCu9TiNHVGnjB3+qjEqQBvqoUnCpGMjvbVf4
         8AdqHYzIK4LoEl1E83eBYqSdbJPUrTD4i7/7mF3KIiM7XCFYw389w1nQtcrcPuv1VGNb
         0M8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8tM8HDtqRJ3pT5VfIU4DMkJ7v3Teri4TWNpRDUxqCrjtRGw69ale/ovppLcECQfjHK0RyVddosuTE@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYV6G61pZa55wnZdcyE3dImrVTnHOSvHF3CGDU6PWH1yzdun0
	2wMviJ/TWeUwn5rTrM6SOa6UXhTaf2+ZC+SRbqhkCNZ3fpYFRDhW0KW0GEW7cG8FEnPbMhmRpt6
	xDiAHcOf70CUQ+rNErqeJwiK7n5MnT7M=
X-Gm-Gg: AfdE7clRz1HSkJvIUBNraQWONOhpxbYSVvwukaZ+1eNfw6xlp5h+yPuR/ZpYn83HJDI
	dgL9Wjy7eeROOljj8iVn+YWbBLnNduLbTY3+wM9wBArcfwqUGMZvviAh7Z5cq/5FkQHvifZ9xU6
	snbwGYmGERX8UWX5znZinSjoeO0uKRG2C3ld0yKw9f+isHSYA6n0O6p1wrdUd6TdU4Y2me4R/lV
	GbN5GalvTZ4B+UoVS42sBKunKOKCx+8X44TDcfUmskKZWMRmCkl8ncc0ZSwPMlm1lTbNN2PYbf+
	Uf2KPBYvYHWfcjEix94ugsszs4mQnit/r7svIBcBfe4I/y8fIaJl4NBV2nmyiX/5BY5lYQ==
X-Received: by 2002:a05:6000:4693:b0:47f:4650:e45c with SMTP id
 ffacd0b85a97d-47f4650e4e6mr3694089f8f.12.1784035649771; Tue, 14 Jul 2026
 06:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:27:03 +0100
X-Gm-Features: AUfX_mz-bUh857aZKLRp6jCySBSNe_W4CR-bQsVZRSwNXqRoLizYQlsdmvEfzQc
Message-ID: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
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

Thank you for the review.

On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > This series adds support for the System Controller (SYSC) blocks found =
on
> > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-po=
wer
> > management and access control functions.
> >
> > Hardware Architecture & Dependency Challenges:
> > ----------------------------------------------
> > The SYSC in these SoCs is a multi-functional block responsible for:
> >     - Clock & Reset Control
> >     - Low Power Management
> >     - Clock Monitor (CLMA)
> >     - Access Control
> >
> > A key architectural detail is that these SYSC blocks are physically loc=
ated
> > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Re=
set)
> > address space. While the CPG/MSSR driver is already implemented and
> > functional for these SoCs, the integration of SYSC adds a layer of
> > complexity due to a cyclic dependency:
> >     - SYSC requires CPG: The system controller needs a clock to operate=
.
> >     - CPG requires SYSC: Access control registers within the SYSC conta=
in
> >       bits necessary to control the PLLs managed by the CPG.
> >
> > If implemented as a completely separate top-level system controller nod=
e, we
> > would face a cyclic dependency between the CPG and SYSC drivers during =
the
> > boot process.
> >
> > Proposed Implementation
> > ----------------------------
> > To resolve this, the SYSC blocks are represented as child nodes of the
> > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > directly against the CPG device node. This hierarchy correctly models t=
he
> > hardware address space while allowing the drivers to share resources
> > without deadlock.
> >
> > I am sending this as an RFC specifically to get feedback on the
> > implementation of the SYSC as child nodes of the CPG to resolve the
> > dependency cycle.
>
> Personally, I am not a big fan of subnodes.  I assume you are using
> subnodes because you can register only a single regmap per syscon node?
Yes so that the consumers don't have to specify it by indexing.

> Would it be possible to just extend the existing clock-controller
> node with two more reg entries, and expose them through a single
> combined regmap?
>
That should be possible. Or would you prefer just to extend the sizes
and create a single regmap for it?

               cpg: clock-controller@80280000 {
                        compatible =3D "renesas,r9a09g077-cpg-mssr";
-                       reg =3D <0 0x80280000 0 0x10000>,
-                             <0 0x81280000 0 0x10000>;
+                       reg =3D <0 0x80280000 0 0x20000>,
+                             <0 0x81280000 0 0x20000>;

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
