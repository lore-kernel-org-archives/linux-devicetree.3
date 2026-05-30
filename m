Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2443AB274;
	Sat, 30 May 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141226; cv=none; b=RxhRHlpknoDZZom6GPdzYp8iwUbJcwtfNli9qd86eT3+x3uqgMUQfMLokajhUa93lRtFQPQbPcQx39XVxmVwtY9crYt/dr7epKdivj8EjSWeU+9JKZ+XL/JdKTO+2yAyGGywlfIMBuZ4Vov5sNc8qDGahSNUDQBaTQ+PchS4Jio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141226; c=relaxed/simple;
	bh=d1ztqgKo7ALxbfp8vsj5q4TYp5kDjsnkOsc3oLFNZ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4LElg+DqIr4UB8EQOGH7z9iPQ2qo1LDH0ewhmCG513SXhRfeLsoJoXMaUo8L+qECDE96GIJOPPY95pq2bScTqs91VS1QRmW1Da5uwCHs53EAeCGB2YYQBfSLDsL59jUmYpFgaPqWfa+Ai+CbrzeGIytBNAhO8pmz1kFyWAyycM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+J31+Ti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+J31+Ti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E0D1F00893;
	Sat, 30 May 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141224;
	bh=SHRa6UjIjIDOALcWPJeJhsJlvcKElI4XI1iQ+YZgaB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+J31+TibFmUARYT9O5enYAFt6RbASfiRNsiz8tkpC2j5k2KCR8rt+lLFj7TTM4Do
	 rNFtR0eWsW8lz31Nc+sc6wEBhfaFcnk47eFUYBlEPGP46buZceYUR5ofYDr3LBvIOs
	 6a2HoHdsYP5M+DwO5QuBpl3N5tk7STH6vBrzhTxtgFvmcrq6XSu7FNU0YDZdoj0uZ8
	 h86HWfIQPf6KUmgMqhhva5HBuMbIOan8x5dgEvd/1KCFclu5HqCqsRsypGcwQcBOOJ
	 Le8V/qXbEMh+36XkAQAgf6+Qf92J/DVPE0rE04r/X3X6t4SGWsZVyvnZL+lXChLOu9
	 Aju4R6HiO7q2g==
Date: Sat, 30 May 2026 13:40:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: soc: ti: ti,j721e-system-controller:
 Relax the bindings
Message-ID: <20260530-kind-asparagus-vicugna-b710fb@quoll>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <20260528-ti-main-conf-v1-4-a54ac5c8d081@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-ti-main-conf-v1-4-a54ac5c8d081@ideasonboard.com>

On Thu, May 28, 2026 at 03:53:45PM +0300, Tomi Valkeinen wrote:
> The ti,j721e-system-controller binding specifies a specific schema for
> each child node. For example, any clock node under the system controller
> node must be a ti,am654-serdes-ctrl.
> 
> To be able to use the same system-controller binding for more SoCs,
> relax the bindings by making both clock-controller and clock accept any

NAK, you cannot relax bindings.

> kind of child node.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml      | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index f3bd0be3b279..56712ebdd01b 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -53,9 +53,8 @@ patternProperties:
>  
>    "^clock-controller@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#

No, child nodes cannot be generic (see also writing bindings). You must
have $ref or use the compatible style.

Best regards,
Krzysztof

