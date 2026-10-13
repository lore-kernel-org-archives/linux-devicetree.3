Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5737187B
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878518; cv=none; b=Slz9oD+T/bJ4XIjEy2uq50j17pBmS4HK0Yq/z3/2kW0QejYafOEttj+lZl62KC76W79fzbTevm8w6z8/ApEAs9etW04x5lOgQrqvXKenRKfGjMXQ+6QLW1+CwZX450IHsRitTNHOkOcTgIKam3Qrgvo0H8YNWSV6/O+fnhpwaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878518; c=relaxed/simple;
	bh=eME/eOqt2lXfnZO5XwNDdfJGKjZ9ApG1qkRoCZXHfbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLY81E+ZyiW9bJLDGABrgApw+Un8o0/tJaK6erBq5ieFUgSuhiL9+t1d9vKLOMjgN2dVegQs7w7EpDxyzZ5HIGX4a3yGV5g4v9W2fHwPjGAyMRSPecg0QwIELPH9QvhSDKKhiV57qylYApT/dXa39SAJJo1F5TJgVCd8bXTz+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vndo1C6f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE/1U6qM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vndo1C6f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE/1U6qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
	b=Vndo1C6f6GC5mkQB0CQAs6Ol0zYte2SI35SUoSUFZmvOSyiQdxK93YtoLA23VLPRjYhWu7
	v9FkW8CTI7If/+V28+Mzfms5T5S2etoRNoZ41cYN7zR0kTvD2oKGSiiWUohyj7mqzcjLuA
	i7qVbma6Pj946LLlv1fyDzVkANBUx3Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-E_buERH7NNuoEY0XG0R_zQ-1; Tue, 13 Oct 2026 08:01:53 +0000
X-MC-Unique: E_buERH7NNuoEY0XG0R_zQ-1
X-Mimecast-MFC-AGG-ID: E_buERH7NNuoEY0XG0R_zQ_1791878513
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3167afb84fso343408966b.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791878512; x=1792483312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
        b=aE/1U6qMSXtR7yzbEcKng+fBz1YTzZABmjktaO1b0EKDUWaFMcqZmweVqpkUqcsEWV
         bqLA7UnkxPqRt+EyfDYqLZyU/82wqNhj6RNlyd8xnAd2Jm0gWOxeOLquIeQaU+sVNMOg
         UEmdv+0QN3zM5Z7GcV64psYKJ4sGk2DMjVTFBLQfgXiIn+UKuGWFp2dGp7FeNLqgj0k5
         OZU83BHk+NtFLskK9Kt5EBrabkZfuTqc4RN1IaCfBrsis4qnEu5gW7kyQUzh2ulozR3G
         +JcwIboM6lU8UKOpmHFIS8cH3nUHg7bdHso/lkfLmhEFsvwuwjZE6xdZDv+7e2XO/qt5
         0w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878512; x=1792483312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
        b=pzSXiKUQcOE1Q8YqBriy9Rl1dP4Ce0ekESRW2TGJPyS1ZB6KDhESNyNjJDmRMieqSw
         rD7J8n5CbjaYQFwczuplTkY5EFjzn8bef9GGKxUG7z433aAeSijScdQUAc9fERzi5JJi
         tvgjPsenFk0dSdTv1I1f6XZxPlj39qfb9FsbaKSen1iIdIyV4uCA2e24KqFBGPFHvFZS
         rNIgMDwCRLAb1xFbcGXVw6Wjsnbl0uAFEU1o2M7rwavrBAP5K9+qq6bl1NnjoBP/+Fcs
         zE378uzC7A865W5it844NoCFUnyCs0wYky9YDBrm0a4uiyqkJhtU1IJd4Ac9iSfbqkVp
         cVgg==
X-Forwarded-Encrypted: i=1; AKwUvBzuCI1gBhXnHr4BoNmJLeN0BUCxCASe9Le6Xoh2zDUpr9qNqZvWBh6s4p50lEi5KPabPJ9qtE3jOzVq@vger.kernel.org
X-Gm-Message-State: AFq9FYIHdR1n4zGnFR7qxj4SlOHmiHbI2wRwiLSkSG0aTrbdIzV4XqZq
	o8mus0nBJR0KnVmtMSScVtOvCCYvIOxw3Bx8cly5B/1SUG4Mc3ToJVMbMZzDsMgr2XzuGpUcbyt
	kOrxQCLmTROzEPvljmkSYP9FZKqOCGswhcDRW9rrMtfMv6PVNI9WkC9YMWNHVvB8=
