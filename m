Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794051665;
	b=LyGwnYClnY+uZ3xzuuHqUtze8HizIqPmdxUUb4sywOhQpsZNPEZADfJnTVsAwCIr7/lF
	 9pD9JCRlS1bIl5qnBW3BLNJGmDy1EEWRjjF5BMdpMTc3Qr5ouRc74TLBEBgyKclonpEz6
	 B1J0lO9QXrZBxwkjewVJNQ3rZDBIB8Eeto7C1beYPLU+KGZj8J2brdb31RkaK0SSf5y9y
	 weguAY8KuquS7EEoRIJp0avH2DMSxJC2BPVpGaP9NvgKP6fhpcyPqjqOTh6TAqaYcb/ym
	 wcv30qQS4GHjkn5IunGcLeIYGyiuHTbbwX6n0Dk2GEh+ZDj7KmdZcwIeDb25dHlAz5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
	b=lawFdWjG1xANBF2vmKIy+NjgmH7tMXP0YY57aiaYygoPCXBq5nsW4lNFf5vnP5caL9E0
	 yIiZWVOCH0W6C9k7KRJsAFF2Wk7gGjmh/4fGh5vC+yoLH9xfkbkGCqTHvciGKCdgi+N8+
	 8bUS8qKpULj+kZd1wrsjac9Z5Ntzkmja5qIFYV37Aj4dhDOSBqwm2d30S0E04F0D9dUDy
	 r7zRqGBE6eW/l1RfwCBvJScEUi0ZWeVQPAhH/QZrcXEmfEQDtmiFedEGJ+lxHs/zAa1bM
	 Mj6hcYk3vj2ENsCRNw8/w+7BS3v+8NdeMt8Q+pflcuSSnlHP+3073eOEuSXCNAVTNpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uv/MnhPY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB4606A32D
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFB4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uv/MnhPY
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c11318ad1so837955d50.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 03:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794051664; cv=none;
        d=google.com; s=arc-20260327;
        b=jgiitN4t9jIXciEcdHziMM/h8Gkf7nr6VcO9ITTltaS7bep5eQvd6kOiJwJZun+Mkz
         HglO+0LlrGN0PYWceVRpyqVmEY1u3InCaaZiCkK8Iz+UELpkZykLzsBO+5/OjeLAtfbc
         VGFh2kKKMoW1C+znhhSIsuZgktl3ntpxjjcGkrJ/X4s5EtD62KzEVudONd4TaXQ9tk98
         QysLgnNcalMP/HE7JbiuHuNjRXtanMbufZWHo4RIS8gC7SGHdkHRqsTSRXnGjUI6aGG3
         eu0XiXOYmgNfVnYID+vPhOvaN4lNulZ4GHNWeqoXvWOKtN8A3wbPXs8gkPbn197RXpVg
         c46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        fh=t65RD887SBmBXoQA6Wb1/NCy8f4xOIhx4A7LZhgATGg=;
        b=sz2iUF61w1IkQ7mR+swtxH7ZgmkVL2mDSR/w3puUtv3HhzkTFuiOahZfEOikp4IX+F
         3iWW3yxRdrLcPuZqoNQc9Xhwt96/Wq4gp0ZbM6cxGPiVIDRunW+1g+0/hMsPeo7Xm8sm
         KPq91F85A3R3MA9O4Qka/LFvkA9EUMFibFw9csUw/mmdGHEWqgFw6Jh+dpfWjHBETgku
         mSGgfm855JHRdzephb4vbZhzroMWqlhr2gjZY2LYSVlbutK4e80qE4byFYenGA92hqyp
         koTNwtmH7AYqd2ROt27r1dslnYc6zA+uTcjekKe+BSDpfOQim5phcofxUyerfhy8+vji
         hnuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051664; x=1794656464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=Uv/MnhPYUlJ/ZX3RqlHb/a6i0gp4cIGYXj+kYDIio6V/YvCxjxJA1aNGJgeNRUxdZK
         B/NFrxW9NBs500iOBSmcRTVBEasxYtHEFcd1egHm20Ej7uyJJ0Rp80nGbvp1/+e7tMUh
         wC4e8gHwYM8o8Vt+rPhlrdBEvOkGrJMCV7IXeSzzC3VlhId/fBBldvUud2QPRdiinNFg
         3BXu0ujHM/Sv5SgFKJsM0tDit0cL0SbhnobaRGmwzHbAhwWAWD0tA+ZwfGoHuknR0K4D
         CUIcEppiZGj832l0z4Crge1NX60zE+2QUS9g+zF6snRUzL0NiCH5VfG62J/ktBwChjUT
         cD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051664; x=1794656464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=esX4PxoLHHYaLIq0Om1JRhPRtEKN2+XwA1nygrftIApj9XCa3q140qoxPCu6ecNhbJ
         3zriCaQsYD9JGTvSxmJP0hRDkzUyiTAp79kBCkDYOaubC6rPJKk39DFOwxlwEehxHePd
         U3Pg9A7qBD8B1RIZY5fblG+f7L3Z1OvgSvW3gFzXwLlSnsfk/X59Ji+YO4aeWZ6IZn1+
         IoWS4IJGpzqDGcz10QXaK4k3KXQnZVBUNQkRfFjMQiNBdfsnAy8GSei2oXNgE2YQXmNy
         JhLMjJqVzvlWseEQJXBjn/0nEqdxJ38HXCBNhhIyZn/3HJ69aZJP642gp3NVaEMIZ5di
         oS1w==
