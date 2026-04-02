Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FE42E9757
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142694; cv=none; b=dRSKqlb+lssQpGqzP2PY2Gf0TZMysRXLgG3nyIAsI0zgOl73AxiZCmF0748LLuwKVb7SFgwm3al4dW7mPtboBzQt6p0kEBAzNpGnrX62RFq7MpIWs9hop+NZOfM17hUBV3yJsDw0OqhttTjw6mRTRwit4FxZI9SjCFfLTMZlr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142694; c=relaxed/simple;
	bh=Cu6uyomYmnumjabskOuIe1bm69rCQyKSO2rE7I8UmIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKa7ml1pPIKWtmPV2ud1kO4g/ibCQ87dRIpnrfewprR+oWq8o2HDEsZbdDoROLwY+2wa8FUvXUpOHoK7fM68YqgyfLbkmvlFlNhk7Ov1WzctecXp2VsnmaZofDaDbiz3yipOUXhMEv4vdtyaz4Lgr0YWn7uAfgg+ys6ifKtTLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AB8j4l+T; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AB8j4l+T"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FD201596
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:26 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D340F3F7D8
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775142692; bh=Cu6uyomYmnumjabskOuIe1bm69rCQyKSO2rE7I8UmIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AB8j4l+T5lk6vmv+TrqsMahRbzp6kNezbdbEVIXAkAwvZd6Oo7A1+lcUjJnr6E8Sl
	 +5j4nDLihu+tF1nxj/Hwa/cpPXMKxQBtdup0LuOOM98orhO9AGGQ2IHkGf613Khv0R
	 fXb2lbaD4DWR37phqPAui2YUgqBtDMkvnlb64eVI=
Date: Thu, 2 Apr 2026 16:11:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, pawel.moll@arm.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: arm,vexpress-scc: convert to DT schema
Message-ID: <ac6HGqZM15ijTZFl@e142607>
References: <20260331172959.35745-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331172959.35745-1-khushalchitturi@gmail.com>

Hello,

Thanks for your patch, I have some suggestions to improve it.

On Tue, Mar 31, 2026 at 10:59:59PM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  .../bindings/arm/arm,vexpress-scc.yaml        | 51 +++++++++++++++++++
>  .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
>  2 files changed, 51 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> new file mode 100644
> index 000000000000..7870410211a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile Express Serial Configuration Controller
> +
> +maintainers:
> +  - Pawel Moll <pawel.moll@arm.com>

I'm not sure Pawel wants to be maintainer for this file, maybe add me and Sudeep
instead. I'd also wait until Pawel replies.

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
> +      - pattern: "^arm,vexpress-scc,[a-z0-9_-]+$"

This is way too generic. I suggest you have a look at bindings/arm/arm,vexpress-juno.yaml
and see how we defined the possible values for the compatible string there. For the initial
conversion I would suggest you only define as valid the "arm,vexpress-scc,v2p-ca15_a7" value
but in a way similar to Juno's file so that it can be extended in the future.

Best regards,
Liviu

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
