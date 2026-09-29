Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263C4FD27E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675217; cv=pass; b=NObkNukSXxWpHymARJGtoL+b72ZTfF9tt7c3zyWHOFaKQhEoHiyME5ElTtp4np+JOAKFfPI0yVs4sQCdSG4VPOEIOuFCWe1X2TWJhWHmPC4fqJLN94/D+Rk+agU/O/PaxDzIprFEpfXrM/xjsbckjPaC+6mTjxQZoI6Kid8KPEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675217; c=relaxed/simple;
	bh=eeb2q1g5UGMm12PakPu9SPfTtlo4NPC7O6qt7TUMi2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq7z8vHq6hGlk021QZakvq7kOGN7p2BsB5uIayhMN960H2jyceT2YyxTtuDag66UCeFol/yNLTXKZ/GfrXLvFrKuSgn6pIvkMLTeTeLDDpFllbI3fPCXhT3EJwTED8VJFySEVVkZHaHEkQsLzdZtfCukUzq6pVe1rUTRhQ8Q5DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5eLmIni; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5eLmIni"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab0c3c3af6so4105953a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790675213; cv=none;
        d=google.com; s=arc-20260327;
        b=OJEDOUR3WUufYnzYYgpw6YVbWnFMhDhO4GhKteMQM8GIYOq2ufBmaJdHm6hZukKcEf
         5Sfj08Gb4i/bbnK/19C5LYbc+M6DbnHODP4C9QXwn20VydTWNi/sDLz1DtW7LJvJ82Hu
         gDEGxWT96X7X9mukolQT9PqsRoZWflUXdtJgD1Y45A6B5oRhbrU3we875v9xV+A8Zmvc
         m9C+lK4wvdhM5yeAl6HJwRjgZXrMpAjlbRSqAfch9zygcWlN8QSrrk+pafRKqs6hXzM+
         vrMErtz3Ww3VL6hHmjVPKMz3Isporl77B26aQwbcn/tf+Ai1FC1ypMxW9rxf+07jWO47
         BrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YdZLbLvyhM+9EF8BV63cOnUty6jcpMKF9WL+DE/91w=;
        fh=xalF9Khv2TjI0xooyTQK6vPqFEP1mS4JWEGcdmLzT88=;
        b=P3Rx9uCNk3RcxEqYYngP8lRIf2BOj91yRZYkZ/1ijIYw7GxYvgTgYG9r4p12Nlmgde
         xXYWKI9RHFthKO6nMI0rdMVLn12v6h9S4w2vH20TOX9L8rauMtrPCHlcAtw2Ll54DqpJ
         xaN2e7ccbjQOUJDFdvFr2jNuwvNn6gYtA6Ud4TUVt2GFG3/W0wwpqzBweT4ZAGkGHGsM
         NecIqjjtD7pJwzrSfnXZeOrWlSevAVlCa04AeIZINiueSazYFvG//ud/XDbpxZDAlkkI
         cGJCKTp85GUy8hVknAMjBbyqWQ6Tixk5rvg6OZvPj2nhMgq3c8fNLf5vo7ywFoBpB7iK
         uWNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675213; x=1791280013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+YdZLbLvyhM+9EF8BV63cOnUty6jcpMKF9WL+DE/91w=;
        b=E5eLmIni2BTfnqUU8m8dRLxKL5TZFc+n3DIdYC/YwGpJyYdvsUpUQKYw/Vk1EvtkvL
         s3c/R1mV9szC1IrjkrQx4ikPfLGEGblF6PQIbrZbjumFPJk58GVsrtCT6mWXOsRoC0Te
         DNuGQVeEnZRkG+XWTgaentNqWOrKmNqoICcglyyNixj3pMbiEJZjrJOsLkaRzgSiSdlY
         BJjEjg4vtGAwBNG7c8WtNa6KflfW/cfnwPQagTH/bHb46CBgAmxfHX6oDdT3yEMMby3Z
         bVdqL9P6WEht71ktjRCjOhixF69DHwbdCmcBN4sWvMbq6XoShExvhXFWHWgvOLmgg9+Y
         xS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675213; x=1791280013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YdZLbLvyhM+9EF8BV63cOnUty6jcpMKF9WL+DE/91w=;
        b=xCbFNog/0cd5GmM1yO1zBoNoVcgjIMCfW1eIvbXM1x+cqaLCPxU9wqbzhkmDe5KSIK
         EGgtAEfzP5hQO9QhWRPN/CKgIdlMB4Ae8c0xslpYxNdfin9TQNwtqVSJbI4bg2ZR4w11
         1/1yZXhKThDq9DDYJ1SjtRP/jNZqqikwZ2HB9uJuAQ5sy9PljxL02kVUM/iEeSkLUeyT
         sJkC7cbHLbq1WtAMEOIeIpkUqA/1epfqJQKQm4mcIZctVpmvcMaXZxcKI9bOV+3QFS5W
         ZcJ01+jlOl4oy+snedUZHTo+jOUw5Ta1+1hyjnVz1ajkHa8n6UEogiW4qVme6F2UA27s
         5oFA==
