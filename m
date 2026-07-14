Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27613B3BE3
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031176; cv=none; b=QrKNPfMES06GlKYStU4cLXXmZfOQF/lkjjfTuUasAAvxzNaMHjiJGKMPZaip4OJ8r5J/qzTXHyNIB1TS9HnLWPxofap5JxJe+gBQEitHdXmW6D+qeigkuzSZQlBloYpluLhUkuVub5+Gum2JcsXq/V4o8FwONE38Si4JjKFOBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031176; c=relaxed/simple;
	bh=LNuKhoOOLC1uJnDVriGXok0rsZ1G4dPtiHHKBiWwh0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUE4bihCY5q5GyrhdrlcHPgk9y+9wITs0aPaM7V+ky2CpnSGI6mKyqUIi5RgmF5sX/85QqrS36fX6/HS0Yn4WZNTsKLGc73iCb9Y5D39MnzbMT1PS8ANYVoIFhoIIOAL61NAdJaiZ+hjdMBfE5j4Kz0498bbRRIOiLL8QeEVUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdyenp7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdyenp7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445271F000E9;
	Tue, 14 Jul 2026 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784031172;
	bh=L5rD0UepkwBDWadK8d3zW6wshkLTdnYaFxE9K/pyJSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cdyenp7PlwvnFbSK/dPkZc8f6sakBM3XnRdh2S0CWZy7ZnpxcPhyOYIFn/Wp/NYtA
	 iyA/IcXt3crkYxouqjVw9F7pOGNF1bwoC9mB+r6st7riqUma8hp2zTg51VvalgnJJK
	 xqaiY+u5u9iLvXoJSYma1iP/jb9UxwlHo19M8+xArIiNI1bhnG+7qw5yNVvYEZegGx
	 wRBiWhI1F+z9kA7CVsIqqcSmLE/oRDtl8BGs7CtEzVTEVqemiUeVQMmrRkRGv776am
	 6DUWn2k0/Tg8LP0OiO5SG4IHUAn+DMXBfC+Igem3ZnJ3yjCnHjKut1LQNBEdM+FGbN
	 uaIiGqpkRxWPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/17] iio: test: add kunit tests for channel prefix
 naming generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-ad9910-iio-driver-v8-7-36939c3c07d2@analog.com>
References: <20260714-ad9910-iio-driver-v8-0-36939c3c07d2@analog.com>
 <20260714-ad9910-iio-driver-v8-7-36939c3c07d2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 12:12:51 +0000
Message-Id: <20260714121252.445271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The tristate Kconfig option IIO_CHANNEL_PREFIX_KUNIT_TEST allows a=
 configuration where the test is built-in but KUnit is a module, causing li=
nker failures.
--

--- Patch [7]: [PATCH v8 07/17] iio: test: add kunit tests for channel pref=
ix naming generation ---
commit 103d8c2a68a52f0447bd7dca00d5cedd2334e131
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: test: add kunit tests for channel prefix naming generation

This commit adds a KUnit test suite for the internal helper function
__iio_chan_prefix_emit(), which builds IIO sysfs attribute name prefixes.
Because the function is static, the test file is included directly into
industrialio-core.c.

> diff --git a/drivers/iio/test/Kconfig b/drivers/iio/test/Kconfig
> index 4fc17dd0dcd77..7d2c29cc583b9 100644
> --- a/drivers/iio/test/Kconfig
> +++ b/drivers/iio/test/Kconfig
[ ... ]
> @@ -4,6 +4,20 @@
>  #
> =20
>  # Keep in alphabetical order
> +config IIO_CHANNEL_PREFIX_KUNIT_TEST
> +	tristate "Test IIO channel prefix" if !KUNIT_ALL_TESTS
> +	depends on KUNIT && IIO
> +	default KUNIT_ALL_TESTS
[ ... ]
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index b365922d84810..3909255212f5e 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
[ ... ]
> @@ -2230,6 +2230,10 @@ EXPORT_SYMBOL_GPL(iio_device_get_current_mode);
>  subsys_initcall(iio_init);
>  module_exit(iio_exit);
> =20
> +#if IS_ENABLED(CONFIG_IIO_CHANNEL_PREFIX_KUNIT_TEST)
> +#include "test/iio-test-channel-prefix.c"
> +#endif

[Severity: High]
Does this setup cause linker errors if CONFIG_IIO is built-in (y) and
CONFIG_KUNIT is built as a module (m)?

Looking at the Kconfig, IIO_CHANNEL_PREFIX_KUNIT_TEST is a tristate that
depends on KUNIT && IIO. If CONFIG_IIO=3Dy and CONFIG_KUNIT=3Dm, the test c=
onfig
evaluates to 'm'.

Because IS_ENABLED() is true for both 'y' and 'm', this preprocessor check
will include the test code directly into industrialio-core.o, which is buil=
t-in.

Since the test code references KUnit symbols that are isolated in a loadable
module, could this result in undefined reference errors during the final
vmlinux link stage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-ad9910-iio=
-driver-v8-0-36939c3c07d2@analog.com?part=3D7
