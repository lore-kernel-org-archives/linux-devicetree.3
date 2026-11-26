Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655738;
	b=Bv/Vu3hQGeWqVVutdJ2cebk+ddWdib7upNJOCmcsodV37S79QuzFkDQax8hH57fb+/cT
	 kyqYrsbtukV2WSuPLKYC7Yw7e7+GUHa57xH8kqLT6AIXDnUa7V6j5Z0iXhj5OL3zr4217
	 zsqGMB4wXOTd8cJv27fmRhjFI9e1XKP7VErQtLzwasIdFkPX51c3R6763SuVR8hbLsEuM
	 fW1gKlZ9tyPlbWXoQJQngnd11HkU4vj4su5OjgBBBnTevZH64ukCGp5DQ9fklW3IT8GWZ
	 KfXA+6WKFEKXcc66x/3+BnmAEA/tsseg+hO2EX5RoPsMQa3+zsuZxIq0eR2mr/U+OKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655738;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QzmxQs4zicvWfzS1qJCDMl9nOspC9JptaKcmIv2t/Ww=;
	b=sYi+pzeBaB92BJ3Fg95pDyce+mSSuxfoCRTYdVPCHD0xMJhsqboiFUsPaVZFDPkeVrZB
	 Sov7kpOM0i8PHmB3PdlKwa3drMOAQS0IdQX7oUhOl+HI4B4CQZ/vGSfNU8EbYBfoLDBB6
	 T6NUrsE2D7I/LIg0mq3N8u2D7zmGEVRnGexGO6sXtN0o1G4aU4vwJyqQsJyMY/wK9nXdJ
	 O2LxFMqcKV6fXxo1qtFeop0NT8AA7VL8/zkzGtA6PNjfmaVUlZa+DYabfA61u+l6m8Nrp
	 z9zGElQtLz7TM5gtCm3Abj2VS27J0Xh/AP0LYXJXT+0xbrKpgW10gXVCzDfGdYl3uYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="RpB/zLKG";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57231606A685;
	Thu, 26 Nov 2026 01:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57231606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RpB/zLKG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=tQK37NTbi9NxpR6L0RzRWeTmpieiVQIIDCqFH3tLBAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RpB/zLKGQNJ7NeVHSD867oT93MQbS1cucF0Awez365Qh349HNDljUMECZy/Kb4XIn
	 Hh4KXK8Y8jJMh3PbXxXam0DdbQUm4CRqZ+rr4vbtC8rAvYC66QfMOw8acXMERVorbB
	 0tJn6+YCxldzZ1vUIgUMtoh3PEGL7Mj5fRORpXN7EPdut/+K6NaCL66U4Oj3VVlo8n
	 r+af6SVoyxeJ67MUb+dtiSLPZUDvMZf2Qz2zm06YEnzjVJ5+OtGLXk4/ywnn1uVs3x
	 8XA44baW8DQMr3e2CqG9lFxEtxsGZXDlu0jXjYgFp5nwV4FMZvHhUcpddFv2Ne9Ntf
	 /D3WoNjf4IFjw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 612FF17E1296;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C583B480038; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:33 +0100
Subject: [PATCH 05/11] arm64: dts: rockchip: Add USB-C DP AltMode for ROCK
 5B family
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-5-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tQK37NTbi9NxpR6L0RzRWeTmpieiVQIIDCqFH3tLBAw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDX8mRgGkqrhZL9QKcSDLeAbwmyd3758b
 hidu08kuUfgO4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qa3UIP/2QzmCq87I6bYrP2kqfZQeRXIMnwYvT/nQpy479HNkhnAYLRf+RMBJ0t1s3BV3q/gcf
 3T4oT0PFwyVd/jeT/CkDARYA//R+ZFdjSnUNzQLsOZ45nPtN750AOqbwyixz81javk3ntY5n8j7
 g3WiG22rJksSSSuYHBwhrzfM8+DlJPpAhIf9c2LogMCbch9CvK5l/DPnzCZ7v5K4e1zM8PNykSV
 Ef6vVJ0Zwc8sFD8kmOFyzWwzL8AWlm/QFPiYaSu6sUcbmQl0dqr5CBdF+8w3x80RFBrVK9KH2Aa
 qUFmuctl1ZPheVVCnAf8cPMs/I0Vky+cUHT4Ho3SDKvOAamEwmzaYMB+8w8+2s/+weqREjoi5tA
 ncGVu4x4A5HQ6IOio8wbC434jPqfeNVlpqffSMmngj3B0djqTn42BearbDTncw3bmADHbrLvmpi
 Dsvu6KGWPEgBCbRy/XoY+S37bOnhVF+K5HppqJz8edolNp7mH0u8YQRNlurDjA+i295HoryIT7+
 e8mzudufNRfiVU0o4NHhwuCELMh08VXyFCNEU86hrV90o77vRuZLyq594GnbrjQy6UQXDBtDISo
 0l0xV1G1WsncFx86NWclvkZPdr5QKggY1+OR2G3iYYDyuvjf7l4L3mmL19G5WJ4Ge0QxrXiHGO1
 NpCBc3tWeMmWKle9HCzU4JA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Enable support for USB-C DP AltMode to the ROCK 5B/5B+/5T.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 82 +++++++++++++++++++---
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 0cf6da8d8f1c..aa0de092626c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -178,6 +178,22 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp0 {
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
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -359,21 +375,21 @@ ports {
 				port@0 {
 					reg = <0>;
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_to_usbc0>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -1033,18 +1049,40 @@ &usbdp_phy0 {
 	orientation-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
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
@@ -1065,9 +1103,24 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host0_xhci_to_usbc0: endpoint {
-			remote-endpoint = <&usbc0_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -1106,3 +1159,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};

-- 
2.53.0

