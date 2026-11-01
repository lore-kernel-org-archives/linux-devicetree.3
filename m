Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570141;
	b=E3snY4SDpN9Yr+RD9DAeqhMq5oqLpnjJ2j8e2ylJGLbOVSnHTVBe0uMCyBKWmBhEF/9B
	 7datalFKqvTpRwYmjEQYcmTxqzfVBeZ3EWiiF7VdzmtKCEjaOf1ZpjbGUanP7XtGMZuM2
	 DkZagv9ushZiHm+DlZzDsGMsUl82WRYLTpVpnI/S8P5FVhGr+StZtWkd7VkWULYaXaB4R
	 8ro/UzZje/eM7NBDjACqqR8WYFu4gjmOCsNTUAg0gLA0p9Ji1f9m5LFYnZQrJ0X0tzkCu
	 Zzb8IKtu0QiMpbaSChOmAuL3tHDvoLMDvnPjzZAixQGBp80OapvE8pnpCaCs/ZILT5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570141;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=;
	b=ZCaZa1xUVmR6kq6Zmw4zOrEpKR4HdWP+/XKXhvmzNtr1pQuiJcV56iT0JK8pKH3dcYCb
	 rn1O1MH68ds5s1T67Bop3pIfGuHeIvY2YSKmpc6FNcnZV7lCArsQO3+x5mPbzGKkR6LjG
	 LR828dbl0HQBuBLidMRxo82h2Hw8n2jX/wRJOlFpbVLcwv5IjPMSAoPo4voRw/nA+ALZF
	 3YxeIayqkqqyFxUcgj8KFAXEtfTW1Yo01NkdKYM6JbY4iny73f3ksn7putne5GFsxHqvx
	 BfMdbWHtxfYiiGawbA8QfTE1A+qH4h8/vr/++VgrLPISy9XJ80FioUSI5fper0U+lOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0iaEfEP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642360A2600
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0iaEfEP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570140;
	b=dkgpCnTNyYuExxSxRQoO/iCOhRplMg46HvHUAqcpy1ueOuL94tVzeHFs2zXzCCG7Jsdh
	 nHtTXEOuZbx13J2WaIzR4tjQMPIxZDnRhkScZy7ty8Lj0jQCg8QY74QPzR4ptLwJhSEBT
	 99jJmOhQtiFgOjmVcVYdPnDm3xVRaSD+uFgkW3q6ezHx1iw0ppusVpSwHOpCQTTXLEcxI
	 9UhGQo9COUek0J6YITq32kbSk5aGvNciOhKXhMn73IMjREvrF02EzMQpRYjAlCZ+6EoCI
	 0iHMPYMDkdCU3rXyN0MUO9cIsi6XvYI/BP/hXoZ43ZMOwCCqq4yioEPfqQdOD9I23Jg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=;
	b=ZYQcfKM4bMq1fYxBNrqLZT/p6C/Eeo3zwpxb/Uv6G4E/5zoR/BFNlFhu3kpD1GtbWtLd
	 Q/RY4PmLjCpWq1f4VOe3zp79tIMwjZtj+xBVwk6Qgekejl6xl81GNtoXxvCthNCL5Lyc/
	 R43cRnTvdb/yv91MBwmMR3W/ydMA9IslPyBriNNJxXeEqNB0K0SSMP8YhOD7GQiYAe37m
	 34Oc7F51siZ7iws53ew+0kdzcoh2JyLVTNc8xZM02KdyoNqUxFXU5Iab9s/I2WZ2YlxHF
	 ZuuDpoyfqiVCYkpNEIsKUTSGUP8raY6zIFRLbylJNqbGytstL5LizP1m2YfsIsef9DQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 418071F00A20;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570140;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y0iaEfEP/uNseSmQxjpGWekAdqg5TWBXdJre0InJLWilkadHerlhJtlKt0AJ8q8+M
	 i+vkwLoy9N3QiaTzgv6tBq8XzOpAtLnME5+09d48ZhTbBMkKb74kv/7oMPUPbS7075
	 FoAReozy/DY0pYRdmTlFX2CR8+B0ImAlK7K8YqLlpcwuSPJy8FcR8t5dFCMWyiwSlf
	 aJgD8/i+qNj4jBTzo68jgOTjqDOJ9i+SZRXZem4VkCni7lv9vl7cdbDeeBw/z5vSqU
	 wclkgYXF2TUZUsAtDz9/NCSv7Q7+saubYNdOOygFfrpTNx2BdBHK0ySk3JxjkLPBvo
	 NQW1FCZrTtuSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4A28E462AC;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:26 +0100
Subject: [PATCH v2 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename
 pcie2 power pin
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
Message-Id: <20261101-nanopi-m6-improvements-v2-8-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1202;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=dFYNtM0NWa3tMPUuffDQ8B0o2G7+xC1fDr3vwPQxapw=;
 b=E25IOOPAfliZNBP+twp79Omgb8O1zXtjfZY/f7bFxC0j2cnfE45XS6q06E+lCpeRLAxe7sR0/
 54vvDf21ldLDid/tjmcxF4yeXkhoirF84gm8zgutqdgbiRtvFMkVgvU
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

pcie20x1_2_con_pwren matches the signal name in the schematics, which
simplifies cross-referencing.

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index 6205a542cd1ab..ca115d8e108a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie2_2_pwren>;
+		pinctrl-0 = <&pcie20x1_2_con_pwren>;
 		regulator-name = "vcc_3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -116,7 +116,7 @@ hp_det: hp-det {
 	};
 
 	pcie {
-		pcie2_2_pwren: pcie2-2-pwren {
+		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
 			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0


