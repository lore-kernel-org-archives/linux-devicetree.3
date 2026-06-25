Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC03C1096;
	Thu, 25 Jun 2026 06:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369815; cv=none; b=rcyhepHXJbJ1KaJZJ8U8vufZZweEKNEoIwgK09eE/U4L/DYTr/ISLdqWFFEp9GbPCTjj8WpnLvyu1+DO+vD70InQwr+rFCQ+2khe8byPonH/S9bcjn8/qtLedFiH9AvWl7fYu6OsZ4z6PSlEPcmvIvgeBmNa3Cc9w/BOEX2z7KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369815; c=relaxed/simple;
	bh=JqNU4nkgtpDhZlieInLK9IDGEoJasbRDTRNi7RVkvWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrkmyoG53RVJqU+JkkU9YBWRs4H36sNc+GScOHa+s854fdJmSf916YUXqvBaEgc0qDHlSLQRUxQztLW/R0P+WM171lTwC/RQ2QhPgG7IO+JicG/iTw/MR09sFueUzn44XAWqLGVa5tfDDQ9e/677sNNIrN7JTLiU/c634tkn2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5u/UClw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5u/UClw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC6A1F000E9;
	Thu, 25 Jun 2026 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782369813;
	bh=L75aBSsCGpBryRml4FN363qW1z8PZx29ZjzFOlFMwSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L5u/UClwtiDhr17ilKFgEfTZ2MMjqkM08fRr4vse7c7eWk9w8wRKVi+QjH0rJBJoG
	 DTPv6CdQYFmK49eIhsSmj2YI+FWrrClAGY5ssliz0L4fqU1v/EY8WZkbboi0SbSPM1
	 a1gMJmnxb6UkuAY2SmEKTTg0f5Xsm5i9kRBOepU3oBrjWQu7+iNpcfuLDVm2LJ7r5k
	 JVOqGWfGckjV+boyeLoUNI9KRoMppggrQ6ZSfwfhZuIfPTt/ZD4jiqaw6+oZSQYaGF
	 8UPf28Z+snwLYheykEggC8ZYf71r7VC9CGF3YmkbhXlHN+LVpt2LHLz7cWKJo40BAf
	 hzV1dwhpQfPOg==
Date: Thu, 25 Jun 2026 08:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Message-ID: <20260625-lean-debonair-anteater-c22f83@quoll>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
 <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>

On Fri, Jun 19, 2026 at 11:13:40AM +0200, Gerald Loacker wrote:
> Add support for the optional rockchip,clk-lane-phase device tree property
> to allow board-specific tuning of the clock lane sampling phase for
> improved signal integrity across supported data rates.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08c..010950a8a8856 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -56,6 +56,15 @@ properties:
>      description:
>        Some additional phy settings are access through GRF regs.
>  
> +  rockchip,clk-lane-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7

Missing default here. If default is unknown, explain that in commit msg.

Best regards,
Krzysztof

