Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247282;
	b=2qkYI4JqJLcJifgh2H/w0WruajV1WVjH6wer5OV41oVkNxUVDIrvWgEFXgnRrL/eW8tu
	 KzrCZWvIa+28n8H9Rq4rlk3rlWU/J1vKdNHUrpQTDUqOzDejclauHaD359kEILYi6Vw34
	 wjn7haZAH2AnwLFD3yRKrfKWwdYEw6G3rzKxuWVoy71sn4BbW+MBmg+NTwMarIrJXu8SX
	 Aj31nBOivxeZ+IFOKaYnFkMs4Kg6nl8XIwW0M/TgTyfsS+/gfdGVg5Ka5upKBi/Sezfbj
	 ry0Slb84xT6StgfD1RQA6YhPcWZCKQvxrARqrTpr6y/t8cnCT0SqNN6i4YcZlbjckEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247282;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ueMDV0zkslEtYlqqHnL9zl53jNUKumH06vyFp4k6ec4=;
	b=K+WRgTGLPHxMFcPia4RVapcHvMHt7Wahn47/wWZc9AC+LSKjsJl7mEA7xtEP/zNpvqeN
	 3XPzdCtQPxqIe8u3P6dUmW09+EF3qvarkHzVHyZpU1JDf74kt7gTrAkvD9cXoSmrzV0pK
	 uzkg+rSiulqtPCtgNPqWK7Lb4p0xx2GuZXxKSGurBcL49KRLbUeP5rejie8hw4eGDAXSQ
	 QUdFQVTUdmu5jY1Suo+BwvLXV6E05bmUxTYW97M6+Xvo2EfRRk8/7dVa1KbliJvebDm6t
	 WwU8D2T/3Z7Mqtgf0Kozhvlgv7KbCWER9Le+TTJ1SKUYWol14Y6KS4MVp2EWPUwQywA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=aOm7QODZ;
	arc=none smtp.remote-ip=203.205.221.205
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5B0606A320;
	Sat, 21 Nov 2026 07:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=aOm7QODZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795247278; bh=ueMDV0zkslEtYlqqHnL9zl53jNUKumH06vyFp4k6ec4=;
	h=From:To:Cc:Subject:Date;
	b=aOm7QODZCPcqAogHM32Qn4FWsJ1oWBg0CbzM4avlVw+ZsXO/M+1nX084nZjuUtsCM
	 XpD5nP/cjoAaDz51O8s65n/qC0ar2sOGi6nH2Z2Ol4EKwUJJd5/PbfvWHuy4QT9DVv
	 TX2KMH3wJdguYSbNBpOTXEs7oXRnFAb28QPbBv2o=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BF71E40F; Sat, 21 Nov 2026 15:47:55 +0800
