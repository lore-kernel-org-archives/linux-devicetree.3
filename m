Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391C346AF1;
	Wed, 24 Jun 2026 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287710; cv=none; b=k8jwK4y6IWOHGvJNuoUPnCdSEg1M8m+9OSSKqzTS984lvbmAVaMYcAQL+1PpT4ajSxaDyw3BU05ZCmvkcEcwuEV7Wz+8oo5RXR0Ej6SGb3wMogg8bmHVMY5Hu2mHVRyuGkhSuZm2crw7bPqluN6fpWKQTzdu5mVPuTQOdszG99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287710; c=relaxed/simple;
	bh=kELh0lHy1dTMB2YxBIbSALnUhpKyzKtDKgFW3GZ1KME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLkCYXHNzZZ+U1U1XqoQL6IPdsxFeKJc45+d3f/ilF2ImE1A4YkHwFLjKyn0R7Q8of/JH8FT3aNM4YerCQ0PQgKzHWhXrxx4qJfhiLY6dAbWTK671N0S/uyE7Bsx/nTezZ67Ffu3cLT8E82gF5pBYwRMPRLbdKFZJ02LQuyRYk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyKH1tea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyKH1tea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06711F000E9;
	Wed, 24 Jun 2026 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287708;
	bh=u8KakYLRbSNoDbaJ2N1yCCxJNFyKU8/mguk9kIB734c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jyKH1tea+3lFjdnW4QVmodi8w6Js5i2v90aLwYW70dJ3DfrxCwYKvTblRss91dfdr
	 Y3LCO9cN1F5NiUqWZmrjOxtJHyHhO1k8AFYG4sG9XxXrC3qp48bvkjy7XqzXtmuJSb
	 Y0juL1e6BGomCgJTPszYo3HR7ux626G0b3mpGNsy7ukq+zqMyFhMVxsagfIZRtlnwj
	 uGqbgq8ssxG3kcOxsi//FcRt8wCF/w07ty7p9ABEAMpWAo/HDNtnezRiyrUgmloUEs
	 9/a9eHMnXltRP5X4YEMt/VadDkvBhTNOBYnuRAcBChbwnmAbX/u8o6tm0ynOtTudk1
	 HYoaudRnDojGw==
Date: Wed, 24 Jun 2026 09:55:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: altera: Add Agilex7 Gen2 SoCFPGA
 compatible strings
Message-ID: <20260624-inescapable-myrtle-yak-b8e825@quoll>
References: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260623111716.16690-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623111716.16690-2-muhammad.nazim.amirul.nazle.asmade@altera.com>

On Tue, Jun 23, 2026 at 04:17:15AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Add the SoC and board compatible strings for the Intel SoCFPGA
> Agilex7 Gen2 platform.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

