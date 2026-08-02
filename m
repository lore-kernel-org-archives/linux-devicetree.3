Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626533E367
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785711404; cv=pass; b=V5fcEdP0gvbuquwmqQZFPXNHUJBbpoXhvmvkagCj9mXJuhtAOsUgs3rn9IgZdXvbJfIXm2nXNCHXHtVfIT3cyeiAixScxEzK7LkQSfVRYK1GLX+aM3iRxL8LRkXweHtTeVa3lrJnL0VIJBVCs75mYUceBxwi1WQhzWF7SmidVEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785711404; c=relaxed/simple;
	bh=RuFP9W4Bh5Ik9VVQIRnJcCOdTJDK250ksApEnRBF5eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uo7nbbu3CZspVnaH4+SJt1SugL5U+N6bn7qyP0wAMoGL5CIRK0zI6uhxGdGblVQC1dQshGxi5HlXYRNf7DxJjJcGDVyL4jsTVXMz75gML4BJbzRH7e8uc/Xu1T1fQvZ8BgJtA4/Tf5KBx5bUSaQvlYDilnVfLWRrS+qK+uHgRVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pY5DKIjx; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY5DKIjx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0ddef4e35so789153a12.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 15:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785711401; cv=none;
        d=google.com; s=arc-20260327;
        b=MR0GZK151M89l7FomzfaY5sECAvZDEKJq6kONYHYMtFqTlF42KcOCB7GsRrndJdLW/
         AIfe8Gdlf13EQ0XE4A9S1MXMOkmk3zF2pgY0YYDo7jD6TyyJFG5zURiTI2agMIKm22bj
         HvgxzrBGerIEhcZzU2TpylmC6BWmYWi/4KnWibRGIjXA5F0QedFiY5FEsMEksZGyBlmr
         gdKHizCPtceeVcIsuM4ESI/Co0sDIRixcKMdCN/C9UMvOY4SM4q8mJGFL2qiTcuWgxcY
         jULek6ZlW2U4QLzHcoqJjQG43Xxt5FdCMFEvgmAlt9otXlCXlfEkcAB6HgGTgYXtytSz
         gmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/rMtwPDxsC52fx+U9UwvVtcGVHIIpAAwX8W2NzxXeY=;
        fh=/9PfmFev1Mo3x/DHiH9F/4NVIZR0VLz/cLTKHvyj7m0=;
        b=q+XLDiZLsBFj519C6vuQ9ykhtbmBj2BHdVfcwu3pwBXkURmuOlZOrsd7wzCs0c4rIw
         foiJBWZN93TmoQE2iTVhbKwPnO31CGHGmnkv8he5YpB2qKQ2h+oQhRpsIQU3jMYLLFoC
         Oxleh+j4JBdfWYYFA9CmAOAFPE7u00eE3ikyReY5LeHGsMiZUbiWwl/ZvzmR8hfGv3bB
         Bf9dqQMUCZkcMF/4KvihaLqhNFnmEYbyEhjHhS7yE8wU82PH5sRmmcEXHxY8d7Zcqxg9
         s9dEoRj4jIErPW87C9fE+L6PijpsdbPYMKPzvVDwwG8TLuvytzlvxqXZWuckuXE7I5hL
         OL8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785711401; x=1786316201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/rMtwPDxsC52fx+U9UwvVtcGVHIIpAAwX8W2NzxXeY=;
        b=pY5DKIjxmaUwSJ5I+m9/Kz7n4fqOq3UfZ3xTgnzTKl166C73xVLRdIod34cYP/qSBY
         oHCn10sBMZRnLd2oP77SBVXqN5ygYav5EU2+mFf9+2eP2EmGXNNoCUZrMc0A2Y9dUx9S
         fgbRINpGG1S9+brhNwxjubSDpg1lMNPKeLtUbehlaR1xaMJag0P/5eO3SPXOCip3GDps
         YgoPn9Im/hqaiwbsKYH/drUKgbrEcfgxUdzMDhBQmYNzitlbenv0MNkRIedqtLigt1T+
         DbBa3W7ZUpALPc8jHWFGKYfE7GXlIdpvdsDzzG2Jmxa5Yb2kYeQM8E6B5cFkgN4QT6M5
         X6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785711401; x=1786316201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/rMtwPDxsC52fx+U9UwvVtcGVHIIpAAwX8W2NzxXeY=;
        b=iHiB4GvuTc6Mk3rK3/L/qGqgu/BFCC1nIcMXS70beWif8DmsAKsdkJENgBd6XHM+Oo
         lGmCT7YDYAJnHMdAOCBC88F+W0Vi7384MWuJSJF0n7zNxLpbGBGK7g1g0XEZCHHaQMIv
         25RGy1tiRI+L7OLk/AuIYxGieEIZfq3NB3rl5pL1XihumxR43pYkKGiqjGY6xgsqi0Lh
         xMS68cZEbHAWebgtpBPTsmriYP+Mghb/QgDT+QeMwCFkzWpbKsiFuRETrL81Gci500qo
         R16Fx+d77o1Ecl47vjb5ziRupJzQ91XjIdSGmTuBrxoya0jpj8GgKH1pM4KNvMviQ49E
         Bn3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYLfJ7otYlMRUnt8y8L4LOEkRO81Vq77brHe7iRuJToemJywn5CHYILa5IRQvEShlaMlFBvjSR9o1T@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbFqdTsMRG+gK2vxoFIFCZIvAijUWoJHzdKXW7OJsr08CWX1I
	9AWEIOy4AkekW7ySs5tu4LQNWSHHv/Cf4zgi+tb5BZJTdsYeoqw1MMMiM6aq1CHX8lxC2p7OotF
	DAFj9NEkKoJeJy5uZpASaHVYegEf4mus=
