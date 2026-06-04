Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB644949F6
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592804; cv=none; b=iDCU7tqV6/51ka3posUy6Vz9d4barGcfO6R0a2FBc+/Q/ziZXBo5ewKTJbZwG2WEdhACaLwgrjA4Nur3RG9Z14d3Qz3Rk2cwxGFocQydhWb3ohZh3tm4PPBmll3ec+6bOAX/VzJmt2vpweI4hazOHV3V1yqtSs+KITvL3U/hP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592804; c=relaxed/simple;
	bh=RiIyWK6ast6ru52FaiSCkBHGIxCbVQIRbAeWyfRrAXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BQupus1SblkToTtsRrOjDtfc/voR+DJWWP3CKQ9bWJOwYtzgTVT6iKM/dCkuqGbxFQcICEJCzQ8H6gFO5G8sP78VbMzAt3b5oDlVOQBtWmGNDD8waE1DkGbE0YTI51J0QzUkQv7KwhA/wWQakQxriFH/fLnrdJJZPl9s90FwppY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEKkuMZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEKkuMZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBC01F00898;
	Thu,  4 Jun 2026 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780592800;
	bh=2rOfANQSG30HOdzGG9ZkK07YKtaM/9dFPkt277l8A78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEKkuMZfwcwyzgdKgozTPl4qOFawi4KsURSltQIJwQ3mg+j9H1TN8YWgsXhmIbQ6A
	 ytjzmGmLb7+8JpsdqfGCrZgjnw/W7Kr/mkEZ1UJLH/6Ce/fmiS9Ijcf3ZxtuwYOSVe
	 rlsKqI7lhWCkJE1UWYuwQwzZr6SpDtRNrrPo7u7y54/wK7SV0DnS2P/jNlI1vng8JC
	 uG9b2ETHC1oEdUv0SXUvJ7V4R/XgNLwJubR4IbNZYbk8O09IcRSCIjnBhfg7vjrysz
	 XhWsG8zS0aVQjwGq4YWZorZBbAlsS2JFGUxfzOwtd30dv/1qlwVxi33Cw7xNDt0BoB
	 9loKolmKyWhlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604165210.1141842-5-pavitrakumarm@vayavyalabs.com>
References: <20260604165210.1141842-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 17:06:39 +0000
Message-Id: <20260604170640.3CBC01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Kconfig symbol `CRYPTO_DEV_SPACC_HASH` selects a non-existent s=
ymbol `CRYPTO_MICHAEL_MIC`.
--

commit 5b42eeec08a6835428f268bf6ab818260b6818d2
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile

This commit adds the Makefile and Kconfig definitions for the new dwc_spacc
Security Protocol Accelerator driver.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> index 0000000000000..f9752e6f664b8
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig

[ ... ]

> +config CRYPTO_DEV_SPACC_HASH
> +	bool "Enable HASH functionality"
> +	depends on CRYPTO_DEV_SPACC
> +	default y
> +	select CRYPTO_HASH
> +	select CRYPTO_SHA1
> +	select CRYPTO_MD5
> +	select CRYPTO_SHA256
> +	select CRYPTO_SHA512
> +	select CRYPTO_HMAC
> +	select CRYPTO_SM3
> +	select CRYPTO_CMAC
> +	select CRYPTO_MICHAEL_MIC

[Severity: Low]
Does this select a non-existent config symbol? The CRYPTO_MICHAEL_MIC symbol
does not appear to exist in the kernel tree. Referencing a missing symbol in
a select statement can cause silent Kconfig failures.

> +	select CRYPTO_XCBC
> +	select CRYPTO_AES
> +	select CRYPTO_SM4_GENERIC

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604165210.1141=
842-1-pavitrakumarm@vayavyalabs.com?part=3D4
