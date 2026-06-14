Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3B2EEE72
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448385; cv=pass; b=Q+aKXWnKOp46eMEYcqeytR2Uhlxem6HrJVW1dBZb+xmh05+efTKd9dbD+c2CyJisnSmxrfPoaPalTUnbOa/cZ8YfQ68KFbOyqTY+MRdESPLc8yaSvKX5K7QjRcc2hB9t+qvJUzqrV4J/8g9HGfPfcrdm0YrioeUiKoZO64EPrpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448385; c=relaxed/simple;
	bh=2Q3Gmrvzmq5g0KgbCK921fwbHOfDSFNnhYBIbs+uioM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqoYtFHEVXpx5cWImcTUXwbqbNSxE9IdDXxjQGiseswiinZQ1Ih4TGJc24hU1Cws+9pu+0XXLouZy2e9nZQKTPh+gQWLbtQHxhi2UtpK8Wb5URX/c5Jpz/jEMlCQX0+mXzwrjRlWVgYh5dtPMBI3LLpQAdY1RIql6GY4CgGuOjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pwmi9Y9R; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pwmi9Y9R"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7f811da1eedso13866267b3.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 07:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781448382; cv=none;
        d=google.com; s=arc-20240605;
        b=NUj6/7fzuECGq1wTxo2K/1RyJnad+GjIQ/BcE6wAqkYQEVSM0hxTTXIKlekKmYBeuZ
         ZxNF+tl4/c4g2Lkc5sNfj6TWMsC6lri8D3BEG/WqAr9PVL0TEV7IyTB6yy1sLZIC3f2w
         7jA0iTE9VTw4+vSP63Doz5Ij2ZLgewssstscSd8vq5sQkcIPjxHuepirbgAenKRhpzy4
         gkSHL3ADcmIpMdKAf8TBanAn9uHm98aeiFCaWBDt4LJWikAVT6alJwsKwTsXKIhyn7Gw
         hk7r2cFGyF0NUbYd0aQLL2zcGaPYhmNYhowCWsZ8VxEjkaJHjZpvPXbChEbJu6GhuN5k
         NuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=eJfcbhW8SE81SBMt3SXCuckeYl2dyOG3Ug5J8uOo5t+zGzTM0w2xBfySYNfDsU/Zb7
         AWPyDTN6lzmzNkZxrQJYBW28THLTIfoeKdQUWadgiyBO+UTmB1kQaPsPAMaxOqBgHbCF
         78NdiCqoGqLY0TLV+J9ZzytTBsaIHH5RiBWuGI+uUCekY+4FNdC75kkQ7HDydayu5B9u
         9DCYvfPGmq1XKtruRae5zUz5gwrJY4gEAZ0hn+gECajmaE3m1E5QPJ57HQfwOvYj6m4A
         +FBIEnr2z9+tfGeb9G3m2obhuy5Z7e3LNz1ydsr4a/vdOkUnan/n1D9BnCEVpK9HQTzq
         wRQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781448382; x=1782053182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        b=Pwmi9Y9RUSEkbRbBZA8x2CA4kmoe5DFXioTJ/4pNaIiBuUR0lYaW6dzHvSEp99Uf4X
         nKgPqAowaPbHEk551AGEzsGrL0+ZYUv35FW+HmsNp6vOEixaJOCx4w7PN+iGQWSzoNfz
         LktX37IBFKafE787v/kE+4Nw6r89lqXi5niHVgmfAksLmxiRQ20JwuejtnDZj2Mxeyuj
         w3FHQ2cRZOY8rj8HCZtYIhs0mTfYKkSY1karXqi9VXlgj71+hXA2cLa18/unikYoFgPJ
         VZ3IQKl9781qF+qffHWoD00pVpvoT2ov7abg+3OcdPS3xhVCWJ62irx9YH6mQU7ml6od
         YehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448382; x=1782053182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        b=q+kqmN+YBe1ZBGs/KZRH351imGQRvCCX7yf6+US7Qi9XaTIBAUs2Bnt2ECFh7GsPGJ
         ruF2fL4sxvCBAnoNbH6KnPUHdfm6hq72y8Szdvl2JCLd1Eo7WTbWer0GFV6Suabn9Bgz
         5X9RnkmKZVrEaoWQgAsk+dq0VcIU6+EQqlzna6ywQDQPQLrn2xRAq6jwuWSdubKm2q9/
         UwZL6187a6kjxBioQ/I6Ywv2aDIXyZcX+mP5Jihmwn0C6+0ruO8H7TfojcMphC6i+csh
         E6D5Ehuih0KUmGmdynNNmwW3Dz4LWJiwczTTS0fqAIxGbIRdEq8FPWsgQKKCieGIKVYK
         yFCA==
X-Gm-Message-State: AOJu0YzqMf8e6uAoBImHUXuO6zziGbGUWFgJW4HdbYcMY0vc1mZJ7C1R
	h43spSDJgyjGUZgP1Dbq5b+SSW60WZB3N8pCDbHCnT7Sb9IIi/fGkDg6dhzgRdGVncnQJv/Z3yw
	Tgy77X5QVvW/s52vZCQpKyQJP7h/cIK8=
