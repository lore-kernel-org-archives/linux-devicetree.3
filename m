Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4C3A5E86
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663431; cv=none; b=l82nIFplvoCdjMvutB9lG/aRKCF52q+3qrKWglphu99sjI7EyPU0MPHx6mVYKW+3OWlrDv0BZvC9KMtHjLWFwnkc/srnRaXbCkwjNCsdWmsHraJB0UYdHMSx9TbWMEQshdwSFEbeyd33Iypf+XWGdpz10868Kc6lXodJqVORAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663431; c=relaxed/simple;
	bh=6OWxi6sznBBP3Y49NshnOw8WQrIBJojore7IDw9R6Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fgsVVxyvAPBXEaaC04gXW70xxUIYIFSNZnWBPhdJSY+WSBWmbLh4iE0HuEVqNkJGTbueJMF0lwcZF38O5p6RmarRkM5HUuJIZtHh9yCDc+XjOcX05ybFx+TuIzpXuELLpbgvMtXoA5oPRgwhVorjqAeItSRLMrjtb0x2/53VtqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=GJuTuYD3; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="GJuTuYD3"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1778663417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Br8ECkosH6439TK+TJacDyUDWhXrY1kuRkm0dcmNU5g=;
	b=GJuTuYD3sVwTg6QvMvWnBqJ1fueHdcR54Vyny37HELRIDR1oAXrowvVemTNylGlBgDTXIk
	86zgMr6P8rv68yL8DWZZFutHCR8bOXVyLiyCTDclwuhjEA+Z6wi0NrmP2gm6VuNIzYsYbv
	bXOt/FeGCCGJkmgJ/fNCf0pegjyoNlMHmRD0TGXhzUnEdJ2hRThF1Z66TVY+EdNgt8Md+H
	pw3ICaamFi4/krXGb/AfhU5TKdBlhIL6Z+t8zSOgSwchQjBtNi9nR0lKWnfNIUXdrefoMv
	vGpk3N1Vh1yP7RAD8oRqlpPwUdFECI7m6DY0e1FEKNfjj7kY6C4wAvSi7r1Yvw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 11:09:58 +0200
Message-Id: <DIHFJX03WWI4.1F9FMM0HOCPK@cknow-tech.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: rockchip,inno-usb2phy: Add
 compatible for RK3528
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>, <vkoul@kernel.org>
Cc: <neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <jonas@kwiboo.se>
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-4-heiko@sntech.de>
In-Reply-To: <20260505170410.3265305-4-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT

Hi Heiko,

On Tue May 5, 2026 at 7:04 PM CEST, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
>
> The embedded USB2 PHY on RK3528 is very similar to the one in RK3568,
> the main difference being that it only uses two clocks instead of three.
>
> Add compatible to support the USB2 PHY in RK3528.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/phy/rockchip,inno-usb2phy.yaml   | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.=
yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> index b95c9e3e44fe..f50fc69fbbe4 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> @@ -20,6 +20,7 @@ properties:
>        - rockchip,rk3328-usb2phy
>        - rockchip,rk3366-usb2phy
>        - rockchip,rk3399-usb2phy
> +      - rockchip,rk3528-usb2phy
>        - rockchip,rk3562-usb2phy
>        - rockchip,rk3568-usb2phy
>        - rockchip,rk3576-usb2phy
> @@ -41,11 +42,15 @@ properties:
>      maxItems: 3
> =20
>    clock-names:
> -    minItems: 1
> -    items:
> +    oneOf:
>        - const: phyclk
> -      - const: aclk
> -      - const: aclk_slv
> +      - items:
> +          - const: phyclk
> +          - const: pclk
> +      - items:
> +          - const: phyclk
> +          - const: aclk
> +          - const: aclk_slv
> =20
>    assigned-clocks:
>      description:
> @@ -65,6 +70,9 @@ properties:
>      description: Muxed interrupt for both ports
>      maxItems: 1
> =20
> +  power-domains:
> +    maxItems: 1
> +

The commit message talks about (the differences in) clocks, but says
nothing about power-domains. Shouldn't that be mentioned and/or split
off into its own patch? (FWIW: I like the change itself)

Cheers,
  Diederik

>    resets:
>      maxItems: 2
> =20
> @@ -150,6 +158,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3528-usb2phy
>                - rockchip,rk3568-usb2phy
>                - rockchip,rv1108-usb2phy
>      then:
> @@ -218,6 +227,19 @@ allOf:
>          clock-names:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3528-usb2phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +
>    - if:
>        properties:
>          compatible:

