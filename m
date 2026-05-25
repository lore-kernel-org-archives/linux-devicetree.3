Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F313E1704
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698321; cv=none; b=otW/ZLlPsGMYNrMfl4NrThePGGPH7OSIfSErPrBO6pXy6KzvMOgL5E/EwMrX9Te+JmrA5s5pdh+bIcsjWjhRG1h/UGo3dsWuOO8a+PIPLa32Tn/42KCb2VNBCYymOBveaGvx/jZu4RfnwfmKfIBswEToRc/kHH04/9L88Bgoo5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698321; c=relaxed/simple;
	bh=y5Ijuj0uo38PtFDxgn7Rd1bZN5YpyrM1VA0hZmUb1aI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AC2DpclxOnqUDqG9Wrzs1Md3nWT0KBBE2MuVGIS91FB9P3fE6ekeYtgjEJZR+QLfl7BfAkF/TIyj6Yi09oj4Jk1YrbsumNHTlCMVRN6s5dBmd89XDpcWuCVsFTNfA6AYAh4dkPetU6MnC6vpfVzDVvlhud+EZJmmGiTjfK2J9SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDvbR8RH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDvbR8RH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B644B1F000E9;
	Mon, 25 May 2026 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698319;
	bh=GTNbMuwreQF3xxTNX0cMIJatAhcmfe4H4m3i6dKSTFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDvbR8RHyupMHR+71HJpPB8Mz4wuBDS5JLKWlsZ4Un4fVjjP32ufaD95AIiajfEx/
	 4wb+J4UbCAilSKCKYRgPOaS9vvZ7AxZveUMJIuDIpOcSrtSORwYZOHVUbPISfME7dE
	 31rPCAPM70hFCkVSSiGxroD+MLQCw7J5qVI5MRl+5PC1s5H5k2GtBoVjEEjSsmLeef
	 CnHbWMvlv/7yiA52SGaD33jXJhDSFid4/93wc+9QBC+uWvHKwM4+jCb6Snva6UPQPQ
	 jg7v/PUa6VFf4Yw5Hq6vrBwUJ7AW9TkNyZjbArlUjWwguvjMAkUMiiSng8NI4p3wt7
	 oNyoKWK25WTVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525082033.117569-2-damon.ding@rock-chips.com>
References: <20260525082033.117569-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:38:39 +0000
Message-Id: <20260525083839.B644B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema fails to strictly enforce the per-SoC clock-name=
s requirements for RK3399 and RK3588, allowing invalid clock names to pass =
validation.
--

commit 631af83602e24c555a52671368c758b4023b77c7
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK=
3588

This commit updates the device tree binding for the RK3588 eDP controller to
explicitly require hclk as a third clock for accessing VO1 GRF registers and
enabling the video datapath. It also attempts to enforce per-SoC clock
constraints to ensure RK3288 requires 2 clocks, while RK3399 and RK3588
require 3 clocks with distinct names.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc59..7fe7655c1f37a 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
[ ... ]
> @@ -60,6 +62,32 @@ required:
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#
> =20
[ ... ]
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - rockchip,rk3399-edp
>      then:
>        properties:
>          clocks:
>            minItems: 3
>          clock-names:
>            minItems: 3
> =20
>    - if:
>        properties:
>          compatible:
> @@ -68,6 +96,10 @@ allOf:
>                - rockchip,rk3588-edp
>      then:
>        properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3

[Severity: Medium]
Since the top-level clock-names property now defines the third item as an e=
num
allowing either grf or hclk, doesn't this allow RK3399 to use hclk and RK35=
88
to use grf?

The commit message specifically mentions not reusing the grf clock name for
RK3588, and enforces grf for RK3399 and hclk for RK3588.=20

To strictly enforce this per-SoC requirement, should the then blocks overri=
de
the items list to explicitly constrain the third item to the correct consta=
nt
for each SoC?

>          resets:
>            minItems: 2
>          reset-names:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525082033.1175=
69-1-damon.ding@rock-chips.com?part=3D1
