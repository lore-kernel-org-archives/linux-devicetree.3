Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E04314A65
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978367; cv=none; b=Gz2FmwUIh7gZgaT1E/++exnc1wknOQFjfuJsXHUEX+BG4BoKkR0YQPlb6MYSY9e+2Z2CeiWuzjyQNBYOc6KdXCxRPWPLCVdHa45mvL1t3T8NYNDzn9yQVDSOo7klekWzafOmvMe7iVgXzTISbw1V+Lc72BwXI9PVnvInVAqtxPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978367; c=relaxed/simple;
	bh=sx7mQE+RpC5DlkFGynnmRd+2G3MuAZF8Ahdnb2va/jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WAX28Or+ST+PabpZ2EZHTlKWKs75OWuwe90iLehyM22LXua7/q2W69spPSVOfx4dbub5bk9omyWSs0v0PBNsBWfWJ4K2nVw6mRZYuV5a251Cw7DJNWazH8WnEuUnmY09T356REMTBE7epLL79lCk+rRc4Lcm8HVupvb2ijZlNhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BM9kiSJk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BM9kiSJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FA71F000E9;
	Thu,  6 Aug 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978366;
	bh=euOHnBBlP+JcZU4xn7hB3k74zdvnXHDbIbpeGyDlRPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BM9kiSJkfRaaIxcC6CCVaBHqs/4rIPLRvMTZ6iJn8DualeorE84fB2MVGB/dMsoe3
	 LNXqL6y4LmdYqh73SbwFFE+M2evosRswZ/rpJtjCei2hvtoD3S79bMF1WTsw6lcEJc
	 V+aez9SX4RhUF9xj2Vow129z3Cx7Ytfvx+wuzqbGEVubZAbuGXMMHJVM/Nv70xKXvZ
	 VuldDSg2jVlAI60bW/RkvHBPP/SKUUbMgtqftVSxWKUTDwTut++8Kh96aTqlubhkUi
	 SGlU/1wot7AMPEFTxGY3jqGa7gUb0eeiAvC9xo8O+9O3cZ07eKeea6feW1C7abWBQf
	 ZdWWWTNsbZ6TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-20-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-20-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 01:06:05 +0000
Message-Id: <20260806010606.39FA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Tightening `#sound-dai-cells` to `const: 1` breaks `make dtbs_ch=
eck` validation for existing in-tree device trees.
--

--- Patch [20]: [PATCH v10 20/21] dt-bindings: display: rockchip: dw-dp: Fi=
x sound DAI cells ---
commit b5cf5d4b2be1635b36333fe2b9b6e821a83fdf42
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells

This commit updates the Rockchip DesignWare DisplayPort controller binding
to change #sound-dai-cells from 0 to 1, adding an argument to select between
I2S and S/PDIF interfaces.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 2b0d9e23e9432..c4f8959dd65da 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
[ ... ]
> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
> =20
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1

[Severity: Medium]
Will tightening this to const: 1 break make dtbs_check validation for exist=
ing
in-tree device trees?

The unmodified in-tree .dtsi files continue to use <0>, which violates the
newly introduced strict constraint. For example, in
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi for dp0:

        #sound-dai-cells =3D <0>;

While this affects the device tree build and validation process, it does not
impact runtime functionality since no driver currently consumes this DAI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D20
