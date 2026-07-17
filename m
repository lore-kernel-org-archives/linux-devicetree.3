Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B73DDDAA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284189; cv=none; b=tr+JNksbGpdZnrFC334fkBpPreFmxYEgtLzovVcf3JTmxxRQwwDipjE7oW5xUMeBL5I41uSUTaQbURW8AKJ+yPs+dwnu3wO+AC4kVzYpQ1AF1pANBbb5TnCG9ul6evsQaYuro3SE4Z7Y9Rni6iWqmV3pmRNeIypvrU0QpIOBzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284189; c=relaxed/simple;
	bh=85Z+ABgk8hWRiWuhGirsBv5g0ll/rHLrkR1oDZSccgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiYqdMaqqHPP60z0WEB4k7/MBadwQtiRT9xhjMnn4C6Qehr/qdXTtDxxSihl/8UZYhJYpNnARf2gNU/yCHilqC+tAFlVCSES+UupZs879lgG1fOX7dWAtPBuivfzpdM88QC5mUBcOkUb9c92qgPwt69si2VjwgsTcFKIcjW4zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUlpRXNj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUlpRXNj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495441b72ecso8338405e9.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284187; x=1784888987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=qUlpRXNjdoR8e/qO4fFIibl/Uaj50owXz4DWHfCfubAjc+NJ+PibedmRURaugA3i0d
         1OuIzA2IavGTU5hmtUafUu8NWI2Pc4XbcC+TIQqiF+CoslJ6FCj0yOE1Wx8KS2H753k4
         M0MSydoaCtlN6TE/lRK+i9vITaenFT63dfta95/upImenXnKHx3OEvHF55qjYny4o4nh
         BDUPsmd70XGn9CnYV50masEq/iHNi/2JBvuN58F77DRKc1DYGrKIFkIBjcL50JhpOpoo
         AYcqGW8gWm8eIi6wGK+xmXflL9GiIOuwKpMBsldNmS1Xtt/XrNBjctg3FrkjSDZ9QqAE
         pCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284187; x=1784888987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=il3gNTYTw4NoLonzHzrvDGupcyw6XEEpTfQMwWxUps41RMZG9DcZaY2s4NyLSMHrDP
         b80bzYePMGz6yWJ6EmTHs1K1mWkfpSx74Pv9W6sPEL45JJiFnGp1XWrVHnb+gjY3DUxN
         MIa4zVZ6vXN7V6S/ehwrK5XKa43M9kVAvR1Nhju6rbTPQwhU5Wsn2W3EEKgrdbQSoMMk
         XJLzt0G8Mv7Ek1zMgPCf9VckV4vJCq7kOEpXb8rE/ne36cGRkKXfoEMXYmFI3dHegISq
         VHjhjItCGRmYfCd1ANQQyRzyAH5vzspBzXkiRMD3PDJ8Qva1hP0Vnns4UiOwr8sEcPuR
         DbDw==
X-Forwarded-Encrypted: i=1; AHgh+RrgLXjnC0e4YFOvB5nF7C0KggMLCFKRr5chv92c8bHIQqJeodB8RNilt/IktU8xlDjKKeQeJjdPnQpD@vger.kernel.org
X-Gm-Message-State: AOJu0YzVP37VV1T4BPkNGqMjuTpo3bhMNUHRHD8Rs+LSP1RjX0aZtjmn
	xwuX/0dy5XjPpHlsb5FfvHXX3F9zjZts64KjDWJTUule4HCTgDyQFnMd
X-Gm-Gg: AfdE7cljuocV/XYjuGgk7CC7x8Vki1dc/K/BkJSD7WiDMqHjn/i69hktedPG6LWM8jg
	JtIVKgiHV6bwRuZAAmuo3oeAzCIO5Ubr8QGCJCx+Di34L4FY/EZ0VMuBpCVrLe1GISSGlCWThVv
	BQGzWFjWcEkOcfqiIFFN9l7bujqGtYQe/5GwNeERJAM+YX3dtQ2FMpEUcsU7Lh4ywoz0+pyBji8
	V48E6UXAsRa4xxfpUZd0AV9TRgeST7tZMCNbof8TX23HqxIooKkRGKU9re0+c4oHTsM9hNbfwXu
	USRzsEIurrDhwjS/RXbYgYePmKgyqA8QzFOgo1n+E/2haHJfucTihgZppQ6z1tSqXh+lzICwJn2
	A60U85EWLLixeYLGmDbw1fgNzWM912R1kmyK4vWornRL8GEyS5XHD+I0F6TjnCQPZkP9jFOxBgu
	B6JdsEHiUmVA6lVtEOU785qBryxduQDWYpTvfPujJ9vuXjchsUwWxGBhCcbuGzenYsW6ufAFgR/
	CyurPx6vfMtNbY=
X-Received: by 2002:a05:600c:6a8a:b0:493:e46a:ab with SMTP id 5b1f17b1804b1-4954c9a0684mr6578525e9.34.1784284186204;
        Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:45 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Fri, 17 Jul 2026 12:29:37 +0200
Message-ID: <488d2b31400d2814b8c7d61fafd02a7af5ffe443.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
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
v5->v6:
 - 

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
index 7b57a6ee1b50..52f08bc1f8ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1393,6 +1393,12 @@ properties:
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

