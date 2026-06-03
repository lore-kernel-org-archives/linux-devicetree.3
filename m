Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9446542188F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475112; cv=none; b=V8vmq9aOdU7v4cHG5VUnxM/+EUkhbayySkCK9qg5MrmIiaffkH5CTtayMz4rb2Uh3EsKOqH26s9FasFsTF4MEqwWimhjz+XzOnGGMXgMgyEqYg2wBrXSoBYGPDn2vnsF9og1T7TfPot/B63k950hLESjefROZNft3fFx4FL1HhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475112; c=relaxed/simple;
	bh=VYwzH4XdiKHvxjnXr7YQady8HCkkBmaZVHex/S+NpyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmNr5rAa1HGbOGZpceCjze1j/6uVNjZUsWsT9HyW3tUogx3N5Au9pakPAwiK4n+rV+dQGPyemyTSQg/5E5QA+QbfkgAPL8/W7v6uFzbQyXieMDqpqC2JUDEX4lANlFOehQTWA5oDRbkE521uG13WDQTMwODuVWLce2tcfzjPXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl1NqSbp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl1NqSbp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso112048095e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475110; x=1781079910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=Jl1NqSbpUiH9HFJezgptT14qPB3owbVrVirWWk/zp0O+upmmVwz5us/upyV0bWZYCT
         Cd1pC2QaXZecTk2zEIVYmT2lTT7LCu/zRzzIQ+vef0zFtyGRLCHdAPjKIhsKlVBcjhg9
         qWnTMJZXDeoUeEFKP3Xv9R3YrN05tBhN4s+EUQORsQPXIAMcvJnanWTd/OBAvyvGABif
         QhbtgglH+pdPpHxbkRGdU2JTh3Xu/YQ5uD5rzJadezNlQ30n3Q46vyZzMBJb0cuYNBQe
         VF34jgC6HrcuN00wX4BsWdAZKUnuD4N6/O0j6UCIPi5QREzHTIxzetfmwmnEtS3seSy1
         sB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475110; x=1781079910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=cp+c2N1n8oakvjRjh3LpKlYEC4e0GyEKa6Pdyngbve1bTkZBtUEPMBQK/8axPiK544
         Zoqq1I/6QSqbp+Wlupjs1xg1vLcs1qURgzMSppKpBSpSBzj4nzoaHFhBt3rnoUM8Hfp9
         u/35R5n9DpZ5y+2B2QKP9/i5BxAY+H6pTYotKrEnr63OMSJBj2xlJneIRbDQ7evn5NkT
         JnfQ4g9EVGiZClhfkVMoUYreCAXvYcjup4pecOr6XsXvuZ44NxJB65mB877t4zmU7JGG
         hf4RbS4cJygTXwyr2ObuRHW0BbbvwkxXSz5G6ypHTNnMho90w/Y/Fffy4KGMpYIunWvs
         YQzA==
X-Forwarded-Encrypted: i=1; AFNElJ9gkOhhp0adJDwxPunQ8PW7uoX/FFqOi84m4O6hsar8sDKZ5gtIuHt9RZLaZSEB16PwKUp8A7We2G4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwnctnWCBMxAjSNgsXJPtnmsufp/OQgMx2dLlm/V/PSYEjVyDF+
	RSB4sCN5yGXfsqsgwpcw0Flt6Hf6cvWRlVu4pIiTUtO/D0e57BWmjAvP0SQ7Sg==
X-Gm-Gg: Acq92OEo33wXOBEZoeKMt0FlL7Jx05wb2isMFXJzYNYxPPEZMpytigg/YTkPOn1f+w2
	eETm1gMvK9XweN4tGk2menI7rKJQ3tvm1DoqlcdWGSWFE8ezt3cKtGDoGlSNdazgDP3iskVyyer
	MIdJMYQy1VNTPhHgQY3mQjw8rnTlKt81UkttVzW3ecGBf08rE1N/VyMxuXMHZGfBkjWTCh5VQC2
	MqocIuR7BdkYI/WNkhd370dxR03zD/Y/Iuz+b3sDc0WIL0dt41+F5NJdreeQnZfRXCJGn5UYV4O
	mukCl+nQLrMHW5rx9d0jGt3LY75OByrnEtyXCJrUCUjOsjL3MRi1duV1VIhQNPoYWp6HrzYhkUZ
	jCkueXKHTWTnfIXKCY53Ro5/PjULhFuvJR0ei8bnEAwo2/HVgpPqtIcJ0K3VpTEA2SgerSaZrSy
	R+EsB8PzlsDFNFLQXKwfpPoETnAtZAVIhpMyzRLHz3sf+aSZ57lfl8KlxYK1FUzqaA3kp2Atbbz
	JicvE8jveTtSvNQRg07Ex99TED01rc8+zpK5OAOVxuS2ANQPbn+dxXZbA4=
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr34882915e9.10.1780475109767;
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 3/5] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 10:25:02 +0200
Message-ID: <0a3e17a7497616a1f83159b98a8e5ffa429f0acd.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 77377127c18c..c835394468ef 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -215,6 +215,14 @@ pcal6408: gpio@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		status = "okay";
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

