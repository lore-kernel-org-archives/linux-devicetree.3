Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD0425874
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142569; cv=none; b=cwT0X/Nt3f+IsLBG8UgG9uMIAuMeUVPuUe49iod6OphPSppvdLa2kcU6B+jmZvRdde7KeYQRMCTXbB4kJkRxrrxohLgnB3ymyl8sMUM21Htnya8T6V7hU4QWXAaf3Fww1ECICKyU6pLT3R0tzcvOik8p39woY9Zj46NSAfzCV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142569; c=relaxed/simple;
	bh=499YfWkvij399Lmn6MOFAkHTTMRp3urw72VirZ12gVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lu/sASqqvnUFti8OLdarhuD5NZPxmUWdzcWa1dIS0KDNRhnUi3cxbVGwzPt06IYc4UsGzHX5L/yTlgqLFZAxZN8xnvwuAzCdB3XjYG1CiMdfsSnSrVZjEDwJsHHBKV+Rb83RQTqSt2nrEQG1YqoVxVv1gVCE79ak6sx5stFGk6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a75e/V/s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a75e/V/s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so11693475e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142555; x=1784747355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=a75e/V/sY8kDO1MN/r7AUGVxXp6bXF7qOb2GVleg0h3hu8TK+OtnzwRV7bQ/G1PueC
         EbFkClvxUoSuSaeaP1ZCAqnUuTBDyBYQ/iHFhX6nW8VCr1HqGZBae3VwlLXaBUz2n++3
         AGs4Vts/iXxDRqDk/Bw7M8XS7DsJaxpp0iT8FIkMJqKohgELjTPvmtfiDoVi8rBXmA9s
         OUXyH001n83SuKSk0IaE0UNxLvdu/DzvrsENbnvdts+Ld3G7arFN8LcODtPrJtJgQ/2o
         zJoc8HS+ZoZWR4Tu2Klf8/YQanFORyT6W8NcaYJlJPtW1tSpRc/KuI2LbFOn9zHCAQzU
         K3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142555; x=1784747355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=kZOot+MGHvI+ty4Ixfeof0ylwAi0VsCUSjv4Y5iYOwjepLdyjgbzJBvCXduN2nZcR1
         rTI4xMF3ugx1651xMO2HVu3p7rwgEPIzH7Pe6JUrVaAXsflbV150PyZGNkBUvOzApjy6
         1jhIq7Lb3CWiEyzyz2i2FilXjNbV5dmTGWRPQYLBtfWLq4YwdpOx4jITmaKIgS1C3MhM
         IfYzlbF+zTTOzwB0G2ui2peU3xKBDQw3ZzzNMANyOxovH6WEKRJ32fa7OPGmqzKX3x5x
         is5zWxOvt3AV0U1OYbiM/vYzaFgx7+Q0IgcttdvV1I6fvEDIWh52TJ5q6iHmdj1DKh2z
         2RNg==
X-Forwarded-Encrypted: i=1; AHgh+Rqnd8iZvMS6N9SvFkobDZghZqkyZzETbOtPU8eag1vYGTRLebfeSXO0+IIQ8h5rwgoyXTw2HLI/kje9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuCGUBbxVZkIxW5O3ZHgrmaQz/ozmojgWTSYEkSCK9icHhXCn
	++uXC3HEPCVZZuM/BF1RSn8W2EVHX0qupIjZL3ek2sYXWl6est1AIija
X-Gm-Gg: AfdE7clvQMzEeh/bGSU4aCr8WxFNFGxiAJAs0AVcN9F5AkFfU24CihZVk0AOkE3NC6a
	hFLW/57tAZuy47PNHabUwp0CxRG+CogLSUWFp5EkpgDQNKYpcUnfkN2GoX8eaPJJR/SlIXM5iIH
	uh6zzytbmkUfUzWICw2cjzYfePoLNLE0s0rkvgovPksUVocBopE96eH7t+z2ly62hkfoFigzTGb
	wOkmtPNr9IssfBz6UIRQdyo7oSdzvyqttGG0+qZqpO1GTnY+ZZDx3X80zAvipEsapGD+bSceuA6
	TnuL/BfpJJ2lgX9NzyCdpnJYlRrxrqkWBD1WX18Wy6NtnKiqi3CkklN73ljJz1VVVxVSCC+dS6K
	TOUbNp298yI+VV2XHye84jBV/c7e5NU+m0aVNQ/85cOE4xQhjBhkgoMoJNpizNbRtvYeT1L0R9o
	xhQSZmahHLxp9058fgBJx71Kq/RQC7WjxKu5sVaJNv88TvVZ5IAUtXi7CQ1FkTjAr+hKNr3o5jH
	O5/nLAiAcqzbndYMwr6kKn3EA==
X-Received: by 2002:a05:600c:3222:b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-49540d026dfmr4161485e9.17.1784142554590;
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 21:09:07 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
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
v4->v5:
 - 

v3->v4:
 - 

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

