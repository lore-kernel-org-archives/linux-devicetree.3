Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E577F35837C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736835; cv=none; b=MbKUUiYAjz3TaaRwgr+fwjMEwszherdpuEHKaE+l/+zDDeYfwy7aFOzX9wYe4j2KhQ8TE6udTKH39MsKCRS7tbNqvQXECdDY+IVWqjero21WrzV97xnfinugdAnvejmz07RwbjKTPI75+VCftH0SxMmJoo5WE9j2ZguVRG8IL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736835; c=relaxed/simple;
	bh=7dShQ/pIv3WUwbkgCTlRBgtojGWc1Be+P8DYwblC3XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W0shphOrC5KogUSlzMS4slWz2h+DbAQ3dJvY9DTRW/0yrX31pBEnkJU4/+hIwL/LZNeujCjq+xgweailOR5nMrf3qR9rRVByxiY7UtzMU/H4Qa/WsXH0gZYs9SMuTo6AQucIJVFl213SErXoW6o6v5tgunn4U3TfRPyO1sprzIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnpRUibN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnpRUibN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A111F000E9;
	Wed, 22 Jul 2026 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784736833;
	bh=3sxj5iYQHp0U982da5Fz9FG3sO/pn/yUDozMbXEH9rY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnpRUibNVELlF5itSCOyfdiwcC2V3+RlZVlsINI5Whdjgu8u4U/U9igJDvHCvtAHC
	 pUX9DscaI2UON5xhZIs/awf7Trq3brC3rKYyVhl1j6+SZrr1AZBj/2uHvwRreuAzjs
	 ecRcat3Y+kLVhjVrVuq51SgLSLBnj5fFVaDgjBlOR/Nz9jolTLimlJzGvoX2VkkwPE
	 G8iiYlr1EcdE0q/pgCy99cOsnCaFOX0mFvgCDE+q7rqh7Cn2MBsoBBwztws6gzbbLx
	 8p+cR9ZQZuceyo5QaHAznaQkBXJx6Up0L2XLeAW1WGofx/Q/tBHarGinUq6G9zlXUj
	 DLrv18aPqqj2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/17] iio: test: add kunit tests for channel prefix
 naming generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-ad9910-iio-driver-v9-7-459d1df5ac56@analog.com>
References: <20260722-ad9910-iio-driver-v9-0-459d1df5ac56@analog.com>
 <20260722-ad9910-iio-driver-v9-7-459d1df5ac56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:13:52 +0000
Message-Id: <20260722161353.48A111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `iio-test-channel-prefix` KUnit test module is missing a `MO=
DULE_LICENSE()` declaration, which will cause it to taint the kernel and fa=
il to load when compiled as a loadable module.
--

--- Patch [7]: [PATCH v9 07/17] iio: test: add kunit tests for channel pref=
ix naming generation ---
commit cea50e2c0ecc39138633c2f38aadeebe93da4611
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: test: add kunit tests for channel prefix naming generation

This commit adds a KUnit test suite for the __iio_chan_prefix_emit() helper
function. It tests various iio_shared_by modes, differential and modified
channel configurations, and exercises known error paths.

> diff --git a/drivers/iio/test/iio-test-channel-prefix.c b/drivers/iio/tes=
t/iio-test-channel-prefix.c
> new file mode 100644
> index 0000000000000..d049e4222c40e
> --- /dev/null
> +++ b/drivers/iio/test/iio-test-channel-prefix.c
[ ... ]
> +static struct kunit_suite iio_channel_prefix_test_suite =3D {
> +	.name =3D "iio-channel-prefix",
> +	.test_cases =3D iio_chan_prefix_test_cases,
> +};
> +
> +kunit_test_suite(iio_channel_prefix_test_suite);
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

[Severity: Medium]
Is a MODULE_LICENSE() declaration missing at the end of this file?

Because CONFIG_IIO_CHANNEL_PREFIX_KUNIT_TEST is defined as a tristate in
the Kconfig, this test can be compiled as a loadable module.=20

Without a MODULE_LICENSE() declaration, won't this taint the kernel and fail
to load due to unresolved GPL-exported symbols from the core KUnit framework
(such as __kunit_test_suites_init)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad9910-iio=
-driver-v9-0-459d1df5ac56@analog.com?part=3D7
