Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71323EAAD;
	Tue, 30 Jun 2026 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847547; cv=none; b=PI7K1K4yb7GPIklfiguRWlIScYn/N0Otd0fPWm91P6o3LKzPVtxTTwZaa+k36ppjIfgahbXRr3xMZ6miRDM1KS1RQ+2pVZXmQbDpnb0FkLwH9ZP5pDP/QRTeQ5LMyVXcBWexBBsO4s1Tya7WeNTin1/7aXfdmrLssXudAxVPshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847547; c=relaxed/simple;
	bh=qVBhNvjLvqEv6SToBYLZ2hYwJhsDQoG2WhVoHDe0XzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXb70FamT53nieysZnHFGU3213r4qRec2L3OJu2YK0jTxQzEZZXXXCIjwJckJHIRIZIVARiYQ/V/Bq1DXUs14v/1aVUUWU7mkGMrbMiqxn6dPaF01yOA80GRGz17qR1D68Tb7D9mGJTc3V8PVZ2ruGxT2Y0Ygig0Xu76vhy2y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZL83Ybq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZL83Ybq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F731F000E9;
	Tue, 30 Jun 2026 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847546;
	bh=LTrA9g5qo+wGJ1gI/ApiYTCUbrzQgSfo23idl+HlRRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZL83Ybq49JV55XfuhdylUTFvAhxCS0TvJxx2mxr9NC5FsSU5OYl+ErsanMZ/c0gxW
	 ZcaxRI3FDnpwDC5EQPI3HmnxbLf2dLd3g5mXtzXf6obKzXNiujZOAY5ZkA4N6FwHFy
	 nAv1VdmT+WWIqCbkmzbHmky6vb/spnpUX3pcBi0xFmcgYfGJVvrT1LNW1aTUu0Hnkm
	 ZMQc6dkuE/DPt39sILJbGPf2BXQS4e+8iLCJvFTTJMT1hlDTahCXX8QOGz5rE2r6cs
	 PnHLkRsR2AC5URHagRma3NG4HBdt5umcRVo4jsqQIHo1Eu6cwjyaTbZjkEM2rbjXRl
	 KeI0Ee5XAaS+A==
Date: Tue, 30 Jun 2026 14:25:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Message-ID: <178284754478.82737.4770095981342524898.robh@kernel.org>
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
 <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>


On Tue, 30 Jun 2026 09:48:25 +0200, Gerald Loacker wrote:
> Add support for the optional rockchip,clk-lane-phase device tree property
> to allow board-specific tuning of the clock lane sampling phase for
> improved signal integrity across supported data rates.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

