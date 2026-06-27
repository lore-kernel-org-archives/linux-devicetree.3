Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D3275AFD
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571590; cv=none; b=L4U6OEAU93xkHYxTtY5gdWN6dl+RFbT/sapO1VzqtEKX8pAtE5hsdoNGnnh/TW5xwmiJp7TAfPfiqyXLpJebBjLL8HEhGB2kzSoP31STQqS3PJaTGSYENqsGSmSfLAXGYTqcMrYc54KVdg59T7C1aodwnxS+keQb7id7gGcTBq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571590; c=relaxed/simple;
	bh=FeQgJg88JBYiOwtiHClsRnpZGVVpN6ZmFHOoEc/i9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHAgdgotCz621vOeLHDrmnOI8erES8Ppti9XHKYDn8Eacw8RckLQGpiGZwwKS2HU8ERsbDOuf825jGus9qQUhaJkWN3LCH8S94/t+7zv3Pn2N/+jvLAANHVXt1Eav8oqgIxZrBeSF3PYWIk0XmeWOIVdFZItTkGjVDI88FHrAkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJAUAjOo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJAUAjOo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472055b0efaso238209f8f.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571587; x=1783176387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=cJAUAjOoOgsYNGO5BlqiyTd5iwbXbIRRicRxwsRF258F2iLZBxNQH7cwccJEt/cQyK
         rlTk4bhiuRXTxmgSsYisIX4UG2VBAHHAaPaLPnvoDnuAcOUxJ/4OcpTBiFDc5dpGJtw6
         fM1cYjcPH/sC51ErdddEMaZxZTpftC+FfXbAfBLEPTbH4HnQh7dDGhHgYbhJpTm0QKrM
         QxUdDEz3Mm6cvL+plZw+dMH1GtlcPtF4bhZU4214kOeqfHv+pDSNTxXcY1vuKFuzqKZ7
         YezBLbEcVmgs8T+ELexbWnDUu1eaPLMHtX4YvhPXYrC/vX4GmZxZNo3KkHho7veM8UT4
         NnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571587; x=1783176387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=PqoEejJrT9BvSUedQEB+6ceUWCRbLZMSi7S1W9FkLaKn7v31tvebC2PBWFgZRWiCtc
         Fov1str2sSdW9oWsmM4yfoIz938UcEjzmIOlcjzdrA6RiqXU9G9iX43PKoyFMJJjWdsI
         glhjlMXpNi8MPXhqPHC50RNQk4cP/W5NQo2Y0K23VHf75pUZmZcOeQbAEz/UVDZVd/uW
         xFFpZY6ccfGb3mA0Yk9+xPwhMP8vHmhiUpR7wpXhzQ3apCoiFMdkUlQ9sU2dJcDoujFq
         6XXw7ycu65arXubqISvGA8UOFdISB29qIlhB8QV64mjNegDAMeeNtziIDKvCnxSSZOWN
         pybw==
X-Forwarded-Encrypted: i=1; AFNElJ+/lMd/bk2ibdagWmsENHtWQX8FoIvmlrpYFUxkyfWJZVqZWbw5Vwn5osA3cXJfF/3XYQjh/dNe2GH0@vger.kernel.org
X-Gm-Message-State: AOJu0YybDRJ5RVbbBGlb3VSO174KwTvwWk/d/xWO/Rqvq9EwcxumhPdC
	rdnnWsGnzDfYGSewbXOdAeQzJc9GSqujeIMNgtMubAtR7lNUPcM0iOi9
X-Gm-Gg: AfdE7cntRlv7WHow2t28mvVkJuicyEG18JlE84wYXzSDVdlGaquglx9gLE40pfPSnKi
	CdFdc6PLMUsvvJeEYZzwi/VmhiRnPc9IwmJf4up3TNOkrYqrCutF4ED7e60bNVJrY/xH3uYjrBQ
	6FjxzwtUjb90e2jFee8jhEBNiXKOvOskulO59rK88nA+abpChfvaOMMS6jQ0h3ndydYXC/ocB90
	Fz67nEl80t8uOKgcuglZ+K0/kK7G9Xehv41GX9qGip6fcg7IHprQIJcBfcXPe47BbxieQO1Zrnb
	dzRplcZZutjrtmnU2rW1G2DsrEAbS9COAdWqKg1MSueOUyJNMQUKQJNtO3CoLTVo19OCadFFPhF
	nhT4d8WUOvab42Ey/SzlnIdpHuktpzP0EPGbmjv/7p5Xp9d6p17PLHbuCFdlMNxEt08tEzzRRhk
	BEQygOwLsM+PB7Pl3Lmhj9lISA/r2BTuhQWsJ/koencP4NRNFDScYHbeQD0jQODTu7OptvIAgpJ
	5OlpdH0A/sPVqshmfNJoxRaLiWcBukoXG7IjA==
X-Received: by 2002:a05:600c:e54a:20b0:492:6093:8837 with SMTP id 5b1f17b1804b1-4926689a4d1mr117391445e9.34.1782571586901;
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Sat, 27 Jun 2026 16:46:11 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..c942d3d06469 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3

