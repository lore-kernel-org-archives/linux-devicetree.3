Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F8339386
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107901; cv=none; b=uFUOBD/0uNNIrw6o/L1dFwGS44WlAhxkVTSm4XR4YU1pBreWALVe2tJAeh83eSarPr+ZEnsGbk4uhKILeQA65ACa4WzCjQ1QSHWIVV8W9l+/+38AKH8SQxKCUqIlpPqap3k9wmj3t8PUNsrWJUayi92dBpssFNae+gTh6OLONzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107901; c=relaxed/simple;
	bh=CFyTIRX+3567SMUophZmXplhDF0vCCS91Ti0FSmAgcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5bi7WwpfwGnAq33a+XA1N0BCFEe9lbhsyy9ph1cMNnZDF/a/5UK49hBIznscJs3MjSXz16J8lJWrtL/4SiHCjtkskoNSRshv8hjLQo9eC/6/ZlammkKRRumKiWmujDAd0P2Iu31snlbgB+DvvxyjLYTgneq2PtAWrpGrLuaAqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0fpRhmm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0fpRhmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5831F00A3D;
	Fri,  7 Aug 2026 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107893;
	bh=oRMABtpSEJvmmtG5qSEELGHbsgshnN0lIPfcTg8UM8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0fpRhmmjGkFtaHqZTdB75Xz8R4TOO4/99mpP9Wh7Cr9mI2IAgwifoqQwjUNp0bel
	 GHKKfOADCN71yJPOczwT8WuJLCKp8XrtLZBwpJx3nXPbsr3eD5p8SD/Korw+1/rWlM
	 gfPvtg2kZ1TBLIBc2/w1dpPn0tZRHM31A+vWo02RVoN/whdZp08nUC5dibxNhmASJX
	 pvFrXdZhIxYgApS/JSnbd+/J7Ai9fy7AvINshsjUfY0sSgX4dZGF3Ss067VhXem/Vw
	 TjsvQkXtYDvkHYVcJVD1pe4j3hesGqgVr2bJQRFTNSqtlenuxgBIGikBwbbGhO+yiT
	 XPs5fF9mt0k5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx708 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-imx708-v2-1-7d3d7b57779d@ideasonboard.com>
References: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
 <20260807-imx708-v2-1-7d3d7b57779d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:04:52 +0000
Message-Id: <20260807130452.BC5831F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Swapped descriptions and voltages for VDIG and VDDL supplies risk =
hardware damage.
- [Medium] Missing Common Schema Reference blocks standard video interface =
properties.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx708 image sen=
sor ---
commit 2d548d9db5698aed5ad6188c54ce0ae5aa972fd7
Author: Jai Luthra <jai.luthra@ideasonboard.com>

dt-bindings: media: i2c: Add imx708 image sensor

Adds device tree bindings for the Sony IMX708 image sensor. It defines the
required properties, regulators, port structure, and includes an example
configuration.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> new file mode 100644
> index 0000000000000..e41b3ca537063
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
[ ... ]
> +properties:
> +  compatible:
> +    const: sony,imx708
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.1 volts

[Severity: High]
Are the voltages and descriptions for vdig-supply and vddl-supply swapped
here? Standard Sony CMOS sensors typically use 1.8V for I/O (vdig) and
1.1V/1.2V for the core (vddl). Supplying 1.8V to a 1.1V digital core might
cause permanent hardware damage if integrators follow this description.

> +
> +  vana1-supply:
> +    description:
> +      Analog1 voltage supply, 2.8 volts
> +
> +  vana2-supply:
> +    description:
> +      Analog2 voltage supply, 1.8 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdig-supply
> +  - vana1-supply
> +  - vana2-supply
> +  - vddl-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Will this strict rejection of additional properties prevent device trees fr=
om
specifying standard physical attributes like orientation and rotation?

Typically, an allOf block including a reference to
/schemas/media/video-interface-devices.yaml# is added near the properties
block to inherit these common hardware properties, and unevaluatedProperties
is used instead of additionalProperties. Without the common reference, valid
hardware descriptions may fail validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-imx708-v2-=
0-7d3d7b57779d@ideasonboard.com?part=3D1
