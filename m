Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EC41D104;
	Wed, 12 Aug 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532028; cv=none; b=KRJPcD5aOGtCIcOLx4Nn8fS63SxD78TjuNdxvbzfUq6ZYd4qx2lf6X7zyDL3dxi5b8VPNVJ/XNK8ibgarFi2PCNBySS5CEwZzHz240l5qfyfLcsuwQsmketp2U4rTk7NhfZTPL+EHb5/4lt9BDuWswLFlY/oDqTilVoEl6TRkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532028; c=relaxed/simple;
	bh=Me+UiSTu0eUEl63G9yQqrbf1IZ2Dku7WIodg30ivAGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJYH3dHmSXdJ53Ajt04nU7uKSlKkyvJrfd29uoOsFBGc1cpO1vFlvC4shu++t+LlUXnlmBJyRXBFvbPiI4ezAd9eFLwz6SI3WESsmwROj0ysFp/CvRJ9S4cp0PvtMPYzcEOcS6a+e2uPluKOX98XX6fyIjFqGVF2u998x+uQ/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBtRE+cr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBtRE+cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36961F00A3A;
	Wed, 12 Aug 2026 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786532026;
	bh=XmNobfuMx0pDiDam9efhZOx9BexMksK/K764FtZWuog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RBtRE+crRVJnULlydWzSt1Tbm1jQGdY0tHzRCOBkLyoEaej1J1pNMg0Y84gPz78+1
	 jvvglA2Em7xkTR7Z18tKkg17DVoi7POO2PYyQwpWPHaLWgxw+6ddjsjYOxcZzyaZcU
	 JIGz0EJln2WesR/SiQ0f7jDQ0xUV/jdojbEfFxoAddHsSbeUOFNPuwL9v76vZmLi1S
	 ZO5Y4sD6IRG2r7sf86NRSfe7N5eLnHGAl37E7mtqaN6/5c+ejsiB3f1Qkus8MAZ4Pr
	 AJR63jwH2wVHZUI+mbhcufWP25HyaGa1xRvO4bihjj7vETUk45GBVnuS06+wiQKwzF
	 UncEa35Ofw2kA==
Date: Wed, 12 Aug 2026 12:53:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 allow DSI and CSI consumers
Message-ID: <20260812-fast-famous-fulmar-3bde7e@quoll>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-2-a2d25c29adfc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-dcphy-rx-v1-v3-2-a2d25c29adfc@gmail.com>

On Mon, Aug 10, 2026 at 08:10:10PM +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI
> transmitter and, on the same PHY, can receive from a MIPI CSI camera.
> Describing both as independent consumers of one PHY requires the
> devicetree to tell them apart.
> 
> Let the existing single cell also take PHY_TYPE_DSI or PHY_TYPE_CSI,
> selecting the PHY by the protocol the consumer speaks. PHY_TYPE_DPHY
> stays accepted and equivalent to PHY_TYPE_DSI so shipped device trees
> remain valid, and PHY_TYPE_CPHY keeps selecting a C-PHY transmitter.
> The receiver support added by this series is D-PHY only.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-fable-5
> ---
>  .../devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..1f7c2e2ddfc1 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -22,9 +22,14 @@ properties:
>    "#phy-cells":
>      const: 1
>      description: |
> -      Argument is mode to operate in. Supported modes are:
> -        - PHY_TYPE_DPHY
> -        - PHY_TYPE_CPHY
> +      The block contains a MIPI transmitter and a MIPI receiver, which
> +      can be referenced independently. The argument selects one of
> +      them:
> +        - PHY_TYPE_DSI: the transmitter, for a MIPI DSI host
> +        - PHY_TYPE_CSI: the receiver, for a MIPI CSI-2 host
> +        - PHY_TYPE_DPHY: the transmitter in D-PHY mode; equivalent to
> +          PHY_TYPE_DSI and kept for existing device trees
> +        - PHY_TYPE_CPHY: the transmitter in C-PHY mode

So PHY_TYPE_DSI is the same as PHY_TYPE_DPHY. Why doing this change?
Commit msg did not tell me why we need equivalent code.

Best regards,
Krzysztof

