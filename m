Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B363AFCF8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274123; cv=none; b=qgAoG8U2gENGjWk6fBkuX3sRcr8NEKDIJUSh05VjAij8ub13/fnF5GxFM2iVM2zLEYWYiZysWe06yya1lxqbnzIhdSZtbWzV+xc/tQ0ckCmbgQ60y4kuaAnPHRZXVVGG4aQLo+oPaNmu2SlA2PID9QnJrCejlLc62jUFKu7aSks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274123; c=relaxed/simple;
	bh=TI7AxsjTMePd4RZ/iTT17EEMye+p5udUDDRd8xT0Sa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vEy3TTY5bRWzK8gUiljFWVUGp/TuO/f/xNDx/RqB7RK6nL++kmbYM2qq5NDG6K7eJq3o8NESlQ8hlt2g5AliZ96euBx6b3dp+/+8kAzCsJu6P+s2TNZKSMX8bwO+U2dbxR7wzj4pv5WrUwrcZ7iQuvUgOWDDse9PB7VDxm7TgH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9JBDYoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9JBDYoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3E41F000E9;
	Tue, 28 Jul 2026 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785274121;
	bh=B1peS2VFctQcIR4laPHsTqiC7UX+kbKGykFjdftdQzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9JBDYooLT1MLrVL1PgOjhNfmeMACDzCfJ7trZEqupoog+qJswSVvzvUvVHTXw5Mh
	 LFJDwBSIFpTuRUfYWc+kLJdFEOnCDqJMvj1hoTOvW//LsiawrKRg+LpVFKCmCSA4xb
	 ChROiJf5B/mBC5RiwMaBO+CWOlawq1ZlpTIlLQs9An7c1bYFE85VqvOOXVzdJZcQOS
	 iLHchVUsMgHT9jw7JVhFXasSWo5M5tRXCL+kvDCzq4jItrSALBnNxZbijfwF1eOIQd
	 wFRY3/oSXZZHyutaI1CYBeAMKLEUBBTolO3AVpTstvUULR7x7CuqXY3KOqKEtRdO4+
	 wQgHop9A/ZlPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728211020.1248676-4-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-4-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 21:28:40 +0000
Message-Id: <20260728212841.4C3E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing unique board-specific `compatible` string for the M1 Jup=
iter board variant, which inherits the identical compatible string as the K=
1 variant and breaks DTB matching.
--

--- Patch [3]: [PATCH 3/3] riscv: dts: spacemit: Add Milk-V Jupiter board (=
M1) ---
commit 2d54397a3a4baaa8a2eee569d6fe3f912a3c7661
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
   =20
This commit adds support for the Milk-V Jupiter board with the M1 CPU.
The M1 is similar to the K1 but allows running at up to 1.8 GHz, adding
a new device tree and an OPP table for this higher frequency.

> diff --git a/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts b/arch/ris=
cv/boot/dts/spacemit/m1-milkv-jupiter.dts
> new file mode 100644
> index 0000000000000..32e1468385ca0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
> + */
> +
> +#include "k1-milkv-jupiter-common.dtsi"
> +#include "m1-opp.dtsi"
> +
> +/ {
> +	model =3D "Milk-V Jupiter (M1)";

[Severity: Medium]
Since m1-milkv-jupiter.dts includes k1-milkv-jupiter-common.dtsi, does this
board inherit the identical root compatible string as the K1 variant?

If a bootloader like U-Boot uses a FIT image containing both DTBs, it relies
on the root compatible string to select the correct one. If they are
identical, could the bootloader mistakenly apply this M1 DTB to a K1 board?

If that happens, would the K1 board be allowed to run at the 1.8 GHz
operating point defined here, potentially causing instability or hardware
damage since it is only rated for 1.6 GHz?=20

Should a unique board-specific compatible string be added to this root node
to uniquely identify the M1 board hardware?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728211020.1248=
676-1-aurelien@aurel32.net?part=3D3
