Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165700;
	b=09n6hbDG4uBaMPPYO/fTCFebdbniZtuknCCf2wULr+RTN4Fl+HtlZVekwLkeyx88ZWUo
	 vffk0Hn7aj1yD8G3EBfQPkCvIfZ4VyPQI3ScHJgazu5/ReRpwSKzLkB0lfXUN+nvuq0a9
	 FhxPq5O7rLJSNoE5NgLCuAASM7+XbZBcrORQsqZJJr8rQjLY6zpTFHye6O/0IUZfpz+vy
	 ZJUocuQnKKj1r/PxuO3VyDnjr63SS0SZpdfqHIe7pHTdT4Mrogtj0Dln2YoPrqQ1+1UNg
	 MC/v9+NzgfzRi4nUClwIoS55qHwEnhFJs+q1lfhealOxKuCuxQ3+3XODv6e6/nhYZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165700;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Eb8Btk76s77msHfVg+/TsIgZczD+oc/KLRtiVpgTo1M=;
	b=CxfxW+43I81KVoau+3ghOtNRqnzSisIuVfqOwEoLDzgIllyGcWB6JQMKXoa5a96UpCge
	 ImieMXg7dvO34am9vEfnz8JkeX27AfQBSpWTfO5fx11K3hfS8T93/3t+jm/TXk/nwHZID
	 hbSIxFtI83vVyOCnerzo3eiQV1PyQ/WGMju7Kkq8QSn0cAqLmRXmD7BuIsju4wC/a2crF
	 94htn7Idz6xThykRCfe0p5k/8y4K4qydizBJJ0N0CEbFbCxXjS04+/mksw2pRtmejpwzv
	 GreOoMLvNO/6fiyE0YdA3LZ9tSaDXC7gwBUdTgKP152H25GF+E5kM3dsn5rQJ4v3RTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jschaer.ch;
	spf=pass smtp.mailfrom=jschaer.ch;
	dkim=pass header.d=jschaer.ch header.i=@jschaer.ch header.a=rsa-sha256 header.s=fm3 header.b=R7mugJqw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aivISwZU;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D83606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D83606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jschaer.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jschaer.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jschaer.ch header.i=@jschaer.ch header.a=rsa-sha256 header.s=fm3 header.b=R7mugJqw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aivISwZU
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 43BA81D00385
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:08:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 04:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jschaer.ch; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1795165698; x=1795252098; bh=Eb
	8Btk76s77msHfVg+/TsIgZczD+oc/KLRtiVpgTo1M=; b=R7mugJqwUYfPgsmGbc
	SszqyzftyFV9n3wx7kM0YsvVz7T9k9/VqO460/q7F9yY6H2HIbHcgGx4RF0AWDFr
	Z+JUVGPY2ApuVBEqocNWQxwqn74MRtt2zvzJhtSFK/uQo4doHYIIZR1TguupzC/h
	4RC1fluJHyjGux0CLtZZrD3U7J4qyJY6B2oRZPy42vTykPYSNQQrnnxTXN+Eukmx
	Ciw4nfFg2NmdL3t/nG29FyR/DZtzkSjMnMs4CS3uJ/PD+5t5J4/D3O9khu/oT+gz
	nxqfspeYw4LtLFU2xibTRLxdiP6vxf1BxJzZ0YsX2xzqWnFlPZGe/nNvCVXvp4S/
	jdgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795165698; x=1795252098; bh=Eb8Btk76s77msHfVg+/TsIgZczD+
	oc/KLRtiVpgTo1M=; b=aivISwZUn2zhIH8UpkCWHs8XgMSuBSmznlNynCgur5pv
	0UOgLS5NQ9Q2zPMZnOoMAaUyvU8kePoar/+cnOI22wZpwb6iiXCSGqn9UCbuuAl+
	jyDf67QuaGUM3iu33dUOnOmOkOcUAWA3CLb3nSl8Y23mobfsXOaBlCeO+D/xbQcs
	UZyye2wUcQPKL3fosgk6GJVFovJFTSrDDIjFvpgSSZeIDfhMa5GetuOUMEABbZAl
	+Lu7X+7ySM4yHKtLAcDi+Nby6RW2WZJSUGfYvDxgRXASi3DG40wI0WjYH17LN40H
	ZrbVC//ZnJGx2q6YkUCpBZSSnnH+60AFhdvo64AZlg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jschaer.ch a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795165698; d=jschaer.ch;
	mf=PGphbkBqc2NoYWVyLmNoPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:cbH9hVhABnNooUU8tEcMPsK5JgJTYQYaSsUEkjwlYGJQcbg
	KABzZGtZS2jYM86Xdihqf4pp89qT/FJCmA006IOYXjqCNYwU5eiha2Mp+YAt7xyi
	BA3oxfMUqERA0FV+Yg3T3aXoSl4g3jvM+yFws1gZSo5WzOgdK+d3rH7ZDvsCpn6W
	f/l+IFLT0F1vlUch+N8b5TtqoAyQqvffaw2uN7hY5cFYIoAW5e0iOKjbj+1OFlMq
	A/oFunmFNnNcY2q2zvZpSZFhYgpx8N2hhCpSPEGW/ZMSNYuCeB5dGMZQndv3hmCU
	aVfUQaPYn7wM+2ZOwY931OLmfKK3uQnuaPT8qzg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:Dina7eqkP6ZONZ96ujKUKkvbXZTPeYWQAoG52r4zcww=:FR2VA/pOmFjNjYQfGp/Vu41XJ6bW+af+V+qlyrlnlKU=;
