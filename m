Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9F233937;
	Sun, 12 Jul 2026 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869735; cv=none; b=oDp2h3f60+HLdL3+y89JG4NRLBYobFYiDxoGXobL/5+mY3SZxT/w0Xrw6bR+tRE5L7xMP63zXJkf0RCymPxMHEt76B5hdfblZ/sXxSOtRhIXM99HzmsE8x71nqI8n2BIA3ls2nm3cdiNeisFty9ec33LtfrJaV4Lj9lh5jF6Hyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869735; c=relaxed/simple;
	bh=B/jzWXG/ZrzGSkcOQjvoomzOkO3xWEGOJZLCvPdxfVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpTPxXk3WVtAXPgZCFu2Bn9rOqDK3Cv6Q1gzY4xYm5loNxIJPqIfWVsNenR7ESopgxQMNTOndQLOly7/IWUqFj5t6t+Z2nmW8tR6JYLb7eUHOswFkfebnWvwPDFNlpN1haIF+hBaIyC5Et1ORodID6+vaszQOVB1VPba8JCXSqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Byp017tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byp017tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15231F000E9;
	Sun, 12 Jul 2026 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783869734;
	bh=DuaiB+g90evMEnQ75glw9g8iH9UnlpaAQbng8V1ssBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Byp017trUwl/8psOoSyDdN8PtY7+zecQELkM7ZiyxQf/cRCTQO+ugA+tXHJUoPtj1
	 P8Togkk32pLjMyqbfV33rMfj5OXwjMUiYcGjYxuHKsBxZoLXHFqVJAzIks1ND47AD7
	 WiIKN5DKkyBMetJJXIHTavH9NHVACUAgWOuGWeH9IE+FKeB4g8MlhdkD2ydvhlY7D6
	 HsUXCIUPg5kil7KSF8xcPnpYSpQt2lJFcLKk042r1i5ot5xxVdDAw/3bBhVLT2XrOG
	 dwiZili2xMav43/ICOeZV14fGdX2gnE2MYTslx4YI5cHO4mexPM0wp9VPbKwPmyGfN
	 TmhTRPn5RxXNQ==
Date: Sun, 12 Jul 2026 17:22:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for
 MT8196
Message-ID: <20260712-unselfish-topaz-roadrunner-f0bbfb@quoll>
References: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
 <20260701121943.19430-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701121943.19430-2-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:19:42PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Kompanio Ultra (MT8196) SoC: this
> chip features a DSI PHY that is similar to the one found in the
> MT8183 SoC, but is a new (incremental) revision with a different
> register layout.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

