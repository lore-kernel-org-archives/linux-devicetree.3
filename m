Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE23372EFA
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038001; cv=none; b=XfJb74wJVWE1oxY4ekziUjXkGqKGR668IQ7n3NKyWb+N5pGSHleTztvtiaRi81//UJBg2Tax2uA8M9McFyU+oeIuIQByIKngaMVlC7OlBJuYl2MuF5jwZBi4lZWJt7DTwTgaRBtAF+KGXUdksBPxLTbVLzwv+uOVH4cxJPxTeBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038001; c=relaxed/simple;
	bh=fwsdqvhYi2xlt056qKRjuhpmNkZ5BSkJM/etkDN7KHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FiOJlK9wRYtggb7jr7eDAnDhONbxnwCL+mkV5Efh8Mm/86qWNJbQnCQaTO1YPx1Oe1ofzrzNYlmClEUZcgXM51eLKbC4Mqgz5PZPSey38rUQZ3mKvhpdS30lszfoKyYNNxip3yQ5S/9dmHkNi6LpSY1MbDX0SEY7arH/UWhPDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnNd2NY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnNd2NY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668AB1F000E9;
	Thu,  6 Aug 2026 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038000;
	bh=HNbJ2lDAXNy6h9hE+GS0iEj13vS1uo9+AAkvbEu546A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnNd2NY4NmmA/iSY/jqizmaMibLPoW7TEVNRXo2UErvBtH4nkQbDmhsNT+9t5gYbc
	 fvWGQo+huVhlUmIyuX3oRfV06OwUqmxKrU5EPxHnksSSmkV02iH+CnXVojC57XHL/3
	 6bwfb6O7QY98D4QqtO1ZG0b0lDHrEOkokVo53+IyJL7ryJYZ9zPHYDH3zmpyY60ySG
	 4JRU2eI0Fi6crTBr4QH587ZTFm1+hZ1L8DmaI7R2TV9WIPOxO0LzdAzRC7fZdQyVzW
	 +KocwPqaC4S8JVzdFx2hs4CG2qUTeXQ9J6Kj8eEuQQNdIOlYi9v6ZwrNPhX5YSz7gB
	 FLNGJAFBHfh7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-20-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-20-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:39:59 +0000
Message-Id: <20260806174000.668AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device Tree schema validation breakage for existing `rockchip,rk=
3588-dp` configurations.
--

--- Patch [20]: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fi=
x sound DAI cells ---
commit 2c15bbfcf4dec184872abdf4c2e06063a52d1e2f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells

The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
to select the right interface.

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
> +    description: 0 for I2S, 1 for S/PDIF

[Severity: Medium]
Will this strict constraint update cause make dtbs_check validation to
fail for existing in-tree device trees?

The mainline arch/arm64/boot/dts/rockchip/rk3588-base.dtsi still defines
#sound-dai-cells =3D <0>; for DP nodes.

While the commit message notes this breakage is intentional and will be
fixed up separately, could changing the schema without the accompanying
DTS updates cause automated CI validation failures and break bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D20
