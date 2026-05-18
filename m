Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C75648AE2D;
	Mon, 18 May 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120108; cv=none; b=tD9IO7Tj2Kgorh/sX+BpIgikytaKWtsHw47jJF0UH9jsfI7cTmgbShqEKd8pPzT1NHj0AaG5jY2qBYoNMXtfO4PNAxNGttoVCuaWI4PVqtre/nEpehPRPLvMFSfE8HW3K08HEeYz5MHrbRQZ9ENPpsT9UHwAXn3ZZdjTTLrSHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120108; c=relaxed/simple;
	bh=Tkb1NLcz55gFokwKRbMQwNiWQ4MHIuOvvRPK9TP5c8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJ42H5A1HC0KrStAhNAyvmIzixmQSvCEfAqAiOuMTRbEPfsPJsgbj7Hefb0ERj3KRdoEg5stJHpAJ8sAZxpZr/vlcvfFV264HPW8pqfwvNlDVALmOVpdYu7yP1zWmAP15gOkR8LkUdMG6R0DBuR8jtCo4EGhrea6k41TaGodWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=NbAq1mhb; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="NbAq1mhb"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde7:e200:dd31:dcff:5f50:b86f])
	by srv01.abscue.de (Postfix) with ESMTPSA id 006821C6111;
	Mon, 18 May 2026 18:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779120098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mtbGGTMoCNCoHEKN9OXYvyRtd8saerieIETmB0mUrY=;
	b=NbAq1mhb+rFk46ldgYHTpxk1tNVQTYHTR2afHcVSATLQpm1JYVEaq0O0WNp1aZ1W0+sP9E
	usy47P2ubWwtJZK6XZptZNE/MbAnKvFRPW75b5XEpEH3lO+AZmPWEJN+Owf7cahg/bk8NZ
	Mmz0KsLcXEsXbAfHt3rdhKBZjG7laFyhyFum0EC146h6J+C6wFPRaaEPFA3CXiocOvI6CD
	mLQsCmZZ1s7/qHCO7CEw/gncY48hYAXZepz3V91rKjXc/Iwf+DYPxdLrXYWWfpvDmwiz2U
	4CrIRuXD+MSpOwzriYCJwCRzQLF8kvHMmSgVSXwFwA49hf1kCeKpesuEIe2SrQ==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Mon, 18 May 2026 17:59:48 +0200
Subject: [PATCH v2 2/3] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260518-sc2730-regulators-v2-2-9a5b3a7b1e49@abscue.de>
References: <20260518-sc2730-regulators-v2-0-9a5b3a7b1e49@abscue.de>
In-Reply-To: <20260518-sc2730-regulators-v2-0-9a5b3a7b1e49@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.3

The SC2730 PMIC provides a different set of regulators than SC2731 and
thus requires separate regulator bindings. Allow using them for the
"regulators" node.

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

