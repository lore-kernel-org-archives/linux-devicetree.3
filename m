Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0114DB567
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607088; cv=none; b=RQ4WpD8oprOEFnyjVeiNDznAUQGx3BsageFiUsxk+4SM7hHLWy05FWBvgjct9bJ9KC7g0sN1Tnm5jVYRMQQCS1I6LxHA0tOt8wS+syKn58DNM07Nn536J3s+isUUGOEtO0uo68hlEEALD+32CCvKkVi6QK7rJ/TJRH3eY+tegPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607088; c=relaxed/simple;
	bh=W0cWPaZnLg2bJjJDa0x7AK99oRjzJUE7QBnJPbnvyB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2gtI3IgiYp7j9coENwLzObeb/F5HpQud2Btx6hxWsm/2YMQrMdHn/O9QoTIod+vw4Mg5tO+TSxQWi4FexrObT9DzCspsbVD4ZgT5QpB0uppQ9W1FmXoCrEGNvm12lk1Z43iipMGIOUA/5FC8i0+OV9TE6Qo6olnr+xSBeM5qg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOdyUEv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOdyUEv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE65E1F000FF;
	Mon, 28 Sep 2026 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607087;
	bh=W0cWPaZnLg2bJjJDa0x7AK99oRjzJUE7QBnJPbnvyB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOdyUEv72zX2/Zq5ruiq7wbu86VNhDtEb0113PZFwT4wR7lOU3Y4lwiL2KH0TRV9j
	 GhaNyK6hK8dfYIi5gW4AJVkr0zqpitA+v5tV8sjLk+emAiw9uyvwGrM3lxlZH6+kKb
	 i3eFMeTG5f2M69I3OKJwIjHswERgmayXw9GCQaS1+Lq5q+PsA1z66hFJ1IxePk/iJh
	 m4VflLuO9+txbY4TABzymFLfDkxGxcVtmxSnFUZWj+fhc2g6g1INDi2/tVWFEKgnTg
	 KCVYLdrxREIUpqkJir817QCbtiew/umZaLa/oSNxUF/0X08CeHTRBh7Psjx0BorsZd
	 vi09dLgrk8fAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:51:26 +0000
Message-Id: <20260928145126.EE65E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: redundant duplicate include of hdmi dtsi
--

commit 242378324c377114192c5cacd4bed84adbf80882
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun hb-ripple with rzg2l som

This commit adds support for the SolidRun HummingBoard Ripple board with
the RZ/G2L SoM. It creates new device tree configurations and extracts
common components like micro-HDMI into shared include files.

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.=
dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> new file mode 100644
> index 0000000000000..493a2b9b51d25
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g044l2.dtsi"
> +#include "rzg2l-sr-som.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

[Severity: Low]
Is this include of rzg2l-hummingboard-pulse-micro-hdmi.dtsi redundant?

It looks like this hdmi dtsi is already included by
rzg2l-hummingboard-ripple.dtsi, which is included just one line above.
This results in the device tree compiler parsing the same hdmi nodes
twice when compiling r9a07g044l2-hummingboard-ripple.dts.

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi b=
/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> new file mode 100644
> index 0000000000000..d5bd9b7de4282
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

[Severity: Low]
Here is the other inclusion inside rzg2l-hummingboard-ripple.dtsi. Would
it make sense to drop the duplicate include from the top-level dts file
to keep the includes organized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rzg2-sr-bo=
ards-v9-0-5901e0fc9e44@solid-run.com?part=3D8
