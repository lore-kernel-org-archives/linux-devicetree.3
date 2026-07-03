Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AE37D11F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068630; cv=pass; b=dpsBueQmHjhBYLJYLJgaKbEocfWMz2IxU8G0dQE5RAgMYLW2wGY620f9R6Ac2JQ2jTijudL4vJNcr0watKUCqWWZJTWTqvPh1qrZZnWVH2zK9tFb/q9PGYhNeLUJK6EbIqiipUFouNqy9lsIKEUKgK/7xXa3xNG151STi/7PtBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068630; c=relaxed/simple;
	bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu/1pYGn9CCn907fynRGqmKQk6NVCLCuc/DjmGqNcaOexU5PD4tjgpkOjFS3l66PPgelzoSpMxNRf56ebGqTitJCFnYa1AT9J5ycdFSklsTzGIuvWpLscwrQUAU275WaeziSpFD8c0P2W/vYfmNlPVKpLpotPSqaMFVHGkBTHmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp35/55s; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp35/55s"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37fa06b39b4so293015a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783068629; cv=none;
        d=google.com; s=arc-20260327;
        b=lL3IE097kWw2FuPcO55dXk+qs/as8hI9lw1G9M4k4EM/oi3vixi6J1KqKZqH89DYzl
         MpOUI6g1V63e65p8g8Tz2+a2swNbcjcjadbGAGwoiVi7XERivc5/Zx14ZCnWDgvyEcGj
         FUjuyFShOsbpZPEtOqPlXzwsHWH4l7BxYZdR3UYxjr077yOosPQeUoogBeMxHgiednfU
         ST5PmknLfs+v1/IBz9x02WKZIDCyGU7ImJKc8QGkizxDlzuLaJnLhtpRl+v7kZxhSI4I
         vSSS2399dYnAqEuPlSOMtbOh7hcQnp1XDHPd70bcobJsU+l5I1tUCKtvoVLwjYZtxM+H
         y8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        fh=AbRBQFKpyqiv4yFurv1eo8FrP5Vl9yBmaKlgIPNFUBA=;
        b=ax3lwoO56MYov+gYJi0N1c0rwc6wT8nHoGIyV6SWELiNeq/MItGFkTGV9Ljc1vFivt
         kawQsjedkBhblSQmRI+H15T7XvwIJZ+zWTFJAdIPw9wUxc1RzUiOhZ0u3Lj100EO/eXm
         LRyyzWYm4aa20oynnGyJ79WpTBRizfYx+NNf5DYek956ZRq5qGF7K/mzF1BRho5qajra
         Z7m9KSczmNXQDkZk/OwFOXAXsk+DjDVwxxLsFP+0TDi1aqnYdVCOgCummPtbz228Cz4X
         +n9BEvyxtgM5r1zJcZrHJLxsRS9hUzSoMYflbrHxvzss9qTh3eT8ZfE1Pc/WYTeIJ/za
         uDXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068628; x=1783673428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        b=Yp35/55s2vBK2gEHGs8sgoI4osunm/jZFHkATgRYASC18u4qN6qcDOA83y0Cdxh+o6
         662moOywNpzPRSm6IfkxhQGHxJCFKGZuWl7sBT+LyeT8WG3ey8TijM8RdF2Wb9UG7IHf
         Z+u8B/sfKHEOfDIhY1mm2KEYg7Hd/7HHLOj5jVWz0EzKOSpm8yhwNRd9Xa+5gBtEt+qA
         J1yriTyygEOyXJgZ2983NY98/f9+OH9YXN6AoD/E2fMB+hnW0yiaFpi2qnP9Axtd6LWw
         Y19k/WHx59Oz1dyeGCfMHMJSwufeMXvUd+o79pWRAM7jVwsUyEbjAHBnvzl8qk99dTuw
         Ql8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068628; x=1783673428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        b=VMU1LhyLc+CqCoxx076D2PUqet3YIvCr8Os5CZDD65bcZzAdfNx7oMuP6kyMcWOuiW
         dvf3bmnUoGRBfNfa5VYqsJDMur6PomD1MaWOXfSg4cSlFbcnEMzGe7ehqw+vIjSg4QZR
         YDxVa1Ci7ErfFjmyrtlhewVRpeDT87gZvyz75qjd2ElBQ6qN+2i/iRxPDZvzMwwkfUcP
         Rqqx3pqLWiY0TkzlrEwlRYdPfmWpPLz7LogUkfUxEGr5CUx436JdDRc8AoJ/8mw9sIiO
         C55MlBZcMg/sz29l5gEnYQNjKLj39erLRmrvDyoLQkKyZeQU1QbVKJyglF6o7/FA1i4s
         fd3w==
