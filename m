Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BE3A5E71
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575022; cv=none; b=BS7LOogwHb2S0Y4BdTxH145K/EufnuVOcZsUdjW/CMBgrZA/ycZvs0VE5uC8g1ZcqR4tuUIx+zJ5qOlSHb75VLQLRjlp0FZ55YvFNEm0nmTxt2B4h7REo45icayQojqDRRieyJtvQXHUfShXZv3DGXXm20fHtKrhE8cEFmA5K34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575022; c=relaxed/simple;
	bh=W7pkTBC2mguqsY9HevqNVRnUGKxiCNpyWrU5jMOs1ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pe+9vvs+z5QUe3EaiXLPfmSKaRgSYU8WSg4oM7qA9xqU1ZUnzGTtc66KbDBrUbxtnCGvifOdpcOIyF+71l2yWD2m+V2BBTZGUQpxvN6gh0CdrhaGYy0m6zTKhKwG+ScJXtGxelPAZO01gRzBY9DBIuQvP0fjxV7Okr4n5lkfqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5a46be4862fso146870e0c.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575020; x=1781179820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24Bm5+9RznVEO/BZ178uK6yDmvRwITtp/jjjxZ2arTI=;
        b=IkID5A99Zyp9f+5z9PLA6PramU9/KPlA8arvsMq9fKztyOzdqD5ifvchRy4pEEeJ8n
         TnMxAa8RolUfVByRCOO5LPe00CkSG6EJ1U5XpSoHt/CY7e9VD4Kpzc1pj+pRfrzBRWJU
         4JpNF9Nl72bqpQ870zX5V6HcMXh3HwTyHXmSXuNTX3v40vNQs3qvn1uix9M8HQL4WEKR
         kIIGsCokiFVqnvoAWowysDbSjp3/0SYt+03zdA085y2wu5C1NOVw8c3JwzE9yRfvYh2A
         6n1uQib1u/Vj1TpQh67pTZzvUK+fy4jJSDhivtkAfgqlNHzGAZymDQrrQ0hvIJfnfZ0o
         3PYg==
X-Forwarded-Encrypted: i=1; AFNElJ/iGd5eZOhJ78k5ePBVyzk8KDwrtH40DHkBIcQ+nnQHMkN0RKOlfFyLwXZhRVw+67xApau0PqnQh74C@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnVWyas89A4IJyaDaKqC6C2MCuvddDFJ8LfdSux/bGI4ozeI3
	68TOxapetAUmXmDmBGFEw+CYJ8UxnhUo1/S6i+Daw3x3sFOd2OxlBJjr/LcfflPBY/w=
X-Gm-Gg: Acq92OEOo0Q5uldgDAYKn5JTXIqksoPMTafKX+T9pOcdxraSQueRwSYojkJO//V0fv7
	oG/B/trDNi0romxEnJTGKp6/J/yqkvk8XQSUXgxNJgfCBMD8LKguFJnIdd8m05kqMkCgwW23s+x
	NudnMcMoCklpln6lLmM/577Rfpi+2AlwyQeMHEmLF70U/KNG5qtGgP/OuNMBzIV3EOyhnnaAneD
	DQbDIbTrE0abNb1vVWYAP7cPRYqjfgeLgGyqJo55UsH85GN4uyYFA91+cQSuDgY0P4MEI638/8h
	2AM//daVNPCzKKBa78r+cd7bWyJpOAdgwURqVVJzdIh3zXy0tiUVRXWrZ1uuGrJArnwFdtOjlyK
	19jCPX6aqct2w+0/AF42ZTVYv00u6brp16btMWuBiBlCDlN4KyWrY8RMzCf3N1DM9Qx7GlaaGYv
	VLpBs8zSVqjHcarc3ZkAryiz2JyLM6AXJ88Vg0lx6ZAUa5EfJUoY3WV4H5wrGDBJLUd3qHvotM+
	Ys=
X-Received: by 2002:a05:6122:e465:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5a6de2974bemr4792053e0c.0.1780575020213;
        Thu, 04 Jun 2026 05:10:20 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6413983sm4814620e0c.1.2026.06.04.05.10.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:10:19 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59c627b53a0so151217e0c.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:10:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NbovPXxgprkiNOLBv5IS88aKuFCm7PsKZbJNzBkrRm88FdEJgJAZ+7opShMWpQxxmdNEAjeRddgSL@vger.kernel.org
X-Received: by 2002:a05:6122:3124:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-5a6ea26b55emr4329928e0c.14.1780575019519; Thu, 04 Jun 2026
 05:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:10:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
X-Gm-Features: AVVi8CezB6KDo6j8ugocyAfAPtEdt_L0Vgg5u_qdNGl3T-N1qL3CcUP4MWGEjnI
Message-ID: <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 3 Jun 2026 at 22:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Express the dvc/src/ssiu dma-names as an items list rather than an
> allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
> the ports container to reference graph.yaml's ports definition instead
> of port-base (a ports container is not itself a port), keeping
> port-base on the port@N children, and constrain each playback/capture
> phandle-array entry to a single phandle.
>
> While at it, drop the unused top-level #address-cells/#size-cells since
> no child node uses a unit address and the ports node provides its own,
> require interrupts/dmas/dma-names on the src sub-nodes to match the
> ssi/ssiu sub-nodes and the driver, pin clocks and resets to their fixed
> counts (47 and 14) to match the clock-names/reset-names lists, and put
> compatible and reg first in the example.
>
> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

> @@ -320,6 +333,8 @@ examples:
>              <0x13c31000 0x1f000>,
>              <0x13c50000 0x10000>;
>        reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +      #sound-dai-cells = <1>;
> +      #clock-cells = <0>;
>        clocks = <&cpg 245>,
>                 <&cpg 385>, <&cpg 386>,
>                 <&cpg 387>, <&cpg 388>,

What happened to the first clock cells (CPG_MOD)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
