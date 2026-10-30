Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793328720;
	b=q4WaSNu3nyY1LgkoeIYWEbHfb9Zg3jP8l+FDTbHqap2k1RQDkJJypo6iXT6wNTfWcVOA
	 qX9T4+oXAIuZ3ppOvIP10jLWAr+BV7PiADsE//2SR2YntGk0zFHxrhElVM77O4Tr0MVlX
	 Q0iaABQc2uvLXfYPRfVbJqhUqNoZ1iybBjlJXlN7CYiy9zB5zfXKLDRIoBABDnQH4XRZe
	 pzHbiMeOzG22Ivxh6d6uDV+HVk5iI6PjzN10En+JGagHIQBorflL5CZGyCnOlzR7Pf/T3
	 R5d1YIw29zDtxJstjyGOy6ZSH60K4iXG6J/xuQloZ3sskyVQBifFw7rsHFsp6/G7baA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
	b=eVk+q39SKjbWRBRVRA5KlOwE/PbEdjdnfkAFPz9Lh9OuCQwP+OviLJeUD0MibZr7rNRm
	 7JuBg7ATvV09d3VURMQcVqRTulNBRG8oqvY8o3Aayt2gl5ZZUdyUb0odZ6vlSnFyJiXPB
	 63ZWOYcgDKEcDD5TTexwhqsbJxrVXEeAQb1lod0qVaHHP5SyVh9KjSDRjmvhnRuyqgMAb
	 th/FIqfP6j5T5Lagp8MMQA/pCyB4hpQ+69HJqWgDawQdOha/EPoebP2zYKML5Cj0WE1ay
	 a5CGB3KhDzLnQfd38AOR0Hr+iMJ3LRnHX41PslDXAWgKW5U7tN5utIn3JkdwM+2nGfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=anj5O2Zh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFBB606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=anj5O2Zh
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-676858d42f8so188883d50.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 19:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793328718; cv=none;
        d=google.com; s=arc-20260327;
        b=gD6l/pi50u/IYGDlFJ2tJOrqwfKfkyi+OvpUPFaRa3AS8YiPY9BJJ3jggzZjb8Pxxg
         8HS8aL3p4Frg9o1+KJInNIB4soLPH5gp98eaXkeOYdtuk7yM1JkR5/M2oTNfe7xB63jM
         7tb7dnS6ysRlzk/r2xl3QZrsh2E+eF/3+fpORk91biy5acRUZ9SpbB0Qlj5PvqdEwtlw
         DCH8mO0EHeKIxtVdPDerbI+7tPnYsge1imbPUwy38xOCPrm5MNuJjCdvd60qJX3xAZTe
         2xlwpePS8Vj4o9bdRTUeskh1fOMDQQWBz8eR1GfpiJiyaKF5DqLkx89jzZJ0MHZWoZ+l
         2A2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        fh=ddOFdK6rx0umFXjBBDLzlBGoQBK7PqZuERKyglJz7ng=;
        b=U2LGlmORFz93mvjPlskDCJRO2DTEMY4mB+GNQ7EcGq8O4Y+1s/5s7tKqzg5qbFKjUm
         0V3KhCI0oCmT28GPeJ5o5cNfI8Is+6w+UGvK9muQ26KtF0tDUJ7s4Q4Ymh+u4TZKIdnl
         PExPdWeRRQDp6UkpyODb+yL7XaWsKQEwlAiXR56Yo1Uf99nTtpF/XuV8b2BW0lR05yKW
         jn8aJ0cjOi4aJOpHlqQWBQ/prq63P8cTxIENLM4p91puw1/KR0muZs5+mgjKiYi0pFUF
         OcXoCi7ozPClL3gmImPs/KWojLNpiI0nEvrHx9Io/gbDQ/nYQR92PFQIIOL/gBcE6mcG
         LrCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793328718; x=1793933518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=anj5O2Zhy7jF+R35kYidt3k4/MWzkf3P/QyOb3TQ16Uu3qHaGHiG51pxHzhlyizr7P
         Vh+n46sEfWvHAe/vKerWeesocifeU5NtsDl3/+MRuxNsD+jCyL3HSe4ecEBHBAVmODHt
         2c7oTBPjzFrwT+RncGhSyaB4/7P2VSMAJQaXWtw6mM8KEKinOpzuHtqM5tYFjo6EW1Pc
         KY58UOAKS1BogHH4ayIcKZRVaHwtNpx7/uqH99y0nB7zYOxBGu0ruAbqGkmibePXIe0M
         AUyyDOPfCnNoJggoBWD56LAQwWbiqS0V8ZdE+Jea9Dm64SBOLJqq9hNqtt7i930x4EbQ
         SOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328718; x=1793933518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=x4y8w68o+acYqICN2Ffpj5Vvg99BDtKLbmsh5/1Cb0EJbL3ypPVa2TeFxCjhBPkbpY
         0yQg4sKoCem1zoTncOxWPl2nlxAsaN810nBMiU6fZSEYbFkwNWLnGDW6YuIalpTMhLZG
         osVXUFwmieRgZxRZp4epK+NZ7DEviE7FvnhDQjugp2lusk9klEPQUzvL2l5jJNSZA10I
         tBDnCRYQwIZPI1kDwtS6nh5yXbWhUmQyjt5XG0/nL/XpHODkYCkQacRBlKnQ4SnLihmh
         yQV+M3In1yK6tA4rH/uEGr9ZT+1Qv/mhKxLLxNkyWls7nbOgI9iAGrGrzDU7p1gTeXFp
         uMcw==
