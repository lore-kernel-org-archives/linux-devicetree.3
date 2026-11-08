Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121412;
	b=SyCc8hxd/vXroSG39HHf/Nob9nLeLph5wYpWw+kWCFpaffCbxmIwXC/wWeYMrGGLvB75
	 6rYqTU9mqcDQfFsEOks9FsE+FR7jWb6Phc5YKCZLRritnuUWGimr5mAjMwXkgZ4i3P+bd
	 vqCohv7CKRFZvVGb3nlJqzSyqdstQWzGefTD/ZcHCIXZ4s8FuTnTRENWMdigqXpz5N49q
	 ueVW9vk/CDeDSa4ZIqbntzizIL27LV6h6+bFRsTWWX/amfBZh4fVrjmHNccT9or1TNsdr
	 WJbBDY+lQxXSHc0ZAZR26rAGhEcb7fuZoEO2j0vJYG5Ux0gNi2TiowzfaZTz2oZyCMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121412;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=IRes2um7LcI+zwFwAOWCssD3mzaYM0bLkUyWPRGzsxw=;
	b=UGhHqeVvNFH9oT3mmZ32iYfKGu+7p5apy3/9ZdawV6AGSp+mVaOOI64uQB6X5Z6oznHi
	 ElsFN2oUHFVAUnMOxCG6aD4cyT0/78N2ezaRRErX5p5Xo+qPOQ9kUZQxvYD7pZabdSWOy
	 J3oeE2l9TidaJG7Y4fv/b6FdlsCw/efc54OQbIA9ZhgCRqdyvJsp3fgZ/salBOfG0kuZa
	 qJ1LhJt2W5xXY1ty2wOnSS/hVyz/CNTe5ZjUIbB9krjpHi9iOkeW5+pYzMgmNtIDTuM2b
	 dU06QszCxXWKKPFgWU/7FTLpwoSphjOHmQB6r8MS6NsvT5Z+7roh8p4UTHqQzPSy5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=temperror header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=MZ13uAgl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aOIIlh6I;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC4606A31E
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 07:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=MZ13uAgl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aOIIlh6I
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AF4D31D00192
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 02:03:31 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 08 Nov 2026 02:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794121407; x=
	1794207807; bh=IRes2um7LcI+zwFwAOWCssD3mzaYM0bLkUyWPRGzsxw=; b=M
	Z13uAglNNOl4p58edW+QtTrV89aezWI2wwGhHfoElKV06Lyz9h09bHXgQsuuzvkJ
	+A4pFxkTa+vMgNulVzaU4fAniGwoDtQyzQp31H24M2KEo5iPnKTWQRXlZowXEZII
	979OA0c1fyu0wxm4lpadJs9liIRUSHo+x19aIBT8UqpbQiM2+Qg0rUxARzQ/VqrO
	6jBDdUaW+54XyxwV3a7n3vr4xKgQnYCvZH+I++LYWtLla4IX6XHpb2/kurbIBnfR
	WRrezUesUbNYM++D/Gb6bqkRGuQyYnj504rRAYIzkuq6JsI1SH2esUbCWmtq61g3
	e/GsLR9paMxsee3yT/XIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794121407; x=1794207807; bh=I
	Res2um7LcI+zwFwAOWCssD3mzaYM0bLkUyWPRGzsxw=; b=aOIIlh6IahVYYtSNk
	dO8Jj7vyatgaSYUp1vlwFqji9CDkZBbet41b9Wnd8P79InBy75hA8bYtYHe6PE3V
	HCR9EQY25zHXvymH3DQ4mjQvw5W7kOgKoOjm6DoqYJGW488pXENpOmq1CKwI9jia
	VqrmNWf/8qN9MN16APKoi+PEeEJM5/ezVpPRic5SraiGitA2VA4IUV/GM1aqrKui
	xQEtNAibMWTo1rsskVGyadeRCUcIjnpvHzvojieBCjr25R5qf42bPFhoJO79idLL
	tm7UwPoeFtpmyWyEt2Ml8AiNMMDbsscDL5FR7OytvUHEQOuU6MOZW3k3ERZxg7h6
	nzQAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121407; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:BnmAuIdy9P2/VykXPVZDSYBbH6hjt+O49dsOQdLqloE2xte
	2+V4rwDnlHbexOI+54jOkO96TkdMrocfXGWhiwKAyCaEm3spKica1lQVaj7GFmMj
	CMdnVHrdULfrNfz7G2kBAvkmGN3dK1onV0bpV5qrdLZMXLj6P0UmWBicz8CIUbwl
	T/04otUDTLjvmFUVC2Mgs0m5w7+FTFa3PRsAf9Frx6b2qNB2cFGDJIJsAyMir/9X
	u0cDNfMdvFCpFH7uaJa0GTDJY5ogv4VH84LcZNOKkiuZ8zBVj7+Qllv3Aj6w0lFi
	p1utxxwZ0ywgmxtzP2tQ1cHMGr6RfZneI/qqreQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YI2DMIfaDPqryy5aD0nYeni/jN07BFflwcZcH1hJTXk=:eDF/WEfB3FKkhl2mFWHY04DxTLrwzhESCn7yqSIUbQY=;
