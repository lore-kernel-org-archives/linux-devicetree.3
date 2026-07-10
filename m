Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F81282F1E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696148; cv=none; b=UAICu03gTw0qo9Ik32UzHVr7aSWbSHabzUsGWNi+qgfEi0cKY16wWvdxgdc2Zj1R7d5F3EPCi1QSjamjGtH7vxM0QrgrAkbDWYbzdgtiKiRDhEpEMR7URkgxKpYwSiMdxuuRc3G0nF4JqadfFcXH4yvjOB1/CmVir6ZDx2TB8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696148; c=relaxed/simple;
	bh=vfpHIihZvWb780UNY1fqjAnojolIMIuQwIgNFO6qjfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eicyMi4E82504RtmvVkCxln+nAY/1IDCzLe8yhuWtX30BCiPn4DigWnUfm9QRXVb17z4EYGGw482QhTg0P/PfHSpcqbTDFHHt38nOLGxxWexqRLh5nPUD+lwjaPKQcIMFUCFMs6YkscXdzNK47qetuLkozxxEVf994NoZNJM/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dw1FbMVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dw1FbMVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27831F00A3A;
	Fri, 10 Jul 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696147;
	bh=MWdU/RROHV32BuNT7MHV2aafjVgClnpIeTV5hv6YmmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dw1FbMVMtXsDLv9XpBUhMTk4MF7GDNQO4XsRfWbDwqr0ZNPG0vPEhjkGxKStjTAGJ
	 UOccjPc3WLwHI//Ou2jiaMah3pAxR+vOUHTHftuhfsCQgd/UifdktxIKeaD8EUuLB3
	 cPc5cu+b0qjI3pkdhIb6cuK+ddLyIFUBW5a50yba2tozkbTjtIZAqxn/qWZR8792x4
	 dZ9pLarfJVRHqQi0uiAI0G/52bhlakDuoI+I41i74LHsKCrcpgJORGdU3ebgLoQ1yj
	 SziOp7RLe2/f9fqGGZab5RJYBeMZgBJGjq7YqvN7yC1qN56hG+CFKmwyFQNp7iN4Y1
	 WuIG05fWW++QQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/18] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:06 +0000
Message-Id: <20260710150906.F27831F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditional block in `mediatek,mt8186-clock.yaml` is=
 missing the `contains:` keyword when matching the `compatible` property ar=
ray against an enum, causing the condition to never match and falsely forbi=
dding `#reset-cells` for all devices.
--

--- Patch [5]: [PATCH v2 05/18] dt-bindings: clock: mediatek: regroup MT818=
8 dt-bindings into MT8186 ---
commit 833611ff98aed20bc6663bc2bdced91c5491f806
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186

This commit regroups the MT8188 clock and system clock device tree bindings
into the MT8186 bindings to ease maintainability and share common files for
SoCs with similar clock controller designs.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 756b937bb7c4c..0bc2da60a6016 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> @@ -42,11 +65,36 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  '#reset-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-camsys-rawa

[Severity: Medium]
When the MT8188 clock binding was moved here, the contains keyword was drop=
ped
from this conditional block.

Since the compatible property is evaluated as an array, matching it directly
against an enum without the contains keyword evaluates to false.

Will this cause the else branch to execute unconditionally and falsely forb=
id
the #reset-cells property for valid MT8188 device tree nodes during
dt_binding_check validation?

> +            - mediatek,mt8188-camsys-rawb
> +            - mediatek,mt8188-camsys-yuva

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D5
