Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC13F8EDA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819166; cv=pass; b=qvDifDdJPHQ+iQTbdAfLUCnnO1ZsXUgzujAu28CLxiq+d/W2guv9mbdyWKmYqJk3lr4EdF2vrAekoELmSTLEr6lbdeRlb9T9ZSKzauXrcgEUPkM1BDpC84cZfrhJXrlHJBqvQvLe7Tsdg0iuVuGHc/UVOXwbjopOenPx8WJ+CBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819166; c=relaxed/simple;
	bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7WmtjbAX8O6RnqTZZheTuy4Czbn5/aU/ZUg53SebwW4AJHOUge9hBMu9pi/o5MMY/m0xOLaG1Anc0H+3RJRfNue6aKXGtzI2AycXiZOW6RJ4ishIwxTTLpcajr+XlZT6f5wefJcRUtKAQZkSPPw5gnlyuRcxzBqQxu5BUjzoGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAdrWwk7; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAdrWwk7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so6196977a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782819162; cv=none;
        d=google.com; s=arc-20260327;
        b=N1FmDCbmEhVLMBiHPK1vm95jTivvxSJP9Z6JpJ/wbPPnzGfgoR0AlosXNHgqGyYJfb
         Nvo0p+v154EzMQfOOwSvdJGOckUbYVono2V7Tg1DWzDOvbKsC1efGRdbuwkpKihGSnyv
         OMAc5qpf42/TNKt1KvLFXQEee6IhGpeLnoMQXMsgN2r1u1T9woFaaShKErOKGKYbllgi
         6eAbht0mm5Df68qzZqEOKbka6H4gy8PJuRBaWyhtnkJMrl2j+mp5i7gGq2n/4uU35Tcf
         wLiPldXTWBpnkf5Ln/8kWmicul8Ad9aW54NlUsg4NzNi9FN9RFygGrl+IL0WElF0y2jh
         p/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        fh=JbPaFQcGn0t8tmHCBKOeK2jiO/tmPEkmkoTDGon4JFE=;
        b=jUKdbtCZ4YCTvUGCqTaKUitPd/MwP6uXzixylhRU9Gccgfb96LL2QxMrXigJeN8Ji/
         WgZ3S3BWJ1ChDYn/I59lIQ4DpEete3S4dZoaMl1/6m6tEH9c8dxgNfruGQlqZRqjvTL+
         e3iOPvHWeD/QN8W7WmXfZpWDfJYCuxF2zQFFsLxr26UHEzf053PpkgA7h1OjvHG5W6YZ
         y/2Acd96sBo4PEf3Z4ySsTeABcTRMhKBC8CsfKdkdAOnHSe0YDQZP+RPsff/LJZbRaG/
         3dAAUN/NkBRjjR+B0rYRA/e5naYqIk40fKLqW/f6KOuiFqOx5iab5fG60c+ASWt71njF
         /mvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782819162; x=1783423962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=OAdrWwk7io5oRt1D+wBZo4XxKyRYhbS6Ga+h5k2kXwFfqO2AeuIuDEj0LSUzB9GBmO
         f0rD+mCzMfVr47ERrP4WOeHPDWE/5OvIxMOsExToiiXTfSzyUgBu/61t+i9xws+p/AKT
         SYputwV7kGbe5rmLIH4scSfPzUWmuuqHCZERoVqhuDXB62mou9SO+wABdItAa2iWKIRI
         L8lwHW6D/oGFXhSUkpJBpAQQIrqk5TyXnlQoiyExM5w1EPfb/qXpapYY+oZyfDL3MZ5z
         86VTfAf9aNOPluWsB+ZmlpXGGFTNsavi7owG0emKIdizUY8N7QWz+V2GRUgXVCPTXKjv
         Hs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819162; x=1783423962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=qFOX0sYRU+7GTYgMj5DvqVjtNDmbiRpC0TC5Q3USayjRFbwnMaRsp+3NObXcFCa+gJ
         cYUSelt4Fm9Wk9BXaOwP5K4kLVLzgX/k+QQ76TVhxWcz61kkrdGlm8E+icwKVlCJGIUc
         WB90iFeoe3TKEpevXtiYwb6SmrHoGruVxQNuP6lGd8CbzQxNpPapQOTYjsuCPScJfKkA
         /moOK2b6NkHR3e4hAeGlkg6r+wkYiUC1ntx1WE6tUbp0SHRHZf7E7bX5K3nnzrz4lptJ
         hMvgsy4hOSkD5wG2MiLFIPO+886r1hXCYen0NnKq8J1aFK6yPWIUKoLF2GuTRBkcX+gY
         v+aA==
