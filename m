Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096964;
	b=atzfmN1D7wxdsfRzhYLYTzFiEl3ACP3euMdN4Uxu8ETkD1G5/wwBQSJyYby/hrbk7E8l
	 ZO4trwcez6WnwnMC0s782Jo9LxcfudRE1n7iFMI6WBP6HDie5Ao3LbvVWY/D48A97mV4Z
	 KpD0Gju0Rpugx+Yrlmgp4JWRf47AxKrvfoTzllFv18mNmpzs+VT7SVw913c8QRqzsJG8A
	 DPj0pfFbTA9xoOXNJm5NCBmMtYbkrViZLrIxi8StY38mto2hEjrCf6CxzQgJVc9xJC32Z
	 +8bmKHA1RIFDGTNyxyDHfpwL6GFVUMXcx7+TBHypBAm/1tofORdFysQK+NJfaRrSLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096964;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=c2aO7oEyelbSnShrfwuUs5AvyqaNfXgLOAQIqhvoEAo=;
	b=iMkGMLrNAw1jSilHdgGAk9VEoGW0fbeBaKC+nkhubkULKC+gFKG0yyFLZNx2BIBOe7TC
	 Jpq7NxCNrLCQ05JNo+yJN4SPRHd2w+KbH5dnB1tP/Zdr7xwyzwH0NkYxOdGs9D9C2/aYl
	 s5Lepu6LlmBCsh3SwDrH6C4lbnqWZvaEiJF7YI4jiBg2WRMTphvTLdPu/CCK42eURkLO4
	 KnilbINX5KmsmTADS5DfH590pOoHWx+EwmVdAWe7FCUepOtAh1FyRr5lQquuLw7SIKRYX
	 YT4H+8X/LrvXJeJFdPIFf0Eh6/CDbIRvxZ5cXG3yOFNddy0ZV1Nms3/B/Z2yKgMmVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNKV+hWh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE76606A325;
	Thu, 19 Nov 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNKV+hWh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2401D1F000C4;
	Thu, 19 Nov 2026 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096963;
	bh=c2aO7oEyelbSnShrfwuUs5AvyqaNfXgLOAQIqhvoEAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZNKV+hWhIX4hLcZb5RDIA3sOiRVmfZdRzWaqCzKpLmBs5M2ZuLpKJsUhFmupro5CE
	 DG14ujYnr85jKHmRvW15BX2J5iC1IdAKxYnSRz961+isIgJigIzTCmLWPIMWeFGlpK
	 /UAQWdPG+eykYjCzg4Px0J7fB+LrQ1BJ+drPqX6KtNjbvzsUYeYJjjegCr/vRMe/x1
	 zbtvk39jNbkdH29am9fVm1woiwS8bylGBaCnzvEVEacrBNPYTj+ng2JHiAQz4eqVeP
	 hJcQiewdbDjgrZuhle+ybAmjr2sh/z1qf52E1elJvH8EEzqjWTYDqDTLiJe6pUh6KS
	 nm3HlZkugrO3w==
Message-ID: <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Date: Thu, 19 Nov 2026 15:02:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 10:01, Jie Gan wrote:
> Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
> source, for platforms where the STM control registers are owned by
> Qualcomm Embedded Co-Processor (QECP) firmware instead of the
> application processor (AP).
> 
> The node describes only the STM stimulus aperture, the MMIO region the
> AP writes trace data to. Firmware controls the STM through the Qualcomm
> Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
> phandle. Firmware also controls the block's clocks and power, so the
> binding has no clocks or power-domains properties.
> 
> The output port must have an endpoint so the source can be connected to
> a trace sink.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
> new file mode 100644
> index 000000000000..f365ce2450ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QDCP-backed CoreSight STM source
> +
> +maintainers:
> +  - Jie Gan <jie.gan@oss.qualcomm.com>
> +
> +description: |
> +  The System Trace Macrocell (STM) is a CoreSight trace source designed for
> +  high-bandwidth trace of software instrumentation, made up of memory-mapped
> +  writes to the STM stimulus aperture.
> +
> +  On Qualcomm platforms where the STM control registers are owned by QECP
> +  firmware, this binding describes an STM whose stimulus aperture is mapped by
> +  the application processor for data writes, while enabling and disabling the
> +  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
> +  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
> +  than exposing the STM programming registers directly.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: qcom,coresight-stm-qdcp
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^stm(@[0-9a-f]+)$"

That's RFC, so maybe you do not expect review. Explain in cover letter
as the most important part what do you expect from us.

Anyway, drop, I do not see how is this conforming to DT spec.


> +
> +  compatible:
> +    const: qcom,coresight-stm-qdcp
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: stm-stimulus-base
> +
> +  qcom,qdcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the specific "connection-N" child node of the QDCP
> +      provider (see qcom,qdcp.yaml) that owns this STM's control registers
> +      and services the firmware enable/disable transactions. This must
> +      reference the connection child node directly, not the top-level
> +      QDCP provider node itself.

No, the QDCP is just part of this device.


> +
> +  qcom,qdcp-source-id:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      QECP firmware source identifier for this STM, used to address it in QDCP
> +      transactions.

Drop, we don't allow instance IDs.

Best regards,
Krzysztof
