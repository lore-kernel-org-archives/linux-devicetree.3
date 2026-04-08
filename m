Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD27396B6B;
	Wed,  8 Apr 2026 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634750; cv=none; b=kZk5U53rqbymRcG9KIvEbwBrwfbUMWaqFYll3Qjx2HZZZLJ+1b0rzYhQ9oAZBrNLPJds3GpMzeOP6k8nQUsIA8uy3hF7/cuz5r2c281TaFkQfPUrKzZBcVBQvwz+A+0s+qULfw3nrxXG0r6oH1KgX3FykZHFEzOuiLso0pHzaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634750; c=relaxed/simple;
	bh=xNY9tEvKoYhfTQH3M8/Q4r7s7A/d71rffbc/9uF1Xa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTtZb/YiABC4EvZ/sN73VTMUfl8kT9S4LgsJBSooS3BETtqMkR/+WI7g8YiT+qDFBCntSjULzG8PhBWYhFaueNXv2kBIftkafSFdaB0DDDgF79Ap+QBGhBbXPrejhY8WbJtaIo/tWxcduN1R+qYmW9T293BqwvQbw3XpfszAvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ih4NSeC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ih4NSeC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDBC19424;
	Wed,  8 Apr 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634749;
	bh=xNY9tEvKoYhfTQH3M8/Q4r7s7A/d71rffbc/9uF1Xa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ih4NSeC2UtjrjEgv+qhj7RtI0dtNt/8E6c+4i94k1Sj4TamaIc7W7ZxK5Nm3QtmCC
	 Vd760WYlfNXMixdwpwsP9oZDAvw006FAcAu3INDBMcTNgYdsHgQizXVaxgh+9qQrDi
	 aEOoCclvi3jirOCzCYmkZ4X/4BZG7dPnqnX2ySRZSg3/gT+sH+q6ZQgHd/0VtTlVwS
	 H4dkYCWlUU8f9MFq91Kxjd18brVjj1jF81dUN5DG2ePwLMEu/HVqu+5IlOSSFpbBjW
	 aBNIQQthwmBjWJCTX63DLrRjrLEsatuBMFYVSJ6yGjFIvHfG9DgQMXmEwBfm8Y7xtw
	 LxCvoacfK38aQ==
Date: Wed, 8 Apr 2026 09:52:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, colin.huang2@amd.com
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: anacapa: add EVT1 devicetree and
 point wrapper to it
Message-ID: <20260408-glorious-vehement-robin-b6def3@quoll>
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
 <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>

On Tue, Apr 07, 2026 at 09:54:33PM +0800, Colin Huang wrote:
> This change introduces a development-phase devicetree for the
> Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> wrapper DTS to reference it.
> 
> A dedicated EVT1 DTS is added for revision-specific hardware while
> keeping a single, Anacapa entrypoint used by the build and deployment
> flow. The top-level aspeed-bmc-facebook-anacapa.dts
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 ++++++++++++++++++++
>  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +------------------
>  2 files changed, 1070 insertions(+), 1063 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> index 000000000000..a29b7fa1155b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> @@ -0,0 +1,1069 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Anacapa BMC";
> +	compatible = "facebook,anacapa-bmc-evt1",
> +		     "facebook,anacapa-bmc",
> +		     "aspeed,ast2600";

Test your DTS before you send, not after. Your binding clearly said
something else.


Best regards,
Krzysztof

