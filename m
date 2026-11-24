Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521770;
	b=AbAwkqm075XM45LHCLsnnQcffPDdmBhQVJrb/1MSU1zY9TVagaea9xkQBCja0klxZbE8
	 3Et+6edF5jetXsF/qf1rQEql0WxyMuwFF82V/M9GDcvWLhFMF8UqqSWWQUortkqSE31Mk
	 iXEdfI4zCMQqdOP5ImwbhG69LUiEWGz1sBqM+fMaoiS1bCzhl+crNr7+pVT0sdGuQ3FeE
	 EOyhkpnXpb+Xy4TevVK0m6idSE9+vXDxuQIkACxlMr/DG33weh01bOdh6cznrhGv8oDGn
	 I5kUx8LjjG3AG+PSr82qdb0H/oBl/vTOcDU8M1QWBthWe5KOWfHOf6NqE6CYIIPAXaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521770;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=J/hgjS5wptIfTKZPK4+3uy6djn7gSRXd68ZCyUQWT1s=;
	b=bs9XFgvdI3Gdvl3pMJCmOsHzODNCAhWRm5maTZblgOoywAqGK+MK3fK0WguuKlpac3q3
	 Q/POUiZpnhbAzLmUhq+kImkmc/zcY08mWiqkNTvV3U7vRtpRWSW3JQY2hs1ryFHfXJYzu
	 Qgnq+cJJ+YwUo4dQdkqAtliC0ba/zpVoDJQQP10L8NDeyifycBkPUS4kwxoWy9HReVc1L
	 X68s8DXtGEmr7fE43IqpOR2Sh0CU8Zx24Lgd6cgN6OsoXjdQvdNL+coq7f/7i09ADvfB7
	 z4vKhfT1ruB0ofVntjFngSnlvU0ZJGa6d6bYlK4cYERMTAIPzyvOnFlefZ19tIToJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ioGCE0az;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA24606A321;
	Tue, 24 Nov 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ioGCE0az
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F871F000C4;
	Tue, 24 Nov 2026 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521770;
	bh=J/hgjS5wptIfTKZPK4+3uy6djn7gSRXd68ZCyUQWT1s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ioGCE0azlO5MsbLAhAXe/NpXCbQDZ92w4JnRZeMVu3HYXUQ2KNxvTbKgzGIvAaxXY
	 KTLw3obuzH8WxJLY65CurHw8fBhzCpnGxFUsOKF5rvZcTLXaSJlJg6RYp5B+ReLQko
	 V7VoH1U5nYGURcrvgDjZacqo9x3mXZxd6tlXKigt0PydZDF1TAOrkjLoS3x9YUEM+R
	 NGaiQ/aUwST2MrCbHxJ30xOcEmd8EPpyxdJHWFdZZ+NKb+2YUxodn73hXR9xDgWBVW
	 q/d5bDgwa9m3Vukzx6ab2a+cyd1mMlFxGg4IGDxcPzcrU7Ekfw0QSNQjjVKeQvDMyH
	 avl9oHLBArTkQ==
Subject: Re: [PATCH net-next v3 5/7] net: phy: adin1100: Skip the soft reset
 on ADIN1110/ADIN2111
From: netdev-bot+sashiko@kernel.org
To: iustin.stolniceanu@analog.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, parthiban.veerasooran@microchip.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, marcelo.schmitt@analog.com,
 alvin.sipraga@analog.com, ciprian.regus@analog.com,
 Selvamani.Rajagopal@onsemi.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 12:02:48 +0000
Message-ID: <179552176854.3135.14043257413847529020@kernel.org>
In-Reply-To: <20261123115743.29523-6-iustin.stolniceanu@analog.com>
References: <20261123115743.29523-6-iustin.stolniceanu@analog.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message claims the whole-chip reset done by
  CRSM_SFT_RST "is not an issue with the generic SPI protocol" because…
- [Low] The patch justifies dropping .soft_reset with "The MAC driver
  already resets the chip before attaching the PHY".

--

net: phy: adin1100: Skip the soft reset on ADIN1110/ADIN2111

This commit removes .soft_reset from the ADIN1110 and ADIN2111 entries
in the adin1100 PHY driver. On these chips CRSM_SFT_RST resets the whole
MAC-PHY, not only the PHY. The change prepares for OPEN Alliance TC6
support, which configures the device before the PHY is attached.

> This is not an issue with the generic SPI protocol, where the adin1110
> driver configures the MAC in ndo_open, after phy_connect(). The OPEN
> Alliance TC6 protocol support, added in a following patch, configures
> the device in oa_tc6_init() before the PHY is attached, and the
> configuration would be lost.

