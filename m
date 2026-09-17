Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FDA466B0B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642864; cv=none; b=iBNnoTQhxeoVd4aOOFzBelvDm0XvPzIJOR4aiWOF/OEgRzO6KkMVFXDIAGWS3bSq4UDtf6GS5nYVbN9xRdycqv6Y45WbynzRdtYQMYvCpU0pYgHtmGHHNSAlmE3HrysGKuXJchit0gADwwoJfWwPmRXE40PJqyJWPZHQWwrqhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642864; c=relaxed/simple;
	bh=8DZjTA+0D8XoZA8tul4LzzNhX3/tVK+q7i6N1jGj0s0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pKjponv0q+jOcF580b3OebRiNfuY803bR8+ZIGRiwPyYi9M1cABAMMDJaKNYkMIRQ1yppFYMcj+bpBcFkiNlZ/PaGJb4NriN4sJvybRSn+hsVR/TLnhvJuNxzg7RoPaQDFeDXMsiZLxiWEfxBc79Bl3/aaQ26LyQxxPBo/dc1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKCN6ptL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKCN6ptL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5185A1F000FF;
	Thu, 17 Sep 2026 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642854;
	bh=3ZT3WJBwjd6hmlc7jLiobs5bHhmP6T/lmSqHkfx/rgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKCN6ptLGjitN/OamjfjNhn1O6mBA43UvNBINVj5fL5lzb3D4cY/ekIUSeZgLxL6j
	 OyIE12jPyJvYxscnICc9ur5r/QwPWtn07qPwUkq6gE1kSXMrRnLfWrBF3XKI/v69VB
	 /X60cNDSSQ+fKcN0I9sHgtqetuheN2/ggA6zCeSDhAyZ4U9QDBG9y1XR2Z/vSdKByt
	 myFyVorsAgRnJ0C86gAHIG8NUWfxnPxhZSL5cXSwsJus5K56JSuIzzlD7uQ3z23dJU
	 hqkR0Ob3guUrY5DfNJT8wjuIws+wDuu+VSIchORt5N568ooJkz0UmWGUnioXxrM+aF
	 L3VVuPYb3UxjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916105504.3262767-3-kyle.switch@motor-comm.com>
References: <20260916105504.3262767-1-kyle.switch@motor-comm.com>
 <20260916105504.3262767-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:00:53 +0000
Message-Id: <20260917110054.5185A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] uapi: use of kernel-internal GENMASK in UAPI header
--

commit ccf2fd652b5c489e327ab08ec390f834e2c1b18b
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA

This patch adds support for the 10GBASE-T PMA Template Test Mode register
field. It introduces standard MDIO macros and helper functions to select
one of eight test modes used for PHY validation.

> diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
> index 06f4bc3c20c71..353ca13c64fca 100644
> --- a/include/uapi/linux/mdio.h
> +++ b/include/uapi/linux/mdio.h

[ ... ]

> @@ -320,6 +321,17 @@
>  /* PMA 10GBASE-R Fast Retrain status and control register. */
>  #define MDIO_PMA_10GBR_FSRT_ENABLE	0x0001	/* Fast retrain enable */
> =20
> +/* PMA 10GBASE-T Template Test Mode Register*/
> +#define MDIO_PMA_10GBT_TESTMODE_MASK GENMASK(15, 13) /* Template test mo=
de */

[Severity: Medium]
Will this macro break compilation for userspace applications?

GENMASK is a kernel-internal macro defined in <linux/bits.h> and is not
exported to userspace. Any userspace program attempting to include this UAPI
header and use MDIO_PMA_10GBT_TESTMODE_MASK will fail to compile due to an
undefined macro.

Could this be changed to use __GENMASK() or a hardcoded hexadecimal value
instead to ensure it is safe for userspace consumption?

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */
> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916105504.3262=
767-1-kyle.switch@motor-comm.com?part=3D2
