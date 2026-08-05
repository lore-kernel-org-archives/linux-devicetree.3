Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D33E3140;
	Wed,  5 Aug 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914526; cv=none; b=D+YohqqTsrFFihr8Cm/O+tBgQ3G+aikg28GobI+7r8gpu9E6Tu+gyRy6fk00k7/sJjY7/l+M30G68Gl3zLdH+d4Pkfm3xYlrbxSRyPTQNP1GjvPGRqVfHsWykULJUlEZcYFHBaYOKJFEHQCbnWw7tXxvq+ZUk9Sy7UlHP+AovGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914526; c=relaxed/simple;
	bh=ZWdnDNWUgz1RZt1QrbsHwbfDAv8WKKMDpvC134bHx+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhALU21/GPerXYWZAZwQmj6RZ/8JlW3LZkZob6+bDT2z2QpQM8eSH6pxkHmdxxn9OKJ5F1E0pmHAHJrtU3PMgyYlWSguhf2jh+tHqgOSlfyBGRlLoEifZwoBRq/eoBY7q+8K6Kpyy6zRmMWJUEggAoJfk7jXshivTw9DSkU0BSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNMtOmDb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNMtOmDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99271F000E9;
	Wed,  5 Aug 2026 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914523;
	bh=UhXMBPrI6xyKgwv/Cdo64nXosd6ylTy7jcgGsAbM7IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SNMtOmDbcY5mDj06AJKz04vBSa77xPwy4HZWGPMClSs/iir58R6wqDPN/LmG4l252
	 sPz9uBSokG6Rn7lZisDEiakQnZzyxGMg2cVHUb8IcvmeRj3knUq0nlmGmfTZMKTOQ7
	 fnH4Xu4HNnZyPj6u2rCAQw2YWmKGbRWfZv/4YklC9Nr5Y6kzZo5rWiYN9LcqxnrEQ0
	 gAaC3c9NqgNnkPeWtDUZUBAZT344cefJAXdxq0TUTaY1Qm3HXpHstIPGa4VM13ZdtL
	 67/nC2zP1AOhxBMVZAaamr8Yrbzm7e700pubrRPsLb4q/j4WtdtVlWux4Ia8UE/W9m
	 C/RHp8pHPqZMw==
Date: Wed, 5 Aug 2026 09:22:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Message-ID: <20260805-robust-holistic-bullmastiff-63cc58@quoll>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
 <20260801080018.3220034-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801080018.3220034-2-amadeus@jmu.edu.cn>

On Sat, Aug 01, 2026 at 04:00:17PM +0800, Chukun Pan wrote:
> The MangoPi M28K is a dual-gigabit SBC developed by Widora based
> on the RK3528 SoC. Add devicetree binding documentation for it.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

