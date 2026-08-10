Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7093E1222
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371653; cv=none; b=luLFPDcI70zlH7WwK+69nz8VEsrGAOf3TEq2C2/yQ6S3hoqXABLZhp+3s49SCjR01ZuwqC/h6Poyoj3GxTWLDzNUxVBzvk6apOHMw/KDj0DyQx1vDdHOHAZtdsJXa2eOb+MLPH2eehmXLmRPqpCgeuafOGdHGntFacgGeeZPGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371653; c=relaxed/simple;
	bh=3whydaACbtWC1hvWi5vdvcJ85l6VyHpSI6B2i+UEnGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQceh/phixuMyn9Z1fB7J57NsAv/C89PaG7thN5jpCPrWnJoraUTE9UYyL27U7IqY6PjQc7tGAaSiGbbKVSFVOlcNh6vsiu4mNWvdLXy8gy/BrVnx311PexCeL8hut8rIXMTN4HkZH9TnCOxobZI9+VvzhnCaQ2IZzN2tPMOtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmoLO1Nh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmoLO1Nh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so8394625e9.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371650; x=1786976450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=dmoLO1Nh6VYT28E+x7KLYihN+j69LpOS2Syg+KYEooL9dRPXs3RrjRjQTGp4BKubbU
         TdOw8eYhzsw3tb7D9LV7wYRJOcvFIMY1rqYFwN256Fc/UT7aahyfPZzYAuYJtu6oK3dh
         lKNMK0mT4khA7G2BTvTfYAzDhulFKtskve8wwi4fg0ccqpmBMtJYUFp2MXy0YL2TOgwU
         lCKBtHiZ+0famuplMRHzARcgw2FaqG2XjkKuiWUEiQwIvOxVvCVNGL+/A5GftQ1b+C22
         PgWsCUp5wYMBlz6ZFccjO41264mM2koeL/jBUkNPVW+yt8STIk33ep/1KbNDTs72asTS
         /D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371650; x=1786976450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=ShsLLv/6fzZ8okYvy6ZNFeciBzUkUbw9zsz0scrX1ZmLDFhnHhRuOl2zOBwpCXHrKm
         L6IC3sdVeSHJfuwkSt7ys8q6BRt13ebZ2QvjbKrpNeGr7WNyuy0Cj7uM7iXdaVM+SiDI
         abwcOXJm9bEIYLFM0wHUaI+lMvZbdvR43aZSAVG/coepuLg7PjZvxprwG2nWTxBr1mk4
         RTlkBv8dfe1wWRiXGmiXkZ1xbJtbRoCZoE8EZQ293DA4ie6e8AtkUL1xlRFaxawjQ3H+
         7F+vS+6xGukEXMitkp4Qgd2rtT7MBEJzGS9d7vn2t91wvO1unujik/uhSy8BoDvPefYs
         ReXA==
X-Forwarded-Encrypted: i=1; AHgh+RqG3siMuigzvlNDyNzc41px14zQeLS3okyWq5qYhkAiKqX0Sf4LvjCTyisb/B64339jjd/HSMm38bQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwGRp8ro9hN06La2b7Ln0pr2kCembrCPXP+V0WmDSxbb3kSAIhw
	NZO8XXAzDoknku/+JbCWvqdVT/uTkOnVDgcg3LLSDTGMzPcoP6CSEEvD
X-Gm-Gg: AR+sD11X4DMUQ8xbpFlug2fNsJho+6ICeM1VIrNj0vTSJ7Kv6bbpLxhMbhTekSVM4Y9
	gcI3VQcqaKhdVli4vElSfB3GItMhRQ0aaSGlr/FNos9yY5A8KN4pnRyxLcujYPScw2PrgnTBp1F
	OxIpTgGKHsfgtORlbN8gGS3WRx9hxGb3fY/JOEW52bW8aqR48VaJPaXT3h+onE3se9j4GilCR/M
	WAkDReRfSAlLgeDkqf6AfiC/+sScIz98yysHtctODxKtii1gvV3FoJrQIXxMd7WIm+BUNGkT22k
	tBLKfWmxvYplb1k8w3XXiGZLysOliW5AX4h2PxPW7asEgCMnaQCV2QUthS1uA/XCdWAdOCmwTxf
	8CSK83AySRwzu/PYYxXnbNKB4bKRH79QdjgXOb43zfzLT/cCafpH+KHwjOf36hh2GEoe4g3Cur0
	pa+Nk8Y4B6tkPuJ5YhOln8F+puIOpKaYFMFyi4rvfEhnazOOEtDqbGcT/wlpdU6A1aYT1DPNMH9
	sfBfQ==
X-Received: by 2002:a05:600c:470a:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-499727a866amr26769175e9.16.1786371649959;
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Mon, 10 Aug 2026 16:20:44 +0200
Message-ID: <20260810142047.2811230-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1..74afc7b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0

