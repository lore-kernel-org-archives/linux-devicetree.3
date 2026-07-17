Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD02FB97B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285189; cv=pass; b=HFyObDTn32nEIdiUHQ4urxS7/QdGRvfKGGs5ZSNS9a7JaRpylIb4pKfGV3YYf3H1kbmWs3OIEvz2gp4/nJHqx3PwLt2nPpBQw9F4gax+1iIAk5Km6n0UDxxNwKDD2eyS7stEIqT2Q07yIq4skvfWZE92pKQTJShcmN4bq+9+oSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285189; c=relaxed/simple;
	bh=1T+N4cx+v3W0V1Sqwc8Or6I1w5aOdKMG9Ld/eFkP6sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gq0NTVGbLrvPT1LXTBYo6VpbFNjCFu5h2OJwUud/xQJGxwssgh8cWOBia3PYdEhZQDL93dU1RLOzu9D+j/uV7QmIgmdYht5lf9ER5iXaGEfE/AaVRSbwhxZOzSwUDtPymTavStDFJeZtKQw5r9z5cURQu413Jsq7nI/QgIztyck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjEiGCaG; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjEiGCaG"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeae771c49so8844055e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784285183; cv=none;
        d=google.com; s=arc-20260327;
        b=bBTNqr+ecG8Awnar6om+cPuV/UEs56OSUGvu0tFUUfAuDootJUWfiT7V43wNtHFaAZ
         Nnrm/pIbyLZVd56j/GAcF+OGR3mVWYDS7vz+w2rZky7dho25oys3c+Yf8AYwHygtfXJ0
         0FSWmkPvvmstAV/dHLTbiG7xlcPCQ/C0gQBuq3ldxap4uy5GjhedqUi/duQZBfZw6EOz
         yh8Mrga/tYYvBtBCSpIXHjlgYVrtYWjBWBRvA2VihcoaOvc0qupdG0sFGYaJywrsta5Z
         pJRW3aUsawx5GXPK1Lpz+BIUS5AvshymKyRSRI3DjLuh+PN2+dvlfYf4k9DLHpXNX/wQ
         iBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YHbZnUgfhySQwLZmZxFG4/4tCoDafXP3bzmxOBvVJ8o=;
        fh=tedmmGTJMm6H7ToSlKvJ2e4WJlW1FQCjGbm+ceQy8Fk=;
        b=pETqEBYdv90gBIjBL3llSG4MPO9pD6IIQX8MBvUp1mqcbhstdFd1F/RO6IbIZ0/c9d
         tx6wXxbWGZ2bj2q5wVw013QDfUuwd8PSb7JMd1zwj1cAm4Njfsi9RZON3fpuzuT3PZZV
         l8LDw+CA2il/MZTNVDzecJLwgp/XzwXLJTDSj6v733CVm99UrNhhvPedJ/UY+6Q9XASB
         y4gIzaMzSVKwFLImw+q8uk3eFA5j2iUR3gwNvMN0K5gDRGEa8uerwdpZUgBc0xDaLG8r
         F/8pg14tINEzhCzQZ2qi0JtxSAl2c3Ywm+WPEXEjMKsk94H//dfxnbAUtjkBPY7wJ48K
         NDOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784285183; x=1784889983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHbZnUgfhySQwLZmZxFG4/4tCoDafXP3bzmxOBvVJ8o=;
        b=YjEiGCaGEbDSDMXLzpK6Etcn8cpQ6kLhKtQ5amU3CCqNLWPnJJsV9eniRkraCiFyxz
         cbbb/PMNGhL5oR8Agw4TwRnAmrFc7djsZZWMoKwDOBa5eOupNx2xNUKSltDOunX5oFKL
         wv3B2vnxce/fWyx5bYzeKtc434YBwB3ha6zre17+Tf6+2iHj4asx3LF9v95Y4deywEbL
         07JJi89V0El7MPqaLCZl/wihtdhgMlJHbXCFniuANJ3bKQXa3YcfPGAUbXV2d5JGcJRp
         4DFSi3eM3/3fv6Sg8EZIe4GjLa/stpeZ0AqLyCVm0oe1p3K8ab267A5uyGRPM0f1Qkzl
         ccyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285183; x=1784889983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YHbZnUgfhySQwLZmZxFG4/4tCoDafXP3bzmxOBvVJ8o=;
        b=CGyP0DuEOiXeGM9rTbGXIxa08+GNiuJT7wN1FaoW+UBI1KDGsfFFLeRgjqjs81Dv08
         61Y4JdnKTChrXIfu4aTbozr32rWij+/ONgL4GbiEf7CITMZQo1aw8PUMBs4fWHlaBpeq
         EsXszlnnm0MX8mwo98uSq1x+XQaf/cFRe1bndUPy34W3GePJoM0nokWuoxaEvtJ+pjBc
         KSjjkDy5+3l0+b2Jzz0cnAusnEzSaAzEc29t1BTpueoyGKafB+hJn2WImyxuVMZgS+Je
         Nas9pnfUjOK2bQ103jVkGjuSYhgOkQZvLOrdZvPLB9X8IPymcXPzmOx5rxfpoLYjvRat
         RVJQ==
