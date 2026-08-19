Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C18397B0B;
	Wed, 19 Aug 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128583; cv=none; b=s6ZqBWux0ggMYUZEDAdQLKeWf/FoYXnqm7bg0Gd9jzzpeN6d/nSO5FsUB8pEidMvPjSFvfG02y77GXdnZJvN7FtaXDnFsaBifayLjpdxjOg9jzqTQXQe/D7wH2wpQ9ehM8VNsS7EN1GBy89k/k4vlf/bNy9iKFLD6y7b23e9Y1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128583; c=relaxed/simple;
	bh=n74KpxWbju2nOKuWoPaAoZ43xBTQDu1bCuE6Zj4MWwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMhQ2rRgwSF+5B4uMXDUz9luUPOAeV0/xr0HoSgHp2YT+QxfbovNmGGgQ8/HrHSh6mYevqQ+JdyNrsTODoUiOSiHk9qJvknl4kXMgNoRfNF7l2izB4olPF1wNqKn6Y4V7AlhMzOXc/6lJgKs888EmiG06EEZCZ+jCB0hvq+anfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VERpbohU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VERpbohU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C031F00AC4;
	Wed, 19 Aug 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128581;
	bh=xuxB9q6uTPI8Xy1X+ubySJHSlrNsjy9Efk1Gekb1/k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VERpbohUyze9kFPzsEJ/SWdBaleppYFCvAP4kGgvkBIhbZ978k4oCSSez2K86taTI
	 qp8VtLN2gD3XjIi1M6cZo2VpsIOQFF6NPD5gOUWqAGWQsZLsEnWIY9CIrOrVvxLkI6
	 8RF2SbrlKQEXzbd73cAV8ndWUIOM0HlwXsKNwrWTUSKwlB99WwwZNdEBL83dX3mOuB
	 d67MXgD9z4b41o+0LPATEbY8oMK6t51kR4UHubu5PBh82aLeBLTR+IqdB45Fi0nLsV
	 WpJ7mTBIrM7jyblvWG28v39YHqKA2uBs9zElxDs7F0b1armHIIjuizVPTFkcl/CEEU
	 HGayd5BuHt1CQ==
Date: Wed, 19 Aug 2026 10:36:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7836A
 OLED driver
Message-ID: <20260819-rich-artichoke-goat-e23fe0@quoll>
References: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
 <20260808-ili7836a-v1-1-07a7becc5636@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808-ili7836a-v1-1-07a7becc5636@gmail.com>

On Sat, Aug 08, 2026 at 02:01:14PM -0500, Aaron Kling wrote:
> The Ilitek ILI7836A OLED driver is a single chip solution for MIPI-DSI.
> This is used for the Retroid Pocket Nova panel.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili7836a.yaml    | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

