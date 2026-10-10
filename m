Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A1298CAB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652351; cv=none; b=Tq61TYqBfOUHo3Tq1N4oBoNf0t0bdD8D3hvNlp5apNSQyEtUKA4Fu0o3+DkRCEbFOwMWq+CIA9XE0fMlq9F/LcSq3jZL1NafvyrIaTOc1IEibBbaAMoKxwbUYHvFhIgvp4ydK2RnrvyLd+m68B31HMQIziGSUxF+MJbQK7u04KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652351; c=relaxed/simple;
	bh=eOmQjlZnBfTJ/VvMmrrzWZLHMz+hm52zGL9wVFt1bU4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jT8+IqQig1SwzecbM/Unf6H0IIKKop02tzX9Qa0pKqeNKMLNP5Q9+Q74Dv4fMdyq2UP4OlN0D/toLzrb1XlHnjAiFKF1qu9yFPckESUlKDkwN/IEjESpm9cvaxi+RWDTRJWB4g/yGoYLeSvdGUqR6vSDG9KTGTQECuLJqxRGy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPn19Laj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPn19Laj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5201F1F000FF;
	Sat, 10 Oct 2026 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652350;
	bh=kCQLnVsvYI68ReCqcx7SPR8Gf11byMiNdTGSzrqVSOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPn19LajwdGA8qJHCrLlxsnkSGEGIMLMbj4CjnlGXkZ3HBa5QUy3nU5d2thCLN2qj
	 EDEj3NBfMl6Dt3HqRo9eUDw0XUzDWhWyDT9J1OrwBC6/tlPzbI3hhYipW/VaqNfta8
	 xJF65dDFoJx126bLk1+Jm86/Z1oQzg7Bi2E2/sIbV0oeoa3cPHArD5/m9nXs2Z/tuV
	 fjTit06OnPnrZOWf2TdjgxMTdO+mG/fNrEOwDnmav6X4X4iDGS03CBwOn5yNfytwIl
	 bdmXu5BS5+x0dY+Qhs7lo8ArqHJGHto27A7VH8cszx5f+YBwHFzJuSvXwfRBYpVuSt
	 wXnmDzCkMmPMA==
Message-ID: <sashiko-outbox-166764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 04/11] net: ethernet: oa_tc6: Move constant
 definitions to header file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-4-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-4-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] oa_tc6: oa_tc6_std_def.h is not self-contained
--

commit dc8b82e8ffa11bb2c910dd9a4dd8439a0dd981ef
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move constant definitions to header file

To help other source files within the module share the constant definitions,
some of the definitions from oa_tc6.c are moved to a header file. This head=
er
file is still private to OA TC6 framework.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h b/drivers/net/e=
thernet/oa_tc6/oa_tc6_std_def.h
> new file mode 100644
> index 0000000000000..403a9c22b5f14
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
[ ... ]
> +#include <linux/ptp_clock_kernel.h>
> +#include <linux/net_tstamp.h>
> +#include <linux/netdevice.h>
> +#include <linux/spi/spi.h>
> +#include <linux/skbuff.h>
> +#include <linux/sched.h>
> +#include <linux/wait.h>
> +#include <linux/phy.h>
> +
> +/* Control command header */
> +#define OA_TC6_CTRL_HEADER_DATA_NOT_CTRL	BIT(31)

[Severity: Low]
Does this header need to include <linux/bits.h>?

It looks like the BIT and GENMASK macros are used here, but the required
header is not explicitly included.

[ ... ]
> +/* Internal structure for MAC-PHY drivers */
> +struct oa_tc6 {
[ ... ]
> +	bool int_flag;
> +	bool disable_traffic;
> +	bool prot_ctrl;
> +	enum oa_tc6_quirk_flag quirk_flags;

[Severity: Low]
Should this header also include <linux/oa_tc6.h>?

It appears the full definition of enum oa_tc6_quirk_flag is required here
to determine the size of struct oa_tc6.

Could this missing dependency cause compilation errors if other C files
include this header without first including <linux/oa_tc6.h>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D4
