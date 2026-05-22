Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502103A4501
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456181; cv=none; b=mohHu3NmQ6Z9/7C9coHHUZUYFQZqSKnn2FAMXXAfUXo3C6tagaNRKPuLs7yAP54F9ZVfhnyyXOACaOCO5FIcDrLyaQqWA0/oPC0VQxXlyIzxTRYrO8005BvtQCeqpmUeDLZLVNx89nry91UNQHE6kYEEhgqZnGhwKT1XKqoY1Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456181; c=relaxed/simple;
	bh=mVHTrnWtVvV1ZVlQ0926x6oW50LBgMWny3UmFgKFRVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9d7znUPF+d35BubW59ugbSbTEDGqog2wWEwMLne+yLvqCH4SWbs5ncUOL93V5rvstOJJYLoZLPO280uVuFkO4scl8dGZy3O+yu3h7CjO/kg6p/PfEtGUqpKZU90qb/W6z5ed/Tsd7Rzt+3l4Uc4lfEK5SKMSyU5ATO+BEAhPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso2334273a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456179; x=1780060979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBu5hzdEZCJNEEaSkylnsZS37JzN/qLiW1wsYZsF+yY=;
        b=Dlg2fsI0169I6Hoj7viyIYAAef4e4bGc9ytEsshowwcNdPVcqv0oeyv62qP8jqQpC1
         J9kitN6GYTeOTa2Voe1fYew/falBcLXDXMh+POw4R1A5AA3o0pnkSAy5DpYv+3c1nrW5
         /CIZZdQ1mUJVFWtVRLui1NjFlMkrDAk9hGBGnB9IAbztSLM6T3Xzd5phXWKHydWH5jJ6
         wUa6KmBy0RIzhgCFT3U9Oe6lrc1b/znOVJHkYJBQPQzwwZEuSGQ2x2NFuhCu8BHHo9fP
         gB3DsqxVw/XgTFOrbUT0xvsCZD5B3pxWf46gQEdJNvHbEZPdbfFUM1uN1ywR9lYPR5zQ
         d15g==
X-Forwarded-Encrypted: i=1; AFNElJ/b9+XTApfjoklj+0LIlpQCBy+tSaOYRqykOmzmibW8z+w0Jl/urbP/gJH1hKfPFV5V2zDtlDFOsTR0@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXBr9w12gOCyjRaVgcJOZDtc7xXpM6tdycSYoPJTxSfMRV6N9
	jF3xs6v1lDtQsNZAeJtqvaoD83rUqHrOBbMc0NRggvCXGevc33TeOSgJoZr+3y8/MkY=
X-Gm-Gg: Acq92OEyxUaBbG/wXVqWRG+z/ltcc/rtg1NywLmGlO3g9Q2fGcbJ6z4I6TJLvtW6Qiq
	4D126JO905A3MglcrfUVUPg3f5ofoIJNzqtOEad5vdmlckwk79m/GgDd+rKXO5d3nYtLSmmbyjg
	HDqEm/vtKSHxgOftj+2DdSo+Xkavuft5buGO9B0kVLQCvm1+YtjfwufmSnioAc2f10q0VWiYpRp
	8EEfUaYHKawWVf6fhKfSq0cvOoYJCUQGb0qo3DrMeZf/k2ephTDieLO8D5d3PQ4IyMunFo87uOM
	kXgzgeyDbxODQfaHNg4G/NPKgZT2/ElpE8IAjQrv9GlURp4/jLCEbJ6+QzR3XDADLa9zC3BYc1z
	8K1eTDVShAhWgtZ/njxkRMz8iS/J6Q0DIRagypYYyzAdCnG1qwwkpAvZw/g2p2Qhrt3V/Jdzof8
	bkYf8DAlnrGiFa2bd+mBtT6vRxexVzGPOwAjekKCz1Wf0RjHHhTOqH8VGIXBlFEl4t9SI8aITLq
	YnW7UKIsg==
X-Received: by 2002:a05:6402:40d4:b0:687:cfde:ddaf with SMTP id 4fb4d7f45d1cf-6889c440492mr1889541a12.7.1779456178722;
        Fri, 22 May 2026 06:22:58 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm679067a12.5.2026.05.22.06.22.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:57 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso12121798a12.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9bLwzbVSbb9osAx2ZeySd0UpzRCaCrwKXV1GAcZFbjdTjALKMK7JvyVCtnSljQ16WTqMCcQKGwI74q@vger.kernel.org
X-Received: by 2002:a05:6402:34cf:b0:672:f3e:1475 with SMTP id
 4fb4d7f45d1cf-6889cc3247amr2056924a12.12.1779456177135; Fri, 22 May 2026
 06:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
X-Gm-Features: AVHnY4KnysQXcgL1Uqam7oLPpsSLc3PwQrnRQv3msLbCEYBNfu2R-YDzbK6u2wo
Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on Ebisu-4D, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
