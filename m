Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE18253B58
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366407; cv=none; b=hFthYtbTEf2VEEVa6fz8MtDxK3F6iVHq1JmU88CwysbcbeZUvBzNDvoxsOHxjYkRSpcueKmojm8xIel92vqNDyoBgQSBJQa0ioAzZexZcrsBJ90P0b7CsqdBmHf5nRQUZM0ai1pi2gYNBzelbB6o2fnMOGeDuwVIVBcuwZIfMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366407; c=relaxed/simple;
	bh=XGcJFG4NNMjRr672lqvNFdRK3bTHQAE0+PBXEom8bdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iELyQnpVMRmwWto6WU33CKHsmEYKeeo5az2mg83Xiss7uvLxqfZQKHptwy9/w9vAIqc9TpBKztplEkt+xfWM7ygjpCjCaPGz3BOdHHiQe9AkPjWPfwvnoGjpmzC7DWMGTfNJ05m2S+adJplfH++EuTVX9ZJ0WRKHaFMIFz/a4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfhaboA9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfhaboA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF9B1F000E9;
	Thu, 21 May 2026 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779366406;
	bh=OvDFq5XEEgMTnKGhPgesSQVIRyh9hqz8jmzhcbLDZqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BfhaboA9O5hT66o8hn3f4B3T/UvTFzCMsJMkFWz5u2RZkOft9wc72aqxLq+GoK4B9
	 gCY2+nypfPJUto+co8QP8eHQG0sa7wkmoKftIi6WIfYrYj4xOmq2MXXhHJSeTyqSYI
	 d+gXWwlvv7t9NdElVkxrID+Fe2ZGB21nY514poQgPMqYW/hEWK7baqU9SRgt+7bzzT
	 LNDmFfe7K3PRZqGxcS76Tg8DhktLEg5weNX8OHEGXK86OcIZiUOx6wIIaVYHt5tnbU
	 FlC+u+DmGGYjfW6aJDtjNbaGx2+KnTkzwxxDUdyMMTkpR5/4yFXqzEL0THwqhymQsZ
	 hU+6d1Y3V13NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
References: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 12:26:44 +0000
Message-Id: <20260521122645.3EF9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema unconditionally requires `clock-lanes` for `port@0`, =
which incorrectly breaks C-PHY configurations.
- [Low] The example device tree node is missing required `data-lanes` and `=
clock-lanes` properties in the `port@0` endpoint.
--

commit bec75335fd5214a065f090cefeb28f9c895cfd3c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

This commit adds a new base devicetree schema for Qualcomm MIPI CSI2 PHY=20
devices, initially for the x1e80100. It supports CPHY, DPHY, and DPHY split
modes across three ports, allowing per-PHY voltage rails to be individually=
=20
defined and required.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..c9116246c1e9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
[ ... ]
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Sensor input. Always present.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +              clock-lanes:
> +                maxItems: 1
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - clock-lanes

[Severity: Medium]
The commit description mentions the PHY supports both C-PHY and D-PHY modes.
Since C-PHY embeds the clock signal within the 3-phase data lanes, there is=
n't
a separate physical clock lane. Does requiring clock-lanes unconditionally
here break configurations that need to use C-PHY mode?

> +              - remote-endpoint
[ ... ]
> +examples:
> +  - |
[ ... ]
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                csiphy0_in_ep: endpoint {
> +                    remote-endpoint =3D <&sensor_out>;

[Severity: Low]
The schema definition above explicitly requires data-lanes and clock-lanes =
to
be present in the port@0 endpoint. Will omitting them from this example cau=
se
a validation failure when running dt_binding_check?

> +                };
> +            };
> +
> +            port@2 {
> +                reg =3D <2>;
> +                csiphy0_out_ep: endpoint {
> +                    remote-endpoint =3D <&controller_in>;
> +                };
> +            };
> +        };
> +    };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-x1e-csi2-p=
hy-v6-0-9d73d9bd7d20@linaro.org?part=3D1
