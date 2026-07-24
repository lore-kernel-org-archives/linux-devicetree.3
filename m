Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3509361977;
	Fri, 24 Jul 2026 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873316; cv=none; b=loe2KrQAuiGESr8V32VQBeVEreOg9kBaXEarrsGgAzXBFE5hBcHvR8/8hKnxtsmQFWts8qZh/sjJfWgupJxh7URNTGWgpMk5dlSWTmMyCmtZSCGiphioeZfRXFwWMqwvwdNICLeEn9FZXoV9OWr9Qdki/X3wvQIdzFHJdfYyGoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873316; c=relaxed/simple;
	bh=vRX+71aUuymojpOsbwtweGKREv8WIDgi1ONUJTWaYBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0Efx/05PwGMB/KrWWWdriIY5ha8c00Ef2eHTfLmu+3f2wOVCs7xLQRHPnBdmQVQNUzEvS67l4aCUPDnHUIZUxgOEx2xJEQooh7r+KXLpLmDDDffMGF422ZZhyw8IGk3o+vMxUqXgCFf2BAdDFAeSk8kcPvKC9Icc/qDTA1y9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0RL2G8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0RL2G8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5318A1F000E9;
	Fri, 24 Jul 2026 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873315;
	bh=WQBrih1V2c7eezOy98taIHWz4vgMeqRiJE8rOtXizvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h0RL2G8XBtqsbSo50KprKkOX7fjhiaNdGbsyy6itwGFVRc2Y7GQi4TtPE2uVxkXPf
	 xNTgSKA1UlGKarX9cBCmsUBedM0hPNauqcgSgzmLfVmQbOTcSei714kibaFIPTpiHl
	 9AY7QLx7fdhQuXH1okjFuE0zmEDjv5sosl09cSyYCl0MIeMENipTS0LJOhAwwVV/XQ
	 6u8pBroeHipWkUL4MrtDxVhaWtEUtu7wUSLgUL8LEcQJkVW0wzwo4Y7BzH3z4RtKZv
	 FreE8RLOM6oK/8NX1EobzlgIhc7ufQTXqnucdzb7ZkShKtPfq6cd0vyB49edSiM4sf
	 2AQxw2bY9FaLw==
Date: Fri, 24 Jul 2026 08:08:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY
Message-ID: <20260724-satisfied-spiked-myna-eb63c6@quoll>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>

On Wed, Jul 22, 2026 at 03:45:44PM +0200, Mattijs Korpershoek wrote:
> +  power-domain-names:
> +    items:
> +      - const: transfer
> +      - const: core
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - power-domains
> +  - power-domain-names
> +
> +unevaluatedProperties: false

This has to be additionalProperties: false.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

