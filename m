Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333893ED3A6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718774; cv=none; b=Zc09Tm6epOtS/0qjhz+EHhMu2RuTnJ+GoG7xnHhyL08/yS1/7K+QU+eA2RhJzGCau/Qh2evz4wHdcNxqQXhGhgr/LpFUFN8rb8TjR2fE1UzGotzVcsGj7t2e4vmtPMrm/W/5DWm4Zd3XW3RPmPaNrMt2Sv4OeSeZp5ZUOl9GAUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718774; c=relaxed/simple;
	bh=ZzSIS0T2I6SH70gPb1462rezvQzGyTgouPvultM6eyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHkFousXIFufyzO/YErDLu6sLCVZ3Eoit7DbwtKbbVPqdemLesBV4h/1zqV+PhZ1wpihI/k1trZBZax2UK6vgSfGyIwtkJggADqZdhl04MLxUPnnpehhOhc6vnn7mhDVcR9D2ZqZflHqzKMbZm9hFpyUIKl2xenIlJnmX4MsdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaoQSkGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaoQSkGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4551F000E9;
	Mon, 25 May 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718772;
	bh=Y0Ta+M9J4SmiVALp8xtiFc5Ub2xitdMsJyDhL48mVpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kaoQSkGuKkjOkFedB2Pivm2NtRlX44ugVhOvOmjd8oNi8qCKzIERPi4gxZYZRLvwG
	 f9/l8kAJTZULFawrkl237DnX1EEQ4COkF6Wt9lCvRJZjahW+eUrQ6o8ndvNX7QG0wL
	 FYYBaO4tnDHjZ3GYl1MO6QK2tSZr+5s6SsGMPSylUWRAyCMsTu1H+EwB5jfybIzfDX
	 9ps2JainHNm0eoE4uetcM/bNxSoYBNr0mpBzb8U1V9v/+BP7tT0C179d+HtpG4vtjN
	 ZPX7keXVJVTpZu0C4ERqeYq9JOJGZ21GwZ8HqUkN9+XzyueL9rx5SA5E2GcgMRmnK1
	 jsoCqLF4W0HQQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Date: Mon, 25 May 2026 22:00:17 +0800
Message-ID: <20260525140018.19598-3-jszhang@kernel.org>
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

