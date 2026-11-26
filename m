Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729495;
	b=ndkIhi4KlZQa3f0QDRKqbTpducIA5J5onSU1C7S4HegNrtmk+irm1Imr4oY4USwuYG/9
	 y0z9zf3ZlVlFBNJVgZ2Zx8H4Y8Mx5RoQSMzd4NLBFwQRTALfdNCbONVF0pRgADsXUALbe
	 hgYZAILlvfsXLxxWd4uBPJFfozOfLip/GdcHm2mcO8CzrwccjvDzBt6z67GwqMORbmePk
	 qOLyTGiTzM7GVkoav4kXx4v07cRZV5FwA/XIBfGB7N079yirFXO74JVBej0GjfUjLnU1C
	 Mk1mmyJkRuJTAoiMC4V+OIme3iJ9jJAQzHS4K1/XsEZtgAlAvMcKqveuwwrleSWvGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
	b=qBP2AyaMBw+rqkvoExo9kWxMvcVOuCv8enBO6CprFf3hflrqNFXGcCavq4kNP8lPoYeK
	 xZvT9nxnhYkbTCnJNEuBwWAXWO4Pv3SaRZeIu65ZsdFTxwpZKqQhgaxebTBV9ipHqohMZ
	 d5FrmAJalj3dWmic20JXpSq7L9ko9fCtbAGtDQleP6mfTWuYNc+kiAnrvG1mMacdo/Hsa
	 eVkDbvixc5NADFpsrd5U9b5G3m1u/5oCYJnpKw5XbZGdlo7Etkq571knVt/GbV94n8Odl
	 Vu+uemtN+66nodM18a38ZvbAInq5cATfhn7s/sUwag14DpWpc6efGSRDpRCKahN4pCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxpoAifk;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254F60A263D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B254F60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxpoAifk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso5463772f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729493; x=1796334293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=sxpoAifkRqlj+sdvElP/WdqxNuwY2myUVWRCaXXIlt0IFJw+agmb2ltwLNOz9eroFj
         kDJxUBfyj5DlBI7dER8G1tqCXP+geQApQpD7krg3TmIaQVSl9fAR82/v26MqlGoEuFHP
         bp5kiZ6Df8v/oOy7SaFB27ejRfF6XHriTa0jBIlHrnnxhrjBQIpYBx67LMjLz5LwDs26
         97REUSuA6KDVlYxxRvu64tENsJMVQFNmzL+8KKREKTP05afKXgEWjvs6vokmSqANKSzI
         r/aVGeuTaddZ57icwApHFafiipbiy0ZoN+ZMKFCsm4M03COYxhW+AMEaXZyETk3HGz0U
         qwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729493; x=1796334293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iGg5XMVGlXwhaaIBet1cpm1QfD+VB5UjTjNYIbHbFQ=;
        b=lsDJZq8EHeVZPL3JvxkWfGermblRsM/fjImf5RmQYNjGPnTMIen4h9KMxQXCurMyeY
         RbSuPfg5lKrcOmv4MEgWsZXjORYMR811YqJyQBGpfAkiRJwPVwv30rvCfNmu4qDjdJ0h
         HvlMa7QE3IHi7HmW2D59j3+x6c0eLHVvDBe3oOH/it1vp19HZ+u1XKSAWZRu5fdR2hxN
         R2Yla2NwMGFC24qE5NqsXt2LH/O4+tHpEqui9oIRyDMNJczdW3Kl98yJBefgUiyBZ4uz
         ZdRCDl2j3BhkXR0LpeXuxGfl3FBYyKeQ3gY+0xpnD9Ua0qc8I6jnLehm5Mq9c8Hwp3ET
         XVFw==
X-Forwarded-Encrypted: i=1; AL+hErGJU88n7gMeAHwFwSnjyc13mEs0bgXyTlSVE/4c7DzJH79aXvqoMWM5shLq2MYuvmJWGxi/M/Mfxr6J@vger.kernel.org
X-Gm-Message-State: APuU4Z9HeN0lwWpr8LVEbosWvOEqlvqrejckj9LyXIbxYILm2ZQygseK
	6jvSzc91n8uE1POgxQAcxtvso8NtfqzUnZlTjdjEkG2ZIb0ijmTv4lDdaZwevg==
