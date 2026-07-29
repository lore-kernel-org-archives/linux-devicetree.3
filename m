Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE435C180;
	Wed, 29 Jul 2026 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307068; cv=none; b=Xyg0XsE5o6rgMaeQDs/WYcYfazP3z0u+w3TbJuX4RDvStxmmdkw08VH3XF0mjuYGqeJNImLHgcaJXf9BKET+JGrO2HgwxjbwY7sbgt1e4u1LnO4NqlN5Gv9G83B3b0b0aLZksFvcslVoNFOivXivJJ8iaCpWY4WUPtyUdTMxKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307068; c=relaxed/simple;
	bh=GvnmN4k8ot2+BrnWb+qmwUmKhkGrA2xZxQLRY2fwcp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8fK6K91cJltYTFvBVpIvNHXZZaR6QEHi8cuPPxkeBu9wrRpMpIlpWRyD1v3jC1QR9s/DY95PvhGlcqxtYbJCbuBQU2ljPUNcUWIDQUA2aE53MVW/mDXkObPHpMixV9Cmy3IElhndhZkfoPPPY5PW2BN5+Q5+FlqGxPVS+kjjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQsZReJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQsZReJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE151F000E9;
	Wed, 29 Jul 2026 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785307067;
	bh=gFtOBaYt4v8tf/tSy1jDnMaquKAr/fwb65iurTEaIzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQsZReJiEfWteyX1tkyFmRzgtB9YoH1UboyulElcsk9u3te6lni5He9Wj5co5d5Ny
	 VgsWFvGmkfEH5DPRiOgfEdwrP98R4/yrBbcZ14AD4fgRlpCEJKyy0KnzbM4gYw50YO
	 JONbqlYgQPIkf7rZ+DSMpGYxQaBu4wU9r5YzqSE0PWTfsWjt5GsNbN2qvqeSAhPWVj
	 foD0XSN2IQ6Z//PYT/THnSg/7yAQp1ijD60EBBq5GPWTjW9Rkj1DtOTYj7O+jgwTj7
	 j+BP0BRmvjYSnOZ7xBCu6huuv0aWWI8lCCyVBgxwGrGHRLD6tAOCiVGRrpjs/xxC2j
	 2B/S6FZaZyOvw==
Date: Wed, 29 Jul 2026 08:37:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mohit.dsor@oss.qualcomm.com, Sunyun Yang <syyang@lontium.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <20260729-truthful-cinnamon-giraffe-f250d6@quoll>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-1-bda216bfaf37@oss.qualcomm.com>
 <114159dd-0271-4d15-b07d-20fc1e28ee6d@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <114159dd-0271-4d15-b07d-20fc1e28ee6d@kernel.org>

On Wed, Jul 29, 2026 at 08:18:58AM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2026 13:09, mohit.dsor@oss.qualcomm.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> > 
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > 
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
> > ---
> 
> NAK. You received review. Sending the same is wasting our time.

Actually you ignored TWO independent reviews, so I will not waste time
on this patchset anymore.

Best regards,
Krzysztof

