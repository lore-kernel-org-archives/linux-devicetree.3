Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE73B52F8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761533; cv=none; b=R+vY0n/a9fW+zFjdz5nbm542qTPqRwjSyrEDhhwLWceMtf56sEt5IegrcDlKzb4k19c+MP21wR/t4M68tjrjY1bQAkjzFtFQmapvI3XF/56jUykzUwnGSRara2ctyb+tmyFQWmdMYFeOI/Wf3ZcEv9RNv4HVT/A7vKaAb7Q0E1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761533; c=relaxed/simple;
	bh=9n/49c355Yjo7co7RhyMpSztpBFoVYDbvsKmMO9oZlo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EDqLh3+W+ZxD6R2kEuiKyCXxQExWgA677OqA7bbr+hpVPPuCFFx7FJhCBrmv4OgRnceVvT0UFcHof1XhZOhDZw5mbmTlM4fHHljlBJLQmwpzk24npTbBCz9c4QK4c9N6cJA5szKEL1ihZwietnR+4pqLEoZ/RFIRYfWtbF/6two=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WaKSFn7d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WaKSFn7d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so3005328f8f.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790761528; x=1791366328; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LgbFwFf3kyX27WOpLMv6Xb6CpV1FPVf/xdu8hGwwUVg=;
        b=WaKSFn7dkD3+eVS3BXJ3uWQ3kGXOyYKKZhx4HES1r6SOPKXaXx4HcYHR0vaKYhb6qy
         j6TyZ4AaviUkIbUR5DExcwH+xZMsd+CgQAaPNU+r8HOxFHBTTZQgTmpf6hDugbC6YT3f
         4xH6GVUhPv/VYoWj+yx+NY0bDuxBRTTQtmnhzjV1NH9E7W1fBY4O1iA5ZGR/W3ia2r2U
         gPN26IG2jHqkdS/S2ZbqFSiwIULtgm9FtXXJFuFflw94Ba6iZ7f7HaIIwE5k2vaOz3/T
         JS4eGY7RR7RUaj2ZtUH0GLe25VMcOy0fkLeIJBuwSg5d0S0Ae5lt/fQEaHquV4r3VE54
         At5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761528; x=1791366328;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgbFwFf3kyX27WOpLMv6Xb6CpV1FPVf/xdu8hGwwUVg=;
        b=YepNKAm5PQiOF1yMmHV6Tqo028x51618h2Tv0IuLIhIoBiRNkdoHYLQvn8wGP/BZwm
         oMHMfVhPa8Vver7QQPZAyXy+IWDcL+Efu1ZeOX8/hCqWcAgT6HMjS2k5CHDiEehJi8vK
         /S20ONeCyS0tKBHyspuQew+DYVxd9nMQbMA7bVYLdCPS1Gp3ijDv6wBJHbfAFfO/Ro5/
         nZMZ1TrPoeHCQTTAOdFozU+1XwduEeCDSAnDSbGIpOV+oPDIygVUqgXhqpfL74lU8DmM
         6LTHl5Rmj3j/Gkrs7OSbKFfxiLOBqw4KehWztJ1Eh90p7MWTTofe56vK9hePBAwPp6GG
         MWFg==
X-Forwarded-Encrypted: i=1; AKwUvBwaACYrKuaKKL10Lk7qBPpaCl8Sj9v6mP9Uoqx6MtbM0ANhj5GGzdNhqIDCy6P1oqHeNpTu9itHTAwL@vger.kernel.org
X-Gm-Message-State: AFq9FYIayvZbiUMQNBZCLFjt/xOHrYtRar8zPTZILj9zI2JJrkxvAcra
	IDj/c4rosbacXWsZgcM0fjO1vAPmy9QbkDm04OCpFmuIK07n4ZSU/DmkJMYEXWQ098w=
X-Gm-Gg: AYBFou0P52guFBD3Lx5yRsSY3gyVFMLBogKsSFxLAJsj5WDhpF4oXqVbBsikH/q9+Pl
	3GvoXeLmlWa8MVMvgdkqcohXCF9wFvSn7STIaDBL+B1xVHJetFD+9B1xsaIjo4fFEtzDwDA9Smr
	DnPNFtb5wgDlXaH+YHDeUyu22H4HnvHVw4aRgqTG6gcicYX7LXXyREF5uFwKvmo204MomtRS4aG
	ZDAJs6rzhntcxfoNjSbjNa0kJj1oKABVluWg6fB9U62RZ/6rOZlpDYOmD9tXSILsGluCEJmRIBS
	BSxvCi87K/jtT1To+bBsU/dEqLCkMr573J34/rIehjkRvQIUghVCr/xtokR2JH+/rI7eV4uCv9A
	9ZQ6EHu9dzkOpVOgkngrxFiHx2KDkRyBBd3KVM0ypTtnZTox25RYuVozcUf1kgk7jjDf0d/nug1
	HHcGRBiwfap7DBj6poFIIn72xAgy0cr3NTTgATgYOAw9ZxoH9QVbxcAPrHF1v1I8bKZoJaulCih
	eZq66kUbusEwVOA4K++pW7InpM2
