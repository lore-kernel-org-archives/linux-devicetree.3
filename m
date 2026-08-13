Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455443B42DD;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622400; cv=none; b=lfTvLScHUH/ACowhU4041JzqQCCypo4VGow6BHfqdsJgco7tXQNKaIiWylme4W98arssZCKtVonpH00a2kN64rkFPxjXxXAG0JpN586OmexYHl8klt16CiVAxrlUEqzAJxN8r4F8GUx02x0jVtAnNOVOyEm9F1koOIL/NTph7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622400; c=relaxed/simple;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEQaKtMuQMSOuJdbBLEjoSGMfxsWmK3KRam4Or0Avr+xh9EeD83IFKsecSbKKNHkxarMxMFbMXili5xBkzebLz+f8qhg1w3VwgNxAR+T4s8TQKo5j+UThN5gNxAPIY08M8KL5iyJ64JRc7nmPs4fYPr7WkhrbjfvE3ct6BQatgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwLk7aUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwLk7aUX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEFCDC2BCC7;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622399;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UwLk7aUX6eblDL5+ILVIy7EMM+xYUVYYERWPlhowguzjo3XQYAkSihclHOJ0jBZE8
	 kX/niZlh3Hpj8iVdIQRUfMS1FMjjrNKJ0gPAuqwJfvd7ENbvUdUvd6WvrNoE2jcXWl
	 Nvu9dSI9sHLK457S3hKaK/skYCaUO9yZRMZyWF2LNStIyVNmS3CtWnT2K9lTMv30LK
	 TGKtmkPHakzRIs/vsbKrU1cBFs8fC6IhqLryj5iqVsx07Uoe3PS8PIV8IFtHy9boso
	 S0ny6pXHhpAOIXAKz9DHbb3n0w77C/G//FiWqpZb1+Hx8bL3+F3q0UEMAnJW6bxAsb
	 4JFpZP0t8yr6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAF9C5B572;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:31 +0800
Subject: [PATCH v5 01/15] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-1-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=985;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Sw+OWK3YcWaJDMswc4oOvzoue3GKb6ZepbG6V99kpbc=;
 b=Um55I6CVH1x3FcJbngRYHo3gZ8DbRaJiyMXDx6AbqYHQ6ZCPaaBQ44jhg4oELVPsZ3bXgqO79
 b+i5I3R1XGmDvK44ZrYD92TWtlq0ieC2qjMGWtxiIdrbdXSZPpBZ8Pm
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


