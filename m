Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AEC2FFFBE
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097475; cv=none; b=SP6LW3UGIuHBnCIT/jK8CpbOVzrtr8btoK8gNxOnjAuAYyRnEFYyvHIvlhkLh0uFDMlZsecq9Sam4kRKNB4JbKtAYbKRpwzpi/5fem1kYkNpL6NS5DPiFX5ZA9YCSiRLjkczl4BhWa45NhfdHKDfQAUV28hT+VCYXTgeX9gSMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097475; c=relaxed/simple;
	bh=ca3Hsb1xEPYF4Zp0GZJuEQqYeXADs3iCcyIw18ya/No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9MsFVE9+y/4rp144HUAHEdSsYcDvaA56zM7yCPF6/WU/reLKULEAs1ziWUkpGhZgUlFmZGe2GuHFHYLDHsBUB033rOnekVb0mdHBMZ43hq8m9j6hIlga+/Z9EqDk40ppnbBko/X9duGncI44Ut/6eQzWcW0iUbCUMwLbOR76sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AanzIetp; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AanzIetp"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515C73563
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:24:25 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C81603F641
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776097471; bh=ca3Hsb1xEPYF4Zp0GZJuEQqYeXADs3iCcyIw18ya/No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AanzIetpzbqmOFuk9+Xkq7YH1lEKMDblvJfJc5vfk2V/T6H9mFxXRblqEUyC6IoNo
	 TJBdDMMOnJEtaMAxVdJ3bXsl1bZeIYkoPA6y+C96EgMYB+GnRJnc36ny2IjkHfMopJ
	 uQJyi6gKwu2yyvuGq8+KntLoJyAkOOC19jDJSlxY=
Date: Mon, 13 Apr 2026 17:24:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, pawel.moll@arm.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT
 schema
Message-ID: <ad0YtjflxRQggNbS@e142607>
References: <20260411183355.8847-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260411183355.8847-1-khushalchitturi@gmail.com>

On Sun, Apr 12, 2026 at 12:03:55AM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Changelog:
> v1 -> v2:
> - Modified compatible string to use an enum instead of a generic pattern.
> - Updated maintainers list.
> 
>  .../bindings/arm/arm,vexpress-scc.yaml        | 53 +++++++++++++++++++
>  .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
>  2 files changed, 53 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> new file mode 100644
> index 000000000000..9b8f7e0c4ea0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile Express Serial Configuration Controller
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +
> +description: |
> +  Test chips for ARM Versatile Express platform implement SCC (Serial
> +  Configuration Controller) interface, used to set initial conditions
> +  for the test chip.
> +
> +  In some cases its registers are also mapped in normal address space
> +  and can be used to obtain runtime information about the chip internals
> +  (like silicon temperature sensors) and as interface to other subsystems
> +  like platform configuration control and power management.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - arm,vexpress-scc,v2p-ca15_a7
> +      - const: arm,vexpress-scc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        scc@7fff0000 {
> +            compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> +            reg = <0 0x7fff0000 0 0x1000>;
> +            interrupts = <0 95 4>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/arm/vexpress-scc.txt b/Documentation/devicetree/bindings/arm/vexpress-scc.txt
> deleted file mode 100644
> index ae5043e42e5d..000000000000
> --- a/Documentation/devicetree/bindings/arm/vexpress-scc.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -ARM Versatile Express Serial Configuration Controller
> ------------------------------------------------------
> -
> -Test chips for ARM Versatile Express platform implement SCC (Serial
> -Configuration Controller) interface, used to set initial conditions
> -for the test chip.
> -
> -In some cases its registers are also mapped in normal address space
> -and can be used to obtain runtime information about the chip internals
> -(like silicon temperature sensors) and as interface to other subsystems
> -like platform configuration control and power management.
> -
> -Required properties:
> -
> -- compatible value: "arm,vexpress-scc,<model>", "arm,vexpress-scc";
> -		    where <model> is the full tile model name (as used
> -		    in the tile's Technical Reference Manual),
> -		    eg. for Coretile Express A15x2 A7x3 (V2P-CA15_A7):
> -	compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> -
> -Optional properties:
> -
> -- reg: when the SCC is memory mapped, physical address and size of the
> -       registers window
> -- interrupts: when the SCC can generate a system-level interrupt
> -
> -Example:
> -
> -	scc@7fff0000 {
> -		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> -		reg = <0 0x7fff0000 0 0x1000>;
> -		interrupts = <0 95 4>;
> -	};
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
