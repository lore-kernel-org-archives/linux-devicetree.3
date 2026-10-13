Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163D51DB1D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908842; cv=pass; b=b2WXLiHSm6G18NmrwyYduUrrGwqGhH0xbn9QDD/gMMLwrM5dKrxdBFEldzKcBFhxP7RT6s9JQD5kWGCrcwX1nZdUfkFVX3+IYA0SjgzrdOGpST8xzXsnBqCp/I002nvsjCcB6PLhFGffwLJ0bZZJGYZj8qPzPNNJt+6AOjvh6aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908842; c=relaxed/simple;
	bh=w0IXztAu98K98cCd8kCaVJg3QAtMwDa5REUQqF4U6dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bw8vGwGGfmBkG4uZPsmt/vDxKWA7E4rM8ZKko6/LRNVU2N/Jl2mr0BFHxabsXSoHBWjP0xBDHy67zg7nG9m5NB1IAoLnA6LmDNvK64BMmJFvNajdb+z0MWcmRhBOhxRgPcAtz0rFL2h6ggfCrYXGHW3lcTSswdIciNfArjKumO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAwz60jT; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAwz60jT"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so117682eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791908839; cv=none;
        d=google.com; s=arc-20260327;
        b=T2ic+rMhwpZmRWsGwRBs9nu5JAb3t0TIQc8jveQ1Ur1lbYKOn+3ggFqYtSbVPT0zmm
         P4xcF2pWovEqj00fKq1sOgp8DCo4KanQ96Fa/xlrcUGgRMU9UfKIvz+o7S1KvLDZrJ9n
         nDnAlwjIkZE+Ec0u63yOuhSdMCBfneJNhuvczK5NYPEqlE07zCYFL/K2Q9QvYlJKpdX7
         eLBUdyocx39N2zj4wD0pbDsft4czQJw+zKqpzFC1v/nN3DvsSUIxMP124WacK98Y2lC2
         p194LU/lAaSatv09L7ZcRUnPwFWFH1hd+hQlgNDSWqeoh11XCvc3x11sMdPVorwouWlK
         yA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        fh=7xxxUZjt4grF9P7LFh0SHXzjwXXpL/RcbbI0IRbwmF0=;
        b=c1+GnZiCuQ9XHMqU0Zn87bU7gwRhiRBmnE4V7tAdoQCCkHvJsdrd+Fne/TLMW+Lp3f
         yD/F/GUupcDYcO5AMaf7JZ48vS09hg+FpU+Bp9x56wq+YB2RoE7J78Of+Y7lFJy32i5j
         w+dGgc0jTHOpUyQtDlgiDLP9tgr97VB8K5uoYUQW8VPqVYD+AeR02AA1pqkXtL1xYxL/
         kuQuwrF20R2Tk4AELb32lsEPUJfw3SeGvm9msJwSfiAR171iim4ZWtxfEd+wZDPFVn+O
         UN16x/NxsWB8rhNMXZENVOUZJawt/AOYYiW5HX/3owGL7snJksFRhpMqQMCjdHyhwcXQ
         DZ4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791908839; x=1792513639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=kAwz60jTjbXZ1371SUWeIG50qMgcdtsu5vM68Do4i7fJ9AvXrLYXxi9ATctv5C4yfu
         iKRFsv0E+0bVccekECc7CRwDvTecF/0JE3S2LAHroLpe712G+NNAZKESuMmUoSHLjYfV
         h8rpk5auJVECMX+ymh3Yp3z9dK+JvPvT0mjjf+i77PwAB5KG7sl53zFvVFwtsZBTYl5e
         wgES8+x8HofSP+HdUOmGgjJaDgxtqUqjfH9aw0FzADG4EOZUqi4MEAMnoAsMS3enx59F
         P/52p8VFiL50edSVcTU+xfNQUFwJO8xk+bHdZK4/CouCoF5NTSi6OgwQHLGtmBKVJdII
         P2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908839; x=1792513639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=ccTW1cGn8cCGLIZqFnNWii74bPC4quvprKUq3XUKGku7nz0ZO48IEa7NtPpr2Enq0o
         1MyW4fyOK4swA2ujeWsi2PXy5ab4sERkCirYMZIy9Ra59UKuXUAkF/f0858nehFIiE1R
         O5O243mNQ/HEeIxrdniIxGX1dfnBwTM6xljSLhq3VvBtvydjKdY32K0/CGTfF1HuksVF
         G/WA0PRM+dYnm8KOkIHsRQNEkstp0D6KJfOMYBIPrgsFS6ulLLxSB4YACJp6nPp4zTZH
         ZZe0bc0YAlSg3IKbmNumBJVYnED4abfq1OaNewLbMfLroSq6DsfBHw/nFVweNs73CUR3
         1MRg==
