Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C977C27E05E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428963; cv=none; b=DXISjukoa6v1U6Fo+rsaHgiw7wzGcH56sDEoSPhZOJtBxQC9Re2ikJIDU5AI3FcqMtDV1MFi0n6FHcSpVR2ZDRYawpXtG/nq1U1jARt97OX3l8K0A57xP39EXUqiRY7YaONdWfMILbdhLgK+FYb4lPM1Z1pUpclvIH5nlZuXk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428963; c=relaxed/simple;
	bh=/JMlAJtkVkMRk9eWWW8xRC7NujwNr+Vi5u7ZPMFm65A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdeMHXxDWKF3HthifyucfVvKEwevVdVMePlAx95EYNkc9L9pGItSZCQ/OeZHMMRjxMrVmnclg/AFpLCTE2/98bXk0COf+oJ9eLwPHc1QxH+MyjOneY+lR3hsRd6bnXPFYVGJ26D6wQeYy+JpoBXce38Qb3zDqXaw3a+X9kRR5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZd/U6Tm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZd/U6Tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CF4C2BCB5;
	Wed, 25 Mar 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428963;
	bh=/JMlAJtkVkMRk9eWWW8xRC7NujwNr+Vi5u7ZPMFm65A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZd/U6Tm3x6TyS+nWCPv4d4hPvSI6mO5XfGxHJsgyfP8ir//KnOrgVUPp7Vsb09Jn
	 e3X8q0hpGNaZEF7+MbQ+U3fjNOxYQFx/q1dohoWvPQqc7RYh0miACYkaziJLrpFgeO
	 OK39unOR4qLcXQ38I/J/sELVeEgqinwDrH+MeAnWmqtaDmbYX1tAcrpCXVd/rH8tZP
	 ebR73IkSTakBkLi03moTrcocYL4U+1G1pILUGBgONkVQ4ImcTZAul4KOtDLB32u0XO
	 YGAqUFToUk1eaTs2cErWhmZD4269UN+p90GnXLyCqs4r2MZRNaYqyhZ3XBpXo14l73
	 nRYD7hNG6BMvg==
Date: Wed, 25 Mar 2026 09:56:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
References: <20260324053030.4077453-1-wenst@chromium.org>
 <20260324053030.4077453-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324053030.4077453-2-wenst@chromium.org>

On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:
> diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> index fa6743bb269d..ba99a0d02bc7 100644
> --- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> @@ -29,6 +29,16 @@ properties:
>      type: object
>      description: List of regulators and its properties
>  
> +    properties:
> +      pvdd1-supply:
> +        description: Supply for vbuck1
> +      pvdd2-supply:
> +        description: Supply for vbuck2
> +      pvdd3-supply:
> +        description: Supply for vbuck3
> +      pvdd4-supply:
> +        description: Supply for vbuck4

These all look per-regulator supplies, so I think they should be in each
regulator node (see also regulator.yaml).

Or in top-level, but not in "regulators" node. The regulators is only
wrapping node for children.

I wonder what should be our preference - have supplies per regulator or
in top-level node. @Mark, any preference from your side?

> +
>      patternProperties:
>        "^vbuck[1-4]$":
>          type: object
> @@ -51,6 +61,9 @@ examples:
>        reg = <0x6 0>;
>  
>        regulators {
> +        pvdd1-supply = <&pp4200_z2>;
> +        pvdd3-supply = <&pp4200_z2>;

Best regards,
Krzysztof

