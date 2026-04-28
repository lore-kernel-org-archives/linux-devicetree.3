Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04A34F25C;
	Tue, 28 Apr 2026 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361971; cv=none; b=pzmSJVQCumt8kr25ZJjI80DIRA0oru2U0nj44gtAphQrhL3+sqg7dQDk46Q1MLrHYHV4rjXBn+wFazcTBsRHkYKg+Yebgk0lgUeJ/rBCbJtBq03aC7o8kBXkaV7/4NAf6I9o/Wo/UNZPtzF0i6IPSKNX1nFQtaVOiKXtabxf3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361971; c=relaxed/simple;
	bh=UFT+K+PDKPQSW0ONxvQCutLaWbCpyvSTzbi8Whq8mPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAzIikfHDH/55R6wkGyAyKS2ZsBh6WDq1oHYe43M1QkU6OZC0w2t97QEOMAZ84rp/3reRdoofF2faazZ0B5k2ZuaNZlJQQHzpYNP5WhyGdaNacAXRtFd/ZqLFnjILx01oyGPFqm+ucf/C1D9h6NvEC0b1/wmIiPbOx7p3kYI9MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bShYofMU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bShYofMU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F0AC2BCAF;
	Tue, 28 Apr 2026 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361971;
	bh=UFT+K+PDKPQSW0ONxvQCutLaWbCpyvSTzbi8Whq8mPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bShYofMUEgHChAVhaCcjQFFVgyZWdN4ny9wml6VJ9NagtD2bvpBe6gwZRX3YZ1vU0
	 jB3gm1MxC0UOYCYWEGk6DZb20/dT5oRqt1qbwsGvPRFbQlsepg5Xk82F3SfSSLs6Mf
	 nfcW2yY2SFs5Iix37V5C+sdPzlaS+4UldHy2nLPa7MaaPM2LrTV5G6VrWyqA7GNSsh
	 GRLT0NN3j0qktHbDy2n1QhCE3SYVgfqt3dvQv1wN+UZqlUBbUXe/YdKaT1WoTKDraD
	 RgIDpI5jJRepIYLHZlj74asvqeWQg4d9haEZdx56mjcHYHuWUeqi78CSZ5sQ5+YmD/
	 b3c+B4zRd0TxQ==
Date: Tue, 28 Apr 2026 09:39:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add TSD TST070WSBE-196C
 panel
Message-ID: <20260428-misty-tuatara-of-downpour-0ad6eb@quoll>
References: <20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com>
 <20260427-imdt-dsi-display-v1-1-bb2768de120b@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427-imdt-dsi-display-v1-1-bb2768de120b@imd-tec.com>

On Mon, Apr 27, 2026 at 04:21:09PM +0100, William Bright wrote:
> +---
> +$id: http://devicetree.org/schemas/display/panel/tsd,tst070wsbe-196c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TSD TST070WSBE-196C 7" 1024x600 MIPI-DSI TFT LCD panel
> +
> +maintainers:
> +  - William Bright <william.bright@imd-tec.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

No need to resend just for that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

