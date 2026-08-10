Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E2199EAD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372812; cv=none; b=VBgBzDlIHqGsCGzx5JzzFIwG1RsqKj0DPQQmPQksfNfsheEV3/qQIlL6G5NET2tBMfwZGxRn6uhDdyahrBARG0jWbJbaAIViInCVBT7Ns5ldBAsPcq5MMkFW8S5kvKan+0nYarOP1NnWpIHkR4o9Ymk15t1WmQmaxG0rT6KYSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372812; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmoLUDXmugDT2cPWFpsExTqGHC0lp+01Kn1Pm9nuIoT6fesH1dH39k88gnRHwj3oQkFEucj9fhFgWkxLZbQVpaS7PLyUDLhQXO0qSf0Lu+3J/uaOTEhHbWaq0liVg7rHM22yT8Q9CtQURNvyvn/LLWUHxlERgDxt3MaUlODnj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9770e900464so1560389241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372810; x=1786977610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=X7ApeLYLcjPegUQthf339OndZE6FyDUj9nG33/8ZFcfv9ewrRmJVEQW1fZoR5QXVPq
         6OYwDPY0ax5a4Vo6TosotWS27lS1ujm4z9rrM5DoHa11yRyHNmujX1skRB7XhuwJKZ2T
         DgPQL157H0U5wre3Na3iimJv9yjmArXkhB7AAVRm82jwAzsaN2bzwI8x4G0QUtPrezIP
         aOxf74R6q/ImSf9mTidL596AMynkjK3zswANCBSSyklJbTyVOFUdqXztLnrptwrsUnCh
         7z2jna0knNBaLDUcC3YFRvl7FgEKymIfRx2SH2uPe8R4ZVxoWckgRxL7//igsqXHg792
         FhaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaqgEZwWCLSFENZ1CrQ1hKOMwTfvdG6vOGD4+Ie1zspD+b1geVHpqFc7azsUYK7VnfHCuahGWTUlq/@vger.kernel.org
X-Gm-Message-State: AOJu0YxljbBg1xpAYhXbVis3KyWGoz8Ms+IDzSCrd7ciLw6BB2NwxwNj
	vdtNglkZD8lQE0yRv/HG/LhjVQJRP1jsYYGylh/y4R0nX3/Gyixm5Mp4sBXCGfyc
X-Gm-Gg: AR+sD11Y7Bbefvjhbufjo2JHwIiIErF8RncKDhfi/bagaP+tKhvqcEVKsQrhHBFMm7A
	ZxrkmQcGfYPLh//td2lnyXVI0ycmjIJobqDAWK4Bm2lBeJi+rSe1A+OqnXRUT66GuEOresKxfP1
	/f/HcBLbMuUa5LjDaHT5Fp36fZfTq0+veyAnD03klW4qP65Ul7vFdLaEkcH9EbGIDTiapk+0teV
	Ws36C+IKLyIkKPM7uDlnuiPa6HoncIQ18zj7Wet0oZCii0NuNJIY+iphyautjiXJXT+YC2NxFoC
	iuX4WoaBAzstsNN14hjFik6rSVn7Aw7aM1DJLcL+rT734cTc/nweo7Ho4mUIwLxa+dYh1fqGgKA
	ZNJUbw4tPAFRGQ2F1nCOppITnS/mj1nGrADawcrfSsqZfQUihsEdUv2jrAeOd3ZOUSqC6iaYtGm
	ia/snMc28ZGVXb7eUEpHlgKovCT+3A94rj27h+somBlGmJp3uQ8o3ulBgTGS6ADeFx8jJLaAOnt
	fdoVH9twXYkZMsj2D36SExryA==
X-Received: by 2002:a05:6102:292b:b0:73e:e4ab:1c84 with SMTP id ada2fe7eead31-76520bb1851mr2120558137.5.1786372810221;
        Mon, 10 Aug 2026 07:40:10 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm4712330137.1.2026.08.10.07.40.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7564b7a9490so3085276137.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5a9cJB4qRD7Bt//3PjQStw7IGadbjM8kPdnRpv+BDlIvSJEi2GfbRzfY9Gw8HdMNqLjfLN4+sEHKx@vger.kernel.org
X-Received: by 2002:a05:6102:a157:b0:744:e49e:df75 with SMTP id
 ada2fe7eead31-76522a3542bmr1213203137.21.1786372809208; Mon, 10 Aug 2026
 07:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:39:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
X-Gm-Features: AUfX_mwN7lvLitZDlPNYWEclA-T-vCWyRoc3tq1Uu1GaHP9xVqafEpWVwj9VsLg
Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