X-Forwarded-Encrypted: i=1; AKwUvBxGEBL7YZWl/rv0hSoI9/U5Td4ErmqrQr7iaHLGRGMy2J9xMuHknUqkCmxSq55IngT3KstRW/YUoUDf@vger.kernel.org
X-Gm-Message-State: AFq9FYLWzrq7hmkjBpUXpylIblpjGKBk3RXsADlWeItPJcSINDBJMejR
	9aS/y8x9mKcgzv3+d9MdT1zwugkAWuWi/cCjVfZPycH2l3V2fiJX1HMhu76e395IOEVaiWulVJK
	ZpkuvKtCpxgyefwD8sigqtOsBeENlGYsiVs+6ao9+lA==
X-Gm-Gg: AYBFou03QYnuSUYiql/zMTVGV+uT4rYc61VSqGDwekp7r9EYRq5cA04X5oBdrlgYtjX
	5WVX/bIBz30Si8KlI9giuTRkabuS4p+NW0flMzz8mHHRfnWC/ZrEaXgqyPVNpyhBYvsw4iw9fC4
	wiHpaORQPLYC0ohOeuVTUpJQlSs9gFuCFPsFP6i9EJQtP6BmvE6Xe7sHELAsQm9PyNMCTOEinfU
	YvDmW+/tOKPyNMo1iaQPUVYGeyJqKBzw/rYPbv93jznBcpp/OG8MgYXxBDiK0l9zUcZp2dfrdC/
	bxLwXg7jd7lOJrG1iNNQ0JKsot1WnW9x5qqQqWitC7zTZk9MGBUdCOUxDncXmE/o2pTyBqu4syd
	qGR5GrjymOCcypEhFLZijQc6DtHHCdZpndU6GEnXBL6SEtiAVBkvC+OnDiwUR+6eWzlc9OZQBTz
	I8GdfM6kaeFll3tA0h1QvwGn0=
X-Received: by 2002:a05:690e:454d:10b0:679:a353:7a7d with SMTP id
 956f58d0204a3-67ba4eeac55mr426041d50.53.1793328718349; Thu, 29 Oct 2026
 19:51:58 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162343.1896134-1-e@freeshell.de> <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
In-Reply-To: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 29 Oct 2026 21:51:46 -0500
X-Gm-Features: AclHuK_jwkWhvW67oyVz3_xpn9l6bwLOir-RRbNmugfkCBr6eaFqkHpPNMfZ2UY
Message-ID: <CAEev2e9aYewWgOjxSq6ShaLpj6SaYjxQq+C-L1zX2vHyWH81HA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

On Thu, Oct 29, 2026 at 9:04=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> Hi E,
>
> On Thu Oct 29, 2026 at 9:23 AM -0700, E Shattow wrote:
> > Change the "reserved" status of mimsic and maplic to "okay". There is
> > an mainline OpenSBI user of this and setting status okay resolves the
> > stall of Linux when probing peripherals at boot.
>
> Thanks for bringing this here. I still think status =3D "reserved" in
> k3.dtsi is the right description.
>
> (To clarify the Acked-by I gave on the U-Boot thread: it was for
> carrying the override in spacemit-k3-u-boot.dtsi, not for changing
> the kernel DT)
>
> > @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
> >                       msi-controller;
> >                       riscv,hart-index-bits =3D <4>;
> >                       riscv,num-ids =3D <511>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> >
> >               maplic: interrupt-controller@f1800000 {
> > @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
> >                       riscv,children =3D <&saplic>;
> >                       riscv,delegation =3D <&saplic 1 512>;
> >                       riscv,num-sources =3D <512>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> > Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 =
SoC")
> I don't think this is a bug in the kernel DT either.
>
> This was also discussed when k3.dtsi was reviewed [1]. The DTB built
> from the kernel tree is often loaded directly by the bootloader (e.g.
> from /boot) instead of the FDT that OpenSBI has already fixed up. With
> "okay" there, Linux would probe the M-level IMSIC/APLIC and take an
> access fault. The compromise back then was to keep them out of the
> kernel's view in k3.dtsi ("disabled" at first, "reserved" since v5)
> and enable them for the firmware build in -u-boot.dtsi, which is
> exactly what your U-Boot patch does.
>
> (Also replacing Guodong's address with his current one in Cc.)
>
> [1] https://lore.kernel.org/all/77f9a001-7f0a-4c29-abcb-501e875da117@sifi=
ve.com/

Linux will skip probing the M-IMSIC because of this piece of code in
imsic_get_parent_hartid. It returns -EINVAL unless it sees interrupt
ID 9.

    /*
     * Skip interrupts other than external interrupts for
     * current privilege level.
     */
    if (parent.args[0] !=3D RV_IRQ_EXT)
        return -EINVAL;

I see this in the logs

[    0.000000] riscv-imsic: interrupt-controller@a0000000: no parent
irqs available
[    0.000000] riscv-imsic: interrupt-controller@a0000000: failed to
setup state (error -22)
[    0.000000] OF: of_irq_init: Failed to init
/soc/interrupt-controller@a0000000 ((____ptrval____)), parent
(____ptrval____)
[    0.000000] riscv-imsic: interrupt-controller@a4000000: providing
IPIs using interrupt 1

(a0 is m-imsic, a4 is s-imsic)

[   10.727605] platform cc000000.interrupt-controller: deferred probe
pending: platform: supplier a0000000.interrupt-controller not ready

The M-APLIC probe is deferred, because the M-IMSIC wasn't probed and
there is a dependency in the DT for it.

This shouldn't cause access faults as far as I can tell.

One would have to implement a dt fixup in u-boot like Heinrich
mentions in that thread to solve this.

>
> --
> Troy Mitchell
