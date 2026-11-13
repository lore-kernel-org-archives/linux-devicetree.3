Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587717;
	b=yrAn3VCHvnFGqYSCs12HNPP/FXW0OKeYD/8zxrlkGWxnsgvuggYh2LimPbPQgNdy4Pp6
	 /08QUDboGhSqL9L0YZ4e3HF7xckORBH0zoEWnQRRE/Ggz1Os5WZjhsEivknulkUfc4GPx
	 Bwqh3m6sjMwxgJc8v2TlTL7ZTZucHtUYj5SbeE5fcYY5FJkvSBnVM2QWGd5W82gk4wgJD
	 MuFwiG1hnIq8Sap8432T/GNAvQ3XOjoCIaTBc4NJ7pKjVL6kOUtKMx5xV5j4kVAMxMCsO
	 RlE3YTCTBtt/zSkBXZlXDsNcG0n0ISsh16MC4dLwvbTTditQcpj7ULttS1yhqfffctQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587717;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Io3LbBzAum205PwdBFQoAh4sWtN9t475JlKUGXJBp4Q=;
	b=p9zkzx75iMMxsHZCU0ivJDse1jwaOkPuH07cri0BDwBEY56zy3f4C6b8LSo2GUSrNAhG
	 D6SeW2x2LNUcqSyKcVBnHMzfwJo7BoxDiwgrfANZr6W48pcEMB9xbJd9Qn9wJZL6zwzJy
	 DtJwIXS6yXBVlTBa+pVz7S9nI2VVa8rK4DRZNAhn3Jk0ksZvc+h+ZmpeZaUOVEbjbR2N9
	 4DEeQmSFnO1XWxw3Uxy0DrR4FoYFiZxHnqN9m52b+8jL7Sp6tEzQA8oEYn6uYjnxeDgwW
	 qZZ4bGaGNpjGmf8UqqvoX//P2sqkGJ8AieW+mKex2bYKakQNIXqf6zcXh2/R9h67aMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k00eSQ26;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A9606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k00eSQ26
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870141F000C4;
	Fri, 13 Nov 2026 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587717;
	bh=Io3LbBzAum205PwdBFQoAh4sWtN9t475JlKUGXJBp4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k00eSQ26Im9Cz1wumZlPqxD+IFJ+ZLRxg+Htjth7VJ1vsV2AK2DG2TWcsoGb8VdsT
	 dW+qT/PULzAibZl8jLhBpCVMw5nwIHoAyQbB163qVcRKIhhrSPniNVY+YOwnx6PIb1
	 i+FNg1JbDbT0AGmVlFzrm127ffxUTwLIqDOTG2AQ7GnQ2aXyjt6vHVOOKfj+bpyBmm
	 GWt9Tzu5sD0kpFVPCB+Ile2J4WoRXaH7EffLmAqqzhvIGbNm4jl1Wk8oHt/qEmoAWk
	 a/9noTiP+bII2DisIat4PbOGmvgFyA2dUyx1DMlVrxOm4v8PmLrJGuzoXF5WWGjyyM
	 +2PdKJiTUKo/w==
Message-ID: <sashiko-outbox-213206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114
 CSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113161819.36847-8-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:35:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: display: tegra: broken clock-names and clocks
  bounds for Tegra30
- [Low] dt-bindings: display: tegra: unwieldy conditionals for Tegra114
  CSI variant
--

commit bc3414960c2f3dc8bae0883c0237f89de055bb7d
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: display: tegra: Document Tegra114 CSI

This commit adds the nvidia,tegra114-csi compatible string and its clock and
calibration constraints to the Tegra20 CSI binding schema.

> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-csi.yaml
> index a1aea9590769f..0c18ac81c6d6f 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.=
yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.=
yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - nvidia,tegra20-csi
>        - nvidia,tegra30-csi
> +      - nvidia,tegra114-csi
> =20
>    reg:
>      maxItems: 1
> @@ -24,12 +25,18 @@ properties:
>        - description: module clock
>        - description: PAD A clock
>        - description: PAD B clock
> +      - description: A/B lanes clock
> +      - description: C/D lanes clock
> +      - description: E lane clock
> =20
>    clock-names:
>      items:
>        - const: csi
>        - const: csia-pad
>        - const: csib-pad
> +      - const: cilab
> +      - const: cilcd
> +      - const: cile

[Severity: Medium]
Does extending the top-level clock-names items list to 6 entries without
setting minItems: 3 cause dtbs_check to fail on Tegra30 device trees?

Without an explicit minItems at the top level, dtschema defaults clock-names
to minItems: 6, which cannot be relaxed by the minItems: 3 rule in the
nvidia,tegra30-csi allOf branch and causes csi@800 in
arch/arm/boot/dts/nvidia/tegra30.dtsi to fail validation.  In addition,
expanding the top-level clocks and clock-names lists to 6 items leaves
nvidia,tegra30-csi without an upper bound unless maxItems: 3 is added to its
conditional block.

> @@ -125,6 +132,22 @@ allOf:
>          clock-names:
>            minItems: 3
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra114-csi
> +    then:
> +      properties:
> +        "#nvidia,mipi-calibrate-cells": false
> +
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          minItems: 6
> +
>  additionalProperties: false
> =20
>  required:

[Severity: Low]
Would nvidia,tegra114-csi fit better in a separate binding schema document?

With this addition, every compatible string in nvidia,tegra20-csi.yaml needs
its own if/then block to override clocks, clock-names, and
#nvidia,mipi-calibrate-cells.  Tegra114 CSI also differs in its hardware
layout: it adds CIL C/D and E lane clocks for a third port while the shared
schema restricts patternProperties to ^channel@[0-1]$, and
include/dt-bindings/clock/tegra114-car.h does not define the csia-pad or
csib-pad clocks required here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113161819.3684=
7-1-clamor95@gmail.com?part=3D7
