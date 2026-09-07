Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4954CCDFD
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 01:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743996; cv=pass; b=CXo5cje2djx4q43/KLHRmqIO1Tiak/mT6SzMcPy3qd4dKbLWRKJRBHSKc2qHhCMkezxvcMzpmshaiUY7/0kwXuFGr3QMX5kqYJEx8hFqt8yyCaPRIS3oFg0H6xrUAvmiBtYfb1U0XUHRySsOMwufMJgfygic8m97mmwVbJHYiwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743996; c=relaxed/simple;
	bh=+bgq+L6or+IDlA78bRvqIw5zVSAvaI/hHpR8dhEneWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVUghhTdLA+2Ttfp8sEpqBDPQUkbw6SDa0I0Frd7x8XQWdddLxmGyYwTOhVTEapSe7XPe32vZ/VIHOowCzb8jmrIWohZJrTUQQqDaldckmK1/WX1clw3NMF8PW9NWRXdhAOH9IB9klMlvYs5DLBKXYAX2QQQtrpqJceZpWGkemw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiHV/3PK; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiHV/3PK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a7f27637d6so3732191a12.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 18:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743993; cv=none;
        d=google.com; s=arc-20260327;
        b=lxh/lNew8IOMtNpvd6B00uaYJt15dFbDRRV8MzMz28okcnIPMkVzskRv985TQotp2k
         o348vchg/ZLkjeUKYvhIVdvbRa32KwRx8gII+jMRYE8nzCJe/OnjB7u+sACOVCrS4VPQ
         AjHNz+XJo1cJWnkZYuyxPY+wKnfQOZ17A8PUiy8S6xOkx5RStlfOYmFvbJqC64Narzpo
         JNUyytshQtNlfpBdgNdd0G+X+qh3ExyLsZAEp0MLqE/hYPv1su3DfZ107QELNhA3tpmr
         e4GjauRzetZ6E4JCA8zOk1HhfjXOYQYVsfKQfy83WByzVVgcfm3KzBPHoTdYVfcexCmQ
         epBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        fh=i1H9Jx84IDuDP0XJrXZ35WmVAGw8ssSCx7NZVVAQc50=;
        b=dTC9l4R8hOg5i+vCcbRsLUsEeqihzVRYQI1oAunSwGxIV9v/xxQRU3VMmSZNczLoUg
         vSRjS0UuQ5hnJ4TdPqz2MXHUpV6+P7AFNa7eDG+WLkh9KXnULZIh2/tAhKlq0/6b9NJa
         3c6EFKvDeOaPlbmTlSbz0VW9StKcshFp5ukvqLOfKH7enj6yqRT5fnZLhZrI+7m+NZ9/
         Ft9z/JAcjbVY3rmyd2kbjhzS9TmrRpkt+xDtKswPYkQB0TRZzboXdbOpzdx2VLcYwe47
         smgz0ucsChbcuF4VgMLXP4MxnSsVzD4a/n/HkeXFkJnDMS3QE1z8zRiwKDNcRcCrY6pI
         d9cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743993; x=1789348793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        b=PiHV/3PKpr8RhQFFBhQFGMBu5kNmDi48mQ/cN+Bc+Nl49Csq1iI8qExqenexBbaaJx
         IpfjHRnAblbtneGjG6pXrelmeTCksfhMRAqazvlvT+2QwAdCs4qZj6zghI6xtj7mSYjR
         NAVruSaU/HBlRoYVtV/vQ66f10iPmOlvSQjahyqxqdtxUCyMBbJ520zJYCP6vHpfxDUy
         wkpObWyrCg25E2O4d24wVZORlWH2Vz0tF3/ZFN2ui0sF30AD/peV1PNgFWzbTX0y9lHl
         w+kU/6TgDyXPT2BJmLu+sk1d/78pFANqhm8IPINs8oueeXlhviaIkc/lsJbTqeLAvQPg
         7Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743993; x=1789348793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        b=oaomM+SuOMA5qpk0jEVmp1Bivzky7rrwk8mxcUP1zJchXTlP3HQ6esXlNm1dJJR1x8
         k6LRrll+v9aEQVbF7+ga6CsXsHvKOUnr8cn/YuuQ6KSlCKrBXa+jZqgt944ThKqNaRlD
         8lXMUk+NZALf18GLKfQHKD43fBhdx+eitrY5bE+RgiHpnewAb+WR3UXwwIajT+b3e6ZD
         3TaKyEEGCICCbzvrRjfDTTonnXOfKyZ1+nBRz5iw4w5HXbYuG1Z9B2lcZIfyiCTcM1Z1
         vUZM+1nl2noZVDA/r5QC8nTI6x5kfCXKd6kBGWJakvLovwZNBOKEfM4hgRjx5k6wP8no
         d3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb7CsycQDphAYqCINkAKLPifgX2Mtk+50bT4iGiJR+vIP1oqx58gV+HrMjK5KiB/0nnveDZYXPvwcw@vger.kernel.org