[Severity: Low]
Is this accurate for the existing generic SPI driver? After ndo_open,
phylib can still call phy_init_hw() -> drv->soft_reset on at least two
paths.

The first path is system resume. adin1110 has no PM callbacks and does
not set phydev->mac_managed_pm, and adin_suspend is set. With WoL off
this gives:

mdio_bus_phy_suspend()
  ...
mdio_bus_phy_resume()
  phy_init_hw()
    adin_soft_reset()

On ADIN2111 this happens once for each PHY.

The second path is an SIOCSMIIREG write of BMCR_RESET while the
interface is up:

adin1110_ioctl()          /* only when netif_running() */
  phy_do_ioctl()
    phy_mii_ioctl()
      phy_init_hw()
        adin_soft_reset()

On both paths the whole-chip reset would wipe the setup done in
adin1110_net_open():

	ret = adin1110_write_reg(priv, ADIN1110_CONFIG2, ADIN1110_CRC_APPEND);

It would also wipe the IMASK1 interrupt enables and the MAC
address/filter slots. The interface would stay broken until it is
reopened.

If that's right, this patch also fixes a runtime problem for current
generic SPI users. Could the commit message describe that, and add a
Fixes: tag so the change can be considered for stable? .soft_reset has
been set for these PHY IDs since the IDs were added.

> diff --git a/drivers/net/phy/adin1100.c b/drivers/net/phy/adin1100.c
> index a69c3228961e9..bc7214b735057 100644
> --- a/drivers/net/phy/adin1100.c
> +++ b/drivers/net/phy/adin1100.c
> @@ -341,7 +341,6 @@ static struct phy_driver adin_driver[] = {
>  		PHY_ID_MATCH_EXACT(PHY_ID_ADIN1110),
>  		.name			= "ADIN1110",
>  		.get_features		= adin_get_features,
> -		.soft_reset		= adin_soft_reset,
>  		.probe			= adin_probe,
>  		.config_aneg		= adin_config_aneg,
>  		.read_status		= adin_read_status,
> @@ -357,7 +356,6 @@ static struct phy_driver adin_driver[] = {
>  		PHY_ID_MATCH_EXACT(PHY_ID_ADIN2111),
>  		.name			= "ADIN2111",
>  		.get_features		= adin_get_features,
> -		.soft_reset		= adin_soft_reset,
>  		.probe			= adin_probe,
>  		.config_aneg		= adin_config_aneg,
>  		.read_status		= adin_read_status,

[Severity: Low]
The commit message says "The MAC driver already resets the chip before
attaching the PHY". On the generic SPI path, does anything wait for that
reset to finish?

adin1110_probe() checks only the return value of the SPI write, then
registers the MDIO bus and connects the PHYs:

drivers/net/ethernet/adi/adin1110.c:adin1110_probe() {
    ...
	ret = adin1110_write_reg(priv, ADIN1110_RESET, ADIN1110_SWRESET);
	if (ret < 0)
		return ret;

	ret = adin1110_register_mdiobus(priv, dev);
    ...
	return adin1110_probe_netdevs(priv);
}

There is no STATUS0 RESETC poll and no delay here. The 90 ms fsleep in
adin1110_check_spi() only runs with the optional reset GPIO, and it runs
before the SWRESET.

Before this patch, adin_soft_reset() polled ADIN_CRSM_STAT for
ADIN_CRSM_SYS_RDY, for up to 30 ms, before any PHY register write at
attach time. With .soft_reset now NULL, the attach path is:

adin1110_probe_netdevs()
  phy_connect()
    phy_attach_direct()
      phy_init_hw()
        adin_config_intr()   /* read IRQ status, RMW IRQ mask */
      phy_resume()
        adin_resume()        /* writes CRSM_SFT_PD_CNTRL */

The commit message itself says MDIO data is stale until the reset
completes. Could these writes race with the unconfirmed SWRESET and be
lost?

The impact today looks limited:

- phy_start() calls __phy_resume() again at ndo_open, so adin_resume()
  runs a second time.
- The adin1110 mii_bus leaves irq[] at PHY_POLL, so the IRQ mask write
  has no functional effect.
- Before this patch, the MDIO bus scan and the adin_get_features()
  reads already ran right after the SWRESET without any wait.

Still, any PHY configuration added at attach time for these IDs could be
silently lost. Should adin1110_probe() wait for the reset to complete
before calling adin1110_register_mdiobus()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123115743.29523-1-iustin.stolniceanu%40analog.com
