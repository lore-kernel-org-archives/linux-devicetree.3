Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704362;
	b=WDeWUUPV6hTl9YLta4AFUiCUsiBvbwf7iNd9MzDUHwSUwE0xkzs/fDAXB6Uq+v/Xeaht
	 LWgXF0Hm0u5roBhrbA/sEeXOdQ52fkNOB7Sku4UEtFViqgzRS+HKcbFWyk7GGTeQVqV6K
	 K9SA6uThmIV7Z2igLjKpfv4eVupQLvIkiJggVMJKBtL8mzDoBdtUG8aYlkwAp2fCSs6m8
	 Oba3sfDBTbC+P/K/DKdz8tC8exyHfgrj69lUihTe9dvh0UW8yRWv0hdLqrLrfwoUzr0qV
	 Hku4Kk5ZyhxbkKy743WPTr06e+2Tb0NI0cP2wOWwl8o+9ihWoyUmtIOOI+ZCiNJBuKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
	b=csZNljXiFsDe7K4H1/tydgTnx1rrPCnFSOpMBSVbj4tmT6PEbyy/5YeHdBcnDk88jGUk
	 eymTM0obWrQTHaFO2hcY0TEYjtySfKifWA7uSAPTjhu0iBTBpGTiygkYaOLp7MIAN6w61
	 e9Ku8nLVIOhmjc+CbnzhGbA0pW/Zl9r6/B4IdZqS34wHVPT3XEsYfT28QOaNBGsZEo6sA
	 1OtqG708MYoHTWLH/+VBws/sxidzVdZon7djaWOPFMFi2tpOp4NaTP/BUbHMPMf0pzJyX
	 i4JdD46DVhZycegn70so55qKNPh74Y5o7PLZQpLmOMml4gzT+uw6l3k5gh7oCpjoC1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4SUhaU;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E5606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6E5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4SUhaU
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso3341530eec.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704361; x=1795309161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=jP4SUhaU/1s+bJegZl7fwS9GDcrkTwT3ktqXJB2jbdhpkF9qtkmX9hOuc4H0Isf6/S
         t95bJXrfBfioTpYwsmbsT4XWMh27lioeK72HmRVm69No8veKhDn+WFPaYBrdlR/OQb8C
         4Pt9iCuXplfG8tNV/Zrp+sML03tNMGDgnqXF2JbU0OP6RXHj/xU5Fh5Pxz9ItgSlVgAS
         FO+oCzPpkmFBneYuu5WTqqZVuRNwErAH/gFHfSNI8K+rdziuRDc8p0NBmkD7NZqfMDev
         /Ph9aWNz5ykxrInosryMfF5gBUlufGQF4UKWcEj2MeyU9i0z3KLltz5MobgMR9SXe67r
         RXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704361; x=1795309161;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=lbT/5w1LwGtYHdiVQShI9iDLlOcUc9QGzgDM4m5KUPo8fKVChPHgHSLa0DkhcNmRlP
         j3de8Pt/ffhjDAyfbFcodQDCK6sqwTq3q9uOhoiS/DOfeYxFu6E0IN3cAraKb9EDCt69
         whmtmDHFxUmd7QRwVkFbnto0c19mxRzz9p1y6swp3BQcN5/78CqK6GwNPMV+QbJHlLgK
         PhLgmcGTmNLbqstS2PUXT8Av1XIq+0V4O2lEqugdKu8OR5SnujHS9keJ2I72b1NgOTV4
         zARQk4Jn/hkFQhb3iUWMlkZmtGeJUOSwi0AP4KHwUN29LrP3kYrQg+Tpq5gtscCRrNsX
         4OUA==
X-Forwarded-Encrypted: i=1; AL+hErEj86QGsN9ljJEJOLmNQdJHrma7/6ZVdPtVJVHkVk5qFDoE/TCSCCLRT9Bb3G/7gRk09xP8Z0OplJMy@vger.kernel.org
X-Gm-Message-State: APuU4Z/5nQkET23xxEUQBJurKFtFFPvkhsH4hCvVFTQeKbfcMO0DwOtE
	jO73amC6hlJgFRdyMvmbE7gBFk3pQYd7PWOAMa7Yt9RAI9GMyJn1Xyzj
