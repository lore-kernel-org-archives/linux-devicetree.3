Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014B35AC11
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733407; cv=none; b=rvi5cFJuTrxnUz8gJ4BDFKHvQ1U2FfshRvJ8cyaTycmE7YD1714AL7VN9wNIieNl8/8jnFn2aMd+rTJqUlvJAWLuvUF6hbdvB39kqDZTQfzqOQbxtgkwymuxz4b16k4O4vbWE+7J4LEm5MhDfm67IEDjdYw1sWwIOVcO6AiOPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733407; c=relaxed/simple;
	bh=1BzOXqGhEucX1R0QAUs0Yyi4AXR0hKgrXTWMmfFZB/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsDFrG/ggI2SrB7ht5J453Ca+OT/9qKo+ovKexLVEr62xP2vZ9H8fGR0SMIdcEBRsMywnQzCi7xLDmd4Qg6B5tg/X8oA7fTJp7ZPb7ypLxhWYj8Va8a0ZpNrly1+Z8fFx4k5C4Ut7TEdRDoQaLyVvaBRjKcUG9S+lVexp3rEyro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spmgClVp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spmgClVp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad4170e8eso181702185ad.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784733404; x=1785338204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb6fmPQgCkpIWTq1FvlF/qpH7q9MjzKXrvR5lC4uI1c=;
        b=spmgClVpJfHmWDnFhOOEnaLD2MT3SDVt4vamrUq0qsIdzLzWO3dPJuIRO092WG7dlD
         xshMtx0axBs65x+g6ADjIz41/xXayyh5K8vBR/itEHkZmFYnc0fPPNmgcViXPvIuuCPe
         zsT+c5xpsJnO5yvCfGyA6CrMg8EWVOrGv2gnzwjaonJYrIY0JYzvI4ig5ZLkKCMsMiAk
         4GtgVfOndwopWSvT/l7Oe1CDcR3hJY3NmQzURcvIkDPDMzlwCItwpgIzAzExbI/TR4Np
         bY35YZaPRC+UQzvdqXQ7zGFatxsIk7vaOWZ86Fo8XdlUH7WejoRQmA13EGu9w3BE0idR
         mTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733404; x=1785338204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb6fmPQgCkpIWTq1FvlF/qpH7q9MjzKXrvR5lC4uI1c=;
        b=sRAYIJgFPtd3vNUB+GwnZvv5EgB/8DIuHu5WcVWlubOW4+3RT4IzleP9wta4VGa0S1
         hRWzz3kwyrzSXyXBMAgOH82TlRvEHnapnUtdHa2y5rguky9IpUE9BgLS7rwAX8C20OKh
         cEJAXqkyFsbt37h3pJmGcAGCh4LORDZ+3qNL/NFrt2ie7+uOV4s+++40mrxW462WZxXK
         O79WEZjJNwWs0k/0hSas2XEx7SmIThE9/vNrgCGU9o9xPhDToUS+F8HljvT2EhY70//w
         LQwoW8N1eWWakcY7NWNeTkvzQFy9AV6M1+d59kRI8qwf9jSaxO2LohGttVCKitGBvS+o
         YWog==
X-Forwarded-Encrypted: i=1; AHgh+RpYVA1IaLeRgKD3pYiyCpOrWgPQPN7zqx3VXbrLs4Q/kj/iOrPitdyrLEODag0GBfsf4BHok50/uklp@vger.kernel.org
X-Gm-Message-State: AOJu0YzjXLGfO7EJxUtZUXGQCymRqGJ/UCTnPer6jieS+c6tlfTXmuYo
	rwi+v26uEGzya8S9TdHhEQ5VtScybWDPEcfyRKsdco2xMw5M2h7NjcEHrkyS1TEGzF8exKrNwYK
	7sdc/1cU=
X-Gm-Gg: AR+sD10BQ68vbZAk/IUYVLY7kkifNKvuqEacVqFHscC3OFe5hZ+WWd+kEwPW0pmtxj3
	xywt/kFYgd9qqTrjWB83rUUBNwJhBppjCIqbPK5AIr28Jl4QqHPUyGBkoFNOkLq1QQEEKmkFOYq
	72jcBbAQ+y21wazLwCuAl/h+j0zx6upJutRaWnBdN88FU6OP2iVVIeyHSNojXbwWI3HWAfROdBx
	Y79kzW9468nTzj3IrW1WGX6o8zwpS7wG6LIJkpH2vhjmEwtYzjLYRUL5iis9NQ6S/2EDvFJuCuz
	muVx9BvA7VzsqdEffJKve8HN04aSipvLg7aR0FFcP1WLYRP9RuFhPdxAePCXXQJOJj6jh0N2qHG
	m3JNqu45RFfQrZ1yEuvMf7mwptWpLb39q/yHW5XkxbIAs5JWcdAkrmjUH4HbHyH9kNnXf/ysu7u
	T5QbXoqA==
X-Received: by 2002:a17:902:e890:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2cf34633722mr240566765ad.0.1784733403291;
        Wed, 22 Jul 2026 08:16:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ffc8:5f3a:2bec:f5de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31319asm17222825ad.60.2026.07.22.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:16:42 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:16:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: remoteproc: ti,wkup-m3: Convert to DT schema
