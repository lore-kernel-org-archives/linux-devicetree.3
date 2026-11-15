Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760487;
	b=qOEa52JuHd4CwPN7zeYy6RXgC87HXAqK7l6o+ytMP2VJRXftSA7Ka8bqU+SCP1st2QgK
	 UnqtV1uwj/0BRFB8MyCDz55Ed3lqXgZ5TwD8F8cjb8epnFSfyAVh4mwPxt/pTVpZn3InV
	 4+jjY6CKnpJsfVK7ezEd8trfAxa379os/4jLCpAutd4spGJIx8Ty/KBdKciie8SsMJk+u
	 IwgeG3k3kjCYoWCb9u000XTM8DfRt2NgHxK1UgeSIsCDlWNJRsLIOZ1nLjhcUwJ02dyjC
	 VCPodu+RGRsErQ8UuTY5L+KSL4JQGxDLbEBCbzwmXcP6q+6oaZkIcTr0NjuZ+NjmgBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
	b=n/5HrhnF2DO5/YmTpnpzEh/G2BAqOjjm/L7/tlVxbw15C3zrvXYB0rEfzgnCrQ7NVGK7
	 g3NBHqN5yYqAc5rKvGTlkwd8/lKTI1uBdOWk+tmdAw+a4ruzyklUwICF14p35vCJo0T1u
	 IH61p3ViDR6efdfDov7pT7/JUB6gTTzqIm8LjSRM2NkIxBEazCvHLCRJcLG4K6wSpI5ec
	 9S68lL1zK+CU+iG591vevuJAvxFE6LqCPucqdbvwSNgITerHCNdIoQkO/Dyx5MuGwH8mG
	 RQtXnJEp7mEywZgcdA34Km33N51AVrrGLv9uStrTlbk7i9Tl/lqdL4b42PnsX6WeOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lMwEertE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F5606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lMwEertE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49318428d98so1009921f8f.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760485; x=1795365285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=lMwEertExcUBkuV7o2/MIXIbhOSF66gyDZwnNNtInfoh6wp701xYBZswepCIeKU3ku
         lYz2KD1p4n6HdUS36u/I4nqerfHRfT4WPpRcT8xK+HSZ/dC2VVGiijT0+6Bv15CTMpQ/
         1wDPF9k+E1LaxrFpbpI4OD0/rYqogxQ7oVQ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760485; x=1795365285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=MsET4sl0U0WUyAR/EPSauHNvotj2I6qj0ptF6JxCEcDCjZz6e4TYjpb2IMK5A8k19d
         DS2dGpWo1Z6cPS4W6oppsXmkWnrBUOb6lux9xx5jeYLhgPcsumo23mclctgY+7tSN8Q5
         1b6NYOPrHqxKxgAmsUoJ3+LwV7KKeqxUIfxin3taI7/y8sXV2wmSFnDUuamsB45y55yn
         JTYvA12/93uHbYb7cYdrAe7lxVsD3xJpjBdahkwkSULd4ZupiklwaZ0eCIJA1DzDDmvC
         DFBp8n8HiJ6jDYxjFqXlaPmeqM3vakqu8izXdf2Sl7E0Wb8oQ2KviC3vX/2BaFzvo+6j
         vJcA==
X-Forwarded-Encrypted: i=1; AL+hErFNRK0tUzKLpBnS8eqzaM8E/rypi1dPyMXVY8TY2LYsQtfuExLJOekPHdRU8NhKhzIGgCwrDALB3dq2@vger.kernel.org
X-Gm-Message-State: APuU4Z/SKTPVR/yREyvpIs5ZzK3lLxOpnedvIvI41CS+BU+ygZp0dhr2
	t5Nm+oPbTLHghAnFNHlHbO5/PalfEViUGfCi2qUtoFNYLjoVnuZVlQg7t4dE7HMAdmY=
X-Gm-Gg: AYBFou2SH5qYZKcFckxoXGJGxltTwwrYybdARFz4i9+qwl5p40cTlinfK4d8tknoy5I
	FIDZSa7NUC+8AIyqQ2Hh9EBjpQJfxmxnBauWv5O812pL1ECqUBaVbRqPXlAjHZoykI0tHf1dlYH
	83vwp28RW2DwwSkzD/2OfOcksLkojjvDSsFO9npeasaWWhM8DQO+XodpNOT8kgpyYwQOJLkm2Av
	R7u8UOj9rlOH8waFRTsckMpg7BunBaayI/PQlMPQL6ykVlmKG+D+VNAVd0crZ+WPk/470OiL1Es
	gVPFRyeSJAofJ2scyWGTEe+l1HK3j3lPfx5lZ5Z+VGFmOcwqKCubkhuh/g8eoOqyjMqf3eoXJw9
	bDfcru7QauqCMzGXAW+71aZt5HutuYDodxND2OdjzRM/UKldqR6fCZueubb4E18J1id0Za6YP7G
	lXUXroHAcwWONR2nSWKlKTbBZeN5boZcNrc1jAedZX6sTHarWRBalbS03+dNDkQwiK3O2mWwLsT
	H3lBhRq4wqo2mshzeAvT2rdQxsSgpPrk+t0ynmQAwDTxdxn0NFdyxXbO9o6wSLMrBTWyep9oVCm
	SfyyoMGz2kLgh0aUGkG3+zbXmDJSV4IaLfelR/h3E1b8j8w1WPrNtqmEszZQ2GQUyx614SMVZYb
	HwKo2sxyxWVbpNhGCKBE/yZg8pUUhPrSbYgrWr5xmRJFydOpdskxKVGdNjp6uM6Uf+segDVZN5A
	urTLEqyCjdiaRnQ3AWSlbWXtvnq7Y=
X-Received: by 2002:a05:6000:4a07:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-49c725e5f59mr17435801f8f.36.1794760484976;
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:29 +0100
Message-ID: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..9c38c4fe0c1f 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -431,6 +431,23 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	status = "okay";
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0