X-Gm-Gg: AYBFou0tQqr97IHdifjSvHirGegZgMPGF6OGmUbQrj9kIEtBCIDIZFhsfWSfe+vOyyi
	LAxJotXB/mhX9YO4JiRk3NXyEXUf0WQIbGQZyEH8RWmZ3bzORZmEIEJXO1c0SjJRjIAqvNPrclT
	QTTPUxwGNrdpc7tc+EgALoV/JfnLTLLpLwBkVmY7RhyguZd0DTOr879F2oM/7C3qk9ed17PkNF0
	zV3/RLDYKhOq2fSy0EUpC0jkw+cVY7qPWWdGF+lEWsjIzxW2zKYNnQz5/+Fw0abzkY993AvxPX8
	atidK+x2GImlQkgfdV0bxDpgK0pufvuLXXl+eMgOXn9A0g5Yjid05S74FCVj7Jivuk1PBp/Dn6e
	+Qjw4MirX7vEKNxIU084hUJmAmnL/d4Q2cNSFaOZlf8b4E4yBkKcpKaXCDCk5iLwmdBb5wPE8KA
	==
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522674a12.3.1791878512278;
        Tue, 13 Oct 2026 01:01:52 -0700 (PDT)
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522525a12.3.1791878510286;
        Tue, 13 Oct 2026 01:01:50 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm3308846f8f.21.2026.10.13.01.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:01:49 -0700 (PDT)
Message-ID: <91736242-7836-4eef-9415-738e48a63a52@redhat.com>
Date: Tue, 13 Oct 2026 10:01:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/3] net: phylink: wait for PHYs that are
 known to probe late
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
 <20261006124731.1528963-3-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-3-f@lex.la>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> A PHY that needs firmware from the host and whose driver has not bound