X-ME-Sender: <xms:AQ4AawcOQEq8hAqLVsgyS7VWNn3BKC2j7qU-MJJqrE7PuvNmNdk81w>
    <xme:AQ4Aa-wpIKKjDJOZywtIyWjFem4lBE5WDfydhZbMOx7kCz7s0eMefHex8Dch-86DO
    GYySGDeJ3WQf2Y9pEQIVYA6x4syeljbtocwpaKcjCvOft-I3y_PWnm6>
X-ME-Received: <xmr:AQ4Aa18akq4b1w6Tjm5A3iM2Jlbkmib7tGKbnMWOtd3spWcSf299fJh4ueEnJiz2MX4h9FVTsKG9zpkhF-5tXC9wYrV1DuAKyDdL>
X-ME-Proxy-Cause: dmFkZTEXrV/HxlQ+uFM1Vvb9hd4Fep4Iz7Tfl+ZCU5TmlMm/EV93OgCR0ATk9L7A99QwOy
    t0RPc+JM/E3+efD0A1zZzQDEgEVeRKlQV8JnS2tyog0XUVE0hlAgUZYJ0csH1Mp+7ZkW4K
    YejMfg+em/LD9OHm2YlDpgGQMPeAxj6esbPowGt/wARofr9MAN6kX3ZdRdMdXA4OLgzo9S
    gBxovOQaLhRYEXg9ALRDWtgNnJI4XWZsdxKa5K8QkafhqhaJa1NJnyQosnz1eMf0kpb+IP
    rDxVGtdTSUAZc12x9SCfDx/PGeh+rJkaiD1O8kvgxPQZ/wPzP5VRHE6SA5U5SAdqePz1Fp
    OHnEgevTHtK8SVk2DFGUxlX2347kVenhVkjgc4VOwR4AsC6mBWHhNjNdDolCdNyVBE1HQN
    skPvz8997Ik8YwVeX7IZp6mUU+cf+vYXbhUJnBp846VeGOW6iMJgf0Rm/oulqnswzB3Han
    tdX7KU10kLPMmvEC2g6f7d+cwNj27S89aunyRH+L+5hZ0xo1csJJGg2AGNEi/cPMe43rHL
    PU98yQ/X+TX0czpFs5PLjr763GSDIkcqXaNDgwaXN4rjGivmiR7hyege0vsrb9uVtiO2Lz
    3OD2yr9uNmI9muURCdWUup4wAK4R+OuIy1X29RbnEWjAjnY4srGWkwiimsUQ
X-ME-Proxy: <xmx:AQ4Aa8yV73luS7OIuxK7I1OVLM_U15nGTYOXB9Fm81bPYVd6YS1Y9A>
    <xmx:AQ4Aa9rnxYcTUUjvR7wmpBn3npwxhxNYt1TY4beFxI1ToHG6MzlqpQ>
    <xmx:AQ4Aa1oLjD8C9dVGbPHoxPfnnnmfCeshThBevmg6TlbHMc087sOsNQ>
    <xmx:AQ4Aa1AajPdgf05GcTe156-mf2zn_vIUzjQArfilllsIVXZhU2kHjQ>
    <xmx:Ag4Aa5rn1blT7JH11eLChFUcT6tHWyqdf7QCcjbOJwk7jEm8cyegg0dO>
Feedback-ID: ie67446dc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 04:08:16 -0500 (EST)
From: =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI RX for Orange Pi 5 Ultra
Date: Fri, 20 Nov 2026 10:07:12 +0100
Message-ID: <20261120090712.68178-1-jan@jschaer.ch>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Orange Pi 5 Ultra has an HDMI input, enable it. It was missing
because the snps_hdmirx driver was introduced after the Orange Pi 5
Ultra DTS.

The pin definitions here match the schematic and the DTS in the Orange
Pi vendor kernel. In the schematic, the hot-plug detect pin is named
HDMI_RX_DET_L.

Signed-off-by: Jan Schär <jan@jschaer.ch>
---
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index 2b693dfb434c..ddcb1d2f9b49 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -48,6 +48,17 @@ &hdmi1_sound {
 	status = "okay";
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_rx_cec &hdmim2_rx_hpdin &hdmim2_rx_scl &hdmim2_rx_sda &hdmirx_det>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
@@ -71,6 +82,12 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 		};
 	};
 
+	hdmirx {
+		hdmirx_det: hdmirx-det {
+			rockchip,pins = <3 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		usb_otg_pwren: usb-otg-pwren {
 			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

