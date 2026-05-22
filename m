Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765937647E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462614; cv=none; b=buQ24UG2dfyVg/vMtRUoztMBmJaUtTqHYt8eTpXODtTYzETUYaDiiev/St6DhZ/dHsx+5Ti3TmjefhVfRnlxJd3yLCYTKAHfJM737ESKoNghcA9L7Q20taed7HQz/ZjADPWLKF6envci5Ip3beHLoiMC+mOIEV93hhaf4xMEIRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462614; c=relaxed/simple;
	bh=68sbZorF7ZUm0ExdOttCQ5BW8eptQUms6MfXd/3EpZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cArjrCtfY9ajmsIJyYJWW7yDTCYDrkVPo+1kxJPe/HoKhoxvGYsiatiqV1LoZ7LyTacZ+CfSdVsgYR/gjtgdVZdLodkGRbQBWFpTaul/O4WbmArEgSarRJOsld5d1cAv63df9d3jyw9GWWwfCOZEFJz/lVFdKsdHNwylsBV5RAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so1283782566b.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779462611; x=1780067411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VobxwKyXwVf7/v6vELiTgjzPLWWcLObJXZXp+P+9MFU=;
        b=QDL53P7lVzfMWztnwAp1uxFzfkoOiMNbso0OOILWPGdvTP53jlYyACXavu5q0xC1N/
         I77hP6CfpETeyDvV1wKYDSl/KCQj5iYNL8pHSpnSlv4HC04rfSN/WLJM0VOi3MBSRLlz
         DTaw1ZmPGGRp5TKc1nAHhrr+95AEwnq8VySL0lYcyPD1jYyVURLbXDrVqJouaDbaYhjl
         z/0SswrjYrzJzZgdClm+Ou9tKgjd1Fo6pG34ai82IVWHzfklcZp+1vrKeMHZHdrmSWIm
         bdwBCChjnK4M85fcBhLFnezkrAvjRZzN/0TDXulOX55BG2zbLFhKiJjryUK7+1NiT1q/
         AZvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KdiEUxZqFc6dorakTL7IuBoGnZbJD7V+YxKXnMBvV3ArHVa93vuQJlSn41MwNiMxlPjUw/rzjDaqC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyqx3dhf1vv3E7s8aE9fgs4b6Ud4w+vpssiPr4bA/7Kj6Cd01a
	z9iing8qv/1vjt9n9cgdqmnITEI69HeqUusoB4cABlz45MjzyzqynB9yHjHFCL9wDac=
X-Gm-Gg: Acq92OFUwAergoThcL/dX0fnaN+vGyUOGFxIW7pwQS4BtQaBfxwKEhHKjS45aUQEbMb
	mxNLyJ82/g++B58mXASw8FxTdFL5j6x6k4skz+UfY4dSRTD0ViRa+1Eg6F1COXcITVicEshqRbA
	uBss+4LqiUyYY03fXnwLaa1OLmZbyVXTd2/vwJgKrq9xyjGh8nk1G0WZksBf/2frX1aZjjoGDkg
	HEpBwi6BXDfQvYMIIXfIZty59bjbuhZa5gU3oMZ6e+iMiMdvXb87Qpan6IheWju0I1/OvwUkFYZ
	ziJaI7ECl5fLq3auvC1EeKmK+mSP01y3NhfoH3tIUhAGWQU/Tk38fAPqUKsuCdL7HkMxOBb7NsN
	pBwF6Xscxuegii23rtxP9qRvj44pXwxIe2mTO8c1hlpEzqRRfa1Bg3kIOynFyk5IxJD0Zks9dbf
	WUFXz5pkws5fyOsrfGaZo0UH1f6Bq0uJFtlxer9VosSLGkXFprfyUTfI4WlHjF
X-Received: by 2002:a17:906:4582:b0:bd5:1576:dc7d with SMTP id a640c23a62f3a-bdd272cf2c6mr197666166b.36.1779462611196;
        Fri, 22 May 2026 08:10:11 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264e419sm65770866b.12.2026.05.22.08.10.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:10:10 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so469413a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+qYINohNJBGryQtoNviID0vozrkqYpIogduUp+0uEl+Lo1uypqXMIFpXFF1Tnth1o6Tj0oUp2xi4Z@vger.kernel.org
X-Received: by 2002:a05:6402:3907:b0:687:f18:c37f with SMTP id
 4fb4d7f45d1cf-6889cc6c63emr2128825a12.22.1779462609111; Fri, 22 May 2026
 08:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:09:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvRbDVJMoiS496-TS=COXQFQfdL2WYFgG5qyVCbbJmbQ@mail.gmail.com>
X-Gm-Features: AVHnY4KTJnZLA_ckNgwFXfBH1CtHwATlicdn_pWJ3THjZFjqa5CIIf_0krKqFOI
Message-ID: <CAMuHMdWvRbDVJMoiS496-TS=COXQFQfdL2WYFgG5qyVCbbJmbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 May 2026 at 12:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the PCIE1 slot available on the RZ/V2N EVK.
>
> Note, the PCIE_REFCLK comes from 5L35023B versa clock generator, once the
> support for this clock generator is added, the fixed clock node can be
> removed and can be replaced with a reference to the clock generator.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
