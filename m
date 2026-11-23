Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425833;
	b=1znOM+j7wh51MTBptGGvCQETj6Jah2/R0ozO2jIWj4tx5ES0A8Ltisg20hWfp/3s56xt
	 DgUj65OBfKctbFnFvnyuXBcfgiUL636GDHYnvMccNqZa59JpE2qJBQ8GIzitIWQ58Wero
	 McyyS51+H/Eb+/eiisb0t1aJxt9xT74S5Uiax0151wd+Cjw4iHWQAE6vdFWWSXZTaUmzy
	 CRQrCnQJ1AloBvSXPkF+EVZ+H16/fVSHEoSERW8JCNTm/hilVgeBBhInaktdb2J4bEx9y
	 ECv4vDFx7mzFvTFOd4dJFESp9psjyRVwnpT2PPgBA6PHIkdv+fSWrk/nXVyFFNg6hPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
	b=CXugQYl2+Tvk4aOO9I4X2vxucNEuaVV8qXTo/cWY5SaofMOrG0qCY/ozW3rn2KFzyz0z
	 ZJG8cBkswoCIqKAs+CwRKRWWgoNvrd+TGvByeEb8geXpUjkOCy31xLbYQ06K4rSva8tMf
	 6krBGxAEg7l4o4JQt99FLCLmrOshPlaWmqp3uRD5QK2yQoZNyWuraWhjJbZv8ecWYr6Th
	 780BAJax7LCcO/9MtjHijWiWBpTQHe6IbeJ/V50bFdFxx6/oK5ZpClCnRrmU4gqlynSIj
	 cEaoFE0ZeYPbHd7fYDbUg3vK3nq9xnReU/C7+sW5nZkdSXLi601JqA5DPUdPd0u975A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DEC606A337
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DEC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so30196945e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425831; x=1796030631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=eQtHTTve4Z4uO0VZAtHlaMiIMXczJdOAy4HbaVdlYYWPvJSM/QLmy77k1bybeIhLDg
         7vp8/Amt70kttKGpzcb4OlAXd3W4509mL3m9WSXnuocukElT5X3Qv20D8ueCPJpSMkmk
         XEwlt1AIdCc1QwRi+JamZfTnYH2nRYP932nArkis14HhM/ien5Dt0sEgjlrL7dBiaiK9
         9qN+THVqxl1Aj6cKAeV+vjl9owYMdEPUUm0QOujTJnwtdNOUF0etsUlbW2GVax9839Kt
         S99uEhGtNZVd48dfgQDuOh+3puZ39tE6ZcrMF0BPgFgXHCjMCjPX3cPY2wuf9TQZISV5
         aUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425831; x=1796030631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=B/zOquITQ3RgmX211hPrRf+IzUw6/JszTyi5kVy9nI00Lq61mb3SYTjSv48Dld7Wta
         /i7woYEV8obldS3sx0iAjEDCM0lCswKoJHke7FkhjHJ61dBdlvNUlF2UjHSwXFmrYoWa
         Y9nAYsgUnliUQ2grCGT44w/XFoNNzJeDNhYF3fiGh2934Mvt/ZTuPSzhytOkqyAgil5P
         dzo2B6whUdSz2+vP43CShhWU0qoZjWv1SujqxbIuWFdS5NwyN1WWX7omX2JjT9dN7dQ8
         3grcaa80xAWawm3+8zOIKMlb3R6VYG6UxCfW8ngfygFkjgSBmPJt+XKbma0lOeLxgQWa
         Eh6g==
X-Forwarded-Encrypted: i=1; AL+hErH5bNui63Afvd+AaC9z7cR1Ia/s8P14jRdUQAwvHODJqdHlgMKmiWTOilU+gk61QxyAfmLbNZNYogmi@vger.kernel.org
X-Gm-Message-State: APuU4Z+rJAAsLFXjlyW+bbnjtAVEOMLfCrFGzSorEKsZUeuCSA5ZauOi
	aWal+slGPfuhRtHSJNNCWMpH6CDRkCNe8I37aq/PZicWRRn/TpCsH8A5
X-Gm-Gg: AZFdTZeJAp7Q4gK0yvj1dOnVR1DDRehZGp42GFhMmUH+KqDe9QxjmPEssCSZaCqM6qR
	bqHM9WGDPSs1jnQh7QkZFmaJELRb6RHnt0+tcrIFxglxTo9rmVRiv4fJ9ELKC43UpcMTV0UWARj
	KscJ/12sN8RvkQUYseQp29OWzZHZLMK4t1l5LC2u7i0ohrdySGQMRQZRXvKOlDji951YZQy1Tsz
	Dv+W1U63JPBY2OMS2oc5vetNBmLhwmszJu6UU53MMZiKYKYlmAH3GaakknGQyhLtDfscNyM4UAa
	F2EKKSZ4APaDjZr6VY4jE/Czwh4MnvQoG+46O5MVFdbLXVflLdE2nsmpqEz8R8XYLY++ZJxQed8
	Z0mOJU+ehXI8UUblPmsZSfVJtvUmD3Wjy439aFHCQHnlJKS9zkX9yZoNuFQmNirzhHFzNhxy4zw
	7mp0AO1IbchSqqFVHhDphpxPY9mjOS9UTKIo54RKHruoJWycLy5wTzYV1q7levUsv1Ui+9lv81L
	5IcC5Sot0K+RYXYGjVcmApDs7JIvzX9p/2xk6IRJi+Mkayj8bF4g6TlPPpr/t729tstDGazXdUM
	tuCX2/An+d6vy3X3Y5h72+bUZvO9Gy0Y7KZZILhH/OVlhxiRYl/O/n8wO9VSMMrC6sMNM9ePc+U
	FApFpHfLtqUxte9ga7Fn6gmwVeMB4Lv/B8w==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr217705195e9.27.1795425831349;
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Mon, 23 Nov 2026 10:22:42 +0100
Message-ID: <20261123092244.1792040-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..5550b21e4113 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,17 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "peripheral"; /* Force to peripheral until we have Type-C working */
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

