Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF161917CD
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720740; cv=none; b=boT5z/zT19b+mHDPyffApiMHlp8zKv1hhd+FMiJqty/yZc4Kv7pog6M7xIyGEK4W+l7WHLqyeLCP2mQMWGXP2dZdwIean+6zRwpwZ6hwIBwp6YW/JrxFFo3s+041FGg04j+IrYWHtgVkLMv0nXXdRnSU/HdBx6jGLbOaBcXNujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720740; c=relaxed/simple;
	bh=QuZG72zqFgS1Kb1l8jzBJpt+NnuYVJ+uBTccd4gWr8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bmPu1kv7cyl+bHU5eu8cBQTVCesJz6QN1YBxJcbYphieEVtHaDuDA0jt/l1JhYSdE1xjzNAmHd7YNrY1rHANaJGllqKXKXZObrSGdn9JGtBRIWuSBOzU+lKGQVN+/3AKd+HE5KQyXNvxCHtuQC3AUHsW04qfGONuHooinPDOobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eu1Ceaa1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eu1Ceaa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACB61F00898;
	Tue, 29 Sep 2026 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720738;
	bh=s0GNA6vkJPeYiifjViw0BQieJ8ftx0iO1wKEmeYgH1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eu1Ceaa1VzREV6ba0vE5AAnFAU8IuQYDzXgHj+Ib8vo7V9oNlbpOcGhQHdwyBJeUn
	 Ypc3TCjiDOnvRYZUQVG6oOJhDy6W3X+brTvYy2BdPcWQu+h6cw3dg+NnMI/MmWP1at
	 zBXkvmwX3OW6Lp91qB6hB/DiZHm2lRfEvE6ECev6ZJUNZ4bt/Bjj+7f2ZdNrce5x9K
	 BbVqJCLl+OW3ck5YVZQg37zmGug0/EiX7qjO0VfC4KiUWQe1pNM/RCb9NdpsKTqbuc
	 rmPa2mLGCHQ8GeaY+oamReXk0MiomS4I7D9pPFeKfAqRErnVznkvHu/zIbWpLrKT8v
	 bmEMrydUQDPaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 10/11] onsemi: s2500: Add driver support for
 S2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-s2500-mac-phy-support-v8-10-7e011aacc309@onsemi.com>
References: <20260928-s2500-mac-phy-support-v8-0-7e011aacc309@onsemi.com>
 <20260928-s2500-mac-phy-support-v8-10-7e011aacc309@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:25:37 +0000
Message-Id: <20260929222538.2ACB61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] net/s2500: multicast filter remains disabled after specific MAC =
programming
- [Medium] net/s2500: multicast filter slot race condition due to incorrect=
 register write order
- [Low] net/s2500: uAPI violation by exporting standard rx drops in ethtool=
 -S
--

commit d393e2edea43d8c612d285df4be05c1d1b4fc7d4
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Add driver support for S2500 MAC-PHY

Support for onsemi's S2500, 802.3 cg compliant Ethernet
transceiver with integrated MAC-PHY. Works with
Open Alliance TC6 framework.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> @@ -0,0 +1,369 @@

[ ... ]

> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"rx_mismatch_drops",
> +};

[Severity: Low]
Is it necessary to export this standard statistic as a custom ethtool -S
string?

This counter maps to S2500_MSTRXDROPPED_IDX which is a standard rx dropped
statistic. Per the networking subsystem guidelines, statistics that have
standard interfaces (such as rtnl_link_stats64) should not be duplicated
in private ethtool strings. Could this be moved to the standard interface?

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
> @@ -0,0 +1,523 @@

[ ... ]

> +static int s2500_set_multicast_mode(struct s2500_info *priv,
> +				    unsigned int rx_flags,
> +				    struct netdev_hw_addr_list *mc)
> +{

[ ... ]

> +	} else {
> +		u32 addrh, addrl;
> +
> +		/* Disable multicast filter */
> +		ret =3D s2500_mac_ctrl_modify_bits(priv,
> +						 S2500_MAC_CTRL_MCSF,
> +						 true);
> +		if (ret)
> +			return ret;
> +
> +		/* Disable filters */
> +		for (i =3D 1; i <=3D S2500_N_MCAST_FILTERS; i++) {
> +			addr =3D S2500_REG_MAC_ADDRFILTH(i);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr, 0);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* Slot 0 holds the unicast MAC, multicast starts at 1 */
> +		i =3D 1;
> +		netdev_hw_addr_list_for_each(ha, mc) {
> +			const u8 *mac =3D ha->addr;
> +			int slot =3D i++;
> +
> +			addrh =3D S2500_MAC_ADDRFILT_ENABLE |
> +				get_unaligned_be16(mac);
> +			addrl =3D get_unaligned_be32(&mac[2]);
> +
> +			addr =3D S2500_REG_MAC_ADDRFILTH(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							addrh);

[Severity: Medium]
Does writing ADDRFILTH before the other filter registers introduce a race
condition where the hardware filter might incorrectly match or drop packets?

The ADDRFILTH register contains the S2500_MAC_ADDRFILT_ENABLE bit, which is
being written before the lower address bits (ADDRFILTL) and masks (ADDRMASK=
L,
ADDRMASKH) are configured. Should the ENABLE bit be written last, similar to
how it is handled in s2500_set_mac_filter()?

> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRFILTL(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							addrl);
> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRMASKL(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							0xffffffff);
> +			if (ret)
> +				return ret;
> +
> +			addr =3D S2500_REG_MAC_ADDRMASKH(slot);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							mms, addr,
> +							0xffff);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +	return ret;
> +}

[Severity: Medium]
Will this leave the multicast filter globally disabled?

When s2500_set_multicast_mode() is called to configure a specific list of
multicast addresses, the filter is explicitly disabled at the start of the
else block via s2500_mac_ctrl_modify_bits(..., S2500_MAC_CTRL_MCSF, true).
However, it appears the function completes without re-enabling the filter
after the slots are successfully programmed, potentially passing all
multicast traffic to the CPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-s2500-mac-=
phy-support-v8-0-7e011aacc309@onsemi.com?part=3D10
