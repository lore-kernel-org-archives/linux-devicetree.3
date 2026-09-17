Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A449A3CC
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640487; cv=none; b=uvs2wCT8P44gcCe7vjefsOUqzx8pPoxlbM+1/bAJWZIHO5X0vL1LWVxhUW9G6cdVTxt4mtLkO06dvzR5cyacQXunGXSH59XDq8qTQGsnq/KnweV3TPK3FLXLTykC3WEk0tR4zooLWtucVov/+mw/XrraOemaF1Z0ydJ5AefRs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640487; c=relaxed/simple;
	bh=JfDNYhgbSutWHmdktV0nz1lLX15NndP1NHXoJAvLAfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K6KQjlru/CbHrO7pqtChnWs9z/ZtabqkgqQBuYuPxvv/MsjvQCI+gwh9zHTBikj1eZyT7Z6EBQ97mIMlXjfxdF2Ti3lIvyfBL3UXSihanR+wCpip9bmkWXTJXC0D+cuwSw4NgHVBROzQD4fqIwbe0N1dQGkLbq21bRprbVSqqCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mb+weBvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mb+weBvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EF41F000FF;
	Thu, 17 Sep 2026 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640482;
	bh=Mwt4dFykC5YYkoArXkyB2MvdFh4zpvm6vcKgREnCfPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mb+weBvQI06n0ITBS53xCh7uy17BCaNQoEUHeyWE6zJ4HvD/TUPXIp9FjSouvoJ9d
	 wRcTsi3Vql4/b89VgchTfYLhlwynW6Y2KlI4RDhp4QxySE35vnEUDX7+/9CTbXCx4q
	 L1PN7qtFXAvphM7g8JqDyQz54kGpGHep3E0WMWUhescB/f8FfFrpIfC4RbsiENmw6B
	 OS9+9maKSQ29XdxP682ofV53OuIGRdZnfuW2IH2/YjxquuD9Ri1FVdWJoAtKSeRaDm
	 SRUag5dtg1OKY1CmUrssjUo66l1BBB/T680JKMop9xdSQr8F3G+fH2+04f0E6u3Ad7
	 hPQXufiohWrHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-ks8995-to-ksz8-v15-3-8825ff5fd4be@kernel.org>
References: <20260916-ks8995-to-ksz8-v15-0-8825ff5fd4be@kernel.org>
 <20260916-ks8995-to-ksz8-v15-3-8825ff5fd4be@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:21:21 +0000
Message-Id: <20260917102122.46EF41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: ksz8995xa: PHY soft reset writes to reserved MAC registe=
r on CPU port
--

commit f841f88763071d08ce03b9faac5dca678f1c4f1f
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch to the KSZ driv=
er,=20
handling legacy compatibles and implementing specialized DCB and MTU logic.=
 It=20
also provides a customized DSA switch operations struct for the older hardw=
are.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 941ae9f66f70b..d7498132064e8 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c

[ ... ]

> @@ -253,7 +255,35 @@ static int ksz8463_reset_switch(struct ksz_device *d=
ev)
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port, reg, val;
> +		int ret;
> +
> +		/* The KSZ8995XA switch itself cannot be reset by software, but
> +		 * often boot loaders have fun with ports, so reset them. This
> +		 * reset bit is self-clearing.
> +		 */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {

[Severity: High]
Does this loop in ksz8_reset_switch() unconditionally include the CPU port?

Since dev->info->port_cnt for KSZ8995XA is 5, it looks like this will also
write PORT_PHY_SOFT_RESET to port 4 (the CPU port). However, port 4 lacks an
internal PHY (dev->info->internal_phy[4] is false) and writing to its reser=
ved
MAC register address space could trigger unintended behavior.

> +			ret =3D ksz_prmw8(dev, port, REG_PORT_STATUS_3,
> +					PORT_PHY_SOFT_RESET,
> +					PORT_PHY_SOFT_RESET);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* IEEE 802.3 allows up to 500 ms for a PHY reset. */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {
> +			reg =3D dev->dev_ops->get_port_addr(port, REG_PORT_STATUS_3);
> +			ret =3D regmap_read_poll_timeout(ksz_regmap_8(dev), reg, val,
> +						       !(val & PORT_PHY_SOFT_RESET),
> +						       1000, 600000);

[Severity: High]
Could polling this reserved register lead to a permanent timeout?

If the hardware retains the written value on the reserved register (meaning=
 it
does not self-clear like a real PHY would), regmap_read_poll_timeout() will
timeout after 600ms and return -ETIMEDOUT, causing the entire switch probe =
to
fail.

Should this loop check dev->info->internal_phy[port] before proceeding, or
alternatively iterate only up to dev->phy_port_cnt to avoid touching the CPU
port?

> +			if (ret)
> +				return ret;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ks8995-to-=
ksz8-v15-0-8825ff5fd4be@kernel.org?part=3D3
