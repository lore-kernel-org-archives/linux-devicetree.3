Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8873769E6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461620; cv=none; b=av8KzE5bKZosgGDmsWnIGCPkrSpkiIXtsrBpoL/BPYxI+sIItmfUlHNwigj2gmi6HVb+C0BTLyGP6pplX3Ev8ML92o2XKHFDauQjc++oRlMDaaR+WQdE5LZOmvfSARv6q8Rv/RNTmw8S0rC55r2pNbzCiFBcHptGZExhDpz3Qqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461620; c=relaxed/simple;
	bh=CHc3i9SUwRPp0/bvQrzBm0dsa9aU48RoLpngVXj+Wt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mGr9jpAkKZAVp/ysuZl7sIdqlXd+BupBCUJL7vsP5WPnfkhQqMgqKO4Zv/lfZGpfFddW5rtptfHkokCdETftwMPayPNgV99HhXYNTOQLYIQ2foVruho9oR8drdGAwm2noj3xNe1ht9cHHsBe1mnCz3LNsb5I232C1nkZQgLjYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIRd+kIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIRd+kIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CA51F000E9;
	Fri, 22 May 2026 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779461619;
	bh=p7s5Y6Jzd5h+6Ly2nPdUJ8IPtzcpsxx+kkOafaBg5FM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mIRd+kIl5GykaEJQuGhrCggIU6x2Fbhw50aXbRTyGoREgvWohI3w7OPCQoB82DQe6
	 h/HTifWjHFUaeAYHjBOea5uqMuJcZ6PK/rGgZ52iJrvFiJfG/vY0RdKxNiVvI8cC1J
	 AwhuqP+BEea6ptSFUAbLWhBsgvkDfzSBJVE/BztVdFXR+lic+MpqGEYFg/dy/a4Zt5
	 cw5sOFzVOdrs4j+R+gWRwMmt4KkNVY6HPeWkOezaygeVGmti0Fk3GNOLOtJlFvF+HE
	 NXtDsRNX7gzEqoQdcJygrI2eq234Jri24i4pJhY1Nu3Wacryjt35q09vxh0QziTTNS
	 0VbczQ0j+OfBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
References: <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 14:53:38 +0000
Message-Id: <20260522145338.A0CA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example fails schema validation because `port@2`'s =
endpoint includes `data-lanes` and `clock-lanes` which are forbidden by the=
 schema.
--

commit f15340b905d3f2f95e02027798a2eb5d4ed06bf5
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

This commit adds a new base schema for the x1e80100 MIPI CSI2 PHY devices.
It supports CPHY, DPHY, and DPHY split-mode by modeling the CSIPHY devices
as individual nodes with three distinct ports.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..f434fb04447f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
[ ... ]
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Output to CAMSS controller.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              remote-endpoint: true
> +            required:
> +              - remote-endpoint
[ ... ]
> +examples:
> +  - |
[ ... ]
> +            port@2 {
> +                reg =3D <2>;
> +                csiphy0_out_ep: endpoint {
> +                    data-lanes =3D <3>;
> +                    clock-lanes =3D <4>;

[Severity: Low]
Will this example fail dt_binding_check schema validation?

The schema definition above for port@2's endpoint points to endpoint-base a=
nd
sets unevaluatedProperties to false, without locally defining data-lanes or
clock-lanes.

However, the example uses them here. Does the port@2 definition need a
reference to video-interfaces.yaml like the other ports, or should these
properties be removed from the example?

> +                    remote-endpoint =3D <&controller_in>;
> +                };
> +            };
> +        };
> +    };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-x1e-csi2-p=
hy-v7-0-79cb1280fad6@linaro.org?part=3D1
