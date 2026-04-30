Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1693C65FE
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546875; cv=none; b=FrMk8BsWK75WpZqUEOtSTZ2vEqQHOytsmHtsg3685I0BBtris6YnFD6yvoqDdOyHMMFEE+Ej4Jonk39cl5JWOjkfPa3C0sJqrZL5LkS42FgwBvy25xAJtHzhgnHy4k+buya1UVgBXyD8+gf67grxljg6XG5AGTOBnrNXuLZEABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546875; c=relaxed/simple;
	bh=6pBa57rEIy52vYAGdhUc6f5gD6xcMcTpsonzeTb9VfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkFQ7rxCDKi/6Q9OvR8JLf80MZV8VqJ5yslp0E6fh28UxCDX8yDmtWl93ipq+IECC1IBLCKaAHBpl2+C4OyjaomiWsNasl79yaQWLJKsiKyRnQEmc6+igp724fzkhaxmWB2ldNRUNv17j+SWzfMSrjAy8aSkJupaO/CaaQ4gYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmpXevb6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmpXevb6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6076965e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777546871; x=1778151671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5wYzMN3IpB4/lfMB/BJptgzMEGWqAW7cw6OYZmvGWI=;
        b=WmpXevb6FP+V9aPIb8+CUsRlQlQIxb9THo3vI8+npiu9U+r0Mv3hpTm8UJRkvvq2is
         cAktQJmE4uA9tvIkLCcLB1VI9EKc9y4kLviWxUNxDS0Nj3sChUlJwJSZD9R7eeXg6yKZ
         TiuiXMjwHtJz5CKfUu6NWQZVZlWY9m2U53mQz9bVrEhJ7ObqN4SQ98TuXvTh3rl7Yf0p
         YlKaT6XFX/nXIIUfjYScKmc+iExWsWSsfnKGmMsxnXTO5sitH+uNGYJZt4Flz9fcx6cN
         DbQ+0y1vEbYeudmgGcBhbgWprydgJLJKO9A7l4XXyqb4RpZTFxDKmPtLiTUg7cNlR3GH
         BlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546871; x=1778151671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5wYzMN3IpB4/lfMB/BJptgzMEGWqAW7cw6OYZmvGWI=;
        b=jCSL3cQHmBX+Pm/O6x3BAEBjQbWVRagZwGs2xtCx9ERWirifyiKuvZvrBhMFPVm3J9
         DRd1pktYI7HaNxQ8sl/BDf3FwhfrCKDEAAvczjn6PSdEgWVdyCgBBxYRX/F0op0/fJh3
         SRLKEHT8VeKz/DULYm92jr2PVc3peDa9WD+0H4ja2rdCHKeDxDA4xUZlRD7C/T3GkES2
         I8UKEj+NzF7dGDvxCiE3bZ2nMNFGqK/0FPP9X+sPKBRqlWNR7DamB2C9VOi2t01Ll22f
         4vTWQ5vlIAyaqYxyrFql3yuc5rx348z2lbtapzxZhcYSlqArrDJSETSCFzRK4+PjjQvW
         H6BA==
X-Forwarded-Encrypted: i=1; AFNElJ8b0JT7KXGnsIbvKWVLbK6Xp67LMY+IvSEVjqrSQwyIljLKiFiuu/B7E/kz/DujsJJs/wD9Yg/irz+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp8x03RUgy6AYh9JXXKDC+iLhE/dqOEhF5dItOC47rQBpQ7wY1
	kpwTNtxH9EJ6RK75jkxWvqoPUeAhdkgNzhyWGRpZ+b3/jITl7gXQxsqdRrsKFUgmOYU=
X-Gm-Gg: AeBDiev3onybGzsKjLf+qxzyqv3zLwDofI5xxH4RhwcpsbNctRAP6YrPgPlELOrXQaN
	u3RIxgjMQvjvTMNeRaB1GjCOytro+6vXZXCwIQhcOe/T+wDmp9V38svfDk4xPn8t/77F1RSGiRe
	QcLj4fG6n7l5GgcuCC/cGgyP0H5YIHIqSAzXi1tGR+6yZC7xZWJx1taxV+O5aK/0Q996Ahk7wEN
	tYs1tG4WgXvrwAQiJr6guc77fzMhUavjrYRWAwWLWeVKrnhkyYDN4fVmL3NZpC2x7G8qZ0zfusH
	2tySTIvcggywFzmnPrv8vvPrQg/VnKqd6WdMll3IXDLY/y2Ri7HY5AsyZBKB/YoBE4qgHAI4Vg4
	egudD3k2Z6mwLUpZVmx2G7UVOW35F6ENlARLA73oRUWcLLlemcppON8nYbR6k2VTD27Dlw32urt
	+W6Ttqw8pOQqF9+UIb6DYCt8PeRfS4KiBJ8TuUxXbulRY=
