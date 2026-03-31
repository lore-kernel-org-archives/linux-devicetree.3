Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70F3BADBD;
	Tue, 31 Mar 2026 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940963; cv=none; b=O7pYwAzUpct0dFSLRseHTqWjnh2xm4uP4t8xgBLNxPXgfZL7VoSM0QaAUAxB6MIj7Amszc+GhiZkVGpQAU7n2RnicUFsI517tlpAiVJTt7ty1/f0ZgjHRtrjUMJGiDQQd30lk6RK3Zh1LDotf4bdkVMQWw3VEyC3qHY6yUki5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940963; c=relaxed/simple;
	bh=OHjzPDaFcFaxb+w0qneX65vvad9Ig+yC3Pon7vSnMcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcqtpShTfWGvC2stt45yH4Psqwxk+X6w4grslz+Ugt74zFTWWPN1iu3gDpYIpfubkXD5jhvy+p4Kb510hzCMq1c+0Nu7VbPvbuyqLO0vvnRDXWhJsKZRSnuBsjvGjdBSaXZ8X9E08hZwasPYlNrV/bfhqujlMQzwHjmjUJdsQM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGd/Mg1V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGd/Mg1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDF7C19423;
	Tue, 31 Mar 2026 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940962;
	bh=OHjzPDaFcFaxb+w0qneX65vvad9Ig+yC3Pon7vSnMcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGd/Mg1VhHHqI8aq+/SuYwyLEo9n0NrsponM34Sina5tcYuWkOmNN4BiwT9wVEAWR
	 v8M8BF8i68zI/yB6xEpnWVNKPIE5u726LARXFdtGgFINl0+5G0hNYEAKHf3ner7ZKm
	 8zW2E8MSOvDsf6sDmyq4KjhDgomnlAMeHPqFhJA4rjG5/ULATYGkyN7FBr6OfHQU6m
	 EksZCWHGWLG32JbAlMHbEt0gY2ZDApaeY+qhb0+iNKnBilfUO5FGJuEYuOS/F3hGlF
	 5x9zdJKGBDyo56ZSM1jvL2rcwnlgspo7YDCOgd3p3D5LxoAEsjRHFC8md6U35SezCk
	 R2rtZPF+e9ZyA==
Date: Tue, 31 Mar 2026 09:09:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com, 
	gehariprasath@ti.com, y-abhilashchandra@ti.com
Subject: Re: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow
 audio-refclk as clock-controller child
Message-ID: <20260331-flashy-hilarious-whale-6e606c@quoll>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-2-m-shah@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330094459.128648-2-m-shah@ti.com>

On Mon, Mar 30, 2026 at 03:14:58PM +0530, Moteen Shah wrote:
> The ti,j721e-system-controller binding currently only allows
> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
> schema. However, the system controller on J721S2 also contains audio

J721S2 or AM62?

> reference clock controllers (ti,am62-audio-refclk) that use the same
> clock-controller@XXXX naming pattern.
> 
> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
> or audio-refclk schemas using a oneOf constraint.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index f3bd0be3b279..d5d84a8f1257 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -53,9 +53,11 @@ patternProperties:
>  
>    "^clock-controller@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +    oneOf:
> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#

Alphanumerical order.

There is no ti,am62 in the top level compatibles, so why am62 is here?
Top level has j721s2 but this ti,am62-audio-refclk.yaml only am62.

Best regards,
Krzysztof

