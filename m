Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29D472774
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808913; cv=none; b=M43kg08OsH/d0T8qNGZ8nLuCxtlwZcCrgi22Z0CoNvZr0tHcuv0AMpePLcsiSdKi+ZdfSCUR9pq5Ckp1pgZ8FqEhuc1/sKemX10n+b8v6GdmwGqVijQHH8jnUkzKvjc5adR26S9Qrz6r5+OeaecXrikYQkOaHw3IySbPbUZCGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808913; c=relaxed/simple;
	bh=mfPAupN/O5Ei4yv+5kNms5/QtRAgAaWpeH1Np8BLSoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mjrdg3AmuWiJIKZkyKQOhsRmYmYHgRShfCCtzO5/oM3ts/FIVDin9UIQFfywxUYW5nXxLBOJDJTdwmuRhS7Iyl+LwQtDOyvkqGSOiLaS3Bl/D5TJT282zWPj4bdsb9u0KM0wWrpIWK+oei0A47esE+yHqJJ56lLd68UBLHwbMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E2E1F000E9;
	Thu, 23 Jul 2026 12:15:08 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723120156.285270-5-pavitrakumarm@vayavyalabs.com>
References: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
 <20260723120156.285270-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:14:39 +0000
Message-Id: <20260723121509.00E2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] A `bool` Kconfig option `CRYPTO_DEV_SPACC_HASH` selects `tristat=
e` crypto algorithms, which forces them to be built-in (`=3Dy`) even when t=
he main driver is compiled as a module (`=3Dm`).
- [Medium] Hardware-specific tuning parameters (arbitration priority and wa=
tchdog counter) are hardcoded in Kconfig.
--

--- Patch [4]: [PATCH v18 4/4] crypto: spacc - Add SPAcc Kconfig and Makefi=
le ---
commit 1a5158f785caf71e111384b68f165f725e321ebf
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile

This commit introduces the Kconfig and Makefile configurations for the SPAcc
driver. It adds options for driver inclusion, hashing, debug traces, and
hardware-specific tunables.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> index 0000000000000..bf70adc1a2084
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig

[ ... ]

> +if CRYPTO_DEV_SPACC
> +
> +config CRYPTO_DEV_SPACC_HASH
> +	bool "Enable HASH functionality"
> +	default CRYPTO_DEV_SPACC
> +	select CRYPTO_HASH
> +	select CRYPTO_SHA1
> +	select CRYPTO_MD5
> +	select CRYPTO_SHA256
> +	select CRYPTO_SHA512
> +	select CRYPTO_HMAC
> +	select CRYPTO_CMAC
> +	select CRYPTO_XCBC
> +	select CRYPTO_AES
> +	select CRYPTO_SM4_GENERIC

[Severity: Medium]
Since CRYPTO_DEV_SPACC_HASH is a boolean option, if the main driver is
compiled as a module, will this select statement force all these tristate
algorithms to be built-in rather than modules?

It looks like this might cause unnecessary vmlinux bloat when
CRYPTO_DEV_SPACC is set to m.

> +
> +	help
> +	  Say y to enable Hash functionality of SPAcc.

[ ... ]

> +config CRYPTO_DEV_SPACC_PRIORITY
> +	int "VSPACC priority value"
> +	range 0 15
> +	default 1
> +	help
> +	  Default arbitration priority weight for this Virtual SPAcc instance.
> +	  Hardware resets this to 1. Higher values means higher priority.
> +
> +config CRYPTO_DEV_SPACC_INTERNAL_COUNTER
> +	int "SPAcc internal counter value"
> +	range 100000 1048575
> +	default 100000
> +	help
> +	  This value configures a hardware watchdog counter in the SPAcc
> +	  engine.The counter starts ticking when a completed cryptographic
> +	  job is sitting in the STATUS FIFO. If the job remains unprocessed
> +	  for the configured duration, an interrupt is triggered to ensure
> +	  it is serviced.

[Severity: Medium]
Does hardcoding these hardware tuning parameters in Kconfig break the abili=
ty
to support a multi-platform kernel?

For systems where a single kernel image boots on multiple boards, different
SoC instances might require different tuning values.

Would it be better to provide these via Device Tree properties or module
parameters instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723120156.2852=
70-1-pavitrakumarm@vayavyalabs.com?part=3D4
