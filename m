Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370955;
	b=3QcSODBlH1uI3pdcF3J5G1sV9gmJUzgab+ETFRX1X0JbvTOVpFOeLB+i4gVPzDswOzcw
	 QlrcYddOfXlRprb9Azv6YFuTnBV9A4w+r9WRO0vQPdmjtuxswcPgg87puLgcAeBTk6TQA
	 L/RxF+cZoKZ/WCa+JIlqoFqNR7PTqJxQCUb5Ez1abj2E060PArZexmsvgEgavLcr3ruwZ
	 dKTMyPnWYo978wk1ytAnLCU4wbM3ZByMvfEoxspMxrAQY3I7lBCAyQFUx6utiE+A3WIFo
	 Ng+e2YrhNuE6v5InPKOSVHL+UUHD9leR2j09HRHajTBtoaDmtiAHJQhoBPl7wJapoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370955;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tGte33G70WlD86NL9KI+4i6b5lHMmJ/9O0wo+2lnvSU=;
	b=3tQ8Ib+IsoMbch8quNmNXNmHx7Gw9YuXxstMucybzmQcGWkHVJn4yYJqFnS8SBdv3Cia
	 x0X2ByY8OEU1oB68qOodzbARf1w16xk/a0RUk8PcNmFPA6J/08EwrlDNFZYaA7MVbB7wc
	 nbUZ5ql/Q7qoSAoKN9/8ytI2us67hRHqUzbxR1clbNkpymuUSULKK50Qkk/riYyyBTNkL
	 5biofx4BeIPYmNW/cu5tHMO2olhn4VE8E6H2lKx7J0S9P41I9WcC8IkIh6sY1xJ2e5dIh
	 milkZ4OYTm+gT0GH13NurO/3cniWygcDj+gJL+3XsYSw6TBCwcWJvxUpm8XBQt4dyog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSRM09eR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A2606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSRM09eR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094911F0093C;
	Wed, 11 Nov 2026 04:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794370955;
	bh=tGte33G70WlD86NL9KI+4i6b5lHMmJ/9O0wo+2lnvSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSRM09eRzWBmIW+bWl4meqV7Eoc5/xP7rWf0aNZzmQxnjbYzAQWkHJnq/cyREiknl
	 qzh7skHWVwRETSJMUlBpRAPS6Jcxtvt1mRRsao4rfB71d+dQ5Cv295wLvhGrxkfa0P
	 xAndvgI1ZHoSjHDPTwPNEai6pYqtYGahK8GhKmJ/vLD/yXSJLSk8N5VD1/4HY1dNUY
	 OCxPoOCIv5V6t6aogBOY8anGk8ybQDEyIBqVynGdLTrc6DwQjALDfQ5of2f52tYEQA
	 kifZfnxhTR6tBjfIlF1/z1A6SxtziBNkZRhGO0MnmzeZS623RwCrcn8NKiQmFkl7Ks
	 3A9Unpln0+eXg==
Message-ID: <sashiko-outbox-208274@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] i3c: mipi-i3c-hci: Add support for the AST2700
 I3C controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-6-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-6-4d8fff5c5196@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:22:34 +0000
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
- [Medium] i3c: mipi-i3c-hci: NULL deref and missing offset check in
  hci_extcap_vendor_ASPEED()
- [Medium] i3c: mipi-i3c-hci: ACK_L programmed with hcnt instead of lcnt
  in aspeed_i3c_phy_init()
--

commit adcbd5aae214cefb55e76d2928d998852108ffaf
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Add support for the AST2700 I3C controller

This commit adds vendor capability parsing, resource management, interrupt
summary handling, PHY timing setup, and DAA index configuration for the
ASPEED AST2700 I3C controller.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.c b/drivers/i3c/maste=
r/mipi-i3c-hci/aspeed.c
> new file mode 100644
> index 0000000000000..3aa910e786f8e
> --- /dev/null
> +++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
> @@ -0,0 +1,351 @@

