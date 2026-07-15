Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9C32E68D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096545; cv=none; b=HfM3mbKWIaSwZA6p3TdMJ7oMV1HDBwRX5vAhZK2FicMNuukngZgTqJ3CvHjKRQtkGFdg6N93guBW+hYR9WkxiY4JPIhe2/p/bn6oSZIHhDM6vBaR4QGp4KYnZuUFcrqnPsMFXQKySF2fENzOZ9Pq1ioO3sIqQgRXEfHOJobS93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096545; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evsRTsy+nmW8o3PxajsVglDV/RTXWI6fizqcT+WbaP62VAdMoTGbZNddmS7bhRSZIMMjcdXKeVULXFmsxWg/BfsUJ9DFoCyYVFi+eLGD1YlaC1KNX440/sdQsUs5h+CatocD6MF9P3EQkPQre2roxoHY7JHkU77MskTruSZnvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DC/YMrvU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DC/YMrvU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c160420289bso663756466b.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096542; x=1784701342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=DC/YMrvU5wWY59N8g7vDuLVQ4jAhrtTUtTjGWBKTov7+GS5MiweEfMDJHVNzl0o/mp
         76ZCm61p9/bNGJe9HZG1TFSuJn489oQr0lyDRLDlVj3wUeY/1JVfKYhWJ/ys34aNxyb2
         LGB6ccq6tgU4veeeO5l1Ro6N/Cv2eFv7USmqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096542; x=1784701342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=Y95DnzngtaX6q2JQ+9CLLmXkOmg4CpePWqi5REydhvUPvAb+w98j78NgFwO9rH4W1H
         swz3z+pFVxySFohVAHDjooj2m9JHalrz1tIwWjci8duGw0fODAHOQtNnSnJH2mJ2q8Gm
         Ss+7Wyp2eyk04D4zvp3tCiCnJKI4i/DeAV/j0Q7uu3jid4smsi2sbk0XfoewIdQ9x2Tu
         xKnPoYrBCQEqgBY4qBjrifaxLC0RUOp9QHmekUFroYEIygLejGe4SimDdlW0gX8sE+L8
         q907MOp7sqxQipUhKqjMnocNFtiE/2xcwax++SDUpn3/U9fnLjFZxXL/ZiPv2uJqXQsc
         u7IQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzctLmfsXfv0o24P8t/HF6MIgn3UV4Ful3U/3n1FAr9BP8SPeAzITAz1GM87jIqPeOSi2WFq1G2KeF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpp2jGzFdyqp0HDbm7LaLSMe6AFMPHNfpNWUP+6fMvWwOgL09A
	Zmp13E6eJl7XMLExEgcsG5C/diYQFuHd0PWtz1itoq0SWIQFPX75TyhBMi+6WfQOt84=
X-Gm-Gg: AfdE7cnfzaX9EU/DbwPHxku7ZNZZfo32ZBlAkUtc0V+JRVEQces/8JdZ8CJGkeN5CPr
	xJuWRZsa/EJ2Q6uIj2H6t3+yTVJhMIxlF/Qpxjy24gKm1zdgtwhS0XsbdtGvjy6L2MUcGa5ARIk
	/sLPuLr9VpzAuhAjKuccARIKyiP3o6pVUUQiG8ELtSwcGWPt5SMPJa71P41HRRlRuZLqQHel+/4
	8T13ly9ah7ztKmCb9MWKtfogawKCTFvn+UESN8b3MK68ACXOQXU1LZeUGUgOExVN/spTnN8U58P
	gkcDbhoE9DPhmiIYova3PkVy28kFOZSuz2mVAPFg2XWEKQnaMMS0BjBCU6wTn7/PQy68Z2pZX2p
	lIEWb/K2C710o438VfND6wb5RZ+qPD5LjJ+BlbsnclfTBv7cCx3yCICamPSkQUcFEe6nwrGBzQV
	aR7YW3DCsMi+1UDAzwpkZhCU7KMuQ59Chp1JcOFo+9HDE/OAh8EkWU2oISUMjJyUZO/zwNxxGDU
	1dh4nXK5zzroHlBP8PL3uY=
X-Received: by 2002:a17:907:c011:b0:c16:157a:a442 with SMTP id a640c23a62f3a-c1667bf8240mr270581166b.60.1784096542035;
        Tue, 14 Jul 2026 23:22:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Wed, 15 Jul 2026 08:20:22 +0200
Message-ID: <20260715062201.3599458-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

