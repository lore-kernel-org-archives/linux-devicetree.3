Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E528541A
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956562; cv=none; b=l41BONVYvP7Z8CTpyK7VI1AYyysscah1j/4/k4pS0gUc674wC2nEmmlUL0/YU1w6Yuqc7C6/sSSLlS12/8N/rnfy5jJvqi1lOLQ7KZmOaGkMNtEdz3u92r7zQFiOZ1DuC0QewL0ucBId5r0R/WtovhptNlyIQGuwr3/ZmfdvuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956562; c=relaxed/simple;
	bh=Pi0FB1YBBCegoxVbKDrJRMvVv8uGu5p0pRQveNMcQbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KLN2zgYVo2w9vy+AIOzhecHblGggNGVV9Y4HV2K+3/dqMDIuk7j2gtBarJ+WdGuetUpFZhnEOwUZKlA2lRMCugCbekkspJo6BH+MOxrLEKGmh3DKRt7LrZ7XuG+dzuLMFKSxgX9efqAKE86C/zi72a4oD2mfRCWMvd8RMfvIwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+xcydSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+xcydSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE261F000E9;
	Sat, 25 Jul 2026 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784956561;
	bh=dsfFN8cXH04hkcTIIjALsxWjAmkmjQJ/dE3pMlPJGfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+xcydSLIKwTQzWrgvqQphh541C3wQ6TZRrOp5efvvyLoXWchYzCBg/bnxtpEM+nb
	 0L9YOQE5x3JZm0C71s+gk8MYCgn+ryxyeTnuC4p09J8xEmBM1w5Y4x1M5Uj715fH9w
	 OHVtEIdh1ZmjjYpb7x5zVGhvjxY6VgebRJLpmA9Wk001ED688CBZ35UEJAgMqFoofH
	 fEsWKhfmDv2AJBIv/5DLheAbz+7R83MlcrxQkMUwnoaId64PtGTFXihQy5oWaj6xva
	 pHwlbwuhd9tgyij0tFPwzQX2TwRQUsRFtUhKSwcI7ddyORErLuV+naKB9cMUAP9tMg
	 E9JZOfmDweEDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: dri-devel@lists.freedesktop.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:16:00 +0000
Message-Id: <20260725051600.8EE261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added clock names in the device tree binding do not matc=
h the `fw_name` expected by the clock driver, breaking parent clock resolut=
ion.
--

--- Patch [4]: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY P=
LL pixel clocks on K3 APMU ---
commit 4027b4adb6d5e7a26089ca7f70a25150faf1098a
Author: Cody Kang <codykang.hk@gmail.com>

dt-bindings: soc: spacemit: allow eDP/DP PHY PLL pixel clocks on K3 APMU

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-s=
yscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-sys=
con.yaml
> index d3a7c93c3c54f..b8fc6632a3928 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.y=
aml

[ ... ]

> @@ -31,14 +31,18 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
> =20
>    clock-names:
> +    minItems: 4
>      items:
>        - const: osc
>        - const: vctcxo_1m
>        - const: vctcxo_3m
>        - const: vctcxo_24m
> +      - const: edp0_pll_pxclk
> +      - const: edp1_pll_pxclk

[Severity: High]
Will this mismatch with the clock driver's expected firmware names?

Looking at edp0_pclk_parents in drivers/clk/spacemit/ccu-k3.c, the driver
hardcodes the expected device tree string as "external_clk":

drivers/clk/spacemit/ccu-k3.c:edp0_pclk_parents[] =3D {
    ...
    CCU_PARENT_NAME(external_clk),
    ...
};

Since this binding strictly mandates "edp0_pll_pxclk" and "edp1_pll_pxclk"=
=20
instead of "external_clk", the Common Clock Framework will search the=20
clock-names array for "external_clk" and fail to resolve the parent clocks=
=20
for the eDP pixel clock muxes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-k3-display=
-v1-0-f22a10a52867@gmail.com?part=3D4
