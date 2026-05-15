Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596F1DE8BE;
	Fri, 15 May 2026 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807851; cv=none; b=iAGi++bEJZl6zNCA2a6MhjRzQmmNBpf0nD53/WE2MHkjz5o0M1B27f0dcntil3Zkg+gQ/cE5mfxmqKz5ssRQZnjQwQ0mMsG4PC2FBCtzp1QZWZZa/xlw4ZO2VfmILunIeaLgnQLn/VtOQAnVH5xDK61phQNPNuYRHA0Vn1c1FLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807851; c=relaxed/simple;
	bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vdcxnc4SP0U3AbHQb+mWAZ3bfiH8t/tmgFQo2O/zH7piCxsTdVCgw3EfIvZ8UbBMlYt8ay/9a6csixPt4+21EJoPfLM5E6sWb+7FQqwNxINu5JJmBgnpN95jzg9mehq6A14UawiwMFtyKmF1m9BsuXYmoUq3BD+nNqmk59ZMPtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mJGm0w54; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mJGm0w54"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2EEE8FA;
	Fri, 15 May 2026 03:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807839;
	bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mJGm0w54tTrC7/itkWlkuDEBnEo2Pu/83IJTuhSOjKaCzXMCydD+3As4stKeYrfSL
	 A3qkoRF1fksdzN/I39SGMf7Tl1I5SdEcYUP7DMcshuI8jQFoSFD45W/xM73fnTb6Ry
	 JhmBeq8p4m5C0p7uXl7cCFt1r3+WlBfCcV7hBN/A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:36 +0530
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2
 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQZiQzcrY3I0fuPDmOcfwFksh1ewRRpO4sVX
 aAkga6Klw6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0GQAKCRBD3pH5JJpx
 RfHxD/4t5tXUm8X/HEfntVHw9mTx1AuCZqXjhPJFyUsjJWAwosLxLejG35K4EnpaebVB46f+ENe
 XFGKPqNgMJGCkDwOKnGURTq0QbBAM7O0WVbujBYQKrbqMI4R/pnIKWqoUDvqNbkqa9PszJsCCQr
 noQAWwixPhoW8jOLjw6lm1kJvYtClXeB5Tzt82JkGaATO4wiJedO2rkKcZ5mF52ZN/EvPsjiuhc
 DrYWvIvUgF2ENRea9R+gqdvxKmkK+2DrNYZQEmMmo7ISP9RLol9yAnZwRvcsVYtUYH0Sr//7+Sz
 7GwE5he6mmzFrxR/9PoOUtg8ucCifYOXXuxabSg3MhAYzvXjDvz5C0PjLCN1UTGlfHK6Nlbmjcg
 9qrIr5gfIAM+96PV01G5RACj9tiRlBuS71+xkr1F7k59/3aiu4VpzLgrGGgWu+ziOfC5IPPbybQ
 02nhHB5ePM9Ww7GIRUneoE10FOvT8+xv5Z1WhbEu7RJ1+wp+5epLoQvB780mfHB7hZWw9AxVgzR
 XuEwst+T/zkTzk7YHPE7xfN5bCEdjNso8lAYBo2gfPZuUOXfshz7UlPM7myWY+JxGCwaK1RxBOk
 Y7ozDfyHkT+TqFKcYscpNIfL2SLvZIg3kyQeO1W+JJRtPDsmM6bu4sZZJv6Zcwowokh1aJYTEvc
 gfbD1JJ/I16ffNA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

I2C2 is used by camera sensor devices connected on the 22-pin CSI0
connector. Add the pin definition here so I2C2 may be enabled by the
camera sensor overlays.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..06aac02a7668 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */

-- 
2.54.0

