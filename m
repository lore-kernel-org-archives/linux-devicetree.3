Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551750;
	b=IZgrW17Zt0YCf4ZmFqoylsbqOItT4WfvSrXp0Zyfjlyh8xCm0VNj/hQpl/RWDG4VtDCr
	 4lYGsDmRHeUHPb80ZvGlHP74uEnOjjsMmEUFYK4USTTrETpykPL2EGqrN2G1pouUOqMIv
	 det8UoSLABJbFu9dx7BUNKxFQ3mjYIemG43kfYK5cycTmC6NvcpPWPLJlRSNWURneov+l
	 Mcsup5uM1YYca26Grqr0aU40bXUcG0o2IAL/hSN0i9cql/Y81t+ly/QVTLGPe7MhCuK2h
	 1XVM1h/fOGyd3FUk23v2eQL1o75dGvwULEdteoF24t/qfEMQhOuggBD+yytsoweTq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=;
	b=lUZJy86deKFKBygkHWvVNMOwhhjXLN0u2m8bfHQzEVmSsFztt21t3x8xvADn3LlqodO9
	 9RW+fLVQWAbh2TcarsEipGsmNVvu/6/Od9cJsObbPi9jl6J2bpVjJQieHalDo3t4MwYWz
	 UxyfSOt/yfYccearJbke4uA/w4r34pPFvtFH98+ziWhzEGK8RONfcO2CuldKbqvD/cHBq
	 JlvRBeBNdu5Nd6miUh95jYGSSUOeQ1tvKv1KQVK6/9CjL3v2cwQ7ml3LUzTt+sBEzKkOE
	 sTCEkOWJ8gg0BYfhzZXydhyATX/DNg14y/1kfo40szO2TgDeUhbuvk99w9flbU8fBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jpihGz7J;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A777606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A777606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jpihGz7J
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so43227935e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551748; x=1796156548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=;
        b=jpihGz7JRlpV8tsAAy8CKNKDq7hkZiDyVYqQNwoLCPSdb4ev2rvGCevESt4CGvU6E0
         U0MPcr+aXgKbhxXKMRxzs+dEcExjsq9chGoERlKpQW+JeHyhbV772JKUYg7K5QAlFhWK
         nYoxekOISw0CUeutsCbiLanTX77nXTZQKuLhfXVbn+DFJxyuphFOKptoOd5k0Qqw48hr
         G7qX20SuS6l/vOLPHEsNW72sLjP5mc/NxmVdNGGUodKnDW+A8BVIcOvZkZpDHpMmD86f
         ia8G0poBnd+6uZbpq3vMRLWA5DIYuDKJcUNtQqDdGixC7B9fmoeC9TZPPrLGUfNB93kW
         jKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551748; x=1796156548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=;
        b=gIFZafzXm8YCoW30ADZkHR1PWH30CzwnbuUxD6jiySRbQBS1pPNwCXRGyJIV4IuSxP
         vuZbv0GzXP4JhZjyOfmFlTEglgcNRCtJZXpuiqhHjGLIzlw/KoGA9PGJEasaVyRDwsTQ
         iJtZkMTtKdSSkjZFKv5pQ45XzOfSYH/4+coEDCO/CWXjH6dCHgSaZ80kDFmaZr4dvn50
         FIWnhi5LWkbBoJz0aeGYmOZP1nb6CUIp7EdZrTHFTTR2hW5fx0GFiXWKXNTm8oEo/5mc
         exNsadAYY7p4dvPcTx0CavUqXH4YVEbHMunfLrAzO+9+tJj9k4MoHahTfkezThfIB1c0
         kYpQ==
