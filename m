Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FBD3BD65A
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786272246; cv=none; b=Yqo8JVON6OyXp8jvcyKHLQ5mZG6DcmuUH3BoYZotCdEvct+G80Z1nWaYn1k1xTU7lAbux9ewHKIhGTMaYzSx3Vw1NfCVTuA5bBQdFsISEz8+c/n8im4jLHWnMIjdkVMTSDkuuv5hQj9uN7JiQIaIK2Bi+dlvpUlgaitAJLcHMdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786272246; c=relaxed/simple;
	bh=J8q05qrIqm9sxgVphFQEOdjjqGgIvY5vdSw9aNMg5PY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ktD6bw3ZeJPWLS/J36h8rEroVd+uPFxWwNz5vmEcDr02f2p+K5OGDvxpvSEA77U7VmFsaUP+AFn+GB2fsxpiRIXSJEB9AT5i2Ifra5/wdEh/NffiJD3BZW9Zd2w0cB0d7EpIy8yNzpWQlADK/kkmRf9ygKfvSzH2m41nQN8Q128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rlnanntT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rlnanntT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0AE874E4117C;
	Sun,  9 Aug 2026 10:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDAB26033B;
	Sun,  9 Aug 2026 10:44:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DB5F11C489E4;
	Sun,  9 Aug 2026 12:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786272237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4jnxJNAlP0KAoaRrSKMZfQoenHX3AcP9wHdWXBleevk=;
	b=rlnanntTFmhd4i6bJvWBmhBLiQs6Jjo0770O38bs2Q51dvcYpMZktLXC1VdNkmr0BrRoaP
	uF/L9swfZCUQp22KaeobbeeekvmN+xVw4jUswO07pfBk4uan2qwrnc/f9CE23aYc81xFky
	SWyFlbAzbV4suziedXLO/4wAGjVX0S2FSPKgUsDhdKVkTBN3b7TvVUOP4ABlqpCBkGb5uG
	QupPQIjqHXNnEHyrzd+yDdN+HmwpnAMFDm+32NGSMH+2TO20eT/O5SvimBdRUSEF1yahio
	GhlXOY+SRTrMbfcO+F3zulIvN/bdK30optX/Xcxu3nADz+u1fCHn/iSTe8MyBQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?B?VG9tw6HFoQ==?= Macholda <tomas.macholda@nic.cz>, Andrew Lunn
 <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, =?utf-8?B?VG9tw6HFoQ==?= Macholda
 <tomas.macholda@nic.cz>
Subject: Re: [PATCH mvebu-dt64] arm64: dts: turris-mox: fix usb3 phys
In-Reply-To: <20260707210830.3708-1-tomas.macholda@nic.cz>
References: <20260707210830.3708-1-tomas.macholda@nic.cz>
Date: Sun, 09 Aug 2026 12:43:54 +0200
Message-ID: <875x1jmv4l.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Tom=C3=A1=C5=A1 Macholda,

> After commit 00e6d608fe80b0f6 ("arm64: dts: marvell: armada-37xx: swap
> PHYs' order in USB3 controller node") swapped USB3 PHY order, USB
> initialization breaks on Turris MOX.
>
> This regression was exposed by commit 91ddf6f722084383 ("phy: marvell:
> mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access") which
> made USB2 devices not work at all.
>
> Fix the issue by explicitly adding all USB3 PHYs and PHY names to
> Turris MOX device-tree.
>
> Fixes: 7109d817db2e ("arm64: dts: marvell: add DTS for Turris Mox")
> Signed-off-by: Tom=C3=A1=C5=A1 Macholda <tomas.macholda@nic.cz>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> index f4d73c8b1a6d..bd00e7df87c6 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -290,7 +290,8 @@ connector {
>=20=20
>  &usb3 {
>  	status =3D "okay";
> -	phys =3D <&comphy2 0>;
> +	phys =3D <&usb2_utmi_otg_phy>, <&comphy2 0>;
> +	phy-names =3D "usb2-phy", "usb3-phy";
>  };
>=20=20
>  &mdio {
> --=20
> 2.54.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