X-Received: by 2002:a05:600c:1e0f:b0:48a:5333:811e with SMTP id 5b1f17b1804b1-48a84451f8emr40243205e9.15.1777546871390;
        Thu, 30 Apr 2026 04:01:11 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8c2dd7sm84687495e9.0.2026.04.30.04.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 04:01:10 -0700 (PDT)
Message-ID: <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
Date: Thu, 30 Apr 2026 14:01:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Juan Yescas <jyescas@google.com>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

The abstraction is clean. Few comments below.

On 4/29/26 10:00 PM, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 59 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index d2355b128ba4..11657dd475c0 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -31,14 +31,52 @@
>  
>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>  
> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
> +
> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @intgr:		offset to the IRQ generation register, doorbell
> + *			to APM co-processor.
> + * @intgr_shift:	shift to apply to the value written to IRQ generation
> + *			register.
> + * @intmr:		offset to the IRQ mask register.
> + * @intmr_mask:		value to write to the mask register to mask out all
> + *			interrupts.
> + */
> +struct exynos_mbox_driver_data {
> +	u16 intgr;
> +	u16 intgr_shift;
> +	u16 intmr;
> +	u16 intmr_mask;
> +};

using u16 for intmr_mask is slightly problematic. Down in the probe
function, you pass it to writel():
	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);

writel() explicitly expects a 32-bit (u32) value. While the compiler will
implicitly promote the u16 to a 32-bit integer, memory-mapped I/O masks
should generally match the width of the register being written to. If a
future SoC requires a 32-bit mask (e.g., GENMASK(31, 0)), the u16 will
silently truncate it.

u32 for all fields is generally preferred in kernel platform data structs
for padding/alignment reasons.

> +
>  /**
>   * struct exynos_mbox - driver's private data.
>   * @regs:	mailbox registers base address.
>   * @mbox:	pointer to the mailbox controller.
> + * @data:	pointer to driver platform-specific data.
>   */
>  struct exynos_mbox {
>  	void __iomem *regs;
>  	struct mbox_controller *mbox;
> +	const struct exynos_mbox_driver_data *data;
> +};
> +
> +static const struct exynos_mbox_driver_data exynos850_mbox_data = {
> +	.intgr = EXYNOS850_MBOX_INTGR0,
> +	.intgr_shift = 16,
> +	.intmr = EXYNOS850_MBOX_INTMR1,
> +	.intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +	.intgr = EXYNOS_MBOX_INTGR1,
> +	.intgr_shift = 0,
> +	.intmr = EXYNOS_MBOX_INTMR0,
> +	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
>  };
>  
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  		return -EINVAL;
>  	}
>  
> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +	/* Ring the doorbell */
> +	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +	       exynos_mbox->regs + exynos_mbox->data->intgr);
>  
>  	return 0;
>  }
> @@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
>  }
>  
>  static const struct of_device_id exynos_mbox_match[] = {
> -	{ .compatible = "google,gs101-mbox" },
> +	{
> +		.compatible = "google,gs101-mbox",
> +		.data = &exynos_gs101_mbox_data
> +	},
> +	{
> +		.compatible = "samsung,exynos850-mbox",
> +		.data = &exynos850_mbox_data
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>  
>  static int exynos_mbox_probe(struct platform_device *pdev)
>  {
> +	const struct exynos_mbox_driver_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct exynos_mbox *exynos_mbox;
>  	struct mbox_controller *mbox;
> @@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pclk),
>  				     "Failed to enable clock.\n");
>  
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;

you shall move this first thing in probe() to avoid doing allocations
gratuitously on null match data.

> +
> +	exynos_mbox->data = data;
>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;

EXYNOS_MBOX_CHAN_COUNT is globally defined as:
#define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)

Does the Exynos850 have the exact same number of channels as the GS101?

You may move num_chans into struct exynos_mbox_driver_data alongside the
register offsets so each SoC explicitly declares its channel capacity.

Cheers,
ta
