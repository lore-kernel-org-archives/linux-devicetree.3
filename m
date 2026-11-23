Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399386;
	b=Y/SZQb7KcdDOVYoDkuMcPFCexqGrWBhLtdFAlyaJVk2Ah21XtHenRSU+xbdKhtufwc9e
	 uDQeLv9GKhTN+Jx2AWLKqxorRbk+H6uhKXuvMqZyxJFuMQy0/qu/ooPehwBHR7qCk0ndQ
	 7UKLe9fVnmVfva377nLsn/zu5gcXwnUQZpmgRAddTwrhk4GC+Cvdhl8yH+12D8HfkPWwv
	 logoPtuelCS3pyeq6ck14AqSqvkmpCNpXsUsSGH1si2xVLR6xqDwcJKOc9zmb3zHvmsm6
	 o2dfvcWLyDK/fByiqB80yUex/1Xdm9O9l9CUni2NUqszkCgN8/sEo50fLrndsHdlTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399386;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dS/g95f6ZA8WIoM3BVoKSGa1kqUguo5hr/prKce6FFc=;
	b=R/oD+uhL6AXtSz6rVkL+pclZW38FvcJsL52CuQ5NEwsZWkFQrERQfquMBQCunr53RndC
	 qz4MIz+y86n/CorAPDIlnhRX237NRrotKsnt1mC836Xt7G8ucoORklgcNeSU+D16mIyEE
	 /I+aAfnnphuxRV9jIXCmCEaGFgjZrzClQvy60m8lmKN570V1nmy0QLXrajx5aoz7saFgX
	 z6ZcbBfbuGZkOpT2b0SSJYPmPKUunV4tWxCHwSV/rmQsEk+x4i7BZ7HIpid1VxSq89Ba6
	 evRcB+U4B3l/QIt5yD7TjzFdY6s1hbmvf2huC8PHPv7jEK3fqZn2FkzTUQIi36ymRvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+rUCxNO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3587F606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+rUCxNO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2761F000CA;
	Mon, 23 Nov 2026 02:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795399385;
	bh=dS/g95f6ZA8WIoM3BVoKSGa1kqUguo5hr/prKce6FFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c+rUCxNOj+nF9y/T0bs8c0IuYLVNFjqPc3RADR6eLBYta71sjFuo7mjuAu0jS0xCY
	 MtoAZyANCJWUTo3T0J71iQCcda5fooGuGSG5tJHqf3CE/Z3CixglsCrk5vD9pQLuQ1
	 GoLW6fSqsg0qmZYxau5fOklxMyzC8nepbApf/AOfiF7XYOB+8y1rIBGpGcS8FWGbB5
	 As674qrK8UbMWG4ZHFzJYPO4Qa+G9OfFwwiqlrCx+twISBDL8kE52+/oLpG+fOXbZw
	 mrylp4kMDRestyaYYoyVBvdlqfv/s/AlsJQBj95efZNVQfbZAqLvf+ApQb5d88JjQv
	 +hZGfZC7TM2OA==
Message-ID: <sashiko-outbox-228541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/3] power: supply: cw2217: Add support for Cellwise
 cw2217
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123015035.369192-3-macroalpha82@gmail.com>
References: <20261123015035.369192-1-macroalpha82@gmail.com>
 <20261123015035.369192-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:03:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] power: supply: cw2217: cw2217_active() wakes chip before
  entering shutdown
- [Low] power: supply: cw2217: inaccurate writable and volatile regmap
  ranges
--

commit 9be66fa8e5df716905efd0c61236d0fe980e4cc9
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: cw2217: Add support for Cellwise cw2217

This commit adds a power supply driver for the Cellwise CW2215, CW2217, and
CW2218 I2C battery fuel gauges.

> diff --git a/drivers/power/supply/cw2217_battery.c b/drivers/power/supply=
/cw2217_battery.c
> new file mode 100644
> index 0000000000000..a25803865943e
> --- /dev/null
> +++ b/drivers/power/supply/cw2217_battery.c
> @@ -0,0 +1,878 @@

[ ... ]

