Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22725D530;
	Fri, 24 Jul 2026 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886952; cv=none; b=QNhkvTMuLAeBN3zY0J7dG8sG55Wo/sBjaqSb/J4Ln/VbLSEjIXdOfxI0gTHwHnHAHK4m9pKn+rELIvGGNMIfQFNdgdNJsBzgJytRYLPce2obKn9sNqoj4uoiRiKaPaAVkO7wJnhCoUXtL2m/gq7o2gaYGNDF4tTUTvsK3ii9VjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886952; c=relaxed/simple;
	bh=VSopN+Fwpto8t20mqCBeQZiJ4y4NitvhKC0QxOBdC0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYcdq3AIkWR4lZ5fwWTMxfDeM5RyzGcdQoCG+T93CkOSn/MtXgbIAXDe62n6XIM3Q9EbUu0PvIVqiWDAgrN7xeC8jkrw34f8kMHEcQ4E6C3UVu5nK1gY3+dnd6P27xDXACaYO9JIHdvs/6hrnM+GbLeeLkZzDY/0BEpNTDdcQT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITGaH58d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITGaH58d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C7D1F000E9;
	Fri, 24 Jul 2026 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886950;
	bh=4GIrrcMk6JokeZ01gAtuDEZ+WrIu9l+M5RXtW7uNr84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ITGaH58diJxBCmPQEf5T5hV26voL5PB67MDmmpuIH5RvbU6N2GXDnPdgk6haJseSA
	 rhVXxLl+ZRzrt59/yUulsmRuh9K6ICu4EGa7BO3e5FneKoWTU3RWwO2mDGOgUipoU8
	 vygmtB+4zB9K0BxTIRUK7w7lES9vX0RKeJC0DA/2CzMpcRAqALLWKtxCq89BPaQ4OU
	 TGEl+neuHtkaHDnJxFL7mUmUMUABQv6MF/axrSCwzDABLqQMG6tDIyLUzt16BAz9kz
	 Oyb+j2nlcFx/rk6x6y0KYYzQBTMbW3RPcXaNUs1JfkXig63R7/h5FSPtxpmyiB+vZ8
	 D/fiEhoeaLnCQ==
Date: Fri, 24 Jul 2026 11:55:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Ampire
 AM-800480N3TZQW-00H
Message-ID: <20260724-debonair-brass-serval-e6bfc1@quoll>
References: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
 <20260723-support-am-800480n3tzqw-00h-v1-1-6a4ae0575a19@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-support-am-800480n3tzqw-00h-v1-1-6a4ae0575a19@bootlin.com>

On Thu, Jul 23, 2026 at 06:31:49PM +0200, Paul Louvel wrote:
> Add compatible for the AM-800480N3TZQW-00H from Ampire Co. Ltd.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

