Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696963DDAFC
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216805; cv=pass; b=WRZnt6l7zSIbgo08eNOKRzQcMt1nXQmXFjcfA6U8hJpCNPoTeWV2ucUJPYNy1juCSHtTB8gWU98Drg/WhUcgxvIurjrhTmB58QDJ73Exhey5qavY0xoT/U6g+zGRNflPpOmWjnwMiNG2xEqXHOpg29JuP6HUotgTfmaJ46tojw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216805; c=relaxed/simple;
	bh=vK7C3ybAIyrPe/i1oclw/CiAxWgMYOV+G70FInth1VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Asri9MhIZY3l2PTjoB1Z7z4uO+adWxQJlnN3AfgtH4iehYo6T4EX7IDLRRwve4/4JLFS2t+bL5De9zuoDof8pg4d8ugJcGg+ACvEKs9nqJWVD/Kan/D9e4L/vbljM1loD2pauHEaQ9llblB5qNGeICYL263JvpITGZCDJPzx8AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skCzT9LB; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skCzT9LB"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b145a9623fso597471eaf.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787216803; cv=none;
        d=google.com; s=arc-20260327;
        b=PxnWEPuhdenY70pKSXChHILIJUpA98Ni2ezlkfl77eOoz3VKLCejb7cpSJWCFmwEcq
         ZT3ElUpQQMVLF/3I28bIMrHDcIgJ0xSPhlQJYniDARcNkumAXPCJLZo+iWYOvYi3d385
         2Hzupi79R0y44/nsEIhDKxCvQRprBp/pxQKuNeyqiEAJJSOzz+XTyIKflBsGm3a/TSv7
         XoZKLPKtAMmjSS9BjxuhsirFNRDdc2xLEhOiW30Sbs30Fz+NIXqxQM8B9RrEHWeHab1b
         5w1oIyhVppE7iKOlagXydrGvz2DfmwiG6lR+TJeCIymNHV0S7b3jsgQrAd6qKi+QtJg3
         f3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZGw343WQLjcdulSLn/rOVo1Vms9Oy4obDab4pTbfnI=;
        fh=sCWnU96LQAeLmU7EazZqeUyveHLWWGEtib++iskjqBw=;
        b=pyseWjDAMvSswsRokQcU1SZ4q1DdLvUTmVRrvmMG0/e5YJdOYy8Lg5uVa15rDiVe6L
         3SA+czTcIzGPgLNcWRCICue2kHO5GyEOU5729JIRByx0f8ZTqlknnEvQ4Hem3/a8Tswd
         XO6MrtAK5vgOe4nX61nwHbxQQGtoK8YCZH4Hw9/kcDrlTaFTsuaf9O/eHMT+wTQ0zUsR
         KNsw0m9Y/9ep5JJgFtH3p4QKwHM3l6YOlhlxIFMLRbyZFi3ph9DdBV3shaEYyUoFqBdB
         6VqyqIXFF4lDZLB9QEVdho5nJXIozRcyH82LP54bBNQCiO+doBflJdYe6dX0blR7fFGJ
         pjYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216803; x=1787821603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZGw343WQLjcdulSLn/rOVo1Vms9Oy4obDab4pTbfnI=;
        b=skCzT9LBReJPvuKIx3mQaYxK0MztHkUVFuV39WUvT9Z0sA2FRHLVsHskOWy+SKyfHF
         2HwRaih7EvquOWM5jKhJxY+FN8xVDaA1uH4tPHMv7qUNtTfgdhvzNxDpZyVc5Nntk8OU
         KZTzDoEz59purpZ8qJs1TaZ2KSikuVv1KfSHfxFC0h6mUEzInWHEVOOp0yAJ6vyREpW9
         WDRxcu5g89UgSYBF9WPXCuMsi732SYh2lKhIFrpv3LubJizZHBoLovr/YJr1aEn72sT6
         OHzcXtOQjEt4L8BnLYbCo1tC5n9IKKcAIRJpAW6LP+wdbf/1UCIeeJvNIzwUbX709tuw
         tjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216803; x=1787821603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZGw343WQLjcdulSLn/rOVo1Vms9Oy4obDab4pTbfnI=;
        b=n42hYntq0Y6LWx20YJzSS+zhJTn+QLdDcP/pSFAIhZqyW5DrrjTu7UWgoxJ2U4fRLu
         ie436Shtk8oxiRBgKX48oLcDTVRrEjZedWQbe0nyNHL/UEVsCeDk8uRJ7CVjiu1bbrD6
         WoTgLEu3TWxjwFbFjoVTfHbNiXILY7GzFy6gu37ZX9nOFKn4/UAOuDaIpjwT7/cjAHXa
         pMuTEqD1B773y/3fuw6IPf+/yND/TZPxYm9d43cb7UxhSWzkNLMbY9g+2vLdlgttKohd
         aj/6Vvrsdx8DXNYXnJ87SkvremL3jcVwDRHq/dN+vrK4atdU9rQpsOTWl5tZdEgwP+/h
         of1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq8aKGPzNn1wLF07eau8/PY3FnQQH2UTqT+M4jAiFu3q9ZHx5HIoEd/gN7FdqFua8k6FGUGfgm/ob9A@vger.kernel.org
