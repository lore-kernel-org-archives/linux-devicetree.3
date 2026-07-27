Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E25379C3F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140691; cv=pass; b=ZfdgWzvrbgn6t1Crd9IgfxTSL5vRvGVxI1KtohNQFqViruOrAFCj0qac3QmbS9tUO9SdhNUFTNpXO8Z+TSRUtp9VWE+yhUpL9K/0stlWA18fh4GtG+r6rJwz9fMBinEs/rElZxBfwUtIIQjBVRjhGs2odybzelLrggNoPAE2iq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140691; c=relaxed/simple;
	bh=fkQtSqlmS9bP4148tvn2U0aV7x97yBRmtgLuyiKo4kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLQx6t+07LTQ8tSTWmDDlTKrk/W27yNZyoRWhifA2kFmatCg5nRP7GhDyotHJlCMgPXbof2OQ5fuVxBkeZh4p/C8NL+NjUUwJ2qAnXPFyctjtyiuyuL6bZpWkwpxptgUJHs03zF9RAG5id43SlmBEy8pz7KooXLSBS3S38AKGKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu7N5Fkw; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu7N5Fkw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1732437a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140689; cv=none;
        d=google.com; s=arc-20260327;
        b=mxGZQcXoAE58TLZKKNO/k3H4cU4hWEei6AiYDbmuRq/8jiwWubhE2JceOeLvmkgWke
         1aDmiTiTAzrx5L3l35MGxsizrkrWtnuXhSXdppLJ2vS5SX+jcXuwGE51PjKelxOok4hY
         o6Fa7TdXFjXbnSR7eJz5utUZbzT11hFj6QZwYQpt7rzKYaZW+lyjsjTaSBPMttYHEDcb
         OuSmJ86oYOhNljhfRqRYWQsuYdj0V/LL2VEtZamu98Na1HnIQPJDnwd4F0FdAPqqP130
         wyx5xQ24k6oBMbYMoKz2JT5c5+86Cz5GKpFInCsv4LWpVVsqRAVLvChmNmyviHpDr0+N
         OQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        fh=NlLJ/Mc2xRrZzudWvNTFEVLVR9xbkLV8JsPo7kT4Zb0=;
        b=iKIMl5XQmMSHUXBKT443n4OE8Tn6Ie15EP4rxdUXa/HQ6sVEvkAxqUhvwBK37Fkrlt
         02e+IoxD+9IIik96tu7cbkZBirKrIcb0jBlfdOItftUcezPTcxikDSZCZyv1qiUFIiHW
         dE2RKM20ZK/uzyX72QSHMNglzYYgZ4vPsCP9ONnqXLQoFiYMHgESqwIvH1Yu9HAygrjg
         U1yiXO5pPATY00YuwmA3qA/0AoaMavkxJYVlygOZPDhaJ97l46MLYZGvqyK0utgmLy3x
         LwF4XaSIfK0AJqEuCyVBakmNlr3cCsyyzCzyMV/xx6paUSsTe3STCaC+vwkfHrUl3AMe
         +4PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140689; x=1785745489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        b=lu7N5Fkwr8FCMNgMaaxNdwucjP31CfVDYVlf/pQZMo+eVdn1FBl6kpF5hpR94lshhe
         A8S4sYp3ZJ/sDaX8ltGAX5YkPKMYoB+SQRE3rrLftwE/hhZq/YX35j3z2xqVJBsJMO0I
         bjJMJTNTAVmqWGrdQKmLfsrTKPbnY18aNSfClHxuMdTJ9vvP5PGN+Yw4PWNatKgg3Tkl
         +7AZqQzU3JNXDp37qbMcIHq1W2BSX55SZs2vQvR27KQiFN/4ZTT2vuoqNc/K9v/dHDtX
         Yub8gUqCA5nl1rQq/ybRTGVfK1pHh6XqpvywyF/0SMfOc/iRhSqzTWhHdh99lBp1kDn8
         YL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140689; x=1785745489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        b=OrobkxeUnsx96hBCgHPlTfZdLUOY8eAVKGVmHYQNIeI4nWPgZWW3J0hzGE9l2IrSTI
         1u17ALd0yxLa1M/7qHnnwisb6HwSpTU/HffwuVEDpGTYNGCLgy4N/e/PbN/9/yc4fu0Z
         h4u+0bWBvQdLCG0DiBXR457dEIA53uqAGj7LXtFDXjWFp/L4t9QSN8r1+Gng/FCrewhO
         btNnCTA5M7+wSHqke8hJPpIuw8Xc0Veyxd8a/FYJAjhaOGHnD6JK+m9zxFwLQj+nfELv
         E/uu2F5O1gL9LUQQiN+MT73qrKkBZYpoMcW71ZOQzoVw8cBXS/7KJ4hnpQFEZguk37Dj
         ppLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp11iMqKHdLzjOj45RHSqPkiNOnwtasJxAp8V03H18I3T2eU7H0G9aUiV/OgLnb6yiJVEkZ0J/TCJNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSiVLRaY/VRLtA5nVlQampTzpLePcZ6bq2WK4wNzYjZ9B+d0/
	FQb13bhpO3GRZkJ3RMxX+0adk2iCoOYcj3SDzi/yth078xASjMyTN34jHjfloMkPs4dnFWbJNOu
	qHYMsnqpKMhiJLZ0M38lFl/8X6tYHLSk=
