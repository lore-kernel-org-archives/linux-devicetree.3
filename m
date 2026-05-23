Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3615FA81
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779505461; cv=none; b=AZCaHijw6J3y1tAPbHb+I9h0o0hXul3N2cIAdHENiig0Fs7J1mJhLPP9t4FGQwPMe/AyVXfMUlhkRKcAF0mFxF0DlEFp1mxGevAOthusv7MeCtnZ6VQ6A0/gSiMFpxDC9Hk/3bSKkPShiq7aWy6eAP3MHW9Ksvs6l183oa6dCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779505461; c=relaxed/simple;
	bh=UZ9Sho23IB5lsIOV3DjPSRmMJsnfLhOWGMZftpw7LJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GuvsGcw2+Y4btQ9uS6Gz9QdhPdp2f22DBx39wdk8TwewU3LtwGMdLhNJ02QfngueOcKdgobVe7pk+dqI7bPY4RaMNG+EBzkaD2G7U4pZVWseVarxOncnwYKdGdMHCCQkPM14ixVX6m5d1g6ydjnCZ++BGTvuXLOBMgDPdfMp6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knCPb0fl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knCPb0fl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045501F000E9;
	Sat, 23 May 2026 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779505460;
	bh=lmb0iPWGSl1bPR+JLCoZtXDuzrmuo797U9xk8/9iWpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=knCPb0flil/IUM4F27+10ueB5gU0GPK02RqTs0+CVroX4wDPRMQwY1oCHMWp6Mop6
	 L4iNgeCGjdIACAYmxX3/Dj8DmyeBWBwvY/+2m+GPhssEmj53zUnclMifYbKiEAq550
	 DQkf+dDMrTGTj+IuD2QxfZ1pJ0xrBDiMnRkFbA1t54r4bI/X+wGZE9FmzshmBupZwa
	 3UCT49A6rjXkAYgZfyQzQjUwBiILkEaY67qiE11Ey2uSSyPbdUzKJQm2aftGjKZksP
	 hg3vDPngfSbTGwDgqb74hWGTeHckvXmlLv91DHgnU95vlXV6ADlf9FE+ebBwV9kXxW
	 m0AH1Kd5EteBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
References: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 03:04:19 +0000
Message-Id: <20260523030420.045501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Using the literal `endpoint:` property name inside ports bypasse=
s constraint validation for endpoints with unit addresses.
- [Medium] The `data-lanes` property on `port@1` is overly restricted to `m=
axItems: 1`, which will break multi-lane DPHY split-mode configurations.
- [Low] The example uses a non-generic device tree node name `csiphy@...` i=
nstead of the standard `phy@...`.
- [Low] Mismatch between the `vdda-0p9-supply` property name and the actual=
 0.8V hardware supply used on the x1e80100 platform.
--

commit 10936c65e44aeea784cc13676d51700996cf6559
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..270375f949880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
[ ... ]
> +  power-domain-names:
> +    items:
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.

[Severity: Low]
Does this property name mismatch the actual hardware supply voltage for the
x1e80100 platform?

The example later in this schema uses <&vreg_l2c_0p8>, which indicates an
0.8V rail. Should this be updated to reflect the 0.8V voltage?

> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Sensor input. Always present.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:

[Severity: Medium]
Will using the literal endpoint: key bypass constraint validation if an
endpoint with a unit address (e.g., endpoint@0) is used?

Because the port references port-base, such an endpoint will pass the
unevaluatedProperties: false check, but its specific constraints wouldn't
be validated. Could this use patternProperties: "^endpoint(@[0-9a-f]+)?$":
instead?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
[ ... ]
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Second sensor input. When present, indicates DPHY split mode.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:

[Severity: Medium]
As with port@0, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$=
":
to ensure endpoints with unit addresses are properly validated?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                maxItems: 1

[Severity: Medium]
Is maxItems: 1 too restrictive for multi-lane DPHY split-mode configuration=
s?

Split-mode typically divides a 4-lane PHY into two independent 2-lane
interfaces (e.g., data-lanes =3D <2 3>). This configuration would fail
dt_binding_check validation with a single item limit.

> +              clock-lanes:
> +                maxItems: 1
[ ... ]
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Output to CAMSS controller.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:

[Severity: Medium]
As above, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$":?

> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    csiphy4: csiphy@ace4000 {

[Severity: Low]
Does this node name violate the standard naming convention for PHY provider=
s?

The core phy-provider.yaml schema expects node names to match the generic
pattern ^phy(@.*)?$. The current name csiphy@ace4000 will likely trigger a
dt_binding_check warning.

> +        compatible =3D "qcom,x1e80100-csi2-phy";
> +        reg =3D <0x0ace4000 0x2000>;
> +        #phy-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-x1e-csi2-p=
hy-v8-0-a85668459521@linaro.org?part=3D1
