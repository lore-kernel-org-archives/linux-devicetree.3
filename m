Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825996;
	b=lqBw7v4g//11JBOeTpwX8UTCxWNYCAjjacQKr5AvEu8wa0QUOIxQYlVOcNTq346GG+G9
	 XaKNX3m4Crr8xWVxxhotdiW0z5LNbsEixmSKbRyGEIsWXIIWDVl4B00aTWLbHhA6f2K5N
	 KNulx146igov7EbWP2egJ01njnWaqmztcEfi9BWtWCGVwn5glhQwut6dV9hzaKiKJRplu
	 K9I75JNg8NK1WfUIDKDKA1hdNRqejOKtFel76TtqiJh1A+QkeqEh5pSLpx2Z53FkjD6m/
	 MrlTRAKX5isM0Xl2079M6eRGs+G9acbhmrdCZQOehgdDZ4HseQ21D4JBGQdAeqKCnrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825996;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=;
	b=XJlfYZv+rbPO7bv3kR/+IncYf5WXvk51D191Al6IcwZc16uSuqujCz9ue7bepbt4sp7r
	 7hCWIHMHvIllUalwzibYtD+H83k8E98bqweBXthe2L8+3UNc1WM9ud2soTNrGqpnlEWA4
	 tUuK42EgYQBQ3bcEXYZMVMCkYCKSF7kUbEC7BrkADcmRqC2kZ6202k94CZul2jcQ0ufvl
	 7+8SV43Xx1cPLlvF/KqZgQ1R8MDo7dbl/SbN4NX/1vQV1Fb/ku02yZBiknIjjETfiJMoG
	 4MTZMlj7Qog4chf7Z/g0AyChwZuKSN8q0dnQCRSA+1BjxAopQtE97XLPTPEz+RqnaDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhuLH0xv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25D60E7529
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhuLH0xv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825995;
	b=0mqKVmS5kKNELhS/t33vndolRW7jsYUZO5oBZGUqh+kHDKWfncQS4ubvFF0nwQKMT6JE
	 AxU69P+9CDubGEC8vI2LLEI4CMIf9khm4FQviMezP94fRM9WJd3YCTjA6dB+1Gm2JT/Y7
	 aojOgnIsMJLqPy7Sp1Fd9cbdVW2gH1VptmNYI67Px86kcqNALxugL+CNkZCz8Z2tN7qm/
	 fLIhBt21SS1NOTFsRr8zQNYHMBTsqb8ZNc0lBzZ7drTJ7eilP9+ZIOn2qprBzEKz8ZDLh
	 WzyMCfThYV4/AUid+IYGbi5wsoBdZbuksnlTvz87ji6k/Oytmd8IGnxRgNXT2yRAriw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825995;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=;
	b=pxqkQ+K9Nh6EGwkCX6aLderOM8Vwzb5X+k68p/+4h+4Y+EJw6E7e6oCTaNaiz5b+DhEd
	 G8/WhRmuLZ34gVDpB+JZ2wbC2rTXYzukCl8yQjGIcjxc5uIEIJyrptgiv4meWaPD9jUPC
	 hm0RViP0gDKt0IMoaYPEnDdgwqMLU98TL6vu1yXy4dGO7OMf9t8kVD+yPVhM0UUNnyR9M
	 OLnqn7BdPFVesGk3U6SYj4VuLg+JLhufO3Glhk4UHtluUXAZtiTShj+Cl6s6QexERCFkv
	 w5H4ml/d6TTjwnBZXHFP9JIe/92xF3ORT5w9+CDfcqbQzbkHPh9SIA4jbPuKJwtFS+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B2DE1F00A18;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825994;
	bh=rqlh0OoXKTFT1PQI1HOdwpJMhVGTQQ3D/fRH6n1TqSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mhuLH0xvhUBrMfdOe2ntVk9IvPZbsg/RhQ+IIXPGTveZ+n7p8IUskN2OldQ3Hvm8d
	 t1Ml83R6j7kgAL+RwrR0LR/soAv4YljX9cM9V6b7oKLqADBPxxbwLxUKb9qJnLDIQT
	 25tPQ85+Nq9ZOXElaMDY9UpbFDO3kBxCipOQSDB5TcYRhBk+fmZ2XANRAeMVZAu0ZT
	 Tk7987jwKTlCKaak0/I8hiRQXujXV2V3GXPdEdd71zrAL+NauTAwyvE27slLdq1eVS
	 HJjJeIgtlC7Z27FyIYCoQ9wlB5CP8XUKaBmv1x7RSf+WAOnaoxw1udAOcBUAyJAj9J
	 6rPRtJW6VyDzg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EBEBD46FAC;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 21:59:23 +0100
Subject: [PATCH v2 3/3] arm64: dts: rockchip: add support for NanoPi M6V2
 board
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
Message-Id: <20261104-nanopi-m6v2-v2-3-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=3730;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=HHQTMsbiHoDvV4k5fOgzM7R6OF8pxLzbRe7t3xi4I0Q=;
 b=pLoioa4DXzOYLFPjeycLv5Si+yS1Jb3O+ClLo26AW0tG4GB0AluSmJgjF0544wpfj4ardxT8A
 GpaGGu0SohEAjGdqxVsOU0rXxfkeSoRkUgo6zQJ/vkRcC67hx4jeaAO
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi M6V2 board is an updated version of the original M6 board
with the following changes.
* New audio CODEC (Everest ES8389)
* New Ethernet PHY (MotorComm YT8531C)
* 1 extra user button
* Misc connector changes on the board

The codec_es_3v3 regulator enable pin is hardwired to the 5V input rail.

See link below for detailed information:
https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      | 94 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 57a1f41986377..3df63c35b4bf0 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -240,6 +240,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-lubancat-4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
new file mode 100644
index 0000000000000..b343c1e08c263
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-nanopi-m6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M6V2";
+	compatible = "friendlyarm,nanopi-m6v2", "rockchip,rk3588s";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588s-es8389";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+		hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+
+		dais = <&i2s0_8ch_p0>;
+		routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"INPUT1", "Microphone Jack",
+			"INPUT2", "Microphone Jack";
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Microphone Jack";
+	};
+
+	codec_es_3v3: regulator-codec-es-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "codec_es_3v3";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_btn>;
+
+		user-button {
+			label = "User";
+			linux,code = <BTN_1>;
+			gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+};
+
+&i2c7 {
+	audio-codec@10 {
+		compatible = "everest,es8389";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		vddd-supply = <&vcc_1v8_s3>;
+		vdda-supply = <&codec_es_3v3>;
+		#sound-dai-cells = <0>;
+
+		port {
+			es8389_p0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8389_p0>;
+		};
+	};
+};
+
+&pinctrl {
+	buttons {
+		user_btn: user-btn {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&rgmii_phy1 { /* MotorComm YT8531C */
+	compatible = "ethernet-phy-id4f51.e91b";
+};

-- 
2.56.0


