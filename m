Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF73B47C9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910661; cv=none; b=sHFAI73Owd0OpP68//HxbWhNleK2n09oXWP+jyS55TSeXE95gj3ZoWZpUBltlVUkppHw7X1ubnNK4kK6s+5rcuSTFDJC3Db2XvfcOGAx24V+gEwPBYf/HHE3BysKPJY4mnIz/lGzH4zwLy4r4KWDBdM+5dwE/xNIEhnIjhsao0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910661; c=relaxed/simple;
	bh=Z8Hj+5e3N2+WHS0fb7Cx+3nQ/BevrVz2wjOEvePGYBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSiA3RnuMG31dCnPIwP8yBc0gc+Bp9uOD28/SlR5ZoqF46oC3N3RK5eXRpDzeTNm4i2wyJp7oZLRNam0PhFC9TZLzfTfInIeo5pHPn6Iliv+AOeZ93U67H4qZ/epmG1twUC300+DecAdEFjZXUDZkn4A7r2+NVzHQMMJ0+eN+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV/oHIgG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV/oHIgG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490afc47455so19874415e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910658; x=1781515458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=LV/oHIgGt/f9Vze90FKRH1aKpPrciKHCOlcjxfl2GpG/XBpr72NaUlrfl/7L8VyQKS
         8gVvVn6mzNqQD92U5jMhLo1e+K0zmDQEp53zMwrGzVWYCgW+15Umx7KTwrLzfm43iDEf
         aGBBK4JNwWs9jJ5zSPkv5BUAwHO1QcJ0aNc3Q5BEX6tJzPJJOeOQQY+ZvycR8WgLcFym
         4Aqgnk9X7J4FCrjlhdP7Mx/H+4pVO07yDf2rnI+iYBqJOqZb0OEyz/arJI4qpiDwuV2W
         b8GUKSvIydMVcNwgjSzMnR7aGGiQg61W/HXW4EiZCb32JWUBYxg3SwiyYZDb1+zonPbr
         BzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910658; x=1781515458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=ny8DVG7ZBNGy8nPQCsQ6dN01PkyIQDnjGKLfiTIK5zR9K18k4IYiKzyuMMC5LcZ8Mj
         SocNIi7TH3I60QuuS0ALSep/ufr0ECQaWqyj3n7KX3Gs2lQTSqctoyf4tA53TPZELTPQ
         6c1EERH3EYEqfz6L2TmaRNJNfajxjc7BFANB7kfXdXFvsIdUo++D6tTTM853IG0tsGKr
         6yeq5N1VmD8SqxpgYcb//l50LZShEW5JBQc19fj0bOYBI/oBptHULAEjlnhtB7S1fMxK
         EDqH7JpGMB6NBJdtN6C7DllrPdY559/pbYyIaFNgeVs8nXiZ6H7ToU/lkVpozkPCO4/W
         tz5w==
X-Forwarded-Encrypted: i=1; AFNElJ+vZ2dxUolUc1HfRp0hkRSWuen8dcbx2sgVG00tNJEl04TE9YyBpB5n4ggmjqKbg5kjHWgwwMJxQksp@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+vmQd9Y6dCs/PdhU6cSeyNdRSrN1FVcQYzv/vM+c7AnLRE86
	qzB2DntUpGZUsSrqtIYPj3oITvo9L9IRYGkXuPegpIfWfbIRXKlqZsRY
X-Gm-Gg: Acq92OGv/fqg724tX8Vt19AEYQc4+coB4weeWvJfYvTFZlCqoY+o1BwQEYu6ZWn0l8Y
	jHkS5mkYYZdUN6Wf2gA0QNCo/GFtUwEL0e0ThN6Y845GDcWacBAFd5b8TvvEypjEtCu+RrexjY7
	Y9f6bJb/1WO7HgCQrWaJ88qcCV9EErDS0zAmhYJYdDJaujfc+bGRhmkxlDNjVFEJOrinojbzouv
	7g01SXJ8ea/XbQumg2JNNCY1JyT3YIMhgMBN6AJm8Z97iLohc2knH9ch1s1sJpmWLBEcA9q2GQy
	6KlzbklRoyVQvrsGAowq8Cqgd7gBitTDmDR92BabEuiLYTUyUhwtQRkHXsRzEhcZl5AshRPPrj5
	hxjPefugT/tlqKx1EhQH/XEfGInV9vIG0Fw2cdEQq37Jj7mupI31zvaqNz6M/cvCqeBBHwWUJXE
	mKxVOOBVN/5fxDWZluCYQAQVH9elKg0WPujT75RXtaH8Iil7BMPOGKTxnMSl43C2d9fmg8RWBZv
	KatrPsFeB2P8RcF6rZiBRkOF8q7lT6lTI/rWZo1DS4sNxAM
X-Received: by 2002:a05:600c:468a:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490c2a2ea2fmr250385445e9.34.1780910658182;
        Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:17 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:24:09 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780910435.git.stefano.r@variscite.com>
References: <cover.1780910435.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