X-Forwarded-Encrypted: i=1; AHgh+RopqQodrG+86L2iCF19XSnPtZpOPoZaOkInPeM2euuUEaZ6mmnbXtL2vTzFq8UCkQt0civ+RVMmHro2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpXWBo35oli3Z+5nt/Mx+v7GyrI8FIhUL3F432+TJTkmeHsiT
	EeB0u6qmJPTDPavS6Fb0W0V9ejX9Ie2dzudQmiS51F2c69M3WdZShazaWwxKcxb8LDibsRzndcf
	BU+Qpu/UUay1rI6CwU1T+EOTUR20vpls=
X-Gm-Gg: AfdE7cnNk9rGGSkxc9IcbDelNAZcP7Im97uW8lXSEyeTyJmkhrLtaSNrMZMnDHC+fYV
	cjITke2B/Chw01xobWZaWgH+RaQJ20sJHtw0X1ujaW9AY3OLGnJP1qG3jgvAgdLoLrZVzycmHyO
	ujrkaKG8vd/0RmJuSN4j8NdbSHvvkrgLZEszjjwr8hjQCWSF0keTqOrfUSJPJlBhz0NQS0yrziS
	6Im7wGczWn+lXlwNYFAt6v9Hj5rM5nuM4Th1Vbr5nf6diVlVdeAKwNshYCUM34psBFe/qHtU6q8
	XsCFC+FdFwYMOKT+udINBNPCwP4/S1Kwwn95orGiUM1sRQ+VwL/hXkZRIEXPM1aukp2920rRqrQ
	4r74Y
X-Received: by 2002:ac2:51cf:0:b0:5ae:b136:acdc with SMTP id
 2adb3069b0e04-5b28f9a589emr536086e87.35.1784285182682; Fri, 17 Jul 2026
 03:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-3-kieweg.leander@gmail.com> <d817d031-6ef2-4909-81cb-a9d417550dd8@suse.de>
In-Reply-To: <d817d031-6ef2-4909-81cb-a9d417550dd8@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Fri, 17 Jul 2026 12:46:09 +0200
X-Gm-Features: AUfX_mw8ch0ZGElQgNP-r5TJUFlhtJZKGB1M8n9Xm63PvlrnxX6RSRURqwTyDwk
Message-ID: <CAMwcS0h--iZtjVZUeeHmoV4MngfW_f9auAseBDhqXMGc_zqVqg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for GlandaGPU
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the detailed review, going through each point:

> Please use drm_device.dev instead.

Will drop this field and use gdev->drm.dev everywhere instead.

> Synchronization happens with drm_gem_fb_begin_cpu_access(). No need to
> take the lock here.
>
> > +     ret = drm_gem_shmem_vmap_locked(shmem, &map);
>
> This vmap should not happen here, but in begin_fb_access.  We have
> helpers that set up the mapping for your driver. Take a look at
> DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and DRM_GEM_SHADOW_PLANE_FUNCS and the
> drivers that use them.

I wasn't aware these helpers existed, this looks like exactly the
right fit for what I'm doing (software render into shmem, blit into
hardware VRAM on flip). I'll switch to
DRM_GEM_SHADOW_PLANE_HELPER_FUNCS/DRM_GEM_SHADOW_PLANE_FUNCS and drop
the manual dma_resv_lock/vmap_locked handling entirely for v2.

> That's confusing. Each pixel is 32 bit. But each color channel is only 4
> bit. So there's a 20-bit hole in each pixel, right?   Why don't you use
> 16 bit per pixel?

You're right that it's wasteful as-is. One thing worth mentioning
though, my VRAM write port on the hardware side is a fixed 32-bit
Avalon-MM slave without byteenable support. The hardware itself
always reads the lower 12 bits and ignores the rest, so that part is
fine regardless of write width, but I'm not certain the interconnect
would reliably place a 16-bit write into the lower half of the
32-bit word rather than, say, the upper half depending on address
alignment, without byteenable support to make that explicit.

I'm already planning to update the hardware to accept XRGB8888
natively, which will need the full 32-bit width regardless and
removes the CPU-side pixel conversion entirely, so I'll leave this
as a 32-bit write for now and address it as part of that hardware
change rather than adding byteenable support for what would only be
a temporary fix.

> I don't think it is possible that new_state is NULL.

I'll drop the redundant check.

> No need for this function. drm_gem_fb_create_with_dirty() is exactly
> what you're looking for.

Thanks, I'll drop glanda_fb_create()/glanda_fb_funcs and just assign
drm_gem_fb_create_with_dirty directly.

> Drop these ioctls entirely. As I outlined in my reply to the cover
> letter, these will not work with DRM as they are now. Especially since
> you're using gem-shmem as a shadow buffer. All your rendering happens in
> system memory in user space in software.

Agreed, as mentioned in my reply to the cover letter, these are gone
in v2.

> This function is going away. You can open-code it instead.

Will do, thanks for the heads up.

I'll include all of this in v2 along with what we discussed on the
cover letter thread. Thanks again for the thorough review.

Best regards,
Leander
