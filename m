Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642163D9557
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003860; cv=none; b=Zarv6hmMN01D/vUOC+vszKV0FSudNJT8hbXqe7FjU6YlTg+aeQgb0eq55VKuT2BGGcGRUIgPj9Szg/Ak0ksBZGiy6YDutizdr+g4rd5A857knW3oMRw2kpNTgXAmMStETyv83AHg3pvJ9KUkRo9hx0ZBZk5nIQ5pqUfzGcydb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003860; c=relaxed/simple;
	bh=UEWrfd+G+mMHCVBb1QsuXAJr91HYpvwPtjefuiOlkfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfMbmY1fWqakFEXvpzN++M4jDZgK1Rlfha62TRIP2qBcFaAsKVbzFfcJZKMYvP0lK2m4ipkyrkOTt9aYOzfQBBdAMrbINy1kxEyK2tev93V2gkdbLj1HqwqS00eI4ZqIVy1BiBT+2DZkwZ6GzgCILiTotHr6ZBYB24zi/jdLAvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-979dc8b391eso449884241.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003858; x=1786608658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AE6czKCPLTFc2zmYX67374xheDWCcRNEs9CRylGTIYw=;
        b=U7jqATKjw3Qfyuv3+XKhJzmI5ETm6V76mDFq0I8ZM4zA6e6n56oBs/cEGl7wiyEMWT
         rOW8k/LD6DdBtlrfDQFbgvMu8UD4fW347T8YuZ9/972sxlzSFeH9V6wU+WQUtHlfzfHN
         BzgwOt9oEdVUlAoVa0nqLcQl0LKmvQOzqaXNEMrVHszpKv//II+AgwIt/35z9GqsvkmO
         FLPCfSihl9NPkg8jhQ8vKvvU3inTJFv6l+NXfgbQk6QBsdxFsCYPdcoc3ZzGQgahbbph
         PJ/Yi+GGA576qhIOgeun1Nnp10la9STRB2i06utliRhDeuhvZ6/ZQ3XMqfFKa7/E8621
         cbsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0mUp9wdpQAtcJ1NEpT3TxEgGWvv/6sT3Bf0VjfL6zhCxpFNmP6YT2moMrnpkTz81vWBtDB8DNxJbq@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSEugqKcOXubnoJ7Mn6bpZ4HJwW8/3OQA1xbdEsj3fUT+o13U
	G717KUPGFt/pUl+1I5Lra1sdXu2zGAyUPMOgEApQmp2Vype/uFTDRr8Au3QYcn7v
X-Gm-Gg: AR+sD120w9hqzsxzR+qUgiLSILCfIFRkWcksXIY7QzQckjJ6p+oW4tJAFmbIudd6dDE
	9O5GaMbt8scYhmbvX/2xGDiYasHa4XIoAW+7OLRefZ1hahtVu2FHZLcWBpvu41EN3lR2e735hyR
	tRDc/Rs5WapcGiKKZ8tzbGdZ6p2Z9zsngEhQNRizs288/aogEY/vrq5pVvZjV3t740ZDSeJE2bV
	S5xqOgC4gjy9GdaZJTHaMKZXv3O70tgq4/LVsww9PHqM0tgPbOpL6LhbUV9n9IkogcZmtY+G9Qw
	KAoviqhBUR/8hBdq40BFfilawmsRIGc7xYtHZhDuQDBQD7hjn0OcuGfmaJsxVSEqDkdnuSh3Q/L
	DuB1tkkF17s+KSFLj5yFHNdPeQ6C7bTwWDyGHtrI7KWDG0u2faYSLxUiAdP5hwU6ZoJ56hOpUhx
	r+OXXGtx5H+Xffd+zLqfAmSjuIILumdJuYQjRoZXNbhZjtyF+4/5zBLYK7/UluP8U7J14AhG9fL
	CgQ/s6MbFfYUOURmBjzaXKgc2yH3A==
X-Received: by 2002:a05:6102:5e8a:b0:738:531e:a43e with SMTP id ada2fe7eead31-760e75d83ddmr3756852137.7.1786003858161;
        Thu, 06 Aug 2026 01:10:58 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c7d0a96sm2911279241.4.2026.08.06.01.10.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 01:10:57 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c3a1d005c5so1073539e0c.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RowVDiduZkkKoKvF8kiTORIOWszTCPr0WWcaXl//OKKMKZY4gnxUFIcSx8cFxlHWcr1YKuozwoado55@vger.kernel.org
X-Received: by 2002:a05:6102:4b08:b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-760e6acee3emr4218561137.4.1786003856796; Thu, 06 Aug 2026
 01:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai> <20260805-nh-of-alias-overlay-v6-1-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-1-74f21d440819@nexthop.ai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 10:10:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkF6TCcxpPQnhFT9697eKA_jGRDSOATst0GGVajnzxQw@mail.gmail.com>
X-Gm-Features: AUfX_my-HwUHD_sy425kXlXTkgUD0T4wDRnCNc1IBpqcByHHMIQEcGCMYh_XIkA
Message-ID: <CAMuHMdVkF6TCcxpPQnhFT9697eKA_jGRDSOATst0GGVajnzxQw@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] of: fix out-of-bounds read in of_alias_scan()
 stem parser
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Shawn Guo <shawn.guo@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Aug 2026 at 22:31, Abdurrahman Hussain <abdurrahman@nexthop.ai> wrote:
> The stem parser tests isdigit(*(end - 1)) before checking end > start
> and so reads one byte before the property name when the name is empty
> or all digits. Check the bound first.
>
> Fixes: 611cad720148 ("dt: add of_alias_scan and of_alias_get_id")
> Cc: stable@vger.kernel.org
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
