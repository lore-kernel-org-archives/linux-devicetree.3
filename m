Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408013DB633
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002755; cv=none; b=chcMnpuS5J8O9AyLVnpa1FnfPI7Z8QgjPnw8mCBiyxEL90XVI9qHIRZlGysyaw4pRIisRV7bujIXA9AewkdFqn5Uf3FjxPd/mUaPFLjugDwJnwPc7qosVl05bWFdcfnmrkCBDWrAqO9z98tBhrY/gtwdVnI8HYET/u4zRFjrLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002755; c=relaxed/simple;
	bh=WG7M7t8uq10tRrcWEkMwDHyBDYPKNUdhhypPEMUioXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD47if/tK3L8rG644I2Pm8JtxGFOqpehhenObKe62SvwcYYjqg3e+o+yrRrxg1v+6yyIFsAG2xhaII30nfsdXF7aX/ruCGsY1IlkiUp+AOI2UvGICzbL/XmeBEw97spUL5YmepArMWtHp6Mb02CNdJiyqnK6Zlj77WIaQoaTOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7380954d1c6so522975137.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002753; x=1786607553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n88N9TJQ8fRDATD3f1A4f8qTuYNPAnmP62DPfn7h0E0=;
        b=no4w/RXHcU/E8FF9pUO9Ih2Jij+TjAXp5p31KgKYZvDG9ziCxpavRyl6BEMgeHmnay
         NRq1rrHEPALT5SvWSR9xl0bY1GIxK+pd5cyMXjbcTcWrczoYC3/L+F3MVnPbMaNc7OIX
         S/Smk4yss2bFWFcVfse1fF30a0GVHK55imnD0GDRb9vD0z7mdiXYTOlzIiinCt/NlrXS
         CLvAJPxBn3mlcfevKRaLCgRvAIUuGxakffH9j2FLeU77LbyXfUXC6eS/jt9SE9yaiQt2
         9xwj5MYzIRRR+65LitID/RSGE4rTbKYNlok23TMjo9gs1+jmWd8ZPw8Z9Gjg1BynHuff
         eEVg==
X-Forwarded-Encrypted: i=1; AHgh+RrU944njEh65YVRAOKl9Z43rHOKksnwxVLYrXMncnvvvjcsOZErvLaOaw076q1QJdroHJBXZBzAVq00@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0kC3zhbIZyodnrjS9WOdyR6QiE1X94xjU9klYEH0lgdpwO1H
	9zuRJgPTp6ic1cSbyZRz3Hxc+fZVTaYk4jx9AiqaW4aqhwTqY1+Av2hYhE6X31t4
X-Gm-Gg: AR+sD11+4z5IvEfjxHtBDmdg+mIn2DwF/tg8Ujr28mT9pZ5YXcErZru6rMtiuy92Dll
	1Ln9g3J7RbKNuhTJSsAt5eUfDq9FiIG8oy5SrNGQsiaDBwlIBsSBw5xrmXUAb2cduyxAsBRUDyL
	2fEwD1w1ivi8TFSZjHQlMQ8KE/ZmexgvGHpnta5hk3iUOE+ACRvpoaJEJS1svNYQFf0OBA/305w
	qMwCFpSxbJWHxMtv33TDig995Mhj5IFNaBC9cHxrS8rZ5mT/vhzxbcFi+vPm3Ca6jSvnb3UCzRQ
	L5qfx0mLPDVcjEBFGiIWUnmyLcYqyeQMknrGDbrBqZ/7JdNCeDE2IdnJxEV25MOfw/B0xC7L87F
	YRgaF9XZ2uqjWmYC1WmVwsdCOQKCrN+kUH7jYRgO08JOqf3MTj7A6rRmFw16sxY6jsJC6s8P1P0
	pUwC6JC44LOg0vw6a0nSd2vDx22YcsGb3Y76qhFFQOr7Blj9ebZ9QOOJl4Kkwx0bWTo+Fm2iS4C
	8xC4YS3pBZKQYAY97rRSEtTQldmMw==
X-Received: by 2002:a05:6102:3c8c:b0:740:2d81:c2a2 with SMTP id ada2fe7eead31-760e95439bdmr3011841137.10.1786002753146;
        Thu, 06 Aug 2026 00:52:33 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760450324d5sm3242201137.3.2026.08.06.00.52.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 00:52:32 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso598829e0c.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:52:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqLHg9hMBWgSlEkJ303eiln1dwz1C/fGzQThCPvbJ5ZdAmP29cEK+bI2bW5NrY6Mar3DgSQPLWL3VWt@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr3062569137.3.1786002751900; Thu, 06 Aug 2026
 00:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai> <20260805-nh-of-alias-overlay-v6-6-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-6-74f21d440819@nexthop.ai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 09:52:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7bk2vMM2DDmfsqfWcY+jOjqyY2Se+XKSXa_BW2JPPHw@mail.gmail.com>
X-Gm-Features: AUfX_my0cyhHKr77GIDyKss0dA1Fh55Wy4MieFIvBzFx2HcgPgpOu-eXIpjsSOk
Message-ID: <CAMuHMdW7bk2vMM2DDmfsqfWcY+jOjqyY2Se+XKSXa_BW2JPPHw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] of/overlay: only treat a positive changeset id
 as registered
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Shawn Guo <shawn.guo@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Aug 2026 at 22:31, Abdurrahman Hussain <abdurrahman@nexthop.ai> wrote:
> of_overlay_fdt_apply() stores the idr_alloc() return value in
> ovcs->id before checking it. On failure the stored id is negative,
> free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
> is called with a negative id and list_del() runs on ovcs->ovcs_list,
> which is not initialized until after the id allocation. An allocation
> failure at that point dereferences NULL.
>
> Make free_overlay_changeset() treat only a strict-positive id as
> registered. The rest of the function already copes with a
> partially-initialized ovcs, so the error path stays a plain
> goto err_free_ovcs.
>
> Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
> Cc: stable@vger.kernel.org
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Assisted-by: Claude:claude-fable-5 [Claude Code]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
