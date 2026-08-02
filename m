Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE63009D6
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669756; cv=none; b=ABJ7VH41CYZON8g9z3vEYPuB+5/gSI6w7+OCvfizIejsSKnRflZGbMyYBlxmwZXl5yHHlNWOtojlOhkQt8uD+mEGgDt3mg1qRdbNZFUI2zCbBCEE1b3qQMhAmjd0D+5h5cssTp5vguT/kpvwu3i8Qim4d0Xdy95/4UHeLlwEuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669756; c=relaxed/simple;
	bh=QaHfpScgQdgKFA3Th+It5w+59edDPLk+LeUELiBRdzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hRf1VKdNiFf1q7rV/WtEzuOEw5358PJC4BEntRDkDDCDKkhHd1tJkITWSf99GWl7Ck9xuN7ZGYvYPZs3XtHv1SHczgHQ8p3O+10lPCTGe26FMtT1V/ZEkW9wJiWsF9+js/Pne7LP6pju2aEKjjFAlc7x2kyXBQ6nQ5VqsSMYYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtwwcCeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtwwcCeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C721F000E9;
	Sun,  2 Aug 2026 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669754;
	bh=q+L7Db/3O2HnIYG9vUGp80ZgM+5yhje1NeMtzR6x+nY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FtwwcCeLbKed2S+d2UZyQEwqs09+ljWNxr86QWTetJZ61Y3cvqKH08I4BQSGe8bnQ
	 znVi3pClLDwzLNRxyyqtJL9VVMU59ISPn7vsiGbeL0WoOfFsjBufns9HFrBeOqFPBq
	 dyKPaHawZqetdFJiOGNcC5JbqPScBVfk4wkfT180cEurTPsLl5ogmeKhWnTTjwsaiT
	 ikHOV4PCHEEv366NJCZxhaCD5BrdjDxYNBVV/v2BMxZZp/2MUN0ljVa1VQyT9golsA
	 p2rKJzH/Yapxs+Ztz0CRopBePk44RLrk0SmJqbii9wLyxSfgJUFu2xX5JEkbvB6Ttx
	 tIcIQQd5G6mEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/25] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-6-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-6-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:33 +0000
Message-Id: <20260802112234.36C721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditional block in `mediatek,mt8186-clock.yaml` in=
correctly uses `enum` directly on the `compatible` property instead of `con=
tains: enum:`, breaking device tree schema validation for MT8188 hardware v=
ariants.
--

--- Patch [6]: [PATCH v5 06/25] dt-bindings: clock: mediatek: regroup MT819=
2 dt-bindings into MT8186 ---
commit 06947e98086d9925a384efecc6b70a1f4b24045a
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

    dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186

This commit regroups the MT8192 functional and system clock bindings into
the MT8186 binding files. It consolidates similar clock controller designs
to ease maintainability.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 0bc2da60a6016..b5988d122e4dd 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> @@ -58,6 +58,26 @@ properties:
>            - mediatek,mt8188-vencsys
>            - mediatek,mt8188-wpesys
>            - mediatek,mt8188-wpesys-vpp0
> +          - mediatek,mt8192-camsys
> +          - mediatek,mt8192-camsys_rawa
[ ... ]
> +          - mediatek,mt8192-vdecsys_soc
> +          - mediatek,mt8192-vdecsys
> +          - mediatek,mt8192-vencsys
> =20
>    reg:
>      maxItems: 1

[Severity: Medium]
Does this file's allOf block incorrectly evaluate the compatible strings?

Looking further down in the same file:

Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml:allOf:
  allOf:
    - if:
        properties:
          compatible:
            enum:
              - mediatek,mt8188-camsys-rawa

Because the compatible property is evaluated as an array in Device Tree sch=
emas,
does using enum directly instead of contains: enum: cause the if condition
to always evaluate to false?

If it fails to match the array, it appears validation falls through to the
else block, incorrectly enforcing '#reset-cells': false for MT8188 device n=
odes
that actually require resets.

Should this use contains: enum: instead to properly validate the hardware
variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D6
