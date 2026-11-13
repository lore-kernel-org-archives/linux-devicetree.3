Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566330;
	b=KntyjeoaPkN8yUCljISgiWPICQM3k2AuU2doVOhsAEFx0FG7DUAbyjv80JA0lRwv65Zz
	 EaimbuGCiEHLABo8+OCdjKie9Ghi3/J6ctqcOex1ZusIAT2OsL49opwR011Q/qTjAl3n3
	 M3GiNvGnG1HVfFC/K2DjMHYuaX0s8XFQ+AsPMAHclzk1aUZP6w8JF84QYhSjJa1SWk+9M
	 fsGZigJ+H08TDQ1U8/Nb3z8rODA59Vhs1Vqvc7fIB/tQqPI65vxEKCnEg4w4DTrX12ux8
	 GQbNEoR9H/NPCOaNYfgJoniNKum5GpBDbFQqjY0ufOMbrfhcB1QAjNguGLuElVdNGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566330;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LvhcGXbxt3F1tuseGuda4zgciKL+LC/dvbfpKQxs+pQ=;
	b=wi2lV4xrF3QTHgOQBxu6WvbE1mKlspEvWahzua8bYHCi8ZtkAQqDP4uYhSe4QUi+MXwY
	 y+XWrRU7M9Xspo0oqbs8Mm8ECEF3KLsbk86+eBkJCEPodb5W2ZhMbVhjttA5tCIAppnwT
	 RgIwExyzXgWRuWqI2T3ILx/klIodA63XBN88Tv/jyjsKfvULf6L2jOx/nQ+Q38TMeZM2Y
	 y/AJ6TtCmGG3xkg2sTrldnVcRS6rKfAuCdMCDyYJSArE5FGHGXO6kcyGC6TPY+P7ePqmy
	 rLSZVuasBDL2f02huHn176YplPXKHh4hVv8Q6jHQxA6csGEB3z2eHYLyqX+2bX8IFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2tO10UI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93759606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2tO10UI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BA31F000C4;
	Fri, 13 Nov 2026 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566330;
	bh=LvhcGXbxt3F1tuseGuda4zgciKL+LC/dvbfpKQxs+pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N2tO10UI3LrPYKyDPD8Ec2fdna+NCQ6McbCTAB+cA9rPRIYgzF2dAt0TvZt2T0/CU
	 /Wt0cjn4e32dIYzHfZkrXxzOAtZ80rVXhi7WFtcNzBweeOGtzqJxKBv94KBrZKE9rg
	 ZxdUhxupCsze+cSfNRdiLkWptPzFX/QfW+NV+Xh0ZpTtn6k5/FWSdFUchENNOkJ0lk
	 quehOSDULb1r/2RVBJtFusoSG7piD0plqpKzUXhctxp6MbSmPJ5CQg1udZZGGGuSa7
	 Ahkl6W7T7p5+6pxXXOfqc31r2q3kfXH8BNi7hfvZNjZql3JeCixbABnCFO8YegXhcq
	 q47BFFrXY6TOQ==
Date: Fri, 13 Nov 2026 11:38:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, wuyi.shen@cixtech.com, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] drm/cix: add Sky1 DisplayPort transmitter driver
Message-ID: <20261113-industrious-squid-of-tempering-e428b7@quoll>
References: <20261109103010.110911-1-Luo.Liu@cixtech.com>
 <20261109103010.110911-3-Luo.Liu@cixtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109103010.110911-3-Luo.Liu@cixtech.com>

On Mon, Nov 09, 2026 at 06:30:10PM +0800, Luo Liu wrote:
> diff --git a/drivers/gpu/drm/cix/dptx/Kconfig b/drivers/gpu/drm/cix/dptx/Kconfig
> new file mode 100644
> index 000000000000..0b099f7d2ed5
> --- /dev/null
> +++ b/drivers/gpu/drm/cix/dptx/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_CIX_DP
> +	tristate "Cix DisplayPort Controller Driver"

Missing ARCH dependency, look at other examples.

> +	depends on COMMON_CLK && DRM && OF
> +	depends on GENERIC_PHY
> +	select DRM_KMS_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_DP_HELPER
> +	help
> +	  DRM/KMS driver for the Cix DisplayPort controller. It implements
> +	  the standard DRM bridge interface and drives an external
> +	  DisplayPort PHY through the generic PHY framework.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called cix-dptx.

...

> +static struct platform_driver cix_dp_driver = {
> +	.probe  = cix_dptx_probe,
> +	.remove = cix_dptx_remove,
> +	.shutdown = cix_dptx_shutdown,
> +	.driver = {
> +		.name = "cix-dptx",
> +		.of_match_table = cix_dptx_dt_ids,
> +		.pm = pm_sleep_ptr(&cix_dptx_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(cix_dp_driver);
> +
> +MODULE_AUTHOR("Luo Liu <Luo.Liu@cixtech.com>");
> +MODULE_AUTHOR("Wuyi Shen <wuyi.shen@cixtech.com>");
> +MODULE_DESCRIPTION("Cix DisplayPort Controller Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:cix-dptx");

Drop alias, it's not a substitute for incomplete ID tables.

Best regards,
Krzysztof

