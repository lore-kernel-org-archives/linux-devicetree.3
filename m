Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3953033F8;
	Sat, 13 Jun 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347451; cv=none; b=fUGWPrWvABPWlB2cng4dwXNQMnMn4s3FhFYJ9QFUt+WS48O3KHv4COuTIUnptO7QKPZ0ZyZx2p5dkrvMLMcS2bWmD41gM8WqBPUv6AhHGyDonnZImY8yqTVwevh1iBiNOr1977i9zRnyqf/0GH8349bYOcbwhjqs1KlIFdHRodc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347451; c=relaxed/simple;
	bh=VpTYILSG8jfLAIld9sDeFC4+be7I9bbgJHOi+zPpv2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elCdUV92IsH+1rGPxfOjn1pZpazgr5VBQNVnesllu7/qOrGQJWxD9nACYoOBj72w4HXrmAMrNOLBJJueX6q0t/iSdoSo/0r4ixwtX/XKJfkbwIsqk6xQ0Yun6aN82mijS61h4Tfst7t7Ih70C7w/sbd6sTMeWkPHzMkxIcch9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeL2B7Il; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeL2B7Il"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53281F000E9;
	Sat, 13 Jun 2026 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347450;
	bh=v6feVhl/WbyW4RkUuMaZ8jTOMx0aNRMOaPCXk+NnkC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JeL2B7Il2rkaurY5b0dmZaGG8qobcTRBQhgHikVn7zb533OB+VLpUBGDs7qBVTsCr
	 morceHXuyslii8vyuIBw6tyCPTNxc4hbwERlc8drfYOUR5alFzaQLOXu5jlTeMCdSd
	 nP5LhF+p43EqamQdLhSIYh0C5hxidJnwHmErghpr1TIYW0nhY0zddPB2Cr43oiN0C6
	 TUD+S5mTzQMc0L4ZJE24PB1XowFts1DaXpxyy/fYptfGk40C4dM9aSB16ekjZ9W1i5
	 Ef5mh9rscvxljyuhr+7kJLh3rjZQyA0p6mtISWzG4BWDrsKu7eWXdG7pDY3/E+Mq9w
	 RgWaU8nL+PtBQ==
Date: Sat, 13 Jun 2026 12:44:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
Message-ID: <20260613-elite-panda-of-success-75eecd@quoll>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>

On Fri, Jun 12, 2026 at 07:34:15PM +0400, Alexey Charkov wrote:
> Document the UGREEN NASync DH2300 embedded controller (HC32F005 MCU),
> which is responsible for gating the SATA drive-bay power rail and
> providing a hardware watchdog.
> 
> This is based on disassebly of a GPL binary from vendor firmware for which
> no source code could be found, so parts of it can be inaccurate. Only
> the power gating function is confirmed.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
> new file mode 100644
> index 000000000000..847970c609cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml

Place it in embedded-controller

> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ugreen,dh2300-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UGREEN NASync DH2300 embedded controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@flipper.net>
> +
> +description:
> +  The UGREEN NASync DH2300 NAS carries a HC32F005 microcontroller on I2C that
> +  acts as a board embedded controller. It gates power to the SATA drive bays
> +  through an internal register and apparently also serves as a watchdog
> +  (unconfirmed, as vendor kernel sources are unavailable, works without it)
> +
> +properties:
> +  compatible:
> +    const: ugreen,dh2300-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulator:

This should have specific name matching the actual regulator name, e.g.
pin.

> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      The SATA drive-bay power gate controlled by the MCU.
> +
> +  watchdog-gpios:
> +    description:
> +      Optional GPIO line used to ping the hardware watchdog function of the MCU
> +    maxItems: 1

Best regards,
Krzysztof

