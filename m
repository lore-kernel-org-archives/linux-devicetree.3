Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63442E8FC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240149; cv=none; b=d1/xoCFRHmTPVJVQyf+KVwHn7tli+N/zv8wgH9DrbcAUCUGKl7xQk7rSA2QSbC30XreQUdE4vGY8+bPOOJise/rwExaUhfVSKx4rHe+UYrKJo/bHa1mpewvf3AlClHRCVpgo/RrfxXA2YBaSw46NKNK/U1KiisgG5GXcU2UjuEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240149; c=relaxed/simple;
	bh=TV1Nlu/Lb5aFsrXrysuPrkDA+HDo36n/f0fYgi+xaYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnilAS8Dv3fhCTADrFguVtPm/Q/pv9l341gbjQPw62LmgF8nLuiFGWeB/W6zHqSDMxeFw23CPlS46LUYtKlNrYVVhtTSzzOPvruEkJCuxr9z+/4f3OyR2zYOOZUTwtZwKBFiD/Mj4Gjb29aQ5mlIJVnX4pl+V+lZN9X5DQFE/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNf6+Muh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNf6+Muh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5C95C2BD01;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=TV1Nlu/Lb5aFsrXrysuPrkDA+HDo36n/f0fYgi+xaYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TNf6+MuhWCyhAielBoZvYYM3L9poP2J91Q3Nw75TO0eo3ByEk61d/KzdtjUZkwl3u
	 V11binN/byxlHXfh6bg0PX2SIHY1ETh7dqrcd4fH+kJoD3OkCEmg8czr4WN5vw9AJJ
	 bUecf4zS7NOXLnTalM5QM84VZOvR0Hp/7X2bMfj0GB2NGxHHdLjWhVGcKdE/rVeVKI
	 8QrkNfLUmehKMVEyywYJJQ1URmZ8kvn72pRxq4t+Moo4DAve1zD64Q1kNazluQt/dc
	 UGjaJaQ+nVzePuGrbtH+awzpRE7xl1d/WFFYh53C1njjMxOd7DhdTP+OGOzehmPZ3b
	 76AAjMDJY4Hgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C3AC54F52;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:32 +0200
Subject: [PATCH v5 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-5-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=850;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=zZZsCZdGw1nc36iqIT9VghSAmTcEW35W4wGMmfXzvks=;
 b=vC9GB50lW3GLUQe6RnH+e+F1kasBYkbIp6qpO2uMVXOUFfFldlOb4UZr9D+MupHvpcDUyMn+L
 Q3NzUB8UgdSA1NqSQi84yhejWCoxNLOwGYShmfrJfUXp5juhxbcd4x/
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The clkreq is present on the board, so hook it up in DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index f2b15e03d5ef..b120dd98241f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -369,7 +369,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0