X-QQ-mid: xmsmtpt1795247275t7989d969
Message-ID: <tencent_A28766992BC445C76A277305A50C1F300107@qq.com>
X-QQ-XMAILINFO: NJFIk87MF7ke+lAfbXH+n5m+tBBi33Z+EksO7USaool3hU1zORwg9X5LECpz1Q
	 9u66McU12v8kHWrAV2S8Vu2HTSsGMCla6imSgNgn9nxbW9arLh/IvFP1bqAS0kqT06OPlJJOPj1R
	 jXBYAfDDlx3QylMEu4uvzjNlGO4zwvGJXF1YmMwbwE9Ihgtg4w/FQkArmlVW16iuhPy4LTSJcbCQ
	 EhIqO4RKdqHunG1kmpUvGYm6qtcXP9jqZybxzuD5cjHz/AgnfS7TugbHC8QSgIx+qjayX4jmxIr7
	 fS4XkLhi2aVoi60xC3tN52xIEPVT2Sn2hVxPocqXhNwO5e5juS61RwYrIUImumSqiPOygRzP0TlM
	 tA/hxm/7cygsFLuDbRjxY3iBBR8FQVKaNLlweflA1iIXLRouae6KFsrxfoHmZAWjcnVxttq0X5t2
	 YEV4H1Dsy+IqvXcVMwYi9hO/YUeNR5xcGIR98Vv6qJitJxyR9VYhum4Q0RjlH2gTWnWpHHEwFJ9b
	 l4LN/gTa8oL4dz35zvt0o9PUYLeIGFz8l7izyuKO24GAkhuqyZ4I+WO2oqNtK0ek+DajNo8xwntm
	 zC0gjXv1Ni2nlpn94ufYIU+RLmbK/+S/00ZPzI/PiyK8xjKZiUzqO1ab/tNMYjGeN0G3moM2uGUZ
	 7uu4IEetI8tqqJplvzpQic7aV/fb9uX9+z+lrG3xFzm1zxDviq0t4ejdwM8/arbMmy0BzAqQt+DM
	 AbqIPPK3Q4mtr5Q9xmLn0uHxmUFO5ZmY7nNMWWD0HLMElbDZh1B9PBAnmOfZC05JSupKxzEEVySM
	 mM3DApCrFloajaZkUXDgABdXBbmLCt04afYYVywrJ93QGiW1IIrw7ZFM1pwFBxKPSRzDydU2QeB6
	 pdZn++p3ORTObvDU3qYTI1zuwrczUDyXIRRNfZik6zuEEWStWW/S68gq+fuPx3DpcX8jII4s5WaT
	 mt1vXhfMp3MOG0dc6htiPTmmxy/1kROkgk9CdMxRpzLJirCR27ETz4u8w69nQJAuLZJnIFSimxnU
	 gv5m6wEcu5JNb+rvqta+MbpGdm/HYx8w0TBHG9aLt7WE3nMZpP11MT0SoIL8eXRKc4QsRBhg0RbD
	 y6jGdcc8oNU8qVqRSRaUbDBbdQGqP7dsN1jzC9vQLHXhI71WvWFNgtDEkae8aMluR8oakZ
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] phy: rockchip: inno-usb2: add RK3506 support
Date: Sat, 21 Nov 2026 15:47:52 +0800
X-OQ-MSGID: <20261121074753.1262819-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB2 PHY configuration for the RK3506. The PHY needs a
board-specific tuning sequence: the OTG differential receivers are
disabled in suspend mode, the HS eye height is reduced to 425 mV, and
the Tx fs/ls linestate is selected from the TX driver.

Tested on an RK3506B board: USB host mode enumerates devices and a USB
drive mounts correctly; device and OTG modes work, including adb.

Tested-by: ZhuXiangyu <1194781887@qq.com>
Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 848c07cc..634fdbb0 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1617,6 +1617,53 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	return ret;
 }
 
