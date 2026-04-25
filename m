Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722D248F57;
	Sat, 25 Apr 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116531; cv=none; b=bJr00+k4u6MRsEiaH17F7Bu2Dqj6dBKIvTB3qPglTdOGZlDw6HJkfMTFbF3XodqD4Hc85/44H3i/MIk/aztSt93HH2Z6vJOeEKczPqj0rTtcqQpqqAWOHq6XxDu1nuckkXf4DapoZ7nhmlqiDBKLD14N5JFTZFEqWgdnfGjVQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116531; c=relaxed/simple;
	bh=FEep56iE/C3Rq9sexNZ6bqN9RA8e1jk2/IcVlqsnXbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6hYarjxhX7qcurItygj151BbbnxNc2G0DeRU64zIjmwcTyHLCTeCwycAkpPwN5aEfz5nonOzzsV50n46xqUdfrd8d1pT/2wZV29Y5GM5NtRWpbMXIyx/SR+peyqhAmUHHD6tGTayIBflqY01QTp+tTqUBuKIfGUu3lW0j3Twlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Je9cmv6T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Je9cmv6T"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D1E3986;
	Sat, 25 Apr 2026 13:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777116425;
	bh=FEep56iE/C3Rq9sexNZ6bqN9RA8e1jk2/IcVlqsnXbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Je9cmv6Tz/gTalUsJn4gWByA5bstWnvoRHiy3jcUp0uSYJgj9w9zf+Mgb0Fnx6vEY
	 MOHqJAhAnz+LYUrJbThmsrw1fpihNPz38Uf9Ysv9Z9as49Kvnr7YnwAZtdgvBSDb7j
	 bpBC6fVC4UacbKv3WXKf+Mm5Bx/b1fPMbMAdt7v0=
Date: Sat, 25 Apr 2026 14:28:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <20260425112844.GB2964234@killaraus.ideasonboard.com>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260425031011.2529364-4-dennis@ausil.us>

Hi Dennis,

Thank you for the patch.

On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.

As far as I can tell, the LT8711UXD has an I2C control interface.
Shouldn't it be an I2C device ?

> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 8aa31ca3c72d..42c1f3d5ba0c 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
>  		.data = &(const struct simple_bridge_info) {
>  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>  		},
> +	}, {
> +		.compatible = "lontium,lt8711uxd",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>  	}, {
>  		.compatible = "parade,ps185hdm",
>  		.data = &(const struct simple_bridge_info) {

-- 
Regards,

Laurent Pinchart
