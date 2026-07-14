Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CA3F4853;
	Tue, 14 Jul 2026 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015150; cv=none; b=qBkJOaNPy34vduXjL5d2Z+NUt4vM5jef32VSFhyNggD4usYou8IHshxb1o5fCsMZnB4exrA5KAtpHzKoYIlamBJQmiSduuZUNMIUaS0oQ7904ZyAs7Mq6PC64rkqBRfqOPfg7Ae942g9e16x7/dWrx6ROJLZPC/kKiCXFFGhyew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015150; c=relaxed/simple;
	bh=Zh+tqLcF6GYgpG9FDLpPCwTm5HMFuErsnFlL03ULyzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ctx6zzPm1V1Hs9ntuirtS63hZO5bJR5CTQmrJ0KH9LN6NwkN7XGBl/AIsjTEo/X84wHwQvnZQZ9Hg4QxDSM25PqQZOP4n7ml6AJ8EKX4jherT3FjmqiErnkPMLEV4tJdIdpCVSXcJ5bMJqCWR50heSkkKuQ9ZzaoWjdOSfADHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S7;
	Tue, 14 Jul 2026 15:45:35 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MoeLeak <i@leak.moe>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 5/5] riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions
Date: Tue, 14 Jul 2026 15:45:15 +0800
Message-ID: <20260714074515.1959352-6-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXq84X6VVqEs8pGA--.61698S7
X-Coremail-Antispam: 1UD129KBjvJXoW7AF48ZFWrKrW8XFyktr43Wrg_yoW5Jr4xpa
	1xZ3yft3Wvkry2934avFy09FyrGan5JF95KrnrCFy8Xw43WFW8X34jqrn8uF1DXF4ruw13
	CFsxCr929F1qv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjfUriihUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
I2C0/1/3 busses. The I2C1 one is already added to the device tree, but
the I2C0/3 ones are not yet added.

Add device tree nodes for them.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[Icenowy: added commit description, enable SoC pull-up, remove I2C1 and
 aliases]
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 78f5979a56c14..75396cafb39dc 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -117,6 +117,23 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	ioexp1: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "cam0_dvdd12",
+				  "cam0_avdd28",
+				  "cam0_dovdd18";
+	};
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -139,6 +156,28 @@ ioexp2: gpio@18 {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	ioexp3: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "tp0_rst",
+				  "",
+				  "",
+				  "vcc5v_usb",
+				  "vdd28_tp0",
+				  "vdd33_lcd0",
+				  "vdd18_lcd0",
+				  "lcd0_reset";
+	};
+};
+
 &padctrl0_apsys {
 	fan_pins: fan-0 {
 		pwm1-pins {
@@ -152,6 +191,18 @@ pwm1-pins {
 		};
 	};
 
+	i2c3_pins: i2c3-0 {
+		i2c-pins {
+			pins = "I2C3_SCL", "I2C3_SDA";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
@@ -176,6 +227,18 @@ rx-pins {
 };
 
 &padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SCL", "I2C0_SDA";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	i2c1_pins: i2c1-0 {
 		i2c-pins {
 			pins = "I2C1_SCL", "I2C1_SDA";
-- 
2.52.0

