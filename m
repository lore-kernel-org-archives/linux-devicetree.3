Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704B37E308;
	Tue, 19 May 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171018; cv=none; b=tVdnlr0vao1ZZnTbFHkMOnY8MWM4Obxlh9kgwuUChwANrzK5pULnuZKJ7BX7DnBeElqsd+ImiT4+np5fFa3eUfpTCdrFbsXzZfh4guTjXUsLC1ivE4tK055oyqXcPyMj1fsSz/tus8EPdec3lUka96T4OCg0JP10vRT9UUQc5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171018; c=relaxed/simple;
	bh=c0dwo/Nwv8VNMf2IlZJikWHK3B6Jnw3FRG1Y+56m7Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxraotgRGHilODe+1Jy7pCv2CI8c3fIQ0TqX4Y51Kf/KtrGFNtwkqakK0j6FqIpRodgMnCRBzKpIxrchhG+hzgQrQBGI9/n2Kbv7dArN2dhfs1XosibR1abbcjVmyfrXcLJIU7AnsLEdf2dW3gEcvxPedRRkREQv4H/Yda1Lh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q31fTeRR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q31fTeRR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C54AC2BCB3;
	Tue, 19 May 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171017;
	bh=c0dwo/Nwv8VNMf2IlZJikWHK3B6Jnw3FRG1Y+56m7Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q31fTeRRmzVAQma4ZFKMe4ShaxIy1ulegrkpEToh7NBnFZvXQStPF715TiuIiPIHH
	 lVkvHiNNB69yRd3Tbze6qTvEFrWTy+PSG4q4T5ks1xH3X0bVH70PHxDHFP3pKtYa6h
	 iS2ICFK7QtpM4rzQ18FXS4V/fY8fkSbbngYO7+4e0DYFrm3PC1ag9bCa9ce/hzOIAs
	 fpvc9pvcjIqgnxgZMEQ4rBwl5bf7enhavd7BS185CZKFwjb4sEAtODh0Risu8EtoNv
	 QeZq/kARI5bT0CGAyWYEDqd0iM048I2qKDoBkxkrXCcZajEnM0ds7ijVfzS2Vjfws0
	 Gi2zCBeF93UyA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: i3c: dw: Add apb reset
Date: Tue, 19 May 2026 13:51:04 +0800
Message-ID: <20260519055105.13079-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519055105.13079-1-jszhang@kernel.org>
References: <20260519055105.13079-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for support of apb reset which is to reset the APB
interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 519797c6b4fe..12845206772f 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,10 +38,12 @@ properties:
   resets:
     items:
       - description: Reset signal
+      - description: APB interface reset signal
 
   reset-names:
     items:
       - const: core
+      - const: apb
 
   interrupts:
     maxItems: 1
-- 
2.53.0

