Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6323B4EAA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840244; cv=none; b=knWRu0J9J+zIMFq9jhSsoMLLl9YP+QCkXnFgK22v1h7ezZYNvKvkzkS7SMQNc0iRvvu2f/i8xgt41K6bjZ8HKG5BOl/sxtTab6CJAjm/KUTgztqf8Ss2lvYKiA+1ZNqgMPDyQKjjdMehZkSqEMU1g4HZ4BteXa6eiKRPZCctVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840244; c=relaxed/simple;
	bh=9iVdKItrZtiMkn062LVS14cjg1IbfgOJFs2ugLHt35I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kjpizaIG+4Zifaj0VBbRhDrrd0bEreiw5wY7jj0calHk/zUXYNMqT55XGKKUw687RbUiS5howDwMYiUfpuOFV34SjY2Sc+s4lekQh7iRR1nGdh9vngjs+Jbw+z8jlrr6T86RJUCOonHsKnqXe9S6yE5W6AGQb54EaIahXzDJ220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldLWqH4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldLWqH4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE571F00A3D;
	Tue, 30 Jun 2026 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840243;
	bh=rA20OS/O5+x1NhhGofbfr7W8zQanD+f4zcvVeI6ahPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ldLWqH4GJwZ5Ifq4XHbiP2ALJ6azixiYfPfRrPSjYh2WpyY8EJR3jWCtLI/otCyDX
	 ER2vFrDBRpCEOAuxn+h8f3xRc/iIT/t9Fs2JqFomCb4qRtepyYPgvgLkCTArS2Iokg
	 w5GpXYKaa4PziqtzAtrXxfS21N49EQzBvHwszDbmUmNbbb6YzQgjc3D8mqrPDORyp6
	 2y13iZVqOWSOs1WmT3fhiXBjXtV7p9TnA1B50xkP4NwpJpSz0mYpkb6TWDNjqBjJWB
	 enfEtQSpMxrrOuly2guV7PN5lr3IEZ7k3k3vN4+3/eBH5bSUdv4pNpHdIyiKwRlywI
	 n6toU0g8Mnyzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 11/15] net: phy: ncn26000: Support for
 loopback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-s2500-mac-phy-support-v6-11-18ce79500371@onsemi.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-11-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 17:24:02 +0000
Message-Id: <20260630172403.3EE571F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The config_aneg callback unconditionally overwrites the MII_BMCR r=
egister, silently clearing previously set bits such as loopback.
- [Medium] The interrupt handler incorrectly uses a register address macro =
as a bitmask to check for link status changes.
--

commit 80f0753c539b77ecac87c47e5aa0620f69037283
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: phy: ncn26000: Support for loopback

Adding loopback support for S2500 internal PHY to help running
loopback test through ethtool. This sets genphy_loopback_fixed_speed
as the set_loopback callback.

> diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
> index c3a34b2c524d5..afafa81dc22b8 100644
> --- a/drivers/net/phy/ncn26000.c
> +++ b/drivers/net/phy/ncn26000.c
> @@ -178,6 +178,7 @@ static struct phy_driver ncn26000_driver[] =3D {
>  		.config_aneg           =3D ncn26000_config_aneg,
>  		.read_status           =3D ncn26000_read_status,
>  		.handle_interrupt      =3D ncn26000_handle_interrupt,

[Severity: Medium]
This is a pre-existing issue, but does the interrupt handler use the wrong
mask to check for link status changes?

ncn26000_handle_interrupt() checks the interrupt status using the register
address macro (17 / 0x11) instead of the proper bitmask:

drivers/net/phy/ncn26000.c:ncn26000_handle_interrupt() {
	...
	ret =3D phy_read(phydev, NCN26000_REG_IRQ_STATUS);

	// check only link status changes
	if (ret < 0 || (ret & NCN26000_REG_IRQ_STATUS) =3D=3D 0)
		return IRQ_NONE;
	...
}

Because NCN26000_REG_IRQ_STATUS is 17 (which has bit 0 set), it coincidenta=
lly
matches NCN26000_IRQ_LINKST_BIT (BIT(0)). However, it will also incorrectly
match other interrupts like bit 4 (NCN26000_IRQ_PLCAREC_BIT).

Should this be using NCN26000_IRQ_LINKST_BIT instead?

> +		.set_loopback          =3D genphy_loopback_fixed_speed,

[Severity: High]
This isn't a bug introduced by this patch, but will configuring loopback
here be silently broken by ncn26000_config_aneg()?

When a user configures loopback via ethtool, it sets BMCR_LOOPBACK in MII_B=
MCR.
However, if the PHY state machine later triggers a re-configuration,
ncn26000_config_aneg() unconditionally overwrites MII_BMCR:

drivers/net/phy/ncn26000.c:ncn26000_config_aneg() {
	...
	// bring up the link
	return phy_write(phydev, MII_BMCR, NCN26000_BCMR_LINK_CTRL_BIT);
}

Will this wipe out the loopback bit and cause the hardware state to be lost
while the software state machine assumes loopback is still active?

>  		.set_plca_cfg          =3D ncn26000_c45_plca_set_cfg,
>  		.get_plca_cfg          =3D genphy_c45_plca_get_cfg,
>  		.get_plca_status       =3D genphy_c45_plca_get_status,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-s2500-mac-=
phy-support-v6-0-18ce79500371@onsemi.com?part=3D11
