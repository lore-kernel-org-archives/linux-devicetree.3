Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096817;
	b=jmvHS+2RKmzPciAeH93xHt2CNMhE8SMZkCWHyQ+34F1+uvxjtzi/yJxIsamhX2YRviSS
	 NsTyVAjveErjnUjdygQ24c1Fc245X+yIPkflK8JMfMISI07a1bwiGg8hK1NiaPMPPD31V
	 9KZ44BoeC/LOPjhVIhwrvShVIJ54+bvorrLBnxUvI9nOorf5vw1hKHVBVC4/aP6gUap1p
	 tlFPdAcjmRj3iwBAgH/ApysSEr+obXtjBqMSXMZ7muzgPo+DYFQopIQVP60v0OKIQ7u46
	 8HjyIDmVvaono1AgOxnmQFsREBrn0zuNLyCxVwNw3MJEsZP6RHjsTfxaoYqavGBJl/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096817;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=63roZ7UxsuRFtVUCrqTnjLwtbzk1EhVzGya0ZF5CON0=;
	b=2LByIZjN8A4edUhnsz16b1aNlbZVFlUlRl/VSibC6/4AIlMKqo48a2HAuANPArdL2ZMc
	 On6Zvbk2qZLCdtdculbplElVYWY//OhL5SKrD6Q6Ejg/o89Tc3pgeOf5CJU8mV4r0thEj
	 3cQA/0gHa6VVo+GEA5EeZ71Zxu7imzUAin8Qrnte5s8KDqkskRIXDlHl8D7yVHlE6OUOh
	 QRUOjCABEJW4cyqakgZ/1DN/INMuAgtz+r3aSQdWB30Sh0DCJ5gpyJmlQ82sYk1xgH5kC
	 bMMj2s4uWHH2SkMekw5tc0T3vGuTtgaWya/pR92kbJn9ZsprX7BvXvFxGWBJ4xOIfrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fA2svBB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF1606A330;
	Thu, 19 Nov 2026 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fA2svBB3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797EF1F000C5;
	Thu, 19 Nov 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096817;
	bh=63roZ7UxsuRFtVUCrqTnjLwtbzk1EhVzGya0ZF5CON0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fA2svBB3UuFv8OwARwy1buyqp/vQyqCcr3OP4LAJg6d6EowBotm87Hia8VxnNWfPn
	 rHUbu7ejMfn/ocsrp7jordp0fUi6Prjh5h3YTvqzTD4VBDnzT8pCdhAHF+ua8T8Ds8
	 pmXK7K/s4h7M22riyDlSemaxhD1LDNfW+9wtyB2+O30auf2noONeCZ7AY7XEVe724w
	 P8EdPrCTejytZ2J0RnY5PdG7gGRT5soXe/tpWSynVwkD/TLfseLzUm0aL+afb8H7jK
	 iOlJdjHEzA7QXMHeaYafNChFPIebvMPJk3rC5ekwnE817oAHi2kuw2hZYP3jtOj30x
	 6aTt/I1FBlZww==
Message-ID: <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Date: Thu, 19 Nov 2026 15:00:08 +0100
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
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
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
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 10:01, Jie Gan wrote:
> Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
> node used by CoreSight debug and trace blocks that are owned by the
> Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
> runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
> carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
> firmware to control those blocks.
> 
> The provider is a Qualcomm platform/QMI service node, not a CoreSight
> graph device. It exposes the qcom,qdcp compatible along with
> per-connection QMI service/instance identifiers; the QMI service
> version is the only optional identifier, defaulting to 1.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
> new file mode 100644
> index 000000000000..ee0a66b12dde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Debug Control Protocol (QDCP) provider
> +
> +maintainers:
> +  - Jie Gan <jie.gan@oss.qualcomm.com>
> +
> +description: |
> +  QDCP is a QMI-based firmware provider used to control CoreSight trace
> +  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
> +  than the application processor (AP). CoreSight-facing consumers look up
> +  the provider through a "qcom,qdcp" phandle, naming a specific
> +  "connection-N" child node rather than the top-level provider node, and
> +  issue typed firmware requests instead of programming registers directly.
> +
> +  This node does not represent a CoreSight graph device. It is a platform
> +  driver that establishes the QMI connections used by consumer drivers such
> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
> +
> +  QECP exposes more than one independent QMI service (for example, a
> +  separate service used by remote ETM/diag sources). Each QMI connection is
> +  described as a child node of the "qcom,qdcp" node rather than as a
> +  property of the node itself, so a single provider device can establish
> +  more than one connection. A node without any "connection-N" child is valid
> +  but provides nothing for consumers to reference.
> +
> +properties:
> +  compatible:
> +    const: qcom,qdcp

Standard comment - compatibles are not supposed to be generic. That's
why you have entire commit msg to explain any oddities or deviations
from common rules.


No resources here, so this does not look like separate device.

> +
> +patternProperties:
> +  "^connection-[0-9]+$":
> +    type: object
> +    description:
> +      A single QMI connection established by the QDCP provider. Consumers
> +      reference this child node directly via their "qcom,qdcp" phandle, not
> +      the top-level provider node.
> +
> +    properties:
> +      qcom,service-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          QMI service identifier for this connection.
> +
> +      qcom,version:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 1
> +        description:
> +          QMI service version for this connection.
> +
> +      qcom,instance-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          QMI instance identifier for this connection.
> +

Please don't describe firmware contents as random integers in DT.


Best regards,
Krzysztof
