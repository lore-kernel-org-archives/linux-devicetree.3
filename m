Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684553AEF57
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742973; cv=none; b=okeyvE5pm6YhfjyWP6sC0L64NI/bedhQNhAMSVrqgHZ73hoGri+RSFqOHz/hO5/88LkLzMjaSMHNJxlB4Sb/M/GaUOfR98iWeA2SvT95CHJoO6eSuQf05wAag+lnxaC3O5I4lI7Jfq1/GMBRCg57f+++cISmpA9t6KJCuNJF6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742973; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3vWgkt+csCzWcAjUhfopGANv4Jdr9erhB9xWa83P/6xWsOF4bdemM/LxD62/IgMgUJ3nNm/+DTjsFAGRHaO2BzciKCeF3dKfXd/LjgzccBGjTlSNP6tyOzhVkMn/lQXD+TcDvNaf+2KK1g0bNpSQ/WHmd14G/FS6ez9KdzCIpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WPl00MHa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WPl00MHa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1809133f8f.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742969; x=1786347769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=WPl00MHaqaOD1Ic8tXo3c1FmpJLTe9VFeTCG5U1ze2XPNBsOQ8pza699iDEvDsEfmk
         ZA/ZvWYB5IAiLYq+QeMZoLVe1navIWXa0kPDVFiGzqO4EUnIRm5Aw0sc5zO/QCPG9gk/
         WysSJzR7afejciG+S0aYyX3NWsw9YzT+wNHFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742969; x=1786347769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=NGxWRhglMpaulBS/IeoyXWWMefZmLJdDRGsqatt9ZAmyCEUboKiTmohykU++NNKW0e
         whstiAo7WI6w5hhTnd4lfollP3B9EBkiHItGdAD7o57VqRObOFgbKbbfSV0SAD2e8dC4
         r+0aISnBso7osuNmtZ76EauCWdiA7W2i4kikGcnTorzdiEUNrMx271Fczxv804xvvXBA
         mThWV19qjWlE3OP3eCxV9Uck2tBJ6gU4YGMiF1noM/diP3YbNKkNumSPC7AMNObufLLh
         gIws76EjvEkX2NRGb6aIfM8UP1Z7IPFNGUYen142L0FDo6wMgAnkKBVCudpDDC9gEKsF
         S5Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrNycsRnlVM7sQkI6m/Rg3iz89HcPrcnzH46Gdbb9GdIg60/8Hut9Mmdm+pADLnp9Qpllxfh1XFLLwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9lrLp4t6qM8Q/jATmCjoh4SA7wNa5yYup2KhAssl6unQbcfbJ
	AgqPiM5aC2gnKgUoFslW9+O70TChnMX7Do19tctIe3iQOoOziqFEOFhtTuwaQInxlTg=
X-Gm-Gg: AR+sD10nA3XNtJd0APfmVpMYa4z6IdNPbm9XPGNidK+8iRNtCVig+dU040jpHFVSvqv
	VMEluAugRK0aHcuFetHXNAjXBofEscLyM0kbQM7aHlEf6HQJ2pW9hXF6CyqUNgUM4qk9ypLEBw9
	P4qes8dnzSl1OZuqIYGwmLsA/be11jaDWjIc3A6Tiedh41xX9tTB4rKWDT1iLFV1tQnC6ef0uZd
	am8DUo7XlEzXJKyBPDr9WsgVjrhHke9PTPG77HDI2FhX5dvLydPpNmot+Cy2k4HucLjHC8s476c
	NuXCEuMHSkUNWNoS2ZIqDoBTZgYr7QKxMxAkmmOvLH+/sy7mFCA+XyZEuw/pFVWXu8ci8/9ygBp
	uDnBJgPfk7Ifr/YCJRY2p5c/OpQvRsGTUY4rx/a2OwoKAQknvWhxjjFWPDUBHkzrBwvlPjsGe2g
	tPE14cjD3XWQokJEegzqWAYxZmL5HnDTxS8K5AbJzPG1az0b9lWOS39jxuEhxxYuE2x7Zuh+z6W
	oVxbO1sNvdcz7hYEQQX2af1xUPJU6LE7jdcbZr+++mGhtA8xb78IFM3iDaXAXn0A/4/EzGtnynC
	yIiwZftLLxqd0/F2K3DOBgsDE6KQEBDP3DVUDdiJ067qP6porzJi1w5PsWqXqPiktys+7PxfNAd
	D
X-Received: by 2002:a05:6000:615:b0:47f:81af:1a3b with SMTP id ffacd0b85a97d-47fd72c4be9mr22840453f8f.22.1785742969562;
        Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:01 +0200
Message-ID: <20260803074224.3821911-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0

