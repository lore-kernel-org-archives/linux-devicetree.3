Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD63A5443
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314285; cv=none; b=jmbkwkpp00bH7FJuZKhVhEyfyBjtYxNolmqre7gYzg55v2xxM0hC8xS6X3ZspTk2+1kw/1W0fjvwcpnS66DYojb2FRmg1tWU+e7ZMrWhrolvUYoGRkhZvagh6J/g8rWrDIhKDRysu0rJCpcNPuNdmtGGkKfVJy2pP/EVZzYbDr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314285; c=relaxed/simple;
	bh=kEJomMgTTD6/oaos7Nc71ltDbL2Llq4s0B7LUZwHMBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tt2bwYu8II3DQKqLp59302YS3JmlHnMPfTp0So1xllXeys8CfUe6NLA0yoOA76TqFeHx9t1eup/nx5B1+Fyly38SxUzZsKSrqN8vc6QpYI1Jr/XnJf90i3zquairyPF14Im0zf87m6SFJyinxG050YmA6XNEliIEDWwNdLFKUVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACcK3YsM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACcK3YsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C211C1F000E9;
	Wed, 29 Jul 2026 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314284;
	bh=ZVTcuqIld6z37Q+Zc009+TPXXhuOVmh81KrgI0vrtKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ACcK3YsMU+ae6FXfHZozjyRb7MDKL9j4A/krk1T7S5yODXBDOvziUaj3aryjQ1HyP
	 Bs3oPnpU3yRrbIqxRi73Bm4IysMuZ1F6r8bKSuLaqhU+Uep1IH8yr2JWpiJvj1b13B
	 gzC4akuiF5bcUqGNU+pn41hdlGvJpzD2wZIz5yn4RHvjjl1fM3tIfwy9pQeti7qRwz
	 /1woDpdfRfZJd+B5zh/ZBLOPWe3sr9cpS+1SmIpJmEp8nOAsO+7lWUSGKYo2Aty1J+
	 m33KJ5/ps2NkX72iBzGZqWmavP4/ak3zo4vbvxiPTm1kJstIaBKZxvR0OwCpsGkclc
	 Ab6KuGT58V2AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/17] iio: test: add kunit tests for channel prefix
 naming generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-ad9910-iio-driver-v10-7-aa1f6167729e@analog.com>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-7-aa1f6167729e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 08:38:03 +0000
Message-Id: <20260729083803.C211C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Kconfig help text incorrectly claims that the tests are compile=
d into the IIO core module.
--

--- Patch [7]: [PATCH v10 07/17] iio: test: add kunit tests for channel pre=
fix naming generation ---
commit 1dfc71650388b9628c03d727921e09ce430c3fe7
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: test: add kunit tests for channel prefix naming generation

This commit adds a KUnit test suite for the __iio_chan_prefix_emit() helper.
It exercises various channel prefix generation combinations including shared
modes, indexing, and error paths.

> diff --git a/drivers/iio/test/Kconfig b/drivers/iio/test/Kconfig
> index 4fc17dd0dcd77..7d2c29cc583b9 100644
> --- a/drivers/iio/test/Kconfig
> +++ b/drivers/iio/test/Kconfig
[ ... ]
> +config IIO_CHANNEL_PREFIX_KUNIT_TEST
> +	tristate "Test IIO channel prefix" if !KUNIT_ALL_TESTS
> +	depends on KUNIT && IIO
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Build unit tests for __iio_chan_prefix_emit(), the helper that
> +	  builds IIO sysfs attribute name prefixes from an iio_chan_spec.
> +	  The tests are compiled into the IIO core module.

[Severity: Low]
This isn't a bug, but is this help text accurate regarding how the tests
are compiled?=20

Looking at drivers/iio/test/Makefile, the test is built as a separate
object:

obj-$(CONFIG_IIO_CHANNEL_PREFIX_KUNIT_TEST) +=3D iio-test-channel-prefix.o

rather than being compiled directly into the IIO core module itself.
Additionally, the iio-test-channel-prefix.c file explicitly imports the
EXPORTED_FOR_KUNIT_TESTING namespace, which further confirms it acts as
a standalone module testing the exported core symbols.

Could this description be updated to avoid confusion about where the test
resides?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-ad9910-iio=
-driver-v10-0-aa1f6167729e@analog.com?part=3D7
