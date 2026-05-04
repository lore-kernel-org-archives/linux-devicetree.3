Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739162DF144;
	Mon,  4 May 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879739; cv=none; b=e9zZCdXmteu1rKlwti9UqioFeqNocna5rSi5fc0xhXY0wOD0Eb9OxdIaPIhZCqkNfnoXdqgggOoHxlmLHmy1HiCTlBk2QEBhcD5yDbvDpYVRPMstsGZWnWHZNMTuL7M4HoOl/k1/ETtE4Jlc9l4wY47iJ8rTTvwwLTEtOKkVe4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879739; c=relaxed/simple;
	bh=XarKYW1tlt3QTSSeM3edbstvaela2B8OhCRrst970fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQXKBwPXLEE4TiF3HKCSWIe3lqTMp5Br+Co5vzGROxAjI3UGO4iRepbduE7SIROxsfJVGFJ6GCwrHaTZEbl0qTRORVdJ8DQCJR0/ojeEb/BhjEuIUd9mUReAy+7p9JyVVecJicj+JE5Z6UC5rV4NFgCfhAp+XZfBlEL3k91SCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAAHKN+xSvhp8i0HEA--.54410S2;
	Mon, 04 May 2026 15:28:50 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: enable touchpad
Date: Mon,  4 May 2026 15:28:46 +0800
Message-ID: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHKN+xSvhp8i0HEA--.54410S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw47KF18GrW8GrW7Zr45Awb_yoW8Xr18pa
	y29rZxJrn7WF42gw43X3WUJF43Cws5ArZ0krZI93yktw1rKrWDXrWFqF9xtF4kWr4rJ34r
	Ars2vFyxWF1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Despite the Ciri device's touchpad is on the detachable keyboard, the
I2C HID device seen by Linux is emulated by ChromeOS EC and always
present regardless of the presence of physical touchpad.

Enable the device in the device tree.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec052..8f801454bf84c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -460,6 +460,18 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	/* The touchpad HID device is emulated by EC so it's always present */
+	touchpad: touchpad@56 {
+		compatible = "hid-over-i2c";
+		reg = <0x56>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <148 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchpad_int>;
+		wakeup-source;
+	};
 };
 
 &i2c5 {
@@ -1131,6 +1143,14 @@ pins-bus {
 		};
 	};
 
+	touchpad_int: touchpad-int-pins {
+		pins-ec-ap-touchpad-int-odl {
+			pinmux = <PINMUX_GPIO148__FUNC_B_GPIO148>;
+			input-enable;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
-- 
2.52.0

