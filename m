Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F8401A16
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485045; cv=none; b=OptpVUbNCUq5gY0h2O7yoLpo+Wvaxs8JO4I8jjzE6tf3wbif/WuZ4WzUOBN5MYZ+Ehczz0gde0lZaMbeu1MiJ3uy/u6ZmQ2NyuuPQBaXC471OUE/6mesX4VkGvSM0azIBKuWCXQ/Sv6caWn0h73vyuwswzpivsJCaCAioApQwEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485045; c=relaxed/simple;
	bh=RD4WPMVwSFwZnBGDFbIlgR7sZET2R/3p8aeW8y9TZ+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kYy9NuGBpio7Fby+tmi2disQL2fG7eTQqreYUNwBBA4LibvJTeuG9frxJ1EAXW8IaXBadyF3UwuqNJ9Z1N3v4uPQdHmnwx24b51bwb+TX2PukZG3uTSg/vjDd7MP3uSqt2z+/QGA+Py38UijCPnftWu6jQ2MF1lVwfaUIZah8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAcpQ9Vu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAcpQ9Vu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46EA1F000E9;
	Tue, 11 Aug 2026 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485044;
	bh=5eksp7Y/DpYLXROHUvbtFrv+bc+OzPU1QfVb8pngrSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NAcpQ9VuZLgj4HavMEFH+UPtsIBxB7AwnT2O/OqbohTfcVuIDpkCcMFJ/IMlPuzIi
	 DNZKY2Y/0MbUxy6BQpxloRPnkoIVeNt1Hnuvon0AWMyvLB1h3I+AVZGpOyPAXPro1D
	 g1siZDCZ1ZoYfurPFLEm+qAkljHI0XQb3De38cT8nTv5xBjs/jvIJxMzKDJJ6o/lQp
	 1+YlGQ1YxnjgoVm+9Qq29IpMbxZRAgo8jhl3LRtw4gqDFcJdcqaQRjqsB6GcibZqgQ
	 ZWXN2P5Ps4ZM3aYi8FsveiXL5UJ6qqOsiuzldW1+NjkU6hKEZ0emwbgSdqIooqgljx
	 RsNJucrZS/efQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260811213610.2956147-2-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-2-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:50:43 +0000
Message-Id: <20260811215043.E46EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `oneOf` block allows the new `qcom,sm8350-eud` compatible st=
ring to bypass its dual-path requirements by incorrectly matching the legac=
y single-path `ports` representation.
--

--- Patch [1]: [PATCH v6 1/9] dt-bindings: soc: qcom: eud: Add per-path chi=
ld nodes for UTMI routing ---
commit de56d6ae0c4dbc79f8a9aa462280cdd2113649b0
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two High-Speed
UTMI paths depending on the SoC. This commit models each UTMI path as a
separate child node with its own OF graph, adding an SM8350 compatible
while retaining the legacy ports representation for backward compatibility.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/D=
ocumentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8d..0e35bc9a9d20d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml

[ ... ]

> @@ -45,10 +46,87 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

[ ... ]

>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +    properties:
> +      eud-path@0: false
> +      eud-path@1: false

[Severity: Medium]
Does this first branch of the oneOf block allow the new qcom,sm8350-eud
compatible string to bypass its dual-path requirements?

Because this branch only checks for the presence of the legacy 'ports'
property and the absence of 'eud-path@X', it doesn't restrict the legacy
representation strictly to the legacy qcom,sc7280-eud compatible string.

If a device tree is written for the new SM8350 hardware variant using
the deprecated, single-path 'ports' layout instead of the required
eud-path nodes, it appears it would erroneously pass schema validation by
matching this first branch, entirely avoiding the compatible-based
constraints in the second branch.

> +  - allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: qcom,sc7280-eud
> +        then:
> +          required:
> +            - eud-path@0

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D1
