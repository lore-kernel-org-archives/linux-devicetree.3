Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47334E761;
	Mon, 22 Jun 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134726; cv=none; b=BEJTc+xNx8hwA7o2ythPDvrp1DpNpPuOWYnaGAQbrlbWcEF3LUmLoxQ55DqWWWe+VrtxQLoPGZq2MnTdOkTEDJU6uF4KvCufyEOYo4UbdsJX0VtvtaiehE6sVmlWccphVzjyydR1+yNCuQDw9gqM1Qx0lUtvsS6dl51WSg2r/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134726; c=relaxed/simple;
	bh=rI/W0xY8eXvN7jITzVi2dKXVO639DRgHM0p7RL4HKkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXKEr7kQSxRGQ4Np76sz5lF5Hs680cemXahSuZu9wj0ktO5eRaWp0A+dLG2jZW+xALbA+jxiF2RZuBVU481nEn9uSz1bekF4Oil+Ng/E9d/dkpcvA3zl9FzKP+8wQUypFz/xOt50RWZeQEAfRzIQ6RMTYjlp5WL4bAwBw1VMsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZP4GKUd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZP4GKUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BB1F000E9;
	Mon, 22 Jun 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134725;
	bh=t1/4BohhGo2EUrrvlpDhy0cqXEeTRxTzPlRg0AoQPr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZP4GKUdpXZ+B97QpIjc0FrjAYvpNtY1aUIlYxeckr2egsgSmZSHCnOfOXlBnjTLR
	 fpH9nKQblmVzdoytoSbVCqKxLV+cL8Q/wzIViiWMjo58VBhDD2fXztw8EJ9i/pqdbu
	 BHpBW3C9wxTGlqLlaIUHbOlQdNnrfF+ea7eb1i0ThrjY18vkwAb2PnHm/PpPgE3ftM
	 GR2/5RpG9LVytCklSbxeGe/tOdbnsaU6Je/kw6xnnoB4A29fGuf33CIqKemCcXz2Ed
	 /90h+rBYCu8V2XZAUScJF2kLzErXsLJ8FdIUIZa/xXZRkXlx+9OqGorlBsVKOKtVN2
	 DdkJPUfVoewCQ==
Date: Mon, 22 Jun 2026 15:25:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
Message-ID: <20260622-magic-unbreakable-agouti-85cad0@quoll>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>

On Wed, Jun 17, 2026 at 09:51:54PM +0300, Cristian Ciocaltea wrote:
> Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
> clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
> provided only on RK3588.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

