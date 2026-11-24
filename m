Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560638;
	b=sNrFm65eLrJy5ZixkSWVQzEKiFRIPHpKtZcZhH4kmO70JLbLwqsXx9vUGIKMlXOeRyD3
	 5OBz3LwaeouSj15/e0MXrlHqeBae0Qp+iNCpp1+7ozAeLuyXBRKG9iWsXRvJUdDlurAs3
	 B+OFVKgRhGZJZYWXPDBPwEFVN7cpxXk5j3fkjYL3CRJPwme7m6cwQUAWSYTZ8ycObYAI9
	 D2lHpvHydHUmJyFhY0I285lkzkTCXy5UI63CNE65Sbg5Ts5X7qOq3Irtb6lMpHK/GFpeW
	 1FQg5w3ThkSfvKien/vBq4QoNzszDg0y4p0ROc/qsEe0iSQ+Xd6uwWXwa9QtTbCpuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TueIWr7fbo9wBN1ZAJf51GMVXwwjxzoBawGGU4Vu8Ds=;
	b=hcjLgqVhoNqmy5PGVIbdTp1r0nKH4ErQt65y7w5YKqeEu3hXM8bRLc4z3/qvJJp6BPD+
	 xSZ/nMyLOXLCPte5NTqmWBRtFOuXU8ABa4MROVDx9hdswXUZXU+tEW4retLMJ/rDTsCJN
	 7HPOXBGj9ubTDbQK3jUYolmsud5L52ODmSulZLQQouPurtgiaQpLcShvHHAodg2Ndo1Tc
	 AqwYVDMKCGwy7Uh7q3oQmhhmk7x12owCLYTNJgmLuva2HZ4e/PdQhRrtGt2MpeKJ79RjT
	 NSDsQCQt730o5oqceu6cNUcDE7CbwGkR5f1AFe9Kno7IoMR/z0WEJGJ/lgH9aVgY7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgZE+67u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A89606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgZE+67u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072211F000D0;
	Tue, 24 Nov 2026 22:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560637;
	bh=TueIWr7fbo9wBN1ZAJf51GMVXwwjxzoBawGGU4Vu8Ds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YgZE+67u6wM8MpRbfVdtn9s4LcpOGoLFy8yVqtIxOcrfqBrrQJ6SqklUtIVCUrsNR
	 4RQhNkLzzzxoujurkaXgmWBSxrotl29PM3FBdh/SNpAlZAzQQsLclWzD/QgBQt8lnl
	 GHKxt/hX9S/JfWatrPn/DNvOweSRt07D5sE/MF2hDVzOMGvmaBxkpEFRl3Mg36sjFp
	 3A+9lrehnJsSfMqHroBojhH9HipgDI4prgnWYcIkF9Cqq0arlWOpf+F9YFbmxM8qbp
	 QzHXyA6NDvZpllHMNU02PILXf57R9t76zLQtMa6HTUjDFyFjhwY+ZnQuuFOLilB3QL
	 OGXfENm6rCuxA==
Message-ID: <sashiko-outbox-232159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] phy: airoha: Add support for Airoha AN7583 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261124222452.219832-4-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
 <20261124222452.219832-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:50:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] phy: airoha: broken 0-cell PCIe xlate and type check in
  an7583_usb_phy_xlate()
- [High] phy: airoha: broken USB host mode and SerDes init in
  an7583_usb_phy_init()
- [Medium] phy: airoha: unshifted AIROHA_USB_ANA_TX_RESERVE_8 write to
  register 0x28
- [Medium] phy: airoha: write RX_IMP_SEL to INTF_STS_9 in
  an7583_usb_phy_set_mode_eth()
--

commit 8d0f29ff8d877f4177177940f87f2d0a3776baf6
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: Add support for Airoha AN7583 USB PHY

This commit adds a PHY driver for the Airoha AN7583 USB PHY (supporting two
USB 2.0 ports and one USB 3.0 port) and the AN7583 PCIe Gen2 PHY.

[Severity: Medium]
In drivers/phy/airoha/phy-an7583-usb.c at lines 225-228 and in
an7583_usb_phy_set_mode_eth() at lines 671-675, should
AIROHA_USB_PMA_RX_IMP_SEL_SEL and AIROHA_USB_PMA_RX_IMP_SEL_FORCE be written
to a PMA interface control register instead of AIROHA_USB_PMA_INTF_STS_9
(0x364)?

All other *_SEL and *_FORCE override pairs live in the INTF_CTRL_5..8 block
(0x314..0x320), whereas AIROHA_USB_PMA_INTF_STS_9 (0x364) is the status
register read for AIROHA_USB_PMA_ADDR_INTF_STS_PLL_VCOCAL during KBand
calibration.  Writing the RX impedance override to the status register leav=
es
RX impedance unconfigured in SGMII and 2500Base-X Ethernet modes.

