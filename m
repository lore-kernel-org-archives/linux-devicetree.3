Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0663BD638
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=V1Tuq21TNmRgJrxtBIVOSXzEB3a1kLxKowKoJsapZFyllb0aNicd++LiBLmgBmaoV1oxiUXwnHIplGt0mLFFUX9QsyKgWQAHbOwDKXVsZqlatfLyGc2uOiJhDCNrj+Am+cOY0haoSGqE5xqWBHQT7n3USj7f+i1fY/nwkpohtvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=ifBmL7CBYeZ2JMmG9zIKt75hHLF50y1l97KcTZIGHsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCxWOWrMaus20STH+3Kavo2r8bh9EZyTyQzP3jxwcO0BfXFGmUf4LcemmqV3UzdM/3IN6SLoHhOfTKEhU4CooD7+TDdTENMBRFFxR0GReTB2JIuBUYpRHay0sMEMuLJ2+tMU2Nu5r5YwUHfq3/ESiFYS8NEWugtIKdJ3EgHOSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyrsGDn6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyrsGDn6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E4E5C2BCF5;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=ifBmL7CBYeZ2JMmG9zIKt75hHLF50y1l97KcTZIGHsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pyrsGDn6NRAL4LnnUst/quQXkWBiZNV0OggbghAS6TZiM054wVYt42faEPiaAZnMx
	 a7tkYKEnnftsXy0vWw5PjcAa/cx3mXzOhTNlpGe0gLN/O2ouJr09/VhhXAaTJOnbaW
	 IgiXx76Fcp+cOR5zHzU7hpiugPMY5VmFW+eEQGL1o5kY/B4pItkmY8dWo+TAe3bOZ5
	 tRNBtQgaOOPcx31j1QgVEXsXmfrO78S59OfYBgWtO9S7iUAN8GDRktkgDrgyWbjArO
	 GWhZtNd/7CvOuVGksR8RKICI0dxLGXMMXI1fQUwEO5Kc1jNn8gz3Rc9EqS2Uwb3Y7a
	 Dfz0W3wnA//Fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB8EC44500;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:26 +0200
Subject: [PATCH 11/12] arm64: dts: rockchip: rk3588s-nanopi: remove bogus
 vcc5v0_usb regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-11-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1952;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=8PrbzKOpxO3XzEdB28Mc6h9tcQrxFXD2YWBlft/s02o=;
 b=TQYiRbERjzLuR0Y/reR51JF0EF25hL+EKJds2EJr4gCeOMttM/GzdonTY8ZtM/Hu2tVS68oV7
 76Vb0iO9ixiD7NiOP1+kF8vlMJK8gRuPXzVmgT9+fOquIxOLWEt5Aek
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
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi    | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 2f8c580afc2b..ff579f75d8d3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -55,7 +55,7 @@ vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		regulator-name = "vcc5v0_usb_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 596b5a64c191..43b9342bbf14 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -86,16 +86,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
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
 	vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -105,7 +95,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 

-- 
2.55.0


