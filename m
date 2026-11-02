Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589802;
	b=LLxvmC96Vftxcjl0ofYkPxP4lx7WQP1+1zhuNmyI27X8UF8vQEcXyxbzhvoM4Rpj7Ek1
	 qzCASAzZn4Bw8iWw2IYbuGP/T45wvGr02qtwPow2YkGZIyeDMZHwkfuxlaQuRBu3+8z0e
	 ABSXiYNSfjuggwI7477rduz2kNlhy3M7uCXvBHo04WRcQcrAVL/ASlgMFe4omXHAcg4sM
	 XrYCQJF5Ta270mNKPAsYx979pUUcnQsBRzLNvILtG9VbsAQdK/6wrDcEpTZHfJ2zdgPPp
	 r4R3ejB3H/rI9oGUfsndAalt8p6LfiT/0kRqdxT5ZElUM98XWDH4zmDaZh0quUJL+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589802;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bfSwM2hv4oi+ho9K6WW2gx/Ro7LKpjzjwUjhHb/0aA4=;
	b=OAezv5Rs6xKdQZRhOamwMHoqEWcv2TECsL0G2mKPjNm4u2NqnrQBKHVZROBk+Lr8p2zD
	 Drln1oBRTZbpldotlk/1Cxd3Hrx+oDfrS/WVxW26XWXHHx8HrKe6JijuaM4sdYOGMrYC2
	 4UNrNRKqtFM61qmgCN+K+NyruJT1mjg00icX4w8zA7TPOz3J0QlT2/sDhHKu6pv9WgGu/
	 CasDqCQ40OeKCvfaPDcTAjKcaP6jeN4amnmKkUSSj73si3AUGZhU9YqItS5DTQCyH9m6q
	 FnbGxXGsf8SIkZdCCwhwKda3pSxJztHJDcNL+P58/XS1c+jh9rHSWcY9oWqlL1kCNaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fh4PgZqw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4E606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 03:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fh4PgZqw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560F41F000C1;
	Mon,  2 Nov 2026 03:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793589801;
	bh=bfSwM2hv4oi+ho9K6WW2gx/Ro7LKpjzjwUjhHb/0aA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fh4PgZqw2lTtIbgX1P8sw5GfDIpdYF5k+hoA1DA/mhdJLE0GTgW6azJtiPRjM7c7Q
	 FXChYh4PLT9W49ZoBd1WmvA5PZlaiLgDOZeTZDZDdwEeC5a8NyVbPWmnvA0BoQnWsN
	 CG2hjwU9YQwlrr05YHLbNIAFHRCUS689Su8gfBSwc62PTCTOUXYfd4nLXf0sTsm0KT
	 ue3hpxKurA0gK5FUHgtJennopz2I7TX3ga50BOQGZYmCu2a7Fpqqt3Vx/5CPN6hYdN
	 8rbQokiAZ2/Ca6SDZPQimmnoLB+tgPxq58IznJdRXUe/JWsfTzPL4ENWkEUg7F7GHc
	 137FRiUqNWKvg==
Message-ID: <sashiko-outbox-192860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] phy: cix: Add Sky1 DP PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102030425.1957585-3-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
 <20261102030425.1957585-3-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 03:23:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: cix: incomplete hardware reset and state desync in cix_dp_res=
et()
--

commit ad82029ac97121969cc71e598d4b0b9c41076e02
Author: Luo Liu <Luo.Liu@cixtech.com>

phy: cix: Add Sky1 DP PHY driver

This commit adds a generic PHY driver for the CIX Sky1 dedicated DisplayPort
PMA, supporting link rate, lane count, SSC, and voltage swing configuration.

> diff --git a/drivers/phy/cix/phy-cix-dp.c b/drivers/phy/cix/phy-cix-dp.c
> new file mode 100644
> index 0000000000000..8e52d10d2595e
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-dp.c

[ ... ]

> +static int cix_dp_hw_reset(struct cix_dp *dp)
> +{
> +	int ret;
> +
> +	ret =3D cix_dp_toggle_reset(dp);
> +	if (ret)
> +		return ret;
> +
> +	cix_dp_phy_write(dp, CIX_DP_PHY_DATA_ENABLE, 0);
> +	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_RSTN_BITS, 0);
> +	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_EN_BITS, 0);
> +	cix_dp_phy_write(dp, CIX_DP_PHY_CONFIG_RSTN, 0);
> +	dp->powered =3D false;
> +
> +	return 0;
> +}

[ ... ]

> +static int cix_dp_init(struct phy *phy)
> +{
> +	struct cix_dp *dp =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(dp->apb_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D cix_dp_toggle_reset(dp);
> +	if (ret)
> +		goto disable_clk;
> +
> +	ret =3D cix_dp_hw_prepare(dp);
> +	if (ret)
> +		goto disable_clk;
> +
> +	ret =3D cix_dp_hw_load_regs(dp);
> +	if (ret)
> +		goto disable_clk;
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(dp->apb_clk);
> +	return ret;
> +}

[ ... ]

> +static int cix_dp_reset(struct phy *phy)
> +{
> +	struct cix_dp *dp =3D phy_get_drvdata(phy);
> +
> +	return cix_dp_hw_reset(dp);
> +}

[Severity: High]
When a consumer calls phy_reset(), cix_dp_reset() invokes cix_dp_hw_reset(),
which pulses dp->reset via cix_dp_toggle_reset(), clears the control
registers, and sets dp->powered =3D false without calling cix_dp_hw_prepare=
()
or cix_dp_hw_load_regs().

In cix_dp_init(), pulsing dp->reset is followed by cix_dp_hw_prepare() (to
deassert CIX_DP_CDB_RSTN and enable CIX_DP_AUXHPD_ENABLE_BITS) and
cix_dp_hw_load_regs() (to program cix_dp_reg_conf[] and
CIX_DP_PHY_PMA_PLL_RAW_CTRL over the CDB bus).

Since pulsing the hardware reset resets CIX_DP_CDB_RSTN,
CIX_DP_AUXHPD_ENABLE_BITS, and the PMA registers back to hardware defaults,
and phy_reset() does not decrement phy->init_count in the PHY core, won't
subsequent calls to phy_configure() or phy_power_on() fail with -ETIMEDOUT =
in
cix_dp_phy_cdb_ready() because CIX_DP_CDB_RSTN remains asserted?

Additionally, if phy_reset() is called while the PHY is powered on
(phy->power_count > 0), setting dp->powered =3D false desynchronizes the dr=
iver
from phy->power_count so a subsequent phy_power_on() is skipped by the core
while phy_power_off() attempts CDB accesses on a reset PHY. Conversely, if
phy_reset() is called before phy_init() or after phy_exit(),
cix_dp_hw_reset() writes to dp->base while dp->apb_clk is disabled.

Should cix_dp_reset() re-run the hardware preparation and register loading
sequence (or should .reset be omitted if cix_dp_hw_reset() is only intended
for teardown in cix_dp_exit())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102030425.1957=
585-1-Luo.Liu@cixtech.com?part=3D2
