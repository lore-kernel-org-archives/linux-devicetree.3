Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303928D831
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918856; cv=none; b=WD4BTXULGfkNLl+OXxq+OfA58eILoseD24bVKPJigcCwx7Y5iIoPVtSPxsX+bfQH5Vq+vwEuPcPryzPVQ3rtxvoKQKjLijiMwR/ogrCz3zVphxp3ysNJkIRFlDy/PZUMKzXTdZBm0iVUWCvT4aKSUiuUe3YcgO0WPesk+yiSZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918856; c=relaxed/simple;
	bh=lKvkxm5KL/UieJxIEuzemE+KqPAg7C4v1DVE/r/NAYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu6wMu86vAAJPe6l+SyeJKx5rIK/S7oSTdXcefGnKcmBgX9z88qNwmDsGq7OojsHkjZ9nYP8wrbSGxiivl75yb1iNWtJXUGqTqaVXnrcuTmJe1z2rNge7RbwAA5SUlRMDCZKKZQp8iQUaZJpqNsNvuGq/VEQ3KqFA531Az2r70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so613857241.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918853; x=1786523653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZqZlsCS3VXULQE3xEQbfWCtaMWUUl5Mulim5TUsJM5w=;
        b=PnGSeKRg+ifzSkuILJaRi/PD/uRP1RwdGHFVGA5qk+r6B29yaM1E5x8bmekTe1rEFn
         iimQw8XP4a5N0et7xIyMPBdcf+KyJg8+UOkperoE3mrCqY1p9AMINA3VXPXcW6TmDoWx
         AcR3e5f9xbi0Hr9ozGIi/zW+8wE6CBkISEwlY52Q/LroUAYaPyVoN9M/CMYqhx1X6D7V
         hWtt8JuRJHpmuQAyoGlHKB9JzbAtVS7k5xg2ZTZNssw8R1rYJZOn753hWL9yNpXuTZ6/
         UUfC0bujwRN9/g+QEwWS4NYmMBvsbNA1iM3FMm9+JZhVzlsjxanMmTFOgyafIgFQKZ4C
         ltNw==
X-Forwarded-Encrypted: i=1; AHgh+RruGDVQDSpu+0IvCPeX7NnK4PRLPHjxuu7vx0cntLDm9zkfL07OutLD9ukl2eqdBZoBrtTDwmUWRzy0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2JQ5gK9HdS8QNZPqNeZkI8/2mly9oBfcd8Xw6aLC6UDq95SnH
	2HhesOktu2ElrI+dsG3Nj00YcD1jx1WRygC9MUn0ESlQ+ZMvJF24lsuVLXJERo9c
X-Gm-Gg: AR+sD108MNa9lZeaCUOTGUdjI/F3HJ0Zdfv8PUT840tcjuudFJpj5iwfEGtbP3izdaE
	jTl7peTGEud9ACDqbOjiE9wepLiG572zFlvry1GmHe+8A33cRxiVvFN1nxPFPzIFNG7/M8MmB8E
	dxps+rbK3w+5gwI/CahxMlqAsXVdShGS7XZfCPfETvqtZCoym/RR9MkxQXWMl32eboq7AimJc0P
	+yVm8YL1bdjOhkEqVtA0vBlkG4dneGMP+idwFjcD3Wr9MSOfu2lLnDBGBOJZOakMNe7NG6lQyUz
	QDGKuao9JeEvgcSt7ljsRP+DGh47k+FaCtlBk04QdqK5q1jZyRNrBUREJO1vM28ojLEgNMYJw8i
	qNR8KOBBnE+yHXlDEEHUvHtPhjge0plROeK66qL79q4QJAQa7K3laoQacx2RMCHjQFrzxxYMNme
	AbwT9uc4I7mVXZNNMNIa/MqpajnCPgv9fUKAY7V1JWn/LD1mZuo5rgmk80ea22Qv2ULtpj/KYfg
	dWTPDTCxMjtIv52K1zTxq6qqw==
