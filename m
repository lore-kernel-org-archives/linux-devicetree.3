Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54333349CFD
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216520; cv=none; b=CZFRw0GNTxAWZHejUw3YCy66BSHx1suqFmTqjBy+qynk4o3EZ3L0w9tMzuauHpjJk7Eug6sQfAqDfOgkGVyh7LoIB37G/S/0/Yiku1S2g+n5L8weGX54Uja8MRaJlNhO9h5MP3H0ZqmmMclJQt3H+KKTETvR82uDzkOMqHssQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216520; c=relaxed/simple;
	bh=4H4PumMFOkWTL8QF40HV7GYJCLyqj2M1mR7XH7UN8l4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF2B95gYWAqvwb2bf4bVG+esX04jKU7j9R+FbMGQHIa8h6ATT7jc4wOzUadVooHVbyz0iBUuCgHNLYrKAHUJJ1nznr9dSmYxwWkyAK0Qc3SGTXA4b64OURrvWftIa8J/9zpUYUo422+M9JWuf/cH4tl5eWFmEcW/e+qqM1bU4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUfnqNsl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUfnqNsl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0584ad71so281287f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216517; x=1792821317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyAOm2K0XZGAzKdD2fYYYed+loFddeRK4BJxeSnK+7o=;
        b=kUfnqNslcr1EuMTkiq5jDWkcpDyVNq258StXgmZlxbz7s4wvo8GjtG52NhhxllEgKq
         YMJHOE87hL/hRZTp3IhORgu3f52L1A4FZ3Z2+qRfyvQh5xB0I6QxaxHQlUkxs3c76Ajy
         MiVeacNpRvD8zfk+CzPSxRYgFR7uPzD3nobB3nQy29lGvHCVxBRZpqztBbarpExEvZjh
         7XvtQjfpuFxUvcLpKjN5sb8U5UEjT1k4PhdfRs4BcUgIbxAFufSsdRAahXkOfcanYgwB
         K9UUIl/YfNYQYxQfdvTC2poYnsiyIMt5HFcVjkWj2/7QXTb2vcK3o30XH0r/mZAHWx7U
         pHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216517; x=1792821317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyAOm2K0XZGAzKdD2fYYYed+loFddeRK4BJxeSnK+7o=;
        b=E0IgOANgqrVjIcR7FORwwY4E00cqqbrwo6pRQS8mz3wS6GKluVwfCFTUvNx1wvxI4e
         anprJ9iTBRKLYScJdExrNc7/9YXUnVaVreECnKqf2RnsjoJbJtzWU4AMQ6fkH1HQt0Eq
         yu3IECzuwczu74An0wT/87CrKsaez15tPM0j7k2q6anIQZWy5/et/et0YJOV/LFNO+pI
         1DWF3SVzOjsB9otqhUeoyL7fMJEoJRS4VcPIeThm6ySz+jtIoKBHOVbwvBQDe69otDQB
         yLK5cwZhByNbiurFVjX4sBTC66GAt8/JB7gIkoLwxpY9uiB/ZpG9S2PwpGJPMrox9neF
         5g9g==
X-Forwarded-Encrypted: i=1; AKwUvBy39YaNF7RENCcDD00a8zozhMb55DZ1y5ymnzf8dAlGql693hQ1Q1BNIv1X31cXD/t2ttpdq9HFmzz2@vger.kernel.org
X-Gm-Message-State: AFq9FYJh3Wgj+1RhZ6ccuI8uQZqB3bt00GjiA2+cQMusfpPNBgxHHiR9
	S8AE/nvRc3KkMN4acK2cID+yXheAdFNWsmgSfvLA4Pz+Zhc46Ce+NXCk
X-Gm-Gg: AYBFou0kXLp1vww0QWngmNRUjF2OQh3cHlDjXmhJYEDurqkeYWVDV0WkZm4K+4Zrmqn
	djYiliTZbsxqXvj2trPPJay3jvPwpYFK16cUz4m3Ub/chpRHU7ri7Ez3ALiWEZvAGRlfR8/F/ey
	Ao2PPMTlLuopWSve5kqO6K6LleNXqDhQV7BACvcFFRQYD1crUMyN2LnJ9DoqRX+5uNMj8zVS1Bs
	7o0+icGzX9YAsXmi9pAXqLatudZDeZoJIHJQnsyB7pSzYLA700pLGNkQVoGSmcIk04aN4VZsvFR
	CweCltXMI775bmDWs5TtKhE9noiTgEKoqCq1+/68wM1721VwwGcZbLXqCcw7BS1TBXNHJj+ytv2
	/EfC3r6X8SnNygZQgtZRaEjllO6k5ReYa7SMJJ2cK5GWYxykT9UHoD3I1RDDg5C/wTnWVoGROzA
	p5TjKvizYG6xQALKIZAygMfs84Y/hQ25jBh44ERZ8urlAgHk711AQylNt1rk4IJX/9pcD8tqbwN
	iDSucZTm8B9DtxLwlJX0ZxDf4zPaqgCjsTs8bm60QG8QJI/X5Y9GQHKU1h8tIEOfozxDKgLPqRg
	+0/xwKirKX4WEGL+mvmfJ7d5lTP6dKrWz61WQhHclEunJi/ZFHEdElF1hLthOEjz+3aYK+MXJaz
	0mxmvntuKr2DN2rznX6UPW+tuAOrt2Rhd32pdptDExyWqJLqr50+baPu1nGDGzLIpmb1J
X-Received: by 2002:a5d:5e8e:0:b0:48e:932:af01 with SMTP id ffacd0b85a97d-48e0932b079mr2213957f8f.31.1792216517468;
        Fri, 16 Oct 2026 22:55:17 -0700 (PDT)
Received: from systembl0wer (109-81-110-61.rct.o2.cz. [109.81.110.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm10443937f8f.19.2026.10.16.22.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:55:17 -0700 (PDT)
Date: Sat, 17 Oct 2026 07:55:13 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v5 03/15] iio: adc: ad4134: Apply reset recovery wait
 time
Message-ID: <20261017075513.3a959a6a@systembl0wer>
In-Reply-To: <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
	<9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 22:57:08 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Add a reset recovery wait time to avoid any SPI transfer from running too
> soon during device probe.
> 
> Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> New patch in v5.
> 
>  drivers/iio/adc/ad4134.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 40b27b01f126..d555874b4959 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -442,6 +442,7 @@ static int ad4134_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(rst),
>  				     "failed to get and deassert reset\n");
>  
> +	fsleep(AD4134_RESET_TIME_US);
>  	crc8_populate_msb(ad4134_spi_crc_table, AD4134_SPI_CRC_POLYNOM);
>  
>  	st->regmap = devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