X-Gm-Gg: AR+sD10KkFvLFEwbmFTZYaNrlFjWlnYxtwF+qgvQccZ+bkwc56h7KEGUNRNjB9fz+fQ
	b/ihZeAgjX8xaU3IUvQbDZisIcmKWcrqjuN+KMtLVtgzKr0414LD20CggpK7nQUx1Ntty9zSjeT
	zoYhMoo7kLvQ+6v/uaNj1k7aFD1ORyhSOS+xaZkKsEL08Nac7zZYZaz2KOgtIU4fdAEhXBy6wgX
	/XgdsPnTk/Rw1nU86VRFJbVgIvF/LQZXcw9TMlrvNq+cPa7uD5RB4MpoHTl+FC2SPgGFqMeZC3H
	POCBBJ+SgHs/zWZwszw=
X-Received: by 2002:a05:6a21:7002:b0:3c3:7ac4:dac0 with SMTP id
 adf61e73a8af0-3c67dae969dmr7046276637.13.1785140689346; Mon, 27 Jul 2026
 01:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-9-clamor95@gmail.com>
 <akeXAOpb13hupUGM@hovoldconsulting.com> <CAPVz0n2trouADTziWXnpt=-hwKdsZWGQib+-nVCLaSLibTbATg@mail.gmail.com>
 <20260722023037.776f4bcb@jic23-huawei>
In-Reply-To: <20260722023037.776f4bcb@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:24:36 +0300
X-Gm-Features: AUfX_mx8whI7gSCba0GgBVBHpAVLRZADgHNcCPlSfBxfKQKn1EgxosjjezqzeSY
Message-ID: <CAPVz0n1dnoe=Xw2V-nZtm3ggD5KLO6PVrhXOAoPnqvJn+C3L-A@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] mfd: lm3533: Convert to use OF bindings
To: Jonathan Cameron <jic23@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 04:30 Jona=
than Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 14 Jul 2026 16:57:01 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:03 J=
ohan Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Jun 17, 2026 at 11:00:25AM +0300, Svyatoslav Ryhel wrote:
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for b=
acklight
> > > >       indio_dev->name =3D dev_name(&pdev->dev);
> > > > -     iio_device_set_parent(indio_dev, pdev->dev.parent);
> > >
> > > Why are you reparenting the iio device here?
> > >
> >
> > Because every cell has its own binding now and using phandle to parent
> > when device has its own node is not a good practice.
>
> It is however a good point.  So should at very least the ABI break should
> be called out in the patch description with a brief mention of what the
> path change actually is.
>

Ok, this is a good idea to add chapter into commit description.

> >
> > > That's an ABI break.
> > >
> >
> > This driver does not have any active users in the kernel and no
> > activity for more then 2 years.
>
> ...
>
> > > > +     u32 count =3D 0, reg, nchilds;
> > >
> > > Don't mix multiple declarations with initialisation like this.
> > >
> >
> > Checkpatch does not complain on style issue, hence this is not prohibit=
ed.
>
> Prohibition vs taste.  I fully agree with John on this one!  Those mixes =
are
> messy and hard to read.
>
> Checkpatch is a helpful tool but there are both rules and preferred style=
 things
> it does not catch.
>

Ok, fine.

> Jonathan
>
> >
> > > >       int ret;
> > > >
