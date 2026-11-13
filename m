Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572864;
	b=XBiRNPsHhjOH7ul/n47CTl7RJDeTeY/GV7FVM2zkQnpyqPD+9KD0j8AbuFuWKQJc9LDj
	 V6JLb12+bhe7uzRosM3BQ5Tv5iIJV6gGfQS9Tm2zEfHMwged5Zl3GkU/BPNp/SmNdWtlJ
	 /z7CKcYK6m9gDIrMw1lKXXBVuFdbn1Xjth0U6tE4q0zRZ3wjUvKtWGM9kEmxksLgSp3Z5
	 YBp+rNk/p5l4TX615uT82Ja0Y7QuDmFNsRtbLjmIFni4yq2L+ClXa94/NohQuj9jgbuYg
	 Wtnm6roM7mGqGf69CsAmdSjwY5MHFTdKQ8BJqOWZKGoaA2wF5KT7c1pwhuNJuPHcO/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
	b=j7noWVubs0a31wPTym8PLSd/wWcMncPsCH0+44shrPH4kG2tb/X+eKeZcOObhpqzl7+P
	 kYKQvznHSfxBpRNdIxMC6k5LA8App5mc/HUUZTrG27tsE3JhddSuBZF5ukZwM8pb+E4pb
	 EPgThKCXQ8dQiKbhLWT92bM3aEDcnuNfInAzMpmkkNkU/OjaZ4Ex5E+m1JhEvZELpvyln
	 bFO32Bp98OlgHo61+tylqaFp77B+2TnUqHmOQiXNSgRRJbmT5u4Y1+X2rfQlB77caRVTi
	 M59Rvh/p/SeoZjsjCVrR0T/AhPh+tcrwROHQuX1yrAHu03jK7Xv/EYVu3bRcKtm+q6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32262606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32262606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so215262866b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572862; cv=none;
        d=google.com; s=arc-20260327;
        b=iKs+ziUOlC61s6nkZUzDPpPXFQ35E3dRLbRbWSDANoZbJvGCVAbiZuTaEVreJXLzTy
         FMKYtRqMayC9KXrbRQA+1mel5ai1mfzgciB8gda7A5epqdbxq6EGcFPgkw46e7lMUEvb
         7+wvIBo2PLKxHw2sFD9VDMI0vT9q8TPJEBuZ6pWlNUbmCkly+hU0TxN7X8Bnb0OhEEO4
         zS7dYbtqY/QHTfAfZMA4i9e/rMckGyWvXzbzTG/V1Fn5JjI0puOpgHYExJdjLmMe4FBo
         HN9BqWhDyph7h+VAe8Ihq2LFYKX5IJI9GzyzkvdFw9DkjWfrV7jLh/6y7BgdftcSeokN
         zpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        fh=E5sVziDy9UYgM2SbL5Cc1vtgvDPmEQ94jIUfkFhQ9rE=;
        b=RyWN2xkpTSS0SDH6m5KYlOyy/NMcGHUaT4KSMaV2FN7gFSzGFdNYfIbWMiyN1e0SsE
         HJm4FhoQfUMfcFJEDyvghfVeFWK/y5WSYWIJUi66/hqVRcXp3DMSW6s62cI9oo7x/c6n
         k2g70ESKN09g2J3d1sTB8C5cwfzsc75P8Q3yvyFP3KB7TE7/pgGMiJXf/5AILyLDELkW
         rFpQglIPTCKztsbbJkUUMMHgYH5UJs94gz61Qhac4zrgZJGy7h1FtGtto3jPtWRpSkBw
         XyZgwMSh9GafEXFRa4TC23X9q8buHwvPII8d1HzhHqz9cLLu7/IO4ffeDcAxjzUmYcdL
         +AKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794572862; x=1795177662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=fpPSGCQh019xgnP4jNvjti8I/0AyxGyalkypQFm2kRkMTu7+kWMkCSqT3vZEEI+z2e
         U+eSA00vDHTlcZgqCYQn+e5R7A9Cru19JflQDbfR8SUD1CQPtQ4e54v1VUTgSYsXnVF1
         YQyfHaPezpOgrJhYnKhv2Jp/IULw+bNkPw8Uqnz8g+ucj5EgaXhanvyRmGLI+QfgQNn2
         XdwYa0+NVc770n44qHjYIhgH6QidViDyNfITPg7ELnVGfQJaP+k8TkWoln0Xu3dJEW/E
         VFzbwfAG8pdVpleuiQIzGZ1XdmSpiCQv0Qg+qUHvsBNtBIK5ZwWpvkItqUdiPXv+8A1h
         d9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572862; x=1795177662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=XkSzrMOwiK4UqrjH5qFTIezN0YvDshR/lSFLkVFzhXGX/2CDZFHf6HrrtahvKCbCjG
         ohMq2S3Ob5rqqdNvAOVJCv/r8EQgJz7KvVPrUVyFKdSCYTLogetrUYyZaKNakWJ+npyO
         dKof8L5lxnsU+GJqwj93LEFlPQDYyPL3BHBFPpFkxCnXAXWMtci1V1y7PmG9SX2sUzev
         lq9akmKsM0bd8aFPPF1LiLFZUlq3kI3yy8RRKkzza3FscSzNNWcKn21gp7c0KaS2BgUK
         LtCrU0WVVdBxBGUl+RHSwqjSMRm22V3RK3O7xWEC4u/BZoR4YHv4IldvmSx1ruvks0uG
         pcxw==
