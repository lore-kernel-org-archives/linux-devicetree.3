Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2F82E414
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997492; cv=none; b=ax+2Zxvx+llzDRVNM0f08TRHfJ9tzqFVRI7ng7WgsT4YHz5Uu/JjW+r15FgA46irXo1ZUY0Gvf9MqUDZmAsU3UEu22ZG/+9G0qbmgIAjO372AsEIi0FsFrHw5G0EtD6ok4BpBfdKjt1Gs1LrxoUQ8QhTsbeO3d5yaWLQtAGGy4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997492; c=relaxed/simple;
	bh=m2Tu+ZnV+QWOGvmCCJcM0lSYtq6skreFJ4rOh9tREpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XvEL8j2RGvJvCZYLHwkMepr6pnt3jhWfnDA9QXma3z3vMg9Ljk4u3ZhcEYtfAatiL6OKytTlsM4d8jT+1BjAIk5x30L2uoz1DXZHAyYZYjpuGJn4dkgt5x2XUgjNfqGoa51ZrBl/4asPB06gAc+7sLrdY8aYjV6U3+HwoBKjVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJ0pIhqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ0pIhqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFECEC2BCB3;
	Sun, 17 May 2026 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997492;
	bh=m2Tu+ZnV+QWOGvmCCJcM0lSYtq6skreFJ4rOh9tREpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VJ0pIhqZdVl7XGmhnbWNReKmW1r8/h3qzVLqpljF1PSYRpy9n8vjmkrEjU+7gTatN
	 30moPWNx2CyR9UfZE44fnNVnYoz6DbtVkI//bH2P3rr9A9NHSVCnPocYV0Jhq/U7rj
	 GvoLPg3GU+l0owkC+KprVHttvgn92qPmUaAVsKEOCxQ4SQIc+uRIQqox5urYwiSI5z
	 6J/uKWvArrsm+fqu46/zRLADkd6MfsLayQ83CL5DHZZmRH86Jy8NizJn63pCAyEY+j
	 TTMiGbQPM3lZw1bQcbMX3yGQPHwU6Hf1ftmvgwE7OPp+RzdkRYibVE4GBgYFN+Peqq
	 1ghYrZ+abS1Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 01/10] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-1-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-1-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:11 +0000
Message-Id: <20260517055811.EFECEC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unconditionally requiring `#address-cells` and `#size-cells` for=
 `ethernet@3` and `ethernet@4` breaks backward compatibility and causes `dt=
c` warnings.
- [Low] The `reg` property in the `airoha,eth-port` node incorrectly uses `=
maxItems: 5` instead of `maximum: 5`.
--

commit f8c9c25c14697c9de91b47f1ea5850c1b33f44a9
Author: Lorenzo Bianconi <lorenzo@kernel.org>

dt-bindings: net: airoha: Add EN7581 ethernet-ports properties

The EN7581 and AN7583 SoCs support connecting multiple external SerDes to G=
DM3
or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner. Th=
is
commit introduces the ethernet-port property in order to model a given
net_device connected via the external arbiter.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index fbe2ddcdd909c..7144d6da7394b 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -130,6 +130,46 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
> =20
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              contains:
> +                items:
> +                  - enum:
> +                      - 3
> +                      - 4
> +        then:
> +          properties:
> +            '#address-cells':
> +              const: 1
> +
> +            '#size-cells':
> +              const: 0
> +
> +          patternProperties:
> +            "^ethernet@[0-5]$":
> +              type: object
> +              unevaluatedProperties: false
> +              $ref: ethernet-controller.yaml#
> +              description: External ethernet port ID available on the GD=
M port
> +
> +              properties:
> +                compatible:
> +                  const: airoha,eth-port
> +
> +                reg:
> +                  maxItems: 5

Could this maxItems constraint allow the reg array to contain up to 5 eleme=
nts
(e.g., reg =3D <0 1 2 3 4>)? Since the parent node enforces #address-cells =
=3D <1>
and #size-cells =3D <0>, shouldn't this use maximum: 5 instead to restrict =
the
numeric value of a single port ID?

> +                  description: External ethernet port identifier
> +
> +              required:
> +                - reg
> +                - compatible
> +
> +          required:
> +            - "#address-cells"
> +            - "#size-cells"

Will unconditionally requiring #address-cells and #size-cells for ethernet@3
and ethernet@4 break configurations that don't use the external arbiter?

If a board connects the GDM3 or GDM4 port directly to a PHY without child n=
odes,
it seems these properties would fail schema validation.

Also, if added merely to satisfy dtbs_check, wouldn't dtc emit an
avoid_unnecessary_addr_size warning when the node has no children?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D1
