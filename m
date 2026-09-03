Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1784E2370
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=kb6mq+UNRtkzND3Kq51tTxo1G16q/MCrxCwDrlW0k+enkW+gOJt+cUgrY1SW66v5K+WQzqAVmjVrvF/ts2E5GW8fPZkO2qSb8dEUKVHOG98v5BiqAdW/o98vqHZBaCC3OR9lSuTvQ+6OGdcOO+5ZrGpVrmk2ixKg0gYO4DQbZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=TV1Nlu/Lb5aFsrXrysuPrkDA+HDo36n/f0fYgi+xaYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuRmsc4zqzzLWlLu9UlIeQZSTmM2oUH/PQR7t/uNn5TpVRW4WyAtkqX//Ho6qSJfAmsvhYrEl3ZZ8r321ZlQS0WXeMgoFznnMRCBhzPUOv9WXrS7LfneVs/PtjKS4jtPQASIG7pJKI5xnEfP/VzgKYgEeqApayJ2MbqOGtzE4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjSjEtnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjSjEtnP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 638A8C32782;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=TV1Nlu/Lb5aFsrXrysuPrkDA+HDo36n/f0fYgi+xaYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tjSjEtnPW2V0qt58oNLO8K8RtlD8T+iuO3KIvnhL9tiYkuwz2/rpilXwTmLhSh8OW
	 AOWcuKnFT+EjC/afCtRqtgBleLLGHrvuliU8nLJnbaBEr40QrbXuebFvGJt/dQzxwF
	 fD/BzErxtpncsqE6SyhqRMxzGCvxcxPNgJkxt4Q+lY191qMr5zwVFzMQnaAxp+FrZw
	 iZrxVCruS32hjX23SLt7WZ/eXtx1vyaCrZkgOOfVBdpAYAljP+8Eoax+C3KP3xTXu6
	 WnCFkSEezCA5b29JzR8zQCv6DDxLZwqp97jrMRbQ6vJ9neM938qW2r2hsaIL4sgjEl
	 anQ179mABjWQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52661C79F82;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:17 +0200
Subject: [PATCH v6 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-5-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=850;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=zZZsCZdGw1nc36iqIT9VghSAmTcEW35W4wGMmfXzvks=;
 b=+Pgvt1M3/eFQOQ0W4BVgJQFU7UzERa5QjsQbnUH6IMH24JzyPaVzFCKAg8FbagY34JnHHXgbh
 wsXGPqJ9efkDVdjVzy4jmfn6l05lxgiqsZB3JChibspIAh5aB6AZplu
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


