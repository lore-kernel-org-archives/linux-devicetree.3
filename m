Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908F3B52EE
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263347; cv=none; b=qE/ZQNGEcH2Vi8A0M3o1i3zU1WUoX2Bg79w0PVAaZ4puxeVLSuVf0tAcrjw0xrEhnpCAb9crNCCWb5acF2ciTinWOb0LiYe+1gYIxibF5+cmoX0ZIsfpJADpT5HU4+RRH5PdhEdtE6A1ir2mXjo1MGfLSDVZp2FAp2SHUwrzF2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263347; c=relaxed/simple;
	bh=/LRe2eXD0gKUbjanV6UHpDbCaoLCP45L2a9gBX8qZmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJ1pTp26Wy5v7zO0pS/s0Zsdd6uQcQ4fHr/AY1nEd6OGaXltmfcp05kcoTJ9YvTCjcyHOVqwOAx7OCZWDTUeJG6pBvYwHBCq0zduztzY+o0ggN4I9Xmh43e8mQ6FBKwz4cz+OCDsrXyDKgStCveRN4DGWachAZ+m4t6Yhfz4+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ce/2BhlF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ce/2BhlF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CE71F00A3E;
	Tue,  1 Sep 2026 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263345;
	bh=t8CB3Kr/s6Z9zrGxkkQwOcxU2ceXbA4biiHcngD+pOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ce/2BhlFYPNucqXHXAC8kDGbpZEp1JoxA5fLfg2coPSEDQh4veP/QnVUXt2UWasJN
	 Rhb2moK8Dxl4lM4wuAmLymbJhkaBDxOSWhjFqSKEIzPTdsuGiS4nAKhsLUbo2kxD2y
	 HxhV/3pqYXa4koe0rbbPIJxp0I+uXdpzTbkyKOCBAQ5L28NOlvUAwqhTVoI3u6vXlw
	 DbeAFJUEZ0GERcteIHE8Sv807MSgp1MIZ/ixltl4bTi0w50zXyzebWY9IqwVqRL7c3
	 W+CCj/4C3ai42i82YICEDNSeRcdR0RzOwmKLNc97/8Q4qv6ZlNW6koS/ugo/NSyXoy
	 fGcWO7DNnoa4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] i3c: mipi-i3c-hci: Support address-indexed DAT
 slots
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-2-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-2-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:49:04 +0000
Message-Id: <20260901114905.10CE71F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `HCI_DAT_ANY_ADDRESS` is defined but never used.
--

commit 8ebe233a1f220dcff7a28a779f787f8b63ea1787
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Support address-indexed DAT slots

This commit introduces the HCI_QUIRK_DAT_INDEX_IS_ADDR quirk to support
ASPEED I3C controllers. Controllers with this quirk allocate DAT slots
based directly on the device's 7-bit address instead of using sequential
DAT slot assignments.

[ ... ]

> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/m=
ipi-i3c-hci/dat.h
> index 6881f19da77f2..d4c7b03724d37 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
> @@ -14,12 +14,13 @@
>  #define DAT_0_I2C_DEVICE		W0_BIT_(31)
>  #define DAT_0_SIR_REJECT		W0_BIT_(13)
>  #define DAT_0_IBI_PAYLOAD		W0_BIT_(12)
> +#define HCI_DAT_ANY_ADDRESS		((unsigned int)-1)

[Severity: Low]
Is HCI_DAT_ANY_ADDRESS intended to be used in this patch series? This macro
is defined here in drivers/i3c/master/mipi-i3c-hci/dat.h but never referenc=
ed
anywhere in the codebase or in the remainder of the patch. If it is unused,
can it be removed to prevent dead code?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-i3c-hci=
-ast2700-v1-0-19909e7cbd7e@aspeedtech.com?part=3D2
