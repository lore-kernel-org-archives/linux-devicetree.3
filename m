Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82523369D7A;
	Tue, 19 May 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192466; cv=none; b=rmXBOVepX9YDHo3kvTgAHXTp8vNJzND6VEKg8m25iztp/o45rCZB2bY7HkoWuGJATtflZvVs56avGaLt/VkksDHop704D5b6yJ9cZYQshwET49EzFWymo38uYrMcR25y3wZhk+hj3JAFXviTGuMQykhjq5MWFnu4kFRXC3b9tgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192466; c=relaxed/simple;
	bh=sitTIBX6ZYAXUmlVdJTAZO+S7ATFixBbtfPNeik3ZB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d34B//9PcaPs8vY53XMNZ7uGx6xrYuYoanwz9NQX5hhcbbZs2Yn2kt77ZX6X4BsOgCcjj9pz58feulSdMElVV9WiffMgpTo4CMNkD4uCoeaX7k5Y0ufTe9Rw6UYVLjlHNd+rZpoS+Ajg7jD9y1Pm2n7JjR9eMR9Utm1r44NmyVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=TPxj7gGi; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="TPxj7gGi"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdf1:d100:2163:78fd:7eaf:4049])
	by srv01.abscue.de (Postfix) with ESMTPSA id 8466C1C68E6;
	Tue, 19 May 2026 14:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779192463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lb/OFa0SzbmDNH5bbUDPR0pheaF6ex0etinvP6CbPEY=;
	b=TPxj7gGi65f4WFr+xmYd7nprKbZ3fOcY7ijxGC+lWIxmOl3NMrNYCAzb/03t9PK+bX3gS0
	dXxBBo+t35evMArbHvE31YBB2IZQkNI2MM1qa+H3DEreDusEe93VK5aSqoRzTs/PH7Md4V
	Tv6DN9LyqYb8qCiXdJv8WD4cMISCkMmLTqmsT5ImySW4MfVXsNgc6UZGgTCuX00gZAkrZc
	5s26LNcX1dzcPL3qrSJzn+aWsEfASfrlQY0xY9AME/aUD2Cc8zFFn8CgSv6ZUrPPpLlDIt
	iXVL765qWQPYJDSfK5Ih70acxoXz70lEaG5ptVfIP+9YeLAT/X9nXWuzi0n4RA==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 19 May 2026 14:06:12 +0200
Subject: [PATCH v3 2/3] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-sc2730-regulators-v3-2-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
In-Reply-To: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

The SC2730 PMIC provides a different set of regulators than SC2731 and
thus requires separate regulator bindings. Allow using them for the
"regulators" node.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
index b023e1ef8d3c..e74ec4970994 100644
--- a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
+++ b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
@@ -54,7 +54,9 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
+    oneOf:
+      - $ref: /schemas/regulator/sprd,sc2730-regulator.yaml#
+      - $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
 
 patternProperties:
   "^adc@[0-9a-f]+$":

-- 
2.51.0

