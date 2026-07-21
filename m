Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8544CF34
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628331; cv=none; b=mwnr0NeBx6N0WFb9Eet4AzbqQHE6Mbeb10LkStRo+l2s9a3gTnGmjbB7mySoE3AuI1ZdoTfQdrestsSYfFpmpNNhd9G3VMG35o28jvQ11VzhiHbyWv1aEcYVjZsQi3gRsAX3Jo1IHWtUXBY8ITXjzl0fFVNh5zwocwFneq96khU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628331; c=relaxed/simple;
	bh=n+9XbtFSmIikMXeA3m9x2eZgMS5rRfBDx/duu0xJjKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGGHtV4dQtS73pZmx/+2Nr5dsZWQ0YpspWZSA5JocH9gnML4rRAzrnkWJ2nBZ8mC8t45M3E506Ch87X41A5tFPFycduFH3YMzkBo+tWD4rxUmWdMSUvH/Ccgwn5jOXgo++WL1PgQGccIs9il5/gHhIbqMgqllzAUTqOvkF+rA08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYD2sGHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYD2sGHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42661F00A3E;
	Tue, 21 Jul 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628330;
	bh=GHhQQTOcSP1vE00aJxeTN0Qhiv6bhmmjlHK9c+daYEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYD2sGHpplYc63b55mzDCXdssrEpspruuomAsTRB+1mOuABOwcVSFIH5bQOAgrL1C
	 3W2stEyDf8WUHYxSZadwG3Dm8PtRlPbClmUCkDzFPYeWp9bjCOoFmcfibPOH6hLUX/
	 Z+HNgmFtoFJCeGfhPFiv0spL2dO96ow8uk2a+JJy4n3zELDtNU5tTO8lMoZh1+hkPD
	 c/TY/I+n6Nr32llZWsPzrgOeCbtuhxmkPA6TM3Ij3illYYZJWqxarjAVIvn+v8Gfv/
	 2ySo/7nucJNKXbXP0Lw2nv1pZSb5jPuvewc7gXGEF0/GtZypsl+9Qc8EXBkSCH1xvb
	 slN8iaZpcAaww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/18] dt-bindings: clock: mediatek: regroup MT8195
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-7-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-7-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:29 +0000
Message-Id: <20260721100529.C42661F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `if-then` conditional block for MT8188 compatible strings incor=
rectly uses `enum:` instead of `contains: enum:`, breaking schema validatio=
n.
--

--- Patch [7]: [PATCH v3 07/18] dt-bindings: clock: mediatek: regroup MT819=
5 dt-bindings into MT8186 ---
commit 962476a7bda22cd1057abbb9118e372c99b1e154
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186

This commit regroups the MT8195 clock and system clock dt-bindings into
the MT8186 bindings to ease maintainability. The standalone MT8195 files
are removed and their compatible strings are added to the shared schemas.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index b5988d122e4dd..ab9f8cb7dd6ee 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> @@ -78,6 +78,31 @@ properties:
>            - mediatek,mt8192-vdecsys_soc
>            - mediatek,mt8192-vdecsys
>            - mediatek,mt8192-vencsys
> +          - mediatek,mt8195-apusys_pll
[ ... ]
> +          - mediatek,mt8195-wpesys_vpp0
> +          - mediatek,mt8195-wpesys_vpp1
> =20
>    reg:
>      maxItems: 1

[Severity: Low]
Is the if-then conditional block for MT8188 compatible strings missing
a contains keyword?

Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml:allOf.if=
.properties.compatible:
        compatible:
          enum:
            - mediatek,mt8188-camsys-rawa

Because the Device Tree compatible property is parsed as a string array,
using enum directly against the array will unconditionally evaluate to fals=
e.
As a result, the else clause ('#reset-cells': false) is incorrectly applied
to all nodes.

Could this forbid the '#reset-cells' property for MT8188 nodes (e.g.,
camsys-rawa) that validly define it, breaking schema validation when
running make dtbs_check on MT8188 device trees?

This regression was introduced by the series in the commit "dt-bindings:
clock: mediatek: regroup MT8188 dt-bindings into MT8186" when the contains
keyword was mistakenly dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D7