X-Forwarded-Encrypted: i=1; AL+hErFOdQO5d2HufmkIe+wlZ4MmhqNoVKu+/N2Q6ipVonusPMm9AydzlQ4Kq8cKAcSeVrP3ZDv0GUF/ZFj1@vger.kernel.org
X-Gm-Message-State: APuU4Z80SSOeXMeEX4oPfTqNybpqXrn+Q1guTR7GINNYZbZpZW6qGTL4
	/w0e06+3btCrKZD9k2IRzpnbqa70dTcM5pr5Em7MK8CVQ00VXZB/BRWjrqPdpbUUrJVD4ivRV2T
	h+XFdjkrBDdkJ814ARisJpWRuz/FvbjY=
X-Gm-Gg: AYBFou3pMnMknch1sR5SJ5hMJylg7JyO+Q4qRXqLGcJ8BKdncWStpbOL4zMrpl8rV4z
	hiShwiZV5kguCE3OUV7+PrzJSf1BXEnwuyQWxrbpi2XryOT2GDkGNq4M6GY8tkwAPOEswkbDNXg
	Z2sBNsZoXyiGMdjYUeomCYqTpCThzirbOblKC3vHNDRvjRxto1tNEPKRvFCYM4LeGVyLNYPF/Gy
	jw539Nr0YXJ3IjunuSu5iX/7pXE2XgxBvCKnm1Mny6W8NMZpZUFRf4qCcbcQ66jBtB8+u+6IYdR
	IjUc4D9OET+WXcs75ZiKuRznCI6FkP3cbiura6W12+z/gbnMunXSpztYP4Dl1sgIhEoxWpIrMTZ
	TSYxJR1IoKSiszdStJWyjeiyjvZtL4Zo2Tg21rBlsgcsr7oKtt+mI5JllPSM/izJTey4o3l5PJn
	su5FQNFClF7DPA7aJKwbfYG2PQjF0Nkl5kLDqEq+BUx9nVqES49WDre0BhNr+gj8UcxYfQA51bu
	xaR0GiZXHaONlhY0WFTVnicFWALm+3wNZ39r4c2F6dUHeU2aD7CxupvOpYSjg==
X-Received: by 2002:a53:c056:0:20b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c141e4301mr2310364d50.23.1794051664343; Sat, 07 Nov 2026
 03:41:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof> <au4J-0GOUuueHLZe@rabbit>
In-Reply-To: <au4J-0GOUuueHLZe@rabbit>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:40:28 +0200
X-Gm-Features: AclHuK9O7PUmgPlP4zevfIOy9d0EnpN6X7geLvTsMFUAaD8AWKettmZPb3yRw48
Message-ID: <CAHp75VedGBBd8qk5fO9-DkGwmuLQk77_igefAwTbrfcPCMW8Fg@mail.gmail.com>
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:10=E2=80=AFPM Daniel Matyas <matyasdaniel006@gmail=
.com> wrote:
>
> On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> > Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > > Questions:
> > >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI934=
1
> > >     modules to panel-mipi-dbi? The KD233 node would then have no driv=
er.
> > >  b) Or should KD233 panel support go into a DRM driver first? I don't=
 have
> > >     its init sequence or physical size, or the board...
> > >  c) Is removal of all of fbtft already planned?
> > >  d) Several other fbtft drivers have drm counterparts. Should I inspe=
ct those
> > >  to see if removal is needed?
> >
> > IIRC the main reason fbtft needs to stay is because it supports paralle=
l
> > interface which is missing in the DRM drivers.
> >
> > Nam
>
> Thank you for clarifying. However, the fb_ili9341 driver uses only the
> SPI interface.

Only two drivers use that macro, indeed:
drivers/staging/fbtft/fb_ili9341.c, line 136
drivers/staging/fbtft/fb_sh1106.c, line 173

> Is it alright then to move (or remove) those drivers that only use
> SPI interface and have DRM counterparts?

You can suggest removing it, but it might break some users (yes, I
understand that FBTFT is a staging driver), but doing such only for
two out of dozens drivers seems to me a bit inconsistent approach.

> Furthermore, would there be a need to enable parallel interface support
> in the DRM subsystem?

If you can do it, I will agree on retiring the FBTFT drivers that will
gain such a support. I can test 8347d (IIRC I have that panel at
hand).

--=20
With Best Regards,
Andy Shevchenko
