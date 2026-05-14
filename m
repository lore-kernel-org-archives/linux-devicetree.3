Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2813385D9F;
	Thu, 14 May 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753005; cv=none; b=Hx/sqm0xfXnEytGrYCC674Z+TBkMfrRurED40zppQqudqblaEot8d/FyXLdQZ8FRdvMclO8/Oh6WNtS/mxQq6ZuW5b5EBQXY38Y2QJkBiQJUHDn0wnmKZJwX9Jmbuu1xfw6uUA+7ZTLtqGpx6VQq6DusTBArQtB/jQrN8tzONnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753005; c=relaxed/simple;
	bh=eU1EYUyxKUydlQNJ+xAxAssRfVy3MHIEswP/6qw7geQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjs4iDwl7fyj+nwUFg7gnJmTOvO+SKFNr73CLDJ/L1J2yb2scOJpEYHsvyjQ0j0xVkbxa0ImIMbp4UMYdXPh4dvZctb5O7YkFi6qrkoQJvwyMKjvWbP55hnR6iU9q1MctJfwXpLnSZuPVslBw3IiUvUxh84entxUfhZ9PN7GbMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjRggEcJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjRggEcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E16C2BCB3;
	Thu, 14 May 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753005;
	bh=eU1EYUyxKUydlQNJ+xAxAssRfVy3MHIEswP/6qw7geQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjRggEcJoBqqvzhAfk8uDlGzbN+fWIEB6v9ayYO/nj6a0TGULZA//piez8JarOJjL
	 QGd2G0jTgrkp7UCh1FI/NYiYPknn4sfrluQi+c3KkHMOII6jtwkFtgkEgdIa7UlHwv
	 i9XrOj+t1VihC1qq2MaMankZACs8/fK97sDtFI4zWQ05VYwXIwDFkcLCXe2vqzi9Ua
	 dXawt8bbnTX9W1PD2nE/Nzo7OumP3goQJk8WbroACgRKDEOKywszgPwg4LKVJOkQ3W
	 HxcafGHjgtPVJWLEgJSqgirVk5PtxP26mGLuR4a5pLZ81urqyPvZ7PzDvz0JTOTWKI
	 KzBB/NcWSHdkg==
Date: Thu, 14 May 2026 12:03:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com, 
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
	dianders@chromium.org, m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260514-elegant-agate-pug-449ec2@quoll>
References: <20260513074414.2053435-1-damon.ding@rock-chips.com>
 <20260513074414.2053435-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513074414.2053435-2-damon.ding@rock-chips.com>

On Wed, May 13, 2026 at 03:44:05PM +0800, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 (video output bus clock)
> to access the VO1 GRF registers and enable the video datapath.

To access GRF? Then it is the same clock input.

AGAIN (reiterated soooo many times by me): you describe here clock
input, NOT OUTPUT.

> 
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
> 
> Enforce the correct third clock name on a per-compatible basis to
> standardize clock requirements per SoC. This makes the clock
> dependency clear and removes reliance on implicit clock enablement
> from GRF phandle.
> 
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index d99b23b88cc5..8001c1facf98 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -23,10 +23,7 @@ properties:
>  
>    clock-names:
>      minItems: 2
> -    items:
> -      - const: dp
> -      - const: pclk
> -      - const: grf

What is 'grf' clock in such case?

Best regards,
Krzysztof