[ ... ]

> +int hci_extcap_vendor_ASPEED(struct i3c_hci *hci, void __iomem *base)
> +{
> +	struct aspeed_i3c_vendor_data *vd =3D to_aspeed_vendor_data(hci);
> +
> +	vd->inhouse_regs =3D hci->base_regs + readl(base + 0x04);
> +	vd->phy_regs =3D hci->base_regs + readl(base + 0x08);
> +
> +	return 0;
> +}
> +
> +bool aspeed_i3c_vendor_cap_found(struct i3c_hci *hci)
> +{
> +	struct aspeed_i3c_vendor_data *vd =3D to_aspeed_vendor_data(hci);
> +
> +	return vd->inhouse_regs && vd->phy_regs;
> +}

[Severity: Medium]
Can hci_extcap_vendor_ASPEED() dereference a NULL vd pointer or populate
non-NULL register pointers from zero offsets?

EXT_CAP_VENDOR(ASPEED, 0xc0, 0x08) is registered unconditionally in
vendor_ext_caps[], whereas hci->vendor_data is only allocated in
i3c_hci_probe() when HCI_QUIRK_VENDOR_RESOURCES is set.  If an ASPEED
controller is bound without HCI_QUIRK_VENDOR_RESOURCES (for example via the
generic "mipi-i3c-hci" compatible), i3c_hci_parse_ext_caps() calls
hci_extcap_vendor_ASPEED() with hci->vendor_data =3D=3D NULL and crashes.
Similarly, the other four vendor quirks (HCI_QUIRK_VENDOR_BUS_SETUP,
HCI_QUIRK_BOARD_PHY_TIMINGS, HCI_QUIRK_VENDOR_INTR_SUMMARY, and
HCI_QUIRK_VENDOR_DAA_INDEX) dereference hci->vendor_data without checking
that HCI_QUIRK_VENDOR_RESOURCES allocated it or verified
aspeed_i3c_vendor_cap_found().

In addition, unlike the section parsers in i3c_hci_init() that check
"offset ? hci->base_regs + offset : NULL", hci_extcap_vendor_ASPEED() adds
readl(base + 0x04) and readl(base + 0x08) directly to hci->base_regs.  A
zero offset in either register yields hci->base_regs rather than NULL, so
aspeed_i3c_vendor_cap_found() returns true and later vendor or PHY writes
overwrite the core HCI registers at hci->base_regs.

[ ... ]

> +	hcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_SCL_H_NS, period_ns=
);
> +	lcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_SCL_L_NS, period_ns=
);
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL1,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL1_SCL_H, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_PHY_I2C_FM_CTRL1_SCL_L, lcnt));
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL2,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_H, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_L, hcnt));
> +
> +	hcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_HD_DAT_NS, period_n=
s);
> +	lcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_AHD_DAT_NS, period_=
ns);
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL3,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL3_HD_DAT, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL3_AHD_DAT, lcnt));
> +
> +	hcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_CAS_NS, period_ns);
> +	lcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SU_STO_NS, period_=
ns);
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL0,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL0_CAS, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL0_SU_STO, lcnt));
> +
> +	hcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SCL_H_NS, period_n=
s);
> +	lcnt =3D aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SCL_L_NS, period_n=
s);
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL1,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL1_SCL_H, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL1_SCL_L, lcnt));
> +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL2,
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_H, hcnt) |
> +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_L, hcnt));

[Severity: Medium]
Should ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_L and
ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_L be programmed with lcnt instead of hcnt,
matching ASPEED_I3C_PHY_I3C_OD_CTRL2_ACK_L further down?  Passing hcnt sets
the I2C ACK SCL low period to 1130 ns in Fast Mode (below the 1300 ns I2C
minimum tLOW) and 380 ns in Fast Mode Plus (below the 500 ns minimum).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-b4-i3c-hci=
-ast2700-v2-0-4d8fff5c5196@aspeedtech.com?part=3D6
