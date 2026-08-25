Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F343CE4B6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641032; cv=none; b=JOqDUMpv5+TpwTpk3V3W08LFzwJF1T5YQNu4X1SR3Zz5HKxLZ/AbF6QXJRUBqia6Cu++yILfNdVs9pkQAZPmCwvr7O7t9Facp0JKCp/6H29vKR6J9yTUeRHp6w2WBsf9ZYGjQ63d64uhEosegd/DCOlAX8DuiDzR8fLyl7mFM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641032; c=relaxed/simple;
	bh=eHF/gDNrw5iFCay8E+rL0YGQhFOOuxIopmoV3+XjG5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNeV1Z310Qlaq7hWLd8vKpcDm9D2Lx2NLUxuW6MJY+8NHRUjKrIB26RmrAq2lrhTZUAtmN2Lu+e898Be4ulMcqER3DDvmX0pcwA0c/tUwwAYN2ByhA1vnPnskD2bhax8qxHlUGGC/ZrYtkpm4UMwEYHx4otHqZYtgsHSi3+P3jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOg5N22p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOg5N22p"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso516236666b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641029; x=1788245829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=aOg5N22pjVauWr3yDd6qmV0dpe6eBv5I4TF6O9VCiRlBYGlTBrwsjA3PskY0JzlAIx
         KRNIcnlFdTaZGkSj59qcK/s3amGz7VB0vs7yvzSX/OxjuoPUfXVgnC0AOQZtqK7h8pmx
         oPD7I3TRVbOpWMz2QhJnvulmQdoNhi1yLo6tECA52peGsw3gqwNH75SAzpcFfzQ/r55D
         JOf6CpqtRnqjPZtF1ZDpV01HNrrYNygXVOUdOrv1ILKmgBfnvQxJ00jQiPpjle/KsMov
         L4BLYghxhue5K4YwQ6hgNwuM10s4DFxSmpiVp3/E+LdrsTz1LH7C8BaQqIdtEWyN2CnO
         sXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641029; x=1788245829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=pb+1fqjPibuMmczAeX3aQO4pFcGLg1m8sPPid1aPyX7ZWTvLGMwmWL2YRgnz+lDC8A
         /uSBTdcCOpehKZP/lSTkLbA9LHhY9iIhk8ATrugK97Pk1gQFDSaPywhFYhAkVXWIJeNW
         OAjoo5ttPM/rNCsPk4b9F26W7Xt6CTFeO3mNTyK21xIJjt/COMKH4jYl94N6/PQu7WMf
         SsM9x1lkLMyFUHqVD8j//uwihRft35uhMqcP2oHENisc+PYZu6frSFMnVVQGfEvRwhIr
         0aCfcq7SssVIls2U+YFXZ3SyiqBnmHT4hdXXxO1docQnFlqOVbzkppLT5HUyx9LCA9MF
         p5RA==
X-Forwarded-Encrypted: i=1; AHgh+RqBPe4EX0aaZ5Xet/gmR42ABQJjGtJ3a3DJm6MhfQJmjimuHZnH7ZbErZOnvvwfm4p/0IGjltBGAtm9@vger.kernel.org
X-Gm-Message-State: AFuF++kNdyDs3UZrve5wuy7ogKjZqpaacem0Uo+uG90R+X8gGFkUyFWu
	6MGfGgiU6MKP9fOzRpKYisrGtidTsZdALM+006Ld+FNVeFkvsQmgmtO2
X-Gm-Gg: AR+sD12bhqUAMpvLo1B4S+YM9OvPR1LygkhPfFE/ffJ3now6Hn7LYteCLrDqe39is+W
	jQ+nH3cvMxVWnJjmhghL5rAiZMWD6vkInot3Lf8lqfMM4DsxaoqpAtFVQzi0ghQS/OCCt/Ly2Gu
	fts1cixPtWXOdYeu84UZZ13G04fI+r/v4aFuEcY7r8EVyDH+0rhyqbKTJLS95yLW8DjyAfQ25Tm
	1cb8HFFl5LcE+sRNx3TDf9rxkZP6z+EIYV+Pf6DsTb9/q5jipVUO92ShSliry6U+YiPCYr64Vmo
	M2HZnqXTcw+8OySXP6nwb/bmEliQB0+B3hk4qYoBZQFK99W6O/UOlN1A6Z/oR+jsXjVE3HHpfpy
	/TvJsShkWZ1oaSkrCsFxUpIBzaTYEHbzwT4JyQrsr9un+Hd3ua0XEuVe0UqjydqtFhR4ES5M+kb
	S74ltkWQ3r/p2ZNtRL4kWJkweN9XQubmOiWMHlICC95KpX7vPMSDdif3DJ8Du7jGU3tSdnnznP6
	eVaeCK9S3LXKMY0A5fbYFxaKDGomzA6vq/KK1HtUGdVX8iAOLk4NDVm
X-Received: by 2002:a17:907:ea8f:b0:c20:ff26:336e with SMTP id a640c23a62f3a-c246a605cb7mr3318528066b.14.1787641028952;
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue, 25 Aug 2026 08:56:53 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
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

