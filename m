Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7C3BFE2A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865641; cv=pass; b=Y/XIckiNdRbi4JcQE2zgusyizfFgvE3Rcki8Yq6TRABB83I9TpdJf2ktSayXE52yxFQhvQJi+b2nYEnTKwoes9coWUpRKiCtAGn+vzTqdw2Eat9K5F+h2O08t+mPVhXkrTjTkEFTRh7jL2GWwC+Xengv0kesEsnEOOxTMU52Kl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865641; c=relaxed/simple;
	bh=8DkOPdKwP6pNMpxfQGoo9d8wOlA4fZlRmCG9iWkviCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aqa72b48ntGx8qFASiI0cMTUZ+itYuO62VCjszhY+5HrnKq5+1e6UhX8X+gV3NLtA+HQI1CRCt3vrfIrFrEHt7scwVeWiRpNAQS28oiDc9LNWs7OcV4owrWpu/E9HQ5VEf78hqLOwYqmOvxxbOzKLLrNjM5uHhEGKiV9zJWkvpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxNk957t; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxNk957t"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4611119e87.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774865637; cv=none;
        d=google.com; s=arc-20240605;
        b=BaGutKlON9Oa68rUBjWyAkxyDTZCTWrcpxWwRqrgfBoVijHAVLFt8+yN71L6tLL75a
         M3xxMTdyY/BdVkGaXMPs2DcctS84dUEsXTye+BPeJN+SwMcLRklQI3thpAbwOk00Coih
         KqL+08ogWZ+3azN/83u/VSOEoV/ciK7eyqW2D1Ie6Pxie4ASrr7QYl6FAn4wOxNFQOlg
         F0H33GicvVYdObC/9e82ybMfOiwiQIegacB5syV8r0/9BF62LblFKI+1IUeLXZieZppy
         OW039vOZPcN7TP1yKmN4AbmCWuSuhaVQknguQCj6tO+p6jlCjwyEnyppRA9TJFX3V3Ao
         Dl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        fh=c/Gal1lXZ444uotvlZ+jNEOEj/SX+cOvpXI1KKiw2JA=;
        b=HmjItfyXsZT+qClUHTArAOGgLJXF6Tj5QhkWSnbd2qjlTpr+/BS2UTmpFuaPEMCooC
         0EUK6tiFJd6ur45A9ui6/Y7D6Gfae3poS4gQ5gKI5GUYNjzF+2o38PuCGQR5lNMleEQN
         TWBTbWLnW8eWnXoo7SWVoxTEsVZ63UszFuENtwCpwxooggLCvYSDDRxhye5wSd6/gyUs
         LMyh8IKi3V2yqkuVNzgfQstRAKVPBinZEJMJ/hdFr9iYjXf6WhkKw33zJrsBD9ACS3Yv
         O/sq279VFBjwSgnqKNi6x0ZWlEEqKj4sc/kY6u6gda7WjpOrqqpP5BroaI3AoGsX6hJW
         OasQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774865637; x=1775470437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=rxNk957to7xN6eXqhpX5izC1k02whQTErDVpx+KFLHxV4m+5MU4cVnaPjZ3RdvgYuM
         4+Kk/CH+Yomh0JkR3K1TzIKfxt+WHyiiHyWAyaOL8hwfWCrKBnCOH53FNjUrqEZXKV8A
         KabwajUh83MFyJltmoAEmVLBFNKNv5Xhq1iNpqQJ7ihs9bYb/JgMd6caxffeV3+E7azB
         U6nBEo5SoyxTS9/U6ZXra5QXkbfFqYCzfBVKo0FsIvtUdTX0kVvogK8wX18wHcqXF4ug
         5u///FAxcO2qjSVV3PgwREjJp9yxRwYVCVZ+RgXjB221Vp/zmSmZmHnnElcUecur7jtx
         SQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865637; x=1775470437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=JsJpM9IWl3U5JxRU4Fp6SSAYH7eQ5wgndA8Pxm5SY/CH2JHXNr9tzq6enUkEWHyPfm
         NAMuSVepdAQtf2ath0uQB4ZNqR+l/BKb2ffNtDTwxFxstKH+SdpZt4NE0DHGGuamijzd
         0+JL6HRKzwO/QSQe+6R7DZj7lns6ArDVUCZ0zBpgwyssv6vzxUSmrZshgjTXPJiMrcLt
         L+hbGU78g76S+aS+PCmV5fIguUawDGo7ZGdWOiPl7E+YDzqiHq3GMUhaVJbZZsM488by
         w/L2XbtHghbycRnPOWRKO9FgLBWerUAYmYhAVukhivRQ/2bZVNwg1GkJxVKsHEjyRdgE
         r+TA==
