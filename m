Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540710;
	b=NaK59V++D08JR8MhlPvu3CjVKJzBTMSHWcpmHaSbvbHZ3QnCSdNij3+CNQqTbd2FiKXl
	 qLbRFod6BzfirLRQMbGemeF0WGBdDbTTrTc3XFJlppVR/BcwaHdN5DZ4byi6qyMZCUYW2
	 WEMeAd8pblAYHqdd2uqYiedtqKC+V5nHUCEO/bDfERNY//Ks0ZxzPfC5WhhHJlzvyfL1z
	 zZw2aryMr2ITy43Q97FUuRcj4fuiZ+diY4vHBglj6dXzgf0uwCr4qhua+GKp2V9uViBzX
	 CRfpcodZhMTjcGpuNiE6/fPOjs6wG89j3fdP/OQNy9LIv8RhbBEIByofzF+sLP0j+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nE2LYtBbLE7lMnIvv0sMGTO4GGQtXojyrbWySdZ4rmE=;
	b=olDKNOp1vEFQJ5UqPHa4JYPLmhcAzzBVOCQiDHMH/bHZVVt5hDRtT11pQk3kOR4R5unq
	 O6Eq6/SVc/wfyBQrcd8qTXBiVWjKCrZUWXSBaAsKTswA7aTo5hUSaZ6J7EgN8KHrBEUJo
	 lwPX7B8a6sCAjA6vzh9+uswL71H247Ttcq0pZcxvorneRJFDLWccDVl5vcPET48unVYtJ
	 Q25KuxKHb9SCqch+8jJtKiKZcuXKEjZbMcgFRLoAU8HjoDM2kKlnxBnBTt2gqjWziYkzr
	 KkkZNkD/jp28nA4qck4SPNmhPhiqkBgUlWU/xwnolPbuZoNxtD1ixlFxbNCS6LdSkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXdzONQy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB301606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXdzONQy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6881F000D4;
	Tue, 24 Nov 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540710;
	bh=nE2LYtBbLE7lMnIvv0sMGTO4GGQtXojyrbWySdZ4rmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iXdzONQyWfYT/sK0WRmizaqp/oMU7uzBjmdIBln/6dpNcUFVYzAQ01p5NHWSeqe8b
	 CoIRgPY4tphF3qprQYgqQF7sOSxr8RVaWEh6KDDstmeHCF4mA5aekBstrU+LeBrNV8
	 3DQo7YOf3yqUQhitgtu68DsobV21higDEdw8VWa9t9G1O2DTCOznVHSKgFKZ+Ujc7c
	 wQz4oqWkv4ynXwnoV6rjX3K/mTBe3V9ma5rzt0koAW0FGaw+16WESZpQHOSx1dGd0y
	 k9mMmw297ayZDxKJppuMwhWa1rnWKhg2qD27iZ1wQ67SIYnXGoQhg7/+ADWWi/HSm/
	 1mEU3vh1NgGPg==
Message-ID: <sashiko-outbox-231682@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm
 Mali-C720
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:18:29 +0000
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
- [Low] dt-bindings: media: redundant bindings word in commit subject
- [Low] dt-bindings: media: non-canonical property ordering in
  arm,mali-c720.yaml
- [Low] dt-bindings: media: DTS example style violations in
  arm,mali-c720.yaml
--

commit 57de6a2d5cbf4773def077645c097e562455ec9a
Author: Anthony McGivern <Anthony.McGivern@arm.com>

dt-bindings: media: Add bindings for Arm Mali-C720

This commit adds the Device Tree binding schema for the Arm Mali-C720 Image
Signal Processor.

> dt-bindings: media: Add bindings for Arm Mali-C720

[Severity: Low]
The "dt-bindings:" prefix already indicates that this adds a binding, so
"bindings for" is redundant and the subject can be "dt-bindings: media: Add
Arm Mali-C720".

> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b=
/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> new file mode 100644
> index 0000000000000..3bd261bcefbe3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> @@ -0,0 +1,134 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: arm,mali-c720
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: ISP main interrupt
> +      - description: ISP fault interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: isp
> +      - const: fault
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clocks:
> +    items:
> +      - description: ISP main processing clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

[Severity: Low]
Could the properties in "properties:" and "required:" be ordered to follow
the canonical DT schema sequence, placing clocks and clock-names before
interrupts and interrupt-names?  The example node below already lists
clocks and clock-names before interrupts and interrupt-names, so aligning
"properties:" and "required:" with that order would also keep all three
sections consistent.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c720: isp@400000 {
> +      compatible =3D "arm,mali-c720";
> +      reg =3D <0x400000 0x200000>;
> +      clocks =3D <&clk 0>;
> +      clock-names =3D "vclk";
> +      resets =3D <&resets 0>;
> +      reset-names =3D "reset";
> +      memory-region =3D <&isp_reserved>;
> +      interrupts =3D <0>;
> +      interrupt-names =3D "isp";
> +      power-domains =3D <&power 0>;
> +
> +      ports {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        port@0 {
> +          reg =3D <0>;
> +          isp_in: endpoint {
> +            remote-endpoint =3D <&csi2_rx_out>;
> +          };
> +        };
> +      };
> +    };

[Severity: Low]
The example node causes scripts/dtc/dt-check-style --mode=3Dstrict to report
warnings: it uses 2-space indentation instead of 4-space indentation,
defines the unused labels mali_c720 and isp_in, and omits a blank line
between "reg =3D <0>;" and the endpoint child node inside port@0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D2
