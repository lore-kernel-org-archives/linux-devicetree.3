Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657E35CB6A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=Y78jeUZ3C4AZVE8XUgMN6L4ZZDHPBJ3P1AF/nrASjLzisDsx/c+rtivAarJM8CjhkKX89dD6qYkuDcOLRs67t57v9s6EiTHOeYTKahKnrNqDUskrgRHDxss4vi5jkDKVYfpzKr64a4tYJPGOR1EzMQOAiHoigH9ol9Kfq8gG80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=oKnPZ+7vaTSTZNeUUfO4lXpORN/V+p4Xs9B36572MVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ie+0dBO7Aj4ZI6ugTTfbTkmM9M10rb4Rd1+mcUED4lkUf2mIjIEOJFvT+SmZVhB3cBgiVia5aiC20++KEwRI7enyqCGz8q+7Ge7zTnntpvMFszTFnUb1jt271iWtaveHYzn0d+6ygyZRJ3OCzq0sGb6h3MGx3oYQs/oW1CsUNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp95JtOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp95JtOC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 142E6C2BCFC;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=oKnPZ+7vaTSTZNeUUfO4lXpORN/V+p4Xs9B36572MVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vp95JtOCUHPbjuyQiJC8taYtNhIBwLkxQNdjmFFKGfeBeq/pzFOsRJtg+JLJglOe3
	 WP4zPkfbGxSZQ/SadZi5EI1QD+d+0aQRujWLfT2oDmdZPTi7XrWB6/mLAWF+tSCWac
	 RE+ipYuUngSdtIiH/Dpvu/ICnIT9Lcm5FM+gzrIF/KTC8xU/qAJDmBHaL/t5xGkHTR
	 dksBuG4fCIOGy368/xsv2mZAm9CSIx0RQ6mAP0OOmQ1pjQDzvWMoLNN6MLrWZLu0OU
	 zV/i+m6J1hqbv6JJyk10agVSOUxmRH8Aowpmxy7F3KzTv4oTOJtLIvNx24PsBHkNsc
	 iPf1nQxUdXlvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007CEC44508;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:10 +0200
Subject: [PATCH v3 06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 always-on and boot-on from vdd_npu_s0 reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-6-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=843;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=SxS4/Pn4ii4DivXfFENkaVYvrpZF49qmqaenYROR6FE=;
 b=FuB1J8q3/BIELQJed/tFQEAqNgdzA8ao/8zkkXg+brqLRfxq4q7AP/6OsMByZMEZcQb83DsW2
 i6qMnAE+saqBas9sKNGpAcpQKe23DZ0S6g2jIZu3TOeiTzKMpC42N4L
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
index 28966c292f5d..8f8a1619787a 100644
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


