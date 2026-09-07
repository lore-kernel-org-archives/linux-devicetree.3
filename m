Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2E42122A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767328; cv=none; b=LD9lG2KT0tj1EVdFiAiiWvSt6vlMY5YNJXb7tf3BMo6dNR9THxH+ZoHIKzeFLlnM6r0BDXtxUJkuuRqVzIG5ZXHar5H3bkLFBwlvbHjrbUmAi+ehkytjFqapa+E3u4IRJov8YbNZJvHqaJFKIEAUH/Q9lzumUTCcY2s9VPC3r4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767328; c=relaxed/simple;
	bh=x6VinubALni2/H0XUATewlI2SVMSUJR7XGjw4RM8hU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iW7cgKQPfmkATOxqGu33t4IY06Afi2Gb/6GPAV328cfxcveoL03BMbGdAS4gL98dfeIzZ8Hpdyk1/rBzbvyiANDpiM8VVnxC/wDtTwGwP5QtNxYmChxW8W5AmHpAuHBe43muEsvJaIN+NGZyFbUTEnW6Ydqjy7RvEqpHYHpF16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqMapWPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqMapWPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C861F00A3A;
	Mon,  7 Sep 2026 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767326;
	bh=O9s4PKuomIOMFGiCsoOTFasq4oQIWSKpRSPdib8CxZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JqMapWPKqV0SVrAC3uMEjzOvVu1m3MhdcMTSgNQAMpXIqZQA9RnHZmFxrvQkcE4Vr
	 keb6P6bOHrv7f8eV6ec/QnaaM7CW81ClWkDyz915qOtvLZUeD11U5O5Rrh/JO8Jrkm
	 p0sob9NqNBJm1WEGe0hM0N5OVkZ9Y2x/b8SzAWTwM+u2ksoSkYYX5SX5UUSYkTz2ho
	 HVYh936GD1hSfQLn0u8e0UuWLOswomK5t2EMiwV9M9VUiguYE/KnFLAQHLdl2X4vyP
	 Ab7euqVGDfgmNlVTwc/+iiGoT8vLeoshD8BvpCx5ujTD9uEdAz1K+k5jRm1v/8e/eu
	 p0O2xYotRKObg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-ks8995-to-ksz8-v9-3-8d8815a91bd8@kernel.org>
References: <20260906-ks8995-to-ksz8-v9-0-8d8815a91bd8@kernel.org>
 <20260906-ks8995-to-ksz8-v9-3-8d8815a91bd8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 07:48:45 +0000
Message-Id: <20260907074846.37C861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing polling loop or delay after triggering self-clearing PHY=
 soft reset.
--

commit 702792aed3ea3d1bc269d8039fc614882297cc87
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This patch adds support for the Microchip KSZ8995XA switch to the KSZ
driver, handling its specific port configurations, priority levels, and
packet-size semantics.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c

[ ... ]

> @@ -253,7 +254,17 @@ static int ksz8463_reset_switch(struct ksz_device *d=
ev)
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port;
> +
> +		/* The KSZ8995XA switch itself cannot be reset by software, but
> +		 * often boot loaders have fun with ports, so reset them. This
> +		 * reset bit is self-clearing.
> +		 */
> +		for (port =3D 0; port < dev->info->port_cnt; port++)
> +			ksz_port_cfg(dev, port, REG_PORT_STATUS_3,
> +				     PORT_PHY_SOFT_RESET, true);

[Severity: Medium]
Is a delay or polling loop needed here after asserting the self-clearing
reset bit?

If the PHY requires time to complete its soft reset, subsequent register
configurations performed by ksz8_setup() immediately after returning from
ksz8_reset_switch() might be ignored or cause hardware state issues.

> +	} else if (ksz_is_ksz88x3(dev)) {
>  		/* reset switch */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ks8995-to-=
ksz8-v9-0-8d8815a91bd8@kernel.org?part=3D3
