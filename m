Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7AB40F8F8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475111; cv=none; b=N09svEGAnqrx8OTjNytwl9qURgSu8I2+4hk35xgjDG88rMeyZc8wtR3fPHQF09m/Gu/Apglt0eSpbo0VDUuKFwrsIuydCWJf5fbnLTcdGUJYbf86Mg/dlGi4lprAHxJ7ZGI3Xna0SuLbYp5j1FHX9GiI5kH67m45rxGJuLExg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475111; c=relaxed/simple;
	bh=sd0V4niM58Am9WGtW7yTYh/KrAJ6uZarN8BiStmlIDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WF53NQwTBWti9OAWO/ohs3+vKk3+qcNZcpgu7AbQ9WyA2fLQfqUsa4oTig2Q+VLBt3Y2nle9c37lS0dqSVx/hzssPi5rP0p/3MnyOweEJptfayBAfvkmEZ+x28L6gDzeHzR8dnk7m9hemEuPn2os2SgjLZvXF8aFyhkfAS6v9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HI7RDZwm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HI7RDZwm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso24330815e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475108; x=1781079908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=HI7RDZwmcPrqakwQcdipdLYefKVNcy++3z1wlLlmAm0gR/TgZX6t+b0L6rEPrHbp6K
         G2NwUFOO/frlSFBv6Fwf7tFgm/+OdKO/Il3MLuHxGV5RythC6/ztG489DOu7BnxB18sR
         xQ0QCWBzS/u/4Ud4EfnEdHivRcqLdBx3oaGaUfjxvsHgTNqYzto4OxCGJzaW26aY9wkc
         IkOpBVXLzSUHBvJqL6El0gDVxGHyCN9O3NcZ1Qc5QP5Digs+hY2gBQ/FwpEyp2PVSxrE
         IWPko7p2VsotvUF9lMWuShu36OMckFd7wI7wJkLoglqh34/kIolihjZml8Nj9YgpwMqf
         AxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475108; x=1781079908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=r+rKQQD+r9Zpm63sBvqcMIPnL5bp9wpeXL7xwqtNVaNcuEpZMi1sesqOUUBL3pMRfT
         i3vZ4xiqv4wl4wPIE9yPZ0I9CRa+HFhgA2yw75Hh/B6CsL6zaiNtz3mt3m3nNBjXEMWs
         9SZMTKxndtVlApUiOsLTxnJ/JT4HKDQ//CL6Df+Ao7IuYoyZxqrxaZc9DJqqxib2MXYx
         HA95ApPynPFyumS2+njQHQrK9TcJ4NehGkS0QyS/BPHMcdaWp3By40VtQF+51GC+4Sar
         EvjfcmXn994ZyI6fQMmKYvqy4GOhaj5dNhBJNfmqj7+j9+I/RB6+LSKTYCH9mOiSzNok
         YoGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OP606dYaP4TK0SkXG74CZiz8l/QWz4PQCy5H6VA46ABKN+9sh0Nr0oyM/TvLjvZ9aBIHWxzAigNhB@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/k4+D/2Grb9DmuEIW7km0v+3t1Ley87/iABulLJr1cgSo9DL
	aMpULSsJkiZ3XbIsJ07n1kqokHDR8T84t/wRouiwFkmWj7tlJxshbgc/
X-Gm-Gg: Acq92OH2qea034cNKajgpB/Y8apRPHmfbZgqfrHMo1pFpnBUwK1vCT0L8tCpkM10eIP
	iOTDpYTmKAknmBJnVe7PdJaOs20jcB/5Q+Sw+7BZhvGBK2fXUGEW7v9eD7NMB2lrXZ8amrh3hEG
	HNXiPOLJXDBGe0RxzYZ/LBvVPhEHS+n/iHwjTS3SMBV+roihCeCKl1L8oR/aFrjFsyXYLL2EJ7z
	lOmHhqXGF4paZyK0+3yITgZyYtvOl/KgI6MvyvsTZ35qCPbK6TqMimcXzdjYNMZ+nrbD/ifZlun
	IITiSBUTzuAq9IjapuowYNa6UkJWSGvjF8C+ClvlFOH2mxKji7g0yO2d5jtPzKPsH/WHeBP/O6i
	9vmmLZTPUzNopXEHYF2rW6xyn1XR8JVbFI2Zr4Iebb1jZic2nfyCeCKiRBccXgRUppDAnP71IOB
	9vfuUQjzW+SCpmrPzTDHNzkX0r/XV0Uv2juJ3o4zTUPKpze5rx62/iQaYBiZAaBpwB9ErZOUsn8
	ZZYNjju3B65di7eoVgVdhWsOZYun3Q9HlP/z8DA3awi30Mo
X-Received: by 2002:a05:600c:8184:b0:490:b3f1:e41b with SMTP id 5b1f17b1804b1-490b60e20b2mr36144035e9.26.1780475108116;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
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
Subject: [PATCH v3 1/5] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 10:25:00 +0200
Message-ID: <0018706953ce5c0ab87d1e9f361973429bf0457f.1780474803.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset line is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and describe the TPM reset GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../boot/dts/freescale/imx93-var-som-symphony.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..c736127c7115 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,21 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

