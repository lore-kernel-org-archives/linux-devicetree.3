Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D882D780A;
	Tue,  4 Aug 2026 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826513; cv=none; b=PLyQqyTl7DXQxvbs7z3iViE6zlDANgHxmi4CTgXOmcLW48Ko+Ws+0kxVohqSB5KrftkG9wdAO4eJe5VxM8HDlvi6JnxI6cH73gEeH02xvmYxuX8tfVrAW5Xf/FlfqATwBpL3vxSBI4QiG0AFG4E7Z0QYgHmrG6AfrGQGX4HOATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826513; c=relaxed/simple;
	bh=MJEmJ4hy8no/5Lw/Ip3P5P1UQv1EofcUPqT42z16rLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOJqqFrl6m/iRok6zw8jICN3n1hqQ0XgOr9D6yydwNANrEinov5AGcjvTtWV5254hae6BHnDYsvlAOMse1dG/ov/O0bHBaYUvfg/zFx1JYM//MoJq8GT8XWAAufItkJpvMfoQH1sFpGizWdXZ/Gkz3HgfuBijNOD9q7+ENEIxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjQHWkAh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjQHWkAh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7931F000E9;
	Tue,  4 Aug 2026 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826512;
	bh=IwA9Whetrb7CNUR7iia3u3K6ci1E63s8f3RwkpXlLlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjQHWkAhQfHOgYdHvyfbBibVjttKRpJOv2AMj965eZRz0emODYXuipK8WyVVSqTgd
	 Ugp1ze89W4TKvz1qLroZmnVYC1/XQEt+oKFXNhHNvW6v7iJuNv/bk5VoeTYnGHGLZq
	 yNRiHkr2S0VFqH32+lVIlYdYpQ27IKnM0TJn5NcpheuB/mdfIfW+4bQDIVCgNaj24C
	 hY8z2HsvpUZKND8gHq0oSA+M9ifgb1oWwqvkVdeXUENFOH9zyyZuPFZPzbOO1djavU
	 udEh0eIIF0xs+T8L5btfl6EdXNM+ACjqNGUtB5pkfFUB07OOryritU9cGhehdOU7yk
	 6K1n0VKi2JBmw==
Date: Tue, 4 Aug 2026 08:55:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Fabio Estevam <festevam@nabladev.com>, linux-rockchip@lists.infradead.org, 
	Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: soc: rockchip: grf: Add RV1106
 compatibles
Message-ID: <20260804-steadfast-agouti-of-stamina-efeedb@quoll>
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-4-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729133609.3465563-4-sjg@chromium.org>

On Wed, Jul 29, 2026 at 07:35:50AM -0600, Simon Glass wrote:
> Add the compatibles for the general register files of the Rockchip
> RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
> controller.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