X-Gm-Gg: AZFdTZcGziss0pAkpf+yMV5B133pAq97UsXFhoZzxhhVaWV8CApPvXBNz/XhL3xDmRl
	Xpwlp55n7A+AeT1bAx1eShVymKnwn2sNtnOBSsrlvQ5RlZ8PMARm4S2V8TrhINhsr35fdh6N3MA
	EX6VmAoi8WWHaLmJD6Z1vYOtPymYyObVgi8X/9e9ILy0Dd8sZTtun3dpdE0mxTFwlnCr8GcFCS2
	FgXEXJOuizoQwZNPlg878hMUfuxCAIaQ5Qh20iXJDs0GMl9TzmPSPhhZ7IHgYi6t4GYFj19Cl0G
	1/6rEZMAk78UySmqWpv2EcUqfrFaKwqYvt4YfH74AYma0fsprnE/hKYzR4VvZdzH3UqIjbc1j9H
	Rge+fFqS4Dscwodrb7hT7YYnLiaGwAh9yVRcOq4AWbEXOf/jLirw/hE0co/8sniU+uwIhJMgTaC
	5qK1GrzEEP59e3YzfggHeQoRQ0iMJJpdV5oBcD1vnrVyRW3WBSV6NeXKT19GK9OSPSyX/e8tlU9
	AEuj1PRfr+/VptCt8ocjGNemI0fEUtgmDNOQpLbH36cfseCUUN3lEtbrXt2kdEfSK8UquC1oYKl
	WMEfbYGWgCXvYxSVHGFapOsxVkeh58we0djrIaLxhmyheqz/Lj+0aYsPTbq1eSYLQxC558/P/m+
	9+G4VGy9OFPVVHiRqmboGsrs0/XfG4maKHg7PgZSeLN3r8gCPwRJgF+FsVpIapau0GoW3o7V6Ck
	mRZ5hfUhTXQMpuovu5tdUW1bEODhGSgp29OoKSb1sIYDlvxEP8q4hVGfSXT0PjuKYF7Vd344vYi
	QL2JEA8Of+yYrPVPzXC20xSDpFy44XQvZbNVWYbplPS1/7NbtfWda3UYenSYxo=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr458713105e9.17.1795729493210;
        Thu, 26 Nov 2026 13:44:53 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: allwinner: h616: Add display pipeline
Date: Thu, 26 Nov 2026 22:44:32 +0100
Message-ID: <20261126214433.3562326-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616 contains a display engine 3.3 with two mixers and four TCONs.
Add the display pipeline DT nodes for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 93c3b8279241..d7ed84d3c121 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,8 +7,11 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -94,6 +97,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine";
+		allwinner,pipelines = <&mixer0>, <&mixer1>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +159,84 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&sram_c 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			planes: planes@100000 {
+				compatible = "allwinner,sun50i-h616-de33-planes";
+				reg = <0x100000 0x180000>;
+				allwinner,plane-mapping = <&display_clocks>;
+			};
+
+			mixer0: mixer@280000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x280000 0x20000>,
+				      <0x8100 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+
+			mixer1: mixer@2a0000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x2a0000 0x20000>,
+				      <0x8140 0x40>;
+				reg-names = "display", "top";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER1>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER1>;
+				allwinner,planes = <&planes>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer1_out: port@1 {
+						reg = <1>;
+
+						mixer1_out_tcon_top_mixer1: endpoint {
+							remote-endpoint =
+								<&tcon_top_mixer1_in_mixer1>;
+						};
+					};
+				};
+			};
+		};
+
 		gpu: gpu@1800000 {
 			compatible = "allwinner,sun50i-h616-mali",
 				     "arm,mali-bifrost";
@@ -978,6 +1065,339 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		hdmi: hdmi@6000000 {
+			compatible = "allwinner,sun50i-h616-dw-hdmi",
+				     "allwinner,sun50i-h6-dw-hdmi";
+			reg = <0x06000000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>, <&ccu CLK_HDMI_CEC>,
+				 <&ccu CLK_HDCP>, <&ccu CLK_BUS_HDCP>;
+			clock-names = "iahb", "isfr", "tmds", "cec", "hdcp",
+				      "hdcp-bus";
+			resets = <&ccu RST_BUS_HDMI>, <&ccu RST_BUS_HDCP>;
+			reset-names = "ctrl", "hdcp";
+			phys = <&hdmi_phy>;
+			phy-names = "phy";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					reg = <0>;
+
+					hdmi_in_tcon_top: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi_phy: hdmi-phy@6010000 {
+			compatible = "allwinner,sun50i-h616-hdmi-phy";
+			reg = <0x06010000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_HDMI_SUB>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h616-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>,
+				 <&ccu CLK_TVE0>,
+				 <&ccu CLK_TCON_TV1>;
+			clock-names = "bus",
+				      "tcon-tv0",
+				      "tve0",
+				      "tcon-tv1";
+			clock-output-names = "tcon-top-tv0",
+					     "tcon-top-tv1";
+			resets = <&ccu RST_BUS_TCON_TOP>;
+			#clock-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer1_in: port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+
+					tcon_top_mixer1_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_mixer1_out: port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_lcd1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_lcd1_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
+					};
+
+					tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer1>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+
+					tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_tv1_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						remote-endpoint = <&hdmi_in_tcon_top>;
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon0-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+
+					tcon_lcd0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_lcd1: lcd-controller@6512000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06512000 0x1000>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD1>, <&ccu CLK_TCON_LCD1>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon1-pixel-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD1>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd1>;
+					};
+
+					tcon_lcd1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd1>;
+					};
+				};
+
+				tcon_lcd1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+
+					tcon_tv0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
+		tcon_tv1: lcd-controller@6516000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv";
+			reg = <0x06516000 0x1000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV1>,
+				 <&tcon_top CLK_TCON_TOP_TV1>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV1>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_tv1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv1>;
+					};
+
+					tcon_tv1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv1>;
+					};
+				};
+
+				tcon_tv1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv1_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv1>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.43.0

