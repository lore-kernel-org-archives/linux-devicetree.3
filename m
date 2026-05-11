Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB237C93D;
	Mon, 11 May 2026 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470733; cv=none; b=UJ9HgXyOpMAwoSu4WoVVHyZz87sJPrj12uMNyWGv7E448LPWBdsZl+kl56uY5B39u2lr6YSBavGglEsG3bYH7JLdi7BXYKKGcMjqI8j4MD+h1yYe1KVYE32lSdoq0emUepgESGkQHOOgVoqGffD2AmMZUbr5jkBwLu4wDCwvpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470733; c=relaxed/simple;
	bh=ZzSIS0T2I6SH70gPb1462rezvQzGyTgouPvultM6eyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQD7WBoMFbTZeX0DS+MczdPwnPYpt/tqQK9mpAXlFu37Q0bp2MaqqFJfo7Uh5AkIH6roCSbdp3Gwu+dIjG3RPnAbR5YPZSNZHyh8ljSAscPZguVL89oUpll/e4CWVNJiJAfhdzigbmYKSTPo3f7pFvSQxy2huqs/vxR5V+Sr52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNWbZv/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNWbZv/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C383C2BCC7;
	Mon, 11 May 2026 03:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470732;
	bh=ZzSIS0T2I6SH70gPb1462rezvQzGyTgouPvultM6eyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNWbZv/xXoW2egK8tcF45oUuDZlfHylT9asN4+nVwUkUMwBd0pAI0SFdDAD6QPnOm
	 tNBEqyjeCVsbdS1AvrGqRPSH5hx/cjvXm50+0nj/tvqExgSAVEAMnqIwmKPoRsg4Nj
	 M1bS6qde+cPDg5D7seX1ybO9NXIpqQz17dCBerh+gCyycfaXgCRILBkok5z9Ro7Rdh
	 HI4zxwAYXKk5RzI9z65ETvyiElOpIeFbyjS2Cgg8aH8B23dLxa+gsjr5Kh+fP2VbBn
	 7/DuUopyohAnP5N93T/0VXlVp78MYzPxywEbbjvlkItsVnN2khwjM2GT3fldDmKLL4
	 69hNU96DcOiiw==
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
Subject: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Date: Mon, 11 May 2026 11:19:44 +0800
Message-ID: <20260511031945.3228-3-jszhang@kernel.org>
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

Add dt-binding for support of apb reset which is to reset the APB
interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 613dce7757bc..2575442b28ff 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,10 +38,12 @@ properties:
   resets:
     items:
       - description: Reset signal
+      - description: APB interface reset signal
 
   reset-names:
     items:
       - const: core_rst
+      - const: apb_rst
 
   interrupts:
     maxItems: 1
-- 
2.53.0

