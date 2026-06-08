Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4201E3D9DB9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929696; cv=none; b=JTouKO0gDvlKXRX9l7GUx6l3FdZtppx2HswZCz1lDVeo3CnGs3mWmuPjH8rGYLUX06ljQJ/0iL5TpVCdklUPYQ5/Mp61oXxiSliINOsAyySyWpspmoMjCmOzl5lWkGGGhXtgh4mD06r2NnOnfD8wyuo2Wh/Dah+Fv7jhqA4FGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929696; c=relaxed/simple;
	bh=c/nrAIO/3dEoo49w7gfgH/7H6dFq7dwv4g6Il06iMgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clGJtuXsvojyjCocCMPuVHK7UU77Unh2q+PCtcAUEBn6CueC2udAzXQzvI9OJhnCS/6m31q1J23nL63TkgsVzS/jsM17T7D/DGWnpC/SibDGRPxUKt+shg/cehWoqYJv4L8GzYILmWdgYiqEuJsxYe2+/FUQd20UY94l9Mn2ufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auXGXeng; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auXGXeng"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso43270925e9.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929694; x=1781534494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=auXGXengwAWDf3XWvknFWVIj8DauoJtATauxTmk5Oxn7Gz1QnxHVaaYdoAxzKNiBQD
         sd4u46euXmqNJ0KmujgL+8sCTAiXOVzvqY/yRGw35SZpGz0daJN+A/JPqkrX7NYtt+fS
         pG3EUEHPaQS58l0rQ3iz8OWKHo+UPM51CqUWVUthMVWOpk44iZj7jNlSw9+6kP5t/H1L
         H+2WLs8yMvKeEb4r8fn324i7/WYWQyjYcUWuRvzUB3f5Pfk/XYXP/tY8aiNk141UoZvn
         VNLhdD11ROlzCBaAZCrV0CxQDOmfjhBAx/jBzz4OTAzKXYjgEPpr8TG+L/N4AJJLsQS3
         WPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929694; x=1781534494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=ckHleSNHz5krtffRpoxZALKv6FpX++1NQQd5OdQ+9SPAAFfHQ3/ImDjLty/H5P3wTw
         MaDZQk8C57PWnyEWwxd6WYtIHnK1E9TAHQ9G6bAE9TAEWYwVcIKlUY1fOMX4CA05/8hu
         jGw+TeBRbLTSnhfqOplcPJcrSxnQYmXT3lks8UDK0f13EbRJdPPYoBynKlOSsGBpdIRa
         8jkR1mrw4aNOVDVAOcSZ7hmy1NlqwDcdtKUeqHGRayFYcKck1OnlZSXNtbg2PBoVUU1D
         cy3bavLt+4HMaZjS273yu2v5MIw9ai5tZBI6qNFAg1HKterzO3RcGgyTD4B3+rxRNWPh
         8QoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xTlEcs9XZf37uxpnfOEzrTBJDZWWWntTa5OHPR7aXPMz/VLrRlJTv4RIINvUFUd+3Jvmp455mKnND@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgAoq4jRZ9qbaebB+OSm8IMltt2BoEAU2wXlXvYHyGYUUZ5CA
	kncLV5OnNlndv3FVKZ51ej4bPEZpJeSZ33OFQ6624C57uw7En1IeVSeZ
X-Gm-Gg: Acq92OFESYULrgxL62ACD4CgmFuHiYwbw756xGWKZuVEof9wgawzSah6gjsENhmfjFP
	c28jh5ntuFiw395lncuoCiX977wmXvN/y4VckXrH2B/TgT243ugAwkvBD5qtQw536+2j0oXID6R
	RSvQMgW7mCJA0VRC16PEikTBMiegZk/Wxg1Ksz3EP7oSN9UURS41fSAa+W0KhnmDoNAtt5Mx8Hf
	derlpdJIRUCp121MLYAW5qTv/TWWaiqIMuatJDn6YUC3suDU2nz0EkaODkfZVWHVm6cDAqQL/6r
	JCuDjOkAg6cD6D0lvtI0T4uXTaBs00Q2ZEz5UAd812YMWu1f/jvZWcQa4IL7mOGmNESxkB5LSH/
	w6D4fK0dVaQAN08BVfZBvhxP9V7ORHESdnOSZzJ8YNM9qUfnyPVGV2uaPcATAK0aW7JTfsGEEp5
	oFYwdbm24d9ZSfjzwJtb8Rccjl0Wjg0383F/YvQuJYrqlmVza66/dLnERIUit8tgPxICOPUbNJt
	Pk9Cp+DWlByyNUh0NgVBa6t38dmDv8vLqz07TvZWIoSHJtp
X-Received: by 2002:a05:600d:6447:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490c25ada18mr185336175e9.3.1780929693516;
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
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
Subject: [PATCH v5 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 16:41:11 +0200
Message-ID: <b4cc96f60a2a40638a30c9da1d190c4a4b0bf952.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 387bbe3454c3..7f5109bb4182 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