X-Forwarded-Encrypted: i=1; AL+hErHoag5RDFU3h8oE/xii5yP1XTEQWZQkMASnf/CxTmd1IwMdUQyONLvz7WgpJ4XRKGZRzQ+PqdEgCc79@vger.kernel.org
X-Gm-Message-State: APuU4Z9gzH7BQybShYEUFJD+JVq/2bGUuQh9c1qXsuOJV/PVRqkDUfnp
	7fS9BhA2+5TWbIY8lVmmGj50ViEeKVOY13+CK/bOw3UQ4htnNkwc+yVtnqs8OHLVQ3Q=
X-Gm-Gg: AZFdTZc6deEfLfJhw6zj6vNGM5zYxKXaKYWvHXbyslawHD1yz+PGMundASP3rpWROrR
	5IbW3zUCiGHFgA41aiSbY50eUzu5J7ou02jWIy0FVedv8ZepeU1sScVNgdCOR0G4dxa5nzfwEgU
	npEz/QKDLtzd8yPJ9YYGbWqtzL7MzF//HTYp+jGEZfaVFD/eLpmkUzlkSu264FFQYMstbtjxoIs
	5G0DYqmsPmTm+2IwKWXjJf8F0UHv1NTiE6wDhGBFKnmjardH3+Lws/DQFCpI+3VEwtIqQUJWamD
	fgHGfKmhsS3nqD0shyKhDrquYyTr+qyGkGr92W4GDSpY5y5TCzU1n0IY2yTzKJXajogfb8+S6CF
	Gg5EmLtMWoX0aJ4foJVarEScWf7oAfk2pk+7gL3K+RMLc4i3nMbukZJGuG37wEmniI6E139vG56
	2OM53uQk5AMfHOgYFDDipK6LkYo95E79NHiH/4iVmKMMplKqlAn7dDHAZNA1ZTaxTM43BPKWj+U
	lIENZPa0e6YI+qxqzXK0k6KiYHk7zgqzEcjWy5JPglJzQ4RlNULALZsUEnoRA7UfCGS6cFerLAU
	PNUaLIPGL/XP5h2OOZclcvK2YJZLpuekNR/zWGQZV1sWXYSpQsyS2uNA8HQMnTc9vO/uvWtbpH2
	s6zOTv3e9DF0=
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr326668745e9.22.1795551748576;
        Tue, 24 Nov 2026 12:22:28 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:28 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: stm32: add the factory calibration data to stm32h743
Date: Tue, 24 Nov 2026 21:22:20 +0100
Message-ID: <20261124202220.23721-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124202220.23721-1-gerard@teslabs.com>
References: <20261124202220.23721-1-gerard@teslabs.com>
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

The temperature sensor and internal voltage reference calibration data
of the STM32H7 are stored in system memory, at 0x1ff1e820 (TS_CAL1),
0x1ff1e840 (TS_CAL2) and 0x1ff1e860 (VREFINT_CAL).

Describe this area as STM32 factory-programmed data, and pass the
calibration cells to ADC3, which the temperature sensor and VREFINT are
connected to.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 arch/arm/boot/dts/st/stm32h743.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..ecb6aba3b0db 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -70,6 +70,25 @@ clk_i2s: i2s_ckin {
 	};
 
 	soc {
+		romem: efuse@1ff1e800 {
+			compatible = "st,stm32f4-otp";
+			reg = <0x1ff1e800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ts_cal1: calib@20 {
+				reg = <0x20 0x2>;
+			};
+
+			ts_cal2: calib@40 {
+				reg = <0x40 0x2>;
+			};
+
+			vrefint: calib@60 {
+				reg = <0x60 0x2>;
+			};
+		};
+
 		timer5: timer@40000c00 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000c00 0x400>;
@@ -572,6 +591,8 @@ adc3: adc@0 {
 				reg = <0x0>;
 				interrupt-parent = <&adc_3>;
 				interrupts = <0>;
+				nvmem-cells = <&vrefint>, <&ts_cal1>, <&ts_cal2>;
+				nvmem-cell-names = "vrefint", "ts-cal1", "ts-cal2";
 				status = "disabled";
 			};
 		};
-- 
2.45.2

