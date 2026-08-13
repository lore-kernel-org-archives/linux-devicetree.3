Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C241DEDE;
	Thu, 13 Aug 2026 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603374; cv=none; b=oMWG1XqoKwwnvnZvm5QOaxdQ6P5pYpPABID27Z/467AETkaRQUjpYSdvS3T7mJ5kUv9yc1BqNoHwiKmoWzdfmhCFjs963UVscq/l4UrFLVoUNiIGm8NIPiYnyr4cDroNcml2ZNyWLGwc4mU9DFAhMMIzFdOWbLg46dkMlqN9kbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603374; c=relaxed/simple;
	bh=3fvCknCwajnOMYIUp1uHwU+nFkwRbCJkD6DOdmYgiUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r02Oh68ntIRE/CpUFGakGTBquqT4BHrdYsrfNBhCy0maexUTEEmswjJT3zCX+ohECOEPRUm2svMdKjRJVqteaukNOISaADZj14F+eWwq5wR48/uKVtJFHtKrOoHgF3OYavqQz7JYCee3cCTqZ2E7BS5/u0cLBH2cPdwwB1Maw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Aug
 2026 14:42:33 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Aug 2026 14:42:33 +0800
From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Date: Thu, 13 Aug 2026 14:42:31 +0800
Subject: [PATCH v2 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN alias
 for multi-instance SoCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260813-upstream_kcs_multiple_lpc-v2-1-775b1db3fe95@aspeedtech.com>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard
	<corey@minyard.net>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
	<jammy_huang@aspeedtech.com>, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786603353; l=1505;
 i=yc_hsieh@aspeedtech.com; s=20260721; h=from:subject:message-id;
 bh=3fvCknCwajnOMYIUp1uHwU+nFkwRbCJkD6DOdmYgiUU=;
 b=lJEEEpMZkfLyqypXwFJYpwz/fUf8JftwyrAnNfp+GYgwm3Cf1mwyNicBdl/HnC68WExoj+3od
 blHG6vR3vJdDC2zKazkTFANN2cjJE18j3DnQ6oo+qggNIRpnIzCGWTr
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=7KnU2ozXGF2IATT+Hvu7RbRwPxBA3/b+zhfM+UsPJMs=

Some SoCs (e.g. AST2700) expose more than one physical LPC controller
instance. Downstream devices such as KCS channels need a stable,
globally-unique index derived from which LPC controller instance they
belong to, so document the "lpcN" alias convention on the LPC
controller node that lets DT authors assign a fixed index per
instance, mirroring the existing alias-based numbering convention used
by mmc/i2c/spi/serial.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
index cbc3a2485a2f..81c12e0fb312 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
@@ -35,6 +35,13 @@ description:
   configuration, therefore the host portion of the controller is exposed as a
   syscon as a means to arbitrate access.
 
+  On SoCs that expose more than one LPC controller instance, it is possible to
+  assign a fixed index to a given instance (and thus to downstream devices
+  such as KCS channels that must be uniquely identified system-wide) by
+  defining an "lpcN" alias for it in the /aliases device tree node. If no such
+  alias is present, the SoC is treated as having a single LPC controller
+  instance.
+
 properties:
   compatible:
     items:

-- 
2.34.1