Message-ID: <amDe2FplJV0g-uDz@p14s>
References: <20260719-ti-wkup_m3-v1-1-848a95b401a5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-ti-wkup_m3-v1-1-848a95b401a5@gmail.com>

On Sun, Jul 19, 2026 at 11:36:41PM +0530, Bhargav Joshi wrote:
> Convert Texas Instruments Wakeup M3 Remote Processor from text to Dt
> schema. Add optional resets and reset-names property which was missing
> from legacy binding. make ti,hwmods deprecated as it no longer needed,
> it is kept to support older board files without ti,sysc.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/remoteproc/ti,am3352-wkup-m3.yaml     | 89 ++++++++++++++++++++++
>  .../bindings/remoteproc/wkup_m3_rproc.txt          | 52 -------------
>  2 files changed, 89 insertions(+), 52 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> new file mode 100644
> index 000000000000..9e8a03acdec4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,am3352-wkup-m3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI AM33xx/AM43xx Wakeup M3 Remote Processor
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +  - Bhargav Joshi <j.bhargav.u@gmail.com>
> +
> +description:
> +  The TI AM33xx and AM43xx family of devices use a small Cortex M3 co-processor
> +  (commonly referred to as Wakeup M3 or CM3) to help with various low power
> +  tasks that cannot be controlled from the MPU. This CM3 processor requires a
> +  firmware binary to accomplish this. A wkup_m3 device node is used to
> +  represent the Wakeup M3 processor instance within the SoC. It is added as a
> +  child node of the parent interconnect bus (l4_wkup) through which it is
> +  accessible to the MPU.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am3352-wkup-m3
> +      - ti,am4372-wkup-m3
> +
> +  reg:
> +    items:
> +      - description: Address range for UMEM
> +      - description: Address range for DMEM
> +
> +  reg-names:
> +    items:
> +      - const: umem
> +      - const: dmem
> +
> +  ti,pm-firmware:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Name of firmware file to be used for loading and booting the wkup_m3
> +      remote processor.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: rstctrl
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +    description:
> +      Name of the hwmod associated with the wkupm3 device.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - ti,pm-firmware
> +
> +dependencies:
> +  resets: [reset-names]
> +  reset-names: [resets]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    target-module@0 {
> +        compatible = "ti,sysc-omap4", "ti,sysc";
> +        reg = <0x0 0x4>;
> +        reg-names = "rev";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x00000000 0x00000000 0x4000>,
> +                 <0x00080000 0x00080000 0x2000>;
> +
> +        cpu@0 {
> +            compatible = "ti,am3352-wkup-m3";
> +            reg = <0x00000000 0x4000>,
> +                  <0x00080000 0x2000>;
> +            reg-names = "umem", "dmem";
> +            resets = <&prm_wkup 3>;
> +            reset-names = "rstctrl";
> +            ti,pm-firmware = "am335x-pm-firmware.elf";
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt b/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
> deleted file mode 100644
> index 3a70073797eb..000000000000
> --- a/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -TI Wakeup M3 Remoteproc Driver
> -==============================
> -
> -The TI AM33xx and AM43xx family of devices use a small Cortex M3 co-processor
> -(commonly referred to as Wakeup M3 or CM3) to help with various low power tasks
> -that cannot be controlled from the MPU. This CM3 processor requires a firmware
> -binary to accomplish this. The wkup_m3 remoteproc driver handles the loading of
> -the firmware and booting of the CM3.
> -
> -Wkup M3 Device Node:
> -====================
> -A wkup_m3 device node is used to represent the Wakeup M3 processor instance
> -within the SoC. It is added as a child node of the parent interconnect bus
> -(l4_wkup) through which it is accessible to the MPU.
> -
> -Required properties:
> ---------------------
> -- compatible:		Should be one of,
> -				"ti,am3352-wkup-m3" for AM33xx SoCs
> -				"ti,am4372-wkup-m3" for AM43xx SoCs
> -- reg:			Should contain the address ranges for the two internal
> -			memory regions, UMEM and DMEM. The parent node should
> -			provide an appropriate ranges property for properly
> -			translating these into bus addresses.
> -- reg-names:		Contains the corresponding names for the two memory
> -			regions. These should be named "umem" & "dmem".
> -- ti,hwmods:		Name of the hwmod associated with the wkupm3 device.
> -- ti,pm-firmware:	Name of firmware file to be used for loading and
> -			booting the wkup_m3 remote processor.
> -
> -Example:
> ---------
> -/* AM33xx */
> -ocp {
> -	 l4_wkup: l4_wkup@44c00000 {
> -		compatible = "am335-l4-wkup", "simple-bus";
> -		ranges = <0 0x44c00000 0x400000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		wkup_m3: wkup_m3@100000 {
> -			compatible = "ti,am3352-wkup-m3";
> -			reg = <0x100000 0x4000>,
> -			      <0x180000 0x2000>;
> -			reg-names = "umem", "dmem";
> -			ti,hwmods = "wkup_m3";
> -			ti,pm-firmware = "am335x-pm-firmware.elf";
> -		};
> -	};
> -
> -	...
> -};
> 
> ---
> base-commit: c6859eed755df351a3978b33cb92365f9b3e8f06
> change-id: 20260719-ti-wkup_m3-edac718d0d7c
> 
> Best regards,
> -- 
> Bhargav
> 
