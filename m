Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536303D8117;
	Tue, 31 Mar 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946443; cv=none; b=t5xUbhIrZZ8nJ3C09FJv8FmDPoyxh6F8vltV/lvMNzuRdH8lFaZFrQSnSAw55OLcA6lFc6pM0mU3st33LgEGfl7rWbGd+pf30jyI27xuUNvMXSnkdvL3hOt/XPxxXPuTGfJddoFwmyXXK8oUmvwCmFb6zxwN7BsTVYz+yNL8KWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946443; c=relaxed/simple;
	bh=S+JkeryNZVuyZRhYrs9gUBZkWG89MMe6C4ZK+56EOmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTp9llJiQPAdXreNxu0TXMqwMwLaLSOhiQi7p+OjKRKrDHaXawqmC1Ot2QdkuLMXjb+05oqQt5uwEW1fZOE7izTRbx6ByZlqpDhey74wtTvfaVIHTcGapComzcvP5Rj7xhjlRPl1zJhDI33oi40ObCj16Vysbs037zsKWV5754E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh+IbkrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh+IbkrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2853C19423;
	Tue, 31 Mar 2026 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946443;
	bh=S+JkeryNZVuyZRhYrs9gUBZkWG89MMe6C4ZK+56EOmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lh+IbkrMzODXfiX/lFMiDNAMbEvTA9J92F8DwbGPkQSXTSLRKZ97umq5UQOKRoEwE
	 9QgHhW1yZhy51Wyy7YeYiOapShFR83yX4LBZ6e2+tveDYZM0SRU8TBed/8eI1Aqhhn
	 9Cf55GXsownrC5yzqOS4R6VDfJwsoVd137s8++moONAFMauHReGbPntLFmVYYz99pK
	 cI4ANiFvYrarjxyn28Whz4foPTzo3pqa0zJXDJzFPb+VXYp+rm8RgSen8boScKHBYy
	 yCEm+k6jCatygT0Ra1XOLq/EypN13js+3jS0G1noalajPa2KCShs8NebqpkLFIdOjY
	 GCwYGe814MhwQ==
Date: Tue, 31 Mar 2026 10:40:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: add Waveshare LCD panels
Message-ID: <20260331-glossy-steady-chital-df0b6b@quoll>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
 <20260330-ws-lcd-v1-3-309834a435c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330-ws-lcd-v1-3-309834a435c0@oss.qualcomm.com>

On Mon, Mar 30, 2026 at 04:25:52PM +0300, Dmitry Baryshkov wrote:
> Waveshare has a family of LVDS / DPI panels bundled with the DSI2DPI or
> DSI2LVDS bridge. The bridge and the rest of the logic are covered by the
> waveshare,dsi2dpi compatible. The bindings already include several
> entries for the panels from this series (waveshare,13.3inch-panel,
> waveshare,7.0inch-c-panel). Define compatible strings for the rest of
> the panels from that series.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/panel-simple.yaml       | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

