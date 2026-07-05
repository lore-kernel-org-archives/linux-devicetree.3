Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F839EF20
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280414; cv=none; b=T+AT44zwAg8/gmI5suxGxxRa4nBLoV3CXF6jGj6GBfpK+aS48sIiHhd98GONxGzxqC+TLdnwO1KeYJ9yARmBw6CjmxYlaoxzZjlylUNEV9XDjpERRtfEClOQoUJOnSaDOJD+4fgl0ymgzuWHLpNtYnggwVPNtcKAv3cLXTAEhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280414; c=relaxed/simple;
	bh=UXNXSxB7lZjT/yrFOxIH7oR8vaqsQKreFa3r9YbJevw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WNM8ZGp6GAG5A+F7BYvksr2oCgTCV3CIHb5hmxDuOSz4y9Djb0Ve3uWurycTbOa4kFgR4TFUCebKCj1LPzPSxBQXh8HLZiEm73uNM9b/u1pt+t6wD1rPIE67ZUJpqYjWXLOxwtQx90ew6Xte4yg1et3w36HWvEn+zKRxjP6T8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDcUiVTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDcUiVTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DEC1F00A3D;
	Sun,  5 Jul 2026 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783280413;
	bh=ybFk9lLKw87ys9y78vmGYj/5xyIJBeeqDz+qFy7QV6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cDcUiVTgPHSdG0jVQ1dSp46d/yww/J595tQDDywIWZyFt7e2iup4hm5NFf+rSu9qX
	 p3z7Rf7vTWg3ISy6TC27GK50A3GuUt99ncZZh+ORTVonDyJSRwr+NeUsCc4botB40m
	 Rra6Z3gmML9jGi99MnKLL9qwOna9RgE0xJ9rIagRU+5Pd4qJTIo3Z+zwkYij38hsQ+
	 aDpmIdqMCesWv35alPER5gS97Ac1MERM67CzfJnI6KSIK2/TnW4dDb8I6ZhSYVXiDo
	 RQSfakNcjHN+biJpGjo/GtFlsLkLnm33iWX01ZLGsKQXN13C0MnZO8TdOps/LOMG9j
	 exuiXdd66tgMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 5/5] net: dsa: ks8995: Delete surplus driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260704-ks8995-to-ksz8-v7-5-2af0eaa545a8@kernel.org>
References: <20260704-ks8995-to-ksz8-v7-0-2af0eaa545a8@kernel.org>
 <20260704-ks8995-to-ksz8-v7-5-2af0eaa545a8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:40:12 +0000
Message-Id: <20260705194013.32DEC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Inverted MTU configuration for KSZ8895 and KSZ8995XA causes packet=
s to be dropped incorrectly.
--

commit e5eb5e8f2ecf7312467a03e8f5d784c6d14f6fbd
Author: Linus Walleij <linusw@kernel.org>

net: dsa: ks8995: Delete surplus driver

The Microchip ksz driver now handles all switches that the
old driver was handling, but better.

Delete the old driver, but leave a stub behind in Kconfig
so new users will be automatically phased over to the new
symbol when migrating their configs.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index e704ab702c189..360bacc52c3a9 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -100,11 +100,13 @@ config NET_DSA_RZN1_A5PSW
>  config NET_DSA_KS8995
>  	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
>  	depends on SPI
> -	depends on !NET_DSA_MICROCHIP_KSZ_SPI
> -	select NET_DSA_TAG_NONE
> +	select NET_DSA_MICROCHIP_KSZ_COMMON
> +	select NET_DSA_MICROCHIP_KSZ_SPI

[Severity: High]
This is a pre-existing issue, but does migrating KS8995 users to the new KSZ
driver expose them to an inverted MTU configuration?

Looking at drivers/net/dsa/microchip/ksz8.c:ksz8863_change_mtu(), the logic
calculates MTU settings based on KSZ8863 bit definitions:

	if (frame_size <=3D legalsz)
		ctrl2 |=3D KSZ8863_LEGAL_PACKET_ENABLE;
	else if (frame_size > KSZ8863_NORMAL_PACKET_SIZE)
		ctrl2 |=3D KSZ8863_HUGE_PACKET_ENABLE;

	return ksz_rmw8(dev, REG_SW_CTRL_2, KSZ8863_LEGAL_PACKET_ENABLE |
			KSZ8863_HUGE_PACKET_ENABLE, ctrl2);

For KSZ8863, BIT(1) enables the check. However, this function is also called
for KSZ8895 and KSZ8995XA, where BIT(1) disables the check.

If a user configures an MTU between 1523 and 1536 bytes, frame_size > legal=
sz
but not > KSZ8863_NORMAL_PACKET_SIZE. This leaves ctrl2 =3D 0 and clears BI=
T(1).

For these specific switches, clearing BIT(1) enables the legal packet size
check, which would incorrectly drop packets > 1522 bytes.

Conversely, if frame_size <=3D 1522, BIT(1) is set, which disables the chec=
k on
these switches, incorrectly accepting huge packets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-ks8995-to-=
ksz8-v7-0-2af0eaa545a8@kernel.org?part=3D5
