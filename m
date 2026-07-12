Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42137756A
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892113; cv=pass; b=BRfUnl/L70tDY0ADm/8v10dmKgIm8SJrmuPZLkRAxWL5lY5yTkexcHE14kVvGlQ4Rk/pjQoKxCJr1Ksr38pEmhBgW2o05WSxYyObN/j+Tjx0sgNUK7/9iXKXe32ih7JNozQD7dJbixdvfBPhXllE+N/eobnZKt+zOsNiMmxQJds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892113; c=relaxed/simple;
	bh=4lgjQbnrS1gX79OUu4QY4Xk489ZtNNQh3P3tnZi5bfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMrsrK7qYvAyQ+rAR4X96oEPhVvqqAltU+iFA12WgTFIB4QtR0gFFZpXve0DiW5CXRrmkGcVCx/xADAZMjE790m78n7rZyw61dV6T0n0Iq8lUX9f0Jj1M8i3AHOLVpW2x4rC7T1+YeZFYxbg8HhqTeIu/UKqkoXZkNywgFYpqZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opvqs65e; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opvqs65e"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso3686245a12.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783892111; cv=none;
        d=google.com; s=arc-20260327;
        b=YDr6S2KRa7J7sPtS9uhikcSoQTd/uvuMRD/CBbPq8tthbq8cgVOW5bUg1ql54kg4+9
         eFF1XrDzdNuXz12ctk/EN+qtjOy5uFrIULWj3wbZ0KGYDt5wOe3Fe03IruL3yo9V70zJ
         +g0nEt1RNMEmW6PgTwT9enXEWr88/3+4tN/NvYVGPy8tJzt+tSS9WQxijUEKi+6v6krN
         I+4H9McZwG+IcxPXXif1G3ek908BGhup51qN/cvb/hVkrIapELvBfuZI/sTxTqQlEO28
         JzSTLWlqdU68p2ApTU7CwzhbChkv/npEa0Mm3HT7QngzC0bIJmaQe1kd+1o91iAsSpKe
         5a+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        fh=Ds8JCQr4wU8FGIXBNYpb2nu7APgkellcDiifYxasSmo=;
        b=qinX4juz2lBSIqg4rW0lXKWHPqoZjikubJ2Nby9ywct8pEq9eQRHaa6F4PbjKzD+nf
         9K9qUJzX779mi387ddQcgnmXWeNqflRbPakdIQMfK4wmS2ACquNqJu1nBPq1VXotlL+L
         vYX+vrDlp5UDy9a/5sXCcmUlSaiRG5mgP7HNizpYZ1G5TMmaIGOYZA3iB0UBDCMQSiCK
         FnAnCNQYwKzj1fnzwFpLXPma3nIHvlY7YkLSa1qqqTOiPLLlXkK/tTvB6wy4pwuu6HO1
         3fxOShJhtemTnZvmLEunIOB2FnScOxqeL3DZPQZL9begWo/ydeD7h9ZaYPyZMx2iWHKM
         +Q1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783892111; x=1784496911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        b=opvqs65eldSDLgM7S5419sYRoqJz2jk1mdSGu2hk6Dse9hLNXQRBIbTm+vvCmpKDCI
         SfxD3weNZyqrgcALfBx4fHv62QQviJQU2Khm8CAlwdnu6PVkC6sURG4MpzeuA3mDua6w
         aKzPq0mKDPyHtWAQH44PuHZVfeZVGV0D5T/d83LQd5C9uvIEWrHPR5Tx+td0kpkT9Vx9
         jDcrl3LZOOG71nDnb/0wd4xRWeHp/etdPEmI9Ts6QJOgudCXsAysdUm3eOhYkEWak247
         Rb26Pg1U7Sdek+YGQMNBu7WTH/1gaJkPRqPYpu/pJ9o2a40A1dS2JqaQFmTjEVLIQxx1
         T7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892111; x=1784496911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        b=qVDALrCQlnaF/yIWcomwQJ6ego9+Vs7XtOT8pLsKa2CI/bB4fKJFZAoCoynEfUuqVp
         ABOlZHO3BwWhEJLiQb6aKrO4TkojdQ/fZkM1GN0rEhsZZ6bggZEsUt19vZaCDGNvtCXU
         GbjLXM7Pd+pbyxzyR1s8/VZIA6iY73kN4AqfEisB28VUPBLzTihfB6p/1lYGedwyfK2Y
         RNpMISbc+5QPVMPHg6H6E8j3t+pv7jE0XTp9LsRPNOJsCvqf9z68Fw2agnM5h/IIbgGP
         O7fh8vvvv4JezZEaJyn5q25xXOfyOcgFZ36+vYYNhbnM1IAUBpgwnpFqJUt56EcjJJIF
         5/UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZhvYYi84z75sSDXm9ENFX7vK3+5I6Wq72pV8O25uW5WFKDrpOlaILYOksGUNmE0HVLp3CT7Q1oiZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YysleKUqHu/cjS9rcXmjrFVVNjqiYDI5C+YPaJ8+ZgXmWtx498b
	zu4EgiXfzv3zMyU2txGdt4VY7+K3d55VA56N+e3FysSKdW4R6XkRn+USRS8g4X12pgK73VnDVJj
	giDS0EZzxIySfJ8eEe4RN9rwdLjify1s=
