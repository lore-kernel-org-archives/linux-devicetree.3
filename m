Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1F3DB30F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180656; cv=none; b=MQAGqmbophpCo5ZDVhemKkSguq8dCS9GRMWRH6DkZudXtPtG96nv3nGruLS8XM5lA90Gxcvn2bavcF2TTRurxI3GQPiwQ8tgFd+nLfRHCrfnHR6hTn2IzCZJvvujSN+k6a/fWcqMWIvKlrQBWWJuVN4eWPeNwISgzB6oF3DOZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180656; c=relaxed/simple;
	bh=UMMlAQQ+tHH37+OZWlXTPeJySJPPJtpz3IdXhTev4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bqblxv4bNVQzFQa1XzcGU3dtVZ2U223/dFQxPXNWhcdrStLTGPPFCn53ogmzGMw2Dlxmgap4mCQxzkb8oKqLUdC3hzDQZsVohxjV//Mfi6L3Qd810hBMTznljpRoV3Feqd/Fxq+y6YOrfalnTutxiMF/nAPP/Ft4NaRo9zdYdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICT9KWo1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICT9KWo1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so32654525e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180650; x=1788785450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=ICT9KWo1jSna1EiWyjW4N8n29YMlZPc1nYVw3M4p4qJO72p5hhwjoaANcTniWell0p
         rXzUyePCKa9IctFJkM9EESPyQn5CcVnXlhP0EeRijGm/58gh5zlzrM7AG0iexig0q2Ja
         c1zMbeRxN6u3tz6DRmsK6B1SY+4QKQQswHdeC3N3sIFPeqGJKSD0cucIzwRLGUFGDnZi
         ZZUzO5rBWS/bPfty+u+ewKbr++xjuvIiubj8HwFGS2oHXuh4e3+TqFYsXfEx0qg8H88Z
         cNVjWBbHiC/zVbl8lkGJJueoj1V+Xf/1S7A9RE0Tdl/gZYeAm0ZZJs4joC7dADTxRFrd
         NOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180650; x=1788785450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=pfKqmeML++2FQsnUiWU/fdU+1iDLuB+yVJQzIpnneowRmx//Urvi4ErXNEQyXfzo1D
         AojtepE3sgY/3Djo4v/Duk29zDxBQA4N+mtfQIZSCSeH/NLl+xP1oVo9Z+TBXw+ZGFpd
         rtSzZzNoim8u1BPG4wED2uSyQC1D80iQqQKBO1E7cOpXxMDPKGQgOXquXPe8465hP2K9
         fGc2dqEzIMPc3BN6vibsn7+3IHxOCqNI71oJb3Wd1PuywN2HAU+vWgWueLDDTaI898iC
         +r/XA3p/yS/AmM3KgWPm8+EOjL9qivY6v2fZHCCU7F9M0YcsdVB3mU7HWPT2XOz21K7k
         t55A==
X-Forwarded-Encrypted: i=1; AHgh+RrPYvMQABZEgZElmbz+sMfB9UylLq9oGjdMel1MkHRHhSQbAL2GVcRCugzyTA2VPzUQmCRIFY5aPG5W@vger.kernel.org
X-Gm-Message-State: AFuF++m/dnCefhw03fiRIArgh6+cfjFA5E5uqcr+UhJQtYYiFf5KSvsY
	jSAYzjkxoSlvaiZ1GFExe+246f7ouATIC8pU74ZCV2zlcF//9iTvDpaT
X-Gm-Gg: AR+sD10iC23DXBHU1cENWEPXVsjoNA0x5kA/mZq1NOelCgA2rZkzxUjpX/3WvvO3LIC
	Ca617S2cxQXja35rDG+t6coTLULBnoMBniD6LQRR7hqCd5VZJ8K+xoY5Yw51k+zjiqPcgvoCQlA
	TK7CjNbpUDOc4UmdGuEFdUQNeQhdwTxglxaVGy0n0NxwWOIN1xScF6GzvGoIEgqBAlNTtqP+ZBL
	3gykdskwq6RYHPeaSZH8JaeItzrw9cY5clCBpns//Wr6qkden4oV2be0eovhkGpq7VWpI66e3YP
	ZkCv/LF+2VAURljJ/ed7nyG/dUXz8/D7nt3adB1sgix4zrpuQZNvjuuTc7KzwyHKeRvtWTtBk1G
	R3hC+Xi0gi0Enhsbpeio7WnPsYHneygyHWpotdavUGDiGEK7CkxQEDQ783u6hJolx1ECTdtle+q
	Q9JjlOZIflguTVsk3R6sF2cU/V/Iw+XTl/DKfK5GmZNt7HCk23IMfkPrkXbXyhqQFdJBGM4a2Vo
	1hwkqXP6PtR4PRfGVVlTmdz63++YHrDt4hT
X-Received: by 2002:a05:600c:3145:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49b91c44f6cmr384483205e9.10.1788180649895;
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
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
Subject: [PATCH v7 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 31 Aug 2026 14:50:23 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
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

