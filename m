Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DE4A262E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294385; cv=none; b=jgsOrYhu2vy187e1shmX18BS9R2xgzqjy93Wc3n257tHTyuCo4v99N0BGxnL4UdhlVnxvesGH2zGXo1EJ1ALrWzfAGDCL2u30KBEQqDbWlylUdqEgyDyoWcVgu1M2OevGdhRD55coiHsW1qXADWYu+lp8Sb9Iou0PQTzzc8wyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294385; c=relaxed/simple;
	bh=sRthVS6aMSu5+OFpuSJE0iF+P+o6qkCdoySwCKqJ2mY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sLinp6IQvFaY8H7ZrQHzHBGcGOQoM1OACizbQUBhuloseKtlXh4WxdbpP2ez5QNW9B0y84jIjEv+XzNPh5aNGC/lS5QUW4cFD2Eg1LrXHe7sWlqo3zZEea51nm54ydvUBye2yP1znxz+kL6SE062SJLyblxcftel7gA8unRK0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcgUvZjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcgUvZjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BF31F000E9;
	Tue,  1 Sep 2026 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294384;
	bh=BRB5urgMLJTYfoSmG3wFxm9ZNAlVK+rRPpkEdO5USDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PcgUvZjgg5Cf/a68PU135KAWxcJciZLUl3/Dq6eJ8KEhG0/0YeC8qzZACn6OeDmgX
	 Tp3/npcIokVBNqzXgcAzW3V3T4GzRCBc6hYb8Yg2wM5fQXxvvePn+2HiI7wmKcrDR4
	 XckQsnyakVFP3WCKequlR5Nh1ZHtgy9jSOGUVATS3vuKd00lJ4Fy+E737wYwD6Td+8
	 USe7mGOLF0jKUc1StvR4+i6zrQg/YoWpPSsq32CX1wkX5GEw/EbQijRGnc6J4nbS3K
	 hUiZmJ1WdbUncLioBlFPfPamge2p6tF1wN30jYZ1sNxRdVHQ+F2ANSdepiIv6L0Cvb
	 /KLW0oqcLoECQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: olteanv@gmail.com, media-ci@linuxtv.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:26:23 +0000
Message-Id: <20260901202623.91BF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema incorrectly permits CPHY `bus-type` (1) despite being=
 unsupported, and universally mandates `clock-lanes` which is invalid for C=
PHY.
- [Low] The constraint `const: 0` (and `const: 3`) on `clock-lanes` causes =
a type mismatch validation failure.
--

commit fe5fc3d14e64c01a85e54ac20b525d1bf21bb991
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs supporting C-PHY
and D-PHY modes. The commit submitted describes D-PHY modes only, leaving
C-PHY for future work.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..17de0701eb103
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

[ ... ]

> +        patternProperties:
> +          "^endpoint(@[01])?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Medium]
The commit message mentions that C-PHY is left to future work, but does
including MEDIA_BUS_TYPE_CSI2_CPHY here explicitly enable C-PHY
configuration?

> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +                description:
> +                  Data lane positions following this endpoint's clock
> +                  lane. Positions are a per-port logical numbering, not
> +                  package pad or ball positions.
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +              - clock-lanes
> +              - remote-endpoint

[Severity: Medium]
Since C-PHY does not use a clock lane, does mandating clock-lanes in this
required block inadvertently break any potential C-PHY configurations
that might use bus-type =3D <1>?

> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    clock-lanes:
> +                      const: 0

[Severity: Low]
Since clock-lanes is parsed from the device tree as a JSON array (like [0]),
will using a scalar integer const: 0 here cause a type mismatch validation
failure during dt_binding_check?

> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3

[Severity: Low]
Does this also need to be an array constraint instead of const: 3 to pass
schema validation?

> +                    data-lanes:
> +                      items:
> +                        - const: 4
> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0

[Severity: Low]
Similarly, does this fallback path need to constrain an array rather than
using const: 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-x1e-csi2-p=
hy-v16-0-dd863b929080@linaro.org?part=3D1
