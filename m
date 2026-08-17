Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803753B47EF;
	Mon, 17 Aug 2026 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786951275; cv=none; b=nDa5FoPHzGdXUBZ+vwwQRq01Z1qOuFarJ1CcvbYVfqI9CXB9NRj9IitP8e/VhRJFc+JbndXzyvHj67HXqmlCd6gU+O8ujJW/NGs5qMRrddu+7QTJxELXwB8+ZIVbrEnBgQDO1f+mRzFSxfGq9ac+Pe6XJOD867UB+hOZCsXf7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786951275; c=relaxed/simple;
	bh=v5sH07TzaqndK8wB1J08258JDVYnTnoNfOXOWdukTWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKlIIdNhYIt9yzQMQ5706ZX5Blu7G3aLhBpeKHqWNczoiFRauAXG9KwlC0ugYy4f4kNIoSaIzyqyb0BLEmLhylnB4DtvYNXxhi/e0kI2ZPsrj+o3NyU0fJ3hhky5HUADCNgnka9HLFbhc6cDO9vgA1Qbo4g/caE0RVnUAB40vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vvhd2pZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvhd2pZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD56B1F000E9;
	Mon, 17 Aug 2026 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951274;
	bh=P2lBksvn0lgzSL25cOJI/uadjSTHnlaum8EICbKupuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vvhd2pZAhK4IsXz11Iop+rrkPfeizQJ+tvY5/Vypnl9xKuM0LLMXPnmuZJ7JghN+8
	 wmbZBqW2auyHOQ7f4Uci/zWDVCOJJLRoGYg9joDmnBVPs5ndaG8J+UUT7eUZcVkj+7
	 Ej1OUBj+utCposjtXPHprrSNoSByoS69BloGnLIF7HkEx4iFULdro31DRcodumh5IC
	 e7WpvlD0UyhHKqR4gPWik2BHhaDmCIXLDBwKKL1RJxGyvDxTbrety11pfwmwIThs/r
	 ZMGGwUTZo5G9rXEZ0yWcX6IieLIg75dFSwISOadJz+MKH1CYY95kzBQ2RcFiWPTrxK
	 RCoPQPSlcx2Qw==
Date: Mon, 17 Aug 2026 09:21:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH V2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
Message-ID: <20260817-brave-wildcat-of-psychology-2ab7ea@quoll>
References: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>

On Fri, Aug 14, 2026 at 12:31:12PM +0530, Nitin Rawat wrote:
> Document the QMP UFS PHY compatible for Qualcomm Maili to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Maili with that on
> the Hawi.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
> Change from V1:
> 1. Fixed Signed-off-by chain order.
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

