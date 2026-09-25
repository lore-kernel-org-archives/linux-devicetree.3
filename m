Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3B374E64
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327384; cv=none; b=XaKS158Fu56A9RbqzUxB0x5OrIJ0IpGMBpfzoy75DVpBGhbwI/hRp+K1nxX6qC815bsB9woqnJvKMCByJrpAPPeX61nghCqGnym5D1s9S1TB3ZXT9R0z0v+/z6mNu2j7xpVDuNKqQgkpolHPUpSUKVTyTY0zfJIKvcHSKg3WGXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327384; c=relaxed/simple;
	bh=JSD+TgIxUmEnVVwDb4pGLRv6GJ5iCZmtvwC1TTcFDd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO1tpKQd4c23+9rcITgwvvHTygvVA09c38zdRdFdqI79XSZMef4uc1Pq1tTh5812fyJd6O7QSU4uNqGK5mD2HAb1PkfyVDsohrdTxVQeq2wKq30W7DCmCjPXTcbUzTZCuBNU+dJ/vZticCnEgr0Cl0D0I3CnVaUZ1g0/xQlI+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c9031e714dso199450e0c.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327382; x=1790932182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2mULua+FE1sFuKc/3gIaxuYjcdlUYIe/5IDBg6nt8Q=;
        b=HWVb7uCgTum9EKx8JnSx+XKBYcscXr9stNcIUORUUgWHk7oQFFXFIuoWHLK4VlwJEo
         CPsAinIpLxnOAu1RhknOJyFIIp9htWKhl0x01Zagv94RZTuL3tO79AZcHUUVhMOIaq2G
         HXklJiFSYwFxKDO4Pv/Q5WyodkzXE3q5tWP3lNflI+kokYhpUFrX7FnVP7TVba8EqKG+
         JHLEwxwAgO8u4Ce9vtTNshE8F58tTOGWRTwF/EnG+zzTzGuIN4yjz2rRBZ/DiDFeK5Pe
         8BF3ofZ7u4uZUIEDnn/RRj3L5ZruJAQAv/0xspZz1Gm8FANHFbRT3fiMCavjJIodUCpK
         GGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdCQwETuHIrlh9KR5yh56fGs3OpB/PbROdbn/KCDrTs10fjjGwoWVh1VIy8mLtW8clpGVfxZEPBaa/@vger.kernel.org
X-Gm-Message-State: AFuF++k2Q7s10H/1Jjk1ahg+nHRs5AK5BPW3+cJWJjzSkcLKeLkK7eSA
	yhyGaGK8FfVutze2a2NbHDKXCBBz1D9OI0TzvDEHrxGgE7cnQj+8PVMWgFQGrhlU
X-Gm-Gg: AYBFou2sf9A96CjZZB0zv4BPNdNJhuEk4tt8BhRcH/zFGwIytGmXLN+HA5Q1S4PivES
	+0/0Gfw2r0JuYXe0L1dX+o5UoojxAcGZPMTfc4TpJID1obXUOr8BVES652ctu8BDj1xIAEXq1ID
	sqJMl5ibVe6Nw8CrAGpjRyBWJWOqhX2jQq4PJoEZJHhx8CZpjlgR8lWoRmcgZOSdK0MPBI5Mp0S
	vkikn2QAiIyTFZuNnd2d4rDQzhrqZFs9Qm/6p0nx8kty8HUW77KW9Q05ms/KHcIqlanuOUl26ma
	ChhEgjYIeI103sRDZzeuzWX1J0qv1+jU+MUKhBKwZ/Ed6rHQG926SldzNf3cWiWtFBF2V7bmMQi
	c5O003iFkpDCFFD9HhdD4EwLiPyU6epudK6mi/gkB0s6lSpWTn9VIBKWYnf0oX6pgvYjqekYG/F
	vlXwB2j6avuooQgucuqOhfeFOHJMj6yC4VBWRZbAsUrLec7zAdAjXw2PEeGYyGmx/QoStcvqeq4
	zyQavCQnc5J9fTeOC5A/MsofzHe54t4QIVRSw==
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr535083137.2.1790327381813;
        Fri, 25 Sep 2026 02:09:41 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc64f9c59csm2008251e0c.11.2026.09.25.02.09.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:09:41 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso200346241.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9N8OCgVkOeKh7wfLfrsowbD2Dj/lyjiHrW53GsHQOEDWgaaJnngBq+K1VlHBJQGsQP/d3a7mI7l8h@vger.kernel.org
X-Received: by 2002:a05:6102:3972:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7b2508e43dcmr267969137.4.1790327381172; Fri, 25 Sep 2026
 02:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org> <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net> <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net> <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
In-Reply-To: <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 11:09:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
X-Gm-Features: AclHuK-nFf1UvHjbP4pR_ScRMT7oB1x_81A0GYs9PIzd7j0I7JJQ2mhJ3JMjGP4
Message-ID: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > Just a question,
> > > > For automatic software upgrade, if the reboot using PSCI fails, wha=
t
> > > > is the fallback for reboot, reset the board?
> > >
> > > That seems to be a bit theoretic. The reason for having the ability t=
o register multiple restart handlers
> > > is not to have failure fallbacks, but to have fallbacks if preferred =
restart handlers are not available.
> > > If the PSCI restart handler is present, it is expected to work.
> > > That is why it has higher priority. The idea is to use the highest pr=
iority restart handler, not to try
> > > one after another.
> > >
> > > Sure, the failure fallback works as well, but that doesn't mean that =
fallbacks should be provided just to
> > > provide fallbacks.
> > >
> > > If you claim that the PSCI restart handler does not work on this syst=
em, provide evicence, and we can
> > > discuss this further.
> >
> > I agree normal cases there won't be any failures
> >
> > I never heard about PSCI restart fails. But have seen a case due to a b=
ug in

Oh yes, if PSCI is not really implemented ;-)

> > serial driver that made the PSCI restart to fail as it hangs the system=
s.
> >
> > So, if this is the case, a memory corruption can cause the same.
> >
> > Long back I worked on femto based product(single core), where we have n=
ormal restart
> > and a fallback watchdog restart. But it does not have PSCI system handl=
ers.
> > On some cases, we have seen automatic upgrade failed because of failure=
 in
> > normal restart.
> >
> If you think the PSCI might fail and not restart the machine the other
> alternative would be to export functions to configure WDTDCR using
> readl/writel.

Well, if PSCI resets fails: that's exactly why you have a watchdog
(or two) in the system, right?

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
