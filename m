Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19173655D6;
	Tue, 30 Jun 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805568; cv=none; b=Y2YEJVVnuNnGKz2xSjuwl/gYlqqiEJc3zMwBX7R5fhW0VMHROsptj0hPc5bxnFU0XULGLyxwKdVVmYATVYTawwaHhvJt4iFLrKTstmpmgKrX8+SdL9TdGIqR/BRf5FBGxV/5gP3zqW8EQkAYDhXjW5bCByZIMhaEJJ8QBWq9nMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805568; c=relaxed/simple;
	bh=KJHB83GnWnnrWwuXXVXSExmjDf9VQIe0JXA+Do8zQRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3vXugzBJn9A3FZ5pJrgHBY55f9DhEIkE60LKuu4QtfC2xqLJbfdAlahzzDSdNZ1MGJIpOs1nelYoN2OhCk2eiL5yG7j/jF7B8n4RkgPGN6RYtIefIEMBxAgGx0bMQ+sBUMlND+MU1OzkcZUhkmjYAh5xtVXoRc+Egb+V92QwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0XbB2vM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0XbB2vM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A841F000E9;
	Tue, 30 Jun 2026 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805567;
	bh=BneXgfQjYcjalGELmnWGSOHtMIAn4pI8vNVZoFuYMac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0XbB2vMT67FaNuvfrF3TI6s7eh4nu9otGcu80RlRxMIj5hmqAPn/pjHud7sbH3Rd
	 woiN624m2UrpjkfctseTbXMjQR9uBtTTWEkp+sHi8A26UusHtrGHXc00GyUbXPgCSo
	 Y+DKIgD+pTHwSXXpDZUSyDZciteQhMmu+l3xmTYqJNHMVNJfWO56O+8GWgbMkXcBwZ
	 x+GeDtGdM0yCWx3gqGnTOQMyJ/Xsyl7yS1ltMuvO0A+OYkNciRkfGboGq0Rg0+L8CV
	 J/N1YOozIJeRTpYvsVYzlhwLIeBFWwdfc1lRVVo5c9kDQW0RRJIl+SRykGX5b18OgH
	 CbDk3RNeRLjBQ==
Date: Tue, 30 Jun 2026 09:46:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36536
Message-ID: <20260630-tanuki-of-extreme-grandeur-ef1cb4@quoll>
References: <20260630023439.248861-1-mitltlatltl@gmail.com>
 <20260630023439.248861-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630023439.248861-2-mitltlatltl@gmail.com>

On Tue, Jun 30, 2026 at 10:34:38AM +0800, Pengyu Luo wrote:
> NT36536 is a driver IC used to drive MIPI-DSI panels. It is found in
> LENOVO Legion Y700 Gen4 with a 10-bit CSOT panel.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../display/panel/novatek,nt36536.yaml        | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
> new file mode 100644
> index 000000000000..f854fc99ba81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36536.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36536 based DSI display Panels
> +
> +maintainers:
> +  - Pengyu Luo <mitltlatltl@gmail.com>
> +
> +description:
> +  The Novatek NT36536 is a generic DSI Panel IC used to drive dsi
> +  panels. Support video mode panels from China Star Optoelectronics
> +  Technology (CSOT).
> +
> +allOf:
> +  - $ref: panel-common-dual.yaml#

Nothing in commit msg or description explains why is this a dual-link?

Judging by example this was intentional, so it should be mentioned
somewhere.

With this improved:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

