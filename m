Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE34A49AC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440489; cv=none; b=WgHmFazkLWIIUcv78LQFuc7I/lQGCWpK8P7VI3oq9jBOIAZGv1GNlSa87uE0ZRe5/01SxOixF+oAe63wi64V9UxydqNKqFm5d0jawoNXdnGDfI6dpPCYU6xC9sdi+oj+rl9Wis1bnid4+csu29nUlcZfohN9Q3C4W5jD3r0KYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440489; c=relaxed/simple;
	bh=QdSZDC6nbucSRvb+H51c3hpweaq1ScB4H0zhCJ0m32U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zh++qnch1NIP83DmdjIl5/AMNzmkyJRi9q51vTaTnkshit9bsJ6kJe50jABc+eb1CzzM7fir9QcIAnK8gOfWSooqsb2DpcfYcTCHIndvT0EO8DuIsRVDhrIA1k6FHTkIXvLEle1uJ6KHs0FBVE+MzuxFY1ACY2j85LbpRNNiZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2530cabcf4so383097766b.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440482; x=1789045282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DtmhsVTou9YrVYaMYKkGwW6MPqYIC4z5a7l3vHTtMQg=;
        b=UqI0aKPteutQHIHfJiPDjuMpipr4gxnBt+R/NEaKnC58HR2JQCFl2DpYKBTRUChvxj
         xDHa8pt5lxZcjuyltimBC96fn+RD6c4MZx1AHq+2Ek6LF7h5lRwvlLxHJDt2qZHscBel
         Z7YjmucRvTVe1lGoIZIxHUyr7EcWKEpWly3l+zLM7fA+DkVwsdANvNlWykefD1/NeRV9
         34DQ/hwqEPWgtyj2BRFZdMrhFAx0Sx+N5ATJMEg61k//UrLYDaIjYbfhETXyU/gL/x8y
         YoAbPI/pgskbzktF7KRvFtGRm+F2KTMshGoOnZdBY/meQfW5fFn0MM74P+8iWKmKYJD9
         jJ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYZ0IsQQivEKlkZbq+WJzpaBaROZWop9przERhHVEz+e5tYBID4ScrkAVPyoAkuZHsHwHQBCSKxZh0@vger.kernel.org
X-Gm-Message-State: AFuF++nydlD3c8BeuGE9tvZkEndmA7ibQuFq9c6KSr4+6Vs6C7b/N/bd
	RSOXy5+9ZrjEl+dBZOYUywt9qBzFYKDLzx63zumoqM+9LkNuBqz12TwJwy10R/v3kQ0=
X-Gm-Gg: AYBFou1aRWD8CkyIm2PE8X+sXiwy+K0vWlaEL7jVtiPLmJGXHGGeod50LOrLt1JF+x4
	boYrWJdGzcJLJQdIPVHFVFicNCMY5bqGyBLygqOGm6D5u67YU1L8AP3rO2eqIQO/ehuQ/3wrZgD
	DAZb6BVypx1m/4n+tAVHk8QS/GxRLh9QqG/tWXXZobU14mpveOl5WzazM5hXAqORwLO0+5QZh0C
	99MeqlCl+JGOsqwwnul0u/eeVs87W0gXvIqjMITL//NxLW/qqdik8HDJEfvmqfoG6f5vYe3Qbzs
	PBPb+z3rdMfE35H/hhHTW1UotWMvw/hlZbQoaQfUvcnt3/U5aeFCnMKsxNvq1IvAfJxvFF1yD7+
	IhLMKX7PuR7EUidNelYSQWr/4cvDRFdgoSggzN3XbNagX1Q2hrhVC87QpxHAoy9EhPeVsR3A4dh
	3i5Yi/78wdRYq8OTW/VR5SE5UAEd+IWK+ZaB+F+Kk6/YrBeXOk/6KIjjIU7OFpUIDsE7MuJpup0
	z6CdvarEvD7n8pJLGOQwxZspqmYSTyb6qme
X-Received: by 2002:a17:906:518a:10b0:c25:ec7a:a488 with SMTP id a640c23a62f3a-c25f83b8d8bmr48271566b.1.1788440480460;
        Thu, 03 Sep 2026 06:01:20 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a13ccsm95983866b.30.2026.09.03.06.01.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:01:18 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so3684713a12.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtTKDssEPHlaWG6DCPgFq/38q03h8JzVu0D7mqbtEPDfN7yRPmey0pe/MRQwpAHkZjiJKkH52MjxT3@vger.kernel.org
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf4mr8204915a12.22.1788440476485; Thu, 03 Sep 2026
 06:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:01:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
X-Gm-Features: AcwNN1XdH538M7S69IlyE-ADj4jym5MH5kGATrABVVcF65dsXW8RQtGhu-Ybn34
Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a08g046: Add PCIe support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Populate the previously placeholder PCIe node for the RZ/G3L
> (R9A08G046) SoC with interrupts, clocks, resets, interrupt-map, and
> the PCIe root port's vendor/device ID, and enable it on the RZ/G3L
> SMARC board with the required pin control, CLKREQ# GPIO hog, and
> 100 MHz reference clock.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