X-Gm-Gg: AfdE7cmZYwA9lBWhp4TotzmO3W8epNU9ct/X94SnamJPGmaBgR/Vl2pzi46V7Rh717W
	ifODGsJc/juHpmhfCXwoJ7LTxxA2E0Wufel5aPq0Nh3S3DNBsE6j3gV1YWHd0b+nnug93arRaM3
	kybUNRUWAhP5BCTZzcQQr0mEvp+JTiArmxZXotQ5vNGnY0uNBS1j7Hm34Pf/Ur5c7MXwSPARBe2
	YGVLw8mzrGJZOxgjjI4QNKv1sncUQ9WJpvnCadgeO72p0RHL4KIumpW8k4lFRiXSOTJmqz7tTLV
	iUIAuTjZ/FTOZnM5CcGARrGqQfG6VKugetZMyLhTrBRG8QDaL/y5HVgsIqt/0Ey8SPN7NTE+qpR
	EuAtTYU5vqBI8HKWwaW2861kb/GmKi0v0fMTrTKKGdhcCMSxcWO5VlKQdhPxLGsqdt69UE5XE+T
	7IVkqKEI4=
X-Received: by 2002:a05:6402:13c4:b0:698:e595:a54 with SMTP id
 4fb4d7f45d1cf-69c5f22db6cmr2912144a12.25.1783892110564; Sun, 12 Jul 2026
 14:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709005005.1587852-1-rosenp@gmail.com> <20260709005005.1587852-4-rosenp@gmail.com>
 <20260709010212.3D7C41F000E9@smtp.kernel.org>
In-Reply-To: <20260709010212.3D7C41F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 12 Jul 2026 14:34:58 -0700
X-Gm-Features: AUfX_mzOo3NXEjUnMcIaXCByvIGPK_bkdr4Yrjobep9w2U0y007HAPWVmWixMJ8
Message-ID: <CAKxU2N-Z3TCN8axeFYw+dUCexukWqBoQ1PouPdPdWevuguXKhQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 6:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The struct device reference acquired by of_find_device_by_node()=
 is never released, causing a memory leak.
Not relevant.
> --
>
> --- Patch [1]: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator suppli=
es ---
> commit 737d149c64d97348e97b79fed6b2378d4f1a140f
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: helios4: add SATA regulator supplies
>
> The ahci-mvebu driver and libahci_platform request three supplies
> on SATA controller and port nodes to avoid regulator core boot notices.
> The SATA controller and PHY are powered by the 3.3V I/O rail, while the
> four disk bays are powered by the 5V HDD rail.
>
> > diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/ar=
m/boot/dts/marvell/armada-388-helios4.dts
> > index ec134e22bae3e..af1e81638f829 100644
> > --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> > +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> > @@ -217,13 +217,17 @@ sata@a8000 {
> >                               status =3D "okay";
> >                               #address-cells =3D <1>;
> >                               #size-cells =3D <0>;
> > +                             ahci-supply =3D <&reg_3p3v>;
> > +                             phy-supply =3D <&reg_3p3v>;
> >
> >                               sata0: sata-port@0 {
> >                                       reg =3D <0>;
> > +                                     target-supply =3D <&reg_5p0v_hdd>=
;
>
> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but do=
esn't
> adding these supplies increase the chance of memory leaks during probe
> deferrals?
>
> In drivers/ata/libahci_platform.c:ahci_platform_get_resources(), the devi=
ce
> reference acquired by of_find_device_by_node() is never released:
>
>                         port_dev =3D of_find_device_by_node(child);
>
>                         if (port_dev) {
>                                 rc =3D ahci_platform_get_regulator(hpriv,=
 port,
>                                                                 &port_dev=
->dev);
>                                 if (rc =3D=3D -EPROBE_DEFER)
>                                         goto err_out;
>                         }
>
> If the newly added target-supply regulators return -EPROBE_DEFER, the pro=
be
> fails and is retried. This unconditionally leaks a struct platform_device
> reference on every retry because put_device() is never called for port_de=
v.
>
> >                               };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709005005.15=
87852-4-rosenp@gmail.com?part=3D1
