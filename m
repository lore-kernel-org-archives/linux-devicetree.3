Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A17D377559
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821131; cv=none; b=J2x4hB4Rus6ZbW4CaV2FAGYu4Acw2EYxuLeM1gl5/dN8mv5Ig6oZflHNDc7Tp5caWt4Ix4aENLYY3bePyPejaq8rspzV8teM3FMaO6UIOWDVPt70wG7K3actkJkKFr8rlEQvp2DCuffcbxRBbExx44F7ZULVVuJAoV14ZVqG+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821131; c=relaxed/simple;
	bh=5RkMUJ1444X2cAUbWcMBKjhTBMhgCS7gOIBcS9lYMPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uPc/7kDL4nymeqJ+5woxE8+vSMbVcU+/jgjm5duIdxAd4uwVQ7LurnHPiIPHNORpGKMU3RXm0fGiYk9E6lEnmM1qVjGKnM47zfUzT2WqonyR4jBUCzt/nR0NquQdz4UzWFQwf7fDEncyJX+eQGulNZqtmTL1Nw18NjCFB1jYKSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGvpzoKv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGvpzoKv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c16794450aeso263586566b.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786821128; x=1787425928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88izO+QaB/O00yTBhu9wQoygITPFWyCSorKc++U3zBY=;
        b=OGvpzoKvC/8HTbmaFB/nErXD6qnlhk/zmsXYD1OoN7t5w35IW4M0y+EYsAKrhWKfyR
         ufdqcKHJCBbLpLj1obAkoaZkYYY1zrjg8byCGapnQDz/fViPHjZ8ihPMv2Rl3rk1Urou
         MWX5hktfymmp3wuZlZXPITJfxQA1nVgtyU2O5Bom3kdZh9kDedUJuFfrdwceIOJSqeTu
         hzpQE9FPQktvXr2EhyD53G57Kbe3eG6BkXbu5Sm/MjTJo2emI50CU60khHg4ZyHZ4w29
         NlWfVs+GMpGmmVsoKZO45DrVYz+IuNGsk0HjiL6lrnjbwuF7ZWpdYvvOQZRMWm13Oic4
         g0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821128; x=1787425928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88izO+QaB/O00yTBhu9wQoygITPFWyCSorKc++U3zBY=;
        b=eYXkVLlqwkhunaQOQfOIPnFsYziHKdKdP4ysgPBrRxOBzbCwhC4Cew7SS0fk631LeH
         N2dEL14kJ/uuxt1fl24LrP1Bqngzc86k1SWd8hvHZswqSwv2sRm4dY2JvUgcNHaOUcFG
         v3IhQHWaNtN1XCHGpCjs3acBgiWT+6I3dNLp5o99e20h2dL3t7XpZTdUyDqPDYG3Cu/e
         Hz990NJ6nUCZUEvnV15mir8BQf4m19yK7ur6hLJmi0ajRokMMJnCdbgxhC7fIHCLTqDk
         5zVHkcatdZQKGVGHWiEbXyUH3sTWxgeDaErP4kJBs6Cx1vgKYcQLSFRSIROVfBoDmLvz
         kZlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEseDrTeNy92mQdyl6LYcFjNolKia22k5tzmqbbLW+44dvKa/B2nL1dSk7l62nUUjEIc5GL72LrTmI@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMD/7ptBmDvOM9K1RbWWlnxyMgkmV31g8p30omJUBcE+TMPGm
	RWQ09e2ShLUbxZLg6hdefeVzQRuF7LPDaENljMUKzeVtR9TebAmMrEM4
X-Gm-Gg: AR+sD13H0xfMK5ebArH5yTQ69UpC6KC5543VBdcirkgR9W9bUxwnRh9hgiViTJ1s1cC
	VZSUM9Er4X1kHSOS0Q6oLvHI1zQQFsZpO4iHSyXQpbIJK0xhPoQYfKyHIOMEev5CE9PEaubquQz
	uxGoWtwDNl4uFDnhJgrv09wl1mCb1s+/RHqqVhxh5yK1O90XoXKFrTkpQ6JoDw9pjaLq2LKJuXz
	/ryuaSAGoiCux5CTWZobTV1wRNlqbqblUBJm56Lc3TwSZBBAkHoOWgbT/vDQ9ovPyXTapWrbxah
	alhIarj3pv7tDr/bBSuj9dPNGJRz2CXxghiAD+ZVzHeHYXC13tiZ5Q+cKi0mcjNsNdx7TeKYp3D
	hjn7wevpYXzAvkFYKTsJuYyTimY/wWkG/s7Ktx5P/+BaGPS/GuOSewDYS4yIU6MQHFykQzFDOO7
	uPzALqw+vuafC4OjreT6lGmpeoJr3V+IJsixlese2ZU9U60sLZIwYynxJ0SJasUGTVJobXZ104w
	0qCLeywYeALSIX4e5adQj/2ZFOSBElRYVmmy/demw==
X-Received: by 2002:a17:906:eeca:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c2129ab6c24mr672768166b.7.1786821127686;
        Sat, 15 Aug 2026 12:12:07 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89? ([2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212339f744sm252129866b.10.2026.08.15.12.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 12:12:06 -0700 (PDT)
Message-ID: <f140a168-0f92-4507-bf07-f5297ad92159@gmail.com>
Date: Sat, 15 Aug 2026 22:12:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/10] net: ethernet: ravb: Add gPTP support
 for Gen4
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260811160200.2049987-1-niklas.soderlund+renesas@ragnatech.se>
 <20260811160200.2049987-11-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260811160200.2049987-11-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 7:02 PM, Niklas Söderlund wrote:

> While driver advertises gPTP support on Gen4 platforms it is in fact
> completely broken. On R-Car Gen4 devices the RAVB module have no
> internal gPTP clock as generations before it. Instead it utilizes a
> system-wide gPTP clock.
> 
> This change utilizes the refactoring of the RAVB gPTP code to add
> support for a system-wide clock and stops the Gen4 devices trying to use
> the non-existing internal gPTP clock.
> 
> To remain backward compatible the ptp-timer property is optional.If not
> present, or not enabled, the RAVB driver will no longer advertise gPTP
> support to user-space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index b4df5cab0e5c..4c8dc02022e2 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -249,6 +249,8 @@ enum APSR_BIT {
>  	APSR_RDM	= 0x00002000,
>  	APSR_TDM	= 0x00004000,
>  	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
> +	APSR_GPTPTIMER_SOURCE = BIT(25), /* Gen4 */
> +	APSR_GPTPCLOCK	= BIT(29),	/* Gen4 */

   Again, I don't quite like that you switched to using BIT() all of a sudden...

[...]> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 12877a8488ed..30170e92d3d7 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2752,6 +2752,59 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.magic_pkt = 1,
>  };
>  
> +static int ravb_gen4_ptp_probe(struct net_device *ndev)
> +{
> +	struct ravb_private *priv = netdev_priv(ndev);
> +
> +	priv->of_gptp =
> +		of_parse_phandle(priv->pdev->dev.of_node, "ptp-timer", 0);

   You now have full 100 columns, no need to break that line... :-)

> +	if (!priv->of_gptp)
> +		return 0;
> +
> +	if (!of_device_is_available(priv->of_gptp)) {
> +		of_node_put(priv->of_gptp);
> +		priv->of_gptp = NULL;
> +		return 0;

   This *return* seems superfluous...

> +	}
> +
> +	return 0;
> +}[...]

MBR, Sergey

