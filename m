Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704385;
	b=jLBx8lfeqgg5Etkot53SkZQptIVgHWd8Cvag9RChkpqg868bC51MlX61uyEKzJ026Eiz
	 e6FVFYW7g7NT8VtODuSOkUNJ+Mys3GGvKmAJriAoZR6n+Fh8zHDQGoaQGF7ZuCmMHyIhi
	 e/rzfoW5DN3Vcr8nwkEFS+EkfjE+eWPxVZfRb0aL0JRn4zEp8jCBRVJAD2uP+xt3l5cBO
	 7E1ZrEGy2DyqcSg2yPDMZauPBaR6yk30wB9tz2DL8hFnhcefgD9t8G+P9TfW8p6J18mCR
	 8OsV7YiDQCKZi8QVERkoQDbLfrq6VofY3rex3s9h7IOmLLc6BE0CHtV3xb/GKkVcrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=;
	b=tEyFxPGEX71y5Ddz5KN594RRNGvzB3Su3eFarOwIfprRiCGDeI+aSR07KO7qrPWnbMmJ
	 FqBLRo3whzamfKNh9kHX/dvDEW0+9CumECupwQXNn/EacvWYnQxICzsWtJxrHDxXe2i2u
	 3IGDQVMRUhFXRsDId25FBIk9D0WtlezaApsHKVZwfdyGAC5Gou7gEcE7vfpV4bva251tR
	 n8W/kviJm1hCm+JGtGOfGTjbLf7femD4ULtUq+/4kKiyeMKH0EvPS8J4ZxdxAqLqJftjd
	 z9j9R9tnlLh7IJ9t5l4TD3sBfarXnHNu2hGkCk3tmDvU/xHs+15lnsX0F4k1AVeQ9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2FdWRJU;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762A1606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2FdWRJU
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so6515603eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704385; x=1795309185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=;
        b=T2FdWRJU8frQQgQke2EJMi2Fm4/4Di9P/QKqprSUh+KaHDLt2lqzkxrdSYdWSC7SGd
         RRWjV+Rp/NPstS3oHktHofYs6Wz92pToV9TcpBEEg/uihE4ukM/sfx3RaeEZnk+8EETp
         aP7CVqP6Q7A8iBrO+c+yZReh6GT/jHCh/15MijNtG9k4zP5BTNUCIdbCcYvCjLwRYUkH
         eS6dg7KbqDJspvk4BTqE1bTAi7l04fjaHyRPK0l8gZhC5v63TuAwAIDkY9jieXKy9ov6
         biDQvLYOYQmjQNl8vf2DM+pkHDEmN5Lx4dYHEuuGGs7KFUh7FJAAmUr/oKHWGeFrvwmZ
         h8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704385; x=1795309185;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=;
        b=EIUYZ258ty0yHKjNkWtQq9x9k7W3zRrobwA30Tu+JFFoILG11qhPmLjSTUnZiP1PHl
         2wHik6yon4CruVyxki+XoLXmO9ycn1IwIai9GrFlf7KfPyRQqijmqxu1EaIfeSp50NnC
         BtMe2I9D9wZM7fd2miBZ0u3MvHNDKXee+5TGBLcs3VX1OypjRMAdph0QeBF9WMIAqG0M
         QvMGy7z+JT/uAMaO9wfpCvcu/WHvl8XbwAZMJXbL2F/V/lVEWQL7bwP1cF2WZVNIw0JY
         eAi0RTX2sZ5CzD5bSy2C6V0YHF8Gva+4sMvfRmJyptvi5Uv92OBGOhnF+opZDm1nmlQQ
         e2hg==
X-Forwarded-Encrypted: i=1; AL+hErFwLrVm/7+avHzZcc3AF7DBi5AQyHuMprXY7VQlVxJZTHb0kl5GTZZKhzPMcasOH7MV6vcEea3z0I8A@vger.kernel.org
X-Gm-Message-State: APuU4Z8mFy3dcGwHbte6WBbhEWu/W/oMtr+jrkRWIqLrc2yV/SUMPAzu
	Z5rnaiLQaDZYbHN7BUkmRXuyRyRwArmVsQsRels8Nj0E+czwOHrkCiert/l//0GyKx0=
X-Gm-Gg: AYBFou23gJthytvxcj4PAgVmQ8C8DS+Ny+UsoCYPmsbb6J/j3XGffsoI/8bKCQfKZ8V
	2vLWrb9Mo1BHD62ZqXLHhgy9xGuTQ4dzdkcfmmCCRhVvu/kA60AmOaj7BBhtkBzJ0BD9ad9S7YA
	V7PJLlTLrcMtVajuV3opuN3IUL+aQFPlVVtBQbtI32o+cN7ZNJHCJ9wmp9pGzl/M2SL/jYCazvo
	pR8wE8AbdST5TpIGOdRlnpMx9IU5Qr9P6OyaGXmQ28ZEmbgwfYcPn8d8C7bxwDUPSFeXubQ7BAK
	Sha5foYunVUrnN3LcVRG/JlBkYqR0DzQD7vxLUWYs/xLiXe6o6OtwM4vehOgTbIATfIJYBUVZVE
	oA2gsZDs4V2GtC9atdwWmvnMLU1u/01sHL9EFgLecvhxRifnyj82zyzKukMTHiKWyfnoYwt0uUr
	/lxK8UCIPCT2b9KK+k4arsSgueg8WXPub6YCQV3ul7JBLvP/7Drk+i/8GUKbBwk6cz4+aPSrIiZ
	KGXf+fo7eZri85cq0U9W055rNAo9LhPF+yMad73LTJjbmXv0GfwQqSGJKGt1qLNeCT/UF+IgELh
	fUvK1gU83GGc0LdXTyU2IxABntUJ5gx8ifWUPAaCxRNNA1AM3if8PCoFMlGPeCSMFeY=
