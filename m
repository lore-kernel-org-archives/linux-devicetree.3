Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621543CCFC0;
	Wed, 25 Mar 2026 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436977; cv=none; b=sDtfVCDEbxRobBlX3IBN7kCHz/bebs/wxVVSC2tgqBDpPiBukBOCQkouG0Fj0s++xzJI0u11XeWwj7uV1wo+IgAIRfAH6bknwGUxP/wuT66sOYQObCk0/fnUQmlbh2imDgXe/Cgh9ERGBbwEsSwaDJQhBSbdYKeO1xGrbWumYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436977; c=relaxed/simple;
	bh=Go7WZ3gcy8Mcy4Q24LtNd7MrJD1wDx22gsVFUUeGqqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6h9zc0aQ+JznRpcnB9Tz6lTDQ1sbIj7zKucxFVJ0ZhQkrQgMyOy+zAO4ZcKIdVbw/qnpe7NTvSLM4xAp7ZeW5vVoyyUEo6H9mVWc08yZzPjBuxivE4oJVn2zpSx2ckyLOo1TMnci+8CHs2OXgK8MsELMceUO7HE0VRXqYrqBf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ah+bvs5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ah+bvs5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4FCC2BCC7;
	Wed, 25 Mar 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436976;
	bh=Go7WZ3gcy8Mcy4Q24LtNd7MrJD1wDx22gsVFUUeGqqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ah+bvs5LBZAfoOwUUla6nusmiyaLZFun4TQEf9gwxch8iy9kUhXSiDmYpn1ILo7x3
	 4kHLvwCEQu30TwZk8XREPfUDYLirwTKR8tIHElQ7kBeewyNAFyEBU57cAgX3dMfPDK
	 v4w97PHvWHUPhdl0ntFAM34hVSnyT/0h7OPp331xO6qQnPrRFqayfqL+OIDF7OlOWt
	 nE+8Us4EJGJRAgCF+LCSe9ys5T4/KH9vF8DNFYOoyqK3qPoIGq/rIOJxlmke6ACJ+M
	 DwiWjXBXfDgEe5L3Xvdu2CONgRtl2JoijrqYuzj7NrzSYBLL+lGmwMV5DJY7rEcxB8
	 8v/qh8i5fdoyw==
Date: Wed, 25 Mar 2026 12:09:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: ti: Add verdin am62/am62p
 zinnia board
Message-ID: <20260325-persimmon-mouse-of-courage-bff7e3@quoll>
References: <20260324093705.26730-1-francesco@dolcini.it>
 <20260324093705.26730-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324093705.26730-2-francesco@dolcini.it>

On Tue, Mar 24, 2026 at 10:36:56AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Toradex Verdin Zinnia carrier board mated with Verdin AM62 and AM62P.
> 
> Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 4 ++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

