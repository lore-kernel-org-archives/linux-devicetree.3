Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68E46AF1B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488007; cv=none; b=VuMNO0a5Vqk7Nj/jatoLXgbvxplagEoYmvMWxhe/VhTayJeJ0nV2e8vPQtwxjPKwywpwSNO+3dYqG+bXlIZdq9r78RYTAryJrNEaFnP5YElxHOxGuMIV/+WLpQ6Ggt88Aq9A9SU6Mf63s7cUitWLdvrgwDoiAwoimmDJDU6qVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488007; c=relaxed/simple;
	bh=va3FMAj37lmAZ+RMmNYaBUL6BXEPNT3Ugfx7uxjQSl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ep23ceB62J9pvD7CqZQlMKmQmL/1HhWbU+vdwbsUSq1Kv6EQDDhJwAdRhCWr/69yxm2eiMiP3ogIfSf3QRQR7CMyU6BBv070UqJPuLolVD1BhkIC9oq5ldXx/rOr9n3NfMiN9iCkPduicacvAH73mZVnIH7pD50owFH0MRgB1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yor/eZzG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yor/eZzG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b7866869so7373425e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488004; x=1781092804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=Yor/eZzGuPW4n4a3kBD1EJqVdnTNeJEs+iTiHrcljZNuuJiMy76Pb6KMO7BNaXccd9
         f78wFU+2mwFNzBssksrJpXz8tD9BeMkRol3QARDd3CLCTODfBrfa9nfWQIyKMl6SOF5U
         nASvPogboo3vjowW2HfWkxHU33b8jD8qNqvQ2s7jEf/j2orordKbX+MxMuKfvg5Ecu03
         CZDQCa2cxqUxb/elupHswhNfuyYqmm6iegn6eRo1Fm12XuWQ5xrHncOzyfgVYFYvQsu2
         f5PYHZajn4lrADZ5KJomjwRnbIJm2+TLrInER+VMgZ9CowpSHRRUoOpimHd7OETMq88D
         xHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488004; x=1781092804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=CBY7wa31jibbgcK6jtHzSQOnjFolz9t3M0TRKRtwUOU/RRumaxAjN4dWB63/2+I7ZS
         TBSn02Qk8f23KZDgC7uG9N5dgGnGOcHjczJThWOrP0cigyBIVBGjYmprT44fNJctn+MY
         3/F+084+T/gt9HTnWSp0hgNe/Nnjw49W7/yT6Fua3iKDJ2x+aytyFT/9MUjDPhI/hARv
         12EkUwdbPBd9mBT1D8Xe2Mf1QE1dmn9ud9qk+4Pxi63RlXC1Ph7tlW3a2hIwO8up3BkQ
         ctj4kmOg1f9e0yGqSov1n1CMKH7gDXkTF/jBksSrd3h/jjc+VMPlEbpY5IfWzUmBiK62
         N/fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P5j5p4fd6vw2aHysw8ZOagvA8lwWeDSABo9sjSTMVrkeedRVgECqX6622mwe3MuP6712enE/y5rA2@vger.kernel.org
X-Gm-Message-State: AOJu0YygaDcc/NUlQvWAssb4sbhLXEasfLwuayWyjFAN5CZdeXIrifhY
	aCuS6kIUYxWTVsMncQPo5DqEKQ+XhC2wWauwiu+HO3BiIzi96a4TR6/W
X-Gm-Gg: Acq92OFinbvB0sq3PUMr4fHsieKM//mSiC8RIptv+UNE8ei+VCXGSkYNkmaoGG6qVY/
	51FHAnWUzRZJ8BzFogR6JhrtpTinH74TdxWDU2+Va2M0ugnq9CKn9/PH8DrtxgnzBwS/+DkRcZL
	hihOSiRj7PbTiDl5I5DAc3VIFlzfQWZG+DTSDlwYNIK2KiUjnQG+eNHJMbwgLBdZafpb80dQVD+
	Sb8o+wJtohL+zlOMRDUTogvFGvh0K41V/LPyuvSqnMh7OHi0ftpCz3G8h2ten/h9qA+m3OqNHCC
	aoFq6WSVbiYCMICbBdwo/Oy5s9hBRHB9DwMwj4DWM7Ys7j3t00ukpOriyBabbR4zmryB14/FW7/
	QbVpU+vB1m7n4akScHnSSYWlkhFS2LBDOOB89FtZySn11K51K4MtgUxaloUt7t0hkg5DEn6Fdcl
	H7SDwNTbtOdWKmUvX8lxzBhVVW5fAKW5/L9ZZl9M/4IO9HTtbcBCzZpHM4WhvEL2i3q+iYtPjaH
	JUL0hUwER26yxSGZNByd41aXn97WaO0ACRRiwaKkdSN9pcT
X-Received: by 2002:a05:600c:8184:b0:490:b5a0:ccfe with SMTP id 5b1f17b1804b1-490b610797cmr46813405e9.31.1780488004248;
        Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
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
Subject: [PATCH v1 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 13:55:42 +0200
Message-ID: <e6d7ce3ec53b1a4fca1a6f6f7473e9c75c04f30d.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 935bc71b6ee1..8f8c76993fb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

