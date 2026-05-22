Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6717359A6F;
	Fri, 22 May 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431580; cv=none; b=Vviu4efTOyXW1Y+t/jWp1Z4MNBotxzNl40SlXf82rxwSs4scMzmqbbq8h9/dZVtlK3LT9L9H5YKXcv1+PZTWpVnC3ZP59oRzkQH/isMwfoQKSoDcvX5mea1pCCq+wIi9jNa+phgewjCCwcvRslUZZkhBys5pJc8zTG8I4bz1Hng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431580; c=relaxed/simple;
	bh=xGxqD3UFNYth77Dgca4ciBVjw+B1NYqBPSZgiAsFxps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAry3okW2h/h3v2E6Xh7L9VMD7C/3khlZBsLfIEOFlluKNSi+4kJ4Xem23NVyyModJuetIFj6iWRSidGfSF0okYP4q+IDOzKX1Ud8dUyZ/sn3OXJdgHfCVQae29zjFdOyPoqLZzRkLi58Y+DssQRYBj8hliSOUU0gSWCNe5kH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=ml1rLcHQ; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="ml1rLcHQ"
Date: Fri, 22 May 2026 08:32:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779431575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DuNCqvQk6TxtZkHmFkgGMkPs2osNMUjVJBRkcehceRM=;
	b=ml1rLcHQtqvWb7Wy172o/ttAYIDkfd53XDoaOCwPGgMT/FI9/1TCTuCJZy7gdJxS/1WRw8
	o7juwKFhKzd52PLC2fzSWm008Xe4doFjqM9tu8y+sEYTcc0e5D8lvA9oGUYeK1WtxAGFhF
	+LO0gy7ldkilOg2RZIKcrnlGpzkJ2X7Q4zOJH9qdMed1at89bABgm3PUHgD2PKAHVOH6Wa
	QQg0j0z4WVuY1q+eEX9/VacdugW01RH6oOoEZH5UKb1m+Bdv5ht37SZJaIcnDiKaBOEm+B
	iS+ifLbUN7NSmSdEvd7IeA77l9bYFKf3XoZ4Xcc4xFWgL/AISUSN9oCm0XJDbA==
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Message-ID: <ag_4bYWlsrpBjx3p@abscue.de>
References: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
 <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>
 <20260522-sweet-magic-kelpie-d6daec@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522-sweet-magic-kelpie-d6daec@quoll>

On Fri, May 22, 2026 at 08:28:59AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 06:17:07PM +0200, Otto Pflüger wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sprd,sc2731
> 
> And what about every other variant?

For sc2720, sc2721 and sc2723, the regulators should also be different,
but I'm not able to test anything with those PMICs. The original binding
was wrong.

> 
> > +    then:
> > +      properties:
> > +        regulators:
> > +          $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > 
> > -- 
> > 2.51.0
> > 
