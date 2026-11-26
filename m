Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655739;
	b=UMos3YW9hYJ5ui3K4b7EEyWblBtXRyfe3KDkZNfcz+nDwcT3zqoe5G50wPTZDBIPD6+a
	 2YZ0jTiUxts0AAjhZervlZgMub5VALqERLHKrasGSlmS18W/wXo0FRZUCWuHlYfqAHpoq
	 KIMJKNQqhBJ8P8lDoYt2itVJhpfnyvxDKh5NJqLnq30uZ9CI4QS2nMh9qSUg79FAWyGM3
	 XIintm4UUARNG93QsThj6DTfLl27+OAf4g6GEhXXQC2205grmvSljyiCwQceArji44syh
	 10gFM39e0SZoRMRT8+eobzpRc5zeTGbsXQdQ4EBQ2my7Rvi5H3Fh8HvpecQLrxQK1og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655739;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9UJ+q7zIGlZFEE68HiZ/mvBeBCv8598/0azGk8CdL9A=;
	b=Wc8ZN98XkYcyo+WSEhE92fLJTcu1rkfqJwGqnirwyy827Af+P04rmZig5HqImDKniuY5
	 sEbjT3QAm5yZC1/ihI+AAd3ILm4F2r7HuiwUKeiKeajlpEr+y7O5Gz+y1EYGe1BqtkJ6h
	 lfqMrDRS/lALz3aVj4ziSN2FhEa530/jW9P61edHKv7iCbuieRJaAo01QWsGyPsMDpwlP
	 BGRMWEEB3P/jyQ3stAkxn5aW4cnBpt0sYt3MOxj4uZVshJduz480o16Zf2BojR5nerGHq
	 SxSar3+4dkwyITB6uelZjRoorP5SvOfRcddJT/FHcei5GoAq4CqZUINNFCUvweUnyZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=o56NrrI8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B81606A68B;
	Thu, 26 Nov 2026 01:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B81606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=o56NrrI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=1AftK+nexroecJNvfTH6e3M9x+eZJLRIy9WcYptEJ3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o56NrrI8f/to+Yy0Nk5B7U/zTcLr3EqzYRIvRz8P5hQNsnJ+Yaq/LrxmbI1xKQwxb
	 X+n44Ok9Ki375NlorQOPKz2yTMUGGFSBEbNg/EDd1ammCB5AQJLtqWspA/pijlTc51
	 6RTiO8mpOZD/VT5+p9n+1Q+3OBzDGuHgsJE8N42ngn3F9n8AyE/Nd+tV1awoQUixk/
	 a6ER9w1gK9nrkiPKH3ANoAK6TRhchW6Y8GTAq2BJ8wAsdhFiNzcK80IdYswVej8wvn
	 8yV0FQxtN4I3zmX4ErrnA3WAJrWM3ooECPS9zxiY0PXOT5ipayL8nhKub63Pv/bFGP
	 6TXm4G2Pn5PTQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 612EE17E120C;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C742148003A; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:34 +0100
Subject: [PATCH 06/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 ArmSom Sige5
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-6-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1AftK+nexroecJNvfTH6e3M9x+eZJLRIy9WcYptEJ3E=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDUNlc6OPUljMla6BEFVhg7xM4LJpd3TN
 mgU4WL/hnur5YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qaP5YP/Ri67zn4bCF3Nig8rX/X1XytrwhLU9q/co5aS7kk7GHFc/Jm0UFKbHEcu7E3C/RGZfa
 gif8RNiN8uStNMy1J+3JoZaAtQvz1zETpb1M1/bfvI4eatoJZePXMy7MlwGeyX7IT6YUM2ulYAg
 LKkIJOwu2ldgXmcUjd952og6KW4q60NXNBS7E1C3sAOTkz5Zu+iu44JnSO+wglnU3ze9u67ohV6
 rx+BzHNMrWVq0/3RkLY+p7PzZFd+dSydiyPk6uFtbXoPOPir0QDXwOIr5cL2fXyVQ+lFM4KUzSW
 WVfIXWut1zFGCu/kyzwAvO5A6yFoq0MUWbG7M94GwwRI3iqIR24PwHlWi3op5wVK4h+Sor5OcMu
 PQ6Y2hNhO/szUgJR2ywWsQUl0yD8yQmDZ+exsQOg3PvwK9uyInmtLU1912/JqJ+VfHjFEoVnUJv
 9cgfBjOq7vwT0825Gq4YbhBczulgtPNxbduBkKRhjApNL/SDqccpl2T/m8s5DZpf4QsP/PT6LqJ
 xNDb/1kJz5x75X1RuqgRqrpMoXGhpzEVJaLa9NJO6FiauK5Iu5BZoVv9+F97N0gPOI+MnSbW6ZB
 2EQWzOW+2SLwQA52mz3zGY/SBQBTi7u5JZZSDdeiW6n0iwHXhifHx3anHISiavS1MhshsbtS8wF
 ho0xbweHGyylK2NmnNi42sQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Enable USB-C DP AltMode for the ArmSom Sige5.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 76 +++++++++++++++++++---
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index f50824966860..ce9c4ddd2c33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -272,6 +272,22 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gmac0 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";
@@ -722,20 +738,22 @@ ports {
 
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
 			};
@@ -999,14 +1017,14 @@ ports {
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
@@ -1026,9 +1044,40 @@ &usbdp_phy {
 	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
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
@@ -1047,3 +1096,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

-- 
2.53.0