[Severity: Medium]
In drivers/phy/airoha/phy-an7583-usb.c, inside an7583_usb_phy_u3_init() at
lines 1092-1093 and an7583_usb_phy_pcie_init() at lines 1378-1379, should
AIROHA_USB_ANA_TX_RESERVE_8 be wrapped in
FIELD_PREP(AIROHA_USB_QP_TX_RESERVE, ...) when updating
AIROHA_USB_ANA_QP_TX_MODE_16B_EN (0x28)?

At lines 157-160, AIROHA_USB_ANA_TX_RESERVE_8 (BIT(8)) is defined relative =
to
AIROHA_USB_QP_TX_RESERVE (GENMASK(31, 16)), and an7583_usb_phy_set_mode_eth=
()
at lines 726-729 shifts it with FIELD_PREP(AIROHA_USB_QP_TX_RESERVE, ...).
Passing raw AIROHA_USB_ANA_TX_RESERVE_8 to regmap_set_bits() sets bit 8 in =
the
lower half of register 0x28 instead of bit 24.

[Severity: High]
In drivers/phy/airoha/phy-an7583-usb.c, how are USB host modes and SerDes P=
HY
mode selection expected to work across an7583_usb_phy_init() (lines
1408-1429), an7583_usb_phy_u2_set_mode() (lines 1663-1699), and
an7583_usb_phy_u3_set_mode() (lines 1701-1731)?

There are three related issues in these paths:

1. During HCD registration, usb_add_hcd() calls
   usb_phy_roothub_set_mode(hcd->phy_roothub, PHY_MODE_USB_HOST_SS) and fal=
ls
   back to PHY_MODE_USB_HOST only if that call returns an error.
   an7583_usb_phy_u3_set_mode() only accepts PHY_MODE_ETHERNET and
   PHY_MODE_USB_DEVICE_SS, returning -EOPNOTSUPP for both host modes and
   causing usb_add_hcd() to fail when the USB3 PHY is enabled.  Even if host
   modes were allowed in the switch statement, forwarding PHY_MODE_USB_HOST=
_SS
   or PHY_MODE_USB_HOST to phy_set_mode_ext(instance->serdes_phy, mode,
   submode) will be rejected by en7581_serdes_phy_set_mode() in
   drivers/clk/clk-en7523.c, which only accepts PHY_MODE_USB_DEVICE and
   PHY_MODE_USB_DEVICE_SS for USB.

2. In an7583_usb_phy_u2_set_mode() at lines 1678-1690, PHY_MODE_USB_HOST_SS
   hits the default case and returns 0 without updating
   AIROHA_USB_PHY_U2PHYDTM1.  Because the PHY_MODE_USB_HOST_SS call succeeds
   on USB2 PHYs, usb_add_hcd() skips the fallback call with PHY_MODE_USB_HO=
ST,
   leaving AIROHA_USB_PHY_FORCE_IDDIG unset.

3. Unlike an7581_usb_phy_init(), an7583_usb_phy_init() runs
   an7583_usb_phy_u3_init() and an7583_usb_phy_pcie_init() without configur=
ing
   instance->serdes_phy.  Because usb_add_hcd() calls usb_phy_roothub_init()
   before usb_phy_roothub_set_mode(), USB3 setup and KBand PLL calibration =
run
   before instance->serdes_phy is switched to USB mode; and because
   mtk_pcie_enable_port() in drivers/pci/controller/pcie-mediatek.c only ca=
lls
   phy_init() and phy_power_on() without calling phy_set_mode(),
   instance->serdes_phy is never configured to PHY_MODE_PCIE.

[Severity: High]
In drivers/phy/airoha/phy-an7583-usb.c, does an7583_usb_phy_xlate() at lines
1775-1814 break lookups for airoha,an7583-pcie-gen2-phy and skip matching t=
he
requested PHY type against instance->type?

an7583_usb_phy_probe() at line 1987 registers an7583_usb_phy_xlate() for bo=
th
airoha,an7583-usb-phy and airoha,an7583-pcie-gen2-phy.  However, the binding
in Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
specifies #phy-cells =3D <0>, so args->args_count is 0 for PCIe and the che=
ck at
line 1786 (if (args->args_count !=3D 1)) unconditionally fails with
ERR_PTR(-EINVAL).

In addition, when args->args_count =3D=3D 1, lines 1806-1811 only check that
args->args[0] is one of PHY_TYPE_USB2, PHY_TYPE_USB3, or PHY_TYPE_PCIE rath=
er
than verifying that args->args[0] matches the resolved PHY's instance->type.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124222452.2198=
32-1-ansuelsmth@gmail.com?part=3D3
