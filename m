Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90220C029
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540110; cv=none; b=XlOhYssO+HlIDf7q9NkIb5ZMX9pbc1lkB+xWtHBBnSV4RLyiALRZMo437xDiBPbOdMs5+6mVL6bpZ1giS78/sRfFFBfbHbOM4H8PZX5KHKN8TktbgJSUv4t72QFyzfqIeOcfrlv8YmEdzknrq9t1EgDKtZEQ+4r+CMONsL6A7bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540110; c=relaxed/simple;
	bh=oBV5iKDKpEOL1t/HXBw1Hg18aSXy7dOvz7mlaIaJkss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIZwHl4wU5MQzYccGlZRH0Y6lilquT3sJrMrPdCjXohGa5Rb+7WGq3W9+ouSvlz9raHOtQG/r1zGwlyDNnSZExdxixzuNkyqemQ6iBv1TN9/jsj+GNt8xWRKo97Ccs5TPNwLSObiB2S1qnybB/YTYCMDiNDrsUTAisughYcR1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0+ODNcd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0+ODNcd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso831828f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540106; x=1775144906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=n0+ODNcd8BNaQ/jK7XQDYBjf+zLRVu1lc85oIHh/0K8h+nTXsH1dxPm1rK5D2yWyhX
         2C6M3hApj70IVwGw4Go4AKb/u5IGNag0xwrwKio2KcvlrAkHkz32SPMAq5l15IfXzONm
         DutfekmyCUbdoQUgGkQmLwsOC1kzRZTgH6lnVT9tlL4lQBFJGzya7vi5hHAFh+fy1G4T
         +79TvEUKHnUOE3UUT8ncARQ5S7ADtYrlzZIrDpcNe9yg65/B7NITKkjFK4dGxQbQVCqI
         NctEczodPSshdDGex6EvDt1A4EnWQUQ0G4fxvoHV1vRvs4fkqVnXKH3ncwrvVJsSo9jP
         AtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540106; x=1775144906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=Dqecqf7irVEdWko0ximKFwFZO/T50sGNiYO3aU9DMX3N4Pjm73hmTCCjmZrGVYpI1c
         zQpqwreP8AmR291AQPkAnop5EnZNe+dCfO9p7kGiZzJEzcUF4ccfD+utc/cjK9xCr7Pi
         1aNp/aIkVf6csuL8blA/aZRcS1zs7Al0yNYIjFesNKMnU5EwqSKxQe71vQG1BMZU7hi8
         yn4HQgJcS1T1RxJZW0GmlcqXZaDNCCyxyOY0zNwvJ2fP5lXkx8Np6bVQVp4L2WxVDVfX
         JjZbI1kyDKUiayy6wTjIriiBu/4ObjKpAYvgBUebheklb8PgjSnJSK1rsBqDl64rtGRq
         iD0g==
X-Forwarded-Encrypted: i=1; AJvYcCXVk+aFJlzGu+DN7mlE56JsCOcNF7FWrIDG18qvwSQy2zILdJh9Lws01sSErp/BYmGCLjRspH0wSpWT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nsil09cwdIrrKFD4Vz7CNdTtNedzobgO7vjDVe+HLg+8h9Op
	O2i3cA2Bm0iVPJy8KIV6ocDRrMYDotOQNgAgyzYVX1x75s6dQsjPA3T0
X-Gm-Gg: ATEYQzwhrf66UwRN9iSDh1zFx27FAeHTdnFl09iT5zXcqNVCSA7xibm1L4BqgzRA+JY
	OB5m1ta5jAMO50g6h4d7L5DKYakFZ6zHxIYvUt83d6y6uJUMQJl+M4W3IN/5yblnA2UlNJp5tgk
	rDPHj5sTdE9vAbWVT1hOuKi6IMlMWFOWnpXx8nLGG9DCD5EWC/I6IXa9aBklAE1cZO1usDfFHG5
	F8LHgw3BrwYCnyGWPVbiZhp/ToILVoDlYI/Un+Ka5LKHuwFky8rsrzkUdcxWxjpYyBGOkS0HfWO
	AjmueR9j8HtwVcKeCXfus87k+h/FbP4kvMUG7JkgNbwzD4A1QEuUkwIOwWz2WDpT+CASl2e6dTs
	VbfqqZtdbfuMILETfCUwcUNg1V6n+6c8pgNedwAKrOYvxp2lVui5xsf/SmT2FvnzqgbyHiYaGbM
	iFChSpp0bhB1yzoJqwnQeZ5ue+vE4BJNd4HuoppQOmCnjfFRt5fx1GVWwDxk0hwnt0ZuaUEASg0
	3TfX6lP9xxBBulOxrgW1lor76sL5f3CRobrxQ==
X-Received: by 2002:a05:600c:c0cd:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48716031822mr86372605e9.21.1774540106277;
        Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:25 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Thu, 26 Mar 2026 16:47:17 +0100
Message-ID: <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774539301.git.stefano.r@variscite.com>
References: <cover.1774539301.git.stefano.r@variscite.com>
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