X-Gm-Message-State: AFuF++lsddX43uWxUEOD0xWxNsD3Qf74EEVv1ykFe1n1zSHCLHk5dIdE
	6j+930MUCPXiGi5GKjjTw9A6BKjkhklTrzJA68YJMBzlSZQassXnLt1/QrPqto4ffE49SpL1wXI
	c56xjBPdYucZC97uxeRiw5GCCBzYQ6v0=
X-Gm-Gg: AYBFou3qkZjRor8TSRwHoC60mBjew9HmCblt9037o6zoSmhwac/OiM+DUmxFzlhfK4e
	yWkXqgM6jCbQw3Sp6vx4EYQuhCnTld+hvF8vr37pSK17Ya3t/Y2waRN0blfs2Az61sLElFpL+ot
	npya/TJcL3BKg7fsrqZDDe9DG4lmmQX/aJTwNUOrD0l9XiI1ym2Z5VlZezUeHnpNy4ZZBPoWYQP
	ANec/F87HI+CkmfpjhjqEyKSHnSht4i2+ifcqyLPZbWQNufCeOhVjRlDwhvqgnwByQrAMHlPDS+
	beqfv+jpmJJnL4D4hlBLGFtigBwl6mx6xq4+2YJf/bdPl1K3HDuDsjwIkLYG768vdpyqeyXlU61
	fYqrDc8IWa4DcB3KTcrWSi5d909O+YkYbYWeIYaNUCF4p1K5uHxRf/dm9MGzjxOxPqiO+OM42HG
	YbqLhZkq+w7DK2F0JIwnnpMJUpEYpLmxs/QpZQpRZowNVHC1/4ufOtQWc=
X-Received: by 2002:a05:6402:2354:b0:6a5:d8eb:da01 with SMTP id
 4fb4d7f45d1cf-6a7e89bafb2mr12647144a12.0.1788743992532; Sun, 06 Sep 2026
 18:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907005933.230766-1-rosenp@gmail.com> <20260907011244.7EF5B1F00A3A@smtp.kernel.org>
In-Reply-To: <20260907011244.7EF5B1F00A3A@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Sep 2026 18:19:41 -0700
X-Gm-Features: AcwNN1WYswUQc0zUlJCYnQbmGuD4N0nctQMc2I7e2Ms8ipma1Za1wN84R-zK_-M
Message-ID: <CAKxU2N8PjO48hK7Ay+Xqc_3QNf7u4JvNkj1Vh8QWRHJqOuOxaw@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 6:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Replacing 'nxp,pca9555' entirely with 'onnn,pca9655' removes the=
 fallback string, breaking device tree ABI backward compatibility.
> - [Low] The newly introduced compatible string 'onnn,pca9655' is not docu=
mented in the device tree bindings, which will cause a schema validation fa=
ilure.
> --
>
> commit c8f9a287a2365f46a814726f590cf6561513d0de
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
>
> This patch updates the GPIO expander compatible string in the Armada 388
> ClearFog and Helios4 device trees from nxp,pca9555 to onnn,pca9655, and
> removes a stale comment about I2C matching limitations.
>
> > diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/=
arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > index f8a06ae4a3c91..4a61e9d1a2c0d 100644
> > --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > @@ -131,12 +131,7 @@ &i2c0 {
> >        * 15-SFP_MOD_DEF0
> >        */
> >       expander0: gpio-expander@20 {
> > -             /*
> > -              * This is how it should be:
> > -              * compatible =3D "onnn,pca9655", "nxp,pca9555";
> > -              * but you can't do this because of the way I2C works.
> > -              */
> > -             compatible =3D "nxp,pca9555";
> > +             compatible =3D "onnn,pca9655";
>
> [Severity: High]
> Does replacing nxp,pca9555 entirely with onnn,pca9655 break backward
> compatibility for older kernels booting with this new device tree blob?
>
> Older kernels lacking onnn,pca9655 in their OF match table might fail to
> probe the expander0 GPIO expander, breaking features like USB3 power and
> SFP modules.
>
> Would it be safer to provide a fallback list to maintain the device tree
> ABI, such as: compatible =3D "onnn,pca9655", "nxp,pca9555"; ?
Not relevant.
>
> [Severity: Low]
> Is the onnn,pca9655 compatible string documented in the device tree
> bindings?
>
> Running make dtbs_check with schema validation enabled might fail if
> this string is not listed in the gpio-pca95xx bindings.
I will send such a patch once this gets merged.
>
> >               gpio-controller;
> >               #gpio-cells =3D <2>;
> >               reg =3D <0x20>;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907005933.23=
0766-1-rosenp@gmail.com?part=3D1
