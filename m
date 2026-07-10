Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8973D45E6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721533; cv=none; b=gVoe3yYR5exixjTz+7gwmQpmmFcs70UC5GFYeX5aQwgamJ6u5DVVmM88t0pVW+wgMGFYkQPJPzInrZYHJWQ/Lgi5/8vfhspF25T06IXAXylW0yz6KQPyFFmSfGkmq0k/Rx3/0tOm68ORmjdKYWH7x+OeAHe/4Oh/lM4BFdoaAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721533; c=relaxed/simple;
	bh=nJFIVRllr6lBbEH5QrCyHfVsOTw/A4aUo1durTpSg3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEavDdk6LIEHKeZj2x4FotPHTUFLk51u7wMBfY1Xy0OQ27ra+twXZ+RN5CNzfFp7IJsoBk6VprzMDDpjvDG2ZwQBHuGdkWvrefRpg1pJraqY5iQSt6JxMYIPHeiX1MiN1ifXAW/XnNWEHCM1LJd97U7WxbdekpljqzFY3nicsUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIahr7B8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIahr7B8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1039C2BCFD;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=nJFIVRllr6lBbEH5QrCyHfVsOTw/A4aUo1durTpSg3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bIahr7B8MqnNpNOG9wg6ErdOEx2d2/ZYjmMNONZKwLLCj0K7mtvU7gGp2tlBg2PHl
	 PlRBlDLPCmHy+rZcPqz2yAmoXu26ONHJdGvJWyuLgG5gQ3lROeTsXaqLngaxIVCNn2
	 dRXWxZFH+fOXdROr1Qjvr/d8fUSsm9na+W1TmY9tNFtPfBRYvU9gnuroNmUZZ3om9k
	 7rKxmk+giLGsVoBA7MFtHIn+0Snfuk+F7o3rCwdKNdMZc+z4P8k0urMrmBWvBHN8wa
	 q4q8VvfSC0ENpiKWJchgraXJA3VS5ygt0CjWAPqmrqdPGr7baYzwOYJtWaCcrWvLDl
	 2tq7doACJJQLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BACC44507;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:56 +0200
Subject: [PATCH v2 07/12] arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2:
 add clkreq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-7-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=817;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=UdSN50l8fPPMDfJY8YaQToVjBNdxjR3Y9tdra7aQfto=;
 b=UchY9eK0Zsk3JYuUfZVEgP0potQlZBRcigbhhaLS13PDS+cWK5pEBzU7Vqq9AfY2S19/jPNK6
 PmXsJKxxMbLBFewABgUkIgqr0kl7kVzE3ezqPkHG1yt9STdbvY0WrgJ
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
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 361682c18e69..bcb2f5d63a61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -312,7 +312,8 @@ &pcie2x1l1 {
 
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


