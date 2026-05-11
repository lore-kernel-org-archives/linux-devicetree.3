Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C937CD3E;
	Mon, 11 May 2026 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470730; cv=none; b=RfLKvZCytxYclUZmtRCuQaBeDj8f9bVMjEKG6P5k8pgLptJCUnaaT0E3lgxtuxxsvg/qMg6TLXQLahyZw4Ek0ZmvrcE3rIU5pAEtesB9AkktLdI4w5EuiD4eK4OG178XlAITcvByBfm3+K2hu03AxLGT1Ydo4S0g189wh8lTfsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470730; c=relaxed/simple;
	bh=3UYbbKOfOuDzGk8Gygj16ojfINq8KrHhMxShhNP4nmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Th/NdUTymXBLUTqALUu8O+FXpwzT3rZcimr6O5eI0p7xxyXr3y/9rGes9TwvKGLGoXcg7fPvxfX6Bjg0ewJFp+wwbf8ZggnSYrmXoBy0PAy2fA1dSqKKjYpTF/HBLJuFgKNYmSnxh6E/eiNGQInCo036cgQv979P+X6LOgEbTwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQaxK7QG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQaxK7QG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA885C2BCFA;
	Mon, 11 May 2026 03:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470730;
	bh=3UYbbKOfOuDzGk8Gygj16ojfINq8KrHhMxShhNP4nmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQaxK7QGPdBptyGRe5L4qEy9X0f7M8P1oDDmjhDrc/FIguo+mzjr5bLCGzn59oLwQ
	 wfsVii3zs2NebuDKQ5t+36x8QbvaH2hN2J65GiZbKFNWAi2GsESeNnwc0nC0m0L5eM
	 SHKSbsWAkU/HVfN7A4OKrAMm+hFajrcKhnhmCd2j/Ft6C8qhGswwEssGycTfPB/3lL
	 7BjIoKHrqfvbw4eWo0RF3X7FzB7ibyvU47QM7Wt6KOGQlK9PGTm4KVei25tzy0vWDG
	 VgnD+6Ha2+FiAA/i5LhMfw62XSY4kSArX6FVvFOcpkc4UgjkCZyxSqN6kL/5PSQF1i
	 CsTyw6n023cnw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: i3c: dw: Describe core reset
Date: Mon, 11 May 2026 11:19:43 +0800
Message-ID: <20260511031945.3228-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
References: <20260511031945.3228-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..613dce7757bc 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,6 +35,14 @@ properties:
       - const: core
       - const: apb
 
+  resets:
+    items:
+      - description: Reset signal
+
+  reset-names:
+    items:
+      - const: core_rst
+
   interrupts:
     maxItems: 1
 
-- 
2.53.0

