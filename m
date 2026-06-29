Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDCA1A268;
	Mon, 29 Jun 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717175; cv=none; b=NDAK+dKBvUO2sR/Lut9OitWRPaGIZ95Jdvx6mk05x+jH03AVQOkrGfRZVFmTa1PXZoxN7F0fgbhYqEJ4dCftl0SU5oubmEyMH2u0xKmZt+Cvrsa9lT+E7k6Fx77iS4ZJANM5nRik3V7rHPTf2mEvzmugxuUBKPCBVPnS7kSRqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717175; c=relaxed/simple;
	bh=00yVwLuHm2ne6zSxNI/ns3uW/Q7fjVYu4xykEPUL1Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAh5mE40nSCA55NMN5RL/5dtaPI9cQa/LTJA9nYK62x1PkYRiDjFIk7NLVOQkdN434y6tKg60cJxp2nhL1Hrpl30kinHXUsBCsU45WpLdiCqPI0akWf3ZrhYL2r0YMcV39dNdGvV7sCfVaJ3tziokCqh4/nc2dxTAGMgBtghJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbbcYqVv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbbcYqVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB31F000E9;
	Mon, 29 Jun 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782717174;
	bh=lvsriI3t3iSP3DY58EeBnMIAqO6ZShyEyigTn5qUvnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbbcYqVv8rd4QbMquaoo9oWErUDsuulIUi23oHVAfT1RUkK0/5lCRJ1q6o4f0Hm8B
	 GSwcDm13faPCYwoRKkQIobCAhfO9ShMIJNyvVgHZIx9II2AZXFyRXJgBTx+FtYyg8A
	 Asb/a4DzTSIFGreSGP+bmy5z46DLVm8welhk4snwR5tWDzSy6+Gy/yLcK1/O2AbNp7
	 7lr+VP90sZcmLZeR9lpH+NKzQTnScMGhorZOAbmn8NEVlm6jYvPYGOhfFGHLUDA93l
	 D7wgRWKm2+1ceM4awGWJF8mk3ES43yxF8tPvwwZ0dzw9OPqHbEnm6Tdxv0+JMBsuQx
	 3rcR/CpyLuA0w==
Date: Mon, 29 Jun 2026 09:12:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
 <20260627225755.1710837-4-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627225755.1710837-4-coiaprant@gmail.com>

On Sun, Jun 28, 2026 at 06:57:56AM +0800, Coia Prant wrote:
> This documents Graperain G3568 v2 which is a development board based on RK3568 SoC.

"Document"

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> This series also have an SBC series with the suffix "box".
> 
> This board is development board series, not SBC series.

Remember to also address Sashiko review.

> 
> Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
> Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde186..873d41bff 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -683,6 +683,12 @@ properties:
>            - const: google,veyron-tiger
>            - const: google,veyron
>            - const: rockchip,rk3288
> +      

Looks like you just added bunch of format-patch and check-patch
warnings...

Best regards,
Krzysztof

