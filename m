Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711B3B388D
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790530925; cv=none; b=ubICzpWHkOMZpYYeN6ZxRpQO6UelJMG7fomsQHEEE5aEq5lJqRjxGTeU8GFddT+H4H5HC47cNlZ4vtEaBYCOzc6XYTj1SgaOw7u3GxUF4GuaJchXe5QiC0jTh1dNlH4bIQcdSqfJyjCBMeiPyc6QHstQyIH2uqMGRn5BkQtubbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790530925; c=relaxed/simple;
	bh=Ih7qOO7ZAsKK++B2lvXaNo1x42zgrfR5awRGVSrHhmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPbdf3pDUWaDHCg7Xox1Nwv3Sb94AXhsfynOqL/H25w4YRGaKt/AzbJuJ8AmGtuhLKcJ2grLPkcLzv1GDgjQteHRLg+ieTfvWv7xDdGeKkCHAS9TdIWv1Qa0j5O4VT5izoN2LPSTQsHqueMY8rL4mOQZ/T2TebRaDmXMdeJ1BvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEAv1UKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEAv1UKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3241F000FF;
	Sun, 27 Sep 2026 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790530924;
	bh=M2R8EMCtjqgp1q1NPnQ6MJ7JMpNjZuPZJDYN1u2/JAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oEAv1UKQJT6is75huFGYW7NJC04wu+aBTFD49Ru5Mv9YlyWpD6/E1XqyQaos3wo6z
	 Xp1oRzBqw21PN46cOJYweBt8Tx5vVOLI0zM5GDCd5EpAvqBiSMqw/k73RDgN3o84zN
	 ELs0UihXcSPIsV7DrOXPh8kBDPp7rZ1IBv5TskValWjJ90w9gdrfSCyIdsdFeMS2c8
	 HUjVowyYU5YSPnpYyKkrkotqTnS7kUWmEXIUmNfyT8fSFKkTHhJdc7HpTbZpvqqmfs
	 5A1Uebfc0lYx8FfeUXNZ3tDN2es3W9MbAkaYhlQaCSaQG03wVy70qqhx4noW3TqV3e
	 UrlFh3ZymiP+g==
Date: Sun, 27 Sep 2026 19:42:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: faraday,tve200: Use a
 level-high interrupt
Message-ID: <20260927-steady-infrared-penguin-baa4fb@quoll>
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
 <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org>

On Mon, Sep 21, 2026 at 11:15:54AM +0200, Linus Walleij wrote:
> The TVE200 vertical interrupt can remain pending after acknowledgment.
> Using rising-edge triggering can leave it unserviced when no new edge
> is generated, causing vblank and page-flip timeouts on the D-Link DIR-685.
> 
> Use level-high triggering in the binding example so a pending interrupt
> is delivered again without requiring a new edge.
> 
> Fixes: 8b17e80d9e46 ("drm/tve200: Add DT bindings")

Example has no impact beside validation, thus no bug to fix here,
really.

> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

