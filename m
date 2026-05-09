Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3427F19F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778347014; cv=none; b=P5Qq9hMfTxZ4DzQfrdu7LF9qw3oW/2RwYb/Zg/9XCRbVcsY/D8D9SuEPErSA/RtX8gqrYsJiqO6VFglEODT1bN9kT+S5hNvG5MCmQaSTRNnwhD1FJlUbuRWZ6IacCCipZv4aB7WbEBtCTWMvvB6whjMVs+BXXtBjxaLz8oMieW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778347014; c=relaxed/simple;
	bh=AypAigm8ASeGXIIuZRfR6lqBYD3uTuiLMgdJxMilBMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ermI2BeYcn7tMAnoM3VW0ug7pGgtZ0gI9AZYqtmXtk9nujz4ZJkgaYJ+2UE5nuJSUxz1JSrqH+edlzxlG/gF8+BF+Ja5ExClmziCn8BzKvLZ70kdnDk05lChXG17063g/tw2t3emcwwMTCJjZBMXey+NacYDBha/0bnSWmH/Xk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FsSv0iRB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FsSv0iRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=T9px4Ep/vKWSl0
	j488ZjoLHJzE+RtwyWmlh45jNIc8I=; b=FsSv0iRBLgYLWbRQe/B5X/Ih9JuW7t
	Kbqfof9ozAJYqu82ohENEdO8EROkGr/mtEOZiMqR25EeNE5FSFCipHPIzdDDI8UJ
	7r7ZsYCb67yZ3RnOd+n0NTi/Ubz+PWvKtiASD2wEP+rpYk3l/lPQTrjIsYm6aeT7
	g4bSKFaN3YgcKFwheESPfz3YXlH/N7WDrbW23mCHoeuViPe5jSP0/LMAdydIhmo4
	N/3JreKS9QR5f7XXbRF5OzVaLnkL+rWzltQZv5bldgcgvo7PbgfumvwxFWqFvtrm
	0UW92bQUJCgR6oLnOOrtKStHePT/jltJheG2+Pf7wOgCmmIjrp4fBfMA==
Received: (qmail 1940757 invoked from network); 9 May 2026 19:16:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 May 2026 19:16:51 +0200
X-UD-Smtp-Session: l3s3148p1@2G7drWVRkOsujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: i2c-mux-pinctrl: remove Wolfram Sang as maintainer
Date: Sat,  9 May 2026 19:16:45 +0200
Message-ID: <20260509171644.12513-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YAML conversion added me as maintainer but I can't recall being
asked nor do I want to maintain it now. Remove the entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
index 2e3d555eb96c..bdc67ec3e71e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Pinctrl-based I2C Bus Mux
 
-maintainers:
-  - Wolfram Sang <wsa@kernel.org>
-
 description: |
   This binding describes an I2C bus multiplexer that uses pin multiplexing to route the I2C
   signals, and represents the pin multiplexing configuration using the pinctrl device tree
-- 
2.51.0

