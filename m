Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520D37106A;
	Thu, 25 Jun 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373895; cv=none; b=iK4UTbUq/QKhqG+nDHQzJRlwka/I07UiQburUr52Klo5LWDYzlA8OqfwxLrbU9y+IKWUEhG723+9SVUsjnj8Tts/hOi7bo9LJKulLavnJHVb0r4yqKLMFSbzParZNzItJht5PgrPhuKy1CL1LXvgkSS/WphgnuvAIC7KGYxs2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373895; c=relaxed/simple;
	bh=orzaKisUnjpXe7zF990QoN7/ppPz95eLvHY2LbX1Br0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cztAdsuFl0YQimmyXFFV0UtICanBhn2fnX0bNbaSsOBLyWN2fGc+n9ZT4A+323N+Tz5rW57KYPmUxijG3v4ts0gQgYUs+3GKi2XNwxwhOq3sBHwKD4IArplEOBc+7yQmUShxegqWFYjZegM2AF3SE3gHRhYPJVpQ3MLgKNIHZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1PMiipR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1PMiipR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554561F000E9;
	Thu, 25 Jun 2026 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782373894;
	bh=N6av/h+22Y5C0CsgbTSVpHRmTlyTXAkoJakqSuQu5Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1PMiipRVoh6SIadxsYDgIeP9v+jyFl1D88Ut6/Dqn4PhMKaytQnMXbgI0X/mJiAF
	 8o6eiGmy41edYeG7PvVy2yX4ZbRt78OOjm79jvngQyZCkBA62mqMenOLLBKeeQ/CcR
	 FNf9ddJwLllAMMQjoPHwakTTHJB6PfI0C+Z+PKvSb8q9ihYtvGOiNFUxSyofY6suez
	 UE3KsMHolf06IcsUZIsGPN6ruXBROATm+yMMOjG3votO9X93DD5vqfEPTTxto4AxC7
	 BvhL+kAjS2UXasWrROUANJTBIIcvBZfTKEP0RfZxfIqzUp/JnCiNsLT4Mt+MzVhb/n
	 obEjArSD3B1xw==
Date: Thu, 25 Jun 2026 09:51:30 +0200
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
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add
 simple-mfd and child node support
Message-ID: <20260625-striped-demonic-jerboa-502afb@quoll>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625023958.569299-2-a0987203069@gmail.com>

On Thu, Jun 25, 2026 at 10:39:55AM +0800, Joey Lu wrote:
> The MA35D1 system-management syscon node hosts the USB PHY register
> block at offset 0x60.  To model usb-phy@60 as a DT child of the syscon
> node the binding must allow:

Explain why do you need child node. If you have fixed device @0x60, you do
not need DT child node at all. Compatible implies that child existence.


> 
>   - simple-mfd as an optional third compatible so the MFD core can
>     instantiate child platform devices.
> 
>   - #address-cells and #size-cells (each const: 1) so child nodes can
>     carry a reg property.
> 
>   - An open child-node pattern (patternProperties "^.*@[0-9a-f]+$")
>     to pass dt-schema validation.

No. Do not explain what you did - we can read the diff. You must explain
WHY you are doing that.

> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> index 3ce7dcecd87a..1fda7e8f4b5d 100644
> --- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> @@ -19,6 +19,8 @@ properties:
>      items:
>        - const: nuvoton,ma35d1-reset
>        - const: syscon
> +      - const: simple-mfd
> +    minItems: 2
>  
>    reg:
>      maxItems: 1
> @@ -26,6 +28,16 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

This must be specific.

> +    type: object

Missing ref and additionalProps. Please look at other simple-mfd.

> +
>  required:
>    - compatible
>    - reg
> @@ -43,4 +55,3 @@ examples:
>          #reset-cells = <1>;
>      };
>  ...
> -
> -- 
> 2.43.0
> 
