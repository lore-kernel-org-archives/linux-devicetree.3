Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795038373;
	b=tg4yRA50KlYHM/8i6fs5i97dwpQnZCeLXLOsJ1frpLk6zRdn4Ac4KMIVHnQrGYOOxMO3
	 YNwo9h60lqDRwKadNpAFfGGBVLiboGe5OYNvT1inVaTqzCzIULTpgjggA6Bb5YIyyCqpj
	 9w352OBLXgzY9rAqNvH24SDoQ4a6niEbwiErAvF7Dp0LxleEUFCQde+Kim5d33ZdlQGYX
	 lelWUI0nmw8RCueMGVlHT/JhxdcdZ5tFLi5zCuwJNJC4MaDkWDTkU36u9T6R1YfzgB/Tt
	 vGw817yFquFSolgqfe7mlN65UqsCnFnDhpSTdYtk7fkQD+YhpIBLzdvCwGaAr6Z7NDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038373;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c/E5glnHrnNUs1be/DidTd7n/hXyUC7pMFA6Uy1CyMA=;
	b=YXByUjHMce5V9aDFOo1YjDukBCiEuueeLIyoS+/ESUJo7vcj8CzX7iQPwdPsQvzkNSPW
	 84KYcyDGRLBEWnF8agsi2zRAJAKkBPOZCIrIzL+n57KZtuQvNmOfiXh9y6DJb+OKvlgVW
	 KpiS9yF69Biu6YtOsJmDEvnj+6WG/FrgVJRA7FiJ34K3tZ7jJBs2JHLfoDWMJkz/uIMzS
	 j700dP+uPX/N50713D/j8/sAv6YvcJsIQNQBqIjzz2pbR24VFbvV54HsFEPU3f9TT/D7u
	 z0KvzCNIkuJS6R0S4lqEaf02lMTO7DVF9FZIWKskVLSyZKg3HdLwoTkN11wd4x7TkVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiBzdDVt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691CC606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiBzdDVt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795038373;
	b=JEm7iooYb5Rwp/E09Y6dbsyZdVreFThtIv888Pqy/EAO7KYtrknGej3baP6Aad331xdC
	 NvS21fS/CN/vA/sFC3b+L6MxueK5on18PpBx8PNvbmU6gkklLpDAQ6fnjUDrGu769Hc57
	 MZxYaIB+JHkLVe6urMvrDDU+tcq41Ln4aQJY9GV3VDQPLekJQsMU/Ygs4AGSetQwnJ1qu
	 e9YMxeoMSEu5mpCiV97klSyTkbY5sayfUo8XaKXupPtCAmd1tWTK8qYicLz47UgntmG10
	 J57xUocZ0r4hOqQbvFTI8jDP0Knab59FSbrjlFp41sD9f2jsLW7EWtsrMerzO5VdZqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795038373;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c/E5glnHrnNUs1be/DidTd7n/hXyUC7pMFA6Uy1CyMA=;
	b=tizYDuW2ZtVcbd3TWuyvsYnnHvwtXoiRvckM+kVGIxGBBXyiFDpe29Bxlyrc/Tfqwiks
	 yydgc9p2ZJsW16lMTJMlfdcwMz+MUU9aQnSBboYjAry+pyGlIC/P2d5T4WTYgCya8XUWj
	 zT3/fn4TVeRJLFOB//porJa61Pg8ej+Ms4XpciyRzFIJ2N4975HmJFLKbdishNaM8aBw2
	 skZfclKhNvh/uAI21e9HMdOOuf+kxdMmzfLPlcRSDFhHG9CHJUoMrx9UvHlwP+W8gHd+v
	 k+wec0TYyjL6QqiYT8IefqDNK4f8yGcDFt0mihc1BRlgXVYCuXD4Lrx4RWd+dK388YA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EE7C1F000C7;
	Wed, 18 Nov 2026 21:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795038373;
	bh=c/E5glnHrnNUs1be/DidTd7n/hXyUC7pMFA6Uy1CyMA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DiBzdDVtnESdCPs0nz8rxdJ601LsxrUB/CTv4rbLve0A/dFGyVafOTyZCfaT85e+Y
	 FHfj9vJvzi/hhgdyPqHABQeD8L6DEjHEySHMm0irncqKfPNidt5hXoImDJmpepvee1
	 WXqjU9dyFOGiE7CtuTp+G6H81ftn6NSz484zfgCVkUwwWCQJO2zg2IezeHRIuj81jZ
	 3h3b5BJNlObDGWzpkaspVaAS4jZfAuLEwgcmWcmcteGgBk795hzaxuaNkb4z6LZ62g
	 cP3yatpVA7lhMx4eDMtzqykkeHuXhoi4cKZn6yUxpQYUTq0X57AsoVQjsrzgt7hcrL
	 +MY8aMCHr3XKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2C4B4AFD5;
	Wed, 18 Nov 2026 21:46:11 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 22:45:30 +0100
Subject: [PATCH 3/4] arm64: dts: rockchip: use i2c-gpio for hdmi ddc on
 rk3588-h96-max-v58
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-dw-hdmi-qp-bridge_attach-v1-3-e370920bc7f3@gmail.com>
References: <20261118-dw-hdmi-qp-bridge_attach-v1-0-e370920bc7f3@gmail.com>
In-Reply-To: <20261118-dw-hdmi-qp-bridge_attach-v1-0-e370920bc7f3@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795038370; l=2059;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZKHrf9fZfya43GZzxlgu/vfQ6CugSi9lV4hIpaRZsLU=;
 b=uyr04LBj1Nkn02R5XunZ6iLLnYc3emIzJl0246OwELe6DeMlNxzvY5CUUxs7ZSy600h8hBtt9
 xRJbf1vdC2qDiR9dNIaXCijrlEPVUkyd/ClCCn1XF0OPfwPmuEaSwKB
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

On-chip DDC controller is unreliable on this board so override DDC on
the HDMI connector with i2c-gpio. The root cause of breakage is not
known but on-chip DDC controller refuses to read the EDID.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 3811f9a73bb6c..da6282c105255 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -37,6 +37,7 @@ chosen {
 
 	hdmi0-con {
 		compatible = "hdmi-connector";
+		ddc-i2c-bus = <&i2c_gpio_ddc>;
 		type = "a";
 
 		port {
@@ -46,6 +47,16 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	/* on-chip DDC controller is unreliable on this board */
+	i2c_gpio_ddc: i2c-ddc {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_ddc_scl &i2c_ddc_sda>;
+		scl-gpios = <&gpio4 RK_PB7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio4 RK_PC0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
@@ -211,8 +222,7 @@ &gpu {
 
 &hdmi0 {
 	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
-	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
-		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd &hdmi0_tx_on_h>;
 	pinctrl-names = "default";
 	status = "okay";
 };
@@ -347,6 +357,14 @@ hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		i2c_ddc_scl: i2c-ddc-scl {
+			rockchip,pins = <4 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		i2c_ddc_sda: i2c-ddc-sda {
+			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	hym8563 {

-- 
2.56.0


