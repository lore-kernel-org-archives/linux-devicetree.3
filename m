Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9D2206A7;
	Wed, 29 Apr 2026 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443684; cv=none; b=kJ5nm2ExMPThfxOXkkpQQxnik1rf8Rlo/eA9UmvPYwveUE+X3UrRxuSkh4nOXP5uE9n2YaOi3uduGuQLTjr+HhvarK6pN/8k1Eneqyhmq7ZxbAHHsXefugZ5ebMRJPp1H80Ztw8BCGsiJfUZTJt69pqrx0xSH1L5OdF3ykYPUn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443684; c=relaxed/simple;
	bh=nyLlPApUeRPcCplyVs74LherjZTCuNRMjDH7ZqatLVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q8GETM3JaJY9iKCdU3hJMcBsJ50ZIsrLS2DZlkiYKA+F4pZ+1qilZtGCVHzitEAidvAL0jY3pFpaAzgoEh5KAfi7P4X0I/3zRezYwDL2ZxZSRfdcEn43r8NmuOMJxiZVMs57sOmLWNgT56qnUO56DGwevfWIy9PzwSwjcSOAZz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCoY8VLg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCoY8VLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0076C19425;
	Wed, 29 Apr 2026 06:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777443684;
	bh=nyLlPApUeRPcCplyVs74LherjZTCuNRMjDH7ZqatLVs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KCoY8VLggeW89RWyRb2XArN+uvlo0pGnZBY9YGpYWoKrS74Tw5mqDdAl7aXDvDNHC
	 OvdF5jJmJgfhs3BHXF0eWrPDcaARODfsawjkI4je0BnzNQzBmrBmOMl4Ig793vFpoU
	 s9up3DvslddnwdxHq5nyDSQA1lBDI/ksii86Mj2ywVFsWRTqZhSB+OGyQR1ss1sDt/
	 YGhL7dzwcWd5wbvUxMsppz368RAzweQKX2oXqhbSfMsZqZEh/f6UgZugQBIx0hO8Ve
	 0TELtTBlptDVHzAUN3lvY+eYz/lXA+k1mGYUZqAFcTLmy6R3vsMQt2XmImazPq/0uv
	 vg6i5vhtGepPw==
Message-ID: <0c4cabbd-123d-4f23-9c5c-4e45403ca4fe@kernel.org>
Date: Wed, 29 Apr 2026 08:21:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: drop tab characters from DTS examples
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1777434096.git.daniel@makrotopia.org>
 <2044ee0cac191c7be8b6e989fc3c99b24aa4cc5e.1777434096.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2044ee0cac191c7be8b6e989fc3c99b24aa4cc5e.1777434096.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2026 05:48, Daniel Golle wrote:
> YAML literal block scalars cannot use tabs for indent.
> Replace tab separators (mostly between values and trailing /* ... */
> comments) with single spaces.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/i2c/opencores,i2c-ocores.yaml    |  8 ++---
>  .../bindings/iio/adc/st,spear600-adc.yaml     |  2 +-
>  .../devicetree/bindings/input/imx-keypad.yaml | 32 +++++++++----------
>  .../bindings/input/microchip,cap11xx.yaml     | 12 +++----
>  .../input/touchscreen/ti,ads7843.yaml         |  4 +--
>  .../devicetree/bindings/leds/leds-lp55xx.yaml |  2 +-
>  .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  2 +-
>  .../memory-controllers/nvidia,tegra20-mc.yaml |  4 +--
>  .../samsung,exynos5422-dmc.yaml               |  2 +-
>  .../bindings/pci/mediatek-pcie-mt7623.yaml    |  4 +--
>  .../bindings/pci/samsung,exynos-pcie.yaml     |  2 +-
>  .../bindings/sound/davinci-mcasp-audio.yaml   |  4 +--
>  .../bindings/sound/simple-card.yaml           |  6 ++--
>  .../devicetree/bindings/usb/ti,j721e-usb.yaml |  8 ++---
>  15 files changed, 47 insertions(+), 47 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
