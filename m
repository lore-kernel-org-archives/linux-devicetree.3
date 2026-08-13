Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD636A008;
	Thu, 13 Aug 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609114; cv=none; b=DKZ5sxqBg4iCsE6o2dpWkVT9j/rCSanJzDOjq03Gv5sCDmAowlIdEYvAlStkybTsnRtxl0JpF2CbcPfc8XHdEYQ+xvnC9khtx2O6qI5CpIYuFUtL5YTmPzzz8E6kn5GlqI53ZNqzdt8GdyBiNj2vHJKMPBZPoGxAl+qlux5nGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609114; c=relaxed/simple;
	bh=ynCM1OltBVY6VtbJJE0gRlWDxATVC7HsRV+vthc0CqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE/ZBlyV8eAxPnFqNTYXE053B2ao/vHRHj3gse6yYK6LcvX3OgaAlhQg4iOtWHPilXzoSU3NxPG4zVOkS4qv0DoLN5ISAGBgBvrZk734Xb5SZ/400yO9IBx4LmRE1kSnUWsM+LXud6EVHbG3daFGmEkuRqgJ3fUZKNKjXqJiPdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xe+RHaTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xe+RHaTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360AD1F000E9;
	Thu, 13 Aug 2026 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609113;
	bh=6lKhAtdX6ajxLRq78OZCtHKqt/EMngZfRfG821+Ysrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xe+RHaTAqmXrzjW+inuEbx9ggFBmtrC7kMsdWYLnQeY7kPHsrPEHMiA3GVmHLICEw
	 NJtP5+nxrDnnOeX3BCueZ/tHPYpcAiDZB8zRdgp56++qdGBNPP0e+tHrXJIqHX4Aq9
	 ZfLsPu9o6A/5ht2IJJrPC7j+aSr0HYHPHtRd9JCzfyIt1fBxEuj1w6QdSzT0jI7+CN
	 b+L8b/WeyA01CfIRr+tEfWs1inWPxtZ2wWrXf64WsFaCiHFM7qECGghB0U+4C2++EW
	 FvHtvdXIEJjvdAG0p0aKk6cDiy+u0qplLORiV6muNSpkIewgSH3mB9TPMn6NAXDiJp
	 QJ6kubQEZ2PDg==
Date: Thu, 13 Aug 2026 10:18:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and
 VF61 on Iris
Message-ID: <20260813-gaur-of-authentic-will-3cdcdd@quoll>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-4-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810142047.2811230-4-mehmet.fide@gmail.com>

On Mon, Aug 10, 2026 at 04:20:46PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Vybrid Colibri modules are documented on the evaluation board only.
> Add the Iris carrier, as the i.MX Colibri modules already have it.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 8687631..d58343f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1711,6 +1711,12 @@ properties:
>            - const: toradex,vf500-colibri_vf50
>            - const: fsl,vf500
>  
> +      - description: Toradex Colibri VF50 Module on Iris Carrier Board
> +        items:
> +          - const: toradex,vf500-colibri_vf50-on-iris

This should be just part of the enum with
toradex,vf500-colibri_vf50-on-eval.

And use hyphens, not underscores for every newly introduced compatible
even if it is inconsistent with old code.


> +          - const: toradex,vf500-colibri_vf50
> +          - const: fsl,vf500
> +
>        - description: VF610 based Boards
>          items:
>            - enum:
> @@ -1725,6 +1731,12 @@ properties:
>            - const: toradex,vf610-colibri_vf61
>            - const: fsl,vf610
>  
> +      - description: Toradex Colibri VF61 Module on Iris Carrier Board
> +        items:
> +          - const: toradex,vf610-colibri_vf61-on-iris

Same here.

Also, Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof

