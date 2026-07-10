Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D218A3D0923
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721532; cv=none; b=D/sEbimGfsfgRu/oJnr8kKjMEYyKWn1NW31MO6vuhZExwq0hQtqnBiktpTg69d+tbyFucdCcdEpTpowPdyC4GNRwgmAnQxtJbpdKx8a5karrt7c266i2itQ9qQwYLiBMouq+XjSiggKjJnKoRWpR6LEIa07n1Hwv4OrtY57WFes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721532; c=relaxed/simple;
	bh=ott/e/PsVQ7ftOVMoDZvH/I1/494RVUTk6InVE/vBKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gzf7thLFGpS+NDzUPTky9YqdZMzmHa3jFK/uQhy5r9m13h8mrcL09jLJoGq5PQcpToQH3vmueEzbI4jQ5kFXT0AaU+fXtM8g5GSBo/MTPKDfI/1mXq+z87D2cuFmUcaadp3MMsxuR2F5HZqrRg8yvc1JBCIjNVKTJKlOMsG/uq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEQXZLWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEQXZLWq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A54ECC2BCFB;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=ott/e/PsVQ7ftOVMoDZvH/I1/494RVUTk6InVE/vBKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sEQXZLWqLW5vYRDAWn84S/o7AoYejDbMbC24tsv0i1RNnUkwzGTW/myv8o1xklpCC
	 kdvXNr1HYGFOufYRKMi5q1DmoFFwpqSFcoBQ0nU70LjNCiVQxLO809uI4qN/SzSKak
	 TTnH3Mqw5/RiDJpywkKthfZ1xN/90wRKm2lUk5NXJCMyTVweaqXUAOEgH6JZsOVkdc
	 Abfu/T4HspmETMW2vQ1SNCZsL9C0jopOtsk+nbW8hpUA3sS5BuRjIYg8O3+OGA/nOQ
	 uLMF7HUKGM1CzI5ALNWsjuJe5/RC1lT9eNKa0IAhtGtskohytZn6WDkbqi+1e1/3Vj
	 ajEE0BLr3k8CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B263C44509;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:53 +0200
Subject: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 sdmmc cd pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=1037;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=RwYpiB/RtND/z6LPjHWK2wsSxC8Q0Qs9K3NgIPhkNgo=;
 b=vf/Y8zLgiYl3go5kstqi32Zq0hQTDbxjmUtlU+j5TfU7hIRJiITMKwB+iApmAdzaIupgsCO4q
 0UsbMNg3MpJCwLxbnmNqfgtkb05cAOLwUHCNpaDuzOTx8wlWL0waNOE
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index d41c49716fa2..a8f32b994b10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -336,6 +336,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -407,6 +411,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0


