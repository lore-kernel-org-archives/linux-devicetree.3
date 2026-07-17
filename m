Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22A3BB119
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272996; cv=none; b=C06dpcDeOxrPxnllDK1QSaV+Jum/22m2KUw69KkesORMakmg6621ylk97T00irgaWJAn/dZV1s67xpkohPnnLUDMr1tHIoXXGSmMQ1d9pQmCVI5AkgsQeW3qNpgiz8vMP8eDcaI/OeDcstWiNKvqowT9XpuVn/4JalXEwfHOG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272996; c=relaxed/simple;
	bh=HgQcs89lvtTaOzFYyfub5T0h+85ljYHNvHGxWWPu98g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGrr7iLAC+0d+1lbbClza7GwBiJHLrgtKyDupLTQft7TjcSba2a8OacxUmJyvWZ8g3wCaBoET/Zwq1v5UrAW29fWdzQnNIp15Kpw1WaZNpoH7YL8Cg3qkxM8L2h7QYi/kZnr5YTeR+UY/NUUHJESApVlZeRg6BMLMnLesvCtreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byawlFgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byawlFgT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F37BFC2BCF7;
	Fri, 17 Jul 2026 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=HgQcs89lvtTaOzFYyfub5T0h+85ljYHNvHGxWWPu98g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=byawlFgTV7/eVtC+jL4eUWtJq67Vnx2pzKAiy4HszOKIBSkspzR+i61rYW/JlPo0e
	 8TfpCrFEIkYdPF3ml6ADfCFNAi8i+QlqeZRwTMSLAVsFMUL/RAz46ySlSahtW7z+C1
	 F7wXqsmVZXkxMOQ7tyYSFK/xvjLyhrYc73phrpCeeQzc5gWoKbyO9/6VqKMUtjBYZc
	 wHhR8HpeqWk6EFA+A3m7RZIXJdVlmxZWw4842d6rS+FnCNOUFAPaYjLRBW5NPX34gk
	 KBbB5llemu9gIvCE86nOsKfFcqQHfTT8ggJ0tICHPCY/ifeF0z/qd4DaojtAuSd//G
	 BUrLxc2UhfgsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D796BC44517;
	Fri, 17 Jul 2026 07:23:15 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:00 +0200
Subject: [PATCH v4 02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing sdmmc cd pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-2-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=1143;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=jHdQb+otpVtf3Zy9VFk36AJnKjgFthAh3MuUfqpCMnk=;
 b=D/tpYseff3u+Nrgxarw1YNOXw3Bn+4o3ApJWcqivL/F5ivZB3i/0lmWiMVaFILwZ9i2ypwBHT
 PB8aNd6D2ZIDQyC441Arw5qBGXPOmHQc6HX/j6U3ZOBRiD5ixhlecK6
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Fixes: 95147bb42bc1 ("arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 91b6eefd7abf..67e284a15c35 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -421,6 +421,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -496,6 +500,8 @@ &sdmmc {
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


