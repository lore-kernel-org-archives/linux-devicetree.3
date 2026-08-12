Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4744D00D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550061; cv=none; b=hscp2SKT9OnzJqw0w6EJDL0sC8ISKFCpiUlI/JKQ0sZipeGY3h65JTklSDD1tJU44xV2BpVw1TxEGIWc2ktpw2fuPvDK1i42RhHIbaGK/2LkFoDjmE4UOsW+Is9z84KSY9v1Azm9dhrBmkJOx+n4QQYAvy4SwsFQFipMcoIQfnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550061; c=relaxed/simple;
	bh=ia6mKP+JgYr9j5vMJ7n6gXDJAg2/rdmo3ECIcVCH3GI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lCoIojPtu6tpKer3HN3uTmSZVeLOlOtiwZRJYGYrYjrZN/wg+fuZxYDACM6P1utqj4MtcnkZ6ZVT01Bi9qZc9hDaIt1DpLNuxmDPpiEknxJGo5LE+MnZmBgW7+hngcvhpJlkcROl1meKPStq/CowZDoBjgv/tZf1qqU1H9ICWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDwyx0E2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDwyx0E2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453E71F000E9;
	Wed, 12 Aug 2026 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550059;
	bh=Mltd+mfaxtivwFyNJpeexiLnJd1lFsdJ2/Bpytzb8JQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDwyx0E2687khsOh0S7XSpi4wnIB+HU4l8PWO/VUVgoCQoaINmiQ39nENFvVheP3U
	 iYyOgz/fWPS+LGKwPnzR1CLU2E3mczKSP1wWtZmH9f8sEsoh8LQszaFfi2hdxkGf9h
	 B75k4ZhgbRZFGZ7JOqnxnL8aB8LjDpe6bY3cGaMEITpQy2K4uFe8mn6XyJIfdtx78k
	 koJVeZBGSv/76dy0rntOL28QCfvyPR7qZnAdChM+7s0B65IjE0ArHxZHEnVsPu0LHM
	 mcdChZwu5x//74m7ZiUrwy+X6dIzZ9Rw+E+V59/ud/r5Cea6n5VU+QokcopCkClP9w
	 7iilOoo4kCj1Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812154442.3379851-3-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
 <20260812154442.3379851-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:54:18 +0000
Message-Id: <20260812155419.453E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver's OF match table lacks the necessary compatible string =
to bind to K3 AM62p devices.
- [Medium] Weak Kconfig enforcement for a driver that is explicitly require=
d to be built-in.
--

--- Patch [2]: [RFC PATCH 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs ---
commit 938e18870564b8f3213167e9a7f64fb5b97b8463
Author: Judith Mendez <jm@ti.com>

nvmem: uniphier-efuse: Enable for K3 SoCs

Add ARCH_K3 dependency and set to always build for K3 architecture.
The uniphier-efuse driver must be builtin to support early probe of
k3-socinfo during boot.

>     The uniphier-efuse driver must be builtin to support early probe of
>     k3-socinfo during boot. The k3-socinfo driver requires the efuse
>     provider for reading silicon revision information on AM62p device.

[Severity: High]
Will the driver successfully bind to the AM62p device without the correspon=
ding
compatible string?

Looking at uniphier_efuse_of_match in drivers/nvmem/uniphier-efuse.c, the OF
match table only supports the socionext compatible:

drivers/nvmem/uniphier-efuse.c:uniphier_efuse_of_match[] =3D {
	{ .compatible =3D "socionext,uniphier-efuse",},
	{/* sentinel */},
};

If the kernel attempts to match the AM62p device node, the match will fail =
and
the driver will not probe on these devices.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 283134498fbc3..192e9617ec472 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -376,8 +376,9 @@ config NVMEM_U_BOOT_ENV
> =20
>  config NVMEM_UNIPHIER_EFUSE
>  	tristate "UniPhier SoCs eFuse support"
> -	depends on ARCH_UNIPHIER || COMPILE_TEST
> +	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
>  	depends on HAS_IOMEM
> +	default y if ARCH_K3

[Severity: Medium]
Since the commit message explicitly states the driver must be builtin for
early probe, is default y sufficient to enforce this?

Because NVMEM_UNIPHIER_EFUSE is a tristate option, users or configurations
like allmodconfig or savedefconfig can still build it as a module. If
configured this way, the driver won't be available during early boot.

Could this Kconfig restrict it from being built as a module on K3, or force
it to a boolean to prevent probe failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812154442.3379=
851-1-jm@ti.com?part=3D2
