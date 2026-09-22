Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE355C1D5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091442; cv=none; b=cvL7izknu6ESLtn4mL01r36VkfpSDAj1XkAbR+/vmrFXCiV76XGR707jPKma553QBzu5LfFYDjMrQWBvbwECjNIrfYemo8IcyzMRmklPAdv93wj+E9+5Hn266egoZqzi3FpDfYX9lrJuv/NN9XMvPSRprTXl5ZkPOuQ6hV3+yRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091442; c=relaxed/simple;
	bh=tAyiwXOmkifke3Bc+NxLOBMDbHXY6l1OlgnArNcsfhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NENKYdeYVZb+r0bbClg8C92VZeLzCidPnGV86BO+Qqg50/i1foJXsjoP2GhaHYgzJVGP94CQqBWVZN1HC1iGIKk4kjwm1E20vZ9ezpjNf03Qb90t1pOuXhs4fWBRFLAwUZjN3wmFBEkKV5sdAanOF6rKgRMpELYp+yjllbpwz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-8138dddb94bso68936a34.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091439; x=1790696239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibhQgWiuapM4MkmPRwugdMJ27jgZzllZGbWfakUivA=;
        b=rSRy81sV5YKwwQVhYI/tGG9LJ8QjLz/D+HfFIn0jdpPnakbB9ZGnomGYEMvNof92Q4
         O8Bv686ucXzDcbYF/NbKd6m1ujPbnZj2xaan2eaZLs7kV7pXi7WFry0bwvIW90vsbZdA
         f+J6d3A+hcYsOMUqNjzbN/pizL2rC2DS7B9ZKkyReft1tt5MaCUMok/RHYgVOKCXapsJ
         E2Hq/HJGMyI94QRg9Nfm0dnSj5VAT1ChE+ktMAcCxDvrmupBzSFPjelLhmPj3RczbIpU
         tCnB8eRSe3UmqI2zkaH+VAKwXgNZQL40UXrBIk/k6IN8mRYpL7pUe7JHOqsdKn2xHKh2
         LVzg==
X-Forwarded-Encrypted: i=1; AKwUvBw7YLNpclQdhd34IVG/ZsHawHgvbcJKp+6kuSEkbB+Suri0ZHtIvXghAqVSZtkObSCqbHhNhWs+1HFV@vger.kernel.org
X-Gm-Message-State: AFuF++k2X+g7OqIwlXhKvjAbunRYfRyCr9L+SQGmFMa2Znm6ohha11NP
	1iuydtzJykmLtZWzv4HZU6LHcW9bvZcw9NmmTUVapkSooEJkVpxoBEiiLJdw//o0
X-Gm-Gg: AYBFou3n/GtyqaAnv8POifAHGemBSzbAwalmYKURiGS4846hiNKbOsM95a9KrFWAkL6
	cQ9QEt/kwEw/KRN24KJRHbwT5mE/TcYacaroHh9JlhmI8yEkPJzm3q8SHg3s9gOlNUnm1NIn2pM
	aitbU3ZkDxnGMH9DpYQ8uzUoaHSBrJ6RdNiACY2umbgKi1xnLIUpF9nKSqKeF0ick48deMB41jO
	jUeJ4PTq4xR08NGcnJpisxdQ6QIBO0sibHaSgFVWo+rk/D1CmuR5oqZvqJhyPxVNwNWZrs1W//t
	q6ufzyfs30mMx0q6txxBWdF7AtdVi4zlO5i6LAYQmJ2D89hwKkqmAIN6vJPfkw38x6ddSML80XE
	h64CfwVf+IMS7UcAyiQB3tySSGmUkgKyfwYHuXj4zu3sIy2rSOmAzBqAdAkQd1bs4fP5V5YrycV
	zkYlBXirMTC05sA/px3Xv1DVx2sZa4H3N2a8Uni4SfLTuGWKtdVEnbsJAxfNcuCXA4/aUoE8MVk
	PfwHC4hQ3ywzmUu/taGzMDKaKgnh7tiueNeYw==
X-Received: by 2002:a05:6830:4708:b0:80c:d30f:97c with SMTP id 46e09a7af769-80de30e222emr14413141a34.29.1790091439361;
        Tue, 22 Sep 2026 08:37:19 -0700 (PDT)
Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com. [74.125.231.205])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e0a13a73sm2441278a34.0.2026.09.22.08.37.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:37:19 -0700 (PDT)
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c2c368cb3bso12476b6e.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysInCIesRY5HYp8jF6yD4CdydN/iF1aCtL1aTtWd2ss1dBYV2LkEftUG5F8+MxhSaXZyRd18dRYLw9@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5c9b592206emr9513571e0c.7.1790091082417; Tue, 22 Sep 2026
 08:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
X-Gm-Features: AclHuK8eE1mJ10XIW9ciQ8bZMT3j6oSiCVVbmbWm-UvOOnb6nS6TVY6Jb0Jgh4g
Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 13:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the ADC
> device nodes, as these interrupts are not wired to the GIC according to
> the hardware manual Rev.1.30.
>
> Fixes: a82a42963c89 ("arm64: dts: renesas: r9a09g077: Add ADCs support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
