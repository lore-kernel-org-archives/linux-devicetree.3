Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413803;
	b=iZBHH+uhx73SWQOsTUTPTEntHabqCioNPl2Z7WZuxw7PUac/YCqif4RNGrE3FqWq7Rxl
	 kj/5A4yP8uGF4LkBe6dQdqSwceYnDc9KPeX+Jsx0C8N1SN0jiH6ExMOFUHyFenXYdEekq
	 rhRagEh2Nw5yUiUBTDLxdGCuz51bOtJh8pRdUDvU3wHJwWZU6J6DfIBA06VR4RDQtThwA
	 yp20Zw+bkZT0to7simOa1ES9XpLksoFJ8mKqjiWLnBC7AhMOAIr+PTwxzSbArbAIXmZml
	 69eZrwIS4xVXnN+FDIF4+c5N6OdllIJ6xk92JESpvPkbWqazkXA20AYM2Oy4lqmleLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
	b=B2MlaC55kFa2VJlvprpgZGoUOJUSx16yfCe+UzrMTMxSJWWaqDsitiE2yKNxfJEe6XIX
	 HqLXYJIKLoD832fngjrF4iDLyVei/f9eYGNZXUZ+l9hmho7WqAnuXIer0jfIOAyYb7Q1c
	 Ot86pa6b6OaSTZNnlve3FyNz1VRjpZ9HX9+xG5OZj/fw0WC5VvuJ7yViEj8J+uxymjTN1
	 /4bO+KqHtAbfd/MuULNbKz3vhmXjEI9PmHi6bQef+8EZZ+fxI4o0dKWy52LXtgRXOHQVk
	 14QZduaq9mdPm6/pJzjq34cB0KCYRExSfsYUcmK8BmVu3iCpRucH62aLFUBkpjEoJyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="CVimmv9/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B8606A8A9
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4B8606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=CVimmv9/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23431825e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413801; x=1795018601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=CVimmv9/YyZU6AJwXGaip7fVyORgOVY9vHCD0+v9Wsq2yB1Mgho/tn/ThCTYFKNijG
         oV0p33U2a1daomR19trtTfpeUBCWvFTNi4+juWIcEu4kjy3hQ9AurAVAfbuEBQh0qie/
         3g0dDnORCF42d1HF4U+O4bx10ZDDeqbDtc/+bNWE68IhE2Dw1dB90XPgmcbClpwLelqw
         se75rKSVFNADxNyHo4nwo2YKPPUlO+TizaKYzva+wrIt2vlopEERzC2WC/Aw3fVFU8v2
         f5ctqoTruT+DUYX7023GtjqCUtLnlcE4np1oDxg3RJpbzwn9cw5iwvdZ6MdDjer2XkYF
         afYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413801; x=1795018601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=dwwQMOBRXXTwJU6eazW77yvdRQdCeCH2btoAXWcVJlBXcaOG0sDK4cEHJCitBnHQVB
         QidM3KwvTiRodXzpB6uTs4Fz42qH7bwYIsFeZeWLYUnH9YfchQ541m6NGENcPcPU23+s
         voz8YdE69ZT74TbPGPoSNCqobBEhg/DDYpNPRVs59X27H24kBDcV4X2ClA2Ykr8Y+E3h
         nx61QMklhKYKE8T9Z7Bz/H0f7+lRcve5IvPcGnfgRBA9u2TYDQ3PgwrweU1d33z2eSGn
         LemXKOxIeU7JaX+JLScgauKyRObd1KSPjtcNq1rQdM4CzPDs9Z455PiEq8pUzG2h0cg0
         XuCg==
X-Forwarded-Encrypted: i=1; AL+hErGJqOklD6ayYFL1Tp55DsU7aYRdv6Awi7OwLif8CJWpaeOeggUsdDnu+fqbcUuaAAktuqSGIz0rQGtA@vger.kernel.org
X-Gm-Message-State: APuU4Z9BONx7i/wePyNYe2qjJVI3bbmI+KkYPc8F3El+EbOFys59E9GR
	ApaK4xgvh/1tyizvBZSryHCjH9xHhqUSggOmkJ8vX9SdawdLrDcjhEIqLVRR/8JSHrU=
X-Gm-Gg: AYBFou0LyuxjHPOIzK8OcJonPvX7iDU7icYifpFRv5jYe6vu0yw/K46I7tGp6lS33p0
	wf5bx+AZ+rLeMfnDWAmncZjZLEcq+b2diOWQVjyC72AROXx5Wg3jg4O1WMeUY5xOzxW0jXf7SW8
	UiU94rnMMTDPCJcPFSj/E+4pPPjGvWCIitX8cklnNvutFTdFiVFIPvp6VWpMCgT2KJ8dLLA7I3P
	m6kAS1TB7eFo2LatIAHbDX2Xq55xi3+Pg/OSVPd3NQpxaGr3c1/E27KZCg2mtSh/0B/FYPu7oiO
	AQf+WuhrHWhco8WhAw4uf92VA4VnlzcG/S8BqM3KBQuG07emmCJW9namBuJ7qnXG2Y87RFVNvt8
	TbrUOiE5XP6vdRVJWP9HHdLQzvv/QGwrxgK7qp3j2EFRwlCzGCln41B9den5xTZfluGbyVdADvg
	Th9wfVNW1yRRNYvNnuNQZ+IQmP9tESdUxHgXTXQFKl0iYN50LXQyAW58Kn5SlN0UzyBGGEA/wor
	DU0ry79cRbo70TYthvyIh7RSgEGYHSFM8PWTmFQYcahuNKp5RBSU5Uqd9KQGuM0HaVgKFgrXFjX
	bxDuFZyZQlz7aHTn56/GUGYcLrqSwrCIdXVE8LLNSuT9wZiho9F70ueS06PSBb12AHMKAJDboX/
	SnDbHOu3mzBqCGVWcbuT0F/fhM/rULL/bPBf6i2QRfOC/Ttm4MVxolMzrfUIOLq52Am1D2OKkgJ
	87CSY/rOV5sZedXbu7udmNWXUQg0aOCiRYMNy1/H4fqlDL
X-Received: by 2002:a05:600c:1986:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4ba09379b69mr50759305e9.8.1794413801590;
        Wed, 11 Nov 2026 08:16:41 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:39 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan controller
Date: Wed, 11 Nov 2026 17:12:48 +0100
Message-ID: <20261111161619.232141-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- No DTS changes; renumber from 6/6 to 4/4.

Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0

