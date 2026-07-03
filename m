Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD626ED33
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054286; cv=pass; b=FkMKupiYJGSRYVBNEtWcJ/XS6qdgZ8Zyqksjnu44e1KPFYHD8VZAAwYSHWjLPJPRuu8e8au+9xzJ+z7CnVi6witWi4ug41vWLOuB+RcxaEB3iawT52ARaT543vSigzzK86XVI5IWR3fjl1L7QF9nGun0NiVempbBN1bS4kmof8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054286; c=relaxed/simple;
	bh=+PEDwmKMlxXv4cweX/Pw7SUlOHYM8lpcxQN7R6f0nGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMgVIog5QzBqbMTJuyQ7PGymfKGnPGz23eA/5E+aJ8KaDg8Di38RIfly/AxXSjEwFi5W7vHONOwP2cYooYNWDraxLFbj9r4zHv1Jd0aKlbIuPcC5LxiZuO3fjP+GeLMI/tcgtlzS1wdGG+QlceLRFG5oMp7THipPJJh7WZ5Uslg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfPsnnSY; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfPsnnSY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so310003a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 21:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783054277; cv=none;
        d=google.com; s=arc-20260327;
        b=fCPc/BgRBNw0L5+ktqLIDhQ39WaK6A4JLdYuchbliqgqB8Wxg8oRglJM4q0WgoI/OZ
         2/plydSWa/mgKBpYdRvjkEYCnvbqBOqdpyMluJkRFNh1uBp25dAZ614kn0yrUYCg3MRx
         fKTNqvtdGtIJM75T200S7OZgxTNN7eSz8guxTnrePqcHRtOoMKIY+i0GdL62UlMs3A1l
         YtiIyP99852D0SqcZt9ny+RqkQDgmP19ELcqCf/FNbR5dpPRuQK3M4wNS2hym7QVswNM
         uDwR20NpZozG0zAPgTwPN3DmYEeZgVFOll7qgjeGVLTMQXh1z4x3AOaNCOOe4CqPmFV2
         NaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        fh=gCSQcgBuTgpT81wEM4CZAvgKSvtqSpJkcSfComwNjkw=;
        b=JUofdE7sRXY1MVEvoSxASv1MiD2NFm4tPK52b84gkaJ9v8/C1HRi9G6nuzC2Nnf+L5
         OcsEjTSic8M/EfZXEZGfCpakZnyoYmWcuy6y6f1yyGeA/VSf44SiT8MOxKimRyeu65Ce
         0mbqitfcsEHvTTdzHnoN0yYqu6zmQkXvlEdA5fHdbO7+SZySp1MBlzWfbnuEWUuU6Uuo
         E6o0qzhmdu5GGR+4GnDv8m9GWBPm4PJhWOMIhn4K8mAWs3YHQBcoCCfp4HKKqFXTWepS
         4Q2c7Lj9U9JFnr1wgNIXoGARGwSh9CDdhx3c26RceJIABUjo5vjJ9zlPej4X2J9qsoZr
         QBRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783054277; x=1783659077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        b=GfPsnnSYAW5kbWwqKSawDQyp1XtVAWiarVMgcUjF93AKJgiAR/98VdNuin+wFS/iQH
         9UlDpKJ9C56pXQngFQWY3rUUo31hSQk50P0b6o3emUXGFZ1T4z6jBpQ04Ye/C9RNYxhH
         75ttZhYdkVqd0R13xwysAK8dlUJtCDe3OVUWJqHQqKWZyGrh6pJ+28k0phcwHi9ZsD//
         GKBu3NRtIYkaK4f9FRnNt1yyMLFsf9WB34uu3ydRCeguiNVmxNODj8QdwODeTGsojbS3
         HmkVBm4l/HWaCkgby8HBfu7x68Wo39CcfDL4Prr3QyY8ldmWAJ8NGEZyugOF2BGiTPaH
         uDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783054277; x=1783659077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        b=O0eG4WGLLaUW9KrtalmZ+b5Hec6EacMZXPbjbAXcDd+cHpJcJx2TZVnRNPFH0r4E3z
         WH9f2PrYV+bDdYf2iobw2uajZfjepubdOycRsLSR61SnuR6aIX8pIprMHczOodtRFumg
         9f7q+gpyNpHmAxQIscsoZ/udW2TgOI7YqAWoKzemtCEtz61D4Liao55Sew4VCgK3BblY
         YzSHryIKEEfWpcxzKf+RS0YFxN8OOGXPZuRHJdXTVX0xdorDPOyWewT/BcjGFVUSz5lV
         a47KIU3sDuxy63SS0EVq/R8e6V5rKblXijkB8/nqJ7ebPRW2AyKOX/uKvsva12WVIZj3
         PNFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro69xUKOlS6NLLrPp7zgGsQ+uy94i02kwPd5jb6GjOnS5e00Pdkc6hzGqlHJWZVNQh3WrgSBo7FCblP@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsPF/Gq0TzdiH8t6GRHm/xwgpbLK/rYRGDRquRT2XKJy+7W4z
	7iA97FYqzAqDcJdpFpfKOKRuiWGy6NmX3LzxcK7K/H9u9eIDS/f5nFluP559A63FEuCMfysvxaN
	/aeAo8Nrq711liqcFqmOLnqTa5u5HTW8=
