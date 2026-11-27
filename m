Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776713;
	b=Wmf+nlsZ7Ka5N0zWjtnObZJzswMzrH4SZAYgJTMl/vaHGu12Rh8I4LMjw2BohcZ7eJVt
	 lsgw6ZS7s9Szb/AglqMgsYVWqkEUPyn9GfuN4vMYbfOKODkQNdE2EWjQwMJYvHbtJCSLZ
	 Sn+hi3A6Q3Nzv3OdjKNAismNVBohW4ehCwdkiYH5SmKJ67tRLneac/Gpv3+yYwEzCGUi6
	 en9Ww9/VfrJwgzlaWFnb6//a4iIeMbft0oXOH6X7v0PhW5VU4kQYTMS3HTZ8o08yZ4mLi
	 x1HAcXFxQO2wu29SVjGaSKg/QN6rcu8tc/V29gxIX7k2GzFKFAmrSuhhmz8MIRbEdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776713;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WkHN9A3Y86juNKLrEVQSy/VEql3aXHqCYmFvIrSVDmo=;
	b=P0NUscnretVKulVNTkL6vk/qS3W85DfBP0TmjPqfy27Zi/FqbxVRaSjsMb0rCmqEsJJC
	 qssrtQ13YCKCJKyJ9DT8zu3aDujnNoByJAJxodP+wMCLejNFNf1iWIHAGsAtRU83Wza+M
	 FsZpQ2mjOfi8K0DRVw5J2TcF336xHNo9QyCoH7qUEHVyVbC4JD1+ms3K9FqP0Z0EM90Lf
	 gCL9+DR+vkO9gZJkC5C1Y4/NqVDqAQq4awuqKjlJ9jCTtC8XECk1u1X+ht/XJVbP3dPeC
	 lPcxRLXyLmqqYUPbjwAzxeA+4zNcnVMuaMy+oBtjmJaOmaP9mGXrqOsIMaNu8THzABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nAtZtks1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6060606A6A9;
	Fri, 27 Nov 2026 10:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6060606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nAtZtks1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nAtZtks14Tig29zzrdPMoTSclHymXU8DCkvjQxc3cboij1Ba9p/fRm69+ntLr3QeL
	 b0s2p53P/aDGpBMroYk5xzvavodqkG14jTY66ebsMRPK1fLgDzg61Owwe8NmnglhjA
	 3yvKgW6Rpx45a7KbeNKmT4wG4tPsnYLNg3JBet6z3thdw8udv0tXS1fsCH0UuvNlYO
	 eVcsk1gIJaU5jCO3gaxZBH/KIPgoowWB1vBN8horf0rt3fTiif+0wREJbcv6MRHMzp
	 amFiCUt/n3+mUV2NzrJn2QRetMNopbTP8MGyPow5b+ElUnqR/UljPEbe1a/cg9yd3q
	 fJnu2IBZBBgUA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A14E317E090C;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12F60480041; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:45 +0100
Subject: [PATCH v2 08/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RG-Vita-Pro
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
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-8-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMOa7mgy4eeLXkB9lcTJ8436MtVZSIPde
 IxQXkciURPtkYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qa9PQQAINZ7gBjhyGZyfY79H1PS4aNDXVunM6ZYZAzbFtiC868jmReX5kSwn6EAj6/nfsntMK
 fUEfPpYa5p2rsDRa9vl40cOMXMbw91rKtf6L6CiNj1Yt0RnwWct45vGFCatcjMCv8oqFct/qSQy
 WqmsVDf200Rr7pQnC410SDA9KZkk05fVRdh2x45zJl/0Bh8eW5Cqci/j1P42ceQLygUUZuk//W1
 +2G1sG5lJqDTxLJje7+5L2S281Lcnc3codLqpLq0+zJ2PYEJyQHNKY8KuvRm+lOL+tCAkMVWB4X
 +4XAUJFeII9QUVHzn1K4Ky8OReXVNDadlvwZz3RKUXw5uxkDUlM2dokpQToCmsKoBITvTSCPM24
 X45oQf7PXOqqs4hTEmMQqox313Swd7rDSYjVtHatG1Xs2V8gnrvRlD0mbqwZv7L65+ANKXO14Bw
 tt1rW8ZFf/LkDb4d+331si8MilMitwnKAgZ+mGfXvRZEvDDEt4HtU8EqkcdCmMTkb/xVO9tZZVO
 26xqmDH1pxRblRmnMLsc0ckWxaOASwRe7hQLQV8XQmkKoHdMcz2McvgspFMYs89q9txncoTv8Mf
 lvP0z7bVng4MHfz8apAM+vxJ1je3gYg0mQJ2GnSjmYwqq/XdOX+71Jl9pl6JRsVsBtbyumTioKu
 JtRrhVdSt5bTaSm1kKmkw6Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the RG-Vita-Pro, so that it
follows the documented ABI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 78 +++++++++++++++++++---
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 85576a437f7b..5da90f3792a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -469,6 +469,22 @@ mipi_out_panel: endpoint {
 	};
 };
 
+&dp {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -932,22 +948,25 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					usbc0_hs_ep: endpoint {
+					usbc0_hs: endpoint {
 						remote-endpoint = <&usb_drd0_hs_ep>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
-					usbc0_ss_ep: endpoint {
-						remote-endpoint = <&usb_drd0_ss_ep>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
 					};
 				};
+
 				port@2 {
 					reg = <2>;
-					usbc0_dp_ep: endpoint {
-						remote-endpoint = <&usbdp_phy_ep>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
+
 			};
 		};
 	};
@@ -1221,6 +1240,13 @@ vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
 	};
 };
 
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
+
 &u2phy0 {
 	status = "okay";
 };
@@ -1258,9 +1284,40 @@ &usbdp_phy {
 	sbu2-dc-gpios = <&gpio4 RK_PB7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	port {
-		usbdp_phy_ep: endpoint {
-			remote-endpoint = <&usbc0_dp_ep>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
 		};
 	};
 };
@@ -1277,15 +1334,16 @@ ports {
 		port@0 {
 			reg = <0>;
 			usb_drd0_hs_ep: endpoint {
-				remote-endpoint = <&usbc0_hs_ep>;
+				remote-endpoint = <&usbc0_hs>;
 			};
 		};
 
 		port@1 {
 			reg = <1>;
 			usb_drd0_ss_ep: endpoint {
-				remote-endpoint = <&usbc0_ss_ep>;
+				remote-endpoint = <&usbdp_phy_ss_in>;
 			};
 		};
 	};
+
 };

-- 
2.53.0

