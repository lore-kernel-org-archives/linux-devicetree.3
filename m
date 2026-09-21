Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE244A3F01
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000259; cv=none; b=Tyb7jNMjzT/ZbBWejQAx8Mm7t9Gvvo2F9uaJ+RkZ9vSR+5c6pxgYNtgLAlWb9e572mTwgYLIT2hG5JQPAWJSISXNDwExPtT2ZpqbaM75XNHqd+Im3QaqOH4Lc7SCnHz4aqeE2VZnSylrlAPeV3suiWAp2gv6SMiolGSERx70eQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000259; c=relaxed/simple;
	bh=QoZB1dXwQr6wiijFvuHu0d+PNAOdJVN0Q2qEx1q0SYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IDyBE+4YLjoUv7yXLj4J84/B0p6f+CvvTbEkiNTJfSz3FIFxpvnOSfUQzAh5rr/ycQZUtNvT0z2RQKp5408UbZAJdcY71n0e+ROFQ3K/LD3q+OcdYBYp5UZtwphTdTfD/PVOX1vX9qoA/ElnCyT9/6NIqkggtgbjkdocJnKUR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLsbDq5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLsbDq5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7FE1F000FF;
	Mon, 21 Sep 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000257;
	bh=v9dn3D3AURTliyw5ydabMJT13aeNaTA76tPz3+26wFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLsbDq5Bn6cU1F4ckXLPjV4AoVeT3yA9CrEFXHg53mjrli3iiBXWcrojkW0wiZaMs
	 ucHi7VVoXqA3SwSvKk8UsRTj9OY3Fax+U3VNadJUAqZL671LPZfhx1tfVF6PrByIJZ
	 4oMah57uynQP5WWQyQqb78VZxKsfqwWypOVBjkcoLatXUf+oxr/1rnm5PhF5uAFI7j
	 1ChoMPJgVmTYBr9T7pfp/HUqtN7r/TfZ/7qAn/Dr0+ATELhIlhcgUgMU7Jh31a0Uqp
	 hgDpEXihAejzKI7hQTMNqFwwuLfyyk6o49gIPqH8YU8qoTURMipXYihZr/mq51P0mD
	 HNj16bsDapmXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 main board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayman Chaudhry" <ayman.chaudhry.kc@renesas.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:17:36 +0000
Message-Id: <20260921141737.2C7FE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: missing space in copyright comment header
--

commit fa0e8a7a8383bb4b7747ee29d3b565433c1fa5e6
Author: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support

Add support for the HiHope RZ/G2M v3.0 (a.k.a. R8A774A3) SoC main board.

> diff --git a/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts b/arch=
/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
> new file mode 100644
> index 0000000000000..cd46af2a924a7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC main board
> + *
> + *Copyright (C) 2026 Renesas Electronics Corp.
      ^^^^^^^^^

[Severity: Low]
This isn't a bug, but there is a missing space after the asterisk in the
copyright comment header.

> + */
> +
> +/dts-v1/;
> +#include "r8a774a3.dtsi"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921134432.5033=
8-1-ayman.chaudhry.kc@renesas.com?part=3D8
