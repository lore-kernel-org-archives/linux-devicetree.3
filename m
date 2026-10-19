Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82EA4CF490
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792377267; cv=none; b=HtC60KRdfq2msu6vj7xrWcu07GCKBMYTR//Q/pz3IH01Wy1VQYaFAkc6XV906EDFVBz/BPhfa5eBmPCGsBydG87Bi3zMfdMlTYokJdUyygOlRwcs39cLwoIPTcZZJ1SaCA3LfDXpEpMGwNKmu/4PDJ6QO6tpgx70L82mOMhoCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792377267; c=relaxed/simple;
	bh=JwUz/ETbvH9Kqx/K1iuAE5xR+FGjpU8Mc2BtaODRl5I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XX13qGXqawlwhDtxegz5GJNFJphUp0JKbWPLirFxP/JEpdPpL+vlnqnfsyZ7gE+s2kgBogiP65uzQFfO2S4TMp/t8H0ZyzOc7Va5WfbYhA8ECXCnLJFLrwrQd/opgfDfWvpemnD1vVLmxQQTb1juhBII8TsNb+uqlumj9w0MhEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTGis4uK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTGis4uK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B1A1F000C4;
	Mon, 19 Oct 2026 02:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792377266;
	bh=nM5NMXggAKiTDE/zKYo+sry6oC0ovO5reULAlnEX0iQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTGis4uK7FONBEZJfvRS94T2JBnHQ4gA9zd1bXI8T+z6dYECsJURf8GZWBmRO6upV
	 LPZuU7BHQv6Q29912VD3/mt0AyXTcPMkPRnumW3lAcbjgruDBU/tfDa3M9oBCghH/Z
	 Lr5he9Dh39++RXm1Nhozv57o3YbGAgEsP5HZGTDUilyYamAivNaFiwb3Yx+r9dpszZ
	 6y6mBG5YqgoMmhGiYlN7h869hutMglVemwA8MN6cGTFmf7tFO9KWp7mJ34m2yTpQuA
	 NWHZgTSsQ52kdMXcN3gDjAn0Of2F0+1oDxy4tZQz1X6YumuDvMgVYiuDlUAjdhLz45
	 2nDSqj3AamUcA==
Message-ID: <sashiko-outbox-176538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: cacioandpepe <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261019022717.511096-1-artem122novak@gmail.com>
References: <20261019022717.511096-1-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:34:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: timer: renesas,tmu: missing sh7305 in resets condit=
ional
- [Low] dt-bindings: timer: renesas,tmu: inconsistent sh7305 compatible nam=
ing
--

commit 5a47059b449e5e852ab342ee0c095fa0177a28ca
Author: Artem Novak <artem122novak@gmail.com>

dt-bindings: timer: renesas,tmu: add SH7305 compatible

This commit adds a compatible string for the Renesas SH7305 three-channel
Timer Unit (TMU) to the Renesas TMU Device Tree binding.

> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/D=
ocumentation/devicetree/bindings/timer/renesas,tmu.yaml
> index b1229595acfbf..8ecc57cc3d917 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -21,6 +21,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,sh7305-tmu  # SH7305
>            - renesas,tmu-r8a73a4  # R-Mobile APE6
>            - renesas,tmu-r8a7740  # R-Mobile A1
>            - renesas,tmu-r8a7742  # RZ/G1H

[Severity: Medium]
Does SH7305 also need to be added to the conditional exclusion list for
resets (and potentially power-domains) later in
Documentation/devicetree/bindings/timer/renesas,tmu.yaml?

In this binding, power-domains is listed unconditionally under required, and
resets is required for all compatibles not explicitly exempted in the
if/then block:

  required:
    - compatible
    - reg
    - interrupts
    - interrupt-names
    - clocks
    - clock-names
    - power-domains

  if:
    not:
      properties:
        compatible:
          contains:
            enum:
              - renesas,tmu-r8a73a4
              - renesas,tmu-r8a7740
              - renesas,tmu-r8a7778
              - renesas,tmu-r8a7779
  then:
    required:
      - resets

That enum exempts older R-Mobile and R-Car Gen1 SoCs whose clock controllers
lack per-module reset control for the TMU. Since SH7305 is an older SuperH
(SH-4A / SH4AL-DSP) SoC without a per-module reset controller for the TMU,
won't omitting the SH7305 compatible from this exclusion list cause
dt_binding_check / dtbs_check validation to fail on SH7305 TMU nodes that do
not specify resets?

[Severity: Low]
Should this compatible string be named renesas,tmu-sh7305 and sorted
alphabetically after renesas,tmu-r8a779h0 instead of renesas,sh7305-tmu?

Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml states in its
description:

  When adding new compatibles to existing bindings, use the format in the
  existing binding, even if it contradicts the above.

Every existing SoC-specific entry in
Documentation/devicetree/bindings/timer/renesas,tmu.yaml uses the
renesas,tmu-<soc> format (from renesas,tmu-r8a73a4 through
renesas,tmu-r8a779h0).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019022717.5110=
96-1-artem122novak@gmail.com?part=3D1
