Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980F560AAA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995687; cv=none; b=pD1uno3Q+c/Z8w8edtXa93csJwtLtGYQ1zGSy3XoT+7wkIH/sww09tpsWDea1gBW3rxtkLI4/V5u3y24jEHtUxeILs5V/hTIdeYFWlnZD8oUUG+/8UNTfcG6DlO7slMbemI1oSP35GLhMJxFL72jPME7PvRtogKYDFxBfU2krQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995687; c=relaxed/simple;
	bh=NlD/T1r5N3q6haBkpqusdEWF9LUkI0TJP/q2IERXYOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/XuEAYlLHGIBmz7npQxiUyZme30Km+OIMUrsp9ZrYsWf0sf2rCdmVmObmz3Z+dHXarNKc9Vs4rezj2xEQ/3EuhcbRLE6/y8WVAogVvOW/wrsa5R9ucFlscJZo35GkzN+cduiHhCI+OJAEoe5F/42a3UV9InVFfgoXGFw8Xxze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt1LlG1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt1LlG1K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B63F1C32786;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=NlD/T1r5N3q6haBkpqusdEWF9LUkI0TJP/q2IERXYOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vt1LlG1KjCpwrB0tA3wTFqg/mwn/Qo0gK7VK5QPy/xos5cADYrh4z7GIciTOHfw/z
	 rkMm4PJslhsYH0kNUMS7wiSx3qXRa7oA3TlV1LKSjA+dwdmC6KUUjGraTeKcQFJiPC
	 2XIdYKHV4IdNjKgMdHXiD4FxZNdNIkZD899uYeVa45UHiiFDBnz9IdGtsHS9Y9ty1I
	 59+ceUUTYuUrQcd086GDa6oGjSBzOfvrWDUgZ3CL10tvxt+zWWtXjDFfoLHAbExHoq
	 uV5mFNBUPg2UnafoaLejyNnihIlWulu31HK863rAXNLz+IWcj62zLhH5kIp8FBdpcu
	 PimJAnh0hutbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4247CC6B2C;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:05 +0200
Subject: [PATCH 5/9] arm64: dts: rockchip: rk3588s-nanopi: rename sd power
 pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1134;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=mv3bdQaRX66XNib8g8ADisdP4Xg5uB2QK9LE7Hrnk3Y=;
 b=dh+EhMzhSLc+l50nV2Z/J8JwVtOClQTg5p+gD3DlpaezqpEWUzDK+dwj9stzXDbymGSTA8W9H
 WSAp2eV21mtAMMzCufu8N1f5kKl0FQ/3WZIkv70Ayc051YXIxZvXspp
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

sdmmc_pwren matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index a99e2e60c5f7..1d37862edb5b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -66,7 +66,7 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd_s0_pwr>;
+		pinctrl-0 = <&sdmmc_pwren>;
 		regulator-name = "vcc_3v3_sd_s0";
 		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
@@ -334,7 +334,7 @@ sdmmc_det_pin: sdmmc-det-pin {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
-		sd_s0_pwr: sd-s0-pwr {
+		sdmmc_pwren: sdmmc-pwren {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};

-- 
2.56.0


