Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F03F58E5
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372596; cv=none; b=h7fjZkzJ65lXcRstkcufvjF79ps4PrlQFiAeg/AunSvPeDImofJz2Sbat+QHO24coEJudGMyF8FcersJOngHqvTybSeFeJxR8HL7oq7uGKRtkGfZmaEb+uJLoHu3eCB4C3MfNgUIkteoc/WfA71S6iNN1elM8irt0646nXgDgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372596; c=relaxed/simple;
	bh=Jc+Wy8u3z1Q5y0+m0+roJV0C8d+2E9bEUT1AowBjBhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBV1KRauIRbHTSDAWJWfXUehj+f4nwDbGcWdgQ6G/kFpzXk9E4+4FaiSkIS2futNBAv2AQmUL9/1V+TapRJUWVvwaRyvNV0Zqo/97kr9RyHhBStG+H/67nq2Pga/+Lx9+moP2deaSCyamUo4fIc50u3jADcVXRPtVslPaM5xBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74dce749cc5so170136137.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372590; x=1786977390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbEsllBk0EU/5gfHmuE24f9NsGRgf+tdlgI7A13kj8Q=;
        b=JCEL8LgJQOXEBNK+N2mzdSmi57yr0ogPFiY1VFBP4FE0rsyMyRJIgkueE5T7IGsGMk
         6PaVgXJ43hhIrJf35xWMZhcp05i5UcVFxU7wLNzdvJa7PIykEG+ATyvpGYnlFwAPKs2K
         3q+KqpcbI36gCv80L9rheh1B4JJHkbIvBwKMF2N1wbguh5GYMg1VHG62j0rANgg9xtnd
         4NqHKrxfA+H2WbXZws1/sAPeVFUDqK+MUXMpQbUW9wD4NrEoUC19rb/9YKgF7JY1XjU3
         WxM9sC5aYf/JA4/N8n8sajuAFoaUUA9H0K09GGusp41hqDBx6eJfBVSI062sfa0ySiZr
         V9FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotr0EATG1kHHPtoYNIhmqLz+Wtqrn6Q5OEnAUjJBiS1+HtdKcXcXc8jkDLv3ilMELyRblKQ5nl/6ta@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Nd9yN6GCT2Qt+a/jElif46sEo5CFKVRs1Hx6Wk0M+T+XOKmI
	E3wYtBN6s/Uz9ygNYHdR++iw9wJlT8we47gpF0y1CnIVqJKCch9e20ZhmEtyp23T
X-Gm-Gg: AR+sD11WS3MkuMBj+wE6rVw4aGFt3C6xp8141MF2KxU+nRDz0uFM9mKnmonJrqM1Qt1
	UFEHEPMcCiSGkirmGSWxTDudWw2Ht31h2iKu7y02Ni/KGpELBzsEg/nyOJT/iA6eDtuVwpA8BMr
	XiwHcH5f6tyef/s4IuLl4/O3yxu8DNSigIz90Agb1QdVvA5Xt2X1bIhJCO29+WziBIDz0m/uUge
	2iKa/ZCZ19ErGwtGRn097BbtwYcHzpYR0XlKR/CnvFZotmyrVOEfMsi6exgZmPrLz+DORnmRuqM
	Vj4sOy/gne9N5hmAeFKtwxZPx5S83jyunux+dJMhTRBdZrsNqHU/yb0HrfuB2Osrftolr/5lwbX
	ypym9lVl/6yKA5FDblVFPEK39uYILkDMbTc9J9y9gJVPJeBLH/vkvmMvZ6C79eoDJB/pn6zlJHK
	KaRAmYg6XhwEb0QBtofz+hVaKoC4EAi9VPLoFCCu4ilyE/zeutT6HKePYJfVU+IeKEKuhXu9zec
	P41Q5sHmuubAXYomHTH3BYfPA==
X-Received: by 2002:a05:6102:32c6:b0:73e:c6a0:331 with SMTP id ada2fe7eead31-760e852173cmr10241438137.10.1786372590288;
        Mon, 10 Aug 2026 07:36:30 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc6besm4637644137.5.2026.08.10.07.36.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977fbb9dc5fso439287241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgZyt/cJqYxL04IkkIGhqE47IjRu2prHkaATO3dtxxaR5lQbjoo8JpooEUla/En+VSpz/8eX5jd47M@vger.kernel.org
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10451604137.1.1786372589081; Mon, 10 Aug 2026
 07:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
X-Gm-Features: AUfX_mxRGFAsneILwiGbi03_BcU7Uq8jfCmWcA753H01LUA-8HtzsaR9xWF8_vc
Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
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
