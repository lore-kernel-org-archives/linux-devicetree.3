Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D83A782D
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067374; cv=none; b=EV+MSbs1Gdpr/gxl9h3PskaAf4ktjLGXExpUuJHbdH8zK9n6Oy4AQpPRzGfKLxLcyeEd/XuQlKQC+rgVcXh/svXMmgCsHHYN4xHqO/IlTkG5p9LhiPncy7h5Idhug0pry0squC0cZhUw5N8v3l+2FwOwPRgshipKaJH18ki0hs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067374; c=relaxed/simple;
	bh=yPVLAlhkTA+kUGyF0dssolOKikJzb0AxKHREa9fEcLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCf3nsQfk//5/Ww7yGejBpYzR1u5i6RpANWVntBzMo+O0wPYd1jZHURm9IPDKGttFlj5vzFKJpkggoQS4VLXAsfyY36+29F6u2VjSlbQk+fNngC0sDIH0i8iQkFKYlo8IfDVHSXEjscMpP8oMPv7phJpdXdebsK7GoKPpQBS6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJSdlOO1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJSdlOO1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so43716645e9.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067371; x=1776672171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=VJSdlOO16oExuSwGUTA5QdFg/5Q8BjiRZS8doPCYJhNayDEDRlK9iqI6VClcielYse
         7gLpmsgKVFH+cnbCLBHN242v8ZRejqkPH1IdgmTmjuNwYRefsVfR3U7HN4mS4wnbIota
         2yw8nDzko8WbUypzt7WmB6r3XKs/s6maYAEC1dWbt7HpmaimmohLlmYHLWSpoHOt5ZMc
         MalpVAm/QlGs/1REuI0nt6od2bVI3N3XrXSM42w+Y4UzTXKTDySrse0jaMfyagYBmryw
         flO7DDB+PhQdiIqYFjF+XK+IMjpg2wdBiFL2o1ahaMleDa98qVq5TRhfLmObGYuAH+f9
         vC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067371; x=1776672171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=hiXluuCobgPrV0Y+4y3PQ+vtZMeVb/D8ENmvsgMOl1tvLnlAY4d4ALCPi32MDEEZEr
         J0Zq1vNtJ+vrFTqlHewvs59ye2Vo2TQVmLpBVXUaEJ189vEv8EOjjSFUnWzMkcqfhp/Y
         /r9IlSF43lhoYtFJwrMJfdlsH6T8dM1uw6a9zXRifJt8/+X9wB37mNZtjv+TvzRDC2EA
         k2EgbAzNP3ny3X5KfD86hflWdjwd2fwba+/rAM1ND72DGwMzMt/OKMNgikzUv6kEKYYY
         VG+Fl6FTkd5/ZOR2C+M05QT8YHyrwG5c+0cz808sEDH/UHRtVa7GHeJyOEbiTDxcL/9c
         5KSQ==
X-Forwarded-Encrypted: i=1; AFNElJ880ZWdG+CDAD11QZcZbBvHpsJY71ypk+FyHo5spKFF2TeRC597KjaSZceokNd+RuxbTuEU96v7Vp6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVVZKHmpSPRBM16w3rcBW0qalZyozsXu9zCRYXY2Jl+rXh/W5
	kZp7d9FmaOjlJ/Rr39eQUBqWc2QLenmh1rY5ktuGw3FD5JKALVIs+VDT
X-Gm-Gg: AeBDieu2ciIfnw/5tpZc7BBFosWJ0VduM8SYwolmt4WZO6q/ym6XIXyJpNDxzmEym79
	mnYVpw+QCdZgSbyJ+C1FF9qAxLrlW6DiT3mLUd9mR307jl2VOVlM0TohBdxpL1fbOXZjaCbtvrD
	BMUQBhNFP6SMo2jlWC3Z0DPZR920PD4ZVv9hhHE0I0asIRt017rPl05tODM8UJ0AzM42BFcVkNH
	JD0VphswugvfYCiYV2YKYkjjeNEY9Wm7YJ+MiczLS7IDVG4hEyL+yKANB89Q3JnNkYvTNxgEieJ
	N5y8D2ksgRsinULp03jPHik1pyHNNum307qbvtML8aRJ9j2fnHEVQ6JUOuMMqIexFz+nzLFC45E
	vBS8VyaepZmhhrD4jlK2b45mN/S2kj5+zKiDbNMizbASleFmt0J2exbuRtAPn3iqK0kAewikR4L
	Ar3+hl1jaYJzL0kIcP+vyC8glJNBDk4IO7qHrhJb9GAR/Zli4YX47rzea9P3INs/pB
X-Received: by 2002:a5d:5849:0:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43d642be552mr17751732f8f.35.1776067370293;
        Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:49 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:17 +0200
Subject: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..a7d88564630f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