X-Forwarded-Encrypted: i=1; AKwUvBzr/IHOvU5k3TwbNJ4gLtyCsbP7F/w+v95gjjEPkL9YGrF8jY7HHUKI9rNobo8e0HXyQZNT4neDcsWw@vger.kernel.org
X-Gm-Message-State: AFq9FYK0rYJkyKLOa8h+7XgFn+E4cIqCL3Y6IH8eZgUqjUaUv7M8s4wL
	7XR+aT25SHfne2dSteabqsH06h7MK8OOFbfdUgwuAKpLkr0oL3gZfukDHiXooH3SSUWTY0N6gQi
	+mLX4ENyeMaaAoaeAlsTiEfCdXZfLvZ4=
X-Gm-Gg: AYBFou0Q/mp2DPbha0oKcYxBg4RZVg/dnf6QnCLHemtqqxkX2fZbwpfU6YGKKYMdoGm
	MfwDT6Bv5+k4JEHgFcJZpIx970SsnqLfI4CIPMBfowfYZJvvuXnuGXJBvj1Acj0jpwbOCyc9bD/
	JGVz6CjmnaVqFV8s+XidFzVkq3LZWuLIU5Kzts1t+fA8Mjct8eG18Qb+h7uLUHNcX/+gq12AOnn
	RmVRX+p5bSeOsNPGIxhRAujfwJclpuUFTprFru3nkmHh6Qkr5T9zNW5XcesSNOrwAEX5TPku7eu
	p4Ddh705cpVVv/nIt+AgMRZQXcP/Z5QGY2rMd0J+IbjYCri+wQfvYpc=
X-Received: by 2002:a05:6402:1d55:b0:6aa:7fb:7678 with SMTP id
 4fb4d7f45d1cf-6aae8a518b4mr8630052a12.6.1790675213345; Tue, 29 Sep 2026
 02:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201035.51007-1-maximpedraza@gmail.com>
 <64e273d4-2660-437d-8871-e2bfa3c377c9@suse.de> <CAEUXW=G2a=Qz-9P_2+EFe-GiW4WqdOjtSCxoO4P15u_J48nP9g@mail.gmail.com>
 <arbLHvCBqxG7zcf_@bywater>
In-Reply-To: <arbLHvCBqxG7zcf_@bywater>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Tue, 29 Sep 2026 13:46:36 +0200
X-Gm-Features: AclHuK_DOhKuESbFIkSM5tBxWuDkjgIy9D1hy5UWjYEzpHDFJ0AUXPBUH8LKOSA
Message-ID: <CAEUXW=ELS1OCyDdy5Gx41g8twU5B8112gMct9uFqhdGVveRKMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Boot logo supplied by the device tree
To: Francesco Valla <francesco@valla.it>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

> v4 is planned but has been preempted by other activities - I am not able
> to give you an ETA at the moment. If you have capacity, feel free to
> take over.

Thanks, I appreciate it. Since it is your series, I would like to run
past you what I would change before taking it on.

The v4 would still be an RFC, based on drm-misc-next. Your patches keep
your authorship, with any fix to them folded in and noted in the commit
message.

