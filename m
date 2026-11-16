Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811878;
	b=erz0mhC/XTJUg0KEr9AyPYmAk3WhIyKX6riH7wbQUJrfpbshFYn1bM+gylh3PE7MI71X
	 ME+jP+Jj04M//SscYnca0khw4EEm5+1gSB504TAr77l6oFXupESgd22ig07JirpdJToVn
	 zL3xy2kFdDb4SOt0JfbEYnPdZS0btNd3fZp5mWgK5vZy3R7oP9JbKEFIX4d1E5j4rKHnU
	 xlLQ4T4THkFYySKZuxenGU0Bry6F7GCYusv3gcuJbjbsPGNs2wIWPGTYqsyi9WJ1rC1vZ
	 4IUuPLKoloB4lpJq+NVQLz7te0cM93itbhte+NFom12I0cvnYFLMSsVE3Rl9EX8tZ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K4G3vtF3EXpcWXUVltCjBtpSx2zykht4IPE6VMUltOY=;
	b=wxJ74h6HufN+cDgz+ihsVSCNSFCoUJ5h0z90V1VSkmxZ+KPgtofFGD2b3NZRviFDm1np
	 j65IRGYHnfQwp6BwctkSBV1hjWzuZRICg0cmYqWLaJnWBr/6tPClB36BftcpgbLk8GFjM
	 JjeI5k25JTfmPp5/h5siPjzOb+m6wKc4CK35BLgD6j7tVNwgv3GqEYgJFpym/XfwevGAJ
	 o3pIT79N0okQ4zgpFJtmQwP/Rfqmf6shNSvp44JFO5z0E1mFVxPNNW/ZmOJe/TisKvcXe
	 jU1FKHupDif3MkuodNvZxRUgFiNkV7swrCTHyuMsyDQPsrLAiKgcRetHXKGBJ+RPIOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1fmu+OW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B083606A33F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1fmu+OW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96131F000C4;
	Mon, 16 Nov 2026 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811877;
	bh=K4G3vtF3EXpcWXUVltCjBtpSx2zykht4IPE6VMUltOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1fmu+OW4w2FBxU8AGbWGQ5JlMBF6FqVkdzcrhuFrQ+iHnW//Ja+DjlMOt1nsxoF6
	 YtLjp7XAVcSsDOqm94QI7zflQoYMkXQ6smz7+IsHR15Iv2hJEbXix+JWmkYqH2C5Jf
	 9E+sCXq4ZaL+jXr7aiWMkWshmdqe5RvqXSE3wRgUBEWcyybfKC/LDr9diTxFeVAt68
	 cnOa5PkM0FoVY3E/JGT23cLZXpZElAzI6DZ6lsxieupJeqW1H2+9Zvf9+D2j1XB3vu
	 rKneen5d/78MF/EYLz7wJqDd0ke1icckzc1JSsvAhuMa4lNxjMo4hKeb+dswBaMBeu
	 vBJrp58UExTnQ==
Message-ID: <sashiko-outbox-216335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: interconnect: qcom: Add SM7250 RPMh
 NoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-icc-sm7250-v5-1-506be082a3c5@brar.si>
References: <20261116-icc-sm7250-v5-0-506be082a3c5@brar.si>
 <20261116-icc-sm7250-v5-1-506be082a3c5@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:51:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: interconnect: qcom: sm7250-rpmh: invalid child
  node modeling
- [Medium] dt-bindings: interconnect: qcom: sm7250-rpmh: clocks
  forbidden on aggre2-noc
--

commit b308f53251bfcc5ecbf2fb5f677aee7859d07704
Author: Ishu Brar <patches@brar.si>

dt-bindings: interconnect: qcom: Add SM7250 RPMh NoC

This commit adds the Device Tree binding schema and interconnect ID header
for the Qualcomm SM7250 RPMh Network-On-Chip interconnect providers.

> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm7250-r=
pmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm7250-rpmh.=
yaml
> new file mode 100644
> index 0000000000000..8e729d78cce40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sm7250-rpmh.yaml
> @@ -0,0 +1,104 @@
[ ... ]
> +  clocks:
> +    items:
> +      - description: aggre UFS PHY AXI clock
> +      - description: aggre USB3 PRIM AXI clock
> +
> +  interconnect:
> +    type: object
> +    description:
> +      The interconnect providers do not have a separate QoS register spa=
ce,
> +      but share parent's space.
> +
> +    allOf:
> +      - $ref: qcom,rpmh-common.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,sm7250-compute-noc
> +          - qcom,sm7250-mc-virt
> +          - qcom,sm7250-qup-virt
> +
> +    required:
> +      - compatible
> +
> +    unevaluatedProperties: false

[Severity: Medium]
Should qcom,sm7250-mc-virt and qcom,sm7250-qup-virt be top-level compatibles
with reg: false instead of child nodes under the interconnect property?

Unlike qcom,sm7250-compute-noc, which shares its parent's MMIO space for NPU
QoS ports, mc-virt and qup-virt are purely virtual BCM-voting providers with
no QoS registers at all.

In addition, defining this child node as a fixed property named interconnect
at the top level prevents a parent NoC node from having more than one child
interconnect node, and allows child interconnect nodes under any of the eig=
ht
parent NoC compatibles rather than restricting them in allOf to the parent
NoC whose register space is actually shared.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: qcom,rpmh-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm7250-aggre1-noc
> +    then:
> +      required:
> +        - clocks
> +    else:
> +      properties:
> +        clocks: false

[Severity: Medium]
As reported by Krzysztof Kozlowski on v3 [1], does qcom,sm7250-aggre2-noc
also need a clocks property for the RPMH CC IPA clock?

In include/dt-bindings/interconnect/qcom,sm7250-rpmh.h, MASTER_IPA belongs =
to
aggre2-noc:

include/dt-bindings/interconnect/qcom,sm7250-rpmh.h:
#define MASTER_A2NOC_CFG		0
#define MASTER_QDSS_BAM			1
#define MASTER_QUP_0			2
#define MASTER_CRYPTO_CORE_0		3
#define MASTER_IPA			4

Setting clocks: false for all compatibles other than qcom,sm7250-aggre1-noc
prevents Device Tree from supplying the IPA clock needed to access the IPA
QoS registers in aggre2-noc.

[1] https://lore.kernel.org/r/20261027-tangible-steadfast-serval-caccf3@quo=
ll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-icc-sm7250=
-v5-0-506be082a3c5@brar.si?part=3D1
