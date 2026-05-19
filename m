Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291B3F0AB6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183118; cv=none; b=juEmTbnxOzHGNrUV52AdaPlM7CUc6m4xoDjgxoVwhmVuidEBZb0HYtdNpA4SHmu+e9pgdcdRdc2eDg3NaoATfSkC+PgPD2G2ctYpEhE2DDFoDXCoVeSKj2pE1Xyu/tfiyXorZVAyfFvnK+VOnhrs27HHa8uA7TdC0zfd7STRmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183118; c=relaxed/simple;
	bh=Mf2XoqrYRO333qV0Pq7IeJWLfaeqZ4CVJGnnWh+JqPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsKMV5zBmOZEVDU1p2fxsaOC0vTDVjJOLw2ODtfY3br9M9r1glx6bqn/tZRFs0V9yB+qq+pjRJFXUHr6mM0DRopqjnSQjzQi/mYoIlYKMNXiLjWVTjfbc+Hhtd8JtutOoChjdEXBLfB9regG4y2dachxeot4hZWfu8JG+njItIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2321228241.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183116; x=1779787916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7mLu0pQK6X8KnQDNiHLkRRuhxqkx65FdTGE5tLTcw8=;
        b=qcphO7g17BspK1M9TEoqIoGwiJBMkneXd8wGIOtoHW3Pjg95n2uV1nPN1CQsgqWrar
         nTHx2bros5mHhJ1ZcZOAr44ybPRY39yxWkJHEV1WSV90vG0g2qLK0r44m6BdwlHNabxq
         lTpoxoXSftWvTc1h3qL0iemxOORdgKuRYscMh13tOIZhpljgDYVkdKci/BJwmW15xsK/
         PaCxCDKolTDRl0jdExdA/Cx6x5rR7htTtYOn/u63sh8xFfj46MEpFUCJuvsdhIQ4AZYJ
         1KjvuHgk6OkIDq666Fw5xwXj5UEjc1T63xVm1nGgOS355KeLQZVx05WDq4fStfGcu97m
         lXmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HlWuDSzge+ZANJaixF5vhYVoq2EOoWoG3T9j+hN1utp906/9If/fEhD9IcQjbehtLNsLUKGZ2uSoE@vger.kernel.org
X-Gm-Message-State: AOJu0YwwB2/L+mb6ZtJ4Dm6TUZ+K1Rf9P0mK1FRCIwxpvNY/kF58vwKt
	swWvw5AyJ2Db/09rp9gtv40XP4o9kY9mHz3agAeFnCNujX2YJ1Fgz99A5mTPDmme
X-Gm-Gg: Acq92OEzF9T3sVWzE/qx92pvuRLZJc5EaG1+D4XFdA5KtbOoGqqB2u/0oa5hwvQ/ODi
	5bGHg64oOChRkEDj/NoVjmtdgWLv+8tzp/YGiiInw7nzR8/mrFSRHvGZ2t4Vk4WF+iOsELuoiy6
	VyP4uQdL7SfwuKPGFWfsuu3GbK/KUe5zWYWYFwBLh2Yv66TuUvVU5ZvpkoHMUsj+raiGywsmpEd
	xRLNnk5m2lRlCmFfLSWDpgVp/bo2m1l1taR7rpEiMfVXkVkcJcTEKftwIDy/vSyAq/tBGZleYWB
	/S/XIQJkW5v30yqFaK1M1ARnfkMTPT6uFPVAibbf3f4Lfc3YTOUU3fapXRWupCeUZc4r+O5Nf49
	19IvhHje/rlaiCFhLfO5AGXkc0aOuRYQETad1eJSv8nmGV8dNwvXTpWv76urn7qXFZakeEuwP0W
	NdrHyIbuAHcbIJKjpjftgBBauKlImTDR3wCXBkRMp2c/dNf6Pm7goXyyIqMdym9CS2qDuaT1o=
X-Received: by 2002:a05:6102:6051:b0:634:8685:d335 with SMTP id ada2fe7eead31-63a3ec8c2efmr9002255137.14.1779183115677;
        Tue, 19 May 2026 02:31:55 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ecd76dsm5770279137.7.2026.05.19.02.31.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:31:53 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6312970d9e3so2501063137.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8J/NzmtqtG2+IZsotfc6e9PC7uNV81m8D5FogZ/b37uWaSpKDxDqrhrhAWqgSuv5lRu6ABARdL2m9n@vger.kernel.org
X-Received: by 2002:a05:6102:598d:b0:633:d7ec:153e with SMTP id
 ada2fe7eead31-63a3fc96982mr9701042137.28.1779183113287; Tue, 19 May 2026
 02:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com> <20260514-clever-apricot-goose-acc827@quoll>
 <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com> <657a7b16-9036-42f9-b04a-503b5349f68a@kernel.org>
In-Reply-To: <657a7b16-9036-42f9-b04a-503b5349f68a@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:31:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoDx2MFDvWByvUS+d65Lj6EsiecVLz5apT4oBc_Lf8KQ@mail.gmail.com>
X-Gm-Features: AVHnY4Li7rFLZVAY1sX6NRmb7UDXsqvLWq9nv7KTFBeOAp2gXjwv7toqKRqt7Ng
Message-ID: <CAMuHMdXoDx2MFDvWByvUS+d65Lj6EsiecVLz5apT4oBc_Lf8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 19 May 2026 at 09:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 19/05/2026 09:30, Geert Uytterhoeven wrote:
> > On Thu, 14 May 2026 at 14:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Mon, May 11, 2026 at 08:37:48PM -0700, Linlin Zhang wrote:
> >>> On sa8255p, resources such as PHY, clocks, regulators, and resets are
> >>> managed by remote firmware via the SCMI power protocol. As a result, the
> >>> ICE driver cannot directly access clocks and must instead use power-domains
> >>> to request resource configuration.
> >>
> >> Then how can it be compatible with qcom,inline-crypto-engine?
> >
> > It is a pity there are such big differences between the SoC-integration
> > "hardware" description in DT of systems with and without SCMI.
> >
> > For R-Car X5H, we proposed a difference approach[1].
> > Linlin: do you think this would be a viable solution for your platform?
>
> In the cover letter I see:
>
> "This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control)"

"... by accessing the hardware directly."

> I skimmed through the rest including bindings, and I do not see how you
> did it differently. Patchset is mixing multiple subsystems and topics,
> so it does not make easier to find what you meant.

The gist is in:
  clk: renesas: Add R-Car X5H CPG SCMI remapping driver
  pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping driver

FTR, this is what we discussed in Tokyo last December.

> Can you point me directly how did you do it differently? And by "it" I
> mean what you comment here - "such big differences between ... "?

1. Describe the actual hardware in DT (+ a firmware property linking
   to SCMI)
   For sa8255p, that would be a clock controller device node.
2. Write Linux drivers that do not access the hardware directly, but map
   operation to whatever mechanism the SCMI firmware does provide.
   For sa8255p, that would be a clock driver that translates clock
   enable/disable to power domain on/off.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
