Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747339CD1B
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050176; cv=none; b=uwGpyQy5OuNIFiYSudV+dsfNC2qZq2pzUlOkVp58K+imyn0kH19cN/svZmea+F2X9NeP1RsZeprQyh9Zbgfpm+pLk/Md+fPxZTnbX0BlesikSZ/ds1++kjyC0fuMD4uD8vVjIRVDJ1omRU97qA0u8BxIlr2WBtqRwgjeIFRB3xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050176; c=relaxed/simple;
	bh=bsyQsG2bIZoqs9XEnaYgF3jfoG2oXAmu5OuSvFPl6GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gRgYpBOfzW9yfMAdlcP99c5Dx4Ff9bN+WlTnMBp3DlunRb2MX5b1/EW5CE6BD/7B+ttevmSz9/0GBYBVLWj3NUtJtvlyN+HNc77o4bZKq5qzQweAfoBkNXmPitYL57TTAiLaRGJygskCZFXVjQsMPohsfrBsaUGVTyK5KhGwJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V93zmpov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V93zmpov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39BE1F0089B;
	Sat,  3 Oct 2026 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050174;
	bh=En6QAFHpPMk8TD1dxlaUSq6tYh3XdnXw69l4SfKaYWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V93zmpovwCXQwxOTL5vvXfdjQce8wVZh1MXGE7INyJWak62voZ79fyl8gYAdAqP6z
	 xXymCAs4KHyZ8eioDZKVhGcXPtkzwuykswwl8q5dl5H/4LBpZ0V75uYQ+axQgnVoqD
	 1/3e94OMw3ufeqKUg5fPAv4wd0EzrX1RvjOP0aA2wk3ZoUelaECQxTBHO4G0n0O2YL
	 n2bjpYjI+N5xNTLnVamKsaU0WjvDWEwMesWb5HmLFX/7csia1ayppu2AwazKa+3qLk
	 JZorh0x+sMvKsqJg1n5w8KhqSxri5PDYJ5DTrvSL81ZxnBZEXAk55lD7X+GSnU2c/y
	 x+WM/GOSzRJGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002153034.934814-3-kyle.switch@motor-comm.com>
References: <20261002153034.934814-1-kyle.switch@motor-comm.com>
 <20261002153034.934814-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 17:56:14 +0000
Message-Id: <20261003175614.A39BE1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] UAPI: MDIO_PMA_10GBT_TESTMODE_MASK uses kernel-internal GENMASK
--

commit 7b1011d14721d4153c7477397ade2e5f192ec56b
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA

Add support for the 10GBASE-T PMA Template Test Mode register
field, which allows selecting one of eight test modes (Normal and
TestMode1..TestMode7) used for PHY validation.

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
                                        ^^^^^^^
[Severity: Low]
Does this break userspace compilation by using the kernel-internal GENMASK
macro in a UAPI header?

Additionally, the test mode constants below are provided as unshifted value=
s.
Because userspace lacks the kernel's FIELD_PREP macro, wouldn't it have to
manually shift them by 13 bits to use them?

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */
> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */
> +#define MDIO_PMA_10GBT_TESTMODE_3 0x3 /* Template TestMode3 */
> +#define MDIO_PMA_10GBT_TESTMODE_4 0x4 /* Template TestMode4 */
> +#define MDIO_PMA_10GBT_TESTMODE_5 0x5 /* Template TestMode5 */
> +#define MDIO_PMA_10GBT_TESTMODE_6 0x6 /* Template TestMode6 */
> +#define MDIO_PMA_10GBT_TESTMODE_7 0x7 /* Template TestMode7 */
>  /* PCS 10GBASE-R/-T status register 1. */
>  #define MDIO_PCS_10GBRT_STAT1_BLKLK	0x0001	/* Block lock attained */
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002153034.9348=
14-1-kyle.switch@motor-comm.com?part=3D2
