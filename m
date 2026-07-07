Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88035E936
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444701; cv=none; b=qUjqsBuuauJheJCCbahnD3x9MtBjr41SULgFQpLdVxkUy16vSqa5LL6OXdGmE6yW1zO6jUMqfsicvzk7zbF8RZoOB/vKJqQnA3OuZ0y91Vjj55gDApY67/xeBL8kl5FWa8JFYBvwN8Acj8pAIkb5SxpP78IGSauMUVM2PCOJ+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444701; c=relaxed/simple;
	bh=D+YoA5u0ly14et7nD7bg3OgQLDFnBQxZMnV2w0JeasE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXo8ukIAzIaPgfAy/MRxPLwA8iiKjuUBpz9P+dX5j3lhZFvw84j0joJbfXAIpRASTqJKdLsjLkEJhrIlSkMNQi7vZMvtLoZ2T8DAV0vfCQGoJURszKoNS6qK/WJd73gmK92oohbU/tu7jew4ereFlXRx5eD3iBcd1IMHa1ln4bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THixKM11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THixKM11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0A61F00A3A;
	Tue,  7 Jul 2026 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444700;
	bh=OPIPLcyfMBvWoF/4P1/KVhkpSOVkXneU6Lcifmuf6PU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THixKM118Ehm2vfKM8WfgGXOup48KqRt4j+ITdMZ/tCJIY3iGKgkT1BsJOphbBo/4
	 NxYZmQKVtVODmjuFmh66Id7UzVvSKynjIDOfLfKGVE+Hzt/y5B/JABL0+G33Kl5De9
	 4d9KVjRFnIHZDPQBrwQWyht1B0q96SxnjcQb/p3atc9bbsVOmtzSFnKv9P5OyiAsh2
	 cAjfULJ32ZfPPnnSqj0UBNhU1MNddg0KfexqAIEUIdxhSax/aITFCvon9G8h55Lmd4
	 PE3h+6c3cUwrxVxt/a8NeeNlHLVC5oJdXfpAZ3NLylbr/nd1oLCONpHv4zBOpzVZZf
	 z5suk++ZhBwRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/20] media: imx355: Programmatically set the crop
 parameters for each mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-5-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-5-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:18:19 +0000
Message-Id: <20260707171820.3F0A61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing initialization of the 0x030b PLL configuration register.
--

--- Patch [5]: [PATCH v2 05/20] media: imx355: Programmatically set the cro=
p parameters for each mode ---
commit 4df459187456782ee3ca7366e5ecefcdad82a80b
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Programmatically set the crop parameters for each mode
   =20
Currently the cropping is set via register entries in the per mode
register lists. Add the crop information to the mode structure as
a v4l2_rect, and set the registers programmatically.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 28b210f1a8689..363b5667b6c9a 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -253,21 +261,9 @@ static const struct imx355_reg_list imx355_global_se=
tting =3D {
>  static const struct imx355_reg mode_3268x2448_regs[] =3D {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },

[Severity: High]
Is the 0x030b PLL configuration register missing from the global settings?

It looks like the 0x030b register (value 0x01) was accidentally omitted
when moving identical registers from the per-mode arrays to the global
register array in the commit "media: imx355: Remove duplicated registers
from the mode tables".

Could this omission leave the hardware at its power-on reset state and
prevent the sensor from streaming correctly when imx355_start_streaming()
applies the global settings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D5
