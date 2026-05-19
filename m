Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F753806C9;
	Tue, 19 May 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171016; cv=none; b=tVf2kpOlfehq2/qV/gWRaOTln7+f2Te4mq9Jf35HZLdpeb1wlIYcCQm/SlpG6mQUPxxFGbFZ6mGEgRZ6E+Fk75xJitauLDUG8laa9OJgZECUAU0GxORoHkl2epqcVqHH0QkN0o7xOTdQAdFKLDzxCpiWO1lxUbnvb2acYlJ2L9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171016; c=relaxed/simple;
	bh=DswRk7ybF3fLnX3MJJEkMdXEDTp+sndW4Ikfc6SzmYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhCDHSqJtcjUSjb23ap9/Xw0epvg1NFrltv4fU7lF48t27N+144NnLZDLdYb3cfcanK1vkEttJInG89UH/0arwdNkLFvtmUgSdjZqjjf4ZgoTDceE0FrW/aHhqlDKXAI4sMXKXprShJ7KBrzAGLv4w66U53nf6cwajpW1giBils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWnbT7az; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWnbT7az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75B9C2BCC6;
	Tue, 19 May 2026 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171015;
	bh=DswRk7ybF3fLnX3MJJEkMdXEDTp+sndW4Ikfc6SzmYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWnbT7azwoFDGZ2cgzH739aopiBPMSZJ66RowHpanjAeu9ZCDvXaULoJQ8aVPXFfA
	 flCWnm+d+t2nDA5angnxRdlEkU8a7HXnwvLiNTUJlugsLrnc1bkcycXSF/bxebOydt
	 rIDiX4vuoPaUfqwFD8/PRFGhX8tUee2UyOclL7IGqlVh5fUzr5qjEc11hfH7xS4qLc
	 80FV0NshFJguz8BYIwfjQBBJ8CcelmHKcGXp2UUcPOA14FwAQvPkyk7Y6DMl6Wtehz
	 eEjERCqxsreB/QvVigBrL+y9CYHlkXPla81Jw/JwFwtJMiWZXR+vBnAi2OENnuaC9L
	 NhddF/HqvIkcg==
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
Subject: [PATCH v3 2/4] dt-bindings: i3c: dw: Describe core reset
Date: Tue, 19 May 2026 13:51:03 +0800
Message-ID: <20260519055105.13079-3-jszhang@kernel.org>
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

The core reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..519797c6b4fe 100644
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
+      - const: core
+
   interrupts:
     maxItems: 1
 
-- 
2.53.0