> +/*
> + * The CONFIG register is used for the host MCU to configure the fuel ga=
uge IC.
> + * The default value is 0xF0, SLEEP and RESTART bits are set. To power u=
p the
> + * IC, the host MCU needs to write 0x30 to exit shutdown mode, and then =
write
> + * 0x00 to restart the gauge to enter active mode. To reset the IC, the =
host
> + * MCU needs to write 0xF0, 0x30 and 0x00 in sequence to this register to
> + * complete the restart procedure. The CW2217 will reload relevant param=
eters
> + * and settings and restart SOC calculation. Note that the SOC may be a
> + * different value after reset operation since it is a brand-new calcula=
tion
> + * based on the latest battery status. The BSP driver slept 20ms after r=
estart
> + * and 10ms after setting active, though no delays are documented in the
> + * datasheet.
> + */
> +static int cw2217_active(struct cw2217_battery *cw_bat, bool active)
> +{
> +	int ret;
> +
> +	ret =3D regmap_write(cw_bat->regmap, CW2217_CONFIG,
> +			   CW2217_CONFIG_RESTART);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(20000);
> +
> +	if (active) {
> +		ret =3D regmap_write(cw_bat->regmap, CW2217_CONFIG,
> +				   CW2217_CONFIG_ACTIVE);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret =3D regmap_write(cw_bat->regmap, CW2217_CONFIG,
> +				   CW2217_CONFIG_SLEEP | CW2217_CONFIG_RESTART);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fsleep(10000);
> +
> +	return 0;
> +}

[Severity: Low]
Should writing CW2217_CONFIG_RESTART (0x30) only happen when active is
true?

Writing 0x30 unconditionally means cw2217_active(cw_bat, false) in
cw2217_update_config() first wakes the gauge out of shutdown mode for 20ms
before writing 0xF0 (CW2217_CONFIG_SLEEP | CW2217_CONFIG_RESTART), producing
a 0x30 -> 0xF0 -> 0x30 -> 0x00 sequence instead of the documented
0xF0 -> 0x30 -> 0x00 reset sequence.

[ ... ]

> +static const struct regmap_range cw2217_ranges_wr_yes[] =3D {
> +	regmap_reg_range(CW2217_TEMP, CW2217_TEMP),
> +	regmap_reg_range(CW2217_CONFIG, CW2217_CONFIG),
> +	regmap_reg_range(CW2217_INT_CONF, CW2217_CURRENT_L),
> +	regmap_reg_range(CW2217_BAT_PROFILE,
> +			 CW2217_BAT_PROFILE + CW2217_PROFILE_SZ - 1),
> +	regmap_reg_range(CW2217_T_HOST_H, CW2217_USER_CONF),
> +};
> +
> +static const struct regmap_access_table cw2217_wr_table =3D {
> +	.yes_ranges =3D cw2217_ranges_wr_yes,
> +	.n_yes_ranges =3D ARRAY_SIZE(cw2217_ranges_wr_yes),
> +};
> +
> +static const struct regmap_range cw2217_ranges_vol_yes[] =3D {
> +	regmap_reg_range(CW2217_VCELL_H, CW2217_TEMP),
> +	regmap_reg_range(CW2217_INT_CONF, CW2217_SOC_ALERT),
> +	regmap_reg_range(CW2217_CURRENT_H, CW2217_CURRENT_L),
> +	regmap_reg_range(CW2217_CYCLECNT_H, CW2217_STB_CUR_L),
> +};

[Severity: Low]
Are the writable and volatile regmap ranges for CW2217_TEMP,
CW2217_CURRENT_H..CW2217_CURRENT_L, and CW2217_FW_VERSION intended?

CW2217_TEMP (0x06) and CW2217_CURRENT_H..CW2217_CURRENT_L (0x0E..0x0F) are
documented as read-only measurement registers, yet cw2217_ranges_wr_yes
marks CW2217_TEMP as writable and extends the CW2217_INT_CONF range through
CW2217_CURRENT_L instead of stopping at CW2217_TEMP_MIN (0x0D).

In addition, CW2217_FW_VERSION (0xAB) changes in hardware between 0x00 in
shutdown mode and the chip ID / firmware version in active mode, but it is
missing from cw2217_ranges_vol_yes while REGCACHE_MAPLE is enabled. If
CW2217_FW_VERSION is read while the chip is in shutdown mode (for example
via regmap debugfs), 0x00 is cached and subsequent reads in active mode will
return 0x00, causing cw2217_get_current() to fail with -EIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123015035.3691=
92-1-macroalpha82@gmail.com?part=3D2
