Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B73CDBB5;
	Thu, 16 Jul 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189265; cv=none; b=JU28P8YW5eIQi7oKkR7ZlrYifnucukFUrQFoL5w7dWaHjEj3YMTuj8H76ArllaFLBJl7OESHqCMtnwh74GFzYWD8Fg4Jf4ghukZsOpvXa+wCr0IeTxV6aI7h5HYjRCh8LVSo2gkXBPZWoMlWSlwpF4qBh4vWAJSdvrKkzTpboD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189265; c=relaxed/simple;
	bh=MZuatRy/E3VVXYXrcvark+8hMZeaXamdJ4yv4/bM2uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvMIh7HXT2EChSvIWVjMeSU+3Mz7xgZsh4DG0ekwTXshvSNsPb9Zm4j5PdJ68BVTNrBPr3SpBkf9VoGrvKsh5ow1BjwqXDjrv2dRS1iVDc4DsYlLw0OtfpK4e1pFKyL1DFE1Tqms/K1tt+H+s3hhQUbwLMngD23ATli1Rt1gXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7edHqjN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7edHqjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647DD1F000E9;
	Thu, 16 Jul 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189264;
	bh=RE7IWzX9N9XG849xtFGuenm/AMqbNw2PFGwFboy/who=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7edHqjNIaaihFmeEURYSbenTdZjHSttCpaHwBUcBw8832PMLr728bS6irLidzQ/t
	 hIg5EmUCKhngv3g/rDSHuh8LAZ3xGNWfxfJy/5eVrqBYz6VSHVKUgfxbqMon6o6xiJ
	 SqhqtSxSb2rndbvWfdvEGuz3njES8XWz1bteqOk0/NOdL0DUSt/noBFKyYF8zkmLOo
	 VXjc5ZLBA8M703xW4RQ6TfVCHE57msVrCj94+eUpxjhs+u+oiO71NBqAZFolvah55t
	 hMO2NgQIxasPMi2wqPGKS4UnOErYosRNV6JBJFMvOgrM5oR1k2o0DDPKvwM00UUUag
	 2JBQStEL5TM3Q==
Date: Thu, 16 Jul 2026 10:07:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
Message-ID: <20260716-elite-alchemical-locust-c510ef@quoll>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
 <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>

On Wed, Jul 15, 2026 at 03:26:38PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

