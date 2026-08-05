Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925146AF08
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949198; cv=none; b=ciOMeeYLp54/IHSBKQg/OkDuCN9NMtYwa/apjlSTec8bh8GV9WvJPQ7FtT3P720SnEvmgV+ID16465nOnjPOYEZ1iHyYszW+jJYxcjUG17taixMlH8wgSOwXoN+cHrGE9oNc2g74fc74ROnCFSxH4zGAxiQADxSVLzSNWaTOVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949198; c=relaxed/simple;
	bh=/ONCVpNpGnmcdUtwuQzySOzv+qZ/4Xk4PYGNPzLBvjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PzQusm3r818d8zZ5z+YwOMNIelkFO1yI+0SKFJ/P7Slt6893DxPTPbAR6OA+lLXEKQVicpivNeva95s9Mve5EF7BFx+Hukuml/3jLO7kvtH5Z+5rsypGx6sFJxyfUyFjoxxprhIsiDvB6Kw+Cnzb97LL/BuD3WXYI7r47uP+vIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPFNrwNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPFNrwNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2E31F000E9;
	Wed,  5 Aug 2026 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949196;
	bh=DGmInPbDPLX7Ekvw/2VNvRzdyve4Uxy+HI6ale8QgNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPFNrwNXFAGyIu18jUOqfvqbiOvsa/K3/yy77OC06e1K+ft3YJWGvkYso8nkMkIYX
	 aqHANseTHQ0i3MbnuJbHt3VATQp2YjBaBlyh9cHRmR0ugSKvifN7Jv/QN4KeZQhjOc
	 QgDuWOEFP6YO7aBzEXbXjRGwr6wb2c6sXDu5OnXTpprYcLO4m+uxI1ZOYfNP4sUiRt
	 jRcWoje4F76VlrYS1fELeL62jzGff5s1AvXAAeOIr8vGKPyOQ5aJAQNSACWTWjLXFQ
	 8dYbj3g7KJ0QchtOnOBbFXUc69TP9YEgr2Wl0VrtqudvMoYGSYeIjWYwCbi13c7dMx
	 PlUWwQ7/faNJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805164815.249328-5-pavitrakumarm@vayavyalabs.com>
References: <20260805164815.249328-1-pavitrakumarm@vayavyalabs.com>
 <20260805164815.249328-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:59:55 +0000
Message-Id: <20260805165956.5B2E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `select CRYPTO_SHA3` dependency for SPAcc ahash support.
--

--- Patch [4]: [PATCH v20 4/4] crypto: spacc - Add SPAcc Kconfig and Makefi=
le ---
commit 4e5d1fffdbede78b50849c59ea51d64c31455d5c
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile

This commit introduces the Kconfig and Makefile for the new dwc_spacc
Security Protocol Accelerator driver. It wires up the build system entries
and configuration options for various SPAcc features.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CRYPTO_DEV_SPACC
> +	tristate "Support for dwc_spacc Security Protocol Accelerator"
> +	depends on HAS_DMA
> +	depends on HAS_IOMEM
> +	select CRYPTO_ENGINE
> +	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA1 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_MD5 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA256 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA512 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_HMAC if CRYPTO_DEV_SPACC_HASH

[Severity: Medium]
Is a select for CRYPTO_SHA3 missing here?

The SPAcc driver implements hardware acceleration for SHA-3 algorithms and
requires the software SHA-3 algorithms as fallbacks. If CONFIG_CRYPTO_SHA3
is not enabled, the driver's probe sequence will fail to find the fallback
and silently skip registering the SHA-3 hardware acceleration algorithms.

> +	select CRYPTO_CMAC if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_XCBC if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_AES if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SM4_GENERIC if CRYPTO_DEV_SPACC_HASH
> +	default n

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805164815.2493=
28-1-pavitrakumarm@vayavyalabs.com?part=3D4