X-Gm-Gg: AR+sD128epienaMpZECC3VG7n/ei7HJgaitRq29WGXB9+xIdX6xvE/gQWBo8zMwcI10
	C0iU62FakYM4P2D/3zOwMurUYwZjFFwdbFi4JtOIwbi5zMeFoPv6yUWGYpcWpJ/3Vz8BpU5UPoU
	EbIUPySg+Mwg6jeGwoaHS+6XdOyQ4DqXBL3aEZ8Ax+0Oo+17LeSTkCsH/WhYUP3KHfdEmo7nmsE
	eFUV16jDx93os22HueUMAYK7yeZin5YdsjUpaMz730RxtNNZ5sbLGi8NTy+DMhiHhBAEqJKIhNa
	c3b5fPApQRWN5SDAA3cI+j3oh8vKMTyW+LcbVEjJJo2KWbzDIyomUlas5VEos+qTnA==
X-Received: by 2002:a05:6402:5046:b0:699:fbe4:16d4 with SMTP id
 4fb4d7f45d1cf-6a0a7cb31e1mr5338151a12.18.1785711400839; Sun, 02 Aug 2026
 15:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com> <am9DGQFk6JfR6bXl@monoceros>
In-Reply-To: <am9DGQFk6JfR6bXl@monoceros>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Mon, 3 Aug 2026 00:56:29 +0200
X-Gm-Features: AUfX_mxll1BnAASKTkWyMod9VELF2y9V2Qxa3BymFTVuaD1zfm5wy-U_j9CAbIY
Message-ID: <CAEUXW=Gut0oN6VN1XouegJsQzwNYGqhAjVotGJbQdXk5bVuZwg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Helge Deller <deller@gmx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,


El dom, 2 ago 2026 a las 15:35, Uwe Kleine-K=C3=B6nig
(<u.kleine-koenig@baylibre.com>) escribi=C3=B3:
> No need to wait for init, the idea is to use init=3D/usr/sbin/platsch so
> it starts before init (and once the display is setup execve()s
> /sbin/init).

I think I caused a misunderstanding here: when I wrote "init" I meant
PID 1 itself, not the init system getting far enough to start a service.
Running platsch as PID 1 does not change the part that hurts, because
PID 1 is exactly what I am waiting for.

Numbers from a shipping board, our 4.19 product kernel on an AM335x:

  [    1.065931] tilcdc 4830e000.lcdc: fb0: DRM emulated frame buffer devic=
e
  [    3.522118] Run /sbin/init as init process

The display is up and can be drawn on at 1.07 s. PID 1 does not exist
until 3.52 s. Whatever runs as PID 1, platsch included, is roughly 2.4 s
late on this hardware. That gap is the entire problem: the panel is
alive and black while the customer is looking at it.

> Also you can put it in an initramfs which gets rid of the dependency on
> "rootfs mounted".

Agreed, and that would remove part of those 2.4 s. But not the shape of
it: PID 1 runs after the built-in initcalls have finished, while the
logo is drawn as soon as the display driver's own probe is done. Any
userspace solution is structurally behind that point, and an initramfs
moves it closer without crossing it.

> And if your kernel is modular apart from what is needed for the display
> the time difference between kernel boot image and platsch might be
> negligible compared to the simplification of the software architecture.

That is worth evaluating, and it may well be the right choice for a new
design. It does not change the ordering, though: the display driver has
to stay built in either way, so its probe finishes before PID 1 exists.
Making the rest modular moves PID 1 closer to that moment without ever
reaching it. The kernel logo draws at the earliest point where there is
something to draw on, and nothing in userspace can be earlier than that.

To be clear about what I am not claiming: platsch is the better answer
for anything that can tolerate the delay, it is more flexible, and I
will very likely use it for the parts of our UI that come after the
splash. The kernel logo is not competing with it, it covers the window
platsch cannot reach.

> Having said that, I'm against putting boot splash info in the device
> tree as the pointed out alternative is IMHO good enough. But my opinion
> probably isn't the one that eventually counts.

Understood, and thanks for saying it plainly, it is useful to know where
you stand. For what it is worth, the objection I expected was exactly
that one and I would rather have it on the record than guess at it. If
the conclusion is that a bitmap does not belong in the device tree, the
fallback I would still like to explore is keeping the placement
properties and the reserved memory path while dropping the in-tree
image, since that removes the "bitmap in DT" part while keeping the
early drawing. But that is for Helge and the DT maintainers to weigh.

Thanks for taking the time,
Max
