Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68542F700
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=Eawtbir6VERMX1M+3IZrHYl9WXxPt1B5naL/b12OFADlRMEcnhfefFA5fdpgUehbzp85hAKM9ksX5FbLgzQztxv7RlmVAcRMG3vw6Q8O6LxYUuaDk2FB679uM2J9QVt3Gy109HtVcUvUhybKQCcRu7NOGV8+piMWyutev4UnU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=fhzYdWjUhIfYBbHLD/ytOg92HFn/RMJtf4eZNN9JChU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEMZ1A22RRluxLXAamUGV5z+7YvFqfPzw3IkYSw1mR+ErGZFjGLzk4yrRBPHiEZh5KWmjqAVbyacnvkI/vDsgrX4FS+P6DbZ7CuQLnjjgNVFqAnMvnkoHStV9Ilhb0ffUUDZ9BP2f2H4Ofsbx7FYc+J+yqE59XgCGuALQfW447c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpBzagu6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpBzagu6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C61C2BCFB;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240149;
	bh=fhzYdWjUhIfYBbHLD/ytOg92HFn/RMJtf4eZNN9JChU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BpBzagu6M3I6VFf38kTIrgtWsRhfM/gFVvHFIZHpmMI5alEF1Djsbx1g+Wt1Nloht
	 RDiLaSoRyC6biMRqDMERV+kOga3zfidSe5Rx0rIFqtq4RNqdEA7M5aB5hYu/n/BcoD
	 2jDAdDipeMJhq6KKKa7eJ4IhibwFJ+HZi24v0RyqU1/c6C6j0Fy2z8awG/cy5qIwT+
	 hJz8ZXTHlCFOzJMfJiO7XG8rKrZdC6w/Aw8/tHirDSi+VkFs64T7xQZgOf4yEoNzIn
	 e3JsoRSPTA5awGnjMCOc7T6ELOc1mrv2chEd6o+QHwJ2bh0VcDlUgy5Z5X7FquyA3/
	 J9swc1/3jLjTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8108C53219;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:36 +0200
Subject: [PATCH v5 09/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 bogus vcc5v0_usb regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-9-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1672;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=UrZzPlopCnQpNaQi4ZiWK7IzfEGC03e+DmeotQv9vOE=;
 b=sxjyU4hawUkO6mc4VPr7YSyPFpOYyWguab8zMh0FfY0eMMSaAgQV8/nNWwsTGOuLAeLBmlAOG
 +yZF+W2cMZmCp62ygaCyXp7LvqnYR4EDSbWVdliUwLpKSEJeUi6gofH
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

All USB regulators (power switches) are feed from the main vcc5v0
supply. There is no regulator or switch in between.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 206cc88fdaa1..5a42e7dadc92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -131,16 +131,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
-	vcc5v0_usb: regulator-vcc5v0-usb {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_usb";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
 	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -150,7 +140,7 @@ vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		regulator-name = "vcc5v0_usb_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	vcc5v0_host_20: regulator-vcc5v0-host-20 {
@@ -162,7 +152,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 

-- 
2.55.0


