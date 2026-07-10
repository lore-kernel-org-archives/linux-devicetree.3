Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D223F3D16F4
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721532; cv=none; b=a+WDpn+IYSNLXVnq4qWgzhGa42Q058gVB/4SN0sBXmfrZr5UapK8QyCoeUBLkdpxeE3gL/QE+ZeiSfnoJFsW1Xrmj+6avjQ5lZ9Gf/9FyDJmE9AnwDJPUIDSTo5leC3cHnsNm2wNpkjuw9p1h2mTtqDa9Bgt7sT+7zVeDLAfZ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721532; c=relaxed/simple;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OufKqsZ4QOR/KL15U65eLvk4gJpVh+HicwvHqWiBl9VqsoBbz+6JYmXvQUBLnPwLr/Q1U/oApLumfP/g7OD8TiqK9bdhy/B6F0gz7e8YLwCW9kVClCFl0YBp5L6kGM0I0P7ngQrAy846VC5HRr+AzStCVxcEMJ4QLpKky9yKuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBs5JC4V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBs5JC4V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 820A3C2BCB8;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SBs5JC4VNI9D6WZqyaRi8qttvXj5zjp0C9fMrwktruRNTNB1v2Ouymgb7PMELZwKn
	 cKLArQ1vagpFCNRtmR5xzVh9gb5fHTzS1VZqIh/Ay9WN362ljvRElh/zBp3vLTD7w3
	 BQUzUN1WR1e6OLwPfqiaJnhHSaPW7ZRak7FHb+afV2qjyoX64EpttFLQPkt3gz1088
	 vIeTHWNEzbfGIb3cMd0VsbHOSVWxFXnlcZyK7EexwNiMHO5rKh8bALPvOGrkR903sn
	 XfYnpr7Bgc3mh/P8xdZtTXk09EsqqZjrdLbSbkEaWI3OYUlVcR4RAYbMnCtgDys63k
	 XZ9QQKVNiAaPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64448C44506;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:50 +0200
Subject: [PATCH v2 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-1-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=1140;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=0ONGW218GQPBB3ga5TfqmUyan3oaycKJh9VLj31bcMQ=;
 b=2M/cAoVxhUpPF5TIViVSsNdgF3JgOe/HO9gWEoR3uVhFLk7P5HKDKS8YR37JtLW55jgo50KhA
 U6V4r0gd0nWAtoKe+ID7ZYDAMTnYLd4g8C/JTtd5mCrMesgu0pikQeD
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6,
a single-board computer based on the Rockchip RK3588S SoC. Very
similar to NanoPi R6C and R6S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..6ba512964c25 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -344,9 +344,10 @@ properties:
               - friendlyarm,nanopi-r5s
           - const: rockchip,rk3568
 
-      - description: FriendlyElec NanoPi R6 series boards
+      - description: FriendlyElec NanoPi6 series boards
         items:
           - enum:
+              - friendlyarm,nanopi-m6
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.55.0