+static int rk3506_usb2phy_tuning(struct rockchip_usb2phy *rphy)
+{
+	int ret;
+
+	/* Turn off otg0 port differential receiver in suspend mode */
+	ret = regmap_write(rphy->phy_base, 0x30,
+			   BIT(2) << BIT_WRITEABLE_SHIFT);
+	if (ret)
+		return ret;
+
+	/* Turn off otg1 port differential receiver in suspend mode */
+	ret = regmap_write(rphy->phy_base, 0x430,
+			   BIT(2) << BIT_WRITEABLE_SHIFT);
+	if (ret)
+		return ret;
+
+	/* Set otg0 port HS eye height to 425mV (default is 450mV) */
+	ret = regmap_write(rphy->phy_base, 0x30,
+			   (0x05 << 4) |
+			   (GENMASK(6, 4) << BIT_WRITEABLE_SHIFT));
+	if (ret)
+		return ret;
+
+	/* Set otg1 port HS eye height to 425mV (default is 450mV) */
+	ret = regmap_write(rphy->phy_base, 0x430,
+			   (0x05 << 4) |
+			   (GENMASK(6, 4) << BIT_WRITEABLE_SHIFT));
+	if (ret)
+		return ret;
+
+	/* Choose the Tx fs/ls data as linestate from TX driver for otg0 port */
+	ret = regmap_write(rphy->phy_base, 0x94,
+			   (0x03 << 3) |
+			   (GENMASK(6, 3) << BIT_WRITEABLE_SHIFT));
+	if (ret)
+		return ret;
+
+	/* Choose the Tx fs/ls data as linestate from TX driver for otg1 port */
+	ret = regmap_write(rphy->phy_base, 0x494,
+			   (0x03 << 3) |
+			   (GENMASK(6, 3) << BIT_WRITEABLE_SHIFT));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {
 	{
 		.reg = 0x17c,
@@ -2366,6 +2413,80 @@ static const struct rockchip_usb2phy_cfg rv1108_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rk3506_phy_cfgs[] = {
+	{
+		.reg = 0xff2b0000,
+		.num_ports	= 2,
+		.phy_tuning	= rk3506_usb2phy_tuning,
+		.clkout_ctl_phy = { 0x041c, 7, 2, 0, 0x27 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x0060, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0150, 2, 2, 0, 1 },
+				.bvalid_det_st	= { 0x0154, 2, 2, 0, 1 },
+				.bvalid_det_clr = { 0x0158, 2, 2, 0, 1 },
+				.idfall_det_en	= { 0x0150, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0154, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x0158, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0150, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0154, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x0158, 4, 4, 0, 1 },
+				.ls_det_en	= { 0x0150, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0154, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x0158, 0, 0, 0, 1 },
+				.disfall_en	= { 0x0150, 7, 7, 0, 0 },
+				.disfall_st	= { 0x0154, 7, 7, 0, 1 },
+				.disfall_clr	= { 0x0158, 7, 7, 0, 1 },
+				.disrise_en	= { 0x0150, 6, 6, 0, 0 },
+				.disrise_st	= { 0x0154, 6, 6, 0, 1 },
+				.disrise_clr	= { 0x0158, 6, 6, 0, 1 },
+				.utmi_avalid	= { 0x0118, 1, 1, 0, 1 },
+				.utmi_bvalid	= { 0x0118, 0, 0, 0, 1 },
+				.utmi_ls	= { 0x0118, 5, 4, 0, 1 },
+				.utmi_hstdet	= { 0x0118, 7, 7, 0, 1 },
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0070, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0170, 2, 2, 0, 1 },
+				.bvalid_det_st	= { 0x0174, 2, 2, 0, 1 },
+				.bvalid_det_clr = { 0x0178, 2, 2, 0, 1 },
+				.idfall_det_en	= { 0x0170, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0174, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x0178, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0170, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0174, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x0178, 4, 4, 0, 1 },
+				.ls_det_en	= { 0x0170, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0174, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x0178, 0, 0, 0, 1 },
+				.disfall_en	= { 0x0170, 7, 7, 0, 0 },
+				.disfall_st	= { 0x0174, 7, 7, 0, 1 },
+				.disfall_clr	= { 0x0178, 7, 7, 0, 1 },
+				.disrise_en	= { 0x0170, 6, 6, 0, 0 },
+				.disrise_st	= { 0x0174, 6, 6, 0, 1 },
+				.disrise_clr	= { 0x0178, 6, 6, 0, 1 },
+				.utmi_avalid	= { 0x0118, 9, 9, 0, 1 },
+				.utmi_bvalid	= { 0x0118, 8, 8, 0, 1 },
+				.utmi_ls	= { 0x0118, 13, 12, 0, 1 },
+				.utmi_hstdet	= { 0x0118, 15, 15, 0, 1 },
+			}
+		},
+		.chg_det = {
+			.opmode		= { 0x0060, 8, 0, 0, 0x1d7 },
+			.cp_det		= { 0x0118, 19, 19, 0, 1 },
+			.dcp_det	= { 0x0118, 18, 18, 0, 1 },
+			.dp_det		= { 0x0118, 20, 20, 0, 1 },
+			.idm_sink_en	= { 0x006c, 1, 1, 0, 1 },
+			.idp_sink_en	= { 0x006c, 0, 0, 0, 1 },
+			.idp_src_en	= { 0x006c, 2, 2, 0, 1 },
+			.rdm_pdwn_en	= { 0x006c, 3, 3, 0, 1 },
+			.vdm_src_en	= { 0x006c, 5, 5, 0, 1 },
+			.vdp_src_en	= { 0x006c, 4, 4, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,px30-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3036-usb2phy", .data = &rk3036_phy_cfgs },
@@ -2375,6 +2496,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
+	{ .compatible = "rockchip,rk3506-usb2phy", .data = &rk3506_phy_cfgs },
 	{ .compatible = "rockchip,rk3528-usb2phy", .data = &rk3528_phy_cfgs },
 	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
-- 
2.47.3

