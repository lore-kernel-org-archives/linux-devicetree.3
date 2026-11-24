Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542717;
	b=VJl58Qgp+2vNzEwLdVOpeE2LTpAxb2UjtcfvuhWn8yNbK9ajoCjDOwm0K39W42CzcdJ9
	 4l0Xhi2Du493YtqvNh4csbovW7kUQlXsJwIvRyuwVjKSoOwbgVZjmcpUztBhAeya5UjXS
	 LfEtVRZB/JBljiQqbpp9b6cHMPyqqc//ScynN5+cXfSSq62/gjMIn6ybJD9JDUXVlYRTY
	 5aiDGR8T/2tXgV/XAtVkjmIacP+fxrs1OBGxEUpF56PaLtvi8cLvEeppk4hTvcHqMLrob
	 6uu11wD907IU6wx8n3qPZkwu1kh8NDta4Vu2CsQHEdSwJa8bmLtazzxq6V/ZIPwVhug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542717;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yl1eC915iZtGJsVn8hJNc3AUFjS3lPKQrn9XPwqIlyg=;
	b=z8DE9O4QqzRxaH49cg2juIM3E7u3SpHSbf9a2wZ/774r1ySiFICskTz7CT4HIAu/aBEF
	 c4b0uO+wJHACKGmefdm8XSm4Jhm91+osBgIgHxxON/cAvd9N28PHZG32MOqqzlyuus7iv
	 B7bS17mUNrdoquvI4RtdJSiSB40yaG4RYr2LthAuaBqoUbqtHpSZCNJlsfQhOs0UYBQlJ
	 j9Lx3zfscpNH4fv0mrfsV2XMQD5FiR0ET67EWBAU8N2qT3D6TqwAQdA3lRfGE8eVKHj4w
	 19Hj5DE4k4ElP0FS5HiR5WT9f5pfRCs9+zBD2rO+qcr09Y8E9MRpFB0y3sZoy4VVjjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZaCJ+hqr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA6606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZaCJ+hqr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41091F000C6;
	Tue, 24 Nov 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542716;
	bh=Yl1eC915iZtGJsVn8hJNc3AUFjS3lPKQrn9XPwqIlyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZaCJ+hqrFkB5C3BPqHsQy/SJB7U2dolJ51Q5D5AnxO/4qKSr0kKbUhV0FkbpYPK+9
	 JYgE7kFgipCHv8IB51+nyGpk1hBiC8GGfjsC8e+xW5NyufESaF5xtlXMfjBKxH2kpN
	 JhrsGFnF3FVrD5GYb7J/SRmv1AyKekz4lXut4+usfJRAmqnlVzgKe3raJhZDZraBcf
	 A+oPfbbPd4Gb5N9bwQvshXf8cWUb0AxsVo9hncXhjf8XWQE1k9FDTfKlMbE42Af7XF
	 JNm8PvWLQcfGdehf10mIOumhUi/L2QGwZCEtXdb+Xv50k1UkyvYUxi6tO/3yMsewvs
	 jfRhT54Wgr7tA==
Message-ID: <sashiko-outbox-231751@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: misc: Add FPC1540 fingerprint sensor
 driven by a QSEE app
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-fpc1540-tee-v1-3-6c6985f05b06@proton.me>
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-3-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:51:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: misc: fpc1540-tee duplicates interrupt pin as
  irq-gpios
- [Medium] dt-bindings: misc: fpc1540-tee strips .mdt suffix and embeds
  QSEE resources
- [Low] dt-bindings: misc: fpc1540-tee uses non-canonical property
  ordering
--

commit 9d798d8abb4687cb95d763a981df15f03d125a1a
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

dt-bindings: misc: Add FPC1540 fingerprint sensor driven by a QSEE app

This commit adds a Device Tree binding schema for the FPC1540 fingerprint
sensor when driven by a Qualcomm QSEE trusted application.

> diff --git a/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml =
b/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml
> new file mode 100644
> index 0000000000000..0c2ec847c2d75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml
> @@ -0,0 +1,74 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: fpc,fpc1540-tee
> +
> +  firmware-name:
> +    minItems: 1
> +    items:
> +      - description: Path of the trusted application, without the .mdt s=
uffix.
> +      - description:
> +          Path of the QSEE common library the trusted application needs,
> +          without the .mdt suffix.

[Severity: Medium]
Should firmware-name specify the complete filename including the .mdt (or
.mbn) extension rather than stripping the suffix?  Qualcomm bindings and
drivers/soc/qcom/mdt_loader.c expect the full relative filename in
firmware-name so that standard MDT loader helpers work directly and both
split (.mdt + .bXX) and single-file (.mbn) images are supported.

Also, the QSEE common library (cmnlib64) and the QSEE image-loading
memory-region below are system-wide QSEE/TEE environment resources rather
than hardware properties of the FPC1540 sensor node.

> +
> +  vdd-supply: true
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  irq-gpios:
> +    maxItems: 1
> +    description:
> +      The interrupt line read as a GPIO, so that edges where the line is
> +      already low again are not reported as a finger.

[Severity: Medium]
Should the binding describe the sensor's single physical interrupt wire
only once rather than duplicating the same pin in both interrupts and
irq-gpios?  As shown in the example where both interrupts-extended and
irq-gpios reference <&tlmm 23>, irq-gpios encodes a Linux driver
edge-filtering workaround into the DT binding ABI rather than a distinct
hardware connection.

> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Region used to pass the trusted application image to QSEE. The who=
le
> +      region is shared with QSEE because QSEE reads past the end of the =
image
> +      while it starts the application.
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - vdd-supply
> +  - reset-gpios
> +  - interrupts
> +  - memory-region

[Severity: Low]
In properties:, required: and examples:, interrupts (and
interrupts-extended in the example) should be listed immediately after
compatible to follow the canonical DT schema property ordering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-fpc1540-te=
e-v1-0-6c6985f05b06@proton.me?part=3D3