X-Forwarded-Encrypted: i=1; AHgh+RoTGDV8/PTtcp99JkITyAVoHfynKJDd4PuIBo8gKTgTMmQeijmsoqOYmt1w5iPfTcOw/OZCYExW1S2+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIC0p3jgV6yhYIL+tlSvSHBGJEscEPOqxb1aEL9qQva4VygJYT
	gH/+6iKRbYpzp6d5vhtsE2BWkC0GEeMqWM7pPyScTQiU8ptky9xCM6ibWdS3S5UUye+g9Tbw7NY
	y4FS+/Wiu/YDoReipepaERUx55g5fCNpQDekufJ7KwA==
X-Gm-Gg: AfdE7cmxtzUlFlg9sJL/UVWskdIHHfH1M9ejEFURDpen7pK5zG506J/PQTa/Zr6TBlM
	OqjAKCQtlKLTxqtHe/euHGwHIxyk98egL9qJQQ08U55LBksG0RdCMFpv6Pqw40ivDv+zgMCocvd
	/1F4dG3pXl0PzdJq3ydFYJ6funF39y9zuajX4rZwFn4t/+c8zOQv5mtxK9zJH1Pfn8FMpt7l6BI
	eJ9V6YLkcqDUYd1Nm64UBemxk7+aJ1BRtIwMIR+VN3Q/tNVeokSqWELD94hUZ/tJcOaHtoUKot8
	QULnxZzPUwHTnq/ll5Uy/RdO2Jyy5g==
X-Received: by 2002:a05:6402:51c8:b0:698:3b7c:7e36 with SMTP id
 4fb4d7f45d1cf-698878ad389mr184057a12.32.1782819162077; Tue, 30 Jun 2026
 04:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
 <0f1e01dd0844$01190c40$034b24c0$@samsung.com> <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
 <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
In-Reply-To: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:32:30 +0100
X-Gm-Features: AVVi8CcNxlc8aBvVUsFvxwtw-6b-XjIoK93AeruSemmptuSvFy4q0u1JGeOhNoM
Message-ID: <CADrjBPrG7bo1i6YcxuwNKnYmKF=d-MXXMWSNdu+KfF7hhqQMXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Denzeel Oliva <wachiturroxd150@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 30 Jun 2026 at 12:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/06/2026 13:02, Peter Griffin wrote:
> > Hi Alim,
> >
> > On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Griffin <peter.griffin@linaro.org>
> >>> Sent: Monday, June 29, 2026 6:02 PM
> >>> To: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> >>> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> >>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> >>> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> >>> Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> >>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> >>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >>> Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> >>> parents
> >>>
> >>> Hi Krysztof & Denzeel,
> >>>
> >>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> wrote:
> >>>>
> >>>> Correct eight PERIS gate clock parents to match the hardware clock
> >>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> >>>> default source.
> >>>>
> >>>> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >>>
> >>> @Krysztof: I was thinking, maybe we should establish a new rule/best
> >>> practice for Samsung clock upstream submissions whereby patch
> >>> contributors should link to the downstream cal-if code for the SoC after the --
> >>> - line. That would make reviewing the patches' correctness a bit easier, as the
> >>> downstream cal-if code would be readily available to the reviewer.
> >>>
> >> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.
> >
> > Generally I would like to, but I also don't have time to hunt around
> > the internet for a downstream kernel tree. My rationale was that the
> > submitter is most likely to know where the downstream code is, and is
> > likely using it for the upstream clock implementation. So, linking to
> > it as part of the submission should hopefully be fairly easy.
> >
> > If it is a Samsung SoC for which no public code is available that's
> > fine. I didn't intend this to be a hard requirement: "you can't
> > upstream x,y,z unless you link to the cal-if code". I meant it more as
> > "best practice/guidance"; if the cal-if code is publicly available,
> > linking to it would be a useful reference for reviewers.
>
> cal-if as vendor tree? Some contributors just base their work on
> downstream GPL-compliance dumps from opensource.samsung.com, so not sure
> how that link would work.

Urgh, I see. My suggestion kind of assumed the downstream vendor tree
had been pushed to a public Git repository, similar to how Google used
to push their gs101 sources, for example:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/

A link to a tarball for sure isn't as easy to just click through and
take a look which is what I was hoping to achieve. Thanks for the link
though, maybe that will come in useful at some point.

Peter
