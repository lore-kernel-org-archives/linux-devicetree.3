Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F23A3E7F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702647; cv=none; b=Kqt91/b6YF77OjdqWDiZPFisKAhAPmAtsnvgx8MZs5dinPUrUvKTslrYTU+yK2/evKU+3Axx4o1Dsu7QRmJvrYEbBOiMuUDf272Una86UQx1VdbKGjC8tBvH1b94hAsNcW3uD5qTBl2hF/lE6tFDhlEt3ZrpXa6k7FlFRIOOM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702647; c=relaxed/simple;
	bh=NFOmNBEt7hUkxilaTuwZD4pt0hY2SYuGknYl3FyObak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXr442L7pSwc5jxlmWO3/vl3rqdhBJ7vywCNfhJrBJsfBUD2euFFj7tNUi4M/PmHCItDNdKRIIaoCym13kazQvJkJFQGDn7BxamwmQh9ramwu8Alspr0cWE+JZBvRZiWJIxkZjX4/hlBPE88IYLQfYDhzWKSYI6TvGQ6CjGeeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJsnyGRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJsnyGRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883D8C19425;
	Wed, 13 May 2026 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778702647;
	bh=NFOmNBEt7hUkxilaTuwZD4pt0hY2SYuGknYl3FyObak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UJsnyGRvpngCSIPqCr5bsDO61ZoFT0i5i3+ahWpa7FFpFzwC3/TsGhgqGacUtSWv6
	 1OdpACQpJIcC1Guj1YKwhZ7c6Uf7ByH/qmhOAFX+N5QQ7ADB1SzzlxKuMR5+85JPeA
	 E3Uope0FezFLHC+USB1OcgvYTPyO2tsXMs68xR1aJfUA3KQa7+evZXM7xv0DfRvOUH
	 n6t/R87o8mDRxvsHw22HOpbRDRrmeRzaZ0FueOhoQsBqr/16lf3xJ2U+NRFMM0DylE
	 2N5K+wX2A3XprI5tg3oACNG1swZCCO0/94nUmOo63E45TGqy8JWCe6MXh+Jv5bRoYy
	 jD06AwGkUMsGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: display: rockchip: analogix-dp:
 Allow hclk as third clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512095644.1946084-2-damon.ding@rock-chips.com>
References: <20260512095644.1946084-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:04:05 +0000
Message-Id: <20260513200406.883D8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing SoC-specific constraints for the 3rd clock name allows i=
nvalid device trees to pass validation.
--

commit 0bc96bc26fc1f3dd540199a17da2a7642320b4c1
Author: Damon Ding <damon.ding@rock-chips.com>
dt-bindings: display: rockchip: analogix-dp: Allow hclk as third clock

This commit expands the clock-names property to allow hclk as a third
clock for the RK3588 eDP controller. This explicitly defines the video
output bus clock requirement instead of relying on implicit clock
enablement from the GRF phandle.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk

The commit message notes that grf is used for older SoCs and hclk is used
for RK3588.

Does updating the top-level items list without adding SoC-specific
constraints allow older SoCs to pass validation when using hclk, and
allow RK3588 to pass validation when using grf?

If an RK3588 device tree incorrectly uses grf, would it silently pass schema
validation, even though the driver explicitly looks for hclk?

Could the existing conditional block for rockchip,rk3588-edp (and correspon=
ding
constraints for older compatibles) be updated to enforce which clock name is
valid for each SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512095644.1946=
084-1-damon.ding@rock-chips.com?part=3D1
