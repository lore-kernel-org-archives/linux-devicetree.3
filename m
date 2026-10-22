Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663063;
	b=FZ+bmXSzXiYpTPBHpED4GWxmNcpjS2M5MAb84heAfuB0OhaOxyfy4F+P+MzCxN6ktxg3
	 JMo3vUloR/uMOoEW9WEW2ZsNCT6dex6NUr9FWe83B/sPoWTCmHwiYBjNJvLTxSgvlZFYI
	 jJaAkojIyTYp13aViwhVzCuWyOSUBS5Q4mbhotETbop9fhIZt+ay3aEw8F45IMPwjTK0H
	 NKwUCR4/SAwaGKaqB++YfJuFeZhKPfRsS4vdkI4W4nkkLvz5hrtBt83alS6RKaWXkP1OC
	 OHc4cL+4X81FsgfYUem3OYKvGNVRnWIO5VaYPqpMe59GwZxv/88uz+YB34Ipe85alBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R9GgQVWubeFRD0aDYlvlHgUND2ndFlem/CpD5/EOGgY=;
	b=YFy7SxpKlUJFtp9DBadqDjTRWcwg+t0IqmoAxz/cKmpQuyWdgnfCNpcKnrkT9YPIW4Ma
	 gaP7IHzbLZ6Ihnzaa0yppKYPsM+9+kktyQuJuI2n2akRhcfSaaexMETDmRbU1mwW9wYDw
	 Rj1pp1wWiFIKSXGH0fyrJqDoXgTpKgEVUekk+yDTUzQwpTeCpLLynjq87KocySlUz72g1
	 LZRrOXmnruuV474NOUoqWT050Q4xgZSxJ3zCl296fJFbp/Q4WJZK50W0xxklDMffBKcJ7
	 Vt2PdI0pRU6looRD5Ds/xrMuegy5XtTiPEpkL0ILAwhVvtpfhsSVJPfdQp2ADfIyBdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=if4nxZ5R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E1606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=if4nxZ5R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3B61F000C6;
	Thu, 22 Oct 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663062;
	bh=R9GgQVWubeFRD0aDYlvlHgUND2ndFlem/CpD5/EOGgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=if4nxZ5RobttRLRbaBnx4uZxN92SfJsWsPyXQx16zsKfXiiWpIWJm7EN5LdvmScE2
	 JpBbYtAbWCtuajV2oSCmaMlmGHT/PC8nF3B8Kc2Heh+3lNkACMG+/PzIJZLP/UP/Vb
	 j6kGpBw00RPwiVJVs0Df19scV6CqR1mJH5/BdWctLonWbG60wmh+4TcAaJvBAYDx3P
	 aI1/WjMBVPCNpQRpiPSXwNjAuN4pq9leLeRh4x6pe9UZQy1m/uFHzr8EeQ9LNu4y9a
	 rOF6ALW/Bwp5tQas9SrOF++Xa+kpaRVl5QNrryFMZxe7M8CBWW/xB4p+2UuPl5XVmc
	 hCyxbav4ur9Cg==
Date: Thu, 22 Oct 2026 11:57:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: rockchip,pcie3-phy: Document
 firmware-name
Message-ID: <20261022-flat-perfect-silkworm-d0290e@quoll>
References: <1792466206-127946-1-git-send-email-shawn.lin@rock-chips.com>
 <1792466206-127946-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1792466206-127946-2-git-send-email-shawn.lin@rock-chips.com>

On Tue, Oct 20, 2026 at 11:16:45AM +0800, Shawn Lin wrote:
> RK3568 can load an updated PHY firmware into its internal SRAM. The
> firmware file is named by the optional firmware-name property; when it
> is not described the microcode already present in the PHY is used.
> 
> Document the property and add it to the RK3568 example.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> index d7de8b5..2356812 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> @@ -67,6 +67,11 @@ properties:
>        minimum: 0
>        maximum: 1
>  
> +  firmware-name:

missing maxItems

> +    description:

Best regards,
Krzysztof

