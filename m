Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35A2DCF55
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334197; cv=pass; b=g2kk/u7CMJguWrzzRQSBBrHX+rdjnCOf3Taf0Hb6QmzyucvnW2jE0I6f8sV8wZ9P92ghnvJwzg2fZdiOeeknEvdPSAvgfrBoaNTuuqAy3FPOw60gkqD/A4DKNBZNn5JblhvTltDZjCZrEcd2iPYwdG5xw4Cwt9X5CNpOUVe8gns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334197; c=relaxed/simple;
	bh=jibWeNECBJ6nGuuVGpXMaJ411vpC41Hnyp5ZlPjaFrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sisbc+z5zA2w+UkUiA2KhEO6gHVUDaI1YrtQW2At6kXsG7zstm5P433MY7ZpNARoR0+3ppgsRO4Ye4M5jq6151TKgtrmUHhkx5YLKtCTHXww6PLer1nsHZ1y9wY7pwc9SnOUqFtSmeiHlHiDHP9NQl39brRs8FU22WXli0oPuGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjL8i6Tg; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjL8i6Tg"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab3d3c5761so13422047b3.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 17:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334195; cv=none;
        d=google.com; s=arc-20260327;
        b=V4fgCQk2jrvUlEqx1DPnJjCg6pnMEh8QFcdAyXWWVRmEh169JyhfREXtwyFn1h1t5S
         R+nxmNYnPzKPwmW5ruTTqFlwL128KwjplQ98FSP+VNg+UDDdi6zaF+PI5Of20ZsskF/1
         vc1UkGQ9r55KbXv+eQdpcTwBU/pl0S2B2XsMa/u4+fEUulKnWm2IbU3Mp5WySAisdrvB
         mZr7vthyBFjZz8vkoFngccXr+575mbdGBiS1aO3h9WR44BVntqRkqhbFd+ug1VOiAJc5
         8WsvCRZDm+2Z5Hy8DbhuahTiwioPURJrPIFC0UhgxKV/cLfwkOil3NwiaJrVO3RF0/9y
         EzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        fh=2Y9Ng+1BHaMLdKXa+di+JmHAODACFVkediF+IkF9JXI=;
        b=EO0k8WPETeoPVyfNXsAEuQ0SMZFn6W4xegHnacVgct8lj1qmKMR6IlRipxz4a0cRCE
         p82f4mLARBmTNmkuHQlA+EniQFPEjOh6b0KU61+kZ0J7YJJqtCyOkYod3OXdsUDD0Y9v
         ZEqiAxRTP5g5RJ27cCFYty185SyjZDKFW8wtNb0dpmcc5WX49aWHKZLmxUYhgP6gGBfy
         KIq2blf4eAKwBhiJ1fquXaQ1siooJ/kf9KOOrdveH40C+RWYmlqHPV4a79S6itPee2rX
         z6lXNGDp552abzZJBG2Lei3BNWuCmW9bZs6nQ1DEhb+hqclVBVdu5baYrG1DL/5OMUvT
         NoPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334195; x=1791938995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=QjL8i6TgtAjF4wRVO56FVrfHK0ABEELBNmCB0IwMtSycsCrADIs3aK5itKSXyK94CQ
         fAXkGoYnepDWarPf7Ey5mwLC5LdBWCH/WbEMIz1qtYfDsniFZLxJ4dEp89xhxNWML3E7
         1znmSyX/1VnIjWkBX+F6IswLM70b6ffqlK6/vQZtF4D5wdEPah/Oa41R9ZTnRR82iBRa
         oYMxDW4ARR5Z634FBE+/LWz/QG6viSIT5Ul/D3D0I3HBio9aa4IwuO1yIrDfvgUMLldz
         lfzqal7L0BBGnckD6CKlFpHqgg0hbYrxVr2JEAo7ySNoSmMHoSFn+z5fsMtyKQqzvxfs
         x2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334195; x=1791938995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=t5jy5HgK6ebuyredXg7v6joDbfJ+qbkldDYFFjKb2eRj6EyLXTzyr0EXP8o0qdgu9j
         rIS6Wezx3G7brHDIljCUgzOY0WpKgJlEFpTfKHh0RrJOw4ZVq1DGMrAXkDp+lGJrTW5V
         NoL8B8rYaWy89GjuGWjDT4/eZ74dqFAJKfTeFEkqHBeiCXREc8AYB3WpZGv5+MygOB0L
         a8YhiCAqsWWrkn+AVcgX1rOEqEr7nf8ssDiek9UGLsNQiMpsBdJiwd6Kc8pKJO52q6xS
         hH8N6pPcZzhPNWi78SLp/Gt3C+zn/mTYndM8WuMFpctEiWTzvVW49Sxm8vqoktRIus9g
         GyBQ==
X-Forwarded-Encrypted: i=1; AKwUvByRvwqfBcZLAST8gJzM1/iB2yqNkkRIYiye6t8ut6IbNV8EX0csUF8kclmBcEdbm56JKvKObS1ray8Z@vger.kernel.org
X-Gm-Message-State: AFq9FYKBqwEEUfGGQ1SQ8m2jumLZ68xW1jqOZm0XVfmgL1ogLBro2ZlH
	13cggaLLO5k2NPJfd2U9Khm+4e/280bC70PbqN04YSaHfL+ob1fH5EFPjhONHZDsL479HUanl1S
	AiqNEq0XqGnwdxrw7Bdx9Cnv/3sk6HKwrMkCfjGCnVg==
X-Gm-Gg: AYBFou2ghXrfr6imLt9a4M9a8p0qG53iJtwZLJ9VxKCTuGLuFhiEWeQYE+0wnNP912d
	Ulu6CkgRMEtP11c1zirBZxxp9Aj4dHAG/TQ2WqIZfPzIUvxD/QxpqDxC+ysqWTyQLUX8qiR4V9h
	DBtOTZXnhgL600RTULM4gPpLyK1hCW+DS6loCwtPxp/6NM/LHDmlKlgZgbLbJYldja76kG/eVks
	Szj8WImRDT6LHpbUzOjfV/QBjxEKpfoocW2xPUuVKi55HTFRO/z2/4bAbgxVqOtFxzaL2jVGjNY
	ABQFz88ZwBuUH1z3tI+8J3CFm9TN8adlSxNyAPE86NMGxtLuO1YAFd/bCfl+teU33ugC/0ebdYQ
	1uMMChGP8QPsgDt8=
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id
 00721157ae682-8b05ac458e3mr9173847b3.2.1791334194577; Tue, 06 Oct 2026
 17:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:49:41 -0500
X-Gm-Features: AclHuK9KAi2YbRrGI4BgLSa88-aMtBCudk5hm_jOIiAtHKuwiCVmb4TkmJdVAQo
Message-ID: <CAPLW+4kQ2M11VbUBkr6ktjfRGRnbdUWRuOK=ek4-3MJxSwGPAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct =
device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 =3D {
> +       .initdata_base =3D ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name =3D "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 =3D {
>         .initdata_base =3D ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name =3D "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] =3D {
>                 .compatible =3D "google,gs101-acpm-ipc",
>                 .data =3D &acpm_gs101,
>         },
> +       {
> +               .compatible =3D "samsung,exynos850-acpm-ipc",
> +               .data =3D &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
