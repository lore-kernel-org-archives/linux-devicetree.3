Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D5317170;
	Mon, 27 Jul 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134998; cv=none; b=VjlpC/U6GkWGEe0FCXXlthaxrW3ANtkoGueTWYHsSbApbMI38CBAI/KQ5hcpFB2uVu+a+IaL9lAIzmgaK2V8s/qw9VX9GYwNIbd+onBeYWOuS4fU6IHymisQQlmC34xdLx2juJ/pOrYkZW/4sOi7ChxkR5HgIb2LiDLV4MsNLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134998; c=relaxed/simple;
	bh=Wl8JI0Pe382+T8bM38PzhDFuGYu7rJiytwfyN/SLDvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7p08Crxu6juBqxEONm8WCN6EH7iGx7DhJxn0uiRHVTvt68A6xVxKAvgjAEFs2BTV2j+5QE+HvLb/obPkQktcw9Do6WYj6iY4Yo9iyRYEByw8R/0rdp5UPHLoVrD5S01F9gJEIXIwbnZm4xVWJbdAMj1J0NGp8jxXG9mrlQBsTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifF85JeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifF85JeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ABB1F00A3D;
	Mon, 27 Jul 2026 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785134996;
	bh=MlGR9ItXAmQGjETy7LCxdY/92Agqr1/MA8xAziWH4oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifF85JeNmACewPI+iNuluPZO5mVGRTaEer/Y6uWO5HBXFrqpCtQifAhhqiMtaaSpA
	 QcXtnb9yWpCBmc85kkw7GDKHyboDWsaJ0ZJxWlNLZUrJg1FQW+G5ZPCY2/WORFwh+Q
	 rmiDATKJIIEVJj8Tv+9LM5M0PMZ+5okjD9upyypI0CRYjSoYMb9ilB2hQB5Mfk9knb
	 I6VTf+OMShJbpDXQfqemSWe+IPSukSQCZwE2fnMlNwAILS40gSTHiCvbdAJ/0UocKj
	 Utm/tQdv3VHtxfLFJhbIpAqPHQhrblAvzyenhhUrlwapgTwtrbHBqsOCTsu077EY5+
	 zHu/dwYhgkC9g==
Date: Mon, 27 Jul 2026 08:49:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@flipper.net>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 15/16] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <20260727-luminous-spiritual-grebe-72de7b@quoll>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-15-041d99a19c4e@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-15-041d99a19c4e@collabora.com>

On Fri, Jul 24, 2026 at 08:03:37PM +0200, Sebastian Reichel wrote:
> The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
> to select the right interface.
> 
> In addition to that the RK3576 DisplayPort controller is configured
> with Multi Stream Transport (MST) enabled for up to 3 displays and
> thus has a total of 6 DAI interfaces (I2S and S/PDIF for each possible
> stream). Meanwhile the RK3588 does not support MST and thus has only 2
> DAI interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

