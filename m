Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537A533D6;
	Wed, 25 Mar 2026 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459048; cv=none; b=iw3geIlEp8G71J/1RFf/EuODBw3/fhczie8mUC/3LWnkobcQts4r1mpk9N7RNnQ+j7f89MS7QUh5HmiTHn5Ac+i+peXVN+PM11QRdPqP05BwP6yEMdgj0sTIUCxIiZp9Y8QEh+/HWKcr4PFDZ+SnOJEMs5vM0Gi1DNatRX9CHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459048; c=relaxed/simple;
	bh=HusBMs5ilAVOLB8ncA/HLlsIJELAQCTXNX2JeIRsCq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4PM2yFsP/DhNd5UWbDEwrKZ4iFjlkhjLm9VGby06HAOxBgh4TzSRUi1bOwnav2KA5Cqg8cRh4afLjDxtYZPMH4SWDN8fpVd3oB5EV6BXRPoHMRJs9ZMuxnW5/XWnwZvcUSFFONJzNeMJby9C+oJCJi1oP4HhlDsMkFm5xCN7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sT2VQJnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sT2VQJnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610BDC4CEF7;
	Wed, 25 Mar 2026 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774459048;
	bh=HusBMs5ilAVOLB8ncA/HLlsIJELAQCTXNX2JeIRsCq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sT2VQJnz3/SJAhEEMOTLOe5VibDqtBoY+7evYG1ninlKuAavtIsWPDB0vlo2YykRA
	 zl4et1PzP8I98Yk4zo/xFFZugusKffvpo8GVJPm94oSWDjeN+DyNRUwwMixaOOXBM3
	 f9pp1WVqZaF4st0skt3G6QlQaNYa+7ISg7RVkHo9nyQrFAHxCYDCmmUf6CY6zKZfu0
	 C5JuGQy4hSipP0MQ9gC+yJclt1oF4kbzq21XuICrfHe5dNVspttKPaMvSFjots1Ekr
	 P9Fxx5J4go5s3k7MRvEFE5LBnqBD+Z7YsPs+DAzsgiA84kK/Z7yXUNYDEoUilnpTg1
	 34CVXCVdWC/cA==
Date: Wed, 25 Mar 2026 12:17:27 -0500
From: Rob Herring <robh@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felix Gu <ustc.gu@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v2 2/3] dt-bindings: misc: Describe FPC202 LED
 features
Message-ID: <20260325171727.GA3825075-robh@kernel.org>
References: <20260325-fpc202-leds-v2-0-a2f4da739b92@bootlin.com>
 <20260325-fpc202-leds-v2-2-a2f4da739b92@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-fpc202-leds-v2-2-a2f4da739b92@bootlin.com>

On Wed, Mar 25, 2026 at 10:54:32AM +0100, Romain Gantois wrote:
> The FPC202 dual port controller has 20 regular GPIO lines and 8 special
> GPIO lines with LED features. Each one of these "LED GPIOs" can output PWM
> and blink signals.
> 
> Describe these special-purpose GPIO lines.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../devicetree/bindings/misc/ti,fpc202.yaml        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> index a8cb10f2d0df3..32913966a22a5 100644
> --- a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> +++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> @@ -53,6 +53,23 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> +  "^led@2[0-7]$":

Unit-addresses are hex. Looks like you made it decimal based on the 
'reg' values.

> +    $ref: /schemas/leds/common.yaml#
> +    description: Output GPIO line with advanced LED features enabled.
> +
> +    properties:
> +      reg:
> +        minimum: 20
> +        maximum: 27
> +        description:
> +          GPIO line ID
> +
> +    required:
> +      - reg
> +      - label

label should never be required. It's extra info for human consumption.

> +
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -89,6 +106,11 @@ examples:
>                  #size-cells = <0>;
>                  reg = <1>;
>              };
> +
> +            led@20 {
> +                reg = <20>;
> +                label = "phy0:green:indicator";
> +            };
>          };
>      };
>  ...
> 
> -- 
> 2.53.0
> 
