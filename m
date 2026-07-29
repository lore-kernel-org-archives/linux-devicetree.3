Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97EF395AF4
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321534; cv=none; b=ddgBMwX/Jp88udkEai4oMCep9NZE55FlXehiEbJxJvVJhGEacbL51yDeE4cLuGB2JfHQdn4iE1Y6Ht8Wxdco1BF/tclFQ/fpniMhkoYFP335w0zG37pKnu2fEqqFI5NW6rEnR781rbW1liCldJX1XWua3Ui9561cDAdq+OWlNIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321534; c=relaxed/simple;
	bh=5l945be6IsKm4BJgWGrLU7vYt9LQNEpLM9cQS/FmvWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAayPo0FXX/baLNc7dNSGw/DRdsKtKXiIJql8RKSkj3lrs0BbpRQ0/mhLP1cqDx2m3Cb7I988H1LeVIAteyZTs4F6dOKG4kIqWqOA4h/rAn3c2roe/GDPn1BcYrp6nm5xf6h40X8UaamtNI7RrbEzT6YO1oMi4j8K11QxdJHYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyFolm9o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyFolm9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282791F000E9;
	Wed, 29 Jul 2026 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321532;
	bh=oSL86/m+FmrzcXLpJ3pDOHUL9c1KLdmt3STM71WIAn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyFolm9oIdtLvqRn+hIe9Zz+TsPBPyvkqm9C8x3u3zHwy0ETYZhrZV6uac42Mk3d/
	 bX47E0ZhZDU/VFRzUkA2ZMKXQDhXOJxOwTBmgiNFr1JCW5VXQBQvRXU/RCeSwkHpI4
	 FE61YOeo9lla7h1uyiQR/2gNyopzuDNcMSHkg32LrAVuQcvTdAC4xCQcuY6qk+xiML
	 oYskmyI5RyJ461nWFCaAApCAub51IOHETC/Zx4GwyKh2ce5wG/TzPqvB/lbDS2VCXs
	 sw/QbAtFgaX6lhZTMm/xF2TPGYV7pvczgc4Piw/FiMJDXZEp952+w1ZmyqquGty3qE
	 cERtmBw5Ben7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729102547.159890-5-pavitrakumarm@vayavyalabs.com>
References: <20260729102547.159890-1-pavitrakumarm@vayavyalabs.com>
 <20260729102547.159890-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:38:51 +0000
Message-Id: <20260729103852.282791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Hardware tuning parameters are hardcoded via Kconfig options rat=
her than dynamic configuration mechanisms.
- [Low] Redundant 'default n' and inconsistent indentation in help text.
- [Low] Missing 'depends on HAS_IOMEM' for an MMIO-based driver.
--

--- Patch [4]: [PATCH v19 4/4] crypto: spacc - Add SPAcc Kconfig and Makefi=
le ---
commit 976ac00ba3bdbdaaa6d1e32b6172c60030c0e6b9
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile
   =20
This commit introduces the Makefile and Kconfig definitions for the new
SPAcc (Security Protocol Accelerator) crypto driver.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> index 0000000000000..b528c8e47b3b5
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CRYPTO_DEV_SPACC
> +	tristate "Support for dwc_spacc Security Protocol Accelerator"
> +	depends on HAS_DMA

[Severity: Low]
Does this driver need a dependency on HAS_IOMEM? The Kconfig option
CRYPTO_DEV_SPACC_DEBUG_TRACE_IO notes tracing of MMIO, indicating the driver
uses memory-mapped I/O. Without this dependency, randconfig builds might fa=
il
on architectures that lack MMIO support.

> +	select CRYPTO_ENGINE
> +	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH

[ ... ]

> +config CRYPTO_DEV_SPACC_PRIORITY
> +	int "VSPACC priority value"
> +	range 0 15
> +	default 1

[Severity: Medium]
Would it be better to configure hardware tuning parameters like arbitration
priority and internal counter timeouts dynamically (e.g., via module
parameters or device tree)? Defining them in Kconfig bakes the values into
the kernel image at compile time, which prevents configuring different
SPAcc instances with varying parameters on a multi-platform kernel.

> +	help
> +	  Default arbitration priority weight for this Virtual SPAcc instance.
> +	  Hardware resets this to 1. Higher values means higher priority.

[ ... ]

> +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> +	bool "Enable SPAcc debug logs"
> +	default n
> +	help
> +          Say y to enable additional debug prints and diagnostics in the

[Severity: Low]
This isn't a bug, but should the 10-space indentation on this line be
replaced with a standard tab and two spaces to match Kconfig styling
guidelines? Also, the 'default n' on the preceding line is redundant
since Kconfig options default to 'n' if no other default is specified.

> +	  SPAcc driver. Disable this for production builds.
> +
> +endif # CRYPTO_DEV_SPACC

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729102547.1598=
90-1-pavitrakumarm@vayavyalabs.com?part=3D4
