Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815622;
	b=ojQs+MSNjihd8uD6cqQ2YQZqyrfRFQCGIGIAWehMw6Df2DkhNALglxm9hAEHOar7OjAN
	 iGXTajuL9tVj7lzBIEW+ev91EF7a/P8+Gyr88+wbvLDOllr5PeHuizEXjeq216u29Y9+E
	 6hst31ZoAebBt32zfGaLPhJzcE/QP1+nXNbasdH/td5mbrL6A1eANF9BFnDBxc2oKE8gq
	 HqrZ6UnUX+oOMLNR6TljcbqiQzhtu0Jl1RDJ8zL1ttWFhdyxBV9xnvfp96D2GfjHf8RQV
	 IFjfU60MeVMHWMv/Yehm84diLtHpx1fzCcCAZUbsDf7hUpamjX0gpH+GaC7B9LCIKoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
	b=uF+zCK7APGmHqWrzY8Xmzr83qxL1umVDXid06rUqOsS9yX6mbPwYiYnRR1nHCU2g/MXD
	 10HGoFqDybI4Ic1n1qalpydvEMP2YkIOvCHez1bKhCEISldf0CqRuN+VhlFtmZS8/qtia
	 e71ALDxLV9J1IgnO9g7797sMneR3ulAW9jtnCQb5Sr8lmAW37dyrGmCZCLzoq+oor+edY
	 Ps2b8am6sfQvCsJGpsyLOZeCCrvug+49Yw+5mJsSMALssGehlwXEN9bmQgLVIF+cfangK
	 FeanAnBZUnNHXA+i0k8vRa68TKdJngXW7C5ZpcmgGdj5lk5UUUe9+LzKd2sjGz4bIkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWmPRP8p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9637606D83D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9637606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWmPRP8p
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so390273eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815621; cv=none;
        d=google.com; s=arc-20260327;
        b=GSwhISlJXwL9Nop9B0ixcCQxMS1cagNPuozE4CGtCgdgrvqc4kJjY+82tQOk4+jpMl
         VnMxnRmGao8xSum5ZP/cZtbwea6j54mqNC8SGYufXXg52xHMNOKvPXRiy26H2o+Fv1oI
         oehHYyvco3QpFV5wKtIGnSJnb3UNG10qxgzgANImNgrD1wTbRGhJDwG2JcWwYnnsSMpz
         orwoDXA3unE9qhrVZv4jXvyH4/j4Ks8FtCFOxV+TqzqjNjfLKulBy+5F5j4OnzzGSv6n
         v2P63wnP515JdgAHUapH9BxXbIqux01PqENBkYUw9Lh59brjNg68b37tisiAmpSZgmQj
         prSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        fh=BqjD3spyZLc7dI+9vAtUuJZcoP54N3ahH3T4rFpWKJw=;
        b=plnv1o6QJNPaCwv5xeNvWP2n+SwKoIMhcp+8iWhnVNrFTcGlydCZgKJzdXnPtoKsGe
         6oCsdehoNb+H7mAyKMuMcxUVquMpZlhr5Cicd+j9u6dtBigrWBjZh6oPb8H6KddO8h76
         myPxDuSV+aakHj56LJ64OOAHHQKarJmPymyvTzHIAj+K1Dl0hvkJ3rB5HBVzsMtP871X
         H1auy2c7TYOKTC/D9/cUynqaNZB49wAOUkl5+qLJdaWn4e3tSVVuPLhfeS6MdWTnwyOs
         OfaCc4p3pKOzoMv5x2WHD68YPhibaF9dSp0tTiX3GlUULi20nJLeG8RcW4lpnWoaCfWe
         jekQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815621; x=1794420421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=rWmPRP8pmzZzW8W0weeDG/OlnEJ8iiK5uWTivRyxBY/KU76o6Pv9tJ9Q/8jPBjsabE
         GiFNkzo0QRv6rvLzTuNfv0f/5B8nU3wgGJlbPe72/NxvQH0MOFF7qVda/buB53OZszzj
         4dRgDxFKGd3KsaHEzmkwQNdJSavqsb+FrnafscD1xFNLpB5G0UmnqXh1u+iQHZAjmhtq
         PTNiNl+uePmwZfMj1X///3jGZRgteRG33fVbIce28abdlQYRBb+HEdUGqIgCDpT/PU4g
         bVG4C/7hZOQk6sjDhyDSdwL6iWICr1cNRxw7kg0PNvImqfjJjfwjid2iRHCOjnBO2yB2
         PxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815621; x=1794420421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=Ia21u+EkwSA7yojgRp9SSorta9dRQX8Cnvp3BEo5y7K/+3NNWcS/CtcdQriHTKB3A/
         1M2veDmsVBPLarVvYP15u8uKFD2ULa5CbNtcda6vTSNS3gei+/cZGLrWor8xbtQrA11b
         jmwdFYewMOhEQPLMuTFjhxF7D2QGivq2KoGF3a6HhQ+CRY3flstWANwrUoLpdHPW5bqg
         0E15r+uXxaioI5NVSrCtMpE5WXfYo+Lxhkq/Xiv2pjYETNn61rvWyNr2j0bLmJcNxft7
         GOCxuLgt80PTNOA0Npxh6QTg6Zjd1FbbUF5F4FrV/kkjfRrX1BvcvX3jKmIcP8IHSNWn
         1D3w==
