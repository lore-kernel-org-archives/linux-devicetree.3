Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D392F49F6
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026180; cv=none; b=Hw9eVTlwyme8oWrp8yaWJYB/OYKtXfGcsdG/kQXbIVAiwTODrSGomg0Auc0JaAnuDe/oBCkJBqp+Qy3PPv3mWCD51CEGrfdPuiK6EzLtcFApSvGylcfpvzsSYI3kxXVnCIT39wIhvfRSN1R9VNETQK9LHa8YxDXaaRnG6cP/AoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026180; c=relaxed/simple;
	bh=QWa2ZLSFckKMeVwxIYai+EsToX0nNy+3eGgQ0rrDqo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dICu+ts+StnsMWNbCKzqK1diqjbgktaA282bld2thaO3E1dSyQ0JNpf1wRfwLp0RWvxXhEF8EphPNmz0+Q+FQ0i/ViT/5oQ8dKXGUNDnFRAFkMF2FOjSUkpz4FYfwPCfSoDEkKi6eMcq03/06QALsyO/H3IADnkuEN+mmDvMqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fetno/zJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fetno/zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5902E1F000E9;
	Tue, 14 Jul 2026 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026178;
	bh=P75t0rtBVZzTvdRwa9/+74bm860SvIYWvnvjecvf3G4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fetno/zJLMjboufzProXAjnXJm9WySGEFV4uvcVACyWefl3+wSDM8VhrrS4TjgRR6
	 uPdw9OaYKEW+Z3fm4YzFcuIdMMLs5UVzHZr1IZCHw79psNw9yYAMnh+fDC6zuGz680
	 kDyWrU/mPpFuIGzmJnv4sCsG1WdgG8eCmNkKPblXiO+NnnbXiw9fpPAQE2jYNhQZQf
	 NnJmI80inwFflpIcXNRoM9HFofR1F00sErTgx+h1spR+bGKOtZiobwgunHZ4Y9hvgO
	 kaUS2xjO9xO8JsEwDE2yQLMgS09rTX3lUsaLHmIYqJwwAyE/Gfjg4SmDwl4Y7+B9Jp
	 U/qGWm+G4SPHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714092053.2461482-5-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 10:49:37 +0000
Message-Id: <20260714104938.5902E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Architecture / Layering Violation: Driver-specific header file is i=
ncorrectly placed in the global `include/linux/mfd/` directory.
--

--- Patch [4]: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c=
 hub and on-die regulator ---
commit 2a59167d38bc0c8607cf16c05249be2d7d9c9354
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport
I3C hub devices. These devices connect to a host via I3C/I2C/SMBus and
expose multiple downstream target ports.

[ ... ]

> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..ba9a38756ecb8
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

[ ... ]

> +#define I3C_MANUF_ID_NXP					0x011b
> +
> +struct p3h2x4x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	struct mutex protected_reg_lock; /* Serializes protected register unloc=
k/lock sequences. */
> +};

[Severity: Low]
This isn't a bug, but since this header file defines driver-specific
structures solely intended for the parent and its immediate children, should
it be kept locally in drivers/mfd/ rather than being placed in the global
include/linux/mfd/ directory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D4
