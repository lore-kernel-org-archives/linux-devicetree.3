Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CF3C2B92
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690432; cv=none; b=iJMKpd/XCh7E99ejBhvHcjyLBb18ZyrpuTpKxpWzFuxilcqZerqb3VKxzx8d2VU9ntW9prXLZaVI8HUkqvyHeyCq82iMU8kYD514YANdRYLVlOEzJ1CagpmJHODZsKIUv529VAZ0AcjzSV+NHXPBFN002Kdn4s3dTnsxYcfd+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690432; c=relaxed/simple;
	bh=uPcBP0Fe5XSMTR/jhoT/g/InSDaaB3ZIn17C3YRm3Iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qLLIF+LrJoGf4Yf2pYX2veXwQqXuNYrqjVXgnAKrmNknxm66Iheqw9BU1MbMDVarc3E7MjdlWBJfpfbPzXJLkhbNQPoWPMYAGw50wyz8wNAcMVAElwXHqsTYODF3HTnLBe1vJR0G78adz77IAXjfSN8KRONXTvmv8SCFrW6ZShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPMmnfQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPMmnfQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C521F000E9;
	Wed, 17 Jun 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690431;
	bh=vM5uMEQwTJJS/3aMjyrsWcaLv8Zv7jseiK5ZP5EfTII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPMmnfQlMpmaUqrixjRDr+qgCgrD+wMsDB619LPyMYk47gYSQgDP4UUm7wSWA2ZQe
	 JUUHo6xbApyhvzDbylIqWZh85MT2PvH5Jyq3uHhri7eE8YRV/dbjDszy7FCdt8PXyf
	 LdrieVdF++maMC1dOOZbvnctO3d742gWpaaTSipj667EDkqsh/NeMiaRJZwEhL3awC
	 GUpVCKs++XNfGctbc/ijp5hVTf452bKxJOKe244toNcIEM8THD0C4Ao143hH8FqfBg
	 nq+ZNLrPj7X2GCO4es4F5JLsL0Py0eRK5bcDB5UHKc8wVw3CmZbqz94TqrVmFWT35c
	 WHrFaLgJiNndw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC EFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-mt6323-nvmem-v2-1-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
 <20260617-mt6323-nvmem-v2-1-4f30e36aa0f4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 10:00:30 +0000
Message-Id: <20260617100031.50C521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing core NVMEM schema reference for an NVMEM provider node.
--

commit 3b91c0fc686c29119bcba167256b72fe3a4c7b96
Author: Roman Vivchar <rva333@protonmail.com>
dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

This commit adds devicetree binding documentation for the MediaTek mt6323
EFUSE. The efuse component is responsible for storing calibration data
within the mt6323 PMIC.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 05c121b0cb3d8..beaa67bf0df2c 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -145,6 +145,23 @@ properties:
>      required:
>        - compatible
> =20
> +  efuse:
> +    type: object
> +    unevaluatedProperties: false
> +    description:
> +      The efuse is responsible for storing calibration data, such as the=
rmal
> +      sensor calibration.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6323-efuse
> +
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#

[Severity: Low]
Does this node need a reference to the core NVMEM schema?

Because the efuse node acts as an NVMEM provider and uses=20
unevaluatedProperties: false, it will currently reject standard NVMEM
properties like read-only and wp-gpios if they are specified in the
device tree.

Including a $ref to /schemas/nvmem/nvmem.yaml# would natively support
nvmem-layout and permit standard NVMEM provider features to pass validation.

> +
> +    required:
> +      - compatible
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-mt6323-nvm=
em-v2-0-4f30e36aa0f4@protonmail.com?part=3D1
