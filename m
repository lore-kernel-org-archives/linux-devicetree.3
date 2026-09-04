Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5FF328B7B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534345; cv=none; b=bF8rkj+MOHrfLcRcmyQO4v+sH2cDk6ClGwj6957TWiKZXgRxBRUpp8QtmC3XDdST36Xcx9KEsYZ8+2RuwSCDHTq0si+N4rDgzAhc7AdTh4xJfsW4HNvZs+jDPUY2Fx++k6/aVBkluCLzP1TpYS+VnAetZL9mL5MWX7KVJB3eTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534345; c=relaxed/simple;
	bh=d1r8YLCgRIdy4KEcRiU5xhMZDzm5Ir3G6LE/EtLImp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dW5GDSOqogwiW2h5CSQl0H4NMNxd02DatXWIeMejB+YnzO3F847TW9N9XbDTbpBBKxZKplOIf6uUMHek8dwWlfTle50NFrh3718iLgPvPAIYg8ODG7mC4p+x68TTxlb/DyWfMvEww77lLL0p3d8V48Rfg5Iz6RDGZXRs3rGrOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-745497ac8fcso318795137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534336; x=1789139136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DBpBma5dCQR0Szv2MO2Socgh1RkSDenfZa0jgmlXBh4=;
        b=DR/GboA90R5/KRNcYb2IPSCMmFIU7XEL75l1JGCQXNgwMG2+Im4h3Xmwx1LU8UwXH+
         AQ3BteyzmA7VNy+nA3B6R/C83KKBzM3wDPZgd02VSZyUeK6CdWWrVWtcotWi5XdN7KoP
         43PVIvVUNd9FljdEs7fp3nYPjX+SFWXeYzBpgDGSqzOKcVFkQQJjia041KqElNqZv3nP
         JoT/5JfdrIE5+9YREtyOgRKXU5AYw4lFQAoChq6NC7PvRwdkdAvthIq52laQEIp+oYBo
         tz1VJ7IOWVx/0fKjAQimkcYuAneMbyFKD3QgCbeK1xnzGASt9z8hRF1iNNYlCRJxpWJE
         HZJA==
X-Forwarded-Encrypted: i=1; AKwUvBxXXk/iU1ScbjRL/7/KkRJMVRPhKXujYCs+fOy/lGJ0lyWkAd4knwts98m6JPFiauXr5sjtb9RLLFlx@vger.kernel.org
X-Gm-Message-State: AFuF++kgbhKANe8E9aCbMNOlkrKmvJqFBjzk7pfaN+CiIb3XW9nu7yYU
	bXWiRjoDLDwit49iVm+AYeT5sH2WMm+Halh1niW9wffllsfDkZZRJbYu6GRSIXbm
X-Gm-Gg: AYBFou2JwvYlq+RmDekq2aPwO/dVH8X3yOtY0Jy5/LMCQz7KFp4uta53f7joEUSF1VS
	iQh+S9SblRbMFfi6DH6Fdd+b16qnbvu3a6hjX+vdAA2gXvv9dhARWr7ylFIKFGp0bMoZ5BYD7sc
	O9FB9wtYVUe5kelJtXazeblxeIJDeKAkxJGDGWENw/CYR+vUU+4RMEeqDSH7wwREi3mR2K25Z1m
	4saeJXOJjq3I7o3MUAjeDpQi2pQJV13WMdsey/olZRpSzkDWh114HqBsgtRpC3cxzZevKXylU6P
	uTTnWYBTSISUzrL38cHtdV2nMGpjUX+/F1XBPdx12P/7liPdKRfnd46v+wfOaO3F7kiUvbf9gxf
	ElUAKwdwWQ1yA87fb1S3VvxtkYp7YwbJzeLtskVg9w90f64pws2gAOmMiuMv7UGhQaDnNzBAbHM
	R69SHgaa5MfzGZFqhNSiA+XL8A/gAAfcrrTDaMwNnwP7whBJIUNDxRAJ6z8LefeZv2TGQ8YwEWn
	s1RMWYbIWfN0ryVk2yEOtROFA==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr2021285137.6.1788534335434;
        Fri, 04 Sep 2026 08:05:35 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm1735797241.13.2026.09.04.08.05.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:05:33 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-782e0fc1e55so376110137.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMFWLHdlAQNffU64dhZbKlqI+TIpwDSfXkeuQDY3ihhNCuSNqFtGcPdngKPx2t2Xwf9amrZ4n8ckD0@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:785:eb33:8794 with SMTP id
 ada2fe7eead31-78a4a91756dmr2264959137.10.1788534332492; Fri, 04 Sep 2026
 08:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
X-Gm-Features: AcwNN1XC5gp_Xk8OzyKjoKwIynG-nLTbzWvj7aLGFiNz0LjJGn_EivdUH3_smAk
Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
Subject: Re: [PATCH 05/10] soc: renesas: rcar-rst: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC to the R-Car
> RST driver.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
