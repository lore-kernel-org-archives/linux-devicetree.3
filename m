Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5CB5CDF1
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647154; cv=none; b=Mw9btwScYHjooNrtFCY7N8oKHZGCLnJhvLgNVY4l0hyNREeqR1lfPVIguHrYm6qW5Dp3qICa+OFVP1/MuU77RvE+FXAuB/7GIhxg9KbWz8BOJ1gMeMIL7OLSDNAgLnU6E1V3+D+t8as9O8G4EKbTbsMFpjMkQN6lEXbIVbXmvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647154; c=relaxed/simple;
	bh=A2sQPhAkffoWUFBdJ18+kOvSk+13itYj6Ewc88IgLE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rf6+0aGhGrAEePdw0lFuHuE3xY0FuyZge8OmLZ/ycsFzRTxeaYPFUNuE12lN43XCoTll/F5jWdephK7lHK2rlcpmIgXUcQMrEgJtYmmGEJLz4tpFZUAbAWGN9n6qTIdXOk4zUEWQcDY5/F2LoDpBwYbVonireIIsIpxeE8T6hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkQfjH/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkQfjH/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF624C2BCB7;
	Wed, 13 May 2026 04:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778647153;
	bh=A2sQPhAkffoWUFBdJ18+kOvSk+13itYj6Ewc88IgLE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DkQfjH/NAjiWFgZyM8RpamELgupmEQ0dl4wGZr9r0+I++CNLjK/D+YsvjvuLBPTT6
	 JljIF8GI9MRo52urbmDWHa6PPMGUx1N7p9ftKYnNeRokJfyU8NDyMCALcWbDuxOWR6
	 /P5yu1nU+tNO7AnJ31xEwnRDR7az6HaxAwyMc0JYsHne3VtjNGS/QDZwzUSpiU/qt4
	 09cAQXWHJoVOpyLk+LHw9TZMZE+Rw83ZY9PKM2FdhMY/rB+TGwOLlssT8EBOuYHSGC
	 RH3ePctSF7R6jtirjsb/xX/m2bGxXMoaGD9QTxPsWl2JmqlBYTWCppXVsfIUnqlvLx
	 DkAI3wz542vpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/6] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-add-airoha-an8801-support-v3-3-1edb34e363ae@collabora.com>
References: <20260512-add-airoha-an8801-support-v3-3-1edb34e363ae@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:39:13 +0000
Message-Id: <20260513043913.AF624C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing explicit `#include <linux/wordpart.h>` in `drivers/net/phy/=
air_phy_lib.c`.
--

commit a5ca176575453118a1f5a166311004f5cc86600c
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: phy: air_phy_lib: Factorize BuckPBus register accessors

This commit moves the BuckPBus register accessors and definitions from the
air_en8811h driver into the shared air_phy_lib code to allow reuse by the
upcoming Airoha AN8801R PHY driver.

[ ... ]

> diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
> index 8ef5af4becf03..687c59197b163 100644
> --- a/drivers/net/phy/air_phy_lib.c
> +++ b/drivers/net/phy/air_phy_lib.c
> @@ -15,6 +15,186 @@
> =20
>  #define AIR_EXT_PAGE_ACCESS		0x1f
> =20
> +static int __air_buckpbus_reg_read(struct phy_device *phydev,
> +				   u32 pbus_address, u32 *pbus_data)
> +{
> +	int pbus_data_low, pbus_data_high;
> +	int ret;
> +
> +	ret =3D __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
> +			  upper_16_bits(pbus_address));

This isn't a bug, but should linux/wordpart.h be explicitly included in
this file?

These functions rely on upper_16_bits() and lower_16_bits(), which appear
to be pulled in implicitly through other headers.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-add-airoha=
-an8801-support-v3-0-1edb34e363ae@collabora.com?part=3D3
