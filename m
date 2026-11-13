Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585134;
	b=Q59xkv7hKbgXFl0i4FUnefBaBZyPdZGI2sRovKGsOjtSNfq+ozxzUcOYlfOXpMO2eKrj
	 B5Pp8LUEahqGddjxJfghkXnDrrMaSTLNhLOAudindhrnc4TJdzJJJ8g5+yib9H8mVBopS
	 cfhWxhWVipMfJd0OGcp2NbwDNCfDslSDmcr3N4UxLqxU0Y3q5TFVVyc+ab6pVkdy5mQ1z
	 SZo1kXgOuO2MDQeqiVPGrgjCiT/WppBTZ4U1iF958StPiKLDEMrQ5xv8A6XqFGvWrbMhN
	 Azj0TLWh5DLp60zREVcQJPW37vY4MXoL88ElW6DKHowf1sOdy9NHFuSZXBV0S+zcjiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
	b=DVPJSwrFcZOjxh4VOx/YHh+5m2dRqhfNu98pT4HWbbncbQT3Bt5RYDN/ECWzdVl+d/1V
	 TF5ikGYz2og7dkqpHXRjqHxQeUCq4nXRgrW/s3dw70FzWT23KDUPostQ6bqAeVGBVWAeW
	 aAzg4bJhGXyOuko2dNjdKZtbOLMYN4KdRSUqXGSQ0EaQRagXxy1h31BKPJRfUSdnAAhKs
	 0pJWo/DCwneq/mjaFP43jHECVhuEmInd4oEEUWurYhQGTMjpeF5Cy8N5OBLLqytFctLZ0
	 wr4yP/YRakTW3RMkr4+F9ato6maobi4KptmhpZdYLUYpwryqNtvIaoFCxenZw9Z3K0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9ltO027;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CEF606A882
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CEF606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9ltO027
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1407385241.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585132; x=1795189932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=g9ltO027D41Ot2oPQl9PbsfeY04jICO52J54ovQ7Voi+qucuV+D8ShHbG15X9j3yKF
         5868WGsVmp3/QqLfflMpMuYKwnmzMY73sLwq7s4LhyZ6nSQ3J4wc4RknjhfFmIPfoNGZ
         aVU+HgSU88VKnBlHB+HZk5xwI75/dlvbvwTwZuVNIB0OXp9fs2PYRJQwU5v5TfXlavXC
         RjChCHbi5bvx+rvusDPB6JnGs72eXm06lqAjuUpyrjj1MKHFSM5nmjGjVBPTKJMYnc0J
         Y89wR9rCMV62YYJ9R7Rec3YYg5T8fSKXWanArX+5YgvHlPqBSJo6in1ekvnWtD+K7Owv
         FnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585132; x=1795189932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=EWcpPhvWwTrk2cMp68iTGwQpLyVAKjk61MUUDiQ0WDX2CsNHjfhSFLWKSjPgJEKeFG
         TNajB1/GouUa9nZBOvFoTIhZRC7bTALyBnCsL7AzDo//DKS/ab73jOHJZK7SR5NoSbBO
         ZIUNPGPSFw5O4awAjwdl4xxifWl//2QoKy6/rZy348IkKj5zO08idzYsZ8uAKXDRdLTY
         RUezw7dTonta+jaaMqaoxWWyrTJRwCzKWHayifQm5v8EGaf/GaJbei6t+vRicaIGLlav
         SLQlgpQ94dJJkr8/N/e8msAYZflJf0NEA4sV/eI9fDp8Si5ray4G/k/M3ZRvWYK7GIA6
         Gkag==
X-Gm-Message-State: APuU4Z+oouqiDj0OUrpaLyA1huElYVXayuUhXmJqPZ3IstXpJ0tDu/Pt
	6ijncVcEBpubqYvF5y67BOwFvTzZQJVORf866BLlznEn8xd+izqzSCNe
X-Gm-Gg: AYBFou2M+sTU1zlxItfNC1x9wvIIL0cs8DvlaMhRrYrYVPSjjWznD24FRfU+jibKcU7
	nP57WfnlR0UFpEkhnJ5g9MyHF6PW+X+p5mQMhgRqzJx6TswVOGEpqTwszraJ4k760ztOP6tUq/b
	kat/PzhJN8ynWExLRe62ZZipK6PNOqlrDYuD1v1a1ExqwiEi53g/gLYYb4pi4WlQmvHOeCm6CPn
	iRETDxP9RUywxGukm1KpuhT4xY7gVww2J+ya4WBmWmkJco8A5tOJ3r37hvk2rxNqdEFDJYzegqW
	jgD+aAzu8oLuEwgkvzWZQ21rRRP41iArY66DDo2ioB5bcVPld7L7Yvu8CvAR/2Bvk46vt88QqSw
	ymXJ5jKN0PHzRpIMxAyM9Lekfm//m71fK0php3bxhxm9u9A+or6K2qri0J4cmuUFdFrcluFFbYp
	23h08a1UdtCj/FLyXY0L7/uUnuNhAKYGMOMFSFdn4n/eX/gji5W2Vc1Hx5435fkbCq/ea7mgJDb
	pnTlMSGmMQmobwrqDfK0jZTUds49N2cZjF1haUa29zRHk/acohU4vDsPuNSYlHWR1EyTQ7/gQGM
	gvBERN6N30KgCZ/9X436uAbbcvZBtsfb
X-Received: by 2002:a05:6102:6c4:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d64d6f8a81mr959235137.18.1794585132255;
        Fri, 13 Nov 2026 07:52:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:12 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 DSI to HDMI adapter overlay
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-1-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=4733;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=6gWisAoRL3n8veatx12VoVaqY4HAjgDwneKFrMNA53o=;
 b=YbAc7Dfi9KrryWwhYmgXbDasotxsHNMYCe2MqmRznTR9jWWd4uQiWoDUXcz/S9ifj05cVTsJk
 JBmp86tv4QrD8nPztn7gFCNOjifwXoLzo/61UqDUJ4/POQT8g+Tz7xD
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..3c424071f8fc0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,11 +710,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
new file mode 100644
index 0000000000000..270cf567ace1c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter connected via Toradex SMARC Development
+ * Board DSI connector J44. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	dsi-hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hdmi_hpd>;
+		/* I2C on DSI Connector Pins 52/54 */
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) - HPD */
+		hpd-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			dsi_hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 4/6 */
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		reset-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_LOW>;
+		vcchdmipll-supply = <&reg_carrier_1p8v>;
+		vcchdmitx-supply = <&reg_carrier_1p8v>;
+		vcclvdspll-supply = <&reg_carrier_1p8v>;
+		vcclvdstx-supply = <&reg_carrier_1p8v>;
+		vccmipirx-supply = <&reg_carrier_1p8v>;
+		vccsysclk-supply = <&reg_carrier_1p8v>;
+		vdd-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&dsi_hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* SMARC LCD1_BKLT_PWM (SMARC S122) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_hdmi_hpd: hdmihpdgpiogrp {
+		fsl,pins = <MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x104>; /* SMARC S122 - LCD1_BKLT_PWM */
+	};
+};

-- 
2.43.0