X-Gm-Gg: Acq92OHNoox/rvhanv0Lqwxrho0re9s9NXJ2Lqzuo3NHZYmP2KGQMIV1GB+hW+UlJy0
	WM1V0tKXEBzeeVBv5uVXa5tJuRJeKaHzl/hZPUOAI461wTboqSBpEbD/7WgNjuMGFg4Yy7OHcN6
	N+D3Q57aK/AfSw1F9kUpd3C8mxpIAtwfQ1hs8yY51Lp5VsUbw4r6K3IxckfawO9trO16syr9C5/
	PTaRkge7JWU55Co606hmGfHuRABaj+LPuJ723YRyF6f6RQuncRb/cA+ZJq2DAhAoRHIfykfzZHH
	+ed6
X-Received: by 2002:a05:690e:4146:b0:651:bf58:446b with SMTP id
 956f58d0204a3-66277f5479dmr8835081d50.10.1781448381613; Sun, 14 Jun 2026
 07:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614133807.2165124-3-ekffu200098@gmail.com> <20260614135041.D944B1F000E9@smtp.kernel.org>
In-Reply-To: <20260614135041.D944B1F000E9@smtp.kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sun, 14 Jun 2026 23:46:10 +0900
X-Gm-Features: AVVi8CcBo1nTDfvjkovV-__M8a02nNzFI7DIjnYIoWPk9xTRUu7QjWwIjJiydSI
Message-ID: <CABFDxMEhOJ1nrmWcyO6FVfxQHbahKiJ_O_QKPf0Q-VMzT5pdEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: reserved_mem: print skipped node name when too
 many regions are defined
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 10:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Out-of-bounds write to the static `reserved_mem_array` if `membl=
ock_alloc` fails during dynamic array reallocation.
> - [High] Ignored memory reservation failures allow unreserved memory to b=
e successfully registered and handed out as exclusive reserved memory.
> - [Medium] Dynamically allocated `no-map` reserved memory regions are lea=
ked from `memblock.reserved` if their initialization fails.
> --
>
> commit f95986ab58870e3d79cb320c6dc73ef80982357e
> Author: Sang-Heon Jeon <ekffu200098@gmail.com>
>
> of: reserved_mem: print skipped node name when too many regions are defin=
ed
>
> When too many reserved memory regions are defined,
> fdt_init_reserved_mem_node() logs an error and skips the region without
> naming the node.
>
> Print the node name so the skipped node can be identified, matching
> fdt_scan_reserved_mem().
>
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index 499b769e98096..df3d90cb8dbe1 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -623,7 +623,8 @@ static void __init fdt_init_reserved_mem_node(unsig=
ned long node, const char *un
> >       struct reserved_mem *rmem =3D &reserved_mem[reserved_mem_count];
> >
> >       if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
> > -             pr_err("not enough space for all defined regions.\n");
> > +             pr_err("not enough space for all defined regions, skip '%=
s'\n",
> > +                    uname);
> >               return;
> >       }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does alloc_reserved_mem_ar=
ray()
> fail to reset total_reserved_mem_cnt on error?
>
> If memblock_alloc() fails during dynamic array reallocation, it returns e=
arly
> without resetting total_reserved_mem_cnt back to its original value. When=
 the
> bounds check in fdt_init_reserved_mem_node() is reached later,
> reserved_mem_count can increment beyond the statically-sized
> reserved_mem_array limit, potentially causing an out-of-bounds write:
>
> drivers/of/of_reserved_mem.c:alloc_reserved_mem_array() {
>     ...
>         new_array =3D memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>         if (!new_array) {
>                 pr_err("Failed to allocate memory for reserved_mem array.=
..");
>                 return;
>         }
>     ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but does __reserved_mem_reserve_reg()
> unconditionally return 0 even if early_init_dt_reserve_memory() fails?
>
> If memory reservation fails, it logs an error but returns success, allowi=
ng
> unreserved memory to be successfully registered and later handed out as
> exclusive reserved memory:
>
> drivers/of/of_reserved_mem.c:__reserved_mem_reserve_reg() {
>     ...
>                 if (early_init_dt_reserve_memory(base, size, nomap)) {
>                         pr_err("Reserved memory: failed to reserve...");
>                 }
>         }
>         return 0;
> }

These areas are affected by the ongoing series [1], so it might be
better not to touch them until it is merged.

[1] https://lore.kernel.org/all/20260527032917.3385849-1-chenwandun1@gmail.=
com/

> [Severity: Medium]
> This is a pre-existing issue, but does fdt_init_reserved_mem_node() leak
> dynamically allocated no-map regions if initialization fails?
>
> If __reserved_mem_init_node() returns an error, the cleanup path for no-m=
ap
> regions clears the MEMBLOCK_NOMAP flag but skips calling memblock_phys_fr=
ee(),
> which permanently leaks the physical memory from memblock.reserved:
>
> drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
>     ...
>         err =3D __reserved_mem_init_node(rmem, node);
>         if (err !=3D 0 && err !=3D -ENODEV) {
>                 pr_info("node %s compatible matching fail\n", rmem->name)=
;
>                 rmem->name =3D NULL;
>
>                 if (nomap)
>                         memblock_clear_nomap(rmem->base, rmem->size);
>                 else
>                         memblock_phys_free(rmem->base, rmem->size);
>                 return;
>     ...
> }

It should be rare, but looks correct to me. BTW, it is not directly
related to this patchset, so I think it is better to fix it in a
separate patch.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614133807.21=
65124-1-ekffu200098@gmail.com?part=3D2

Best Regards,
Sang-Heon Jeon