X-Gm-Message-State: AFq9FYKsEKo+gtr24myKCazeULVJA2xFJ3Mp8+haV5+DOb7JG2XYXGgN
	mqB511BlZB0XUUQS/oJON1B/vwcWOXcduuOofqXm8VHfupvQEPgMtaXUoMVNZ5bGsHJZVHpeu5O
	FYcsfXl1do8GTIHg3MjrKxwfQqdAABm8=
X-Gm-Gg: AYBFou3ipNMEZCXbU+zVfVNYzx4dR6kSu7nsOwfWSTOHpLzWFV3ZDTD31BDkKI1S5ot
	O7V+dKnvxSWbBTFcJOi633kjcOoi8UoEr/o+QzZeMEfcAFIzX8exiZw02b3Uw3wI43oV1UKYWVN
	C2Lfd8ZL01z1DIjc18KFxq+YRoEpp1Omg5lSP4ClxogVlOckReeaEC/9rs/tlY3Rm5Fgd8pBm8J
	cRqKwulQCM2UD5cPhhe5GFJ80tSeUsxitL1MU9xH9C495AyhmgFG3d74KgmavUHpLgcjS44v2vE
	i7XStUHc752WMNXIGHPigspIgXuW7QepjDf5OAARKXNb/iSXMuqAonRXe4Z/tRDDUpdCeAnxsfQ
	qfGORSVm7gJxs0BwVfrnp4/k=
X-Received: by 2002:a05:7300:e002:b0:35d:5a2c:2321 with SMTP id
 5a478bee46e88-35d5a2c2980mr575512eec.20.1791908839126; Tue, 13 Oct 2026
 09:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
 <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com> <as5XpdpNm4cRGNcj@orome>
In-Reply-To: <as5XpdpNm4cRGNcj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 19:27:07 +0300
X-Gm-Features: AclHuK_-dlj4_NR-HXsrfbWG6hEOQBskE9gcB79-TNecmzBROYTdvzz-we1jX0Q
Message-ID: <CAPVz0n3ki1MdkUnK=znzt=uSrwRMbyXfdvGzNrxuB7_mCK9F8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:1=
6 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 12, 2026 at 01:56:48PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:55 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 18:45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > Add nodes for recently supported device (ALS, LED controllers, hapt=
ics)
> > > > along with minor tweaks and fixups.
> > > >
> > > > ---
> > > > Changes in v2:
> > > > - added USB configuration update commit
> > > > - added p895 power LED trigger update commit
> > > > ---
> > > >
> > > > Svyatoslav Ryhel (9):
> > > >   ARM: tegra: lg-x3: Adjust WiFi node
> > > >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> > > >   ARM: tegra: lg-x3: Lower supported suspend mode
> > > >   ARM: tegra: lg-x3: Add light sensor node
> > > >   ARM: tegra: lg-x3: Add flash LEDs controller node
> > > >   ARM: tegra: lg-x3: Add haptic engine node
> > > >   ARM: tegra: lg-x3: Add backlight LED controller node
> > > >   ARM: tegra: lg-x3: Update USB configuration
> > > >   ARM: tegra: p895: Update power LED trigger
> > > >
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 +++++++++++++++=
+++-
> > > >  3 files changed, 127 insertions(+), 10 deletions(-)
> > > >
> > > > --
> > > > 2.53.0
> > > >
> > >
> > > Hello Thierry!
> > > May you please pick this patch set if you are ok with it?
> > > Thank you!
> >
> > Oh, you already did. Apologies!
>
> I picked up version 1. This v2 came in too late. Pull requests go out
> before -rc6, which in this case was v7.3-rc6, released on October 4.
>
> Looks like only the last two patches were added in v2, with no other
> changes to the other patches, so I can pick up the last two after the
> merge window closes. If you don't hear from me after the first week
> after v7.4-rc1, you may want to resend the last two patches again.
>

That is correct, v2 has only those 2 patches added. If you don't mind,
I will include those 2 patches in a different patch set, you don't
have to worry about them in this patch sequence.

> Thierry
