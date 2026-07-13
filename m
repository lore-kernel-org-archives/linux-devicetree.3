Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FF35CB66
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=sDZ3GVeMnPzjHG/cQID91jwNtDUCacfzaoTyYAvpJHdRRAJ0VyCJQClRHAer9No0wT/OjQ4j1i1DKvuUqqOv80uhN6IKxESTMVdzy0ue67PibDACEASmKjCmYbIRxFytCnnZHga5dsFl7ps05ccABXqYl9SO/ZWNlioeeC4QDqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=lWT6ZOKFSBxMZY+C1cA8cB+pfPveOTBD8hYlvgAXpQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MifrsdOzzN6pE09gVPzDK/SDYqe0j6LXZKxkplu63pY8xZ0yh5wchTsFYikrNp+JMpwnDBkfqO89DO9qUg7mTNEnrfsC6+6OuhASefqi/qES2V5OnXOUe5RuK8V8hUCsWuLxGU7N3K1PloWZUmZjrLUjkPGxB41089YAydCJgvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjgM5ykb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjgM5ykb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 029FFC2BD01;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=lWT6ZOKFSBxMZY+C1cA8cB+pfPveOTBD8hYlvgAXpQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LjgM5ykbfbeNvzESb25/QDUawvMPg2c5K4UmK7xMmCL9yrfZDXq6RlqtTngrMtVhX
	 DrZybxHddZPtFJxNZZnV9Jz6hWzR882GdbbjpZHqYJEGhfzdf1RxJO1OgG/v1r+DHG
	 1KfX91u3qRMTDitD25vBwS/bfi/L8JmhUBr75DI2oII1DzadfV4J7Vw/OiddMNRpnT
	 VMzjcROKAEm5a6YYUQ37yXPvJpRACOcuhzzyXy1SzuVVHI3f1jiqa5QsdY2thbwW3f
	 08fIOTUG8SXcZS+HLvT3DjOyiw/z/2jdH9Ua/1Uh3lm0PqkphXgGzWH21HYlFCvbRp
	 xq8qyO0FOf9tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56A6C43458;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:09 +0200
Subject: [PATCH v3 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-5-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=832;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=PPqMMY83DuW2Qji9H467mrufS++bY9pA2rG/1NHpMiI=;
 b=gmAQJ6ic7DugzV2mS4Pj8u3kE79/y9JuUiaRQbwsjRL6QaE1jTxGZF4YMQ7rGL5rkvZQJEQkh
 I4reK9ENPEbAJnOkRySO06ELWUBOTAdUbDiBVDPMWp2KH9Sk/k0aBkt
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
index 3f04b988ec29..28966c292f5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -369,7 +369,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0


