Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CB93750C9
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680183; cv=none; b=AsyCxeqDuvWxFYGhAlMnOswuqcPJc7GQvncrb+3qd8anMAMQg9/XI2NuDa3xnueyB14PxD2YW+zLuCnDRh96A1PgjlLba+L2maqpVvwi2aeUmVPyoWS0Z4ZSRVUTLpiDbKWEmQmk+htS0S8yM6g5b8HtM4Mf6JrUKJLTkxTcYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680183; c=relaxed/simple;
	bh=MYN6qrENbI+cSCLO/a+ReIIUerM2DBEALVrFcEyZvCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBWXRaxYTJtyNEBFdOGixCUkkhhhnWIkAU3EtfxvXvh9OisOGLjUdNxZUBWmvU4N3Bd0fzY0fKFCzdKX28h16ljdrJQ9+PlAUh07DzuQQ5rEkXJZ565dl91OS89xMC3IIdhrRCdgOIJwrc2kbTcZSNHYgR1XRPSmbYdR+4kqYEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=De3zTymI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De3zTymI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-470174001a0so906211f8f.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680181; x=1783284981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVw92rIIwsB+/dRIhQRFa/XtQVyju/v7TrbT6PfzFSE=;
        b=De3zTymIef2t3kJVUT2TdD+j/56CwwlYF4iFIXRdeMRZHChQq3y7GD2+MzDOM0HdtK
         /Z8Heqk8AwNBxwyEJIuYddkredCDFrsOZsmFFWbLz0Me7knVWZ6rfDj5NNLTGVQdz6UG
         2Ret5Cy1yw0euLl6d0UctwDJQOeK1nFSaQi7fZEAOO1VzGT9f8B7PcXHIzxFCTjVW4mi
         xupLwLiXl+kXEeHL33TkdJ41yjyuisd8YLHhVvRxWdlCJh9fZbm1Gb4E+vLztLTuUcRy
         QGzRYsFMGoLMRyQzsheaA9jwm2QcJ1KmF601UfE+El2Duce3XO3XKiAaiMg3Ss6qurdR
         X0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680181; x=1783284981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVw92rIIwsB+/dRIhQRFa/XtQVyju/v7TrbT6PfzFSE=;
        b=OWEt28HeU4BgO4yA9p8E2mschm8i7BA2v3RV8pF3OmNnIULuwvoKRClV1pnC1QGtVn
         VMoCULUkuLvEoDszuU9EjPHnDh6jMISb9VKiB242PrI7Nwf0sycqNrWEofcPw6ta4o4j
         DvXEBXWiVVfryDAkR2ZIkaXQQ4U8vIg4oVIU2NNsOsm+P/Cbrsbb+XEQKBCEZqnF4Xog
         9ssu9Jobi2PL+CuE1wI/hBy1xV/izFRGfiOdEa1yjw80j+XJVOTCmr4AIXBj0ViydEGg
         opnHN3mHT8OR1vasvX9lFup+Xa6WjLHvXya+d009DuGlnXo2aP2gcMkAI3yEhlNAA1Oa
         Ud+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrT1vWUVZuQA3nsTQFqmcMt1IJwruxaLx3giiNr4EYRp7evosACohDMPBNYFqPLE/Gh9DXThr6fXUaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+NHaZEuiBt9E6fLag7ZE5x0ii6TTsNdPzFexu1qkKPCK4c/J
	bd1QDosYwnUkFOgGXf5cQ8X1gOBrSSxys0HzkZZTmJIq6WrlyD/72+D+
X-Gm-Gg: AfdE7cmuUK+5GVofR24HXW27ALjKaUGevDTMzFfyLWE/I+clyhqa0vJ5WQH6eVcNtdm
	iqUUnmumQNbJAw6VwufQ0K1TzEJH5axkzIt9v0bsn2jrN3/E0JUo7zbT0rUgNEL9tDmvK+CAZGf
	81OBGsDCjgAPtFjrJ7UtjPjqtw5gLL2JaPCGCZGAsqG6ehC1dhdfH7yUeoxnTM09S9RV1Mr7z8k
	72SxtO4YD1hKDKQ85Xszrm21YTWfBuMdxopkme2/FfSEOtMou38tVcKm9lmhWnVAM7e4QWXrtPC
	M7kIrCJohoSWpXBolKZ8w853DomM/oRFCbM05T6WCrBG4zQ1K7a48/VfCG7HQNzYb6nAN//P7sj
	YpJKY+0QxwMFwfIobvv1N5Jf//wz+V2utPfViZE5o/Pzk1zx3T9gjUvv8K9vSvMSpuRwPtKG6sM
	xt0CQTA+4Fe3iwaxd5im1v3MHku5el17IiRkUcTcnzCkHPp/1xOMuyJVbPPtbbVpFsLUtPgglN2
	0yZ6XnxCPNoaLedtxZ8k0bJPQIvyon6kOr7
X-Received: by 2002:a05:6000:1881:b0:460:3234:4472 with SMTP id ffacd0b85a97d-46dc1b9c1bbmr23489048f8f.40.1782680180424;
        Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/4] arm64: dts: ti: var-som-am62p: update audio codec configuration
Date: Sun, 28 Jun 2026 22:56:06 +0200
Message-ID: <76e49b33e7810b7cf6452cf827d88b5d0f04ba3b.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Update the WM8904 audio codec configuration on the VAR-SOM-AM62P.

Set the audio reference clock rate to 12 MHz and add the codec DRC, GPIO
and DMIC configuration required by the board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove wrong dmic property

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index ca2483a04b9d..8a8dec80cb30 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -152,7 +152,7 @@ simple-audio-card,cpu {
 };
 
 &audio_refclk1 {
-	assigned-clock-rates = <100000000>;
+	assigned-clock-rates = <12000000>;
 };
 
 &cpsw3g {
@@ -203,6 +203,23 @@ wm8904: audio-codec@1a {
 		DBVDD-supply = <&reg_3v3>;
 		DCVDD-supply = <&reg_1v8>;
 		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
 	};
 };
 
-- 
2.47.3