X-Received: by 2002:a05:6102:14dc:10b0:745:3eb9:8de8 with SMTP id ada2fe7eead31-75f76418884mr1526512137.17.1785918853555;
        Wed, 05 Aug 2026 01:34:13 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c7dab25sm1268069241.5.2026.08.05.01.34.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:34:13 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7377dde7bc6so999811137.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpE75zk3gGQjZf91NeXhtV+7DUrXyJacbUK0684ucoZtOF9zqgWSQq2LcLSEihwScBZSOcTK9Bw97ib@vger.kernel.org
X-Received: by 2002:a67:f6d0:0:b0:737:4ebb:b474 with SMTP id
 ada2fe7eead31-75f75d08c5bmr1478165137.11.1785918851533; Wed, 05 Aug 2026
 01:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-2-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-2-2abe2bb9cdbc@nexthop.ai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 10:34:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw4M0Cvc=LJZfRBA0R38YA1zwJ6aOWngL-FDBnPPO0-A@mail.gmail.com>
X-Gm-Features: AUfX_mzGBVHt_i6aLsYfnJVKTjGxkBpRwh5FZ1RsWAFTvbfGrJ-2m4yCCu-457s
Message-ID: <CAMuHMdVw4M0Cvc=LJZfRBA0R38YA1zwJ6aOWngL-FDBnPPO0-A@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] of: update /aliases lookup on reconfig notifications
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abdurrahman,

On Thu, 23 Jul 2026 at 05:19, Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:
> Aliases added by overlays never make it into aliases_lookup, which is
> only filled by of_alias_scan() at boot. of_alias_get_id() returns
> -ENODEV for them and drivers using alias based numbering (i2c, spi,
> tty, mmc) fall back to dynamic ids.
>
> Register a reconfig notifier and mirror /aliases property changes
> into aliases_lookup. The notifier chain covers changesets and
> overlays, so no overlay specific hook is needed. Same approach as
> Geert's 2015 series [1], which was never reposted;
> of_alias_create()/of_alias_destroy() keep its names.
>
> The /aliases node is matched by name and root parent instead of the
> of_aliases pointer, which is still NULL when an overlay creates the
> node on a system without a boot-time /aliases. The name match is
> exact, of_node_name_eq() would also match "aliases@1". ATTACH stores
> the node in of_aliases with a reference held, DETACH drops it again
> and flushes aliases_lookup; the pointer updates happen under
> devtree_lock to pair with the reader in of_find_node_opts_by_path().
> Nodes attached with properties already set are not scanned, as
> before.
>
> Lookup entries are created by of_alias_scan()'s old loop body, moved
> into of_alias_create(). Entries created at runtime have kstrdup'ed
> names and an of_node_get'ed target and are flagged "owned" so
> of_alias_destroy() knows what to kfree(); boot entries live in
> memblock and are only unlinked. Removal matches entries regardless of
> ownership so updating a boot-time alias does not leave duplicates
> behind, which was Grant's main concern on the old series [2].
>
> A new aliases_mutex protects the list. of_mutex does not work here:
> the notifier runs under it on the overlay path but outside of it on
> the of_add_property() path.

Thanks for your patch!

> The rework also fixes an out-of-bounds read in the old stem parser,
> which tested isdigit(*(end - 1)) before checking end > start and so
> read one byte before the property name when the name was empty or all
> digits. Such names are skipped now instead of getting an empty stem.

I think this part should be a separate patch.

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

> @@ -1960,42 +2124,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>         if (!of_aliases)
>                 return;
>
> -       for_each_property_of_node(of_aliases, pp) {
> -               const char *start = pp->name;
> -               const char *end = start + strlen(start);

[...]

> -               /* walk the alias backwards to extract the id and work out
> -                * the 'stem' string */
> -               while (isdigit(*(end-1)) && end > start)
> -                       end--;
> -               len = end - start;
> -


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