Fixes to what is in v3:

  - the BGRT symbols exported, as in your patch for Mario, but with
    EXPORT_SYMBOL_GPL;
  - drm_splash_init_client() indexes modeset_mask by the number of
    modesets added in the first loop and by the number walked in the
    second, so an output without a mode ahead of a connected one gets
    the buffer instead;
  - for a tiled group, the first loop dereferences tiled->buffer before
    any buffer exists, and the width and height look swapped;
  - if the BMP firmware never arrives, the callback returns without
    waking the render thread, which is left in TASK_UNINTERRUPTIBLE for
    good;
  - the 24 bit blitters read each pixel as an unaligned u32, one byte
    past the image when the rows have no padding;
  - the image cleanup always calls memunmap(), which will need to know
    where the image came from once there is a third source;
  - the spaces in DRM_CLIENT_DEFAULT, in a patch of its own.

The modeset, tiling and render thread ones come from reading the code,
so I will reproduce them in qemu first. Tiling I cannot test at all.

Additions:

  - a device tree image source: a node under /chosen with the BMP either
    in the node itself (dtc's /incbin/) or in a reserved memory region,
    mapped with the same memremap() as the BGRT;
  - placement from that node, a position with -1 centring an axis plus
    an offset, instead of always centring;
  - rotation, for the DT image and for BGRT images with the orientation
    bits set, which are skipped today;
  - the background colour coming from the same place as the image: the
    DT node can carry its own, splash_color goes with splash_bmp, and
    the Kconfig colour stays the default for everything else, BGRT
    included.

The sources would be tried in the order DT, BGRT, BMP firmware, and
then just the colour. A DT node is only there if someone put it there
for that board, so it seemed right to let it win.

Does that match what you had in mind? And how would you like to appear
in MAINTAINERS, as a maintainer next to me or as a reviewer?

If you are happy with it, I'll take you up on your offer.

M=C3=A0xim

El vie, 25 sept 2026 a las 21:32, Francesco Valla
(<francesco@valla.it>) escribi=C3=B3:
>
> Hi M=C3=A0xim,
>
> On Fri, Sep 25, 2026 at 10:48:31AM +0200, M=C3=A0xim Pedraza Padilla wrot=
e:
> > Hi Thomas,
> >
> > > the whole Linux logo on the console is somewhat gimmicky and IMHO sho=
uld
> > > not be further extended. Also fbdev as a whole has realistically run =
its
> > > course. We fix bugs and occasionally clean up the code, but it is
> > > questionable whether new feature make much sense. Even more so as the
> > > drivers your system uses appear to be DRM ones.
> >
> > They are, it is tilcdc. Understood, I will drop the fbdev side, which
> > also settles your comment on patch 1.
> >
> > > There is a proposal for a DRM splash screen at [1]. It retrieves the
> > > device vendor's logo from the firmware and displays it at the given
> > > coordinates. IMHO you should start with this series and add DT suppor=
t
> > > there.
> >
> > Agreed. I have been following Francesco's series since Sam pointed me
> > at it, and it is where the DRM follow-up I mentioned in the cover lette=
r
> > belongs, rather than in a client of my own.
> >
> > A device tree source fits next to the BGRT one. The BGRT is the firmwar=
e
> > handing the kernel an image and where to put it, and a DT system has no
> > such table. The BMP loaded as firmware only helps if the file is built
> > into the kernel, or if a filesystem is already there when the display
> > comes up. With U-Boot's Falcon mode, the device tree is the only thing
> > that reaches the kernel.
> >
> > So the plan would be a node under /chosen carrying a BMP, either in the
> > node itself or in a reserved memory region the bootloader loaded it
> > into, with the placement properties from this series. The region is the
> > same memremap() the BGRT source already does, only with the address
> > coming from the device tree.
> >
> > Rotation too: the client skips a BGRT image with the orientation bits
> > set today, and it could turn it instead. I will ask Rob separately how
> > he wants the image described, since that is what the binding hinges on.
> >
> > Francesco, is a v4 on the way? Would you take a DT source as patches on
> > top of your series, or would you rather I wait until it lands?
> >
>
> v4 is planned but has been preempted by other activities - I am not able
> to give you an ETA at the moment. If you have capacity, feel free to
> take over.
>
> > Max
> >
>
> Regards,
> Francesco
>