X-Received: by 2002:a05:6000:388:b0:488:83fc:a7d1 with SMTP id ffacd0b85a97d-48b024bc1b2mr2035063f8f.9.1790761526270;
        Wed, 30 Sep 2026 02:45:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949a4fsm2230406f8f.3.2026.09.30.02.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL
 clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260828095608.19955-4-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-4-changhuang.liang@starfivetech.com>
Date: Wed, 30 Sep 2026 11:45:24 +0200
Message-Id: <179076152492.1471718.9285719072832956935.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9n/49c355Yjo7co7RhyMpSztpBFoVYDbvsKmMO9oZlo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl7bpnekiyczmTo6/bg+JMI3hmqZyqUAyV2f75axaLrf
 kni5dySjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkhRPDPwXFj7m36+u+zFmf
 u5Gl2p5/z99LXE+fHP27rEequVUiYCPDX/F/Oo9VXMwfmix5t/jg08xHCe7H5ly8afSKceqPPfp
 6W5gB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> Add peripheral-0 domain PLL clock driver support for StarFive JHB100
> SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 60 +++++++++++++++----
>  1 file changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> index e23365164497..f6ebaaf5aa18 100644
> --- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -30,6 +30,9 @@
>  #define JHB100_PLL4_OFFSET		0x18
>  #define JHB100_PLL5_OFFSET		0x24
>  
> +/* Peripheral-0 domain PLL */
> +#define JHB100_PLL6_OFFSET		0x00
> +
>  #define JHB100_PLL_CFG0_OFFSET		0x0
>  #define JHB100_PLL_CFG1_OFFSET		0x4
>  #define JHB100_PLL_CFG2_OFFSET		0x8
> @@ -417,16 +420,21 @@ static int jhb100_pll_probe(struct platform_device *pdev)
>  	unsigned int idx;
>  	int ret;
>  
> -	id = platform_get_device_id(pdev);
> -	if (!id)
> -		return dev_err_probe(dev, -EINVAL, "no match data\n");
> -
> -	/*
> -	 * Instantiated as an MFD cell of the sys0 system controller,
> -	 * which owns the DT node describing the PLL registers.
> -	 */
> -	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> -	np = dev_of_node(dev->parent);
> +	match_data = device_get_match_data(dev);
> +	if (match_data) {
> +		np = dev_of_node(dev);
> +	} else {
> +		id = platform_get_device_id(pdev);
> +		if (!id)
> +			return dev_err_probe(dev, -EINVAL, "no match data\n");
> +
> +		/*
> +		 * Instantiated as an MFD cell of the sys0 system controller,
> +		 * which owns the DT node describing the PLL registers.
> +		 */
> +		match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> +		np = dev_of_node(dev->parent);
> +	}

This is quite ugly.

It looks like your PLL is a building block you'll be re-using.
Just make a module out it and re-use it is different platform drivers rather
than trying to fit all your devices in the same platform driver.

>  
>  	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
>  			    GFP_KERNEL);
> @@ -504,6 +512,28 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
>  	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
>  };
>  
> +static const struct jhb100_pll_preset jhb100_pll6_presets[] = {
> +	{
> +		.freq = 2400000000,
> +		.fbdiv = 192,
> +		.frac = 0,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
> +	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6_out", jhb100_pll6_presets,
> +		   ARRAY_SIZE(jhb100_pll6_presets), JHB100_PLL6_OFFSET, false),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_per0_pll = {
> +	.pll_info = jhb100_per0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
> +};
> +
>  static const struct platform_device_id jhb100_pll_ids[] = {
>  	{
>  		.name = "jhb100-sys0-pll",
> @@ -513,11 +543,21 @@ static const struct platform_device_id jhb100_pll_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
>  
> +static const struct of_device_id jhb100_pll_match[] = {
> +	{
> +		.compatible = "starfive,jhb100-per0-syscon",
> +		.data = &jhb100_per0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> +
>  static struct platform_driver jhb100_pll_driver = {
>  	.probe = jhb100_pll_probe,
>  	.id_table = jhb100_pll_ids,
>  	.driver = {
>  		.name = "clk-starfive-jhb100-pll",
> +		.of_match_table = jhb100_pll_match,
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -- 
> 2.25.1
> 
> 


