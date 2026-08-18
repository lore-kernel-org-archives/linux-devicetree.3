Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E69275AFD
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036593; cv=none; b=ifKC1kAHfM2q1vuOazkK0BgWP+XZqW9gHmkUb43/gzVR37vdWUeuqk2CKm//fpzqoVOOFsbSk6rHocixbccSCTYMjFu8AprC7xyf0sXL6M67x17g/jnWIFHO/zrT1n7Zh7CEShHlVmqHNffRH+VTJohlWSFfOrpksQmPWnWgo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036593; c=relaxed/simple;
	bh=MQRWrzY5wOCB7p9wRBydej9KoLrZzm0CNXnM2FYWks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHvw0NvV82chGvLQJRx2wvjAVrySK5PNMBn0G6BbNmakesSSltnZDxCZFBG1/+1KPLzNQpjJxtBlwX/FzMt8rY3Wk0khloKDFuILfdnHGlXBJy83UYTA8wyYFdiDi1eFBTFAwSWPEkOcqoI9LBzsZSW013t6R7zs4w8xaipQjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqUAQN4m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqUAQN4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44AA1F000E9;
	Tue, 18 Aug 2026 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787036592;
	bh=1hljzrGdlThgzlFkIUEsz4XpoBxj8O9zbabFB3ZPlJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iqUAQN4mpLZzdm3I7/bvQhwrmp4tLwbJT74AvBLo5G7xyDM1+mVbwghufDdWJIOz5
	 3GsUfKscItlijIUSgBzsgA4cvM68aGe2FBqxyZuZsydflK/+rkiMCLSis3pL8FNmj7
	 3jtXMv0cGzeArWeaZw1Bigr3Mb976ur7Q7xQufmxfu5jroaxcF0iEIHMYqhsPLc+sK
	 fvYs/6m3M1Jb+PYbMxa4w21oCXSlADYCAUJfEujErOh2wICWO35icF1BZ6EKIld1N0
	 qjvYZtAb8yqx8ozhw81EntDIjaNjjI+hJX76ShDw6/FB8w/onht3ovXezXL6FWjodp
	 4fC4shRn9XEmg==
Date: Tue, 18 Aug 2026 09:03:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tushar Nimkar <tushar.nimkar@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Anirudha Sarangi <anirudha.sarangi@amd.com>, git-dev@amd.com
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: Add Xilinx Versal
 NET SMMU CSR binding
Message-ID: <20260818-smoky-jackalope-of-piety-7e4b21@quoll>
References: <20260817105233.1557748-1-tushar.nimkar@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817105233.1557748-1-tushar.nimkar@amd.com>

On Mon, Aug 17, 2026 at 04:22:33PM +0530, Tushar Nimkar wrote:
> From: Anirudha Sarangi <anirudha.sarangi@amd.com>
> 
> Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
> (Control and Status Register) interrupt controller.
> 
> The SMMU CSR block acts as a vendor-specific interrupt controller
> in front of the ARM SMMUv3, providing registers to enable and clear
> standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
> Interrupts must be acknowledged in this block before being forwarded
> to the parent interrupt controller (e.g. GIC).
> 
> Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
> Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
> Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
> ---

b4 got only this one patch, where is the rest?

Can finally people in AMD start using b4 to send patches? How many times
I need to ask for that?


>  .../xlnx,versal-net-smmu-csr.yaml             | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
> 
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    iommu@ec000000 {
> +        compatible = "arm,smmu-v3";
> +        reg = <0xec000000 0x40000>;
> +        #iommu-cells = <1>;
> +        dma-coherent;
> +        interrupt-names = "eventq", "gerror", "priq";
> +        interrupt-parent = <&smmu_irq_csr>;
> +        interrupts = <0>, <2>, <3>;
> +    };

Drop node irrelevant.

> +
> +    smmu_irq_csr: interrupt-controller@eca10000 {

Drop unused label

> +        compatible = "xlnx,versal-net-smmu-csr";
> +        reg = <0xeca10000 0x1000>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> -- 
> 2.34.1
> 
> 
