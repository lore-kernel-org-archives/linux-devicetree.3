Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42033EFFB7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995471; cv=none; b=UMT6pTE8RDfBMS07+ay0YKD3tNlfZI0KmkB/bmfEe6dsmTE741IbLIoHzmZHxSaS7U17tb8s6C9BUG+gC8Y4nf+o2CktLy0GHAzAxN70QvJIPZl+2HzmNc0QhPPagGHOIyUn1o0nRUiH6T6V6p+DfRjSPkhJIQm24Q9jY13oORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995471; c=relaxed/simple;
	bh=Mtq5YoV+51lq6k6ws6ZlHrk+B3jv5pFSIEX8DYg4QOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC1IgIRDP4s5Pz7RXw1PQM96Y3jpSsfSeEjHYkLvvn7M9P9dBoK0D4q2Lt7Gr3S7ILw9cgrKDG5tDrrc8dDNiOYHtlzRaL6AFXm0Cqhd+qxh4HpmUO/v93azlA60Q5aK07U+3vQ/U6G3ujRxAeSd9uV9TcY1uqhmnCda+XsyyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2re5SOF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2re5SOF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2558583f8f.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995468; x=1781600268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=Q2re5SOFodshE2n+VQn6Mw+TQTdh9Wl71KiMJaJanzlJEwR44BEkT4XKYpJ8t4rvv1
         F1ML7wgC+up8UjqywPey6Ff87WMPP3v9gEi5bC3sk5L6xpqbDNGR44RvKq/pgUhnjZXy
         OGL3j3/HmeN0QLeu97GPpRTDkV90BbquW9k76UDhPRl1MUj+6vBbFN72cg8FPXKF/+XU
         dRQF4rpY6B9FOfoTkv9U4K6KdAfboEGx/aMmAJHvkSXb7ELCh7pWC1WK0waoCLDRw7oU
         wgWPj02lFHgUOnSyWiz2Y1T7BaZSh3s19OS7EXStG24Q0dv3wB9/zj9Ic7HImMwQFIal
         eRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995468; x=1781600268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=GbDpjYlUu01/S0YyEEd/1hl2FTBXGNeUtoOPO0BEo6EIZLubI8pG+40e01/nm6pPWZ
         vw3dx/Rdu4CvSJwV8KpfpHPzFkfYzvGRmIVy3++wfEBQ78VeNjlGqI7vvISPhojTDU8d
         5e2mEOjXW/s7R9ynHY8eqLv9qsWPlvVz3NHOyyUrtxdM90DX5LvoE1FceF69fZezCytc
         aJpSCScWgQrtBRVaCP2wng2crrq0rppP2Hc51gYGrciJwwHCz3KmCPoveZ3rfYvmDz9N
         Whc2Svqkz2ECssgXAuDvIwpsxq5YuuktUWHYw3Yxcep9zQeZ73YptbvX7wBs4OSEzqeL
         Ze6g==
X-Forwarded-Encrypted: i=1; AFNElJ84TRykenjqVFwj/KxARsZXlYII+sXbrtao3poa1XGhUvsaHMOrMngIT3Rzg8IDDfQ6qDa0sVht4rBo@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFsdlSoYp2+LqgQqDo3XOJRZQ869mt/YV/UDV/dnS5Chnxgt1
	pOAqBqAa40lM8joxyXYU8rgqg5uw13usjVGeudssHG/WLepIy3zkUHiS
X-Gm-Gg: Acq92OHo5YgIa/cUNgZMKkrbJsTKJ4Eoi+tgrNK8HNjq7gDF+g04lU0aqgiAZC+X0DA
	JM+BgTtI9uyC+wAEWvM6FbVocjSxoFik87QVoc9aFdMqlHxWRou9LQlh2qPZhmLbAvpdECcDou8
	++lF4ZSK0bniLRzVCiOJfXkVVydsS5vwfUmTELh3ZMMyLaPsZpxx/isGBzGktZmCVE7ZqyHIrV2
	lq6RTSF918YQ3mxh6fE8eJANPke/qAyAlLo+vG/HCsmLcC9Pjmmd+ZG763QQDmEjSE+jRtLxuw3
	ziIxidtxRZYb2IRuslMDDfVnbDXeZ0gBbMLeRf2jmwTMDexx6HSdP4hyDNPcnW8VOst/Hc2Solr
	ArErvsq06oqAUTJ2tRsu91djEX5r7h2un+vfpQYGViTZ2kgNTpeTuBXF7V7OHCwlCMAE2W94IBx
	ndNeiOE4+aTRhawwDVo1XyI6Wzv0sjGA3bf6l9Q7FrHocng2ENIdc6MlMaIBMN28f1sNdwMZlHs
	8/d6XFZi1SS/X+d7E27mlM7zIWzqDJhlZtTjkwGLg/1cyk=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr300911285e9.14.1780995467635;
        Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:46 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 10:57:38 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995368.git.stefano.r@variscite.com>
References: <cover.1780995368.git.stefano.r@variscite.com>
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
v2->v3:
 - 

v1->v2:
 - 

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

