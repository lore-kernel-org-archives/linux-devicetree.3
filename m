Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57F3D75C7
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602552; cv=none; b=h/8P5SXgcb0UuRSqQogdOK9UuhUGSIMT/C7y4hZmJb3s2bUS9uBZ9hBo7Uhm43JxrjVk1SlFr/WKzJb3QqRv3FQoVu3LD1J+fDoh+n56NEu5+vnsJN/5vGwPq2Esvq4KNTNCVpHI4pu0H//o8avh7PiGxkiDP0td7rHXW17T0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602552; c=relaxed/simple;
	bh=MD+LJmBuapYGYohmFCM34XC+PHUdVk47oSaXL3c7eyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKSBjwobgez9BhIZXI6sKykWlfmNLAMktVEDV6uG3CKQnCRaq6vfzeztDZ312TiJxTV5b/G0U3AC8XCcAgerlnZHqb9nhvFbl8mmqF9w3BW+1dcb2XEZvPp7AsnPLlZbOqq4bER/4Dl2v44tzJiQyG/t0Mz6TunXNRgAQzo9Pgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRIVtohL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRIVtohL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so22541785e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602549; x=1775207349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=TRIVtohLesuYmKS3j1Q8WlqPN+XJU5lMK36asDtiJFH3srx+Pltd9Nv4mwX7+VPmt8
         xZu7CgDFc7nPcEF8V1zG3JLwT44UnTIQJwCzTG8IZF50UPev0+S0yvTfryfhK/WJ4VB5
         QcddogsDKcMeMUGALr7q4J5OOGFlGfYrucDnhgvNKkf8atJTvAv3sUyEYqKEChLlYvoy
         6bBNip/m6E4+691Zzlh3SlwPpnSbo53WCHw7NEKoqJQPwp8RVkkg9amWL3w+l+Alj8cr
         lWLDty5b96MxoaIO+CzKrY8fgHM6PpkUkS4uwSd3IcNtGdi3W3STtOufTvdh+nAAJdHo
         4ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602549; x=1775207349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=B01fSyN4oW9yRYDnTY8+NN48zn8Zumq4l2MqWdQDKLDtUQenOGjURCSzV36r4kF6GI
         GrzDwDlyUMSj1ibD3RdSJhqo85eAOSP+NJ/p0l9dGfQZOgxk4bcbgxCJKL1TD6J8urtM
         9Pv9n22RUlWTKQHR386ct7eWdTPmJezcSmK1VLkLaVimmS8HJ/tprPENuDcdil87WXDG
         xmAtdhO3DJ1sI/PvbAswcTOAsmQ3a7uHxxesU2pgMch0Ik5Goo9B2cwhKX0KhRgrf0UN
         EORd/Md5RAstzK+pOFxMxlDd20fuLofyGTgzCirGEb9yjKbVWVV5YWuuqB8nifIzYHvZ
         4SNw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/e9362Q9Cud+h9Kije/uP+Dwl128Qwi7/8usdLQUasxEzMycYwl+XeZ1pUWOUqAcJo5aJjlyrtH1@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVApkTsI0U5Pkgthqqq7mmiWOd2w/bI7hdf9g9ViC6A7e84j/
	rJSyybSlhZCORYAXJlppXq0MAMPEJL5DETEg3S9mYjWybBqhn1prWtS3
X-Gm-Gg: ATEYQzyP0gaQJm2pVKoDndeN5sQvR3anVxNJtqi2FscNa+CotR8l2RtsbPmtpdf0xwR
	Tu2a4bv+ISlXFAtbarYFn27SQBWMSCX4w4daAZKU1ZAOtFwUcHL3rlzo5oRy5rxyL78BHbySka7
	v/N2mNVvJDVG/hTKoFvBKRi09L2UWKJAaSiEUt4USLXUB7ex+IjR3/7SLDg3zILFFTBXoWk4Pi+
	F3XPYtNrEdD8xRHJDgh3YmIz4LRpa2tBI7HZqwIW+9498ZEP/c3uPR4bOAem5reappBGAU/vOfS
	I7Ys8k0uY6bWvmIpQm9DXfNk3Y19Ejeo3Nxu3vAAE50ucBiaXgwwVL5ws4FM9fZZIdGgKeFoBRr
	MCTx8IaDeYNEizY72x4MYFRB/4VJocP/iuZ+lr05SNEIaU1e0a0PnBbxBM6iexTt1o1w2CnY/Zh
	xKbgBOtW13XnWB7uy9WN2MfZ/4GW+QIOG2YhERtNs+4iAtJ2tUzdMnM6SToCqThfAkvTmlHTakC
	la3Y5Ed3gtqs3ul3E5NknBIlZuEafeT661LIA+amxSkVNHO
X-Received: by 2002:a05:600c:c8f:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48727d45a8emr27743245e9.5.1774602548846;
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Fri, 27 Mar 2026 10:08:54 +0100
Message-ID: <e87e34976e87ff22e0739fbf978ebeeffaad175e.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX93 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..77497a261fd5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1587,6 +1587,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite DART-MX93 based boards
+        items:
+          - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
+          - const: variscite,var-dart-mx93 # Variscite DART-MX93 SOM
+          - const: fsl,imx93
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