X-ME-Sender: <xms:vh7wahW15AmoKBcJIL9S4Apw2fqzzv2uMEqo2yMRj77SDZAHKziSTA>
    <xme:vh7wattCTOE0MRroa7mdHtq5REIWIuE-O2bgHukfKKaX708TMlPOjTwxX4chFpnis
    gtsTvQtGYJzTWg7u1H0kxoE4CyxxD8_y-NOTAGtsLX31s0A4pWteaI8>
X-ME-Received: <xmr:vh7wampVwrrC_ZQNA2OfA2Q-XCzk7q77Q4_h1TLb0WIMTSMQooj6xPPTIbL8i3NLhRa9C9uV>
X-ME-Proxy-Cause: dmFkZTGpKH8/Ps+zd3+68W/7URuBNqPAxvEFlxkitBvDIa9dmmH5bI5DROhMR36kCuVVdW
    4fjJKdH+oT/RA2qf+M6U0mK5wpLj6DCSEkUtRbtc5v34EvKn+/daWmVZXfEi9ChVOsIVNh
    sADPDV+6ekV/ZIZR0X0VweqF4DDZuAv0BPsU6MV/hpUcjjA/A1Iel41sruFRI/eyNjhQHI
    ouYW4FWFEFQCsDRh8TjniSjayptnRQ/sjVp5H+9EvlpPrQOsQJ5bUS36OavvuRQmn6BKP0
    crk07ugYy8337ojXo2QFmg0JMjvH0P3vuQTyWsRg16hpof0mkg8Q9KMmyjRBmqjMufheA2
    YeqeTeUD/DEmMPa+2mJUq86gfWG1j8yU2Rr+2oWztDH+ZcJRAstBhXwycoOtY44rrajMeH
    HNMSIzFAPCu4goo8cqxsiLyfh2k1ELlm1rXL8GIiSuOcA3T+s3nGtUPYCbkpvEa4oqMr+z
    ie7WHiF9ssQppb8+mfSYEZAcvP587fx2D27jjleyxVZZz+SPmpXAnHb0IF4g6JeaQWyC9c
    JNFdS6+loYmnF3lWZYoi9NDRFgRLv3VPHmAji1a8xbbI/t44WdgNrMmBqxoYS6Ul+MCeGf
    rwhYBZCsAMA8m8c4T5FbemEyX0+k+tkrLc83WzeJYds5GquvuszuT2e1lzeQ
X-ME-Proxy: <xmx:vh7wajb_Fhsn5jm7CRJ03HZKMK4zXjSIIpoRkLma2QmPI5zVlk0NOA>
    <xmx:vh7wavwkXaIeuJOtltjohTZZkiUwTvitx7TY-nz83jzVBgqpSs6WOA>
    <xmx:vh7wah8cFUYnH6DS8jdSVm0QFUrSL7ODgx2k3WW5787MDJVYLqto0Q>
    <xmx:vh7watVVnz65He0EzA8jWZ2MG6EfgDn7rxpWcycFiAWoSy3gkPiYcQ>
    <xmx:vx7waqL3OQeMEkhuN6dVFEFnM-zw569368i_dl58FWAfURbgN_Dq-lYm>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 02:03:18 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v16 14/16] arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
Date: Sun,  8 Nov 2026 19:59:15 +1300
Message-ID: <20261108065917.135194-15-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108065917.135194-1-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
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

The two NPU cores of the RK3576 share the CBUF and the DSU, so PD_NPU0
and PD_NPU1 also need the three clocks that PD_NPUTOP already lists.

Also add a BIU reset to each NPU power domain. The pmdomain driver cycles
it when the domain powers on, so the bus interface works.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 7828736bf9ac..508ed48b7bee 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1159,14 +1159,22 @@ power-domain@RK3576_PD_NPUTOP {
 						power-domain@RK3576_PD_NPU0 {
 							reg = <RK3576_PD_NPU0>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN0>;
+								 <&cru ACLK_RKNN0>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN0_BIU>;
 							pm_qos = <&qos_npu_m0>;
 							#power-domain-cells = <0>;
 						};
 						power-domain@RK3576_PD_NPU1 {
 							reg = <RK3576_PD_NPU1>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN1>;
+								 <&cru ACLK_RKNN1>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN1_BIU>;
 							pm_qos = <&qos_npu_m1>;
 							#power-domain-cells = <0>;
 						};
-- 
2.43.0

