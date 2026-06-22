Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B073B774B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139051; cv=none; b=SzuZic/faniLp6ggkOZ0I02AG0elJA9FPBTRMS9xzikiOciqh+a1s0AKsHURk7yJ7kyvGEVH8gITCCgkuLFSuFmrcC79S8FajV6yq2YUAh4qIpB1pPPDZ3cXDDqPj/RTAgm25p5ce1Dn7e2z8QBDuAx27GV+0LkRf/AUM2+qHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139051; c=relaxed/simple;
	bh=gHencO65cRvW6GG9TEM96PJDcvibKc1PL0bEr+ar9ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL8d4IIqFo62hPE+LZlCp9THVpMxKk+jaxZS52cc24BQT+Dez9Ob9xCws+e6XfJwabdyEChb4r3U4ymf1gmTtOnTMCEktgAjn9WrtGImhvgbM1wocG3dmRy5FRF0VKwCa3Wvll6F23J4IG98mlMiZhEEsRFe4wqKmJNyy0WuD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so3064688e0c.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139050; x=1782743850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcsqXGndiQDiWLX9BqUSUdSKEoXLrcy27ADWxumaXQ4=;
        b=mJra/hrHFjIaowFUqIc81CAmFvg2je0IekJfWELYUbeBTjxmhfThltI+k5hDdS7i4s
         At9vEuFHfleUll+I2uVgOa+AS9BhRkhMoygT1ztOADx0EF9yrPcGjJYYLOCQAGEVSKyS
         linoZ0WI94bHDJycv+7SxqabrTxx3nwQdsBmO518DnHL0x0I+Dn6P7FWjaxntH/dut4n
         wX80o9jveFkJ0/EULTJ6eZuX8CNsLcIJebS7GlpdJCZenMdkcKKqESFJUOa4gmOAvw7K
         T5dCNJaBG2xy1qOF7EHv5x0yuoZDjGDUdcDrqyEL/w0P5GdOmLCPYQW7xioATn+pPv0j
         v3oA==
X-Forwarded-Encrypted: i=1; AFNElJ+ebkTf0SITHtYMgiIZzr4418h4MCiDkgUruYNCCdRQuq+MTF40kTX18oanCeY9BumCEvUNVARTuqBb@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQSjsZRU4QNKMmm/Lx8jnIBeEdljN5J0xhaD+UezZ1+JGSaAk
	iUjHLtd3fGh5TAjTNGb9/taUca7kDE6cL4UPM4Rg5yFtGQ0tEwkLI6w61aVKXIYMxUI=
X-Gm-Gg: AfdE7cnRUH//VslIVQsblV+U9kTmlpSHDZekKasLdKiBVUfju0F9URzsGyiklCkstRv
	hTsWFgv4Do1gTqvGDfJQi9VZAAzU2/3vS/WQ800TnYh4r8bbck7i80klHSl3qu3LbjfB8oxU0x3
	CqIHcUKG0eBaWcbI/ySLACAB1eTqArifTt1Jn/s9REqh80CjC27tviNuAZP3sAns9vH3nmJCg01
	nXHYU6hjFm8BWUjuYnjzvBv6kcFHl7mwuhV7RlCkacTh2T59Wf4r4a8l0lNGLZtsvEXmgT6/GST
	sPVVmmSLHV9IRpbrPLQhThtQnCQasu7Rejzn8byagzzSTPc8jh8IdBta1838cP2EPO7Vw0ZNXpn
	4mBeGjLx3Ho5ez+ZWeYIIZ84lCbw1ryVTnlJjr2LTseRnBb5L183nm3s19147Kg//OmeDTVv3Ie
	yLloE4c3aaA+hCU9xw8IV54dMNEh4+ugFH9/Ut5/lDgVLwXd2UYw==
X-Received: by 2002:a05:6122:168a:b0:5a4:b637:286f with SMTP id 71dfb90a1353d-5bbebc27b1bmr7948763e0c.12.1782139049685;
        Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba73cfdsm7033692e0c.14.2026.06.22.07.37.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9670c23ca7fso1120179241.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+GRFYAHmzBqU4+xRVty+sjLDuFnuEBe+Wr3OW2vGFY/lvEHjmumc4H0SDmj4sQqnx6oExiaw95LoJU@vger.kernel.org
X-Received: by 2002:a05:6102:4415:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-72a03fb3994mr8954632137.24.1782139049133; Mon, 22 Jun 2026
 07:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com> <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
In-Reply-To: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:37:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
X-Gm-Features: AVVi8CfRVVXR2FXSKJhSl3yxE2bVY1oBSZbcvDardGByw-FE0lPwGDdOQ4zidqU
Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Jun 2026 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:
> > On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> >> which already has that soc: label. The soc: label is useful in U-Boot
> >> where it is used in U-Boot extras DT fragments.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > For the whole series:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v7.3, squashed into a single
> > commit. Unfortunately there is no cover letter, so I will have to add
> > all nine Link-tags.
>
> Is that why cover letter helps you ?

Another reason is that my scripting turns cover letters into empty
commits in my local tree, serving as separators between patch series.

> If so, I will start generating ones ?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
