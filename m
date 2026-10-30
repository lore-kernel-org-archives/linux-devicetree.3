Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378162;
	b=XZOezc37DkF8CaxxJy8WYNBNnOv3slLXWG+mEkTl8l6gtpCIVfOVwzo5+xzydhvPEpAN
	 skaf4P2J/VaZuL0FqnbQMrV+zpJvmfCtPo39DoXhSDwrfZ4WUFpHISbYgmCLi9SGRrI+W
	 YPpR/bOqOr6XwHq3ULGaDG2P3SRD2MRu/bPKNSjkFbswQH5N6wCBS2KHeWqw+bxZafC5a
	 XsQTCqXq+Fm4vfr+SmcpSHhgwgYdHgsU+5gIw51/0/SrYg1GGU7HN/+6zbAGw5lK+RIqn
	 4v+kgQ38TPhNlIEacEV/vYF8ethTD/9tlesWun2ZQKnP/r1CYVcFULeip307435EnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
	b=DREcVPAI6r97ZAZ8UshYoXM56KofdjYdXG3+eUVh01GL8LS/WHlcfGPA8wuU8i0wdjNh
	 JK0cznOQjuV7Sr79mRQjjkc8JvE/ErvrBCsSzArVvxAMwUqkMxKaaNvFSfNdf8cvmKamS
	 ChrRzCbYbYoDBMWeaU5SuVFxW/YQugMbN9dEZSJGYSrcXzDQ/KuJBWwVGLzfMH4nM8nEJ
	 tvNIi2nrwOhgpL96glpr+6eXkxFUD49F97vV03hIQSKj9SDewrTvriFWYcLFxeMdpugTQ
	 oqzldvkKbQVnnlNW4zbCxPpxgeWp4+M1WtHp1eehWqDBipUmjJFVGymhN2vnb7QVA5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gG00vMm1;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C1606A323
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 143C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gG00vMm1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9755745e9.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378160; x=1793982960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=gG00vMm11F+7oWZc5zROjmaG+NajYhaJdFYxFLmYhLBMqAJpF0A7nX5JRQC6/KerNC
         YF1xDIlIh8pJwdqqdQeDkhHNmJ3BonH2TkPHpyo+4CVeQGNRtLr9pn1VHw+aW/AbkVek
         zXYFJfnH2pjikT11js5uosUFsXjAYo8a2JVvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378160; x=1793982960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=Ud+XkD9B6Q5siXZ+C3P1PFfLXSGhmh6J0m6EeIXLk3SuQxINxecItbr4lkc8APuMHX
         5gqCWVjadw8rixj+qMSQuwYunU3Jw6LB5km7xjMIZmn75SQKr085TPpl90iLtn+8jpbQ
         RwX2pu9TS9YYouaBcaDDiWUESvVErgtDhMQi26HkpX2euVDHgo7AFzPlfccwbuS/O7n8
         DDFc18Qxu8+MGrkjk+AllZ1JEjScjATUBoFEA4k1r6G+SK5UBiFETiePlNdB9gGPg1+e
         Sr/kpxaq+XaSvGUHTSE4ci36q0UQqaqAmzz0wEZGjV3fPXId/zVV+xNfAauweaikG13J
         MmIA==
X-Forwarded-Encrypted: i=1; AKwUvByRwzTof9bj7K0O4k/R8sw/rnzrK6jpCYmqINe4XjIavLlFPFIwZ0Y5UI/SAzWMslr0kfsBDt27sedl@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQiSdZDnkdlm0oli4GhupVUZkkUmElFgeQkpdA9DPphwvVBdU
	b85hMB1iCq/YLN42QWOI51b4QyjFaeHFCU0DXuvE8cT+UvAtNnIS+MGt/UkRTewDxR4=
X-Gm-Gg: AYBFou3XZvseF31JJ7T/X+RGVGbFFcPFvd6JZPQc6jxplqKf+DthjcLOdcbHj5C+s/d
	Di2N6l/CpPWdmYrddIWBXnMf/Kg7r0ehfAoUMSokpNTF9xAw2By04hWKSlOFZSA96o999bhLFy4
	jhaDFqJPzDxEd+JomHdLUorakJfj66//ti/6JmX8X0T3qAyz2vwDzXN4zPwIZhVoaNf9exnpI3k
	DWllaNrurjlrcFrUDqoZ5z/4deHPLkJ/FBeTDM7V4WmjQaxeUL0oMPRaUNQzNuw7o1O/Yh/7+iO
	nlErkfYs5R9NQ1tuNs7uYrEoBepFJYjNQDXNu7T76D5pVClyZNTv8inoIzd9kWzoBQUqQWa+gq0
	YpewuRlLSFwj+uM+PMjy0QASG8c28/Zt/diaBvZtQFg+hlHcIIwN5mKeQmWji5qjZ2PXR411KfV
	YO6+vts2sD/9r2LU1kDKDzPe8z21dWuibpr+su87PnnxMVFkNqlUILZ/sRBpRRoXN7O2n/V5hyp
	fYhtz0yAW6/imURX1LDdYZJJlOsQO6ltmUlxTOsNsJvJktfSr7sZt7pgrNDtwWtlfprT8Zd13r5
	h95Vt7YE16j1hkDNX9DdZDA/lc9ay8/xRttXKphvi6/SwMNRLGs3Fm9nVUaPsuEgVjx6DCk1NUr
	/kT8WsxdELFksNwfN2gmkPY1B6QFl7fxyg+pBs4Ic1+QKtGQyHK5XKgbwZglGgx1Q4CEQd0EHel
	O5cqbohsFYtH4LnEDrReqbja+MFA==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64953775e9.29.1793378160492;
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
Date: Fri, 30 Oct 2026 17:35:44 +0100
Message-ID: <20261030163547.2682583-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Add an overlay for the C.TOUCH 2.0 carrier board fitted with the
AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel (C.TOUCH 2.0 10.1"
Open Frame). Its touchscreen is connected over USB, so there is no
touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso | 53 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf324cdec879..a3dce3310fac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -656,6 +656,13 @@ DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
+
+imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	imx8mp-icore-mx8mp-fe-ctouch2.dtb \
+	imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo \
+	imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..d5a5eb96101d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1013600000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

