Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B95285CBA;
	Fri, 22 May 2026 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431343; cv=none; b=T2tx811Y1u74zOf+yo+01elrYKtMR3usE4eC+AbMvuiGzmLhL11Rpq0Y9oF5vEk7TuHa/VAEm0pM1kOM7DRJc1aOF2MYZNa0XCNQ2IGfV+/A39oa/LU+rOOxnzVHGEN5e2C+8NyOU9F1HznnwvaBvOXZdZeR4eHeo1eTU6Gm/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431343; c=relaxed/simple;
	bh=Dmr0uz19Y0qoRbRorMSjdHFLVpzXXBvzDias751tk4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VayjP7ygjsbRHdnnQDNoL4B6JqoRKzry6QjbpAxZW6dMJ6wXQc6MreiRBUNEujLWISS29xU/5J3K2VS0aVn1vZGn0PIpcVH9MaDjZO2czGTGXtjwcevcNBhrc0P5LqtyWyYRZctf7GdxbZ3AHax4nij772pdnDpBR+Oo1IW4YlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI3QZYei; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI3QZYei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4361F000E9;
	Fri, 22 May 2026 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779431341;
	bh=PmjyP9zj2TRo9gtgPsdexHG5HynloSoScMlQf40YaJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KI3QZYeiE9TCMyyUigCWbCUfk3/DstaIaKoxmks2HUx2Bd7yRR7dwzTc9KFBMgIN+
	 k9DHIAtSLxqJWajQxVtXFwLC89fVtGstdf0vAqeqWAXH0WnscUvptZW+QpmbM0E5cu
	 1aHVd1yCrA381MIEQHYAPl9ifKU4yI4HYOy8Fu60rMIROkPOWATYq6iFj8SXYV0E3t
	 2Glnj1xPsUi7bInocOcypFujg0AoCB3QLzHWWi84uGt4SbYGS2IQM5kVfBtb/S0IbB
	 75D1oWhEDKffLHcC32bslhn1gg2yn5JpTsxJN++kgq+SxKEVEi94d6UHEpo/9Z5n6Z
	 WT0qdZhCu7f7g==
Date: Fri, 22 May 2026 08:28:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Message-ID: <20260522-sweet-magic-kelpie-d6daec@quoll>
References: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
 <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>

On Thu, May 21, 2026 at 06:17:07PM +0200, Otto Pfl=C3=BCger wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc2731

And what about every other variant?

> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>=20
> --=20
> 2.51.0
>=20
