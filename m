Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E32342510
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712989; cv=none; b=ToSqdYAbOHe938ghmHN3cXxX5N9L432wzvwY6/BO7wGMt/GTVcLHbZSnIeDKv1a/N/J6AtTnOK5EryHd3UGbBagxBgcjaqy8Ry3S5jf2DCC0MtPQI+6f7HKqPbsscNTflQ0m5rtk5jsZP9/rDKlJOIEbArMoAg9ySU1nnzYM0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712989; c=relaxed/simple;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGwnSL1sA5lbZEXbNYTsCJk6jembRux59cHTCfQNl9uSDdUee9cSU6LzEKFTjsOuQvfxOKcyFMVshUdUxaZ1uTrxw32kVg4fPxoYFnSPH5plG8b/o16wpBGfRyOEVx2Jy2dKYakS+92blaQEXP/CaSqC/hiL2Gcf5k7c880JYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT7pbhgJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT7pbhgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA339C4CEF7
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712988;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=BT7pbhgJHrUlPKuXND5uPgvoYSAeRgx+7oj8RT0jmWcENZS7/PS5Ig0Bcezi1cDj1
	 TPjMOiV+EwsLGQXA3CwgMuS9nXiQMT6mskhhdP6f+6FazW3QvO5d4TMMvCYZCsAb0t
	 c1/FyhYuzkW3uhuM1fFn8GYJWlFhXKn9W4fFMUKnQzGPt9bGMi0eyK0kBxngzT9Ls6
	 JxeQXzbxwItSeyL6hCyNHehCZ5LtT0cKis3K2QNQCHESoNDR96LrJW8iKb3hi6a8ZX
	 VfHhU0I9yNZ4bXrBawByHGVr2ugzYb3FSBKa6u+17A/OEPx9/40t6nJ5Y+DC1ifB05
	 eKdD18ohQO0xQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b93698bb57aso570551566b.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfhK+TmtEU3iJ6Nzw4ZpyHbfRYZ5B3IB00mVpH+TdMccrfjacBstIY31uWGucEuHaX+rf3REhqWYHl@vger.kernel.org
X-Gm-Message-State: AOJu0YwCCw1zqF8JFnNlqbmQbJCpxQSHPoyFCw6pChoiOTHxh+8lVKbB
	AOFUr36nknfeGsKLgfVer0bf5/db7lU0eOAPPeV8tmpj61acAvLuqTcQ9SGRKBGi5uLIk03F2au
	5tTgXlCIoPx7EVN/rx3cuDswn7hGm0dA=
X-Received: by 2002:a05:651c:30ec:b0:38c:33d1:dd09 with SMTP id
 38308e7fff4ca-38c653f91c1mr24155731fa.10.1774701616378; Sat, 28 Mar 2026
 05:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
X-Gm-Features: AQROBzD9uvYPfehFAvfWSqRC7-wZ99UgUGl_PBhFagiwx6384R3sEI_1rOb_K7w
Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
> of its time storage and alarm functionality. However, its internal CCU
> is different, with additional DCXO handling logic.
>
> Add new match data to register a new auxiliary device for its CCU part.

This is probably incorrect, since you aren't actually adding auxiliary
devices. It should just say "add a new compatible and matching data for
the new SoC".

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/rtc/rtc-sun6i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index b4489e0a09ce..a58d9c6b917c 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_m=
atch_data =3D {
>         .flags =3D RTC_LINEAR_DAY,
>  };
>
> +static const struct sun6i_rtc_match_data sun60i_rtc_match_data =3D {
> +       .adev_name =3D "sun60i",
> +       .flags =3D RTC_LINEAR_DAY,
> +};
> +
>  /*
>   * As far as RTC functionality goes, all models are the same. The
>   * datasheets claim that different models have different number of
> @@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] =
=3D {
>                 .data =3D &sun6i_rtc_match_data },
>         { .compatible =3D "allwinner,sun50i-r329-rtc",
>                 .data =3D &sun6i_rtc_match_data },
> +       { .compatible =3D "allwinner,sun60i-a733-rtc",
> +               .data =3D &sun60i_rtc_match_data },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
>
> --
> 2.52.0
>
>
