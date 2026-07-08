Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0DB3EFD02
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495944; cv=none; b=uScMltRhb4/uyMIAbAuHbYRRkEUVE/D6J9ENItOz4F5UySDw3K+OKIH2mWbyEsmsoQNpXnhy0+PgvyJ7E2/Qh915Db5yCiS8Pw76Xmo924DO6qe9u4qF+wTlT1cZPKblwLVfkQOmL2y5y9vAthGgm1GO1uSYVH8DTX/2fh68RYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495944; c=relaxed/simple;
	bh=02vlmr9IDbm+tfq2tfRg5j4kU89eZ/++9MU4DFMtgJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CH27+PYnGiJLUeY0Yqo6gYKrLCtFpxtSiYMgVGi4B8VK8SQ3dVILJtJCvCKi2owFvKysXZpZuJrdBIePqR70V0bizhOZ3qnmWfsyGwqmuBGFf02hUyQtTvLFJCXQWzDdLi1WsIA8rVFOr0ZjSXjHDf6St/TzwJwEXW1LXDT6GCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dkj+4CKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dkj+4CKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8151F000E9;
	Wed,  8 Jul 2026 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495926;
	bh=hEazPiUp91CQLQuj8cgfPmyQmuLgNJTwgOEgAilU3yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dkj+4CKRhAXt/ZXyTd57kaz0mB6K0P1ezXulzgef3sR7e5/WzHlNKaPxcN7Uk5xuc
	 zggFTTTt5jKm6s63mhfc2lM/gK0tow1et/T+MqTqyGmPSwc/bK4mAhdY7ShrPkUNGR
	 20op78J5IWUzcf7XDEo5/KcgMxPvi5uvL3cmvpDtfO2+UUy0XD1BthcmQpK17gALYN
	 KP1ddIkXzgVWpL8cHVCI1PKN9tNktQR2/9nJ6OEdOOVDhAzQv8DaEinxERUf8jFI+2
	 rQ4VRPE+sWiKQb45I/oR2dqEPVV8lJ2iD5SJwgk/drNTsm7pa2/pcpYV1G084uapuR
	 sPiMxo1GDfA9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: versal-clk: Fix mio_clk
 index range in clock-names pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <f0ef921cf0a5762c0530d0f5c4fe252ab35854f4.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
 <f0ef921cf0a5762c0530d0f5c4fe252ab35854f4.1783495122.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:32:05 +0000
Message-Id: <20260708073206.5B8151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `xlnx,versal-net-clk` compatible string matches multiple contr=
adictory `if` blocks, making valid device tree nodes mathematically impossi=
ble to validate.
--

--- Patch [2]: [PATCH v4 2/5] dt-bindings: clock: versal-clk: Fix mio_clk i=
ndex range in clock-names pattern ---
commit bbeb0fbfb689e023d79c16fd79850f4f854a36ee
Author: Michal Simek <michal.simek@amd.com>

    dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names =
pattern
   =20
    The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
    the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
    but a regex character class cannot express a multi-digit decimal range.
    Replace the bogus character class with an explicit alternation that
    enumerates the two-digit decimal values 00..77.
   =20
    Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynq=
mp-clk.txt to yaml")
    Signed-off-by: Michal Simek <michal.simek@amd.com>
    Acked-by: Conor Dooley <conor.dooley@microchip.com>

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index bef109d163a82..b1623c2ab0f69 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -116,7 +116,7 @@ allOf:
>              - const: pss_alt_ref_clk
>              - const: aux_ref_clk
>              - const: gt_crx_ref_clk
> -            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
>              - pattern: "gem[0-3]+_emio_clk.*$"
>              - pattern: "swdt[0-1]+_ext_clk.*$"

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under revi=
ew,
but does the current allOf schema make it impossible to validate
xlnx,versal-net-clk nodes?

Since xlnx,versal-net-clk uses xlnx,versal-clk as a fallback string, this
first conditional in Documentation/devicetree/bindings/clock/xlnx,versal-cl=
k.yaml
will match:

  allOf:
    - if:
        properties:
          compatible:
            contains:
              enum:
                - xlnx,versal-clk
      then:
        properties:
          clocks:
            items:
              - description: reference clock
              - description: alternate reference clock for programmable log=
ic

This restricts the node to exactly 2 clocks. However, because both conditio=
ns
are processed, the following conditional for xlnx,versal-net-clk also match=
es:

    - if:
        properties:
          compatible:
            contains:
              enum:
                - xlnx,versal-net-clk
      then:
        properties:
          clocks:
            items:
              - description: reference clock
              - description: alternate reference clock for programmable log=
ic
              - description: alternate reference clock

This applies a 3-item length constraint. Could this cause the schema to
unconditionally reject valid xlnx,versal-net-clk nodes since it forces the
node to have exactly 2 and exactly 3 clocks simultaneously?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783495122.gi=
t.michal.simek@amd.com?part=3D2
