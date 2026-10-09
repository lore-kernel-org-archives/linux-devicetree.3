Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24604E1C9F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557534; cv=none; b=LgPfwoExjimkDB0h3XsMUJokCf6/eILym3aEnRLlODbPVHEqbeAhPHqqXthTY6uL3rYrCkr3W9FHKA7LXR9tDF3hM/cNQ0b88TUtbHhGI9xumGHDytX1xWOeWgSDRtZ0GBvX9k7V6OG5oYwjtV5JagLvjjVcntT65ZEAovA67Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557534; c=relaxed/simple;
	bh=b6P0GNiLWT5uqJwZhJb7SKZUWvV/rupk7H5WwN5/jlE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ghptmeAPD4ItNg7Ie0WpQHVE4vHY7zw4ZaJ4rbiGEqykQckmmr8dy7dyL0Z+xLOjrwlGkDEnM/NqizuQ3g8FcGio9uoTBQm0VXyT/y+eermtCgZlnZdzoF7KFNmUo0Wkg/B8pNH47skwjpt3QcwrErbZi05WpmCwi88Y+wbVYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGFR9g9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGFR9g9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D84A1F00898;
	Fri,  9 Oct 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557532;
	bh=lKiZYoJGGwyxfR/pC7NdXKdxsBEYFOGIQTrMb8TohG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGFR9g9LSpsQrXlarkuumLv2wiPT+vxqTb8uc0AIfCqOKR/RrkqfodBehrnKETapb
	 7ljLs5L/0rtSWP6j+OtwGXtWZ8uu3ft2qGQWT4t4JBZUDkGxV4NFbqYfmHlU9mpgpI
	 ULnZ/qdEMzuj/fXdTE4nPWdWf+TnDA9i2E+u7b6iLRYn5+9m9puw9sALWI81i7pYEp
	 AovprxKjYtnV1q8R1Vt8xmwzYztGV1W0NM7XA7+69RpqH2ttaYKjh4+hUViw1+QEYm
	 zcq/3Rtflb2P9doa5zQHeK+NOLl6X4U7byjZ0IZqWfIamixZUw4GKQA/IqHcjug3Ve
	 wYRzxqj6MlNRA==
Message-ID: <sashiko-outbox-165733@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 14:52:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing minItems/maxItems in conditionals allows in=
correct array lengths
- [Low] dt-bindings: incomplete ethernet-ports restriction allows out-of-bo=
unds ports
--

commit dead4fe7fe0227c2a98000bdee56dfba287669d7
Author: Luo Jie <jie.luo@oss.qualcomm.com>

dt-bindings: net: qcom,ipq9574-ppe: Add IPQ5424 PPE support

This commit adds the IPQ5424 compatible to the IPQ9574 PPE binding. It
describes the interconnect paths for each SoC and limits the Ethernet ports
for IPQ5424 to ports 1-3.

> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml =
b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> --- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
[ ... ]
> @@ -236,6 +233,62 @@ required:
> =20
>  allOf:
>    - $ref: ethernet-switch.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,ipq9574-ppe
> +    then:
> +      properties:
> +        interconnects:
> +          items:
> +            - description: Bus interconnect path leading to PPE switch c=
ore function
> +            - description: Bus interconnect path leading to PPE register=
 access
> +            - description: Bus interconnect path leading to QoS generati=
on
> +            - description: Bus interconnect path leading to timeout refe=
rence
> +            - description: Bus interconnect path leading to NSS NOC from=
 memory NOC
> +            - description: Bus interconnect path leading to memory NOC f=
rom NSS NOC
> +            - description: Bus interconnect path leading to enhanced mem=
ory NOC from NSS NOC

[Severity: Medium]
Does this array need explicit minItems and maxItems to strictly enforce the
length?

According to standard JSON Schema rules, an items array inside a conditional
block validates the matching indices but does not enforce the array length
unless minItems and maxItems are explicitly declared.=20

Since the global schema allows minItems: 5, could an incomplete IPQ9574
node with only 5 interconnects falsely pass validation here?

> +
> +        interconnect-names:
> +          items:
> +            - const: ppe
> +            - const: ppe_cfg
> +            - const: qos_gen
> +            - const: timeout_ref
> +            - const: nssnoc_memnoc
> +            - const: memnoc_nssnoc
> +            - const: memnoc_nssnoc_1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,ipq5424-ppe
> +    then:
> +      properties:
> +        interconnects:
> +          items:
> +            - description: Bus interconnect path leading to PPE switch c=
ore function
> +            - description: Bus interconnect path leading to PPE register=
 access
> +            - description: Bus interconnect path leading to CE AXI
> +            - description: Bus interconnect path leading to CE APB
> +            - description: Bus interconnect path leading to NSS CSR acce=
ss

[Severity: Medium]
Similarly, should minItems and maxItems be explicitly set to 5 here?

Without these limits, an IPQ5424 node could declare 7 interconnects and pass
because it satisfies the global maxItems: 7 constraint, leaving the trailing
2 elements unchecked.

> +
> +        interconnect-names:
> +          items:
> +            - const: ppe
> +            - const: ppe_cfg
> +            - const: nssnoc_ce_axi
> +            - const: nssnoc_ce_apb
> +            - const: nssnoc_nss_csr
> +
> +        ethernet-ports:
> +          patternProperties:
> +            "^ethernet-port@[1-3]$":
> +              properties:
> +                reg:
> +                  maximum: 3
> +            "^ethernet-port@[4-6]$": false

[Severity: Low]
Does this workaround fully restrict the out-of-bounds ports for IPQ5424?

The top-level ethernet-ports container lacks an unevaluatedProperties: false
constraint. Because ethernet-switch.yaml (included via allOf) dynamically
matches any port matching ^(ethernet-)?port@[0-9a-f]+$ as a generic object,
out-of-bounds nodes like ethernet-port@7 would pass ethernet-switch.yaml's
checks.

Since this block explicitly sets ^ethernet-port@[4-6]$: false but does not
cap the container itself, will ports 7 and above silently pass schema
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-qcom_ipq54=
24_ppe-v1-0-16caf43e44ee@oss.qualcomm.com?part=3D3