X-Forwarded-Encrypted: i=1; AL+hErGJEgdf4h00aqk0SqU2BIk19gxGd2jKPpa6y/SziKYtLD8K0dc1Gm+thtgMOfdn+rZNRZ7MrjbZTriY@vger.kernel.org
X-Gm-Message-State: APuU4Z9auCdsN6MDrqRkQiIo0ikWPAw7h2nFKI9yLWiuzA7Ab3XGiBOG
	UwQfOv1H1RT/LAl3lDGMlwAR4UwZwsi9SKIf1R6V1iAWWsSUXDRIymG1Cw4hFLk9Duvw6lrO7Pt
	nU5CaXrM2yhDGdu0YuD8AOQ0bdzSp5ypZ7h1lQGtaJA==
X-Gm-Gg: AYBFou2fbk0EvefpTMfvvETfm1OUPlm4GaJ9QnFZ7HsIbj1ozH3B1r+mcTT8HNaiX8y
	5iQrCGeCAWuGzV9jUuyocv6/2V4ktQGNFUZlrk04FP8zSGA1ODYcvI2EsofWTofDYaX3wGZ7rgW
	kwtLkxSxhrnEdQ32P5S/pDwHny9oTP3WYlGmHCM4XinYCNEoIwU0A5+pfbkCASBtjBDzs9T408J
	9FpOpe5mBXyyFb4+VfEPcLvobKi38QDzOt7pTOZmfbe/s0RzOi7lL2JQJ7AsGST0XM962ayBn/X
	Jl1b0lkdgvmRr64TLxpI4So5xX7ZMKOG2ar6IBQ30u1qRTli6FWh5Nl2J0p+mD/4+8hRSTUDwYC
	p246gS8YVhtwYghGt98BlABhfi5QObi26NsIxIkuCGV/wnAM37sak7K2pI4QyNouSQGztsg==
X-Received: by 2002:a17:907:3d8d:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c507b3944a2mr522415966b.4.1794572862414; Fri, 13 Nov 2026
 04:27:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-7-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:27:30 +0000
X-Gm-Features: AclHuK-p51p0Vx5xI8MvGi-0HN81TalHpuLQqDi6SVVgi93XmBwCD0wdDg3iAr0
Message-ID: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> PLLs 4313 are found in the Exynos8855 SoC and it is similar
> to pll_531x except for CON8 offset, so re-using code for
> pll_4313
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 3d837bd74355..7b0756127306 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
>         u64 mdiv, fout = parent_rate;
>
>         pll_con0 = readl_relaxed(pll->con_reg);
> -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       if (pll->type == pll_4313) {
> +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> +                * which is PLL_LOCKTIME_OFFSET - 0x4
> +                */
> +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> +       } else {
> +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       }
> +

This starts to feel a bit hacky (pll_con8 register being referenced as
an offset from lock_reg). Is the register really called pll_con8 on
8855? Or is it called something else, but happens to contain fdiv?

I think something like this would look cleaner:

u32 fdiv_reg;

       if (pll->type == pll_4313) {
               /* fdiv in <insert name> register
               fdiv_reg = readl_relaxed(pll->lock_reg - 4);
       } else {
               /* fdiv in pll_con8 register */
               fdiv_reg = readl_relaxed(pll->con_reg + 20);
       }

regards,

Peter