X-Forwarded-Encrypted: i=1; AHgh+RpGLwn+jvzHL2/K8leCzm9X9uH9eMU13yY/Y/LFmZ9/3dAk4yHSfn7T7BgKdDMoR7cyxanAvyBvuil4@vger.kernel.org
X-Gm-Message-State: AOJu0YyexVGeEE5o2nSqCkev2eLH6mmSk4umpgm3qzCksUt2M8zsoFaU
	J9t8feYw3PVEMDhs19F4Svso4l0ufdefRKjvdbDoRBz2RpzC+JV5vOyl7Rf8GVsRLKKwi1+H8oF
	pPgmRFqeEl2JIox+CXZqGtppnUgUOC3U=
X-Gm-Gg: AfdE7cm//qklbA5uTUiE/YYLTWs0Hx7SVbErFfnPJ3LtYtzt90mJOzfr0FKrTQAIovi
	qOg8Lb9zPBz36cwJuApmZm4sI3oSdkI8L+ni/KI0kcg+cJuU0Xgz3Z9EJ5IsbG2AJo42u2omQvP
	0AkzPe1sezjBs32eDjgp8R/LyvExRl7j3iMHBF16EmZ+YlhEWS5D/E0BsGUuj5ybsdeWzKbnkQc
	q2ToODYaoFQ5bNeLY+PRqF7WULAEo1cErd5jVmshOsxbIeozAsnz7taxufQ5ejMr3cg3bH3Pz6w
	jAJSZr3JsLKgKxXu/jDMdysba8/x0w==
X-Received: by 2002:a17:90b:4ac7:b0:37f:9ce1:cdb2 with SMTP id
 98e67ed59e1d1-380aa212cd2mr10449000a91.32.1783068628598; Fri, 03 Jul 2026
 01:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260702161828.GB2108533@google.com>
In-Reply-To: <20260702161828.GB2108533@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 3 Jul 2026 11:50:17 +0300
X-Gm-Features: AVVi8CfxYzwSfzZ6fk5dLYRyOYewH3BnmAC08YjOJmTVCgpVqq5v1ruOm9aDpBE
Message-ID: <CAPVz0n1Pozgz8DBt5BrYSktVfE=D5E41oy+fMODGpx-L-qQ3YA@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:18 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:
>
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
> >
> > ---
> > Changes in v2:
> >
> > schema
> > - maximum led sources for leds set to 4
> > - anyOf > oneOf in ALS
> > - improved ALS descriptions
> > - adjusted example
> > drivers
> > - dropped devm convertion of irq and mfd helpers
> > - all als configuration moved into lm3533_als_setup
> > - added regulator/consumer.h
> > - lm3533_bl_setup set before sysfs_create_group in backlight
> > - added check if LVLED is valid
> > - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLE=
D5
>
> This set looks good to me now.
>
> Let me know when you have all of the Acks and I'll merge it via MFD.
>

Hello there!

Jonathan and Daniel added their Reviewed-by for IIO and backlight
subsystems, so I assume that should be all required.

Best regards,
Svyatoslav R.

> --
> Lee Jones