X-Gm-Message-State: AOJu0YwLU6cBLg7jMbVx71WCJ+p6tNJDZx+5O8BIL1Pp9ECVZg/M/f2d
	HMjb8ng48dtjvNsBJ+8U6Zu4HQRcU/eSKWMFS/9w4FWGLGk2FgU8FkpjToo8ssGzNIh2Cis0bFf
	k0aSRtaZFFeYI2Pcmb7ZmkZqbkdZpLqY=
X-Gm-Gg: AR+sD12PfxTXhq5H2ZHzrXwMJiRk5+xTNntLgoIBB4d5yrgRBIQnWxyuULQVrULa7Fd
	OpPULeV8OxOdhsuMn+B/EpzfguTRpQL1FKmpDouYxvZ8885ip3HKQ2wcsxYrX2MHlOBRzFzVw8O
	Npqkh0EwFKWtsTPKi9KgILH77VrqwNQohjxwap+JwqgPoPL0WdbHjzk7fJP9Q/Fla9pJurkUgCs
	2Az4BM6naFyoqigQ8rF/1OM5vGvZtnNk7xnwuEX8qUmO9R9jgYSac5kavF+rWbJrQvMyzgpf0X3
	fusDuJFq9HXRoepMKtOe3sQwE6uzwxYT+XXw4WpdcV982TKq77zycoNzz7iz1fdWMHBHbgkEBxu
	hec1OJUdzMlZUBQ==
X-Received: by 2002:a05:6820:150b:b0:6b0:fc2c:bb27 with SMTP id
 006d021491bc7-6b13c389a65mr9778866eaf.14.1787216803241; Thu, 20 Aug 2026
 02:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-5-amit.barzilai22@gmail.com> <aoQalR40NMFSg8zS@ashevche-desk.local>
 <CAOEgbEoMOR+WS7TzY5+k6G464uUdp+rHJqvhY+6gRE8nCaT=gQ@mail.gmail.com>
In-Reply-To: <CAOEgbEoMOR+WS7TzY5+k6G464uUdp+rHJqvhY+6gRE8nCaT=gQ@mail.gmail.com>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Thu, 20 Aug 2026 12:06:32 +0300
X-Gm-Features: AcwNN1UjXypJJY9DHbyqP0x-8s0rVO6sgXjrFeaBERe_l4HTjNvbH6uDwpF5QZs
Message-ID: <CAOEgbEq7D4mkie=DUqrE-Q_bN49ekoCFiyB7ihPS5T=A=kCoVw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[]
 initialization with C99
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Piparo <holofermes@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 10:25=E2=80=AFPM Amit Barzilai
<amit.barzilai22@gmail.com> wrote:
>
> On Tue, Aug 18, 2026 at 11:41=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>
> > >  static const struct spi_device_id ssd130x_spi_id[] =3D {
> > >       /* ssd130x family */
> > > +     { .name =3D "sh1106", .driver_data =3D SH1106_ID },
> >
> > Hmm... Is the comment correct for sh1106?
> >
> > >       /* ssd132x family */
> > >       /* ssd133x family */
> >
> > Overall, what do these comment bring us? Are those families have someth=
ing in
> > common? Because the driver data is unique for each device, so I assume =
it's not
> > that compatible inside even the same families.
> >
> > TL;DR: Perhaps simply drop those comments for once?
>
> Agreed, I'll remove the comments in v5.

Having looked closer, I'd rather keep the comments in v5.

The same grouping comments are used throughout ssd130x.c,
ssd130x-spi.c, ssd130x.h and ssd130x-i2c.c. Dropping them from
ssd130x_spi_id[] alone would leave the driver inconsistent, and
dropping them everywhere is a cleanup of its own rather than
something this series should carry.

The comment is correct for sh1106: ssd130x_variants[SH1106_ID] sets
.family_id =3D SSD130X_FAMILY.

And the families do mean something concrete here. family_id is what
indexes the plane, CRTC and encoder helper vtables and the backlight
ops.
