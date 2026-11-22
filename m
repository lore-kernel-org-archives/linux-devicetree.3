Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378507;
	b=fDJD/NH2B2i8kxEMtaipFvReUAjjLHPBcFe/flfctNFHQhojT916dw0uo1nPDqqYSaGn
	 dN6aZwbPdFt70FgDUvJDYq1W+FTQIYnpOXc4Le4FsdjtC3JIJz3PgG+rW43aBV83cP3r6
	 byfA7lCasWU6E6Pj4LLkGSMd4KJX2Bn+LQbz7bijLA8FwoII9JqlI+/wZb5wIdTZrdHW9
	 pMMq5gb5megqCNHDM0J/xWkCfECKiBxwFPwASw/ZGnUOnWDE6hcEikQamkM2Eh9Kih4E0
	 wcJ8wPJ+s56N0zmi5i7uW9/1pCdQS4WeyekaN57pJhLYfT5vBj2bsMQePizHhDJoaXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
	b=4MIVy+k4puyYv1r+Zlg+rD60zcMM2xTBBgqhF+Kn3Iw/KZoBFEx4lOm5fcvX6jZa58sk
	 zHjNAUTEOF1FCxgOrxIylGAxI2dxGxXfASPx7USfyWf9qEFkAGQvzDIvafnyl84iqiXtp
	 8dRmo8wVW5CKfWk/1dYU+mfsBMAIjXYPZQfngCkZaLj26oFShX5fcV7O4W+ONLEh90rw9
	 v16cpnWuvDDhRQnFJb/AxYDh2xBEqaU+IHM8RCqQwsxxxpBrJmCtKoFeUclZiSra/P6tY
	 LGezNk/b1tMuLiONVNnbIDylgQ89NnsC356bPuhMrbL105stGTnTJdFl6XtNq+kXOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4SXdbiY;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BF606A336
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583BF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4SXdbiY
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso3645769a12.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378505; x=1795983305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
        b=Z4SXdbiYfkuPtgwH+tNzW+Vb47lUeDOfaNR/2hDbdcdZ3Nu2hbwnMis04+77sBl87d
         fA98IX4DgiHSqwvvYZTK/x38P6u99PUdRLDFPaKOu1XgO6pBYpbPMSvTw5q7WI5VmnyH
         HqD1R5Y3PMGU4e4S0+XSSsTQjW3KY+t1pxoRf+XgAd8oF/R1EG8b+XIjIluQDGzJA8vy
         g1h69nok9HmOTL27lnrWkXW1qa41xMfhQyoBwX5W4IBh8vPx5d2NwrSDJrp5mk1ojlKK
         cFT7h6ISM4qPXILaxjb0O18k9kdmWifxdI+DlcY7SWo3rC3Dv2hQnLzTWZHpmZX9eGCQ
         1WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378505; x=1795983305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfTCUFkmVonj2+Ucb0O5WgQRRtR1yvF0haaOsUxTjRk=;
        b=JGHeRe3T1tlU63XbVlkH49CLDkfGyAIcI/+tYqbaaopc8vTMzcF8ZW4CnQq/aCotV4
         GlIjto4JKUJKFsnkyDLbogBUPnZoDSb62VW2hZ16LS6zCqNzFz3NOcnXUrNDrPhmugv5
         IzDQGKPBA4Kms1kyfszajNYcJXbEXKVbhlxj3GpiaiLkx+pxbgBiUQ7xccJh0yutg0H0
         dFg2/BKVWODLWSPjQNL36gD4Oja32u5hVGJrV0CGuwiqxLmf5yAXcpgV5q3nQZExNRWR
         aVRomZ8iNFB8q4O5um0mzxLicaAnp0ZY4aA3mAl/oaC8w07D2NfhJ8IaiUeT8peSHmEL
         k3ow==
X-Gm-Message-State: APuU4Z+eJRo104Qg5FwYBG3UvyOoBpTXYyLMbxHbAgiYrvLbyxSYgS9w
	cHyYBTvgxQyfvhaTglPck07159BQRko8c7Nv5JzuSCm4a9AFC9vuvuWP
