Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6603C9EE7;
	Fri, 10 Jul 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673684; cv=none; b=OvmAnkPSbOuztL/pfJf+JodwjpVsZhp3XWUyhHQNPOEhFxRV0xuwuCd3XYrkK1LayEh6CoFj0OQ8L8LmHvgfoTp46glCE6yiq1YqH3Ae18w0X2eCXTOoVfH0u+DHrzdvokFn3TvQLu/Pty2X+U4XjQ/4CveTC4y9yFJHdv8vITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673684; c=relaxed/simple;
	bh=vBkZzKUPVHxG0dAK8bCins8JjjsiItMDeaHOCGAr/Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az1amlHVhdRxmhBX8Hmjbo1ENN4rHvykwOhnOylmnmdIDG2cYehtgyBJWN4T9V/dKYHca+J1s6aTAMqHbFX68MMziYJPgSL9W3sWJ8aTvnx/Vj5Kdp/+tZLzgzE0pdetUi7ajVSX6QFMyE3MbMInxkR0FsS/PLlaKwbzarAFkjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fncSFDPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fncSFDPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849021F000E9;
	Fri, 10 Jul 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783673683;
	bh=ZW1CYh0lnYgu78kElwiu6T5jQUe/eq52tcGx9p2ls+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fncSFDPMrkIpa1dOMUIDNNQJsB5ee03VVWKjAQpnv8ua2SwJGlRrYB46FupscbR70
	 bOcNpFSiTvHR/0iH9B8gDGexxh3s1JN0i6IASrTt4AOIcjH9FB0tCbxp2Xpa/wtkcj
	 5Fn7iYRTyb9lSYS6KsKLYva+Pjvh5L3IkPphSiZR6ub31c9dczdxNBdNdR2IvV3b9T
	 FPnvdQrfMJfWC+7oXnSDYNuWiscpJ7lceCVjMroMmLZmkuzLb5etWbIh6WrD7FIKwM
	 cla2mY46eAY6PDJRhE6L8/KcGPY933m/feq2ZKgWNnyHqFHOSmvOvfMMRKgtUUXbrH
	 QAZZDZxIJrcLg==
Date: Fri, 10 Jul 2026 10:54:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port and OTG
Message-ID: <20260710-strange-prompt-python-c2e1d4@quoll>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
 <20260708103606.1462960-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708103606.1462960-2-a0987203069@gmail.com>

On Wed, Jul 08, 2026 at 06:36:04PM +0800, Joey Lu wrote:
> +  nuvoton,oc-active-high:
> +    type: boolean
> +    description:
> +      When present, the over-current detect input from the VBUS power switch
> +      is treated as active-high. The default (property absent) is active-low.
> +      This setting is shared by both USB host ports.
>  
>  required:
>    - compatible
> @@ -39,7 +78,7 @@ examples:
>  
>      usb_phy: usb-phy {
>          compatible = "nuvoton,ma35d1-usb2-phy";
> -        clocks = <&clk USBD_GATE>;
> +        clocks = <&clk HUSBH0_GATE>;

This change is really redundant. Instead, add optional properties like
nuvoton,rcalcode and nuvoton,oc-active-high.

The rest looks good, so with above change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

