Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F33EB7EC
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718772; cv=none; b=P0j4NYH11y/76mT1oYY7mIOkfsKsAyW1dcZB7bXgIYf55+NHbv1nagOVUVc4sgtpIXUNR/eUBJ/N/eZ5uAbDGbiHnHJEIM6VCPonRFLYuqHsqK+ZevWNQhgrtZFBf/dE5bXYO5a15JRuZa5zy1eYX4OG0w8P/WsTPm2WWPHDuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718772; c=relaxed/simple;
	bh=WyQwVSOfGAH/JjktP9OdqZN0lYKiIj9nAvU0veCVHV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siNNb5towQV++tFv96j/UzvGiqftfU0HC2HYsz2tsjgE9S83mR4dasbmWDtCVZOzKqiyt5BdH+WN3bT7uMW9WSPB0Ll8jQDs3Rx7d/ixK+6REKmB/+bRPd+DfHkEHSvJ8LsonsNx3Z4qC2VZLE+ftQCDa4tefU0LKBnzHd2P0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmc7u84x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmc7u84x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D431F00A3A;
	Mon, 25 May 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718770;
	bh=Qv9L4v59nSxJZ6rq82VRvWuscv9RAnRXi+EFaew9W6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lmc7u84xKkRmn8qNJsvgsxIQ3lQn2ePaLhLD7O+BCHQOObM1BV4D8ySiLYdyL67J9
	 dJsjKLx4xard8BLFZ9jv2KBygpGZ9fafWv6DhhX43R2kh4WIIbRz231ni7pZGBdsQ0
	 4I81Pl95OQ8EHji8wu9NHc4ELp61ZzPfcCjS849u3OgQ01zSDPTm/uw790VX07T3zM
	 hvV1Acmt80DHPXCM5yeKN0hYDbKRV2jt0+gu9oKaPMDaxNh7vGQkuFaGawgHh1x88I
	 H3ptRMma+XyaFBdklPgKmYCgF7hLdfVNAF5Hu1D31X4H0UjdAAOrZi3Vo49bCk0ezv
	 5KCdO0tpLHCSQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: i3c: dw: Describe core reset
Date: Mon, 25 May 2026 22:00:16 +0800
Message-ID: <20260525140018.19598-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260525140018.19598-1-jszhang@kernel.org>
References: <20260525140018.19598-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "core_rst" reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Then why not remove the "_rst" suffix? Krzysztof pointed out "Cleanup
of name is not really worth affecting users. core_rst is not the best
name but it is not incorrect, either."

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

