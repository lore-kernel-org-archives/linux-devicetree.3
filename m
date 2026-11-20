Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167431;
	b=TCing6x7n3gTjHbD50QXQ6B2pWPDgUiWnbrZ9BZtXsoOjxf5kd7S55whW9ErhVckqwFh
	 Y1zRSLLJ1nnC+vN6zZn2nhRNN8nNYiGe6D15pVK5kR0VNuIxxo9ZO8SYOVv99J2hWSUtg
	 AMekuciJyJdp1f1eqXOGH418eUKkiu6d0SlnZugr/o2ZLH/thyJiwDg1zL6Nf9dt6qTZs
	 wmI1eEChsL4xcaDVqDC2gWtrt34byVYs9rrhuhhBr0SFuvu3GY8ZmgOEwnhL1GHFljT3I
	 tyUGQ/6gHkJKofRqR2QbyW9HQLzfAFEbRUY7tose8kCh0W3EwKMSr2xWt0QVCGc0P4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=;
	b=SwSWKHb4u8FECczM875E7W5IYsuY6R950sSkoscU181pfCJdAn+HM1ywkO9PsgUXzqW4
	 x7pOr8YemWf4PKGTiJ1+AuVKIGPqyFW0GU+ifah53SUgaq1AoYeOoG02JyiUk0qOcF9pD
	 pzG21YJ4XzmOZuEmRmvXvo4WBxKOBIno3B7Ni3AEfplRe6ytV1ygcLtTW4JSqlUwH/MRc
	 MQzUnZLH0aeJYQiyZv1fudqKYFKrPJiSaUdMoNavLjMqU4YvcuUCebmNQaGTFX/VVujVC
	 QdinyTtVFmeMTxmSOG6VH3IZpI/h2orgSs1y2HphxPzQBQhaRspgbRuMe/1VlIQ2b6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YOarVCci;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8632F60A261F;
	Fri, 20 Nov 2026 09:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8632F60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YOarVCci
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2974E205B46;
	Fri, 20 Nov 2026 10:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=;
	b=YOarVCciynMYlaxBNN26lXYURaUu2y8N618dk3Rk8Uec8xM0zyTInDWqsqz8/GN3ZdHP7h
	XlEGJuxRoLPxeJLC7cXkotRd+LstcWn5uv4vL5v/m+sJmm8y7inj3Wg/+1QcDCm4oS6tR0
	A0xtlnM/d5oWJVwMQ/uBVhOn83H5TkH8o/KJQwaWR5dT4Cfd/PQIkHEcp2htrZXWLeCPQp
	64pZlsk0PSIciOK3DoMTIwm+nyMZ2sxvKvxcZhlw1Q8VqPd7CATFlTMJekJy5Qi2S41nlW
	Z/SHfLsQmH2cdhdJgYjdRvUiqF5WLILqQbj13CeD+o6Ar9UimWDrqytSrWL99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=;
	b=Fqc06a/bvpcfpaao7tYEdwS1QdX6/Xz2L2nZxraoafs2osTUUXOHjJbvpmlloxSPCKhlet
	Tm9h7/yYFePdUHLIJXv3aiRGqYGysZsMlhS2pRndmxClBirLtlJuRun0eAbWG0IFkxAAoa
	XBjcj51C2s5fICe5Ih/d2kJuoX3Ot7i4dyWLQFUbfSwhGgWhzHheltlJMncy1KCJZkeAAX
	DlaY6vTyuAHtmS6Bop00EfJW9ky+niVfQhyv4buUHHL0wUomg3HnWdf3AxGN9ZhnoOvDAR
	Ei3QOWEs+Jh0GtpKRVcWCu0MpvLtfdlznOrWACIhvz4drpPcZ9zpisUwADJEgQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167426; a=rsa-sha256;
	cv=none;
	b=enS3vTD7tqgiTPDYhjKoK4+YRpgr4AnCsvhnGsL0IwMw89Q/4NK6YOoKrZuG76Ms+7+McL
	K4DJbXvNGKNUChbpP0h7uOfhNRApnb8NGZcKE55Y1Y6Jjc/Cc4dGY2yGoBNJyEmN8aQ70l
	Hx5nAR9zVGLpj6UuBh+Mclpses+uTKPoVmRdLl9oVcMl6UDwcZD/JwfSsJnCmWOSCga9Ng
	1CuFgmb5v1akr0CVEqZe9zglJevOEZI/biZgu0djnF91yHXjH/41jHJv7JS7070NOX5wp+
	H8Xvl6H+9LMnmxZjgfw9M5cJs8Jb/PiraCQ+V+KXSY5W8pOA1pCdIB46LHyO+A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-1p;
	Fri, 20 Nov 2026 10:37:06 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:08 +0100
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe USB2 VBUS supply
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
Message-Id: <20261120-imx93-frdm-fixes-v1-5-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The FRDM-i.MX93 USB2 Type-A host port receives its 5 V VBUS supply
through an SGM2526 load switch. The switch's enable input is tied to
the always-on VDD_3V3 rail, keeping VBUS enabled whenever the board
is powered.

Describe the switch output as an always-on fixed regulator and
reference it from the USB2 PHY's vbus-supply property.

This provides the PHY with its actual VBUS supply instead of
falling back to a dummy regulator, which else triggers a warning:

        usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 617f2229b559b..eed435f6f87a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -62,6 +62,14 @@ reg_pcal6524_vcc: regulator-pcal6524-vcc {
 		regulator-always-on;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -398,6 +406,10 @@ &usbotg2 {
 	status = "okay";
 };
 
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usdhc1 {
 	bus-width = <8>;
 	non-removable;

-- 
2.56.0

