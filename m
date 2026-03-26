Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88258337689
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533942; cv=none; b=cSciNg/qAF49UztBb1OWV4xHavjTJFFKoRyxGbpJK9dBjvnpUw2rk0DV5QWOpQXdw+6nrGrDemavXnGZLqBdnbD1nJZ6mY+X0Nk7mReX+RVX6E0CLRCI0IsESOCGQPo1AtRE4maIg21xJMNey/0owN3rV6r2+Y2ce1V48BWzysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533942; c=relaxed/simple;
	bh=LrtNtHSmO4hzVyw5+PEvmHrePHuoHtR1t9d/gmGKyFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBU/V4PpbabMUskwUWPpZGcjkZgHHK0zF1XA8MvQow/4dW5Empd3Q3aqyQArtjzvkxFEwtT8dushcF5owR0uL35NuNKEXxSDN5ZPlFj9WaBQSx/qsYjwgNUSBFRaRshlZEOVy5tvr2qwwTCijpxGs3MhtD4nqXDgj0DzGiP3eJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e9810221cso257288241.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533938; x=1775138738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GU4kGMAIQG/ljX6qMbUY/Mk2ED5n18dQJ01whvarEI=;
        b=KEvizrAVeO6EqCNVWkfHhchxD1ekIuEJBtyjPXvtZHU0VYwyH6TU7lC7yY2aH2/Poe
         DnBKvRS7hTpi5xSvuCcg7FA5F8G8S2WX9JoureoOS7gv9ex9fV6otzg0BlLnuXC2WhZN
         VW4XQMnhx2Zmkqbifhq2RoiHFcNOT5r/UfMtsXWlFVHoiCUJevmXQrRWD16nLsk8kYSj
         /3C7S2n9MxwoCjTBYP5WRkKVo1YvfN0Rw3r6MLPxBttDDdivCw2kxeEicvDl8cOYcDHZ
         8516Quz5rDnrg6WP4vxHyAwydd5iWk7XG0QLU17oR9Lq3e8OL680/aDMWR48RkktCsa8
         kujA==
X-Forwarded-Encrypted: i=1; AJvYcCX9nNp+H9nUhAFNyNPg2Q8syw0cKnWKIRU4OIj4OcLC+/T9koqFPjAOioEiFH76S98tNJef+7KvITsq@vger.kernel.org
X-Gm-Message-State: AOJu0YwEk6IyW53kL7RZ3Zh7rBSVMIXvc36yhE9ccJhNQjZNp/WtLEOu
	zxBg7qWPpjHxZDql0TRAolV4luoXg3nEYKJ+bI6NS+Ec9ya4UEEXlGQ3s8TT6lIBCZQ=
X-Gm-Gg: ATEYQzybe0k2bn47qyPsJ1f0Pm0FYV9NGaloBoeMNIK848ptEEYC/WtV/wJ5fpKG6fM
	jEhkOA4maVKEKVvTtPrF/2pC+HIYR3/OaaJdMDwesD2bJNFUcSyQg+2Ob1R8DcRfNLlLr+M3U8T
	AsH65ySwPPBfLuqbAGBym+JWyWz2KzYDTVXpb4Fy1P+w694b9y6jlJ/bguz4wCeVhWOMw4Tmcuj
	vsULfTjOAzDYtvnz184HI8HJ24saq8PL3MYPVFMDoZYUSAc4wHy3xf4v1k1KmSBrZ++yauOlSDT
	6tg1KGW0G6Rl3evEuG8pcIVNnsKyfu+6JLcSUBpw33guYkVKhRE+ZPM044tPcFAkGKBemHvfjm+
	ilx1CwOOP01sSkY+cHGZhEf3UjOtDZp7osZmCgMEU0lPCeiivRqAhJyIrngDtwHqEhzvKLDwBEi
	7AbsWDqaH7PtMhjvPI27DjDi8hvyqfzkddRhcqmpEHlltwgwz+zLKVOJxzIqXDNN2M
X-Received: by 2002:a05:6102:2907:b0:5f5:3244:20f with SMTP id ada2fe7eead31-6038721eeb4mr3132360137.21.1774533937519;
        Thu, 26 Mar 2026 07:05:37 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm3191767137.5.2026.03.26.07.05.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:05:35 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5637886c92aso521587e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm40j01PhxiZZ5x6dCMauHbO4UnvF23jJDGtRx3INX05fRRGS37D5uuP8be+usLcdUujKCxYAUhLDm@vger.kernel.org
X-Received: by 2002:a05:6122:2986:b0:566:341b:4dde with SMTP id
 71dfb90a1353d-56d21d0c273mr3553159e0c.0.1774533935389; Thu, 26 Mar 2026
 07:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:05:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRn5v9c6=ge9vj_mFE7GQEX2GXbvEZxqeEvMtuXzM92Q@mail.gmail.com>
X-Gm-Features: AQROBzCl45J1B9gqwnevHhO41JWo1n_Q5hR4AHiytVtLIAcalXI_rirZOBLvto0
Message-ID: <CAMuHMdXRn5v9c6=ge9vj_mFE7GQEX2GXbvEZxqeEvMtuXzM92Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document the R9A08G046 support
To: Biju <biju.das.au@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 08:17, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the Renesas RZ/G3L (R9A08G046) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G057).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
