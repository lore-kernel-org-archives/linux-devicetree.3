Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644639;
	b=4cF3h5AilYNdIrBTCySCZRvj45JzsdDJWr5FAN6YpmY3PF8ssU8DXL9ng1dpkG42G390
	 wt0pNtCEPQOQ+DkfjXNBAgTshb6A0FwCElZqq1tlJ+YQu8LigQxYhhmi+rDmUNc+DS7Aa
	 JyhIJKwZzK/d7MjwV3wmmHRbf5w7i85Sg7MXb4Rv4iyqzJLUBCDlRqxqxsOStqtfIHBsW
	 dpeM9XPYEIyZ3nqZ/HS0nMEp/9aXhIOVCPswdhDy0PmKeUhLb/fC+zuzhg715XpMBhAY3
	 s1PmJVyzgkKoYkO+4fdq1sp9FOFtjPDuKY787nyo5D9mZitmYRd25t6/rfQ1ld8kr/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VNaCYiHVpb2CzKkqWD5JKKy7PO3iyY44NCCg1E1LIy8=;
	b=d9OdKSv9B40n4iyHRqs4wCGwSHjZ4V2Bl+CWOi/YKmWFwfMeWJtXTgDCKAzL3vmAp8o7
	 LGyXP89g2P33dn4NztwOfcBGrd6Cu0DlOfKuCNebq9ET9fVbG/xaPXwgsjgCOXNimKx2a
	 jimrwJp72IjijgDBf94Y+rRDdC9t8VJMi+xB8uY1mLJ0in8n17ePliOpHfXbSYUo/mZuS
	 uydKsEpIfWheYP7Q6jrcDn2wCLqNoyj8yyda20GLeMxkmFHskShOYbwsNcJXCFj5kNcEI
	 yUsRPaM34wjDgWqOCp+xYo6sU64cqoPLFvfJEBKTy4z1tmTvmFmpUuAVRdplbbEcdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahXjUPTa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C047606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahXjUPTa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888C01F000ED;
	Wed, 25 Nov 2026 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795644638;
	bh=VNaCYiHVpb2CzKkqWD5JKKy7PO3iyY44NCCg1E1LIy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahXjUPTaKT/q9azQiyFrf+TIBkomfetf62XkISV7hNcWdume5vqkGytADDnPz65TQ
	 Xdmhor6sxHaAK3CokhbRQrjZDTAl9bCDF//7vRwKIizLvhuPFspEipQbqBq1GBDIrl
	 fgCnwlxiYUXf0RFbqXowK8fZpwiZ/JtwPFnZivPVPB7EGLATqaNCde/2uU4Jr/qW9P
	 uooDsaXp+T2IEZOXZoRIHRi+ZM/W/HYa4vMe2bja59K9SajKDJklICMYMYesM6e5I1
	 ECocgtXwRqQq3+zgUHX1PdP2q49r/sLm9RzC7F7aHRHCAj0YOsxFj+1RYLpl4snMOj
	 Ajw/ehAvLuDkg==
Message-ID: <sashiko-outbox-234235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 15/15] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-s2500-mac-phy-support-v12-15-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
 <20261124-s2500-mac-phy-support-v12-15-3575855d99f9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:10:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: onsemi: s2500: unlocked stats_last_update read and update
  race in s2500_update_stats()
--

commit 9d3f5419946ef1ff66db03059d964b7e06436b9d
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: onsemi: s2500: Add driver support for S2500

This commit adds a network driver for the onsemi S2500 10BASE-T1S
MAC-PHY using the OPEN Alliance TC6 framework, including ethtool
statistics and register dump support, multicast filtering, and PTP clock
support.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..77d7d172efe0d
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> +void s2500_update_stats(struct s2500_info *priv, u64 *buf)
> +{
> +	u32 regs[S2500_NUM_STAT_REGS];
> +	bool have_regs =3D false;
> +	u32 addr;
> +
> +	if (!time_is_after_jiffies(priv->stats_last_update +
> +				   S2500_STATS_CACHE_PERIOD)) {
> +		addr =3D FIELD_PREP(S2500_REG_MMS_MASK, OA_TC6_MAC_MMS1) |
> +				  S2500_REG_MAC_STOCTETSTXL;
> +		have_regs =3D !oa_tc6_read_registers(priv->tc6, addr, regs,
> +						   S2500_NUM_STAT_REGS);
> +	}
> +
> +	if (!have_regs && !buf)
> +		return;
> +
> +	spin_lock_bh(&priv->stats_lock);
> +	if (have_regs) {
> +		priv->stats_last_update =3D jiffies;
> +		s2500_accumulate_stats(priv, regs);
> +	}
> +	if (buf)
> +		memcpy(buf, priv->stats_data, sizeof(priv->stats_data));
> +	spin_unlock_bh(&priv->stats_lock);
> +}

[Severity: Low]
Can concurrent calls to s2500_update_stats() from s2500_stats_work() and
an ethtool statistics callback race on priv->stats_last_update and the
clear-on-read hardware counters?

struct s2500_info documents that stats_lock protects both stats_data and
stats_last_update, but s2500_update_stats() reads priv->stats_last_update
without holding stats_lock or using READ_ONCE() while another context can
write it under stats_lock, causing a data race.

Because nothing serializes the cache-expiry check, the clear-on-read SPI
register read, and the counter accumulation, an ethtool query can also
observe a stale snapshot after the work item has already cleared the
hardware counters:

kworker                           CPU0 (ethtool)
s2500_stats_work()
  s2500_update_stats(priv, NULL)
    !time_is_after_jiffies(...)
                                  s2500_get_eth_mac_stats()
                                    s2500_update_stats(priv, st)
                                      !time_is_after_jiffies(...)
    oa_tc6_read_registers(...)
      (clears HW counters, holds delta)
                                      oa_tc6_read_registers(...)
                                        (reads 0)
                                      spin_lock_bh(&priv->stats_lock)
                                      memcpy(buf, priv->stats_data, ...)
                                        <-- misses kworker's cleared delta
                                      spin_unlock_bh(&priv->stats_lock)
    spin_lock_bh(&priv->stats_lock)
    s2500_accumulate_stats(priv, regs)
    spin_unlock_bh(&priv->stats_lock)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-s2500-mac-=
phy-support-v12-0-3575855d99f9@onsemi.com?part=3D15
