Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A545041C;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934989; cv=none; b=AgmX3rcGyKf2blufvEEd0NB9XrGhotDRrOAKaoW6FKrw10b/SI2wCwL9pzL119vG6oI6woLI/d7/PiRfuT3od14ab4/dS3aPSimIJ33uMSVW+Z0c0VSscdj+5cttL4UY4F+mLc/QpcOFsnzHlAyWYKj7G6EkJ71rP9B+Fkqjhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934989; c=relaxed/simple;
	bh=hi9+GeaO3bLXI76yLDOrNGxGs+Avu1qw0k4soBp8eiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6rxdAI5xNgkkBmIFZLavdQgyi9p42kznL26uimJizcDh1hWxUShooVEq6rIg4ZOlqcF3lg31truhs8gcbGyp3SGP6LOiNQwX5pxUC+Tt/cVPCoJMjKpvnMAgzdPHbrd46+0/gn7UJRY8cXHU4u/CwbYnJJVdYvndWFr60JDcmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qm4SYNsc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qm4SYNsc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D247EC2BCFA;
	Wed,  5 Aug 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934988;
	bh=hi9+GeaO3bLXI76yLDOrNGxGs+Avu1qw0k4soBp8eiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qm4SYNscAty2fhpjlJog1/Rn4io74dZUykcajbdY1oUKhrFeHIDi1fSS0lFP2BCaF
	 zPTdiihSkw3LQ/8OVmeioC9hXKxt1EEsYa7SG7kVBorCDj9TCYV4OMl8ck+burVuCJ
	 8Ve0ccQA8F07FIDOCNDuFInLoUKSMPUvy6p64GtiDtUz+ncBNgNbR4o6HE1az16KFn
	 UQm0jPLG29dROXECE+FZsqo72t+qGwtgulqDv9CqMHYpimW7x2txFvxQIDmJGTdZ09
	 K1yaSVZsZyEIXScj0tLR1ItsEJLDjfX+u54NqN6SpYYsKlKRaMI/uqQi/fJt04F8Gr
	 VWp61Mbwyxyug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27B5C55ABF;
	Wed,  5 Aug 2026 13:03:08 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:29 +0800
Subject: [PATCH v4 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=932;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ilMNo/yT6oeGDuaZTkvgyuXcAOciPuXW9RaEwTNseF4=;
 b=IjmR4C9MhRHgPVRJbUmaRVvWK6Fm9xWsXUIsegB8uCkYjFtnjuak1hlTKO26h394Pf3l8/3Dt
 ZCm+QUb4/VaCz8vSOW/ih6xrZseYTI/ZqmcQWprg/DvN/cXhCw+rH60
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
index dd7996960de3..1c2656d99807 100644
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


