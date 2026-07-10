Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F03D6CBA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=V9H0Pge0SQnYG+L2Iy2uskvYrN/0zZqKAdwFG4MFV7EtFSnh3TpraMbhS4oq9KSkEU5vnt+TmRbWs+2j0Nv5NXHKICYhnaRsWzwhEpxU/C+dX5i7UIpC/gnCuAJqLNm9kT412LzuBmcb/Z6gfwG/rRyWuJbBBI3Bj9/t0eWXD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbAs/1cvmqi1fM8jMNQp+VvUz0Bnpvj0lsf3vqnCdVlmYsYKlCkM/7UC2p8dYxQsLGHfp5PI9ufnzFrWjYolYj/o7uDZ34jaZlfnIC37EpmnamEjDcUZrCcu6zEEl86ry3mEssfR33iiPdCyoLfSMfCPCtb+chextHjCX756loM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTU3kkjQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTU3kkjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6FDDC2BD04;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HTU3kkjQ/jJQxMRHNaTSj3vUhvakobrddpK8UXdKaX4MxLJtH2NoknnNPywMbfAuO
	 UIK0asci8vStypsxoY/HP6rtytFjRYJMIiRHxub0O53j0SKGGMU26u1hqF74mXimd3
	 mfgkzfCIdP+5Y+/BDwyIBzjnsEsVe9RgLZUYRBoLJ44/7HfHt90KaGYPqCQH/QIBVR
	 gRAgvwm8/uDuhW9lkvTMK6MFoDsVJgnzoDYt3WfAMUUxd8ygOjAHLwcU2vluO2g1uj
	 /cv8/HhDIj04/C+LRykBe9lf6w+GlQU2KVaRBruJCn6om131kAOVQXqB866cmgM0qn
	 EeMZjbw6/6QOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AD0C43458;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:59 +0200
Subject: [PATCH v2 10/12] arm64: dts: rockchip: rk3588s-nanopi: add gmac1
 add phy-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-10-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=729;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=gBMET+DbG+jwN0qr/elYvKg3AjYOtdT2r4WKrOud/RA=;
 b=IuKyPvfhXNslByk1jK5xmmwoen/bUYZpX3zi1ek05uKjgV+9AeayQ462IUG1PaOfupCsRmf7+
 12UMJfRza2LDBtLf4kELVxtv3pQwObU+Pi2NGoereneAD5ykbAf0Isd
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The RTL8211F Ethernet phy is power from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index e4900af9822a..596b5a64c191 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -153,6 +153,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0


