Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2BC322C6D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435990; cv=none; b=KrX4kvNbHXCftDz+Q0GLCcO+1dFdQF5YuiNRBkucBLJdGKdfCqjGdhQI/4kpVmBsWaPC7VHLr3y8S8Ui/BGqknG8eRLGmNrad7tgzgPcGsbDF0gO+AB0u/ED9qQA2oQ+pBauoZgYGqAba4GhwSkmdxJ9nGiabLJL15lwHnMPgE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435990; c=relaxed/simple;
	bh=T4X2NAGrCeFoVRRirHbi6SM6KOt+HZaf6oZEoWmaKrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HUNocYQmD+aYIGild6KLio4G6enUH5c61hrYdxZFxjyyB8AdsE9HJdWp/jFHaD+ZWfkiygsXbPR8D9imG6d0wsvc6mOIpgmUx/0IVE28uUBo35/c+GLFsK3LxVeH1WxuBsFHiVo8yI/71e6mDmWGUzpmnSq2iLXrHJ7tXFWY4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuJlaxFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuJlaxFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F841F000E9;
	Tue,  7 Jul 2026 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783435989;
	bh=51GfxdPhD+h5Ljm1RStZ/V7dC/PLrmC6dLPBzRaX0vA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FuJlaxFrv1FLxe3DMshC4MyoLiuh3SxspG4Ei8142bX4mKVyct4xv78HZ3qcddQG4
	 nGMqaNz2937/WfnqRWkf8lPoi3XfQQH8oHW6+L7sHXoGuyJS13ogFDKJxrrgBcThuT
	 kAgMCPDuN0QNNLCjtPmznCSy/KuufwIorKYiQm7PGg8nACc0bMleV+vqSIucJYty3D
	 6md+ZpIX5PrWyDgu5JjiJgg1EOqehTURTtAVi2r96wDTWjBSViocDyRZw/AVA7m6V/
	 daED/tzAU1tSdqBZL9kFKbFiYe6PKddonDMh+NdR+Kr+IFrSZ3C54IgPrmMMtGpLj6
	 RoxkTZ2bHSu8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/17] iio: test: add kunit tests for channel prefix
 naming generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-ad9910-iio-driver-v7-7-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-7-a4ec30f63700@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:53:08 +0000
Message-Id: <20260707145308.E8F841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Building with CONFIG_IIO=3Dy and CONFIG_KUNIT=3Dm leads to an undef=
ined reference linker error for KUnit symbols.
--

--- Patch [7]: [PATCH v7 07/17] iio: test: add kunit tests for channel pref=
ix naming generation ---
commit 4ac1b309df3245543c36117b12d35f78434a6e33
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: test: add kunit tests for channel prefix naming generation

Add a KUnit test suite covering __iio_chan_prefix_emit(), the helper
that builds IIO sysfs attribute name prefixes from an iio_chan_spec.

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index ecc69adf61de8..78a3c27d17a1b 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
[ ... ]
> @@ -2232,6 +2232,10 @@ EXPORT_SYMBOL_GPL(iio_device_get_current_mode);
>  subsys_initcall(iio_init);
>  module_exit(iio_exit);
> =20
> +#if IS_ENABLED(CONFIG_IIO_CHANNEL_PREFIX_KUNIT_TEST)
> +#include "test/iio-test-channel-prefix.c"
> +#endif

[Severity: Low]
If CONFIG_IIO=3Dy and CONFIG_KUNIT=3Dm, this code compiles the test directl=
y into
the built-in industrialio-core.o object. Will this lead to an undefined
reference linker error when the built-in code attempts to reference KUnit
symbols exported by the loadable kunit.ko module?

> +
>  MODULE_AUTHOR("Jonathan Cameron <jic23@kernel.org>");
>  MODULE_DESCRIPTION("Industrial I/O core");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/iio/test/Kconfig b/drivers/iio/test/Kconfig
> index 4fc17dd0dcd77..c355b0abd5808 100644
> --- a/drivers/iio/test/Kconfig
> +++ b/drivers/iio/test/Kconfig
> @@ -4,6 +4,20 @@
>  #
> =20
>  # Keep in alphabetical order
> +config IIO_CHANNEL_PREFIX_KUNIT_TEST
> +	bool "Test IIO channel prefix" if !KUNIT_ALL_TESTS
> +	depends on KUNIT && IIO

[Severity: Low]
Because IIO_CHANNEL_PREFIX_KUNIT_TEST is a bool, Kconfig allows it to be
enabled (y) even when its dependency evaluates to m (which happens when
KUNIT=3Dm and IIO=3Dy). Should this dependency be tightened to prevent the =
test
from being built-in while KUnit is a module?

> +	default KUNIT_ALL_TESTS
> +	help
> +	  Build unit tests for __iio_chan_prefix_emit(), the helper that

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ad9910-iio=
-driver-v7-0-a4ec30f63700@analog.com?part=3D7
