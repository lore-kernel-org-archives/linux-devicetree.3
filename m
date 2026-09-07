Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768F503BEB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797818; cv=none; b=YUaaBVTY1/wtUm08Y0+W3LnSdqbygtFfj2b3icAVj8KCVKu0kHSb0ta98isnaIGdOkQJugBnbI64BDaY8timVK4G2oMUfJRuA1VVH7c5PkJldxhUy0s9eqP9a4S1oYggT1WVjjuqeIn44fbMDPXwVWSRSbWSFaEIKCCWrDx+AJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797818; c=relaxed/simple;
	bh=pLaZ8byfigkB6/B+ANnSDOgPqlLSHcnrylq6xDeR6KM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JX3iWTbNAfni9JSdbRzBXhdHgMg0GaF4IjU+SHlbuk8sFlkf7dwzZ3NxHbcCE7zjUcrDPG+DthAWdsZBXtL0KuIoW67H2U+0ppW5DV8SUnx4Y4fcfadQ0GZh4OCV1k0ctbfDuAvqvRpAgLJaN3JJEp2bOgg7MAV4TAPE0MFAA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKlwGZHm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKlwGZHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ACE1F00A3A;
	Mon,  7 Sep 2026 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797812;
	bh=HH6TFs9bUMRb7k4C888bpXDswz7sXep1XjFK6hUhdvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKlwGZHmWr3yfRikxzTO0UG+c+oNtr2cN3EfOQ8DpSwR8hDJ2rp4PRes1pFiQZFXC
	 HoFdkLRviLE8Jb7HqJXV6kvxnR9H7JoCbFyKwO936hhLsFcq+vA3h+L8+AgSdw30wD
	 8Lk3lAIeF8AknWj6gyVcHC5y/+XXAR2TKn/McIEDlkyK+ZSCKBu6ieUf+Io2LvMhC2
	 PVYYcAZZvPG7XZY1ECHKllnzanwzqWsBA1T/sMABIKyxwHPfnZRuREyhJFOpXj1eSJ
	 UDVzG3XoCTHRe8Jq2bwPm9+jeW84JLKym0h8WVpoHl1m+Kjw9G6S+LO0+OHWmIFBQD
	 hnCtm00JDqwdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 3/4] crypto: spacc - add spacc autodetect support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907155916.999153-4-pavitrakumarm@vayavyalabs.com>
References: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
 <20260907155916.999153-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 16:16:51 +0000
Message-Id: <20260907161652.11ACE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Enabling CONFIG_CRYPTO_DEV_SPACC_AUTODETECT silently disables all =
cryptographic modes on SPAcc hardware versions older than 0x65.
- [Medium] Missing test data for 128-byte keys (index 6) in HMAC algorithms=
 causes AUTODETECT to silently disable support for these key sizes.
--

commit 2c35c365b958705d275e5d39cafb845426670a0c
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date:   Mon Sep 7 15:59:15 2026 +0000

    crypto: spacc - add spacc autodetect support
   =20
    SPAcc is configurable and it supports the below modes:
    1. AUTODETECT configuration - Autodetects the supported algos.
    2. Static configuration - The algo support is defined statically.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index 910916a1fe000..e0935d04b6964 100644
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -201,6 +201,907 @@ static const unsigned char template[] =3D {
>  	[CRYPTO_MODE_MAC_SM4_CMAC]      =3D 130,
>  };
> =20
> +#if IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_AUTODETECT)
> +static const struct {
> +	unsigned int min_version;
> +	struct {
> +		int outlen;
> +		unsigned char data[64];
> +	} test[7];
> +} testdata[CRYPTO_MODE_LAST] =3D {
[ ... ]
> +	[CRYPTO_MODE_HMAC_MD5] =3D {
> +		.min_version =3D 0x65,
> +		.test[1].outlen =3D 16, .test[1].data =3D { 0xb6, 0x39, 0xc8, 0x73,
> +			0x16, 0x38, 0x61, 0x8b, 0x70, 0x79, 0x72, 0xaa, 0x6e,
> +			0x96, 0xcf, 0x90,  },
> +		.test[4].outlen =3D 16, .test[4].data =3D { 0xb7, 0x79, 0x68, 0xea,
> +			0x17, 0x32, 0x1e, 0x32, 0x13, 0x90, 0x6c, 0x2e, 0x9f,
> +			0xd5, 0xc8, 0xb3,  },
> +		.test[5].outlen =3D 16, .test[5].data =3D { 0x80, 0x3e, 0x0a, 0x2f,
> +			0x8a, 0xd8, 0x31, 0x8f, 0x8e, 0x12, 0x28, 0x86, 0x22,
> +			0x59, 0x6b, 0x05,  },
> +	},

[Severity: Medium]
Since .test[6] is missing in testdata for these HMAC algorithms (MD5, SHA1,
SHA224, SHA256), outlen evaluates to 0. Does this cause AUTODETECT to
silently disable support for 128-byte keys?

[ ... ]
> +static int spacc_check_modes(struct spacc_device *spacc, int algo_mode,
> +			      int keysz_idx, void *virt, char *key,
> +			      struct pdu_ddt *ddt)
> +{
[ ... ]
> +	if (!testdata[algo_mode].test[keysz_idx].outlen) {
> +		spacc->config.modes[algo_mode] &=3D ~(1 << keysz_idx);
> +		return 0;
> +	}

This is where the outlen check evaluates to 0 and clears the capability bit
in spacc->config.modes, causing a feature regression compared to the static
configuration.

[ ... ]
> +int spacc_autodetect(struct spacc_device *spacc)
> +{
[ ... ]
> +	for (x =3D 0; x < ARRAY_SIZE(template); x++) {
> +		if (!template[x] ||
> +		    spacc->config.version < testdata[x].min_version) {
> +			spacc->config.modes[x] =3D 0;
> +			continue;
> +		}

[Severity: High]
If CONFIG_CRYPTO_DEV_SPACC_AUTODETECT is enabled, this loop clears
spacc->config.modes[x] to 0 for all algorithms on older hardware versions,
because min_version is hardcoded to 0x65 in testdata.

Since spacc_autodetect() returns success (0) instead of an error on older
hardware, spacc_probe() will not fall back to the static configuration.
Does this render the hardware accelerator completely unusable on these older
platforms by silently exposing zero cryptographic algorithms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907155916.9991=
53-1-pavitrakumarm@vayavyalabs.com?part=3D3
