Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C852772D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127057; cv=none; b=Xa00fhAhcztoG9bHaUT67RT+6G4JRF/c9M7ZRolxPsg87RKdbxeXatplgRDbVjbTqkZe4ATtOy6gLKSm2gg8VDv6reFBZ0RDBtuoyT0zt/DAyvPU6xQCBJpVT1SN1En5yr8HrC7qCg9PGZOCnvujKM7QPLuW0BLl+754nhfwARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127057; c=relaxed/simple;
	bh=fo07MFVHTfR6bcAVNR/8k7WT43GO6TGfyOdGzscgzKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUosKOBX+h7R/Z01+W3i5bZAh+MVAsgshWDTboXw2F2H2BO3ZGcLB2FoYgnFe75Hf9wapJTrAVCCR1iupKwsyWiIWYtE3TWtN9Z7roshVSN6Q+vR+13EFjjuggvJULl9cfmlZOn5SAZhnOlrIGH2Pf/+7OPB/U+XbqmrBRNS8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wXQVb-0003zV-Mm; Wed, 10 Jun 2026 23:30:47 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wXQVb-002707-1x;
	Wed, 10 Jun 2026 23:30:47 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] dt-bindings: vendor-prefixes: add Gira
Date: Wed, 10 Jun 2026 23:30:47 +0200
Message-ID: <20260610213047.500701-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add vendor prefix for Gira Giersiepen GmbH & Co. KG
Link: https://www.gira.de/

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..2b7bf7d7b9c2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -656,6 +656,8 @@ patternProperties:
     description: Giantec Semiconductor, Inc.
   "^giantplus,.*":
     description: Giantplus Technology Co., Ltd.
+  "^gira,.*":
+    description: Gira Giersiepen GmbH & Co. KG
   "^glinet,.*":
     description: GL Intelligence, Inc.
   "^globalscale,.*":
-- 
2.47.3

