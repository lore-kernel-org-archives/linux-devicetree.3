Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4AC37F314
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622662; cv=none; b=PzZ7Ks4VT4u6mPy4/OYJ24KbaItke97OdMIdqnWch9gQvO8h5UmGRuTYHA+I70C1lqbzc/YLSEvo9syAgyTDgHiG5OXZgHT54p8F/XWrM+emPTe0x7CCvTTCeEcYPPkAXiTwV1dkRRgpV6zBKdmm8i/wOhNHBUYxZQM/8I3+aIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622662; c=relaxed/simple;
	bh=yVOXKPo/4AqurAr1Mqu+w+t3cscMkllmuovos0NmHDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLR9ypbIgl+da7qDE1DTr19Bh96RgZKpv3AsdGLjgXj+w0XZhPWKhHsfgh+FTNNgX29Cl9yOkURz7jgfbKtRTKV91Qk5mae4a1z0HH+Rw8RItZS9wxOUu5TeSIDxdbGWwfPjokzjSBMZ5EpoWELfgBFaqqyUV3EQe+qr9AlKFI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2mTr/US; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2mTr/US"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02181F000E9;
	Thu, 13 Aug 2026 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786622661;
	bh=RH+akjL59uTwfGPNjMKQjiAKq35feR5BccOP6dhUKhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2mTr/USeGfmsfPQO/RTd0inOPgNjM33cVLoGo6eTIAXte2r6evWGJgO3cfa621KN
	 mDYNOor9LwMJYOR4dSyC6Uh1z/FrYfqUuCdlnrqOU/lq5QIGn4IuH/LCU4bnm/aLcN
	 BCly+3XUrdSDKMZnMZsApEZiLGOp4281hpqI+nTMiHQ8hzzHqsGBUrvjfBaxqr83qb
	 a6YPsMAFwMYhDXpbNHP4Uk3SXREx4ODUZJCFgZaxM2f/x+Ys+pQtKKneVvAblC5yGF
	 znAeyBvVfZdjBhoVuf+xdz4GYCsuiRipFjMO/8fcDKEZGPqLY0j4x18wDEYqyBPX2l
	 AMddmz3NtVOLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/15] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-9-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
 <20260813-anacapa-devlop-phase-devicetree-v5-9-c7058f63dc67@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:04:20 +0000
Message-Id: <20260813120420.D02181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Signed-off-by from the patch author.
--

--- Patch [9]: [PATCH v5 09/15] ARM: dts: aspeed: anacapa: evt2: Add shunt =
resistor values for HSC monitors ---
commit ed139ca587bbe5fe1cadfdeab9c5f4d6712eff09
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: evt2: Add shunt resistor values for HSC monitors

This commit adds shunt resistor configurations for LTC4287 hot-swap
controllers on the Anacapa EVT2 platform. It configures the values to
150 micro-ohms or 250 micro-ohms depending on the rail to ensure accurate
current and power measurement by the driver.

> Author: Colin Huang <u8813345@gmail.com>
> Date:   Thu Aug 13 11:59:39 2026 +0000
>=20
>     ARM: dts: aspeed: anacapa: evt2: Add shunt resistor values for HSC mo=
nitors
>    =20
>     Add shunt resistor configuration for LTC4287 hot-swap controllers on
>     Anacapa EVT2 platform.
[ ... ]
>     Without this configuration, the reported readings would be incorrect.
>    =20
>     Signed-off-by: Peter Shen <peter.shen@amd.com>

[Severity: Low]
This isn't a bug, but there appears to be a mismatch between the patch
author and the provided sign-offs. Is a Signed-off-by tag from the original
author missing here to satisfy the Developer's Certificate of Origin rules
for kernel submissions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-anacapa-de=
vlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com?part=3D9
