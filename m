Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC44570EE;
	Fri, 21 Aug 2026 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306080; cv=none; b=Q/4TR8mD9ShAJ8ClyMsPEu2cZXskVQFKeFeeUej8O09vajmEzH+omDIcZyF8gamdCBcEnXTbvtAHe8iETPDXB8lUmKVR87+GRLv8mtgddS6eqRYFzoF53aBYqpRmrF1fjqJcV32gbkvICT99HF2il68Hu3fjprtEP7IZEm0hzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306080; c=relaxed/simple;
	bh=idf7xZyeyuNI8hXFf5nIR63LHWbC+sg9YMuShKvksbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U9s3yrBOt6qGlJ0I4AjQmnXSYGgiPbDZKDWQZJqHYid/bk1Vhc3Gq1KUyd/fQvD1G7MjqcvuzWxO5SuNbWJTIFOWEdqyK3bvTVTgJiFDwFy13w1CKwgWMmHwG0gxmxX2yZ+DqvqgYTM72mX703tXNB2VUB1v1SCFJSd8qZkfJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9VxeN010040;
	Fri, 21 Aug 2026 17:31:59 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlC009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:30 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:29 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:02 +0800
Subject: [PATCH 2/6] dt-bindings: arm: add Axera AX650 SoC and AX650 Demo
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-2-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=1119;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=idf7xZyeyuNI8hXFf5nIR63LHWbC+sg9YMuShKvksbo=;
 b=hdI3/4vHpSuMNosMVC60p9tTnfi6zFsiSIQNs8RLpMDC+fxmEncjRLuywyt7PovMkfVRETmLz
 H4QR6xFbdNkCTbC1uO7lW+Er175Nd8GnbvnGH2diZ57atK93nRNxjRu
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 67L9VxeN010040

Add devicetree bindings for the Axera AX650 SoC and AX650 Demo board.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 Documentation/devicetree/bindings/arm/axera.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axera.yaml b/Documentation/devicetree/bindings/arm/axera.yaml
new file mode 100644
index 000000000000..28bf0ce9fd27
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axera.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axera.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axera platforms
+
+maintainers:
+  - Shi Zhicheng <shizhicheng@axera-tech.com>
+  - Leng Honglin <lenghonglin@axera-tech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: axera,ax650-demo
+          - const: axera,ax650
+
+additionalProperties: true
+
+...

-- 
2.34.1

