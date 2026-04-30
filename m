Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF043FE652;
	Thu, 30 Apr 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539164; cv=none; b=oPowl5ch++zK+Ovw1HlQJYeGtkUozt0ub6hxNBE4BUKVHo8skIJZaCQYRX9h64KzP/wF0+4h8pcwX/LG2EH67nK7Zs5HNP5k9daHxJZMCCBY/YG6uiVfrPmkNHuwuffPIrgpexo/nZqo5uw5J9Gzz4BQSJxry74Gl6aczisgwsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539164; c=relaxed/simple;
	bh=u545+Ezl95chpjeL8Alf9JRet/fhJTbzn6AdcvXJRR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB9x2kI5zXA1d4Pr61xRYLtP7g0XnDB3WR4DN0iJnq7PJyr6DC7/CYQMZ61pD/Wv5RQLcgkq9gRT+jpKZQpQpFbiQQYC2crEeIjMGmQHAg0McoA1+lDX47q26s2OT5Cij/NjSeCk5JasKUCM7Yg15BUwyXgahBfqB4+roZHF8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U31Bp+Aa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U31Bp+Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225AFC2BCB3;
	Thu, 30 Apr 2026 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777539163;
	bh=u545+Ezl95chpjeL8Alf9JRet/fhJTbzn6AdcvXJRR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U31Bp+AaKSjV9qvCEmBiZyCDFj8wqkn71QzWNqtMh1lfRlPNjM7XVFP2P1tfJlPh0
	 o8QE0GNsiqpugdduwlezvg8SDHO0xGf3WNUOKu3aDHEm1mdIquheAhOdz4fl+cViu4
	 1uLRHSOtGltJSWF2/bElKyXatrK4db9j8SI0mEVcUr3sUV+VMuGfqb45PrrFrMdzcZ
	 /Zepegd0tekyMG8H2APX4NPXwx6x/um+a99BaziS2HCvDa/uPU9zTp6+bOVRCIYTn+
	 EVgn5qZjIEfbuguA+KaYDATc68k5tu/yPh5/GVurDqIekWJu+inQaMalbtHNeq/tA+
	 yCTl0LlEx9Ugw==
Date: Thu, 30 Apr 2026 10:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: panel-simple-dsi: Add Team Source
 Display TST070WSNE-196C
Message-ID: <20260430-notorious-delicate-skylark-f9ad2e@quoll>
References: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
 <20260428-imdt-dsi-display-v2-1-cf7294b5d7d6@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-imdt-dsi-display-v2-1-cf7294b5d7d6@imd-tec.com>

On Tue, Apr 28, 2026 at 04:17:24PM +0100, William Bright wrote:
> Add device tree binding documentation for the Team Source Display
> TST070WSBE-196C, a 7" 1024x600 MIPI-DSI TFT LCD panel
> using an EK79007AD controller.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

