Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73C38AC85
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272996; cv=none; b=On5TD2P723SSdP6KRhyxd4YjBdPKeHEoJJSi0sYUHJ+YOZ2sjr3F1+KquNHOD0nHYooJfrDcC4U4PdbYB1rgQM6jVfjWc02nXFOH3O7rFpKzX+SuFimpQpFKBmFmJ/H2R5IbblFg9G8eBbAhepR8sEeKSC5mSoiYGtVYvjD0NYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272996; c=relaxed/simple;
	bh=zI3rdMjLWCTdKi8/ioYtbDIgmTNiUlNYUHdVN5NBz2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rb3mZya8WLZAznwWfAeDj0TjPN6A/zgpSq1hL24FheeFIgZ50QFu0U8NKCis4SWvcobrHXN0Vv9sRos5LwP+DHzh4AfDh24iVtXCPkltoixf4+KHwgbJJ9UNpP2q2naRGXk/V8CzIFCJMCLv7sXryGXKpn43TTgSdJvLXplNA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6nnLiWG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6nnLiWG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31E64C2BCC9;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=zI3rdMjLWCTdKi8/ioYtbDIgmTNiUlNYUHdVN5NBz2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6nnLiWGF6C8UtTqbuKZO74hCzxS0sfyinS9cEigBi05ceAGwQNj0X+qrwud6XS1d
	 uj7MitGEpCc6pvAymkPBU5Tt+7RVdQuI/4sCDlXVR4itTQFDw/7eRITpX0/VD0TNCS
	 vUMe3xCTCGUqBh4DGBXZDkV9VlnquobOrXSqM7O9MndZigiAL6KA8SwWl28uVcWxdn
	 dOxVNNgTA3W6lVAstNn62PJke5zH+I2kRU8DKpIBPkpVIP4Fskyz1LZGPXrCPSBJjK
	 FqHpitFIP7vM8sNYcgZxKmTrNJAx2hkCP28hz4vP8DIyRgq5HWkzeBKRLNGVRWFP3C
	 ar7+nEPswfR7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F08BC44515;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:04 +0200
Subject: [PATCH v4 06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 always-on and boot-on from vdd_npu_s0 reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-6-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=843;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=p+uCogUDoVo0apoPrgGgP0RnBwb66wwn848JS3ACySM=;
 b=hF7stw5Cl0MOykn0AZj8/vK5shluXyM6gfjjhvayX4soPfoaQGvUJKqz29lW8yzD4d6zeIfx3
 jSvPmH5ns6fDm9hiMOlFwL2VVEmHaHgcROGo5jlapyDj/GFQi0UX34X
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
index b115852ca13b..c12c05247d80 100644
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


