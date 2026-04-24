Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4F3AE183
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038300; cv=none; b=c/ZaJ58A9+60Pzap0hw5wv7Ph+Z3oj2g+e/8fNYpYYEKwbQKVEU9FNVi/TCLSLbMVjLvZXx3hnEru2X/2082jKWaJPUVePp8sIiLFhSij9SUeWM+mZYfG7OJ8cBJ0OhGV35V8atFDrR1VVADDAJVCRXqIxYFXm+RUMDWvOT894w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038300; c=relaxed/simple;
	bh=FBo4MpOuHym9isd4kpc6ESQ5scuBE3X0XXVkHE8M6lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW/ugywEzC6XLgbfQHihyNICrhqd2G03B7UBxmA+tgQZjVPbuY+zrR2q7PAelEIRIv8zeBPFXUBIAOg7I4Y53dU1sl7khAl3ikQNhrpIyoSJBcIztxxL06pQ7B6hb7lMbRAg2Ly9iNXjLi0o2TEl7rMlehRHtnFQ8O18Hp4CvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so3403330a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038297; x=1777643097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAdDpaEBGdJ4DrL6veRXDKf9tGg5aCWLhuxw6BI8jYM=;
        b=qgp/SlD+UHh4n0V5ZbbJ/ZV0BLMWgLEdERCFP1wfgY7Y+pEoWwxB7EWEy4464oPAwH
         t0wBhIJzIrOqlZjUyQp6u0LI3rXV+RP+C07a+CY0rkNjKubeAd9KIF/Dwog0NxrrCRWS
         UL+Z7ynOiPQetRNwdpkcdaGPsm5ENcMFrxK3zJsmPXsKm19AEKbxbD/PWSXqr8CrALPt
         JdHZRpm2a9x8k5mMhBzYdzHlh2ORk72jNDmo+zbVXYSDYPx6QgOmx726I0m/G0ExoDe1
         WcXbMPtfp8g5Wvh4+sRjNpJffXEyEIpNIP4YrStYghhymcg48CrLtBTU4FjjPsgfumFz
         CiJw==
X-Forwarded-Encrypted: i=1; AFNElJ+EPPy1fx+pTnFLrE3aEBfy8X1vTX5RzUCgSSx0f1S619f6Dii8/gaNZtQZSQMaEbm/87RmI+EA5Gkv@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyE7nysXd5SPb+q+yWaYtgWA5Mmci6MN0qavrj5MpqMRFRDgN
	DnkKQig1A1JsPHm1DcUnj6KAlx6wws5k4m2CAefwT3d5sP8UyW6k73YMXbJaE9gDhSs=
X-Gm-Gg: AeBDietI+DG9L6h3P0W0JAZz8RDbmP/Wf3ii5PUNxI0lY7KTRmQYY73HKhoS/QHa6c9
	/6Eqe74JR/UOG2FOO4OQvvVEwzkjDRHB8v5wBnXt71rF1JrNVD7yh3ubs2J+dSY3W5JsT/xXSDU
	DJDbIv93rqapWIWhR9xGi6ju+mTPnlwQQ4JMoX+2Orq7OPzYfc0Lued1GTcdaL+AmytwKwuO950
	lCCo7v9fUkqlu+ol/SDunXY0aY1PfGJ2T9IMfGcHOHWKZpYmK7R/lUPTGZEHbbndQsYBJU5DYnS
	NO35+pOqAPVG+K2aO+vMEqcfHqJhMV+uUjBoO4h1qxAhtEUEIbN2674CT1irmzLRQ0yGx1+5Kuj
	8Ly57aKVjfjSfseYBVNca5xABxaghsNTqrMwUvqUvhUn7+shRAJLrx1v6sFcgkhy2jigbQvk3nI
	3mJh2a82anDn1/H16YGz9NTY1SNNtMjkbTA3CfSbLWqGmuF9O1QAqdmFyreFxfbABWVuS4P9E=
X-Received: by 2002:a17:906:4788:b0:bab:75f6:78d2 with SMTP id a640c23a62f3a-bab75f68109mr631075366b.11.1777038296463;
        Fri, 24 Apr 2026 06:44:56 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm765718666b.33.2026.04.24.06.44.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1325608366b.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9stFGuEYb1xE2KAidTXeCkPupBVYxiBTOiB1W653sm+AxfDsJZgY+XBWIowI4E/2yZ1h4wAorRN2e1@vger.kernel.org
X-Received: by 2002:a17:907:c10:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-ba68f34b5c5mr1336772766b.13.1777038294976; Fri, 24 Apr 2026
 06:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
X-Gm-Features: AQROBzD95mCpvpKjt-tx1E1uXUYHVxRwIWBz9wiPmciBkPhVEaN-gD0qoxp4r-g
Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/clk-r8a7740.c
> +++ b/drivers/clk/renesas/clk-r8a7740.c
> @@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
>         { "zg", CPG_FRQCRA, 16 },
>         { "b", CPG_FRQCRA,  8 },
>         { "m1", CPG_FRQCRA,  4 },
> +       { "ztr", CPG_FRQCRB,  20 },

This is not 100% correct: ZTR has an optional /2 post-divider that is
controlled by the ZTRCKCR.CKSEL bit.   As the Coresight drivers do
not seem to care about the clock rate, I guess this is fine.

> +       { "zt", CPG_FRQCRB,  16 },
>         { "hp", CPG_FRQCRB,  4 },
>         { "hpp", CPG_FRQCRC, 20 },
>         { "usbp", CPG_FRQCRC, 16 },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
