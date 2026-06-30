Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3323E8355
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812825; cv=none; b=HpBgWSu6JUZP0fkMaXzKxlE7oz2Hfa5w+LjuxwOjpOKRF6q5B0rGfgtloub2/XeWncxwDu0Ll8JV16ROdHoMuM+8aGChai9JSZn8u78/gBOqQFb5OC+/x3wMfYv+HdIaigSexBiO/VXNTw8WJZAAHGaXQTI6RiJply4EhM2X3C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812825; c=relaxed/simple;
	bh=rudvkcaRSOiNwd4DxblHsmzq1p7R4SyKRG7f/vefWE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVPok0zO3Y/OmypkEyNvfKafvtHckBzuk8cCfuUinPHZfoHqmvYb5ogtONVLUS6IuhPlXMNIVOIafkNJiFAZlJy0cdFDI1WdZtdEIRqGQ7BrecOcKuq7eoYiacDyRzpCBOCkQSHkexWgOow4iBzS10W48n7h05bRhtFvuVpSoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjF0HxtT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjF0HxtT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-472055b0efaso2104690f8f.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812823; x=1783417623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=EjF0HxtTGMhuXQQw4oq1us4uQ29yfmIHsn7akrJw78fpAPMjYU//xyN+S3XNwykSml
         e41v1mdzzXB6F3dtYbmA9yDN4IhAIH5BeuJ1C6DtsdxHTET16amIGCx/BGCkbXt1daS4
         g9ZeLKcvCJCHJhB22iOX2Fn3zpD3pOY/atSbpHJvNZTzURCaUYdE38/xeCkuNexlHimT
         +pKPjT3sBljgkOm1jJ4tjP0AMTlV7NgMCGDqMlTjuWxnbcFwa+1dupXSv6MZNvfycrRr
         ssBV8z+e1DYd+WzWSpniFOVbklETPrmjiPkGcmVn+xdhmRlTton9Od93TzunGSj5FyHZ
         h1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812823; x=1783417623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=r6Dg3KjOQsYgxvXgPKuVE1vNiJmvwJ+QtxRTwqXZoECwEbj2Ij/a5TnMvnXLNV6elk
         exyHpiB/yO8ugVM0eCaP4gfrWV+302k+C+ozENR1yd8STi1LMtUxn2PBGROlWT30hRLD
         ubV9bop4yGPDBNV8QE3+IK4opnkxtgOOt662KPQB5M+C1ljvGnScFUT95Vjg5Phj28hn
         JWzyGyvj134WjLwqub8nKtajduZURT11JfzgLtuVNntk99jjqL0QKixQJDkAm+KqK+t3
         7S4Pwjdn/2zBgJn2Be48OqNXCvsrFnQijkUOkddA78tKKPp2/QCrmqGo5kRcGGoFxsFa
         Uz5A==
X-Forwarded-Encrypted: i=1; AFNElJ9YMA/fiaXttkNNoo9SYuLPkqJX0YLtszHGhlnDbrmDuvJjg5/YTs8nTU+0Y3tEthaug7Wts+urVh8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1Yo7meGNCtcsRb/vOV85QtawAh0o+Aq9B2Mk/IBAS3zb+yj4
	cRluXOYsSy8Hr1Tf6scObYTQCfcoNB8cvsWERle0/LB57NwBT/fCZPsT
X-Gm-Gg: AfdE7clhedA7YGsip1nlwX5b48iFJRBDQVZmCunnNcxKgCRWhQsZjarEvdWHh7zSG+K
	pT45FANZxqazVobDom4DGiYThqBCkUTbhlM1MqhYAlEGeefHAAJ5gRt20LFfx+DdOmxlhq0G6dy
	GEG2zA7FslyXNxP4p2ScLmScdWWFxOOj9+9JOwjOtYmaxVnheXvoOOev5FK5JRfHJwMewxdBsKC
	YnSiBvKtpZvPF/0er4dgQXtt68Oml7Ucv+mOVhQM/LTjZzXdroCuK9M4QKvhGqQZqAVD5VDkOvt
	8eUpkE9gZs2A1+4PLe1P4NIj44RV+/1ccyoHWhSPZeKr0aor232qwUToS09Rg05iOl4rxHI1TA3
	JKgwdRezRlV9xMtOxPwuTBFexzFN4A9v4ib4d9D9SpEVOXA30zGMTQTGrNB9yjZmhjR5c5zaxXS
	8Oyt96klIwuby/aIlgNsVoURpfQB6JBSH4B6SEQcs3k6xSYMKTOylkZlkjpg8gohJGFkWHUyBgY
	SgbIO3bNxwRD/CgK05ELI3kJg==
X-Received: by 2002:a05:600c:4fc1:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493b827f691mr43818955e9.6.1782812822376;
        Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 30 Jun 2026 11:46:54 +0200
Message-ID: <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782812572.git.stefano.r@variscite.com>
References: <cover.1782812572.git.stefano.r@variscite.com>
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..242a58eeb314 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1369,6 +1369,12 @@ properties:
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

