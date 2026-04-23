Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76F3E1CE5
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935135; cv=none; b=nSe71OudeaGBH600+6kkTM3w6okkPjGn4qOPVDUuopOSaI7LF+6g84JhTkHu28pAstqgmcKBqSoZp2BN/At1bKnS5fGzv8L5hbKY7+fa2g8k/NS6bYaJUV4ZicEXcgwGhGcve25D9k8hYqgvhLLUTaxWAA7fx2KyiOuyttA/ICs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935135; c=relaxed/simple;
	bh=etso0PsxipiG0bkJJDrFuJiHebuPd5OrBdIOIvbX7vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXurA3XGOkhydZZ+aowaPBqLpIIWRcEQeF2n4knSb92Mb1f1eKba+dRXeOyaszg77pQWKhdrQJHmsZAcN3vMXa/x0Gb4o+OImvEBsTXoh1NjX2UzIFAcQEeWYGgIh/gvXkB1nh96Q06Szc1h9ROdZG5SmqFGfhOOf/74XuDTssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rv7jtyQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rv7jtyQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31F1C2BCAF;
	Thu, 23 Apr 2026 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935134;
	bh=etso0PsxipiG0bkJJDrFuJiHebuPd5OrBdIOIvbX7vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv7jtyQx5DRELUC4EEFZgQNJ3FJrV7CcIp7sdy4bDvZpgSQ/w3cHrAmTb7nKn8sZG
	 VlRHqSdemMNLv4ldgeGL+J3UUSIMRpP8A04GT0kNnkO/scErts7GGu1wH/tnzxk0x8
	 09P60ucsmBC5PCVTQsWM1JGScMbis5iwTfTUiusREtkmmwZm+4IbBqCalS7IQmm5x4
	 kdLFpRPf1YGbAwh/nW+XKTUyhH9j5t0+dGjJdwlVuxT9CLNkN0T4O8SJl3ZwBerxtx
	 /x4Kdph7ib+kFXLUEJvlgACdcCerFNoCwd+7S9zs3mzdlBlxV1rbJjNQ/BiesGKZOh
	 ETeb8+n0pjX4g==
Date: Thu, 23 Apr 2026 11:05:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shaunak Datar <shaunakkdatar@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, puck.chen@hisilicon.com, 
	daniel.lezcano@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: hisilicon,hi655x-pmic: Convert to DT
 schema
Message-ID: <20260423-powerful-outstanding-condor-454fea@quoll>
References: <20260422200200.126728-1-shaunakkdatar@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422200200.126728-1-shaunakkdatar@gmail.com>

On Thu, Apr 23, 2026 at 01:32:00AM +0530, Shaunak Datar wrote:
> Convert the Hisilicon Hi655x PMIC binding from the text format to DT schema
> to enable dtbs_check validation

Missing blank line

> Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
> ---
>  .../bindings/mfd/hisilicon,hi655x-pmic.yaml   | 89 +++++++++++++++++++
>  .../bindings/mfd/hisilicon,hi655x.txt         | 33 -------
>  2 files changed, 89 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
> new file mode 100644
> index 000000000000..1bed57003bd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/hisilicon,hi655x-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi655x Power Management Integrated Circuit
> +
> +maintainers:
> +  - Chen Feng <puck.chen@hisilicon.com>
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description:
> +  The hardware layout for access PMIC Hi655x from AP SoC Hi6220.
> +  Between PMIC Hi655x and Hi6220, the physical signal channel is SSI.
> +  We can use memory-mapped I/O to communicate.
> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]"

Drop

> +
> +  compatible:
> +    const: hisilicon,hi655x-pmic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  pmic-gpios:
> +    maxItems: 1
> +    description: The GPIO used by PMIC IRQ
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  regulators:

There was no such property/child before, so this must be explained in
the commit msg.

> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^LDO[0-9]+$':

Why 9999 regulators is valid? This is usually constrained, because
device has a very specific number of regulators.

Also, name should be 'ldo' if this is a new binding. If this is not new,
you must explain WHY you are doing these changes to the binding.

> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - pmic-gpios
> +  - '#clock-cells'
> +  - regulators

And why is this required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    / {

Drop and use 1 as address/size-cells. Or 'soc' like in other bindings.


> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +

Best regards,
Krzysztof