X-Gm-Gg: AZFdTZfr5c8eNY51dA6z7iSSpZayh9lCSpMyUUHXMiPULf7t0dnB8AynEmRjtqbLPbE
	agUy34rkypm/8FqVyh6GROiAC3PYUHQR/kFx52xg0CPqb9Qn92e6PSSoL/a1gM09q523tdHlIPb
	yx3LkiVRaD/rqXMjxOWmdRv3Wf7A9A/TXC0BLc8TRLEph3eVjQuhRHxYPtVDbcaJ/DiUJ2EMz3+
	IFdbgKdzXFhlTQxYDcqdSVPql+s9RwWSrdWHmahSyY2q9wgYYl8anCUCo3Ov7lqLlNhq5Say6Di
	SRrJHAa5M65lpOyZdTcOVBBBq9l9DEg3oSeIwu4c3yAj/O79D0YxKj4wcjX3j4z6SR7+dYpZu5J
	c3klhXGjuBMSDEZGFbivz87wUHdPdRQh7Rg96lJemfppgQiUQ1ZrB8Kk6D6B9YogA71B4RQLVcN
	8Qv3EOdNdG/1k2Do3RTwaI3K2RR0l2azVJwAvIhrBaA6VXJGvdahYuWxEwRucAJQSkqaQ+vKi4+
	h2DdxZiWlO5buzhsXc/ddwBx5MFWERNtMJ0BpOo2ztJR5d7iDtf7/nj8sHiaEJbQnRRuuheWINw
	qKGtokqEFpR4DiWCofFjOimkXVBmpcpq8v4+GynDnpfSDq+JjIoVxQmpKgeJHzN38mhjrruPGEn
	Ee7Hc+GA0cA==
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e0b0 with SMTP id 4fb4d7f45d1cf-6ba7beee4dfmr2785151a12.8.1795378504730;
        Sun, 22 Nov 2026 12:15:04 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 17/18] ARM: tegra: tegratab: Add video input configuration
Date: Sun, 22 Nov 2026 22:14:06 +0200
Message-ID: <20261122201407.23742-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add camera nodes, VI and CSI graphs, and interlink them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 1e9df07dadc98..99f0d1c345e63 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra114.dtsi"
@@ -61,6 +63,91 @@ trustzone@bfe00000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+				/* CSI-A */
+				channel@0 {
+					reg = <0>;
+
+					nvidia,mipi-calibrate = <&mipi 0x003>; /* CSIA & CSIB pads */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csia_input: endpoint {
+							data-lanes = <1 2>;
+							remote-endpoint = <&rear_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csia_output: endpoint {
+							remote-endpoint = <&vi_ppa_input>;
+						};
+					};
+				};
+
+				/* CSI-B */
+				channel@1 {
+					reg = <1>;
+
+					nvidia,mipi-calibrate = <&mipi 0x00c>; /* CSIC & CSID pads */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csib_input: endpoint {
+							data-lanes = <3>;
+							remote-endpoint = <&front_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csib_output: endpoint {
+							remote-endpoint = <&vi_ppb_input>;
+						};
+					};
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						remote-endpoint = <&csia_output>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						remote-endpoint = <&csib_output>;
+					};
+				};
+			};
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 
@@ -1270,6 +1357,82 @@ power-sensor@44 {
 		};
 	};
 
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		ad5823: coil@c {
+			compatible = "adi,ad5823";
+			reg = <0x0c>;
+
+			VANA-supply = <&avdd_2v8_front>;
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 7) GPIO_ACTIVE_HIGH>;
+		};
+
+		rear-camera@10 {
+			compatible = "ovti,ov5693";
+			reg = <0x10>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_LOW>;
+
+			clocks = <&tegra_car TEGRA114_CLK_CSUS>;
+			clock-names = "xvclk";
+
+			avdd-supply = <&avdd_2v7_rear>;
+			dvdd-supply = <&vdd_1v8_vio>; // vdd_1v2_cam
+			dovdd-supply = <&vddio_1v8_cam>;
+
+			orientation = <MEDIA_ORIENTATION_BACK>;
+			rotation = <90>;
+
+//			lens-focus = <&ad5823>;
+
+			assigned-clocks = <&tegra_car TEGRA114_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA114_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+						 <&tegra_car TEGRA114_CLK_VI_SENSOR>;
+
+			port {
+				rear_camera_output: endpoint {
+					data-lanes = <1 2>;
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					link-frequencies = /bits/ 64 <400000000>;
+					remote-endpoint = <&csia_input>;
+				};
+			};
+		};
+
+		front-camera@21 {
+			compatible = "ovti,ov7695";
+			reg = <0x21>;
+
+			clocks = <&tegra_car TEGRA114_CLK_CSUS>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+
+			vdddo-supply = <&vddio_1v8_cam>;
+			vdda-supply = <&avdd_2v8_front>;
+			vddd-supply = <&vdd_1v8_vio>;
+
+			orientation = <MEDIA_ORIENTATION_FRONT>;
+
+			assigned-clocks = <&tegra_car TEGRA114_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA114_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+						 <&tegra_car TEGRA114_CLK_VI_SENSOR>;
+
+			port {
+				front_camera_output: endpoint {
+					data-lanes = <3>;
+					link-frequencies = /bits/ 64 <96000000>;
+					remote-endpoint = <&csib_input>;
+				};
+			};
+		};
+	};
+
 	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
-- 
2.53.0

