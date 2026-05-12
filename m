Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64E2D8376;
	Tue, 12 May 2026 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610612; cv=none; b=OR0Rr3g9rKhPdXfP2Z03JOMyCXLYoM6xbNVaLC+umyOcwBtw3pNSOcfA55PWkgF3+zEx4DI6NAbfcPw7wSWS53AF85XY5TtjZ9ifF0FV890CtjJ9VhCqS5Gh2bl26SKsn0TID0TV+UpwbEvUhk+qZ2Wr/zZOfmVMRj4mnSHIvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610612; c=relaxed/simple;
	bh=eZWsQn6yny4VmwOIYkm9XPAtWL9DwJXzwYQz1+dybng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMhiMn5rZHi/KvEtNnmR34KaPA4J3mgvw3Z/JyRXcx1abuKEfntXpETAP8BvEdAooaXcx5CKPWffx+bmZ/s7nlrmAeACiNO/X/qqi/G9fFTX2aryRIX2uTkQmh9PWIJyflrVvdyKWbSGxLEolrKmaA9sFial/Yv8RxmahJU/W64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RHwp/4cZ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RHwp/4cZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25886115555;
	Tue, 12 May 2026 20:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778610600;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2J95E1t3Yy9E0QYQza1Q79CM5NrjcW7zHIVuWUaMp0Q=;
	b=RHwp/4cZ22xkOO9X94TPhMM/xavaxl0JisJGwStfpXGInDILjP/t2qzboQwnztp064dbIr
	C4FRIlUgh4JRol6LrTCTyVtJp6nr0OkHDsCS0rrJgdd1FrHtB3nxmK4SjL30zpjdNVqQnk
	F5EI3EutWh4HgtTb2VTxJAnWnN6wPcphZ7XK53z5K7d2LDiYUV0Je1RROVuFJUj30CVnUY
	erL94GVl6kfCysv1F8DTNNJaWkOhO/dCggW7mnvIzegJENUPXl4QxXRQNy3bpaT387BC+k
	gBiE8BAnFFzCJVFUHJ9SkBUVs7os/pUVgraZ+jssIOhPjT39qr8ithTe/TeBIg==
Message-ID: <dff39a7a-a25c-4565-ad20-48026995af11@nabladev.com>
Date: Tue, 12 May 2026 20:29:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: lt9211: Add drive-strength-microamp DT
 property
To: Boerge Struempfel <bstruempfel@data-modul.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512164609.3390700-1-bstruempfel@data-modul.com>
 <20260512164609.3390700-3-bstruempfel@data-modul.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260512164609.3390700-3-bstruempfel@data-modul.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/12/26 6:46 PM, Boerge Struempfel wrote:

> +/* Maps register value (index) to drive-strength-microamp DT property value */
> +static const u32 lt9211_hsdrv_microamp[] = {

This can be u8 .

> +	12, 14, 16, 17, 19, 20, 22, 23, 25, 27, 28, 30, 31, 33, 34, 36
> +};
> +
>   struct lt9211 {
>   	struct drm_bridge		bridge;
>   	struct device			*dev;
> @@ -50,6 +55,7 @@ struct lt9211 {
>   	struct regulator		*vccio;
>   	bool				lvds_dual_link;
>   	bool				lvds_dual_link_even_odd_swap;
> +	u8				lvds_hsdrv_isel;
>   };
>   
>   static const struct regmap_range lt9211_rw_ranges[] = {
> @@ -374,7 +380,8 @@ static int lt9211_configure_tx(struct lt9211 *ctx, bool jeida,
>   		/* BIT(7) is LVDS dual-port */
>   		{ 0x823b, 0x38 | (ctx->lvds_dual_link ? BIT(7) : 0) },
>   		{ 0x823e, 0x92 },
> -		{ 0x823f, 0x48 },
> +		/* bits 3:0: RG_MLTX_HSDRV_ISEL, LVDS TX driver current */
> +		{ 0x823f, 0x40 | ctx->lvds_hsdrv_isel },
>   		{ 0x8240, 0x31 },
>   		{ 0x8243, 0x80 },
>   		{ 0x8244, 0x00 },
> @@ -629,7 +636,9 @@ static int lt9211_parse_dt(struct lt9211 *ctx)
>   	struct device *dev = ctx->dev;
>   	struct drm_panel *panel;
>   	int dual_link;
> +	u32 microamp;
>   	int ret;
> +	int i;
>   
>   	ctx->vccio = devm_regulator_get(dev, "vccio");
>   	if (IS_ERR(ctx->vccio))
> @@ -666,6 +675,23 @@ static int lt9211_parse_dt(struct lt9211 *ctx)
>   
>   	ctx->panel_bridge = panel_bridge;
>   
> +	ctx->lvds_hsdrv_isel = 8; /* default: 25 uA */
> +	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
> +				   &microamp);

if ret != 0 , then what happens here ?

> +	if (!ret) {
> +		for (i = 0; i < ARRAY_SIZE(lt9211_hsdrv_microamp); i++) {
> +			if (lt9211_hsdrv_microamp[i] == microamp) {
> +				ctx->lvds_hsdrv_isel = i;
> +				break;
> +			}
> +		}
> +		if (i == ARRAY_SIZE(lt9211_hsdrv_microamp)) {
> +			dev_err(dev, "Invalid drive-strength-microamp value %u\n",
> +				microamp);
> +			return -EINVAL;
> +		}
> +	}
> +
>   	return 0;
[...]
