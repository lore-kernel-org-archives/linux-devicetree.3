Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3989440682A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567204; cv=none; b=Pha7iHtmA3r3bAZw4w4R+FTMG8Q73oXB9mA6Oxx4gyMImLRbJWcxI1IJy63mQeY/L7GDKkWh6xuEsgeWM0ELwvWnj9V8CxZqx7WYn0I0tCanF/sRK5LslJToJ9GAwmx6X6LGUauWruVTVpWxs8l6vKyhTQzCDc99LEDXR6YesIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567204; c=relaxed/simple;
	bh=DQUy3Z8MSDRzhWbIO8/PsqkelGTzQbuLOvc6UqBPiZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJGLVf4+i4efC5h0XzOj7quL7D+0VupJdf6uxOXG3Vg1k57y1B82GeBxsOM8d/bV+1Q5q0FOoDdt0ql6ZAuOEmfUzlDNoTMsVyUM4FgpAbT6PEuSA2audG3ScVLETL7w/ujYN5uc64VX223W94H4AdijB6aiLGSM+6VMf8+c+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFz+gtIC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFz+gtIC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c26d7e951so484912466b.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567201; x=1788172001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=MFz+gtICOF83EjGcJKJCGmMIlgABaTMhf+lcVH9Q14M3sUqJ7j9BUAlK0PX4bH5dgd
         xJi1OUd7pCbPAxQRvG62E00AV9i6qdp9BM5PUzTJH4oHfA18w/5xlPrpS6/7UZQGgcNQ
         erAsRVjdRmmXbp3WAQ4jtLZQxgzQC4xTArrpPxa3LnoDKA7YQ/7PKNWdaqi7VNrGQlI6
         y0HcpYvbF0rVN1OvInUWkIRyCe2vhgqvDbAEHHeGXO1CtzS17YmtSzUqEaCzAnuxut9r
         153kZ5xJd3awPR8nR231D1BEgTs6u+k9dUzq5cISoRfcBF4aTxQvx7w4RHRs5/ZdXqtP
         L9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567201; x=1788172001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=EQLKBzx6zkYtwx9nwNDDUND2MPGb32ayynjdepDM6tsCbisnHn0Gfo0gQZ1zuvKkNc
         KK+aV7cDWtB4bJHfE0ZkHhH46Yll5+U51y9d9p2x28mw+y2dFcX8Xv4lQvTSoiQL0qCa
         fF9OtmlDRtma9RMepZ/sWDcJeu1FJ6IUmJQf7+5RLGgVZbkwy0kIVBzZZ73it0olR7mL
         6fs18yjtTdMeSijHVoPwTaKog+BLF7Os2CGI5AorU3TIhXcc6BZVPcYvAfKg/CjvVIDx
         HrzCWc5NbM38bo8FQ4lYHTFlALBu0PnBNThYsihzVPmojzvBxQ/iU6sbol6U2KlixNXn
         zhDg==
X-Forwarded-Encrypted: i=1; AHgh+RqDuDwuX1uRzsDC2nFw8pmilJMITqydXRyY7/fzwk2D9MStwnJ/+aYS1VnK2QEsm1zWxctpWzdC9rRP@vger.kernel.org
X-Gm-Message-State: AFuF++mkCWX6/pJxjc7ZYTCTPbLo5U1R4bf7TYohZ3uenwTev442O6cr
	LB+e5FZM9T/I1KDOxmbSj2+WsSnr1Qw/2OCpgkrqYx94UoWn4860NGVz
X-Gm-Gg: AR+sD13TzBCi3GQFdN81G9pkCxShS9ZG5bNLhLDVpolYLIF7UXJlZ2QeShNBZtWN17x
	7IR5eFs/Z3GncpoFAFS9UflQ/+23dy/N269TJFm45dikugsR9uRWaM+f/Wcec1RrgyTw7fesrT8
	pKP9XrVN0sB25eKR41gqC3/VKmRwaSyGEBkM+mAFSV/n2428+ospzc8tlgcOlcirde4NbuY/PYD
	Scjj8W9HJym/yEUPbTKQWksCAfvUWjg2JwNnMdtZt4oRo40ROLGm2Dhcl1dvjL/XSfJ8X3rbK8l
	YTUUJkBib4zkDtAyeceRp5H6dSb8WulK+ZiEZ0B70Y715X51Hr2US9kzxuyiKWZpwFxicN2h7xJ
	gIJcEyJgeP836xwlwvi/gl8sRFQ9j3Q10pkzl1pQ8XRMsOQ/3+liZ3KAemQKP9BXd+phqBSRxHu
	EwOLTuX0phcBgmUn6rax5276Aeeza1yDNOI2qdQ+7YLDS8lyFAyD3woDwemKbTq0X3X4ajEIje9
	hrPGs8j+9GUvjQT1Z+9I9avQQ==
X-Received: by 2002:a17:906:f58b:b0:c1f:8021:deef with SMTP id a640c23a62f3a-c246a390c73mr2638439666b.10.1787567201145;
        Mon, 24 Aug 2026 03:26:41 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 12:26:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787566980.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787566980.git.stefano.r@variscite.com>
References: <cover.1787566980.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

