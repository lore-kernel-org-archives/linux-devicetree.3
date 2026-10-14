Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328055D86E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995686; cv=none; b=AB/eZ51GRzohdxGrS00rp8PWFCJT2G9Qu88OOTnCOqDp3EX6qNwFHCBgALijMUdTADNj8C1Gk5strV8voFIqkXtkX6iJavXeEaEj1ctR11WUF9GFvIbnki2buKy6xQgG8KuZ4C1NzIXJXCvDT0QNetM2mFeAq38f8W/kkh5Kuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995686; c=relaxed/simple;
	bh=d0+KUaLwT/Dk7ZkgV4daJOv/D8kFOZkamvSLINiAhJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ky14cAjcVzFZylPEjlrrYRbWKDifWPbxuKu5qRtYtn8LKHxerqhTjcONNfJgn1TEQscPsV/fLFzCb2787Wsq/RHmT2mbqKXRDDIjYE0XkES/xh0nmLGqs2amoRjvDvIJEE9/kEiYYjrije0y5bzY0KwA9+JfDM/fkZL5HT1Lo2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFbX5nNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFbX5nNM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0A20C2BCFA;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=d0+KUaLwT/Dk7ZkgV4daJOv/D8kFOZkamvSLINiAhJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qFbX5nNMzLa1yn7qKbd3umcPSKrzUO8eY9bX+KmC4dUs/3RenZVKTRln+/PDYP8UF
	 9o2IUbTmZG0wJW+eZ4Mvda5UwJl4HLpzt+09gEmw+JP2QfEHltyc6hutDexSp/11Ot
	 kkJ6c91r6sEspyYl4nCEadwMAEyQfh3X08JLgTk3FAThGpeUVokzpM09lezUDBSgvY
	 wRV8tlpwy++YJRprRxJRmugyq8A/6z5SflkY34Q5qM0CX4dDvMqe6TVD/2zkblsrJn
	 1axwyDkOSe0hmsm5XPKkH+oIXACGm4A+jkUtZIapd1+VLPBIbR6WS30ltv4MrOmMg3
	 GRb38xuZOZpcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7745FCC6B1A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:03 +0200
Subject: [PATCH 3/9] arm64: dts: rockchip: rk3588s-nanopi: add voltage
 iio-hwmon device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-3-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1213;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=0FgBsPDSF/Ke2BFVA9LlVUDw3XaAvZxxd2wbi+fKjz4=;
 b=ELmy2+RH7U4BXzexGX41iowrehf66vJrLCX+8TFFN8FUsuvHdzFQ5iUh2XfXqy9/nTdXHPxM/
 LYIUg6huebvDi25rjXyKjfGXgb5qvb2In9NXxJPixfwbJSxZi+jPzaL
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

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
index 8c77ee71ebf8..a47677926a59 100644
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


