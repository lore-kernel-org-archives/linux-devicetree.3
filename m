Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE43B9DBA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729862; cv=pass; b=hO9lnRai4aC2NFamHy9x0P1Eq4e/gTXkoQBTaL9hmN7tb2Dqa5fGrmbxAqtmsRr3cMCWZFXBwesZuVDzykeisNch5DtBLTXOyo7YCRBbOZGM7jsXvj3gQzK7labLMiuL8bkbf/544/d992HAZvqjRmKdvaM+/7A+pZUaAC/3B9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729862; c=relaxed/simple;
	bh=iDO4j2JAZZI6/SJz0ZNmXzlln8bKUKTt/Dj4jurK9p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRmU/hqxFxO1SB1TNOmlctpGNThcPmk/t+2mjOOGQrFAfP41EOhcoAwSbrsA6gwibZ5OUqplf0JSMS7O/WTQzfDES76KK8pLUb1n6875Ny/wGx/2s+lU6q22GtsMSspDK98jukcybItpdV2m7Bp4dYtc3oiTbL3UNJ42B7Mk3UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYwkTSNy; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYwkTSNy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso5913113a12.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729858; cv=none;
        d=google.com; s=arc-20260327;
        b=JBHWh/G+p/Q5lTihPAkTv5saZCn2I7FteT9hoCZBokNNDItDDS9fku5WdJSrxPMoeu
         T3k4fapOP7klgW+J17zu29aNSYfreNrhKLomuA44ScpisyyaJsrTB7WGXNWxbT4J1UP9
         AvGcvoTN/O/NfahWrBhW2Y9LmAWX/k7gulAjAyaruKwVvUlIyk7TmvXIYPl7j9Lxo9kH
         X6cqTEmpSFWCbr8J80y6oMiS3w4cp05xvun2oqvIs2uEYgRPZn2TfZt4g6L/63YZUyri
         kiW7kuC6NyOtItBJB+crq3ji4FnONgrlxpVn8Mz5yKEsT0XV/pwpxokuJyH/Hdj0k8xh
         95Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        fh=edaa3W1sEXfCvX+n906TMLU2f+Hz6iujY3HbfL0ay+U=;
        b=hNqFEPuQOLFocIaNYjZ+c6dtYb7LYa4iudFrvpluHKiiZmze6SXDFYWR8N9BQKKc+H
         ITd95KTaXQkcYuhokfmZdp6neo4oS/P9smq3fLBkEW4RVXewyLmpx9iIAprkzqUU6wWx
         +CcrNUWTRpAsW9wjZanwgAp+cu/DDpJUG7NzTNNIbf+4xhDs8/IeGP7cqI9wn4Tgv3WH
         WVcp+fKfTycyiU+phYn+Tte50MuhbNct+hjP4R3I+qCSYpggKnfPQvkqxkYlTpaYrLTT
         BdPallWGX7UqWvQqNZ2h5+55xIgwaYB82lgpF/S+gzk4YGu9Fp9rF4LiNTfsqvqoHDZi
         gxMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729858; x=1783334658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=vYwkTSNydHDJMWhbVKWp3I0A/xVS9T1wUnB7DRi8/z1KJKysqwd0m+tNU6a7mIqter
         81qyJTlFztmPfCOU08vBZ6TLf3KmdjYKvrh0PNSfr2FVMEpPBlvHSPjAII0F5FhongtE
         lCLvfP+yYvcQ+KyYst5BxA5MVAeuPx9EIorhQD0rwKrduR/aEKB9/0Bjuwstj8EjVETg
         I/vsZOnVgQxYvnhMPv0MG6WoNRUdo+TS/wTgAxNxH6TalLxH7uZsaLJ+aajCSxXgfwg+
         htXJAluBwnzF5sQed2QkKuHsFWARL6sy1lD2FpKWCc3OYlGND1J/Swh3ME7e4cXGLQ85
         8kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729858; x=1783334658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=KjIX2ZCt47LnDWwgBi+VPAMYV+Y26Q/cpqFUXJShbdXY28ojc3uE6ST4T02txHXnyi
         nPWdswQ7zcV/4Pg4X/1wFd+7Ktxmxmxd+pHrNb6sae3klfv8gBze2A8f6X8gn3uK7DdL
         qjviwq53vNOv7dDoDN9X3OuuDOwQHdExTgXqM0U5it5X1QW7HiFC7famEDXKIFebHu+6
         XRD6ADC1bRxUtZ55SZI3BcTXlbofH6Y0dgy6ED2j7I0VCTS5J7Pqt8ftko7qgH+JVv5N
         PDPXsdn5pYNQwc2by5elWSRuhTLzWHSqwc5DDOFfx82BWSl/4hymjePPH77cnSmX9dUH
         z/2g==
X-Forwarded-Encrypted: i=1; AHgh+RrBXaoWapc4sE3CrsxGkQqgUHOUCrGdww9Dqaio0IsFOfEaEQG6zK+OhsnWrPcen8pqLTgBCeQr+KDt@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEe4flOlsC0/+GRaWduZYF4fbUo4yfIFdpBK2bq+GJfTRc85b
	ssR2zCKKvCsvdoUuIzbSHTB4/tIVrQoHoBGOJJ76dr/nhDBUrpHjAzC0hI5A3GZ3uVZMBXA24wn
	bIpsMS2FBcJJxvCr/gy/ta/BA3wxqwTbzeqnf8r1Nzw==
X-Gm-Gg: AfdE7cmZEr8R+jMNIoBI8R522AnwcUi4tX1W2ZzsWAkQhotZc88eBqMi6gFuG1qeBb1
	fMVDqKIGcbh3zADfWCgudK4YfybmCOJ56B/5XOV0ERLGjmLzwDakV7JC88iaRYjl/kdqfvziXqr
	wQYoUD4SQ37ZXq/4jFA0yYB76NmcArH0koLBgJ5+zftCwE1zK/kSjxR9rc0+ZGIyIeNSHcz7r3N
	LOjeKNaKGCohrmmXWQaJ5rJfPD2kknDSbE2sx7qM7yN361C5B9/kiwETz9QhXVJM6YWwnzWIxv2
	yAoYXJ9RZ8vuNvasLZWij/iFevS2tQ==
X-Received: by 2002:a05:6402:400d:b0:697:8d48:7fa7 with SMTP id
 4fb4d7f45d1cf-69810ae01c2mr5980595a12.22.1782729858308; Mon, 29 Jun 2026
 03:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:44:05 +0100
X-Gm-Features: AVVi8CdUhgADG2xSK96hAWTQ9tVWRhtK6fekJr5xsrWPfeyuxnqLTd7JZu91VDg
Message-ID: <CADrjBPrCKS-_FSFaL+124cdRioGOEvk+6HFfrJCGt7HB983rGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
> Management Unit sub-block and update CLKS_NR_PERIS accordingly.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos990.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 4385c3b76dd6..ee3566b8e57c 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -21,7 +21,7 @@
>  #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
>  #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
>  #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
> -#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
> +#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
>
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>
> @@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
>              21, 0, 0),
> +       GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
> +            "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
> +            21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
>              "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>
> --
> 2.54.0
>
