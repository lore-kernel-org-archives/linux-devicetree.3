Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7651DE8BE;
	Fri, 15 May 2026 01:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807857; cv=none; b=NvXVGOHY8DaTz83F7s0V661Oty+BIUrFBwGK+dkJTTdAZQSfoY0gNtFZ+RW9i6dV2p1+Q7OD6RK+9ZnQQV7l0X6PPsUtAibo9ZnJzcprXlrDNFtkF4HtMbA5G4n2gaNHAJsvTd+OT3cZ6oZYPpsrjK1E7shynZfmZ4W1QSlkMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807857; c=relaxed/simple;
	bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/F3vytHX8wmxEQzszz1ecjVhxtcF7jQWg7mnlk+krOTri69ndnCNOb6Fi25kEdN7HwWDfDaXz0UqnMXRC3zL9C8oLfosNHH5y5Tfay4jkviQ0SNSfXDW/LggVQJfdjhSu+KkPm3/zpBogYYPjmqDKxNCKkMAvnyyDMypVHA8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GmWj7nPr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GmWj7nPr"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B83BD63C;
	Fri, 15 May 2026 03:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807845;
	bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GmWj7nPrLdeKwf+DA4KqFN0fRJzKo5CiD7UK1+4/8+gbMFrrW7ewB2shpNpaM1UmD
	 Qt8Nyu71Q5Pgl78leq2bFN2Z6v6159AW9PbZUbKy1G5AVBTRJD4/QTLsL2dWYRZyRW
	 XowbvouksCN5h8qDQmw2O60lt+PVS4kt8T8CNEFs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:37 +0530
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1
 mux
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-2-f6acb66c9995@ideasonboard.com>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
In-Reply-To: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQa7QrkIZLD4EBwShqDWisHOXrIQDLE+LsHm
 Ch9PUjxjLSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0GgAKCRBD3pH5JJpx
 RXwGEADQ3vxqTgM9dX0LeVMmriAqKYwj0lh0dtRhfUCieeO85k1yKw0WiBxZPZLW1t0MdAb6ng7
 jp1/qtEpS9wn27Uzu7duljv9Qutqo1sLKABwtmhlCOLrWTB5k/2vPf7nKBsjZBHl5VQLeZB/N3M
 R9DlxlyOO9oIGnpg18zwfSyiMiA46ugna+yxWMUG25UwPtmc5K7MUz2JRmcilYKzm4IZavVYRaM
 OZBbOYvx/IFE4F5JLq6NooAvTrBRJUQcpH4onEVZLfNxe/SAKVqwJ4AyanZOlxK3ayWt4BFx+J0
 n0l0jbdGrjYyHMPxK23fPueOln15T/zW/HRwjEJf2BSyONbgEsjER9hR+ln8Xkslm4oj7HIuwRT
 k8BysB57z7Qjr+N3XMpn67Db/PWV0jam02vZfTEwb5HnUUrA/XJjCfFjTK+FbKDP8+AB2SKU9KV
 fXYeZBitZHaeibIza6X8pRAczi0cbST0CjANj072LgdY571qk15Z2E25/GGXHtGU11OE7GPnIxd
 hlEZOQfM+Qem/3FQQcK6YPWlgYqphQPEXtUYFecb4wDK3/8jS3RguXlv1Y7oyQYZ759Tp6tMaJw
 Cgmj+uS++W4bvXBRN31nuwPxaTHFKNgBiYJ4sWvnbyBIFRD0UrGbDyoe0PWWqlVz+/1J3lg8nHV
 jNTITDd8HGIqycQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The DSI0 connector is shared withe CSI1 and selectable via the TMUX646
switch present on the board. Model it using a gpio-mux so that camera
sensor or DSI panel overlays can override it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 06aac02a7668..041aee2cd5b1 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -146,6 +146,19 @@ led-1 {
 			default-state = "on";
 		};
 	};
+
+	dsi_csi_mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi_csi_mux_pins_default>;
+
+		mux-gpios = <&main_gpio0 2 GPIO_ACTIVE_HIGH>,
+			    <&main_gpio0 1 GPIO_ACTIVE_HIGH>;
+
+		/* state = SEL + 2*OE : 0 = DSI0, 1 = CSI1, 2,3 = off */
+		idle-state = <2>;
+	};
 };
 
 &main_pmx0 {
@@ -199,6 +212,13 @@ J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
 		>;
 	};
 
+	dsi_csi_mux_pins_default: dsi-csi-mux-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0004, PIN_OUTPUT, 7) /* (L23) OSPI0_LBCLKO.GPIO0_1 */
+			J722S_IOPAD(0x0008, PIN_OUTPUT, 7) /* (L22) OSPI0_DQS.GPIO0_2 */
+		>;
+	};
+
 	rgmii1_pins_default: rgmii1-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x014c, PIN_INPUT, 0) /* (AC25) RGMII1_RD0 */

-- 
2.54.0

