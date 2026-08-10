Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739393BED55
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371588; cv=none; b=RkWb0DgjbyW/CSCr8lgH+eNKPUWD+JOVvsuqAXO78E0SSzYNCayRK7/UHhpfUw5cYWUVzz5AnzczzuThrm4O4bJXNnWGPXH9RFTWDvrX/TU3ZYNljacFMVgTB/bscIred0PHMvs1j6/DvDCPiM6y3cfptmUGGHHfUoMG4fUUj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371588; c=relaxed/simple;
	bh=LFVUV7tv+VXxprYyb3YnUD/Y8MYj5qklAjHaW/X3Q1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjSslw9w2/4su37F1cUkFDniNi2DwRecE8YQ71G4jAakLO9YYtKbSDYLTAd4pbXyEvxZYX7jmNFt6YcOZ6/Xg9nzWJ6EpX2zek3nFEtvRQGx3qQXW0gPexBuO1hXbCPAOLuRYcX8PUozH1IV8pHcPNp+lU70hkXdVqAJyNPmvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so937662e0c.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371581; x=1786976381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=KQ55Ye80hnIJ+GqUxqyyQp9f5+zzZvpVEwoZ7lJb02rGBJwVYlOef2eguQBxU9bkN9
         Y4w0vY2JxhwHHbCoQEloaC5X/BOrtic0ZtbRADQuKxfaxVEKRXyLYOMYLTU9i7vdz7rv
         59fnontUyMGoyvIR4sROji3530ehMZug5WKpV/o8/d4BEStncVgMKfW9poUdmXhXpRuY
         KcZRwsyk4+JUStZ/0PnAuzPer5Wtr/OsWFC3EM/z+RAXlCJ+0Z45Mtn4z5oTZ63y/Jo5
         FhAMRBjJMGZRtwlOyZC5KSNZLy0AG6eT/Nba4o7nAhFs0L/Ro8KfxFri1pCzf0GppVv6
         7Rsg==
X-Forwarded-Encrypted: i=1; AHgh+RpcgiqkygXt8upC84xQWRg12hA4HNuWLUIyfqX0R027TOMPiV8dWawsMZd1ThuNrevqXIf+TTX87dqz@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzbsA84SkFRBFt6UTXk2lVgDbhWnLwMlIF5nc3DDFfYe039Bh
	Qtwe4N7Rud/NBsYyJgEep8PwJOizuipHN2q+4I2AAs3aFG4p3bEy3vkQeGo9Vjsr
X-Gm-Gg: AR+sD10WGjJLPUkD8eD0K07hWPNM5vCoKQyEcJBkoXcf2uva6Jlx0Mdf+9NXRf38tIU
	HA2DTwVG140L9oejiBudoFb/m7pr/a+yznTdaEM7+77Dkjs2wN0gFn0l9GRfdO2UTK4tjBGolxK
	SR3OoAK2hAHe5Nh/5+T4/DnIpzcZ8VoO/R/mZzjR2vhs6Ypwdb7UWcQl8Pg0HkPIjw78srVrwdz
	SyshQ39Q7NAZNOLL704HREhy2U36qJVrI9hZdkt2w4zd4YcAQwBfKVAuNnh+dqFLC+V/Zg7cmlw
	eJU/YnekYTOeV8emiHpEVCARRfVUNq4vtgkW08qrLFuGnf3U7hu/Ao5qLaeY3ryqse0WN/Hy8Ny
	PzB0xwWmHch0kEOkcxevqAM41BGLVaQvSxSvMS7lF63TiOgPwM+jBRcLy7//+8eRbXc+doigGXd
	DRnUfhte2g0HdufxOkSeKRMHhu6HgQi4kWHteVigrcKcxFVc9B8FL9D4v8oNGHFnLlb5W/aAj+S
	URwB/HRf8mpMv272ZR0dN6VQA==
X-Received: by 2002:a05:6122:4683:b0:5bf:9461:91d with SMTP id 71dfb90a1353d-5c4419340bdmr296714e0c.5.1786371581140;
        Mon, 10 Aug 2026 07:19:41 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c420a2d1d8sm2767937e0c.6.2026.08.10.07.19.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-977258a75d9so1016975241.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpjnbCpOZ1k8QNrvDHciNfk8VYRnOWAK7VFHnszsR1p34A1h/vD3WsmXmDZL4L8CJWh7kBYMgt51yfz@vger.kernel.org
X-Received: by 2002:a05:6102:4b19:b0:739:5cfb:50f4 with SMTP id
 ada2fe7eead31-768e7e0207amr545053137.11.1786371579827; Mon, 10 Aug 2026
 07:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
X-Gm-Features: AUfX_mwCClbcVmT6ktSeGN6Av5hVIsJrTjBIhbY7_MyHUutP51gtYjLaOZvaetQ
Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
> POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
> long should the system wait after deassertion of the PHY reset and
> before start of communication with the PHY via MDIO. Opt for 300 us
> which should cover every timing option, including the 16 us delay
> required for MDIO to switch to 25 MHz listed in Note: in Chapter
> 3.8.5 RESETS.
>
> The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
> POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
> supply voltages to reset high is at minimum 10 ms. Set DT property
> reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
> spell out how long the reset has to be asserted, but this at least
> covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
