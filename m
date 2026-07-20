Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4E740681E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548410; cv=none; b=RoGNOTe7BnTzd8eI4UDgG1B2I4jBXMT3JFjEnN+iTeZS79ZAlWvJp8s/zjL/ktnUVsZ7faR1r/ABxteSg+jqNF23JoZQFSpMkOHmVuynZcnhRbRGnm2G1QWI8titLcQ5ehhlg0hHFl7rAwR8ROFIk+b3kq6vHqpJND3E9DPJrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548410; c=relaxed/simple;
	bh=FDG1DJqo8QRZku0I/aOsHn77dsoDKWFGvr2kfQNd0mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFz+hmSVX/v9WIdy22BfdImTZiouPHnbSRwdfNtzBtn/w7LWWGyDjtaqd/Rk+NyiV0EVqTDbUYtBAjrcUqvdocqXZ3b5uqnGjYMsfeW1s+DB9pLqi3od8qeU01DlRqB2SYpZHvhY2SmsI5/J1UwATTsLDUV23VYSjD6UkSWWY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxvQLnrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxvQLnrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0A31F000E9;
	Mon, 20 Jul 2026 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784548409;
	bh=7NFjs5higp4YziI5YE9tvz5ZIgoclRJT4UwVMMdNZKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZxvQLnrSAQHPTePCJN7JNMGq3x+Yq6Asua/OcN5ou2pGyoEnQ4N/foex4wJNa277U
	 B69D4sUd82C1nRtz3siGJ/gpcTcT02DHQIHefOLsq3TWSMivhe5GFhxmKcSC7u3N9P
	 aHTX9D89LfhbSZ8vmfkPhRLSizzaBEUNBJVWv0dArFiG4WoPjjTGCz90P4NvgpOHF/
	 j5EXUZrlJEXWROVQ78IikozyDwKOEcsL7AeNLBuOChEykQv0nxNTxJuA8OxZkFk85F
	 6CP4yf3XdHqCQ1y03DuJH9q7rkC5CK1RVz/IWeps9eAnPlzfK2xYIrEm/SyFB8ki/n
	 Sj2dZYgA+1NuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720113740.64960-5-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
 <20260720113740.64960-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:53:28 +0000
Message-Id: <20260720115329.3D0A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] CRYPTO_DEV_SPACC_HASH is defined as a tristate option but controls =
a component of a composite module, leading to an undefined reference linker=
 error when configured as 'm' while the main driver is 'y'.
--

--- Patch [4]: [PATCH v17 4/4] crypto: spacc - Add SPAcc Kconfig and Makefi=
le ---
commit 6d5d2ec49262f31f1558921632e08b8a62362a2d
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile

Add Makefile and Kconfig for SPAcc driver.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> index 0000000000000..edc550562235e
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig
> @@ -0,0 +1,83 @@
[ ... ]
> +if CRYPTO_DEV_SPACC
> +
> +config CRYPTO_DEV_SPACC_HASH
> +	tristate "Enable HASH functionality"

[Severity: Low]
Will this cause a build failure if CONFIG_CRYPTO_DEV_SPACC=3Dy and
CONFIG_CRYPTO_DEV_SPACC_HASH=3Dm?

Since CRYPTO_DEV_SPACC_HASH is a tristate, it can be set to 'm' while the
main driver is built-in ('y'). If that happens, Kbuild will add
spacc_ahash.o to snps-spacc-m in the Makefile:

    snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) +=3D spacc_ahash.o

Because snps-spacc is built-in, Kbuild ignores the -m list, meaning
spacc_ahash.o won't be linked into the final kernel image.=20

However, IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_HASH) evaluates to true for 'm'=
=20
as well. This can lead to undefined reference errors when spacc_crypto_prob=
e()
tries to call spacc_probe_hashes() and spacc_unregister_hash_algs() in
spacc_device.c.

Should CRYPTO_DEV_SPACC_HASH be a bool instead to prevent this mismatch?

> +	default CRYPTO_DEV_SPACC
> +	select CRYPTO_HASH
> +	select CRYPTO_SHA1
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720113740.6496=
0-1-pavitrakumarm@vayavyalabs.com?part=3D4
