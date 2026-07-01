Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE7431E6B;
	Wed,  1 Jul 2026 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935750; cv=none; b=GYL+AGnk4mr0ipUZ+cl7VSvPJlNAz5WU/f50+0nKrL2qtyFfwG4AJecEGdy9dtZbkEL4VhVtvOeQRmZZyg6tgVOukeGr7BnclW1NCoeiMx/AyKMM4VxQQ0QahKjiADJHjZenVI/MM05O3ISPLAeVILqB5U9hZT/uvyPdtiuCLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935750; c=relaxed/simple;
	bh=pOFkrA3zCUUVdWqBIPFy2zYh6CO+DFoWtbnxpaCJIEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb5CThu3wKuDSNPP9/FvYcybJlu4c+ojaJP7P2ghgUFcjppb0J2pDz8TxTwZ/NnGeQIB2A0dZatykbVVySO9VveRMFbaVxxDxA0nl0wxtlEuZzj7WhehNr1F434mKwzHatFJ55wzdZcUMS7mEhXkWzSDppxBA3Eterl+Hbstnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1hpxxz7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1hpxxz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B00E1F000E9;
	Wed,  1 Jul 2026 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935749;
	bh=0wn5niCO/L6zQgj0eemljpNDylkhdJtawO5djCFgqo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1hpxxz7RAlyGIKGmgqFfIHJHXTzLLA24GwRODxJtufo1FJp+IKce60UoN+8NVf1q
	 NPfhe5ZVsg7qch7cYViw/hHI26AWZDaaunbfRFXpLwPgV65rZdo4XJowEuUoYiidfb
	 6wPEvvpoQS1LPKdEFprowanstGjaMWW5iWvstAq9U+qc3ogSIL/Nywea/MyC+1djWl
	 3yfWJmwF0QJIDw8QbfRM0h0EffxcIMdARIDuIqVmrNqyqFKZXXalPiRHyguzcpxjNz
	 Cll6WwQTqnPBxUzj3SPH/5OQmrLFMwtDMOYngp5m0BPAwUVtl/wSs0qUII/OlLjDxj
	 UheQJfXCHz+dQ==
Date: Wed, 1 Jul 2026 14:55:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: rockchip: pmu: Narrow definition of
 reboot-mode
Message-ID: <178293574811.1635397.4546983398159311773.robh@kernel.org>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 01 Jul 2026 12:58:50 +0200, Krzysztof Kozlowski wrote:
> The 'reboot-mode' child of PMU node must be a syscon-reboot-mode one, so
> add missing $ref to enforce the validation and disallow other
> reboot-mode handlers.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
> 
> This can be further restricted to match hardware/firmware:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