X-Gm-Gg: AfdE7clHGOIXgdYh2YT22802Kl5D7L1ISSsG/RG+duuUcytZUlysGo0nTOLshq51gFh
	hWC8WnmF7Ob7InnxMzawuE3UhNWRJ25hXQsl0Bjays1V1yIFa9NvEB9jTAjOIPigCpaqpcLPHAB
	9jLVRl718GaCyzb5ZGDYlz+MsWZFbHJv6Q+/tQhm/N4elGEI/Dfducqm6NjBpMsxKi8DAd4NKi0
	cdYk3e3xDRdcg+R3lxlFcl4C4d8var6WqbPzksubwWJfo1gpEVfArD4AKwBfQ0mzoHUoQ==
X-Received: by 2002:a05:6402:428f:b0:698:5f35:a8f1 with SMTP id
 4fb4d7f45d1cf-6989f2de5a2mr4060884a12.6.1783054276736; Thu, 02 Jul 2026
 21:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
 <20260703041329.2797584-4-ekffu200098@gmail.com> <20260703042714.DB91A1F000E9@smtp.kernel.org>
In-Reply-To: <20260703042714.DB91A1F000E9@smtp.kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 3 Jul 2026 13:51:03 +0900
X-Gm-Features: AVVi8Cd2bVlUnwsKTntq8s3Zx4NQPFH6pVrTlzDTRfN2lT2h5pCleS3fAtXrZvo
Message-ID: <CABFDxMHVt1v6pzj9x_Hys571o=YAi1wprjJS8Nz7Ko-wQ=A98Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] of/numa: remove redundant numa_nodes_parsed node_set()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 1:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The function's final return status is order-dependent, improperl=
y shadowing earlier successes if the last evaluated memory node lacks a 'nu=
ma-node-id' property.
> --
>
> commit a42c5d6d6a0d76bbe5386c6e6e6307393d31c628
> Author: Sang-Heon Jeon <ekffu200098@gmail.com>
>
> of/numa: remove redundant numa_nodes_parsed node_set()
>
> This commit simplifies of_numa_parse_memory_nodes() by removing a redunda=
nt
> node_set() call. The operation is now handled internally by
> numa_add_memblk().
>
> > diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> > index cd2dc8e825c92..230d5f628c1b4 100644
> > --- a/drivers/of/of_numa.c
> > +++ b/drivers/of/of_numa.c
> > @@ -59,11 +59,8 @@ static int __init of_numa_parse_memory_nodes(void)
> >                       r =3D -EINVAL;
> >               }
> >
> > -             for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc)=
; i++) {
> > +             for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc)=
; i++)
> >                       r =3D numa_add_memblk(nid, rsrc.start, rsrc.end +=
 1);
> > -                     if (!r)
> > -                             node_set(nid, numa_nodes_parsed);
> > -             }
>
> [Severity: High]
> This is a pre-existing issue, but does this function accidentally return =
an
> error if the last memory node evaluated lacks a NUMA node ID?
>
> Looking at of_numa_parse_memory_nodes(), if the device tree contains mult=
iple
> memory nodes and the final iterated node does not have a "numa-node-id"
> property, the loop handles it like this:
>
>     for_each_node_by_type(np, "memory") {
>         r =3D of_property_read_u32(np, "numa-node-id", &nid);
>         if (r =3D=3D -EINVAL)
>             continue;
>         ...
>
> This clobbers the r variable with -EINVAL and continues to the end of the
> loop. If this is the last iteration, the loop terminates and the function
> returns -EINVAL, discarding prior successful parses.
>
> Could this lead to NUMA initialization failing entirely on valid system
> configurations and falling back to a single node?
>
> >
> >               if (!i || r) {
> >                       of_node_put(np);

Already being discussed in a separate patch, See [1].

[1] https://lore.kernel.org/all/20260621143919.4176646-1-ekffu200098@gmail.=
com/

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703041329.27=
97584-1-ekffu200098@gmail.com?part=3D3

Best Regards,
Sang-Heon Jeon
