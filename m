Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC340F73B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574756; cv=none; b=pqr7cwWmzyZajoql5c/TqHJSyiCA0+cED4mkRossvs7/fmY5j2/2WyZl2GzbBuNe66vgVHlxVe41sWjh4ulFR9I0NXvZA5JV9AZtcqPUhfP4xsxI9Ilkp1eBzk2dPyEdqKZaeqrFqpjreOXbk6fem00XNFxEtyIS1F9Gyg97Sbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574756; c=relaxed/simple;
	bh=DEZT2iTUyT+wYINbjMVwPLrK23Cyo32nBz5M20vfPFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFWKyWd37vcJ2nQAH9lfYC0RCKZNbLmfRO9JsfEi8GjMsl5zbmt7D2guo52nnAyBWMe4icmjbejqjCq7qSkORXMvydruLyQJnA0y9WWtBsEJ2XPkJfL91uZRMLMOCUIQnIuBCJU9POVH7pVlryRnVOBg/YVUmrsMTwRM2hgfrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso1725509e0c.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574754; x=1788179554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zS58fBhFuvoJHzKpw8/MR9X6Crj2kpawACKthu0lOKM=;
        b=nbAzS/l3CApEEG/GTx5LVvanBL7FimFnwlxTIpqdz9xpUxJwN3c9vm1bPTwulqol+3
         kdGKCBbSVsqZ9RIHQkEL1TppMgnrwXzMAuElYrZgMzGDxFSkoI/0wbhiXNMWm9Cah1GE
         XjMZvLQftx603CpivuNS0VWfJV13DxpxJcHKO7vVN4uiIpsVyutcRLpHVb85rPSzCWyw
         M4hjnqtfefDtwlqshYz+1UFBubCH9u4Psbp9or3PCx5mfvEh/3G8dCh+sEB68F99E5ME
         u/Sx4PECvWI1qEBk/gQ6f5NSb8vM8ChrANg1JWd5sn9/AijF0HJ5PXgMZK0yBD+KKHCh
         7I5A==
X-Forwarded-Encrypted: i=1; AHgh+RovaTOpI+p519z2oCmdMD8PiZOz07uO0OAPhDyqfpzqXhCOlf3LBsVKnILcWIB+mkJnvDpx+VjUTtv+@vger.kernel.org
X-Gm-Message-State: AFuF++mIXyFSsPNCVct/NQhrBU93XYy7MnDUodIFEbHFtE0iXdDM3JKV
	qAj/oLskyKKP8BsMBCB3YCyailq7Sf+gvHd15aMY1/kHE+754kh96QNg04gRTKzZ
X-Gm-Gg: AR+sD117BBRwHpHqvJ+MwhyeQYhM50eAz1tE82Bc/QtknxbRZ/VElkNQTZk4HlU7FQx
	kEwCqNvISxRu6MVoPrKtPErmaJrd/qQ1kYTdxNK6l3ubC7IocWWEFIY9qzFnwrQFWCRjBdCP7i5
	9lvLIZ0yw8Wiv8beV6bU7aejYi/NHr3Drk6n1Q0c8zhZluaZqAqe9JAgHTX8wUOGn1Get+Ht2q6
	PZSo4pC24P8zKQtpIg4SoPZeUqckxMxAwn8B6TVxYVTR/g2e0/YK+uDk2PWxRVg31b9BJVzSXA5
	UMXBnQeedhBZqYrIYmj9V/RCj+SJDp7Pp2y6LGL7n0YT0WdFcreb0AZHJBxdPjWKsRlIN9Orn/7
	cUZipiEj7umyRoGFv0qR2QsRN8HQhmsKR2egam88BYJS/cjjMz0uVFsCzOPqmobTlM7nCs/KA7T
	1b8h8FiQ+WRVmey0DUQne2yXzawLV7q2m24yKl456ql0IE4TYO9EHU9C8IDIfPebDkuIhAS2vj2
	ZxA7vtwlp3eQZystKwnqjphfw==
X-Received: by 2002:a05:6122:6c0b:b0:5c2:a30a:1a08 with SMTP id 71dfb90a1353d-5c5ffcadc64mr6439142e0c.2.1787574753951;
        Mon, 24 Aug 2026 05:32:33 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623cf4026sm3372167e0c.3.2026.08.24.05.32.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:32:32 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7377dde7bc6so3204073137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrf8w4pGEaINp9vbP07K1OrVL87WnywFThTApj72HDqXi5E9awTzvic1LiObEGuA2qJxv80ssCGym9g@vger.kernel.org
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id
 ada2fe7eead31-778f2cd6323mr5912697137.13.1787574751661; Mon, 24 Aug 2026
 05:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aowOJx0TMIZMyFUa@ninjato>
In-Reply-To: <aowOJx0TMIZMyFUa@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:32:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUULBe5y9tk7qj8PogPZ2+o8c8B3v1LD1+35ncV-RUPBA@mail.gmail.com>
X-Gm-Features: AcwNN1XvQ6CGj1qZ042NYJollJLUDRjaipOrbn0snBAOqHjlrtNJhLJhV7ICnUI
Message-ID: <CAMuHMdUULBe5y9tk7qj8PogPZ2+o8c8B3v1LD1+35ncV-RUPBA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 11:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > +             rtc0 = &rtc0;
>
> Maybe 'rtc' instead of 'rtc0' throughout the patchset?
>
> @Geert: do we have a rule for this? There is also only 'gic' instead of
> 'gic0'?

There is only one GIC to rul'em all, but there can be multiple RTCs
in a system.

> What is this alias for? I don't think this is HW description?

I understand rtc0 is the main RTC.

drivers/rtc/class.c:            of_id = of_alias_get_id(dev->of_node, "rtc");
drivers/rtc/class.c:            of_id =
of_alias_get_id(dev->parent->of_node, "rtc");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
