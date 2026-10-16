Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948734EF05
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162266; cv=none; b=TTXUX/baN8T9Ygr6zifsx/OTYIrN22s5ngHeAYWosa7iyikIkSPfPdqA/KOqyKo5shRwawiAtSQ1oGvWus2zrzL2a5WqdHungrSyO1le4PpU2bOhtBLDkTYEjng/SAX5Pzytb0G+99OAC6jVIgAwRafbAb8k98EV0z8YAEeHObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162266; c=relaxed/simple;
	bh=2stUvZaj9JjSJYdtwCzcq9r9qIRF7jrhu8qSa2ya9dA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oNKEwm4AjlVTUOBA2IqGxI5uCJaMuI8TBkWBzjOOtg5/8/h/JHENW6JwXRldEX+35moYjwx/1AWwzmu8lQ2dXRDxqAyRnwn4Szi9RtfwUXR8rxDkqvhIAPQVjbe4B1mqa1UHNKkPjAZq5xO0nHb/N1FD/hnJ75T+TffZ+0VA8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZM1R4zA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZM1R4zA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9552C1F000C4;
	Fri, 16 Oct 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162264;
	bh=SWtjbnVVxlnrnY85L5TTQmMo0zbgPktk4VxQDoR3thE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZM1R4zAgbzmFngifjYFIH3hy7zI/C2Q3Ix+ANqVD4pEzCswDEYPeZKyw4gj1j/yN
	 K2Cvnl77w+Up9f3+P9RljjcTk+LF1c88zf2AmnHITe6UqiTItjO3z9ZEzOuOgPrg8n
	 9TpLJEVY9WJiyiYUU4Iz/ImEu5vMJlMjqea98cNZQh/jGBsRE8DgrozKBkkWU+b4US
	 E6ODBHEEDinPWVbldh+d4FlrdI911x6UtNleXGaqPC7NdLWRZpPPW/5YHluhsnDtBs
	 sKHwIXwFHd+x7lBtKCiHTS8QVCpqjh9z+3fLbqmLgi8g4KTIAPzLeV/Ixk82m6EK8F
	 q5e4/ccchEvsA==
Message-ID: <sashiko-outbox-174495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015145021.2216003-3-kyle.switch@motor-comm.com>
References: <20261015145021.2216003-1-kyle.switch@motor-comm.com>
 <20261015145021.2216003-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:51:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] uapi: internal GENMASK() macro in exported header breaks userspa=
ce builds
--

commit b7a3d7bbc3ea78c17c69740f5d19e179c57d12cd
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA

This commit adds support for the 10GBASE-T PMA Template Test Mode register
field. It allows selecting one of eight test modes used for PHY validation.

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
Will this break userspace builds? The GENMASK() macro is an internal kernel
macro defined in <linux/bits.h> and is not exported to userspace.

If an external program includes <linux/mdio.h> and attempts to use
MDIO_PMA_10GBT_TESTMODE_MASK, won't it encounter compilation failures due to
the undefined macro? Should this be defined using an explicit hexadecimal
literal (like 0xE000) or the __GENMASK() macro instead to keep the exported
UAPI header functional for userspace applications?

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015145021.2216=
003-1-kyle.switch@motor-comm.com?part=3D2