X-Forwarded-Encrypted: i=1; AKwUvBwhfZ64aaDpf0qh0HOna6tuU9DxDI5XXXayHd4Mcl/twU8CMMQhhAfimhfiN9LJggtuF/DzUcyfW1IM@vger.kernel.org
X-Gm-Message-State: APuU4Z948h2sn1cWymNz69enSqN6a04SaXojufEY5JJyF2ymQB8HAYMq
	w2xyAg2mcmp8wzFPeLUlB/oGFfIGOviFYOIM9AS7wXMH8Vm+D9DrX90nkS/pel5oGw3Et/AL2LI
	yx9avcVYYMUk1cbG8YFssIKP3XFMjJGiLrAuW
X-Gm-Gg: AYBFou0AsFhzwYej5xc/otEBdFNT0Gf2KlMjb7rPYlCAiESanhZkh+JT0e/ajIlTnvA
	eaN1PxVtou3fS9MJ1MG0suXPZJKX9m+BcQre/pKr68e9Nue4dH9z1d1qZOR5tSIaAJgKgE6IJAn
	/NJa0I3qDv3xwmUjfmbRb3VScN7xbEs3pVwvNWdMOG4FblSHyC9mfOM+7tNJwF8ARdUvYmNbUVz
	I/KpF/r+QaWpqEwLVwLzeCgW/mH22PKqBiusxNSzacLB+hlw9dVPISdqAIjd2oQC0lHExRL6wFx
	7QL2NFwumCeOSRMxvYy1glqVc3CcGiR/pbetjeT6O66zPno67LrxwzBKYs7j7gjcCZUeNmXIWRG
	q/GvK/TdVnjhpnDwTs1mP3gp4RUEPlSuW4ACXOdSlfHyg7OpFTKjXRh9XPsOpUqzVAnjvEg==
X-Received: by 2002:a05:693c:4153:20b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36a4236903fmr25768336eec.9.1793815620547; Wed, 04 Nov 2026
 10:07:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027114634.79706-1-clamor95@gmail.com> <20261027114634.79706-5-clamor95@gmail.com>
 <sashiko-outbox-186485@kernel.org> <20261104175537.GD1650678@google.com>
In-Reply-To: <20261104175537.GD1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 20:06:48 +0200
X-Gm-Features: AclHuK-dTrm5_ju5-WTFNvPOfO0V7jPIoIavoQPE4CCcI-4nnKW3q4poZzZ3CXo
Message-ID: <CAPVz0n19Ax1LBcD1XrnCHZmB=dRT419ggybrKCJjeXRUC_VnZQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mfd: max8907: Convert to use device managed
 poweroff handler
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:55=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 27 Oct 2026, sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mfd: max8907: max8907_i2c_probe() drops maxim,system-power-con=
troller check
>
> Did this get an answer?
>

There are no in kernel users of this property and pmic in general, and
iirc never were. Pmic was designed for Nvidia Tegra devices. I have a
few devices with this pmic and I am planning to upstarem them so
driver is not abandoned. Obviously system-power-controller will be
used in those new trees. The maxim,system-power-controller check can
be dropped I suppose.

> > commit 5deb6448298f2829c11e1c8af86067bd08a79d7f
> > Author: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > mfd: max8907: Convert to use device managed poweroff handler
> >
> > This commit replaces the global pm_power_off assignment in the max8907
> > MFD driver with devm_register_power_off_handler().
> >
> > > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > > index 2a38e00a10c3b..e282dd82ece69 100644
> > > --- a/drivers/mfd/max8907.c
> > > +++ b/drivers/mfd/max8907.c
> >
> > [ ... ]
> >
> > > @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i=
2c)
> > >     struct device *dev =3D &i2c->dev;
> > >     struct max8907 *max8907;
> > >     int ret;
> > > -   bool pm_off =3D of_property_read_bool(dev->of_node,
> > > -                                   "maxim,system-power-controller");
> > >
> > >     max8907 =3D devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
> > >     if (!max8907)
> > > @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *=
i2c)
> > >     if (ret)
> > >             return dev_err_probe(dev, ret, "Failed to add MFD devices=
\n");
> > >
> > > -   if (pm_off && !pm_power_off) {
> > > -           max8907_pm_off =3D max8907;
> > > -           pm_power_off =3D max8907_power_off;
> > > +   if (of_device_is_system_power_controller(dev->of_node)) {
> > > +           ret =3D devm_register_power_off_handler(dev, max8907_powe=
r_off, max8907);
> > > +           if (ret)
> > > +                   return dev_err_probe(dev, ret, "failed to registe=
r power-off handler\n");
> > >     }
> >
> > [Severity: High]
> > Does replacing the maxim,system-power-controller property check with on=
ly
> > of_device_is_system_power_controller() break system power-off on existi=
ng
> > DTBs?
> >
> > In include/linux/of.h, of_device_is_system_power_controller() only chec=
ks
> > for the unprefixed property:
> >
> > static inline bool of_device_is_system_power_controller(const struct de=
vice_node *np)
> > {
> >       return of_property_read_bool(np, "system-power-controller");
> > }
> >
> > In Documentation/devicetree/bindings/regulator/maxim,max8907.yaml (adde=
d in
> > commit c254fcc966ae), maxim,system-power-controller is still documented=
 as a
> > deprecated property for backward compatibility alongside
> > system-power-controller:
> >
> >   maxim,system-power-controller:
> >     type: boolean
> >     deprecated: true
> >     description:
> >       Telling whether or not this PMIC is controlling the system power.
> >
> >   system-power-controller: true
> >
> > Should max8907_i2c_probe() check both
> > of_device_is_system_power_controller(dev->of_node) and
> > of_property_read_bool(dev->of_node, "maxim,system-power-controller") so
> > existing DTBs using the vendor-prefixed property continue to register t=
he
> > power-off handler?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.=
79706-1-clamor95@gmail.com?part=3D4
>
> --
> Lee Jones
