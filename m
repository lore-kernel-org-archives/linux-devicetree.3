Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CE3E51F9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918421; cv=none; b=spmk84NgknjByxXo07mkSMGQOkZpu8CY2Tcd3Awrz+7hBrlaWHCqEmiT42aZolL1G7G6h/1hR9s2+K9TEJ1Ka0qzMljyE16gMFmWHXv7gV5q4iXuqQBmwwnUdhiqXLLHKXKxINxe+4gZKoydC6EwLxb3YscxsLmixlgtDlbWR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918421; c=relaxed/simple;
	bh=F4tps98pt30x+F5pSzHz1Af/S5a0VJt4BpfewzDtf/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp60+rvaQARmNploWFkZ0XxSt5Bg8rmMeRW15LKT1dpu5r1EIUMxSCdltXmHDyJUveo8SWl1hTnmIqPgmlV+qDqkGcF9+HR1u9mDaNyMw0xo15ezw501/E6loBSvlluoJ00pgr9oXyJltGGYE422uH2BbeLA6v343eyYNUZ9gDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-73791ee3612so339110137.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918419; x=1786523219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wNePd+4ZCAAsdt4HAVjJh/fqaPl8ns3nSA+3DnSa5Us=;
        b=U4lgxD4xLir44FKA6Uxt6BCmmXYbkuIE+KNNq2D8pceA2xIp2BJcej0Rp5/ONn6JA9
         blkPbUWAjARlxya1jsi2vZ2V6UgfV/kUQAZ91zl4HIGrAGNf4GcJLOSZjQ1HR8W24fdT
         5ylL7Vv4lRTbn/DlxSRiiLPmfMfbHoYJe506voYpx4BiXiMDypr4SJRJ/2j8YlauKUxE
         CJfnUSArgw4Mx1fx1sQesx8XkWr8hv3G1u2U8b427hNVko/JqoFVLmE0LIeNde2x9SQH
         VFB9PmKuoLTLqDMIjPyOGKDIvqFID4QzvI4PFCRuyVe0HbJufDihGUoksEtN3JvFcSJf
         1VfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9FfwYBL6R7PkmS+0IsBeFw+JlJp1d5Yy+xPSAgBKRB1lQUDhBMpwi7TxxzYPSkxjHjyH5ZxvOOgTq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjRzU+ia83wrIrxo1jUy5Lovb7LNWh4KINsAV6DVHxg3+hIh8
	uC/27eOra9iSkOVaG9dpqkIjdKm3B+evowBs4TbMUT5Th6NI1OuLbH7sBTQZkFwx
X-Gm-Gg: AR+sD11bk7C/aRSKqA5PWX+Mbvxey9Tw4w9eO+JOysz0nPu7nDMZGfz0gDhXs7pMIAj
	SoCTKYPj7ndvmzb9wYmseqf0b45CWHPSZAoRIc2u0NOHUR1k0dcPOTkZSd1keAtGu5W6U81Qsm7
	1u+ypoxXyo7X/Tjiswqu0AaBtKbRYXtPQ65SxYyiCct8z6fPlvAa27WoSBkFhxZ7WEYGYvYRP7X
	vPbWKFZ5mu6qMb1Bk5Snun4B2yK6l7Qz+Gvrf94qriB0X3+POO9ouycBsM0+0DtAmMkUEZaeChP
	lAyUkoPkAMFEFApb7MR4LFge2lqjhU7iRojD/fBwSsq3stloCUoCC39+kLqEM4cClLLBa8P8wKM
	qoH0VTvKL/0AF2DajeVM91XWQTXPvTaMDIJ50e8vj2kZe7kw894jAvegBYsNJBS3RrJf7NZPl/6
	xAa1i1ep6PeZwhwGzee9ntqw4pPbHdv3Ko99l68OWOywj06niJxFKnAxaWY6sivanJDM6k42ld0
	dSLzAEViUca+tYVLBpH3pL+BOgHA/h7kJpI
X-Received: by 2002:a05:6102:6444:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-760e9d4a87cmr1511481137.9.1785918418920;
        Wed, 05 Aug 2026 01:26:58 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760450312a1sm1785984137.2.2026.08.05.01.26.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:26:58 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ad03fa605so366045137.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrytpn2RLuuStmj3wA1OI/tdz75nWXil5FNGDR/IJdBen0ny4uoxGziObTlKAmcqeO0AE0jiWAGaCgK@vger.kernel.org
X-Received: by 2002:a05:6102:32d3:b0:6c5:d55d:c093 with SMTP id
 ada2fe7eead31-760e8720f3cmr1372767137.8.1785918418007; Wed, 05 Aug 2026
 01:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 10:26:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG0RH6sFpBxp-dXw4S8kdS0oyyCL=wzKE=TkheWQAs=w@mail.gmail.com>
X-Gm-Features: AUfX_mzkBTUJ-FXSnXyEdREDuwr6z66OMwhD5VFVLs8a5iUa42Krc5qoQokN0N0
Message-ID: <CAMuHMdUG0RH6sFpBxp-dXw4S8kdS0oyyCL=wzKE=TkheWQAs=w@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs->id
 on idr_alloc() failure
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abdurrahman,

Thanks for your patch!

On Thu, 23 Jul 2026 at 05:26, Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:
> of_overlay_fdt_apply() stores the idr_alloc() return value in
> ovcs->id before checking it. On failure the stored id is negative and
> the error path runs free_overlay_changeset(), whose "if (ovcs->id)"
> check passes: idr_remove() is called with a negative id and
> list_del() runs on ovcs->ovcs_list, which is not initialized until
> after the id allocation. An allocation failure at that point
> dereferences NULL.

Nice catch!

>
> Reset ovcs->id to 0 before taking the error path.
>
> Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
> Assisted-by: Claude:claude-fable-5 [Claude Code]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -1038,6 +1038,8 @@ int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
>         ovcs->id = idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
>         if (ovcs->id <= 0) {
>                 ret = ovcs->id;
> +               /* free_overlay_changeset() treats a set id as registered */
> +               ovcs->id = 0;

(Alternatively, free_overlay_changeset() could check for a
strict-positive id)

However, I am wondering if this is the right fix?

All error cases above just return an error code, without doing
any cleanup. Failing to allocate an ID doesn't add any extra state...

>                 goto err_free_ovcs;

... so shouldn't this just  be changed to "goto out_unlock" instead?

>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
