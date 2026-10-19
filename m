Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424204;
	b=YvfmltbidywGM4lPiwTO5RacNZE3Gzk7Aq0gV7MqINZk7yWNIdLw1VfFEYe2cByEnq4g
	 At8jJJv2lDxdNSj/FbhqsG3oEMl0wwZurXSax05Ti6djOC/mJTcN4ZNy7o+NA3rdRdt6i
	 Op4fpgRRCJ5Pw2XgDoD2U4rVn3UZR0pZSx7o6hM3ISYbWyqsTHeXOMi7AQFlr9WSLoBkM
	 dhiE72fmNPg3zuCR1KNS0z/T+Itr/jOiOXOWyFDc+T1nsZcfzn2OGU0BDpHrRMJzrgCE8
	 0QVSf2cpCqM9ZWWF7LtUaBU15mOrm9nOtl56qI6NyVl3K6osKBDUmKJCNAKR/jOACCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BGEeQKJl8Gk30nMbB+jqsFr1NBCv0Qnt3rMbhplll2I=;
	b=X4eWQZfVwqSSwxl95hoKatAKYs1J2C7NcMUYHzH3JXVh82jf9Ny9MRaD3+2XATGDbFcd
	 +nrtEOxVneozfIRnQlwkoBiBaZFg1z1bbkzdn5+o6R7sdLBBwjecH9kFxIrTnUMEQIfLJ
	 talXP+SNVULfz9EszZbvB7VmBQvHeB/VcEwan8K1UKLXpelWFQ4a1wtUy7XJX9erqBei5
	 +uRD9tsflWPnOV1q1eoTuBvqyefZFIHE0h8a1q+vZiskmZ8IzlS1F5dfNcg0YQFfSS/2B
	 wyYyjiBQxFkWGgvyVYgDOviygVMXwL/6bexrXa7G1FmckNXLzDlIrgQqkR9yFxI/aLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgmmFxql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8181606A33F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgmmFxql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E791F000C4;
	Mon, 19 Oct 2026 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424203;
	bh=BGEeQKJl8Gk30nMbB+jqsFr1NBCv0Qnt3rMbhplll2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SgmmFxql9HTDioP+tu72HKiH9fX8bp/cj8o5wwnt/c/KWaDrJrsvU9HLRmeRbqOkR
	 /1ugw/wkQ6e81nqf8/G0i6aTGYDbBOQUTe1Jf5uAv7cX5QLPe3K+LilXGyzxOf6Nc/
	 Kx2QchyFWM//oBCxu9cJAMOvuHwiun6ycpmBWbG5y1HPbb26JOdzEvmsA7bVErVvVE
	 pikrMv5aEjGqqrfMqCIfQXJOAr2exCHHZd8h47z4diLAyb2RWgy/iOlNyTFTWfgLYr
	 EllPj0Hz8SQtW2EDpX0Oz1zObZKdKV4zopF1Qc/aMtnsm5rUbyyOq8hklLuvhYO9HR
	 le1C7lH8RYBzQ==
Message-ID: <sashiko-outbox-177768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: interconnect: add Qualcomm MSM8998 NoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:36:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: interconnect: qcom,msm8998: require clocks for cloc=
ked NoCs
- [Medium] dt-bindings: interconnect: qcom,msm8998: disallow reg on mnoc-ah=
b child
- [Low] dt-bindings: interconnect: qcom,msm8998: require compatible on mnoc=
-ahb
--

commit 2b1f68f1df36a65ddbb7510a13783218c56291b7
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: interconnect: add Qualcomm MSM8998 NoC

This patch adds the YAML device tree binding schema and header definitions
for the eight Qualcomm MSM8998 Network-On-Chip interconnect providers.

> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998.=
yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998.yaml
> new file mode 100644
> index 0000000000000..0a05dc620cfd4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998.yaml
> @@ -0,0 +1,192 @@

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,msm8998-mnoc
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: CPU-NoC High-performance Bus Clock
> +            - description: MMSS NoC AXI Clock
> +
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: mnoc_bus
> +
> +        interconnect-mnoc-ahb:
> +          type: object
> +          additionalProperties: true
> +
> +          properties:
> +            compatible:
> +              const: qcom,msm8998-mnoc-ahb

[Severity: Low]
Should compatible be listed under required for the interconnect-mnoc-ahb
subschema here?

Because interconnect-mnoc-ahb sets additionalProperties: true and relies on
the top-level schema matching on compatible to validate the child node, an
interconnect-mnoc-ahb child node that omits compatible will pass validation
without its properties being checked, and will fail to bind a driver when
populated by devm_of_platform_populate() in qnoc_probe().

> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,msm8998-mnoc-ahb
> +
> +    then:
> +      description:
> +        The MMSS AHB NoC shares its register space with the MMSS NoC, so=
 it is
> +        described as a child of the latter and has no register range of =
its own.
> +
> +      properties:
> +        clocks:
> +          items:
> +            - description: MMSS AHB Clock
> +
> +        clock-names:
> +          const: bus
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
> +    else:
> +      required:
> +        - reg

[Severity: Medium]
Should the then branch for qcom,msm8998-mnoc-ahb also set reg: false under
properties?

Since reg is defined at the top level of the schema, unevaluatedProperties:
false still allows reg to be present on a qcom,msm8998-mnoc-ahb child node.

In drivers/interconnect/qcom/icc-rpm.c:qnoc_probe(), the child device only
inherits its parent's regmap when IORESOURCE_MEM is absent:

	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!res) {
		/* Try parent's regmap */
		qp->regmap =3D dev_get_regmap(dev->parent, NULL);
		if (qp->regmap)
			goto regmap_done;
		return -ENODEV;
	}

If a child node specifies reg, schema validation passes, but qnoc_probe()
attempts to claim and ioremap the memory resource instead of inheriting the
parent's regmap.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,msm8998-bimc
> +            - qcom,msm8998-gnoc
> +
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false

[Severity: Medium]
Should clocks and clock-names be required for all compatibles other than
qcom,msm8998-bimc and qcom,msm8998-gnoc (for instance, in an else branch
here instead of only under qcom,msm8998-mnoc-ahb)?

Currently, required: [clocks, clock-names] is only specified for
qcom,msm8998-mnoc-ahb. Nodes using qcom,msm8998-a1noc, qcom,msm8998-a2noc,
qcom,msm8998-cnoc, qcom,msm8998-mnoc, or qcom,msm8998-snoc without clocks or
clock-names will pass schema validation, but fail probe in
drivers/interconnect/qcom/icc-rpm.c:qnoc_probe():

	ret =3D devm_clk_bulk_get(dev, qp->num_intf_clks, qp->intf_clks);
	if (ret)
		goto err_disable_unprepare_clk;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-msm8998-ic=
c-v1-0-c2da3934b6c8@oss.qualcomm.com?part=3D1
