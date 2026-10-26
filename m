Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008668;
	b=PPBwR8eAudRb6aD7C4x3SrGMapY3ULTkAxIGkKi4l5v70p61mwEn5Pz5yOsQdU17zZfy
	 +rGDnLnecU9VRiVQkoYUDdngq2isJ4sZ2cfnYWX5p9uXGycRgh/Rr/ZrpPaiiNMR+0ANN
	 /isVmE9C1r+e/Cw/bSHd7+tN/TDjwbYiI6J21BieF/UOWv59KMKvu0WoTWtwKUr6m6vXD
	 5RZkuJ23MZzqrOPR5teaOHE83hr0qGnPLLyNVIgfS22ZO039ukXD+vXII5V7eNM4FuZRo
	 /oFprV+SWv+7/5g+pdPn+s+QRfB1xZDi7cMc728uI6RlwueHe8pMQPxzA2g8rRX/kMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
	b=WvWlLnjxFP3IDYM46XU64mEpl2VAdhSkRc9uwdciCqN81GVNZQTkB+ZcgJnHdRHSSVVn
	 Cu69otgdWPJeHMJ+3g+chrJZ2swyyTt4DWlA2Le0VtdSr0+gYG2f1FHf54PxuwyDZL5yD
	 SUirAT5tmOmL4te473WVQGq5D+H2KPotvry8F3hC8l+mMu+CJ6hREdZ/Q/Z3YqXBn6vtC
	 UjMaszUzrF/rNdZ8eNaaXezpZKIu53RRw95GHikC8jIBiM0HLIzKGgZfbimNK/M/o9FpB
	 zxQViUWOacm4QT2B+t4pFKdTns25leizRRIVkBYJQZ/2S9no9Q65xea7Lh5s8GvlxeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OqnNmal3;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1D606A9E5
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE1D606A9E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OqnNmal3
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17313125e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008666; x=1793613466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=OqnNmal3lUFLHEK4n11AkX/A2Qd+EJT35OamArxCZCjw9y+0SVslK95RqIwBkUf+Ko
         O4/3mg5DlByHEW4PbdeW43Byujx9rI9gKpuKs+a1gh+TM3rq8KoAcdn9v/obuUPVlrD8
         8j8dkInlj3zvUzojdNyo8mya+apraHLQhoh0bHiV9waVfmjgfEIxNnInNGuJ0fhaUoEt
         +tD6QAi1Si1odmginspoE7MH/Sr6BpTuYTvJN6xBbswEVwYXRyiWnisciR0slcGEOYQy
         pIDi09FgpzIQKJryngLtXdubBMWiAZN3RnPxhjWgbPr+QWnr0KcJds0wbx0AOYj0NXV1
         kuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008666; x=1793613466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=l4cxeh/T3umEtNaDj1zdh+JFm2ONxHbCI7Lr3G6FTZbuoe5GYuM8Kh6vM840h9sZOU
         sEK1Z0jIAOdoWRgpHouFzBI+9nC/fjL0xjHESjNpLoPmNiX0EJEJsLvozEesIeTXIrPT
         Sl36VKpCgLnVUZOFW8Z6qLAjQcwhcQ7Py1Qy5XTIPv+6ZFi0HNqPy26jhSgSaLycv+8o
         qQtZ0oZU7ZWAA/sVBAyjSCUybc2vXHTwfubHwFaIkHDheu9XuannRXRPSOluzq5dRlvN
         3t7LB4lWes7YQE+pjr+NLX2KK3f7+8IfIbNu+181hZU0ZwKB/zhHarECEFZNQHPXmLA3
         9PyA==
X-Forwarded-Encrypted: i=1; AKwUvBxlyzidLJOfjkEml/Bb2mRGL2DYofL6lcojEsQ+vjzIP5mQxEq5w6wkC0ev/GacjJqkc17yvf98BXcc@vger.kernel.org
X-Gm-Message-State: AFq9FYJP0I/ot28yI/6U3ZaQzvwDdbDsdZzy/kQtGmp+1fbVAm+Zf2zq
	8Fp4y3VZmqWP5XAa9hya9zMp2w3BaoXlLy4q1l3wNB/Oda9OU6BZSF3R
X-Gm-Gg: AYBFou06K9IBCK7HzxzZVGu/NC4pDAUau1kwMHt1A+/kKHgVtA3CuQ4tx0TQFqQBVv9
	p0+lGjb1wpqZlF0MfyCLVd3SGoPAWOBhdZerZyuMpV4FsipPxsczK4W3PvvMj4KkaC/S9XkTu4u
	lw+ouSY9uxBJqSe9Ws4gD0f7RrzRxutvTg6UvuP6SPg0VZRHKm9tkPLyxnlkaGDdGdQZkC3Yx/X
	TaFz9V/UWkyB3s4PwSnal0iSdHUR/Bv1aMoXBSPpSc6CSdgdj1VLSRPNMKL0iIn8Fil2cfxC0GP
	kXU60j1MaGVVQx0AK//H8OaO4qjWQ+0n93PMTXvg6wifq0tNd3Dm0bly4FxrKx4OVCjkrUpFCBe
	sD1GWeqx+n7kSnLPd1jK2JKIt0TJMT96UNnsnLt7P/41BN/JSND3SCeVb64cF7XKX2540jn2A/Z
	EAqCG5cep9JNK4VlkTW1gsocYXxGe//KA+eimQC2pxA2Zv3R0mWE6xLY0U/wiKftRx+LjQUdXE/
	gNrv8nGXxnMQgtdF3MboQlU0YqaiyOzqd/g0QS0Kxqt+hd/5PWF5wXYEkUHfy5Uw00g4dK3MLTJ
	/BoBM/+ndTmlunWD0YuLnuxq5ZV93DIl6A/JNU3xZiZNASNu/sjbgDX9+wSj
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr42902295e9.30.1793008666472;
        Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: airoha: en7581: add integrated switch node
Date: Mon, 26 Oct 2026 10:57:15 +0100
Message-ID: <20261026095727.31708-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add the integrated switch node complete of the internal PHY with the PHY
address and the supported leds attached.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 147 +++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index f214fa3a3e2b..83ae41271f96 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -470,6 +471,152 @@ fixed-link {
 			};
 		};
 
+		switch: switch@1fb58000 {
+			compatible = "airoha,en7581-switch";
+			reg = <0 0x1fb58000 0 0x8000>;
+			resets = <&scuclk EN7581_GSW_RST>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				gsw_port4: port@4 {
+					reg = <4>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy4>;
+				};
+
+				port@6 {
+					reg = <6>;
+					ethernet = <&gdm1>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_phy1: ethernet-phy@9 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <9>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy1_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy1_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy2: ethernet-phy@a {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <10>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy2_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy2_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy3: ethernet-phy@b {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <11>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy3_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy3_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy4: ethernet-phy@c {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <12>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy4_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy4_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+			};
+		};
+
 		crypto@1fb70000 {
 			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
 			reg = <0x0 0x1fb70000 0x0 0x1000>;
-- 
2.55.0

