Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C14F0545
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=aRppyKFtZrLKIC2DxAXKo5NjeKM8ZNxYadgEb6dBY77HdKfzEjtfGXh2/RDJnskpl5RG2Y1EX9Whk4eIYubeaBbdX97e4xDvWxlitgxu2Xq2f3OBKfRcGCKollpCXf8//F02fgwwsF6i+axvWagNI+f7e+VgGLktXwAoNWpPOa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=Y7h7sGTVhsEzlVMI5TQ4L554qW/IQlnc5Zu2vSWKmDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qB+GUJgGik6c0e9TwsVjJoI2MrcbLXTHjmmDCvFYMBOqY4akYQcxJQ382UKy0o30jY0d01Qge40+ZWl6fYX3FvQHFZ9MfTbg71YHobM3XLkNK4dcIJWl2T+zGETzV3iI5wMXcD9yzkINcZAQjgNii49y7HbNcv2+1NECEY4tWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs13Fnur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs13Fnur"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D5FC4AF09;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=Y7h7sGTVhsEzlVMI5TQ4L554qW/IQlnc5Zu2vSWKmDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gs13FnurnXBRKDDqhGAP0Sm+IlBdGBtYW58FlAEG5yTAHTGPJFv/EX5N2lQ8xg9ap
	 Ap4/NiM7Yf5gy5fiow4DBQAGZhG/p8MfKdzSIN5wDXaBZhwhQCcp8y+oBjc4FhJiak
	 hi4hu2BUuh1ywVvhdISVI2Kpg/nyxePgaf7QX5Gli61H0JHGTNUSHhNL8NkZ7BqUFf
	 OwxQ0mgFbiqdxeDOPpKvxBWuiOs4q7DwRD+tsDmexJ00sB2Q49qS6su89L+WVP8Nbj
	 LhQGOcCcf5rNXxWqXHtW2JPO+Chdi8xu8niqqWt+XgbthToRMiimxS42MP6Ct9z2Rm
	 5uE+Lw5FHlcBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62297C79F81;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:18 +0200
Subject: [PATCH v6 06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 always-on and boot-on from vdd_npu_s0 reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-6-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=843;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZXBLHN8naxHdNPducDxsTIU25a1ogqqtD70keJ0VhC4=;
 b=+SsiAjNvAmFyP3bHHhuw/mi1Tm14+BQdE8S5IHBTLrslXnvnTkP9gUW2/J2kw8v9FIupyJgfO
 wAHGjxd3y5FC6dKQNFetpHZJVKNPaLXqttnbTA4DNtzFnq1RxXsUR5h
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Since the NPU is hooked up in DT, the always-on and boot-on properties
on the regulator isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b120dd98241f..8953dcebb93e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -314,8 +314,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
-		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0


