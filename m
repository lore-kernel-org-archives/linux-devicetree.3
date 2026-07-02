Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A835F615;
	Thu,  2 Jul 2026 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973994; cv=none; b=puTTG+FISSrmLVXdSYr8WKCQBkuECj42tl+rRyRaaKPCenSUZCFuBP1pzacRrHMDBZvKDsfHiviOeLN/G3qfqsrLw8HNduZ1a6HE0scNO+ZRwrYLg12JkXt8naPS2m528mM3ji1RBfuD9jmSHmUBYj9Aq2qzuETTWpankpLrOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973994; c=relaxed/simple;
	bh=wZx63kGmZqpkioXrjypKTewkI0ErO0odVwQKhO3uFoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYbdL9hwThZ7ftdSPRnuD3IQZZO7HvxtK+FOtiorZbRf83RZCgKQMZlgTKH71x2gVs6l/Hk9SwXxDKrCuUQCPR1Xa61rpQS/T2Lc29SwFS7zaloAzbwenKzGrPkvQK75E8zwdL/VynBz6vgNhcIx0Cifxy8rdCAZloON1WR62X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsWq5/co; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsWq5/co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB381F000E9;
	Thu,  2 Jul 2026 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782973992;
	bh=7G57MBBgwmHcxmcMqRtIxBuKOiHfjxyItxFaFc5ITt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dsWq5/cof9r30xrYsmz+so6wHaSJu9bojEgXWYTI7nby9fyinRcLI8BgVqVwFLIh8
	 +j16+M0uui5OlPg2ii9h5YvAyi1sZNudy3uRqEmJTXQOdjkUqwaaNicfvpAeyWZp5H
	 TsBNdl9iN2H4dA5LjQ6ytjMg7RYPPbJT+23VDbiJQYT1t9Ox4d0ZYZ6Bsqfw6C7w5C
	 SjGvQuBGG07XEr9tulrM4b3eYswcmOMbur07XHRv37cVfAJv4RgDULcTH1xUu1k0cb
	 CQ13ZEVrEuixgFbuf8qO5Q0c5Kv1rNisqeU0YdQ+gK6KFabKwaz9QXt9TuUuUo8NjC
	 WlVZnQmuvULjQ==
Date: Thu, 2 Jul 2026 08:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260702-belligerent-dormouse-of-glory-cb0ee0@quoll>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
 <20260701164543.3967388-7-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701164543.3967388-7-coiaprant@gmail.com>

On Thu, Jul 02, 2026 at 12:45:45AM +0800, Coia Prant wrote:
> Document the Graperain G3568 v2, which is a development board based on
> the Rockchip RK3568 SoC.
> 
> Graperain G3568 series also have an SBC series with the suffix "box".
> 
> Graperain G3568 v2 belongs to development board series, not SBC series.
> 
> Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
> Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

