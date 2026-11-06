Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957456;
	b=exNCc+WdFT0BWWROrgC1OBedI9653IA6ySpC1+JE1yw3x03V6OhMVxeQkKt7cepA4rwA
	 Wkb+64FhDKX8pQy/hGQrLcPTzAqDgx1V3dxXdOcdyS5hvQ4G0JxjV4uP1KzzIqcdcl0EZ
	 Vw185GTSB4rxm3qTFDx6sAUpHGdbAO46Nt8UlkGbY7SYsgyn4xLn34NEyXOY8CldObFNm
	 oE4gfW/kEAr8+/oytPbKHpttwSNo8zgawy+U7InGgLZd+mEIRgfnv5P/PDkQUxnPIVUww
	 ttLkRqjeAsJ06MuLc5p1FHOb5q/f4Hc6PFHlq571KhteOtc3EIXS+ZcNMZeCDIa3SQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957456;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=b2DYExTYymKs+rj5qLFkdxVQ1f+JYX1uyypx3DzhTVs=;
	b=sXO78qL2jHk3PZIIzG6Ah5PfjaEKcwpRH+N+sZxFbgV4C9YkGEqOXcvA6ccOHOa4OCgm
	 crxXQ1WkgEe+MUbHMpkZ3zRPT3Z42D1MtqhwkMeGDj8H5BabH113p1yO5b/pXPOUiA1L1
	 cjVPr16iTzoeBdnnuvfhxMmXQwKauc9jFKabt2H0WQgDC0xv47IdXOxrbWgDVEuLLcEA8
	 p11PhPx0HZD75rC/oqBzvTpCKKhkMBEqkMnB++Fbxag2PcmjgnyvHdMNd/aw8ZMMa2gRh
	 wk/85Yyav6xpMXfUt91LshhLMgBR7D78Ao8QFMPBPeodHl4g6XSA9uQvpP8l0hWDspA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n1j5ALbN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B73606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B73606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n1j5ALbN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5B474E413F5;
	Fri,  6 Nov 2026 09:30:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91E855FFBC;
	Fri,  6 Nov 2026 09:30:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23E3910329258;
	Fri,  6 Nov 2026 10:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b2DYExTYymKs+rj5qLFkdxVQ1f+JYX1uyypx3DzhTVs=;
	b=n1j5ALbNPpw1RFX1M9nj4YVJj634p46gxBZU1MJ5wj45z4wlJWSXL/5Bc1zCOnc0L5bw2z
	D0n3M0ZGB6qDz/+iCxGTxG6NGIs/dpCvxBqqcVUmbWuFc8bM3LyGuqzlI76pSD5tbqUCk4
	8VjMQ7iKwRN08hZzZSuJmrRjf4OC3T6T2lagge2RnBHe73UXtG/DjSkkhvUV640NakyRcG
	9ARLCroyVYbK+CUNT/rb0Wk/+p97mgtlTNeInPxU/MFjFQmPbn2UTGwlhybXThUSrqNA4x
	noKS40HU8IUuLu6u409P/3/WcS5R8PLj5fzvHq0iO54cg1IFv4ZBUVPNJfRxDQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:29:59 +0100
Subject: [PATCH 02/25] dt-bindings: riscv: add Metanoia SoC-based boards
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261106-mt2824-v1-2-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Document the compatible strings of the Metanoia MT2824 SoC and the
MT5824 evaluation board.

Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../devicetree/bindings/riscv/metanoia.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/metanoia.yaml b/Documentation/devicetree/bindings/riscv/metanoia.yaml
new file mode 100644
index 000000000000..a651917630fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/metanoia.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/metanoia.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Metanoia SoC-based boards
+
+maintainers:
+  - Jun Chang <jun.chang@metanoia-comm.com>
+
+description:
+  Metanoia SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - metanoia,mt5824-evb
+          - const: metanoia,mt2824
+
+additionalProperties: true

-- 
2.56.0