X-Forwarded-Encrypted: i=1; AJvYcCUiV4vNIno4dS01DqwGZ5e457YYPZL++MxFPVRnHB5lXuFmBAk2OCxX3XOqDTTxBDQFnwi8mZyr+KVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCzUZAt+VEZ6vkzEHbG+vbRxJRzErtH74QypiOS9k6NVe9gWu
	laCs/ZAIpfd0dMKu1uTq6f22DV5Q5/v8FlnBZhjSDNsm7Mfsrf9c02eAUoQgB+JsUY5CAph91kN
	hUc1odpRxSGsafZuZ1Njq6u3kNzMc+wbScqqLFWVSjQ==
X-Gm-Gg: ATEYQzwGXU7XgJ+3/Xat5mfnqxG42Bd+KUvSS/ni6uYIfjJboVG6ctSmJc3GvwrU3KK
	4G+yT1kM03cAyfvPxl80oq4zRNB9m8sx/rBcFw4uW2qd9KPR/B1vYtWEnsD4v58JEBQwkxmZR4D
	xVWukmkZHhOe+2YPgwOm5kpJkRqiPYWV+J/DcTwwW2AdHfyB3IhB6DV4t08iTzPF8bFruPjG4f6
	2GkFH2lCdCx8MhbqaH5DUCtP17/+PUuu+5O10IxtOr162pgzT57iXZpxBNoHzko03e+BWnNseAs
	hvt0b1ny
X-Received: by 2002:a05:6512:3d05:b0:5a1:3561:519d with SMTP id
 2adb3069b0e04-5a2ab7efbdfmr4713361e87.8.1774865637404; Mon, 30 Mar 2026
 03:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
In-Reply-To: <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 12:13:21 +0200
X-Gm-Features: AQROBzDdVJjqE87T5ud7_fnM2lD6hQfK23pJY5_ZrG8f3bl6KZeUN4yLdyWW2BY
Message-ID: <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 23/03/2026 12:13, Ulf Hansson wrote:
> > Hi Krzysztof,
> >
> > On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >>
> >> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>> This series adds support for the power domains on Google GS101.
> >>>
> >>> There are a few differences compared to SoCs already supported by thi=
s
> >>> driver:
> >>> * register access does not work via plain ioremap() / readl() /
> >>>   writel().
> >>>   Instead, the regmap created by the PMU driver must be used (which
> >>>   uses Arm SMCC calls under the hood).
> >>> * DTZPC: a call needs to be made before and after power domain off/on=
,
> >>>   to inform the EL3 firmware of the request.
> >>> * power domains can and are fed by a regulator rail and therefore
> >>>   regulator control needed be implemented.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc=
78f7cd87b861ba
> >> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into sep=
arate binding
> >>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c55=
1dec50bc78788c
> >> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as ch=
ildren
> >>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317=
d6e659cec9b080
> >>
> >> Best regards,
> >
> > Usually I pick up the power-domain related changes for the DT bindings
> > and host them via an immutable branch called "dt". If needed, SOC
> > maintainers can pull it to apply/test the corresponding DTS changes.
> >
> > That said, I am open to whatever you think is best here. Perhaps it's
> > easier if you can drop the DT patches and provide your acks instead or
> > if you can share them via an immutable branch for me to pull?
>
>
> I did not pick up any pmdomain binding patches. I picked up only soc and
> according to cover letter there are no dependencies between anything here=
.

As I understand it, they are all related and some even depend on each
other. I think keeping all four DT patches together makes sense.

Although, as I said, if you think it's best to funnel them through
your tree, please do and then share them via an immutable branch, so I
can apply the pmdomain driver changes.

Kind regards
Uffe
