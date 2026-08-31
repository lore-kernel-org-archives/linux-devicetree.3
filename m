Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB34395AD8
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216948; cv=none; b=n2irK3pQBU3viIkWsmIQVFQE+5+bvZDzixgYnV6mYVfK5P+znoaCfUtRprzA+lA12uRRssSgJMPPlH/Kdo4MOAwb6M6ZVdRJAyydrNTvX0TNol4r0L87+O/YVTctMqRau0dNqJDEfdfFOvGXPRNSRx5V5OPP1rv8tCO9ZlMfr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216948; c=relaxed/simple;
	bh=dhXJ+FBhl0dUtNLwfVJ2+FMZJSif3+49a/oOSrqpjqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTxcvmSQeTHuaaG00HCf5LTKqh7Z4RcYRhL4BR1dOnJNZ9dQvz1Y7AJTCpdQWEdVNWbqPn7iSyTeFpa6ebM57rSbc3gu1OSotEW6y3KYrLWzksxtZWDkckR9xyAg4ys0Lty6BIcdDBBDD/Hfzy+qN7S0hRXEWGSf3DUVZ/lBXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiT9lVrH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiT9lVrH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso1828065e9.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216943; x=1788821743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=eiT9lVrHqHOSMZk0XfQ/IlzKn3vvT9YUy/9eWBIlmAyalbWf6sJPULW4/YeAx7K5IE
         TZVgW5G8tX73a41KCXPnTI3UZQRVi+16VDRa1Ba3xyRk1GMLiU6KbTUHSCujSJCxEsNK
         7cKFO2flcCfw+I1J8w34JLLtgD9HmVCJ8vwzLSAfcXIKbciAYptswSSVpKeFvBxX9f1k
         dQJNeivCal0gYltHC0Ow0h87clATdBIFSflpJJFiNbdvERYuX8dOGmhQZiMGbyvzpuUJ
         JHHmnxTIHxWUbm6G/HRTWOo/zNrt7zII3tWoIoz4dvhYUrwZ8ycid14+w9mDqyQztSkj
         xGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216943; x=1788821743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=HCbmeUdHWbSZbrZPm0s1AnPcvyOKbaXv2rk5VDEOKQe56HiLwRvhbvaYEl9v3/eKsr
         hvtO+3CcQFFy5yMyO3aejI1AWi6TXIDNWEjeLgqC/EHOpU320aWYZO5iMDPyJVUoqrH4
         324estueUyIBk/B1EZ6XhbjTOhrflaLO5vpKk3b1jVvi5A5fUU+9tEeekeye5Ze3CEZz
         MYLm5u9uemM6Mi7DrRC471bOP4shw/58HqS7IW5WLSxdm2TxVF+GQNupVTq1XrLMuSDj
         2rb5FX4LMU3PS6Mo7MGxjpL5lC8ccEugEOceHhPeFMrZ8A0mT2lRYqOooVg6rwolYL58
         l0uQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdsMZ9Kjmy5QkFR6LXq+eGgykScrB8MEj/21TYr84ImGeWoBZ41VBMSLCOuirUjfatlAZk9n3YRlMH@vger.kernel.org
X-Gm-Message-State: AFuF++kcsG86OrZZBD5XqdMcCARdwrQqxQyYgGXJo44PQGVa8DusMOzV
	O9YfuESYcxiqDw43BLfDn698Oj/6bxdEUkT0iO9ACc20BHKL9FW5yNZJ
X-Gm-Gg: AR+sD10KVRKmnDFJ8EfwdmoCBCdA/4V50iUz87QDLQhSz0DduvhIADC/RYORwulr6lZ
	Ma4Kp6/lnreICpG7JytsYXiIH1VzZUPQkc8alKJrtg6idf0xe+p+duL/YDJy8Lwghy4vRtGpPJ9
	jZf5xX+VLIqI9AhodOuEoqmKolKYQxhdGI1eED/oWM3Yyw/M6bF7u4k5eMkrkGzqrnJgGoEIfTp
	OAgiTRq+wkSyUncBG4O9f4NANYhyVK9aZ2x3YJhigIwUveY9JYuWIed8IY/gR/ZcQrDKwA+Ve8y
	G9a05FnKZyT/Qb9BjWQxhq4dXQ4ksJATG6rXG+8FRF8bqQ4pi4oBY6Ijp0YIJAWYIBnMz8DJzBA
	eW++TbTkdHNVBe69hdB34yCSUQO2CZBOh+UOB4a4rnkTZ2K+OTp6bRBzDSheOGM2AfKF90jodaQ
	ULSIeCyBJ0WGnz1a0AvkFsQI7xNFVG0NFHll1tXpzS69ioUcuitGbGHAFn+3GpQXtNxKK6j3Lgm
	AlF9TPyjOzaiSIutuqerjnEug==
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr399173455e9.10.1788216942522;
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue,  1 Sep 2026 00:55:18 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
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
v7->v8:
 - 

v6->v7:
 - 

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

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

