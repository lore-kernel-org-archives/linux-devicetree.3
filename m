Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FFF32937A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015566; cv=none; b=UgRCvEUKWxOTc+y6UmzNe1XPGYhHf3KNaektNF+H5EllsDQKRINIQ6Tqkj8OXQE8t6RVjvY+AgCiTSnJRKpF8ysJVe5sPm0gMgXT2rPfJUy5K2VdWvbyrXL7GX896HjslWDpAKLz2IvBDTv2tnCQADZddPue20li6gb+LzCZi/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015566; c=relaxed/simple;
	bh=3y9r5Q6P/3Rt6lgO5y7EACxVG+8Vi4wJsxk0jVODmsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rJEeMRc8iRL1/CSgaO6Ee4wkvhU5f7n3hvJeug1MhUMEVNTmgYnQ69l4F/G50KwcRq9Yf2OQjXQST+pB8/XNvFOzbe/GvKiqO95ht9pPcNkCS4PO+j/0WE9mQ3Mn3fDAVsAnckztdrhRsFZ7IDVZ2ai2+qTlmefuIK4/h2O+hhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCGcwuAj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCGcwuAj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799121F000E9;
	Thu,  2 Jul 2026 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015564;
	bh=mkqgXXxE2TZfezQnrVdIKW/6o9RQtpkemSZ9PTvzpJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCGcwuAj0QUXyZj8TVtUKg1zcZrcA9IP82vGDuOj0RDbf/gbXmt+hUY17CALD5RXI
	 SMPkMhPitke+f8jnQ5huqGcOYVtva1GeTFNPLtRJuI+xwJpclCHO5yZvHey3wNPPgK
	 Mb6o8mrCnE618mlNoID7JVdgNp81XCVzt4BwYqjFM1e/NSDeOO7lvGJU67fgr25ulP
	 I8mLwkELatoyd1A6im9o0yxr75xKsmCM6IsIzltm93pBcvdRYgntzttVHcGrKkxV9C
	 QrxC0oKP3nXEOc3n1mtyXOUfoYDrXG/2Sg99njPcznBsiiNE0EI91ak72VvlibRB2M
	 cF1yv5tVdbqlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/15] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-3-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-3-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:02 +0000
Message-Id: <20260702180603.799121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `if` conditionals in `allOf` incorrectly use `enum:` instead o=
f `contains: enum:`, causing the condition to never match.
--

commit 422b32e17fa321946e679002f4f6f7b6b918fe88
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186

This commit regroups the MT8192 clock and system clock dt-bindings into
the MT8186 files. This simplifies maintainability and establishes common fi=
les
for SoCs with similar clock controller designs.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 28e05b5fb23bb..3b543c810f18d 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> @@ -58,7 +58,26 @@ properties:
>            - mediatek,mt8188-vencsys
>            - mediatek,mt8188-wpesys
>            - mediatek,mt8188-wpesys-vpp0
> -
> +          - mediatek,mt8192-camsys

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch (it appears to have been introduc=
ed
in the previous patch of the series), but looking at the allOf block further
down in this file:

allOf:
  - if:
      properties:
        compatible:
          enum:
            - mediatek,mt8188-adsp-audio26m

Does this condition fail to match because it uses enum: instead of
contains: enum:?

Since the compatible property is evaluated as an array of strings, comparing
it directly against a string enum prevents the condition from matching when
running dt_binding_check on any device tree containing the affected MT8188
compatibles.

This causes the schema validation to silently fail to enforce the
#clock-cells and #reset-cells requirements for all MT8188 compatibles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D3