X-Gm-Gg: AYBFou1WVv1rN68KE2KtriM/tzkYihT0L9LhcLIo/UHbPA3le+CrALOe5cTkUvEMD7g
	Ek96YlybaRqIXd3ErgMn9vyOk3JTk5RwC2B+EBBBjyg2HWujMuwP36KzKg4cc2qWXjBcCt7MdW5
	qOGVuWJZwrE3QYSnj6ZD27EiuV3S9JPJ0gwc0dm2P3Rhcg3Y40116/wXvHyEhp7oM2PCDFU0BAf
	dYCBnGhK4Rmec5uZyOb+3R71t//IwqgQkXEzhsze4QuG1v0BrJFXHZyxki6kjv65j7SCcvTNO58
	4Fr5QLDbB8QkB44RlaXKLjaXGkSuOwShIOh3YqGcl36AfpCLnURWq/p5LuPGZQ7g+Z0oAirQP9b
	xO6zyZcXd7xiSUfEO34Mswh8BfvdLCqN5ethj8d44qW+Svj/rnCVoGFGH4U89y4seHExiiB40AY
	ONlc/PvTr6oQM0QIBo0FV94jQ3a+Km7OwDrdv8wzbFufa+iNkpTPG5MI6ACNwE8WA8YEE+gGPtE
	gdZRRvZE29QflAzM1D2stryEvP7/WGvtkNz7VpQZempRQcpR8WTZkm/0VP61pYEWovti7NBlSNM
	XkHTTQHc5d+czGQCZlOmM4oeTd97VcghI3BiFHF5Ryr7Pfn7nJivzrkRacVZR9GnHInxlUv9eKO
	aZJ1bqGpJxDEi
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr9538114eec.22.1794704361510;
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm20244703eec.0.2026.11.14.16.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Message-ID: <0a8c0d90-9d80-4688-83b3-faf6bf04ca06@gmail.com>
Date: Sun, 15 Nov 2026 09:59:16 +0900
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 5/7] PM / devfreq: rockchip-dfi: move register offsets
 to variant struct
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> DDRMON in version 0x40 (found in RK3576) has two control registers,
> which moves the register addresses. Move the register offsets from the
> defines to the varaint struct to ease supporting the newer version.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 380361a231a2..8490219f61be 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,12 +42,6 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
>  
> -#define DDRMON_CH0_WR_NUM		0x20
> -#define DDRMON_CH0_RD_NUM		0x24
> -#define DDRMON_CH0_COUNT_NUM		0x28
> -#define DDRMON_CH0_DFI_ACCESS_NUM	0x2c
> -#define DDRMON_CH1_COUNT_NUM		0x3c
> -#define DDRMON_CH1_DFI_ACCESS_NUM	0x40
>  
>  #define PERF_EVENT_CYCLES		0x0
>  #define PERF_EVENT_READ_BYTES		0x1
> @@ -128,6 +122,10 @@ struct rockchip_dfi {
>   * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
>   *                   DT binding for this variant didn't require clocks in the
>   *                   past, so that the driver remains compatible with old DTs.
> + * @reg_write_access: register offset for writes access
> + * @reg_read_access: register offset for read access
> + * @reg_access: register offset for read/write access
> + * @reg_clock_cycles: register offset for clock cycles
>   */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
> @@ -137,6 +135,10 @@ struct rockchip_dfi_variant {
>  	const char * const *clk_names;
>  	unsigned int num_clks;
>  	bool clocks_optional;
> +	u8 reg_write_access;
> +	u8 reg_read_access;
> +	u8 reg_access;
> +	u8 reg_clock_cycles;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -275,13 +277,13 @@ static void rockchip_dfi_read_counters(struct rockchip_dfi *dfi, struct dmc_coun
>  		if (!(dfi->channel_mask & BIT(i)))
>  			continue;
>  		res->c[i].read_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_RD_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_read_access + i * dfi->variant->stride);
>  		res->c[i].write_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_WR_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_write_access + i * dfi->variant->stride);
>  		res->c[i].access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_DFI_ACCESS_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_access + i * dfi->variant->stride);
>  		res->c[i].clock_cycles = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_COUNT_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_clock_cycles + i * dfi->variant->stride);
>  	}
>  }
>  
> @@ -829,6 +831,10 @@ static const struct rockchip_dfi_variant rk3399_variant = {
>  	.max_channels = 2,
>  	.clk_names = rk3399_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3399_clk_names),
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3568_variant = {
> @@ -836,6 +842,10 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.stride = 0x0,
>  	.ctrl_single = true,
>  	.max_channels = 1,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3588_variant = {
> @@ -845,6 +855,10 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.clk_names = rk3588_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3588_clk_names),
>  	.clocks_optional = true,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>	

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
