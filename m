Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512998;
	b=MxyxMdnyC/MFw9Truw5sDNv73MOYpul6o2zkqDwSZuiPbaGNiAhmpxQFOc01wrSh0/4u
	 2I+wLYXPwRArFJ7d9XHETbY7L5LiNJ/K0JE8ZGwA9zTvUjqwFIDGwS+OCYIb/xdcCbd7c
	 ikwWVtQ2pyQV6KaDbB1U/x12EJj5sJW1KjKzq40Z2b0j6KTQurRHlvkoUynF8OKyQc7hd
	 BgqXpOEMYSWJSUEkB1aUdXNxO8QxMVlAt2zevFFrqPmgNuqhY1TeNK+91GZ5De/koSk8u
	 s82DVoswWiuruF+SjTT3e2slihh7gIvJDNqsuirggTOa9vdeNQTWkJCGY4/j+HgVEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512998;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ia8BngBPYWbtQh9l3tGHJyUFUrEvtWvYHlU9XKuf4kw=;
	b=E6KwMLVw+fh6K6UAzTkNgk/NPJ34AvGEmur9LSi5ybfG9GEjKyYIYcruo/C5qwRN4l0V
	 W4vIzs49V+QnIsQqGcWRCMexTbkrdlY3kTPrsjohIMAdQlQOAwm9oNRYWBOfsYaXjv+tj
	 WdMlYGA0ZZHcHmzFbTqN0qg9cFR+1Bf1Kl2xx70pUZpyUMXBJJnfH59dMCRuyoL4V7Cdw
	 ZnFSsmXq07m3lxC9U2ikVfJgmHaR8ybEMcBmhlt2mUwgAg3l64IZCDI9cx/g1w0DgNCKR
	 sf5/dDeZV2xjLJzcYJWWLRzcH/CCwnH3LmpGTDX803QzZMd3mffVeWpO7vMBTVJ42nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKFqzTPP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291F606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKFqzTPP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629061F000C4;
	Thu, 12 Nov 2026 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794512997;
	bh=Ia8BngBPYWbtQh9l3tGHJyUFUrEvtWvYHlU9XKuf4kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKFqzTPPq2jNA/Hli0yBI3RhtJH46B4lOacLMrY4Qzj59MCzQ5yHSZVi4M2ABb/1g
	 eBvg4YWALY8BnY0pgxraAO0kYUvoj0L5YDM/n6JRkI0L+QBSGz0OHrTdZv7CAJN/fg
	 IKsscwzUrN/+WhvBQzw8iACFjff+6PONST0CGQsIoJgdl8Lj0pTiTegeSvEStJEHDx
	 b3anWFQuxFC4EBShq03gvhYxDRHdFnmPdiDXO2CkPpjPUtXpeZVYRy33Lu57nxCvr3
	 i1j66u2e08nrwgB030BY6bwLf2Bult3XLetUG89URLHblkK9f3RCVObQ5uvj41g2Pv
	 wpsAioO8tgMeA==
Message-ID: <sashiko-outbox-211773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112193245.250149-3-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
 <20261112193245.250149-3-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:49:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: zynq: undocumented alinx vendor prefix in compatible
  strings
--

commit 1804279139c8a09d5adf9d31bc9b1cefc4e9cf27
Author: Pufan Jin <cyan2254650260@gmail.com>

ARM: dts: zynq: Add ALINX AX7Z020B development board

This commit adds devicetree support for the ALINX AC7Z020 system on module
and the ALINX AX7Z020B development board.

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi b/arch/arm/=
boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
> new file mode 100644
> index 0000000000000..d60e58657b7c0
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DTS for ALINX AC7Z020 System on Module
> + *
> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
> + */
> +
> +#include "zynq-7000.dtsi"
> +
> +/ {
> +	compatible =3D "alinx,ac7z020", "xlnx,zynq-7000";

[Severity: Low]
Should the "alinx" vendor prefix be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml?

Both this file and arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
("alinx,ax7z020b") use the "alinx" prefix, which is not yet registered in
vendor-prefixes.yaml, causing scripts/checkpatch.pl to warn about an
undocumented DT string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112193245.2501=
49-1-cyan2254650260@gmail.com?part=3D2
