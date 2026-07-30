Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAC43078B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419680; cv=none; b=dGe8RscZ90QY0d0uBJPt245l1dMzrFLlq8hg0XdWnrLcgyd+1D5yYkyXfOhq+aYjwl3tZi27KpwwOlTMK4d5vCgdKZA85oa6wvYnWUfFksj9VNWdmbl3Ruc3WP317hjD5ruR/bz11dhta7jRp32oOe0xU9NAL1hy16taOfkl7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419680; c=relaxed/simple;
	bh=ANCcrQ3khFt+CxM2tNVQJ6DO1X2vSroAOoYlFSO+QSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATw8iU0vC42GRWxCpd2W3a7hIOu/XTzwxbymFS1p2KOBDHcPipg+jfv+JkJQn8im36AKh5hSpH2Wv02XW25Hlt/vZ7S6h/PtweLieqgrfIDhDqqKsG4WMDosZUUEssakeAy4YVagDLHegyoHEEU7K55EDwl92Fn3iiaq7oxZzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsOTxas8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsOTxas8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900901F000E9;
	Thu, 30 Jul 2026 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419678;
	bh=asIEStJG5kAMjjS3S0/bBSct0G/63/5lbrcy5Mti/d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NsOTxas8sJ6kb8UYAJrph6HBCPe1szZFKdNzU2kNcPKPGJt0rpCtrR631GWSaBcwb
	 tyHG5gZc1zIbSykbfdZU5Hw4dDf14/weT3/S1DQcPVpuXVR3NQJZAvwU1PODMoo1rs
	 BHEciW0dt/0mkyo2xHRGoio4NnlFWsKs2snIAKFX/0dJT8T+leSkA09oj2lEv8aFf+
	 5cAUtc2mbDBGC3xXiHudE6ULljGw5YgXCGLbPNPmGR9F02Sne09HwlJBDLEvU6lCVR
	 1ncvrmFX2S1xzH5g328gYVGjgeRIigxhy2WR4Yb2Ww4jD0hSyPH25PYScozgdiP4gE
	 TbI12LVtxXCPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730134815.434654-2-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
 <20260730134815.434654-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:54:38 +0000
Message-Id: <20260730135438.900901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix 'vicharak' is used in the compatible string 'vich=
arak,axon-lite' but is not registered in the vendor prefix registry.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Li=
te board ---
commit 6805625dcdf6088c2bf6394082251d13fbae2a6c
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

dt-bindings: arm: rockchip: Add Vicharak Axon Lite board

Document the compatible string for the Vicharak Axon Lite, an RK3576-based
single-board computer.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1306,6 +1306,11 @@ properties:
>            - const: turing,rk1
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Axon Lite
> +        items:
> +          - const: vicharak,axon-lite

[Severity: Low]
Is the vendor prefix "vicharak" registered in the vendor prefix registry?=20

It appears this might cause dt_binding_check validation to fail with a
warning or error due to the undocumented vendor prefix. Does this patch=20
series include a corresponding update to vendor-prefixes.yaml that I might=
=20
have missed?

> +          - const: rockchip,rk3576
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730134815.4346=
54-1-hrushirajg23@gmail.com?part=3D1