X-Received: by 2002:a05:7300:e9c8:20b0:36d:a466:9d0b with SMTP id 5a478bee46e88-37966a5c202mr7670296eec.19.1794704384537;
        Sat, 14 Nov 2026 16:59:44 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35687984eec.21.2026.11.14.16.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:59:44 -0800 (PST)
Message-ID: <03c0c33e-9619-4641-92bd-ffd0459f11db@gmail.com>
Date: Sun, 15 Nov 2026 09:59:39 +0900
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
Subject: Re: [PATCH v2 6/7] PM / devfreq: rockchip-dfi: prepare support for v4
 DDRMON
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
 <20260921-b4-rockchip-dfi-rk3576-support-v2-6-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-6-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> Add support for the new control register layout found for DDRMON
> controllers having version 0x40. This prepares the driver for
> adding RK3576 support.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 85 ++++++++++++++++++++++++++----------
>  1 file changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 8490219f61be..8ba97af78e3d 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,6 +42,19 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
>  
> +#define DDRMON_CTRL0	0x04
> +#define DDRMON_CTRL0_EXT_TRIGGER_EN		BIT(6)
> +#define DDRMON_CTRL0_DDR4			BIT(5)
> +#define DDRMON_CTRL0_LPDDR4			BIT(4)
> +#define DDRMON_CTRL0_HARDWARE_EN		BIT(3)
> +#define DDRMON_CTRL0_LPDDR23			BIT(2)
> +#define DDRMON_CTRL0_SOFTWARE_EN		BIT(1)
> +#define DDRMON_CTRL0_TIMER_CNT_EN		BIT(0)
> +#define DDRMON_CTRL0_HOT_RANK			GENMASK(8, 7)
> +
> +#define DDRMON_CTRL1	0x08
> +#define DDRMON_CTRL1_LPDDR5			BIT(0)
> +#define DDRMON_CTRL1_LP5_BANK_MODE_MASK		GENMASK(2, 1)
>  
>  #define PERF_EVENT_CYCLES		0x0
>  #define PERF_EVENT_READ_BYTES		0x1
> @@ -143,8 +156,6 @@ struct rockchip_dfi_variant {
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  {
> -	u32 ddrmon_ver;
> -
>  	switch (dfi->ddr_type) {
>  	case ROCKCHIP_DDRTYPE_LPDDR2:
>  	case ROCKCHIP_DDRTYPE_LPDDR3:
> @@ -159,26 +170,43 @@ static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 0);
>  		break;
>  	case ROCKCHIP_DDRTYPE_LPDDR5:
> -		ddrmon_ver = readl_relaxed(dfi->regs);
> -		if (ddrmon_ver < 0x40) {
> -			*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 1) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> -						dfi->lp5_bank_mode);
> -			break;
> -		}
> -
> -		/*
> -		 * As it is unknown whether the unpleasant special case
> -		 * behaviour used by the vendor kernel is needed for any
> -		 * shipping hardware, ask users to report if they have
> -		 * some of that hardware.
> -		 */
> -		dev_err(&dfi->edev->dev,
> -			"unsupported DDRMON version 0x%04X, please let linux-rockchip know!\n",
> -			ddrmon_ver);
> +		*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 1) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> +					dfi->lp5_bank_mode);
> +		break;
> +	default:
> +		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
> +			dfi->ddr_type);
>  		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rockchip_dfi_v4_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl0, u32 *ctrl1)
> +{
> +	switch (dfi->ddr_type) {
> +	case ROCKCHIP_DDRTYPE_LPDDR2:
> +	case ROCKCHIP_DDRTYPE_LPDDR3:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR4:
> +	case ROCKCHIP_DDRTYPE_LPDDR4X:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 1);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR5:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> +					dfi->lp5_bank_mode);
> +		break;
>  	default:
>  		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
>  			dfi->ddr_type);
> @@ -188,11 +216,12 @@ static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  	return 0;
>  }
>  
> +
>  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  {
>  	void __iomem *dfi_regs = dfi->regs;
> +	u32 ctrl, ctrl1, ddrmon_ver;
>  	int i, ret = 0;
> -	u32 ctrl;
>  
>  	mutex_lock(&dfi->mutex);
>  
> @@ -207,10 +236,16 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  		goto out;
>  	}
>  
> -	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
> +	ddrmon_ver = readl_relaxed(dfi->regs);
> +	if (ddrmon_ver < 0x40)
> +		ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
> +	else
> +		ret = rockchip_dfi_v4_ddrtype_to_ctrl(dfi, &ctrl, &ctrl1);
> +
>  	if (ret)
>  		goto out;
>  
> +
>  	for (i = 0; i < dfi->variant->max_channels; i++) {
>  
>  		if (!(dfi->channel_mask & BIT(i)))
> @@ -225,6 +260,10 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  		writel_relaxed(ctrl, dfi_regs + i * dfi->variant->stride +
>  			       DDRMON_CTRL);
>  
> +		if (ddrmon_ver >= 0x40)
> +			writel_relaxed(ctrl1, dfi_regs + i * dfi->variant->stride +
> +				       DDRMON_CTRL1);
> +
>  		/* enable count, use software mode */
>  		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 1),
>  			       dfi_regs + i * dfi->variant->stride + DDRMON_CTRL);
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
