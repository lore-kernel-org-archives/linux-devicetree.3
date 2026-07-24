Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E0339382
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934559; cv=none; b=ct5y02XezvLJsBzjJG3dduz0uyOulLMYUCRDMHI/El/V5ftpzgL4mRFQhqBVErVNHTkhE8xRY4+E0rTgyAz1tDljUen2A51p5oFtMb5FdqVh1NDssGO0392fJiJWOOAMC3XCmHARFNaoUG9b25Q7fAzN6gkcN61PXwYUQpHYqTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934559; c=relaxed/simple;
	bh=7NErWPPwTksuDyDsIyZYt1gzH4mmFsojiBNOcuIO9Fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PHQ9HONPBubjWYIrGUM9HXbfBv2jI2TG0ojfz4Nzv+f2/13lS4kVvDDAGKBDEO0OKD8R7hqQLsNMIhptaXk2lIyWJCigfA4uOQinMV4oIu4YmmNMilzpKhY59afPq4JGQXDB0ni43SkHR6Hr3x6TfcJBUOMn2GgaKlqkfIY07a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Twd9TLWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Twd9TLWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4B71F000E9;
	Fri, 24 Jul 2026 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784934558;
	bh=Xfa3cAlHGBdW9UPj0ROfMt9224hZO03twOS2RqkoYe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Twd9TLWULQAfsgYudqDmSvLWqaNZcPW/xZ6sYDqmN9sRExjRisEMKyWwsOxvnWvI5
	 WHT26SIm/OstfQit2FNFkLetDbiQK2RIN23e6k6b4mSfUmwwVawVWJhir/m9fDEKyA
	 B4Z5fqv7Y0KCyXZkEMW9vGDoEWcSdFPw4kY4gMZB/Rl8QozZ4MrgNkAxFI7MAYkL+a
	 u7qCg5VKYaHxoTgvwQ565wTYgkjVrsmw1/WhuwhSxOsp+3gdjt36fPfZtj6pTQDE7G
	 q8Nqf2R2BNaFppAn01V82rFK0gR07zy0/NLEQ1v/7U7kxOh/BSItxaOY6/1nDCMMGZ
	 ubZkXCl0uUx8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dpll: zl3073x: add ZL30643 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-for-upstream-zl30643-v1-1-ea93ba4d85c8@free.fr>
References: <20260724-for-upstream-zl30643-v1-0-ea93ba4d85c8@free.fr>
 <20260724-for-upstream-zl30643-v1-1-ea93ba4d85c8@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 23:09:17 +0000
Message-Id: <20260724230918.0F4B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete Implementation: Missing driver support for microchip,=
zl30643.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: dpll: zl3073x: add ZL30643 compatib=
le ---
commit 890eef3f2bfb25bd5d633b88f0a74281dde779f7
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: dpll: zl3073x: add ZL30643 compatible

This commit adds the microchip,zl30643 compatible string to the ZL3073x
family device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yam=
l b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> index fa5a8f8e390cd..13ea55c2c1467 100644
> --- a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> +++ b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> @@ -18,6 +18,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - microchip,zl30643

[Severity: Medium]
Are there accompanying driver changes for this new compatible string, or is
this regression expected to be addressed in a subsequent patch in a series?

If a device tree uses this new compatible string, it appears the device will
fail to bind and probe. The zl3073x_i2c_of_match table in
drivers/dpll/zl3073x/i2c.c and the zl3073x_spi_of_match table in
drivers/dpll/zl3073x/spi.c currently do not include "microchip,zl30643".=20

Additionally, the commit message mentions the ZL30643 has a chip ID of
0x0E3B, but this ID is missing from the zl3073x_chip_ids array in
drivers/dpll/zl3073x/core.c. Without it, zl3073x_dev_probe() will fail to
identify the device and return -ENODEV.

>        - microchip,zl30731
>        - microchip,zl30732
>        - microchip,zl30733

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-for-upstre=
am-zl30643-v1-0-ea93ba4d85c8@free.fr?part=3D1
