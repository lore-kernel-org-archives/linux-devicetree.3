Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88FC3C5544;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406704; cv=none; b=m7z83XIwKsVSDiq1tTFO8anskrASju8+vJnpVtHG+o9T8LftiqBeRhLSLpBsOWxK3xiAsBE+yidimbzLtK06pqHwQM6ACGFTlxgP2yB67enFemtxO9DV6SLOy6hkQHX/rlqlqKE/XE8BolYHfH6dViuJTVhEcSdm8/SCMHVReg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406704; c=relaxed/simple;
	bh=0B2cjxvLooufr1CsGKSgDR7A32ZSE9y3xVQJvm8b+Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4Dtr/Ipb5dg2PERREzPKKvaxOrBG2mzK1ccf4NGqpHdOgdnmf6pJTDbmMSEP7z7/pGjschWZaL7yUtm7BxuFlBQIrjBCz06yrZWywWDiKAru91t5ht5UE0BC0wIAANLFoIFY62cUw/5wWSKV+BY8v8cx9v+0CT1B8koaYOedmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIliYIeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIliYIeR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89ECAC2BCC9;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=0B2cjxvLooufr1CsGKSgDR7A32ZSE9y3xVQJvm8b+Cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iIliYIeRFoJm1ilhjjng+HRx2lTC7n2PPO02C9Zxjv1jaL1uwnpm1mlXG9RMso40Q
	 dO22FgD/P6+sBfrM/G8uYebeGhh7rY1ojLOlJAEHplMe0ZcrVyENZldPtzR9z89edW
	 //GOtZ8WoYej4sHsl2qMZ1crSk4n//JIqpwccq+RT2atA8mS3XMX2Q4d7jbtyG/3Hi
	 tt+1KiNIo6uy7nANeFU8dP4cfiPjHd4l9g9gRQCAvcbj2VGHjS1Yv3Fh3YIvCMc/vI
	 zKB2cMxalQz6Pk9pf75jNJObKWiYzZwrmKf433aHHsE9nRkS/dhivp3zCedQmazePX
	 zIx2SYDLidC/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741FCCD6E4A;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:24:56 +0800
Subject: [PATCH v3 1/9] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 DVT
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=932;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Mdgtp8BwSQD3eHvGI9wfdGeT4rx+6rxoxRX7WxtcMqI=;
 b=/tNsTUJPyHrZBJTcMMXijcmXOk3XEJwsxiYcMXQ+5GitFkdQGXwUwI/DXnOOxpjX9F2uNXg63
 r2dJJ8J1MvDCpTIlPGxvW1uGZErAuD7TJrF1HlZi1cnPQG9hwNuUMo1
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Document Anacapa BMC EVT1, EVT2, and DVT compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..d3e9d9a2f881 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,9 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
+              - facebook,anacapa-bmc-dvt
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1


