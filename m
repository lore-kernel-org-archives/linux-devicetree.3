Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3634EEFD;
	Wed, 12 Aug 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531913; cv=none; b=EcaVwal7yuWD1K5H3EtAMISIE0ON9XGykNTUi2lnl18+hdfGJIE7p8sUe6z4xJ/7JrRxEv/E7bOB9SA2kecftYMATIJgYaEeTiq9PKotyA3Ej8EUHqOaQUdAwNc2D+9LIS0cfQtWB4CR24LKQeZNDAzfABdnkXeXlNsKq5pDu9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531913; c=relaxed/simple;
	bh=7hJ9E05+214ADVjYX2zru+cnKFDOCjEGNCfwi+VzXvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spUNsjlx2UfaYGuNsyoHoAFoMDxusqKUMpFrn4Y5w5ML7dsTbNnr7eww7takTj/YXNFXUw452dCn7xye2Vb7TdavsnOvOUAX8lBC4emMJqoIf6CBmPTiDV9h//OU3wmXJeX2WjKkZV6RHiNV7dTCCgYCTDkv1MoX1H5nY2wWFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8R/YGW4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8R/YGW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BB31F000E9;
	Wed, 12 Aug 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531911;
	bh=XyfjdJ2F7ZkAf3rL9ZYjDDcoCkB1u8Z2/nkRcIo28CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e8R/YGW4JRKL1ribgcAim0lsRiuR4eGrfT+UbUeo/UUS2YbARo3PrHY0a2Y1SKAXB
	 0h18deBjs5QzNyHzzT0mCf0oHjN6KRggdMbXaOEYWYgHESaGBSMOOV3t3b+e1TyIXU
	 HeQfi9jaZmVHCIIYMZktFTLqqfqEr7GQUY57eEu9ouW5jI0FGv7skZPx5HSs4GXF7h
	 MnfGvr6/iBXhYFhSEMQ/qNlGg50KcEo92K6R0qRzJgli2gj5U9brsYrXdYH1lBe5B4
	 zTR6YcP2Gixa9eL7vkGjioFEEa3CLosO4wtOgVVIw0xD26eBmG1OJ/GUubWUTyaSVP
	 uDRX5eIRURsjA==
Date: Wed, 12 Aug 2026 12:51:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <20260812-refreshing-rampant-gecko-b38ef9@quoll>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>

On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
> same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
> camera, and combo blocks like the Samsung IP on RK3588 expose both
> directions to independent consumers at the same time. A binding that
> needs to tell the two consumers apart has nothing generic to reach
> for: most constants in this header name a protocol (PHY_TYPE_USB3,
> PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> layer.
> 
> Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> protocol it speaks, which also implies the direction. They do not
> replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> where the cell selects the electrical layer. First user is the
> Rockchip RK3588 MIPI DC-PHY binding.

I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
Isn't DPHY implying it is DSI?

> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Your tag goes the last.

> Assisted-by: Claude:claude-fable-5

Two simple defines needed Claude. Great, that probably makes AI
conglomerates very happy that we do not type even two lines anymore and
need their resource-hungry data centers to do that for us.

Best regards,
Krzysztof

