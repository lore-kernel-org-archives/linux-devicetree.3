Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8214A2E0E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527254; cv=none; b=WTu5GZgcdiseCTcIPRkMlVVxtKBsZxsEP0TcG3cW+d2vli7Pq1XELbSLev1BSjJKBQslgEt7IvFiVUOfU8bmBrk8Sndhm7yv76BGs3RUs7ngy+i8tMVlij0YGUiUQdw86OXG9Kj0KaipgAwT7HYok3LpcfyQ+IUR2sQx4amL9iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527254; c=relaxed/simple;
	bh=qCfLsJoiwZN1FHIn/QReiEfRsi64SrW+21HyyLc6Y10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1WpKs3wqx5Wu4JHVp9183XXXHC2VTajE6STMxxsKDx0G34BM1IXI2VQtv77ugb20ka0Obr1rQkMT5BzZNaIQvWVhF1Lrl8Pck1zVcCcoAYOXXUbYmlTozIWu9oo7Ec2NkTp5YEcWr0uZE4vONi+G5uGrm8pJ8DmaR6axrEOqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRTVKwy5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRTVKwy5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b915ded5so535305e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527252; x=1781132052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=bRTVKwy5Ps4OJJvOOrXXM6zkVr9xbSC62wrgH98HuZ2sy8jAe3rjrKklXBHkb7+jJV
         Qv4rZEvdMKYqQfN3QA+jPmGruFhVciAD2S7aYGAG5OjGz90JEz5uH32VQh5xHvPPJvxF
         HUD+FyXRQEEfTkacLvnSZAkjjGngCmEt3x1Vdy8cqYSX1I5rxr2KUwJYIZOaBQ4I7ied
         8Wjdk7aVRi7Y5697rSB7LsBWem4GhtWy+Low37d56yESTqmXuvC/Q+s++RUplce+I132
         XUys1mu5sK36hllmkEF2U300d22cR5z6GFPc2L6ONVSwbdW8bc1qgMzrGzWhJF9COD0A
         T6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527252; x=1781132052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=NhmpDCzcMYCAYx0yXqb2c5MhL0lrdLFbRFAjY9DZ/xMMPKUOmuwCXXoMC2rUWsWt5t
         AdhWBWc+XfOwlLtRyprhAJEq3QkoU3g8cy6el8OESr71BEq8KvYZy6iGAN/qeAqa3sNr
         zZxd7iO3N773Kfjr+EXWtFUGbWhNKkeNeWaNQvd/Xux7pSFrpQToLtLAsTL9ISWJvk7G
         MfFTqn73tdjmea+w6mTnzkfexnt+knbFfz/LgYNaI9XqJrWEJ7oE0umPVzJpoXzT6P3g
         ZsBxZroZF7Qse2BX+zzISrewMxBoqWncXwsFlwTEmENm9NAKR7YBamHKIDlzjI4DQ4aL
         oXdw==
X-Forwarded-Encrypted: i=1; AFNElJ9aTfEOHB0uxD8xmEQQHkgAZojGGyygH/DzsPDMrJ86lS64LrjwlnfDsCa4d5pziWQGVRWa4q0Imk3N@vger.kernel.org
X-Gm-Message-State: AOJu0YwR5PHsTYWf8UOtpftnHm1sM8YvOff5dUdaUvozTAbS17ZxFFH7
	SdBKk6T6U6NTyEViXCzDIdIrnUGN0hYKQUxmMaf0bqY6Beqapn93dgWg
X-Gm-Gg: Acq92OGhuw0aBkgP3HEWUJkeiXzhI9gwVd1jiiyod72/L4DKOUDuw8fQ+Cs1yCjhfL8
	2ashDYGestMyTTd+Q/z2lre9BMBiQqaC8WvHI49GXWLTggCeHRXZj+3aAggTuN6Hk2OPcH/uyxg
	CyNrvA4azsMjSkT386sMrqwhtK1H6Xh/h+0NNontkh3DCILdCR87gFcqayT+Vrb9DtljGrL5kyU
	/0FCY1ujRPZ+Ze1Rpk92CzT3iGW6zpJaT9DypD9S9MnKCFDo13KzZ3GaLN98FTVpNJ7Mc4PDG6l
	8GYN5YB4kiANt6xNf6qIjYj1B3YUZGd14KuCz70bojR+GlOphh9PjWEFxORfd/91kXUcf8WS2sT
	kQMnEK9HFrAilSL+FRzt4EwpoPdP7DGk+6uyJSjNgEdfmtuWK7k5DWSsGfq8hdtK2/ho5oRArU3
	Fe/kjR9+ECe64mzftOOps2C7aLCKfIHtK+PuG8WEntjRf4CZTLsJCh/9z7f0xQqnpkv/QG9KsUc
	K6dd/f6g1idy4u3l6JrCAaCRv7uHqIMGKMtd9tduD7ivT0=
X-Received: by 2002:a05:600c:8216:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490b610a410mr82034325e9.33.1780527251928;
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
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
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
Date: Thu,  4 Jun 2026 00:54:00 +0200
Message-ID: <55fb7ba8f5249a0be5296a0b3523ce20a668a89e.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 090752014ee2..fd0a1862ce90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
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

