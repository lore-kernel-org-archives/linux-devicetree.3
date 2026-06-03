Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828B38734D;
	Wed,  3 Jun 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780526314; cv=none; b=Lb4k/j+33Nmh424Wk5tVlMlS83fRFK6hTkKELPk/ugqmPMhVjYnum0UN6ATjRBiMBvxok5F8SmAgH7EWZm2sVhQbtiGZGkFPtJHV0MxfDh+QVuJRux3Fui/iVb99l5Jle3GpP03d8Pj1XA0g2Fr5rR//Mw6Dfcc2c+9Wx1N0860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780526314; c=relaxed/simple;
	bh=ilv29gLjNyYeeUoOHOLxd4D1bhhAyFl52jOaDO3b3cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEjghbDhw0wOvPWqQUTfZKAwTXsOVHgRY6rCXxXSM0zWsETF53YdYNNsm0tD/8NKy4wf66v4TBYp8SnisjzlJkhpCny71xnuKSXkj94N33sksNkfu0tzaC5zsYoOB2Oq1wxEKyl1oMib89TFXcyZ3OF6+F2qRrN6Zmpg6NALSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaMjQ+B/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaMjQ+B/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B831F00893;
	Wed,  3 Jun 2026 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780526312;
	bh=rkG+cBIjlRnNq9rV/Mu8bj0nOhycFAgcW9zQPc/kBHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DaMjQ+B/7a7+MAk9zJkFGg3QpO7baV6w06Mj+t+bJ1ZHTkHuh8WWOLtty5N551CK3
	 dT9umoiWmX1KbxZ7/GZb28X+QIv6xvzAdcZH9vWzSWQxXAycawqG8jiBOgTQTbvOF+
	 BzRulMlTrn+Oloo30phB9/k+yFe6B3dXMY79NfvhvBlL/IyatYJ2uh0qXIbmLimYfD
	 LhHa0Ia4fUi2QoJSZkVk87XoC0Gk7OczP9x5KyeK04P+VWVsVGqBYhqTBET27rRUwj
	 1xM5o51FR/w0lY9MhtGPXJEJxPtRD2Adswj+W6Ys+F8oDEZozz6axijrL0C+qv30TC
	 JBy12sIv2pgdw==
Date: Wed, 3 Jun 2026 17:38:31 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: arm: omap: ti,omap-dmm: Convert to DT schema
Message-ID: <20260603223831.GA2297165-robh@kernel.org>
References: <20260603-ti-omap-dmm-v1-1-ef491c4699d9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-ti-omap-dmm-v1-1-ef491c4699d9@gmail.com>

On Wed, Jun 03, 2026 at 05:27:39PM +0530, Bhargav Joshi wrote:
> Convert the TI OMAP Dynamic Memory Manager (DMM) dt binding
> from text format to DT schema.
> 
> During conversion following changes were made:
> - Make the 'ti,hwmods' property optional and mark it deprecated as it is
>   no longer used, it is kept to support legacy dtbs.
> - Add the missing required property 'interrupts' to example node.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/omap/dmm.txt | 22 ---------
>  .../devicetree/bindings/arm/omap/ti,omap-dmm.yaml  | 53 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 22 deletions(-)

This should move to bindings/soc/ti/. Otherwise, looks good.

Rob
