Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE722423E9F;
	Tue,  4 Aug 2026 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829159; cv=none; b=lk25KytMGR9S/YL2WdGMs6LxzxOJDC6CUxkzEQ+bqVA+2xnzNSUyEbPrp7ilUQPFQsUV8L8CsrOns2Aq9PZBHF1LRRgAPj75BuzX7ZvpN/OBiFbQLU7Hj3xYWXW+wZ+xDQLcqKuAHgH375J7fQZ+1+m/cMRVw4ZM9ONXkhekJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829159; c=relaxed/simple;
	bh=M8GSFsWI4Atkr9+OXYwnh+137Sef5dFdscojMsPrkUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3ckv/Tt5Uv7/1n5bxHshRMxmgJm0pCkscf2Cv7HzYrs0r3upkWJXHzzJp4Hz3WRooIIxwMsGg5uHXSitUWLtYVR1Ao7PLvL9iDs5mCzmyvmCa/HxxKuAd9o3T0PZWlgppTWH6ViQ0KGqnmMSdypdOleFHBy4K+h92sj83qnOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyUFC+oh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyUFC+oh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A591F000E9;
	Tue,  4 Aug 2026 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829158;
	bh=2AeDuer+2UelmfR9XEG62yP5qp3AurNJprWOUQVKWCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GyUFC+ohAAdUri+1fDm1dNxP9bAs/l/YIbDW8K96haCeLX4Yro5UtmiyRlPhQHh2w
	 3nXSWYzLyv1FypUKc23T0ZI6bcY4/ooiCfRil3C3B6GxkX+V+XH1NcNZQIonBNNtIX
	 Wm4s/b6iivqXkvi4iM2dPiD9WYruJnRpLOkPIPxMsD113Ke+nXygYyObmOLOBrvCej
	 PcBzJeKolpo+GmZn4myTXtDGqTllj9neky+A0Di/Y8GCaxpkmrGB4pqqQ/6oonRfYj
	 iOf2FDoyOhVCL8b906Y3VlS0oqNoatXWZenjEI1QGf/JsT5v5Ie40zdl7MwCdFyjHm
	 fE99r3SLMKBCA==
Date: Tue, 4 Aug 2026 09:39:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: rockchip-efuse: add optional
 vqps supply
Message-ID: <20260804-witty-screeching-cicada-9e0df0@quoll>
References: <20260729085856.226001-1-hrushirajg23@gmail.com>
 <20260729085856.226001-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729085856.226001-2-hrushirajg23@gmail.com>

On Wed, Jul 29, 2026 at 02:28:55PM +0530, Hrushiraj Gandhi wrote:
> Add an optional vqps-supply property for the eFuse programming supply
> voltage (VQPS).
> 
> Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V during reads
> and 1.8V to 1.98V during A_PGM mode writes. The presence of this supply
> declares that the board hardware supports software-initiated eFuse
> programming and provides the requisite programming supply.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index b80fd8d1ae5b..25f209fd881e 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -27,6 +27,11 @@ properties:
>        # Deprecated: old compatible value for rk3066a, rk3188 and rk3288
>        - rockchip,rockchip-efuse
>  
> +  vqps-supply:

Odd placement. reg always follows the compatible, see DTS coding style.
This is not even alphabetical. What is the logic?

Best regards,
Krzysztof

