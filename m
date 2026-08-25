Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EF3D6463;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654920; cv=none; b=gPNZa5C4RWcCxE89CJFW+MtdCJycveuiS3l9kMjD/ovL97SPPz32252Lr1s6zwjBcSEQTSkaEKjNXHgIukXSTrWnNEjjSll072cslXV7E8pjpsLnk8dZqmGIbjnvX71Zz6VKSkUjRdUNtWJNv6WDa40C7eokbpkahOO7uRkB0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654920; c=relaxed/simple;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfK8QCOFKRBdFRkCGUFA6l1T9J0rS3hO+I7ZuVdPNzB4DXYcH8+Qhr+7ih9Ble99xRJXnJLE18fFpix4kHsqkmDYseO2IDVZfkKUWcWXbo+w8uTxdBHo9dLKL59TjfY2H98tMOm3HcWOBKiWOyvQ6CjsKho5j4ZMUlxPm6D31do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wlu61ztG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlu61ztG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15BDAC2BCC7;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wlu61ztGYvIiCAkcwKONvj5YgDAk45PsbLBjX53+IlGR8L02chPEMJZoBRrI471D1
	 rKMyU2cMFHhaiWMka6lqdkFwz6qf/fhvJIjv36I2fIIEtcDz2Xb+OSRrBGe929upDY
	 N2wv92QH/fDYwliDSd72/+h5rBc7UQaU1OQWkKnZyPpEL7JyG/TpUcIOzj1/8Z1q5D
	 HzuaOeyJ2FlnY7hftrm4+T32EfLUH6Tcc7ZaElS7mfY46vwb1ejtfK00QaPpN/P5Rq
	 oPcGkbXIbFkKrYR+y2cX7nrMD1sLWVk6XmK1W1qjVTmze75jOLC+zj9Ukbel90HECB
	 CvVfEQcdPHOmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69AEC61DB6;
	Tue, 25 Aug 2026 10:48:39 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:42 +0800
Subject: [PATCH v6 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-1-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=985;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Sw+OWK3YcWaJDMswc4oOvzoue3GKb6ZepbG6V99kpbc=;
 b=4A0y8x/hf3KaXM3cEV4tdE3POr/Pbjc3QPcf3gzD6S1OIXiqLc1psKaEhE352IbNumiwWyrXF
 8tYTg9zCqU4BkQWdDFtOJ9M/T7H/tKeYNOY8xhej553QdnkEf1SzRFg
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Document Anacapa BMC EVT1, EVT2, and DVT compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..1c1570143bd9 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,9 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-dvt
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1


