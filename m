Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8EA3806BE
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778878317; cv=none; b=uCOwhBZ/4BZR5iC6UzSMTmD7qRN0hzjVExns4grgA5rvNShS8KAXO2/bvJpU10OloF84mSi6dMe1YEuvjlhXQdbWCItZhiFg3oLbr6h/+j02HiwtOkMaRbkfVQKryrVpONqTskrglntuBN3tLpH7xZHBx9lEDKvAQO5nujwILe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778878317; c=relaxed/simple;
	bh=0ESP+86ordSTT0tVwjRrcILNMP/NsuGIdwEoF0WHaTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d7JGd1j/Sdyxl0s3ANUpy2zkNB/OPunVSBlN+EGQVjjOy0qIjiW01sPztJJauUMOV3f9G0QVbPtLXGyWpEXw6y+R3qj8OuVNWfNz2P2KdoHLIP/uRgLeX2UNAMuG1xrNf5dwZM5hPbMf7oYJ2Q8V1NJoNuCPGz66MXcg7AlBlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXQ6ELe/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXQ6ELe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C5C2BCB0;
	Fri, 15 May 2026 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778878316;
	bh=0ESP+86ordSTT0tVwjRrcILNMP/NsuGIdwEoF0WHaTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CXQ6ELe/Jvl3xviq3RWRc1CzlJSnylp6y62FDJAGrxROaNi2dtJBPnjDG2LUV8GFQ
	 +DtReWUBMGYxzwGAI/L0WAyRshqO4zB4hXm5l3OQNdWmCXMd07PnOpYGwgsT9IkRhx
	 sGuQwQWc5X6ZOWwMWkou3h1YRU++HyBgfgSz2Y4YrJ5yTyHfpgRk+wn3oXqhQ3V83w
	 KbC8GroFBZonym/rGgDF3E81N061zZAZcRh7N9q5Ykt8k31qk/eWsoY7p2pG1l8HBI
	 loAUPUCdXFEIy5g4FmAcCWyI7JIiB7QE8yw9ZCqKVDVcA32flD+aCfK3P8v43DUueq
	 sQmN9RuwaHQ4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] spi: dt-bindings: tegra: Support dma-coherent
 property for QSPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-2-57dfb63cd3d6@gmail.com>
References: <20260515-tegra194-qspi-iommu-v1-2-57dfb63cd3d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 20:51:56 +0000
Message-Id: <20260515205156.806C5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `dma-coherent` property is allowed globally for all SoC vari=
ants, including older ones that lack DMA coherency support.
--

commit 65a20c2287e15ca3b52c5785b3e048bc7401f80b
Author: Aaron Kling <webgeek1234@gmail.com>

spi: dt-bindings: tegra: Support dma-coherent property for QSPI

This commit adds the dma-coherent property to the Tegra QSPI device tree
binding, noting that it is supported by at least the Tegra194 and Tegra234
controllers.

> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.y=
aml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> index 62233eb3101ae..433bca02f86b1 100644
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> @@ -47,6 +47,8 @@ properties:
>    iommus:
>      maxItems: 1
> =20
> +  dma-coherent: true
> +

By adding this unconditionally to the top-level properties block, does the
schema now permit this property for all hardware variants?

If a device tree incorrectly applies dma-coherent to an older, non-coherent
generation like Tegra210 or Tegra186, it appears it would silently pass
validation.

Could this be constrained via an if-then block in allOf to set
dma-coherent: false for unsupported variants, similar to how the iommus
property is handled in this file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-tegra194-q=
spi-iommu-v1-0-57dfb63cd3d6@gmail.com?part=3D2
