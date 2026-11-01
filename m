Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570139;
	b=f/208NIf8P9I4OBcklLd4v2K32Q2S326fwqrBjMDdA7IZBVBPG8RKSXcXaRgeXLp8hrL
	 S+lU4Fq3MAQc28EcCpM5Ek3x51EN98uV0WW/vXEjAGSwIyNPgrCKC+QRJr+z/erhbl9Tl
	 mbAJjzO0rzwpLt0KMnCO91msvnDUuRLIcEBb8ZwMpDulOf65gg9aqPsXg/5BB4iqgoJvj
	 qIQTYfsFaRu1+QHFInVt42nXbkKvTzyMq6S/l07w2MppXcZq8TggKhTYW6XuxAty3yFAW
	 I0DMlvcjuSfk29mt2hbTpeSuLDE+ElAkwHBislVLVJXGzY/gotCZaKTLsiDzFsGNoAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570139;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=;
	b=RC8JF9nzkpD0YbeQwU4KCkgE22QaMxZ6lNcYyF2KyMZeEzWEdsvYBSGYq1pdMjuJHjtO
	 +E581oiCtCi/ayvXeeB2Qg30Y6Z+EtQyWSeNQcbUTSGr1vov3yx9XXN4Qt86y4glMFQyk
	 x3L9YwsYPa9MDYy84k7J056UPaeJpH5R+u8UxagIFxNKxhOGm++78tK9edRxfv8NAzAIL
	 sl+c6I4PvuUOm9M/Ppl/XnMsoiIcg7rA3BdOJi7WdPaN1EZ4Z8p+DmyCJ0JTlN/u3XegY
	 JkQkmLKZfe8AEria/hZy1WfU1VIGrlyQpZwFAp9DEe0d2IZXNyK5Ds9VE2Kl3bEsyfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC2geHqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1291E606A32D
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC2geHqM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570138;
	b=pj32qUfPnkkTSff59QAQk1vOQEA8mPHdtwuEej0zp5WO8U2OeIw2WfT4YR95cBao+Xz7
	 q5abBam3EwRipfwSjw29nLSZ5dQJUYjJaoqWFZrx3F7w5d7wyOnUCLhhtUQZHMs1MWOxI
	 VscexF+UMPgB0571izUvP84bITLGgZyqU0sQUCzeTqtCml/u9+EYsp4Z+AGMymXG8u4lV
	 GYm3V4f8KxmlGH/lHNaxbpNMLfhZuPmppbukjCx7fOXnsnPjyBnvDRJlQrTQPxs972zwc
	 j8WkJmT/ehUoF8FibOq9wdfDmJQBrAM6t+wLra1I2ubYdVso6IctyY0yjQnKlNxhb7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570138;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=;
	b=OeHRs9CRpI76AaxxO0/ow8L1RbTXceLNz13462wTC2x1/GGeC33lkGQ2faYQKw6RH6EV
	 KwN5uDVTWE8n5lve95oaMpCXLPCiQevjTqbg+4XhicmzxB+uBc03An0ASGb/GpYq1zbcY
	 XVA/f2cNl1AfpYuBWkn1WSRyYiLp3hzO7gBiXbe/9hHoUypMNjyMvCtzEsH24hCupbZup
	 tS/c7BjTPocvJ8c+0/5QuIqVEJC41IzalUc3e0K2Js4agMeAzLT4wMoRy31HH9pRLaC2B
	 5HJulPJaSdgZLV2HsCgVRkEyheMvLJx1ua8ZxIoHE+hJO0f9kPTYf/YwankXshr37Kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F7E01F00A02;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570138;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NC2geHqMyMtMfJ9IZIppOhU1RkZK2snRbkk86OQouAceCwobSETkdq1czvSz11VYd
	 eZ7lS2PiMnk8/Rvo3Rl7jWwBNGGdFWxln8NVaRQYSi3ZwtcHfGSL6Ml4PDZUjW0ZdN
	 SAWC9B5vbUGaLpxvUjl6I8CZgB7t0Y/LeSLRPn1W/nJluPkm++hB8b4DHWM7Q0u1QO
	 5LliaS6XhwZGjMcxwg3hyUObhdAuSlilOWrCf6i+854hS+ev5Yya03Y7+R/ccLWtsf
	 f1rtytF9QdwqG7E5W4LGgk3DVd/7aoCoLXc1LpJKfInSiTAB2cHl7aJKltpLkoD/yG
	 W8lU6NjVxLwWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07B9246298;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:21 +0100
Subject: [PATCH v2 3/9] arm64: dts: rockchip: rk3588s-nanopi: add voltage
 iio-hwmon device
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
Message-Id: <20261101-nanopi-m6-improvements-v2-3-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1215;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=i3iFfPZU2WxhmVkZIvHfCb/RWokszUBojNZ0FW7VOk8=;
 b=JAvL53JzX0I1Co7WG0zOaUTjrPTQOUaDG95NzjcESdHDMOwSkxQryZOqgWBmeDx7xOTKh5m5e
 bX6ZfYnqHzZAD8o7okqHFzemxxCmaYRL3PzHRddYkxARSLGIng9PElg
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi 6 series have a resistor divider on the main input supply to
support voltage measurements. Hook this up as a hwmon device so it is
possible to monitor the voltage.

Output from sensors on NanoPi-M6:
vdd_usbc_iio_hwmon-isa-0000
Adapter: ISA adapter
in1:     19.80 V

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 8c77ee71ebf85..a47677926a59b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -95,6 +95,19 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
+
+	vdiv_vdd_usbc: voltage-divider-vdd-usbc {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&saradc 2>;
+		output-ohms = <10000>;
+		full-ohms = <110000>;
+	};
+
+	vdd-usbc-iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&vdiv_vdd_usbc 0>;
+	};
 };
 
 &combphy0_ps {

-- 
2.56.0