> when the MAC sets up its port is either taken by the generic driver,
> which cannot drive it, or not found at all; a MAC that connects once at
> setup, as DSA does, gets no working PHY on that port for the rest of the
> uptime. The case this reaches is a driver built as a module on a
> filesystem that is mounted after the MAC probes. Let the PHY declare it
> with needs-host-firmware and, for a MAC that opts in with
> phy_may_probe_late, poll until the driver binds instead of failing. A
> driver that has bound is not covered, whatever it does about firmware
> afterwards. Neither is one whose probe has already failed: the driver
> core does not retry it, and the poller cannot tell that apart from a
> driver that has yet to load, so it keeps polling.
> 
> Deferring the MAC's own probe is not an option: it keeps every port of
> that MAC down until the module loads, and forever if it never does, and
> those ports can include the one needed to mount the filesystem that
> holds the module. Return 0 rather than -ENODEV, because DSA reads
> -ENODEV as permission to look for the PHY on the switch's internal MDIO
> bus, which is the wrong device.
> 
> The deferral is opt-in because it returns 0 with no PHY attached, and
> some callers read 0 as a PHY being there: ucc_geth dereferences
> dev->phydev later in the same open, and enetc, stmmac, mvneta, sparx5
> and lan743x do one-time PHY setup at that point that a late attach
> would skip.
> 
> The deferral also needs an interface mode known up front, as without one
> the MAC would be configured for PHY_INTERFACE_MODE_NA when started
> before the PHY supplies its own. It is limited to PHY mode without an
> SFP cage: in-band, the PCS can bring the link up with no PHY to gate it,
> and an SFP PHY can take the port while the wait is armed and drop the
> wait on removal. The poll runs only while phylink is started, so nothing
> touches the PHY of a stopped port, as at switch shutdown; a port that is
> down attaches at its next start.
> 
> Wait for a driver that has bound, not for a device that exists, because
> the generic driver would otherwise bind and cannot drive such a PHY. If
> the real driver goes away between that test and the attach, the generic
> one binds instead or the attach fails; when the driver is gone after the
> attach, the poll keeps waiting without counting a failed connect. The
> attach-versus-unbind window itself is phylib's to close and is not
> closed here.
> 
> A connect that fails with the real driver bound is retried a few times
> and then given up on with one line, because silence from a poller reads
> like success. Each retry re-runs the PHY's init and, on boards whose DT
> gives it a reset line, pulses that reset, at a cost that depends on the
> board and the PHY, so the retries are bounded. Stopping after the first
> failure would leave a DSA port, which connects once, dead until the
> switch driver is rebound.
> 
> Until a PHY attaches, report no link modes and refuse the ethtool
> settings that would configure the MAC alone for a link that cannot come
> up.
> 
> Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch): the EN8811H
> behind lan4 has its driver on the root filesystem, the switch sets its
> ports up before that is mounted, and lan4 was lost for the uptime. With
> this change and the DSA opt-in that follows, lan4 attaches once the
> module has loaded and the port is up. The retry path was driven there by
> a local debug parameter that fails the connect after a successful
> attach: two injected failures were retried a second apart and the third
> attempt attached, and with failures that never stop, four attempts ended
> in one "giving up" line and no further polls.
> 
> Assisted-by: LLM
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> Changes in v6:
>   - defer only in MLO_AN_PHY and without an SFP bus
>   - poll only while started: phylink_start() queues the poll,
>     phylink_stop() cancels it, the poller's STOPPED test is gone
>   - a failed attach with no usable driver is a lost race, not a retry
>   - commit message: ndo_open argument dropped, board sentence updated
> 
>   drivers/net/phy/phylink.c | 232 ++++++++++++++++++++++++++++++++++++--
>   include/linux/phylink.h   |   5 +
>   2 files changed, 229 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a7d086cdc9b2..ec76138f1065 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -98,6 +98,16 @@ struct phylink {
>   
>   	u32 wolopts_mac;
>   	u8 wol_sopass[SOPASS_MAX];
> +
> +	/* The poller writes these while it runs; arming cancels it first. */
> +	struct fwnode_handle *late_phy_fwnode;
> +	u32 late_phy_flags;
> +	struct delayed_work late_phy_poll;
> +	unsigned int late_phy_poll_ms;
> +	unsigned int late_phy_waited_ms;
> +	u8 late_phy_retries;
> +	bool late_phy_warned;
> +	bool late_phy_gave_up;
>   };
>   
>   #define phylink_printk(level, pl, fmt, ...) \
> @@ -1831,6 +1841,18 @@ int phylink_set_fixed_link(struct phylink *pl,
>   }
>   EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
>   
> +static void phylink_late_phy_poll(struct work_struct *work);
> +
> +/* Synchronous: the poller reads the node put here. It only trylocks
> + * rtnl, so a caller holding rtnl cannot deadlock on it.
> + */
> +static void phylink_late_phy_cancel(struct phylink *pl)
> +{
> +	cancel_delayed_work_sync(&pl->late_phy_poll);
> +	fwnode_handle_put(pl->late_phy_fwnode);
> +	pl->late_phy_fwnode = NULL;
> +}
> +
>   /**
>    * phylink_update_pause_state() - Update the phylink pause frame configuration
>    * @pl: a pointer to a &struct phylink instance
> @@ -1989,6 +2011,7 @@ struct phylink *phylink_create(struct phylink_config *config,
>   	mutex_init(&pl->phydev_mutex);
>   	mutex_init(&pl->state_mutex);
>   	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_DELAYED_WORK(&pl->late_phy_poll, phylink_late_phy_poll);
>   
>   	pl->config = config;
>   	if (config->type == PHYLINK_NETDEV) {
> @@ -2068,6 +2091,8 @@ EXPORT_SYMBOL_GPL(phylink_create);
>    */
>   void phylink_destroy(struct phylink *pl)
>   {
> +	phylink_late_phy_cancel(pl);
> +
>   	sfp_bus_del_upstream(pl->sfp_bus);
>   	if (pl->link_gpio)
>   		gpiod_put(pl->link_gpio);
> @@ -2337,10 +2362,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>   }
>   
>   static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
> -			      phy_interface_t interface)
> +			      phy_interface_t interface, u32 flags)
>   {
> -	u32 flags = 0;
> -
>   	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
>   		return -EINVAL;
>   
> @@ -2378,7 +2401,7 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   		pl->link_config.interface = pl->link_interface;
>   	}
>   
> -	ret = phylink_attach_phy(pl, phy, pl->link_interface);
> +	ret = phylink_attach_phy(pl, phy, pl->link_interface, 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -2390,6 +2413,134 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   }
>   EXPORT_SYMBOL_GPL(phylink_connect_phy);
>   
> +#define PHYLINK_LATE_PHY_POLL_MS	1000
> +#define PHYLINK_LATE_PHY_WARN_MS	60000
> +#define PHYLINK_LATE_PHY_POLL_MAX_MS	30000
> +#define PHYLINK_LATE_PHY_RETRIES	3
> +
> +static bool phylink_late_phy_pending(struct phylink *pl)
> +{
> +	return pl->late_phy_fwnode && !pl->phydev;
> +}
> +
> +/* Stale the moment it returns: the device lock this wants cannot be held
> + * across the attach, whose own failure path takes it again.
> + */
> +static bool phylink_phy_is_usable(struct phy_device *phy_dev)
> +{
> +	return phy_dev && device_is_bound(&phy_dev->mdio.dev) && phy_dev->drv;
> +}
> +
> +static void phylink_late_phy_backoff(struct phylink *pl)
> +{
> +	pl->late_phy_poll_ms = min_t(unsigned int, pl->late_phy_poll_ms * 2,
> +				     PHYLINK_LATE_PHY_POLL_MAX_MS);
> +}
> +
> +static void phylink_late_phy_poll(struct work_struct *work)
> +{
> +	struct phylink *pl = container_of(to_delayed_work(work), struct phylink,
> +					  late_phy_poll);
> +	struct phy_device *phy_dev;
> +	bool again = false, lost_race = false;
> +	int ret;
> +
> +	if (!rtnl_trylock()) {
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		goto requeue;
> +	}
> +
> +	/* A PHY arrived by another path while queued. */
> +	if (!phylink_late_phy_pending(pl)) {
> +		rtnl_unlock();
> +		return;
> +	}
> +
> +	/* Stable here: whoever clears it waits for this work first. */
> +	phy_dev = fwnode_phy_find_device(pl->late_phy_fwnode);
> +	if (!phylink_phy_is_usable(phy_dev)) {
> +		if (phy_dev)
> +			phy_device_free(phy_dev);
> +
> +		if (!pl->late_phy_warned &&
> +		    pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS) {
> +			pl->late_phy_warned = true;
> +			phylink_warn(pl,
> +				     "still waiting for %pfw (needs-host-firmware)\n",
> +				     pl->late_phy_fwnode);
> +		}
> +		/* Past the warn it may never come: stop paying 1 Hz for it. */
> +		if (pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS)
> +			phylink_late_phy_backoff(pl);
> +		/* The first run is immediate, so count the sleep ahead. */
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		rtnl_unlock();
> +		goto requeue;
> +	}
> +
> +	ret = phylink_attach_phy(pl, phy_dev, pl->link_interface,
> +				 pl->late_phy_flags);
> +	if (!ret && phy_driver_is_genphy(phy_dev)) {
> +		/* Lost the race: the attach bound the generic driver, which
> +		 * is the outcome this poller exists to avoid.
> +		 */
> +		phy_detach(phy_dev);
> +		lost_race = true;
> +		ret = -EAGAIN;
> +	} else if (ret && !phylink_phy_is_usable(phy_dev)) {
> +		/* The driver went away under the attach: wait for it again. */
> +		lost_race = true;
> +	}
> +	if (!ret) {
> +		ret = phylink_bringup_phy(pl, phy_dev,
> +					  pl->link_config.interface);
> +		if (ret) {
> +			phy_detach(phy_dev);
> +		} else {
> +			/* Only a major config programs the masks bringup
> +			 * narrowed.
> +			 */
> +			mutex_lock(&pl->state_mutex);
> +			pl->force_major_config = true;
> +			mutex_unlock(&pl->state_mutex);
> +			/* MAC before the PHY, the order a start uses. */
> +			phylink_run_resolve(pl);
> +			flush_work(&pl->resolve);
> +			phy_start(phy_dev);
> +		}
> +	}
> +	if (lost_race) {
> +		/* Not a failed connect: the next poll waits for the real
> +		 * driver.
> +		 */
> +		again = true;
> +	} else if (ret) {

The above `if` chains feels unneedly complex. I think you can simplify
it consolidating the out/error paths using more labels.

/P

