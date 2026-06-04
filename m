Received: from mail-m15597.qiye.163.com (mail-m15597.qiye.163.com [101.71.155.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573447A0B2;
	Thu,  4 Jun 2026 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577313; cv=none; b=lPhpDq0aYDf/r9OXgtJ6gk1eSaQrcEWbP2ym5PlbZ6ekPcpBq4KvZYtlKY1kZBk3YJCL8qrsishgfcVVHDAi0Qb8Sa6UMx8iJJhNZPcxRbyRBR0uNs1TrvCLvR9w4hPLZRykX8M0r5LEb1GltIMhl6gAwT3z0v/nYGcKmKtO9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577313; c=relaxed/simple;
	bh=Z7ZjuWCseYufeftIaFPtaxwDGdS/Yzj0JhHbc9oq6xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1fxA7BKK/5WsYBHcsTKH6hqHqe1Wf/9/oVNXhLeDlJaViUn5y/kgsQwDfCWWu4nb/b3NzpReES11bECWqOfr1UbnPH+PkE+gIgUi5z3kLUkq6DubQI76VoUklgh6DRjWUTzHmo2RSktyKAkTv+aKzASyhbyo12Ttzff4t8vbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IxM8Rb/I; arc=none smtp.client-ip=101.71.155.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IxM8Rb/I"
Received: from [172.16.12.77] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4114f0229;
	Thu, 4 Jun 2026 19:32:31 +0800 (GMT+08:00)
Message-ID: <c3b829f2-8f8f-4b76-bbd6-977ee49e32d1@rock-chips.com>
Date: Thu, 4 Jun 2026 19:32:20 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/bridge: synopsys: dw-dp: Simplify driver
 data setting
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-3-d7e7f6bac77f@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-3-d7e7f6bac77f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e9268059309d8kunmba51a6264c1bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSxkYVkIeQh4ZGUNNQxhDGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IxM8Rb/I2HY1HFLeGgoTCxr9yMRWq2uCjku9+lyH/eib/AzBDiclBkhnEdoRyaaPTlFEUfrz/eWpdvhOjsfiFG59EBa8a0xBqZ2z8mm1cMQNjrlANczPs4s9KDMWCWIUhYEsabXYKnzCDej+y/axSmo7vmX89rHtVB+LDW95RbM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=WPG/AsGIP40sCtd85f/8cpoPt3ZPqI9/+Lllb2HF/3o=;
	h=date:mime-version:subject:message-id:from;

Hello,

On 5/1/26 06:20, Sebastian Reichel wrote:
> There is no need to get the platform device just for setting up
> the driver data. Simplify the logic.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>   drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> index 150c2da8fee5..52e956bffb12 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -74,7 +74,6 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
>   
>   static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
>   {
> -	struct platform_device *pdev = to_platform_device(dev);
>   	const struct dw_dp_plat_data *plat_data;
>   	struct drm_device *drm_dev = data;
>   	struct rockchip_dw_dp *dp;
> @@ -87,7 +86,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
>   		return -ENOMEM;
>   
>   	dp->dev = dev;
> -	platform_set_drvdata(pdev, dp);
> +	dev_set_drvdata(dev, dp);
>   
>   	plat_data = of_device_get_match_data(dev);
>   	if (!plat_data)
> 

