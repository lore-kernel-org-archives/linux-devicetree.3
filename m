Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478513BB9F8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463763; cv=none; b=A5CEBnYph0dVb2NJ+Qv5Hi7Z3YwwIQU/4WDVi9b8OUmkkxB6YWVjOVzPJ4VNqKaOCteCy829F5efsKFbemIgWNRagKF2GJWYqoGlJqcDp4J/kvlPlly42fKdsJ50sD21eMC/ulzfrlqakoZrf8oVlBJeFFs+nVH9m6ePjvj+Z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463763; c=relaxed/simple;
	bh=EB5tKPXi7NNM86vQZ4/x9OqKlx4YTJ1xqabX+NGrs1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgZrolljUa1tKKD9wgpFFvJ3PJcaV6GeAM/69GcaWjWIqeeSGg6kQebkrokKM7/wBVn8vhQdImqYY3LsncewgYPMy6s2DFbqnHAC/ZK/sM3sF/tz9cn9ROkVdNX4zJ+bqHH0bzl/qPxSWDpz4KL+oG52FKuOEtgjN4WUjz96AGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so4696203241.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463761; x=1780068561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdOpo31kserPmrGp3GvpU58TPDoGY+y8EflyrkRt+J4=;
        b=pJP2ajiM/62x70Db5S0n5GzsshjJJDm2jLnMOO4VJCHrtaruo7KdhjF/UOl82ab4te
         mpJtdV/dyUTa4ieuMwjARzLEsOWslU9wjP22wSvl69+7F+n+zFFkaWxTd+cA9HAp8Bgv
         Ndl86CT25RL0zjeorVG4N6buAMYs9A+1pz48HF1e+YwqAColXWkWEQr4HRoIV19c42Vn
         VWb29ca4xv0iP78RgOaWgpwEXmWKsqjcVfNs5XoR2Z26xsilRhiSViTwX4U2TTBxp9jg
         yfxcmAD//AfZGBvg99X559l3i02U26n8vXaiC783rqal9jrfSanWGA6p0661N66SgLdv
         uITg==
X-Forwarded-Encrypted: i=1; AFNElJ9IYKVyYzY8VM+OsYDGp6EjaasbF+Y+0L9qT8gb/4nYri5mi2YN6CSNPlJY+d0pD5E4TVMRZY3YuDpn@vger.kernel.org
X-Gm-Message-State: AOJu0YySBstfeKyc0A7+cWV4sb+hIcwYEpS6wA976iTJDtZ72QOcwDT5
	SdsFnYLl4hfdz9gJXIij9pcA9AWHhWJq22XJ7OuRm8KVGk6rIQsHjANE01X8TjjQFDA=
X-Gm-Gg: Acq92OFBvu52zOmymmKfxVgsOSd4HDdyRixrEFLpv3ERvnZedvv4KfastSahQ92lRoY
	Kz3Q2Me9E+Tk05P4cAESpH50sabOHeszoClm3xcAkqYm/NbOCybhTbShx2BBUy2weseQoManuzn
	aXNniT0v62kiBtQlCuyoxNuSi/qrKhDMzLvsPHBnj2ulLh7+wOouUE/7cq5PoLQ/vOhlq3rbZjA
	q+zA7M5Bv/w28QX117kb455UIUnXLXw5PjVL8Ha9lUxpvKjm1bDR2N4/Z/Gsxwh3Qi9SDAxppON
	4OZ0oK9hs0oxJK8TUpg+F3fL/qlSy2Fza1tXRIAYBtJOsd9ZJSC5U+TY1i0XWOtL3q678OG8ivP
	3fPmsXHJg9Q3z+7GXTSgcjg85bow0P2i+s3KIb7IkQiO5QN6DJn+eBTJW/eCqRHmCRxtMtbsleO
	fnEnfW77s4y+PXKUasGOW/puTLAW9zB99pRIAoBhGa+1IRr8G/+nsLlbouc5WyCC2B9fOJ1HE=
X-Received: by 2002:a05:6102:2b8c:b0:634:92c:bdca with SMTP id ada2fe7eead31-67c81adb791mr1694412137.3.1779463760978;
        Fri, 22 May 2026 08:29:20 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm1752820137.1.2026.05.22.08.29.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:29:20 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95f2b0bd920so5712891241.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tQC3OPfxFeT2HWIh6B+hmL+Pc0au5J4s+xu9PZGmy3mCitdLfCG1obNGAWK8/96Wt2mqgpJM47CWU@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:634:10bd:95c6 with SMTP id
 ada2fe7eead31-673d1c38b59mr4123345137.22.1779463759525; Fri, 22 May 2026
 08:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
X-Gm-Features: AVHnY4LJMj7MpfiKYvQ9U6raZAqssKkW2xRRdr52QyR92yVonmyMfE85fwhFPPk
Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
