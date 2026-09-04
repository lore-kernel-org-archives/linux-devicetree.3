Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5B4EBAE6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534993; cv=none; b=ClNplBlAAkKKPTf6JQOJA2Q1i6JVD7FT5NANoHIxQUYtmDf5P/rXmgpsNXO+30nH3WyrjH8x+ikWRKfu662vDUkoMpH8GNoTaStgDUXMbeeyCyvws5WHznmEF86YUqfDqe/dnYX2qH6r0KUurEN9c1gmZgJMjsV3BHfFDFj1Nfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534993; c=relaxed/simple;
	bh=3zmx8Z2M3ZeRzOKqpOgR2P10M5x7/5/EKeh+dHIiZJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLvubNcKNRGi/sBneYMXkEyp8N/9yd5mh1YHRSc7nyjEs8ndAiKpG4mFZrKDZNg7BUZJ3iSCF+3hSd9UEJxYi3klfI66/23uAqAf0FNg81VPG0zy3zTDlbwAq4rZwPHORMZti7IG2pKx1e5kgujJwSMNRKJhjHHn7rZUt2USsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-783fffcfb96so877094137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534991; x=1789139791;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtnOZM9WfbSwC1inxRe0geJOr1JfkMHDy+62es74nYc=;
        b=ELTvxzShOlilfP1goccF+J4bpDS5F+ulAK5LP4DKMGkIgXafrYxzAybRbUuM0Kp1/T
         BhclearUb6QVtoAY8YDUPsHmJRfhdYlcyJyoYjPsbQXOc3aFTHLo+y2MFv0UGqa7LlRR
         i197WIxkUUbjhdyx35O6wypfeEHt8IFElVLe3lz4HB/JCpYEbFWTeRXnwIIKKiek1dK4
         pV9flcZfpFMoxqpwo6mSYhgE7rHce9XhuIsFcUE131lOYmT1v9ZaqOzu7rlfm98YV+Ts
         ujFVHE5s9XIYan9d+GSegbo/xfXVP5SaV7KDbZlWDjJ0/cKNyRY6p6/nXlq4qO3ExxfS
         uzuw==
X-Forwarded-Encrypted: i=1; AKwUvBz2s+rhKen/XOXFoU1GucgxjRm/iY/NO9I+WRLiaqj0Yfow22be50w+vtFXbCLeg41cgu50Zmf7nFNf@vger.kernel.org
X-Gm-Message-State: AFuF++kU/iV65Ck5JP0kAwNii76DOUx9cVvsCUhGd053c4hVT28fZbio
	DnXpTt81zptD/UrJ9DkTaBpXAX6nyRwSIvJK0b085dzSyqRGuuPzhnGnglvS0phU
X-Gm-Gg: AYBFou2kfBzcxADl694VpS4DRntJF2IJ6S5hLllGGQH8F8jbFZAvXFPS19Y/5U1/dRx
	hOeIeghER6Kh4jSKmvPPhUGMmf8LQuiYBcdcdlkK4I71M1P9TGp60wuTr5rA8k1pu9f9kqO0GUL
	yr3KGeG26e7sgZYp0dXwZk3pm1O7+EXwLibl139jqnILGz2Otx88XX3/EAP4S99GzNV+NfMx3nw
	GWmdatyQ9a7YEMMYeeNYeQPHZFGKSh1r8NEBG/VqRG7KL/ClwuWMgvhi3eMklTHLdlFKGep6Ute
	ROHpD00wRhte3chLucsKn3q67Iy9vk8QyFIw5Dhxb4mw430Q2OO8XOrDbkcDRZTaVTCTVCKdqDm
	AesXpqsGpB8siTRuuOBLIcWbwsir6K/FOovi96Z18VfzCdCVfSztpqe54IdROLeKro4AqoF4F9j
	bqXx0eU6nIkegtRt2fJijHC7GbM+L7SnTmBkesz2MSVEhjgS7o42efMxK94D5M5p0uYQzppOI/N
	9GJXDScYUxvqQ/IP14EpGX9PU04LKtGHwjs6JMGakMth/2iGRet
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr2421959137.4.1788534990811;
        Fri, 04 Sep 2026 08:16:30 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm2046804137.4.2026.09.04.08.16.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so1027256e0c.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7oguUFQ75/6tubKujyS6FgOQI+clecN+cXJ0yPD8Kj943rmSznDdGVTHC89a+2smb+sKAppDigYVe@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr3533958e0c.8.1788534988918; Fri, 04 Sep 2026
 08:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
X-Gm-Features: AcwNN1XsJHROGLoqiw2JCifUELiKV7YahAKrRzR2A5vM8Z-pkJl7ddzQiPC7x18
Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: renesas: Add support for RZ/G2M v3.0
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
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
