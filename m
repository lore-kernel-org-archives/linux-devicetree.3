Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079044161F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113700; cv=none; b=TE+FN8Bkbhn91mi8HAkbj0A3h/SFVLJuVv3P/DzCzBLvWuYkV/xHkIPnGaYIgWPvIR9DwQ1aTAIzT0GYMNdeUL0VcJAD2vJmp4Sa+J0FU0oZAD1thM0I5WZoE8stA9fVemUjDRdSNXZZg5TtngtuBnz7zq+4Sb9GUaooA6i1++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113700; c=relaxed/simple;
	bh=uosAT7aWpyFdg4cLkRsjxRGVgBTy0TXCm3nIRaZP6zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWHFKb13IWMjEc81MGtfUKoLzvet11rSSzPUUnHYUWB87Y5QW1L9c0cw52WTaVoiD690cx3RBHVltVqsdGgUwoKlBCYCnsRZl77qQ9bp1kkTAQIZRDRQq05iLHDkoqMJM3MOz0+/COA3VGlSppRQ72bcAoORnIwzEe6pMm67a3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1I2agzO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1I2agzO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ec555a26so34169025e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113697; x=1784718497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=i1I2agzOSI+2AjWpR8oNvA76yU2j7ghOskUK+U97S2fdGrM/mo3sTCPn8Qz05XBVCO
         7p/WaVaVqVV5IqAmSADZMMwHy1zmesLrIgosGzR1vULR6e3h4FLNqgYKIWpea1kgOGYQ
         G5soKQ/gq90g5E7WbjpHOGNnGYINUtVdFGflKarCFGGbp0YVTW7XDG9skCIu/qkrlUzP
         OmBIHP99sC45sJtg2YGK3YR4pqAEay2VW0WX3MThIBY2utGkR7KWPB3RFDGGRpEhS6SL
         SWoQI6O9PajmKyibU2Uk530vy5Yvz1N8jGeEZEseUuVRYWaIJo/Jd0qhdjeudeqU6RUm
         rtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113697; x=1784718497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=FnJ/wDLkENO/mwqiRCLdKcR0g+L4YIHZY1U7PUgix/zFHJY0xJcMwPbAuVyq30unWo
         84pgYdTbx5Iwtbb2xohP5O6/VYoCOQohqZajiqmiJyGT/5ju6/dLnFfEzW/TzmJM0/Hq
         Po36wK5teFi035gUvWFchS4oew20SiQ4ou/2/NEP7/ZKpoWx/nCUNUHsT3fx/WiRh18s
         Q4Gwu/J9q9V1OmM9PlRmckYFoyZ8mY/cyk+SY7faMzUssoDfqjwhLp8GDY5wj68KrR4k
         K66lPRwLaFUhlL/h+XWhWlG4dda5AYm68JRQux3QUnz5a6ORAP2tsXhrrs4uK4phEf+6
         MWSw==
X-Forwarded-Encrypted: i=1; AHgh+RrQJIoCyqkVk4iqAqc2WJmOoKkFKiorGBlsEIEZdRl4+osrfmb8XQIo4GcGFMbzK8Q+QcN6FdlQjo+2@vger.kernel.org
X-Gm-Message-State: AOJu0YxWjdGCCTrV+hVXI3DianIma5Iy7anMXkHZClm3DqvdbBiszAQM
	/Mi/99EQQ9I5lRcYm+Rsnd/TqYFcYkTzprtFZgHAExAOp10iHe0kOZ8R
X-Gm-Gg: AfdE7ckjJO+OnWxfB+CC92Nef6OJ582pyR8LJTgrqrOtzj7AU4+0w9lEUn5Dh27De62
	0drJPA1BJZURmqSynSRwzkqx4eFElxSzOjgITFEBk4UmipNQQYpX6BkM61oIro9pd9rzL1eMmPi
	HxXYGNcSmJTdt0DejYraJCPlgmwx9lLbAqkyYZrG2UOsafC+RQzCHGSLsbWjh777XzzmGszeis8
	zaDKdXgSp4n62N6bnp9/O4fYSz3z/R6rJ0cTnz7ueksPHjb4cMkovT6zLW4l+hmnOts03eWHXgi
	i/IohXNha775iXvi1xGiqvR4YQWAuADaubT1qj5ioaSL+voMXzZWUBFtJIbfrJlEOh9JbkqIa6b
	RDRJ+z3vI92o8+VAEZAfb2osxR8nE7Xoi0DnPjOHvTeGLKUYrP5ePagJrZdrMl6ldWlVrLjlqP3
	smpRxQbO6bgHBHE7QDr2RFP+RP/rH0ZU2vzfv3MDejMJGK6HGyrplqb+Xrdg==
X-Received: by 2002:a7b:c5d9:0:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-4953c27b35fmr19597025e9.22.1784113697474;
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 13:08:10 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784113547.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

