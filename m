Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339050;
	b=DgRs6XZhnqKVDo8mGRi/VCU8vstRVjKSV+fP8bXew36wa+5WNOrSa8bn5AI5l+Xvryk3
	 TDrMc2B8WKWoYXrlRZAiZi7jItQ7+QQcfMT4qQHrzBIcxQ1bkoazX0TSiZc8CbUkkKfHJ
	 g2ZxnyaVnYLnt5ArZMisNcgJKuUFbHfuv4qUjBlSMedpaMJfXH25ZYG44TRJXtdMm8EhH
	 S/Qw8DpRAqzPqyZga1P80vrlbhVAknrYv4McoVwp5MxG5Tvp5YM8OnyD9Jpz1F3IXDtP1
	 sLtsQ6G55ZR7htATobAg5u8BfX5NJ3bZ7lbHOe+Hukqe+WiPOl+VzcwjzjtT1II/uuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
	b=Nnbv+txNJ5twKY0auPhrWOYrnNQqUonpYPLsmNEYkFg3W0jEO6BGczy9mTchLDGQeq/b
	 bcMj22ABnDVDFfyx7Yv/mMhiVlQMdyOFZsj+1v557mgvgRte0USQQ76IfeuSPUX+2HeyK
	 CcCYK7xSoZfvJFwPiWkPe9H4WU9WDi9MTnr5hlryClKdf8xMlbvRHJTmZBbZs6MmIf8z6
	 M7+K/MoivrqTXNAcIfHIrJo5bLNFPCydIBzvGwgNmuouYbxrH44ZbM7IQ4NHm+2YGe1f8
	 PxgThKeGB7tApBKCtK3ZSI6doMeVj9nITAw3qv5IW4VQGoNEic1NclIK9/l+5sFxqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6bqoH7V;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640260A2607
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3640260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6bqoH7V
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso1492838eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339049; x=1794943849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=h6bqoH7VMNzR1Uc8o0iEVl0dIWWYMzwCTv6JFmJwsHvXwfnuMX5+S6eMyAsWfiLx+l
         maYL1X56Wenjg94aCeWnt+n3mUhiGzVA6W8phl+vz6gAgnJdhIg1fMSR0g7Gycs9kZys
         YaB5rn2nBFLXFSAqlVsBpZtSZ8bWKK2n67cBTXOmoWOfULksbn2//xs5yDHaK5aAZzJI
         il8OBSG0LJ4l7HKAGKsKpMvhugu16sV1otQvL7/0rFlvQ8W8JxhwRP+7isSixfkh80yr
         QBZ3DnUerdp1P7LLemzkt9rRw25skVMLMy377c0vHVjyQctiuK5N4P0+EdYXcaR2z4y1
         H0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339049; x=1794943849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvA1lxZEpIqjWhYL3aA6OSO2sYeOAGbwAuUAZj8n0+c=;
        b=ZoLB+tTJymJPTaihKV20ZW/L+pA/WK5GJHtbHMQMnpaXZJd7+VdUwnixYTc39RVKjJ
         KJgqoqnGhifpybweyJmqlt7Yym6DWzNU2nq9IjN2zo+AqrnrrbWbVegtFkbgOODmPPDE
         QUFYxhgmvtDpa1iViKwL+61EbRFiBwy8MLQiYwXfzgvt0NkTlHS4k0kzpg8heVI4S1Xo
         U7egkvBZGUSctbBX4IogfIk+V/Ogvet7FQa7R4XhlpUhvHpgXV7MQw3ly1p1U/Z9DClg
         MgoE+2aSDLx+yhvTt9mWBaEB7imQQCVHXEO+BwiL9fLP9VbU2kVehDzHxmBjDU6q5LbX
         PliA==
X-Gm-Message-State: APuU4Z88OcD5Lf7YyDFHIspdX/cx8ijHES+t+9lY7yRXov1NxAsFyanB
	UMSuP+1grMhZQkH1GXqI8og2RATaX2sQ4UOAwZ774W32gdnqPIszbrqN
X-Gm-Gg: AYBFou2OK91o421PlG+93WHQrI3JscXcG2ylvDZplLp7MlgbAzcvA2G2olYdbUpASb+
	vS8GeuFPlq3KK8zn5f3M1yeVLw2Eo21S31IlMn140XbOL/ekzrKM4ZtoBMgz/qIX8DnX1V5nKwm
	WlMik1xdxp9tHXgWH9MO/lfMNoeJjthf49NiAT8XLhV9cuQEt74LC11n4OGlz3Ahwq1IHniEu4v
	pryK/UOEVMWZehTMsM80dhR5FJR0e3utEA+mA7i5664yfbE586thz8Smt8uHphgBQArxH4nP5kI
	qxujIZs/s2ovp6kGoycwlY+4wb3N/zN88ciKefg7ThVUyIyJKDMX6vCJwOs2MbUOwdR9tmhSVxC
	uwwTfG5bCPLOhBVRZNYBn4UjekA7GEOMLfJ+3PIKP+siv2SHqJdEkFBvAAp1TjUS0lc4nwGfeFf
	qDiEqDblqzC2U8vjP7H/CRkcnRaxZy1HT0kl2DgnMwSwC4UNnQzJGIu4N+tEsw5AxKT7wJp0lRl
	LTSAZqbdWhQ2r659j1NuIHzwjnxOA9bG24EaZ1praoVdYRM2C29VljALGlf0Rqk46ly7kQoQCbr
	IE90C54J5804rENLyCXnB2L4ZHGt9swiHnDtq4j4Snd2Q3yVgA==
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr395559eec.0.1794339049150;
        Tue, 10 Nov 2026 11:30:49 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:48 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:28 +0800
Message-ID: <20261110193028.512456-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
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

The Type-C port on the EmbedFire LubanCat 4 supports DisplayPort
alternate mode through the RK3588 usbdp combo PHY (usbdp_phy0).
The sideband use (SBU1/SBU2) AUX signals are routed through two DC
switches controlled by GPIO4_B3 and GPIO4_B4.

Add the DisplayPort alternate mode entry (SVID 0xff01) to the USB-C
connector and connect connector port@2 (SBU) to usbdp_phy0 port@3.
Configure usbdp_phy0 with mode-switch and sbu{1,2}-dc-gpios.  Enable
dp0 and connect dp0_out to usbdp_phy0 port@2, with dp0_in fed from
VOP2 VP1.

Tested driver stack registration on LubanCat 4 hardware:
- dw_dp bounds successfully to display-subsystem;
- DRM DP connector card2-DP-1 is registered and reports disconnected;
- typec_displayport registers the DisplayPort altmode driver;
- usbdp_phy0 registers the phy-switch and phy-mux.
Physical DisplayPort link training and monitor video output are pending
verification with a physical USB-C to DP sink/cable.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index a94aaddb2..6c5a942df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -323,6 +323,13 @@ usb_con: connector {
 			source-pdos =
 				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -342,6 +349,14 @@ usbc0_ss: endpoint {
 						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
+					};
+				};
 			};
 		};
 	};
@@ -857,6 +872,9 @@ &usb_host2_xhci {
 
 &usbdp_phy0 {
 	orientation-switch;
+	mode-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
 	ports {
@@ -878,6 +896,22 @@ usbdp_phy0_ss_in: endpoint {
 				remote-endpoint = <&usb_host0_xhci_ss>;
 			};
 		};
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
+		};
 	};
 };
 
@@ -895,3 +929,26 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&dp0 {
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
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.56.0

