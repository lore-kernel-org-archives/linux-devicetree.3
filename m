Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com [74.125.226.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68833B969
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953332; cv=pass; b=S902DonKVKbBKYhfdqngAggBWM26tgAvag2prnY6U6b9113R5LWebfFezMA7I12fMY4Jbq4jF1uSPUdtppwtGqqL7oEeorgMUrSIdteXcX87DAPVpSPuNQowpWuonUJ5vFob/YLuIiXsc+dijPjxkwVnr5/3cv+CWOC2RSB2P24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953332; c=relaxed/simple;
	bh=Nihuo5Y1J+JNGMGXPcGfvABsTM685RdMjow6I2pzz/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoZvdmMKgYTfxa2t6B9VLagkRae/L+hpVCEI559ySFz+pmylOy12rdyPJQPs4tMFtEhddAgA12HZNM/U2uu2xafL0rT3Ax3dfdTZGzRnnVwG2QEYKRZhdE8FCWo/bvtWjq3MNPTHLONia8coReDyeiImwuT0wnKAgxwGYTapU/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZ1iw2Dc; arc=pass smtp.client-ip=74.125.226.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZ1iw2Dc"
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98c4fd66c6fso133822241.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 08:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953329; cv=none;
        d=google.com; s=arc-20260327;
        b=sPGf+p1mmTmoTLsqi1dG23RhhewV2B8biWw+Xna8kvECsT0Wh4J1fty961qACVMFJH
         Lspv2O5+kLmL0AQ3C+E+LpLg7ZE77QTAAE6oq3qbx7Kt6qxP8Br8J/PdJNHSDz5G5w2k
         5p+jUjVYjWlYmwwS8BlZRaXFAO88BqmDpqakXkZOjDXs9VXiWrvh2JkXWEWtuTJhvsR+
         0VFRlLo4JjFTN6Q19yLHlE8LLwopp1rXI7Byn8e10TmCXCus2zqV/gXHeq6wVg54qtKB
         H6LqpZ0cNCdAuARc+a8m0Dg43rAi1tS4QOSriPwAL8g2Pp+dEl+BET9LSfglPNVOnXqE
         ytXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        fh=/WY0QTf5TmlY4ZQlza7A/clC5qijMhQbExbd9cAXhCU=;
        b=gxcS2lWf6JewEkTPLTYmI4JnilwLi4jkKSpE8dSzDcAlQENtkSijxbqvCfLBTx0Ge2
         B/UvrMRGcsTjO/p6dmVSNfmlnyfzNh8+wyRDsvbDRARMHSr1NkIqktgI2AkW07bkewMW
         GYp1MBHSBkESBLtgPprM2hjslIQGqwGvZlX5sDrWxzRMUKiMyAdY0PqceMg+MALdnrDK
         FL64KU24v9F2Z6uSfKnWlM5G7zzina8qr/W0fZHTr0590/RA5ejc6Z7z5PoqQHcU0U/6
         OYnP5zMNsCsJU147Noq2z07lfu00iirLyBwRY8b1CLEQ1HVhLCbgWkmZjaSOi+lQ/0lU
         hVsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790953329; x=1791558129; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=nZ1iw2DcbFCIXrvS9PhsOlB4jZHj935CKxY75sctKg1izARnvVxWjMZmR1gf3SV5qk
         vO0CaXSlYq3sn7SLtRMXxw6wNoKP/TujZLSH+dgB85YNKMMWQA2PF/3ZLT1eNQ9bbkWY
         8ifu3asCjqzjFoKX5XZBydwgOxjOE7Lxx36jxo5CaY6dscX/Fkd5LIW4u4QJYQmnpyWQ
         NgBO2pWhGLah+hjsL74HXSgClQmqUMIPhK5xz4svr2nyj0uWj/t8Lp8XIcRm88F05e7/
         pKjLOUNPKFPX2uIsKk3ASi51Vpa+43pZDWh3x2Mt4PELC5LJ5jDgi/osEh+cac1f/hqQ
         deGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953329; x=1791558129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=DjDdlAXgxA/qYl7URany7zXkclXwNq0vartmRJaEefYE8NxYuHfLPj6YKYofTp9kim
         OXt6wSZ5/uP18687YCnP1Q+Vx+HonJiYaM9cneb0WSD1AP2zuNWjQpUZGK1Kda9IzbdZ
         YmmmbnsiZbDzOXl1LIRXPLOIwOfwXNvDqe2t9QDpUxsKq21XgHNA8M+sfNm9TxKycU+1
         5PCHxpSZvNWKg9OUgYwaRZtbSz8DiMyLvLIxB67Ekp6PeSoQxSFvDFDb9KnNZUwhFbXT
         He2yUYFFzb9/Rjmhp1vA8z1yaEulrhaN2/toNCLY790pVjDqRK5iTpTg+8kIF/oeaVh+
         fDuA==
X-Forwarded-Encrypted: i=1; AKwUvBxarNpbOoqShJ/OvbCUKVQPVKoHX6eSGJqh+x0CrYg1+Qh9rIZ8e/rarIz6DkiwEbrsX/M5VGJdL3o9@vger.kernel.org
X-Gm-Message-State: AFq9FYJH+nbHppV9NcUO6elzUMuHPd4nIPIOcORwvYfD8rYeq/GukJPf
	2vxfQIPJka9OcMBA0w7opfhU2PAoHfqOG0SYjGgB1D2V2XZx+9fsDIQk1eJ3pEvLXuE5Y5EmFjo
	qb2XRsdJpTx7WudhoBSygX4jvnoYktimblMkl8nB7IA==
X-Gm-Gg: AYBFou0n0DglaYTw7lgfYHJ+krOeFcfmAgCD4j/lmhaTQd4FAyY4RVGPG2vasJx1rQ9
	mlelmq7XsXbrVX5bZPYmz51R7UvawJyzeShdU1pkKn9Trx5JNbCLtmvT6SZGl7PRyTWYMylQ41R
	hWsnQ0YIh9335/VYTlNvQfeMaEiBqvm1IyO1Cm0br01Mi/E+3OKuna77oBo1ffWm04O1lgVb1S8
	9xlB+VodHh9PJc1tqx8SiKsO+yznHKYNvBaBLIGRHI2bnJw97sNtHhMhMPDXlsYUJKNLNFKFOJi
	E8H2ctAEQ69PACmhx3LKcSF6qsgG34ENMlg8Pdqvx9FWp8kLwcZTjgquN79wQKibLcyLay9Fss8
	=
X-Received: by 2002:a05:6102:80a1:b0:7b7:e1bc:b070 with SMTP id
 ada2fe7eead31-7c0f5caaa75mr904078137.31.1790953329113; Fri, 02 Oct 2026
 08:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150943epcas5p1fb1720070f2bdca2c6cd32094dde895c@epcas5p1.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com> <20260927152738.3673504-2-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 16:01:55 +0100
X-Gm-Features: AclHuK8ij08G6Gr-EgDhgI61gJxwT1zt3h2boZhljCMfEb9c1DxgDHs5LAOtRr4
Message-ID: <CADrjBPrXYX4_d9dJ=SUqHf-eMDyuSpSChkuTsrPHfo2ZNh2mMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as from already supported SoC
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Small nit: If you send another version, the last sentence could be
updated slightly for clarity. Something like
"Reuse the offsets as much as possible from already supported SoCs"

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>
> *Changes in V2:
>         - Fixed Sashiko review comments
>                 - [Low] watchdog: confusing reuse of CLUSTER0 macro for CLUSTER1
>                 - [Low] watchdog: space-based alignment for EXYNOS8855_RST_STAT_REG_OFFSET
>
>  drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 7053963fb0ac..007c05ed2c7b 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -58,6 +58,7 @@
>  #define S3C2410_WATCHDOG_DEFAULT_TIME  (15)
>
>  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
> +#define EXYNOS8855_RST_STAT_REG_OFFSET         0x10
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET      0x040c
>  #define EXYNOS850_CLUSTER0_NONCPU_OUT          0x1220
> @@ -73,6 +74,7 @@
>
>  #define EXYNOS850_CLUSTER0_WDTRESET_BIT                24
>  #define EXYNOS850_CLUSTER1_WDTRESET_BIT                23
> +#define EXYNOS8855_CLUSTER1_WDTRESET_BIT       25
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
>  #define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT   0
> @@ -281,6 +283,26 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl0 = {
> +       .mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl1 = {
> +       .mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS8855_CLUSTER1_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct s3c2410_wdt_variant drv_data_exynos990_cl0 = {
>         .mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
>         .mask_bit = 2,
> @@ -400,6 +422,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>           .data = &drv_data_exynos7 },
>         { .compatible = "samsung,exynos850-wdt",
>           .data = &drv_data_exynos850_cl0 },
> +       { .compatible = "samsung,exynos8855-wdt",
> +         .data = &drv_data_exynos8855_cl0 },
>         { .compatible = "samsung,exynos990-wdt",
>           .data = &drv_data_exynos990_cl0 },
>         { .compatible = "samsung,exynosautov9-wdt",
> @@ -723,6 +747,7 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>         /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
>         if (variant == &drv_data_exynos850_cl0 ||
>             variant == &drv_data_exynosautov9_cl0 ||
> +           variant == &drv_data_exynos8855_cl0 ||
>             variant == &drv_data_gs101_cl0 ||
>             variant == &drv_data_exynosautov920_cl0 ||
>             variant == &drv_data_exynos990_cl0) {
> @@ -740,6 +765,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>                 case 1:
>                         if (variant == &drv_data_exynos850_cl0)
>                                 variant = &drv_data_exynos850_cl1;
> +                       else if (variant == &drv_data_exynos8855_cl0)
> +                               variant = &drv_data_exynos8855_cl1;
>                         else if (variant == &drv_data_exynosautov9_cl0)
>                                 variant = &drv_data_exynosautov9_cl1;
>                         else if (variant == &drv_data_gs101_cl0)
> --
> 2.34.1
>
