Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB93481ABB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059544; cv=none; b=ldEumc/FtS7IIg3O3gP9kgOHMALy4MgPdm+TYe7+GGECnixt8PkaCtKtz75h53FVzXVib+9VYCyOkZmtHFRGNwEN4wmmOO1jmqN4d7P0RoB9h1ucJjwap6f4c3i2o0dXJviJP+KhnHw2QETdm1HGE+FhO6ctzzdocXfrOixIRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059544; c=relaxed/simple;
	bh=YAr41Qh5cEcbszQriRLCfyjOuqs9uogE8Alk+L/ecgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8SUTyOOkXVj8VehM2lQ11y+uvSReJNw5BXgh71X8dnhXBAAUuvVjycq2gyY3kItyj2akPOHv/Dgq+yAloJqvqhvgPEmnJaIV3rTg5yNGho2ErdpDOUgTvnXKMZpyMp89rqo7/ouvah/KN0r1Vo//eYochZQnntUZpWI6jXLhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIaTOGf+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIaTOGf+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so7844705e9.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059540; x=1784664340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=fIaTOGf+L3pCFzOjrGSNqOb5H+xFYm050wm4eXGJP/H77peyfNqyuFkVaoPdSZefzY
         BpSNop0SdXPwQYA5LpJCW4SdRyu7NSHsHo69HmIu/XC71N9d5s8cbSmNIKcff69LHFsh
         J0EhgnMyfmL0Aie2uQhAQm2EFc+R2ynlY/1Nz7lJNQoEo8uF9YyiO6h/MWCa2Y4yGZFz
         8AUfhguT7Pej5dUIgAHAIP1X9UoZfkcGXkHeJw7Dj3hSQ8iLIthZOx1ikEoNlu9huLbw
         4hvnUH0lpn3e0hB/lUXCGXBly4vZY7Ky+HA6GRo0CzgaEcj+XfzL5ZP2fFrRLeL2sF2G
         rTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059540; x=1784664340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=flFkbSv+MiTaY1E6TUrx+d+LnffZPSL1IHByW1dyiu10JdKHaYYVI7OFH8V99xUN/K
         /rME5esrWVMK55/dLYoYDQrJWd4MRKsWi95PEkdNDSokoY5QQkoiLMjvfn2fW83hh2RN
         VinJsdLNaoCb7mcflRVsZQ0ge1wNo8uMbcWZGGF4e5tPLRwph220N2ZnNMfavlEf+zYQ
         fLBVA0XHiyn1nwaE+lqNPK3OWX6whPsQ6nMFzynVgeNhwGDukioZvUrnktmZziATOQ6c
         2HOt0HwjRLT6JUZfk/6ngh+yDLN1OaZfmVx7BoejDlxuw3UMLRKi7isKa77thFFvyTM8
         1QBw==
X-Forwarded-Encrypted: i=1; AHgh+RqV/sg0FgttuMPpwE1WOFNR9ZpCKFZBIPq5FrJeQcE7IfR/qoDnxYX2cBNywgP9x0MQ5yQU3UoDPHst@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpUYMJRDaKT9LL5q2P+Fhzv4eim9a51+jQgZN6j6qFBmONeWw
	v7L0C9iLQvA7bs3eWTifPcBBiVyq2YRLJi4H8mdItSd7Zi0D8k4/F0Iq
X-Gm-Gg: AfdE7ck4cF2Nq7l1y/hfc1/7NgwZqaEJLKKir4mPnwg+PwBMBLn0M4tELScGPfJUOd1
	BSV4s3DkCEozgAoY7hdaNsms/kbzJKrD+9Zh7z1i8fvLnKwgU7YURe4AcRyy/8W2tV7pTkmx2N/
	avdztk1O67uxBuXOQMNEoylWnT/ERMQy+Ch4Q5vGrqDGiai5IfZ75wNTSL+uSSIvn9MedEwD5Ks
	wYy83YTw3kmGBLf50b4Ubwx2X8cmpb8U+DzARioKfc+53ykVvSxLjm+4Z0PQDLVQFcXAp75bmy2
	SlV+QU725pmcG/uvAwvHiLweBkYYMtPW20oj6+Ya8kM/OXC1WN75DE+0zjh1bJP6ugU8tH0X+D9
	Oxxu5AGAyshBOu8sZEX6tp16K4ah/1VOTHM+Hcitt7EO58vY8w7arFzraq6S+j9xrx/kZwLDsTj
	wa59pLgfhnB88LEG4ynSoBeY68ytV4fS6hQhhGhFtlzODfNA==
X-Received: by 2002:a05:600c:4515:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493f88375dfmr149562265e9.36.1784059539231;
        Tue, 14 Jul 2026 13:05:39 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 14 Jul 2026 22:05:19 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784059139.git.stefano.r@variscite.com>
References: <cover.1784059139.git.stefano.r@variscite.com>
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

