Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021163932D1
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065224; cv=none; b=KlLfAq4ayjbvdX6GA+l6ssANBhgFZ6dMTF8q1odUgOf0OYT8IJk1K+M9epcw/HZqKIvyPe9pfs5ddDd/HyklSPmfnv7RBzFaAs4Ca7+L7U0nC8w8kkxLPiE5BCJpmwVIj3/d3Pnp0OMro6XSfxvCQetJ2h7l5QuiN/51zvRs98s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065224; c=relaxed/simple;
	bh=hxs3OSpNzHQmcxvHvXpddESvsaNDoOgB9L1Rmxo+7a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqSXDXOyMbrKRtTegwteewFyk3YshHnfCPyfe1MHiY8p+RQJCHq14xlp7uabbuZR4CpYI0PI7rZJagspg5vXfAuxM9Aac6gzRVdzPsYixLsPuc2mbb5oX1UWIf1a7mn97wM1I5nKOkE0MGDd668/WDSjRLRbUPh5wCjw4ktbVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyEHqKsl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyEHqKsl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f6092eso444007f8f.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065221; x=1776670021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=NyEHqKslNLLhVcx+gy2sAoLollD9YPZSmuzL0+RZnVohFa8DlwfcQMzZgvGXQwQwWY
         XK/9nilXihdRgXu25oAztg2HPLDHGS3mg+XupcgpqZiknn80NGLA8Ta7HcLDEvsALhAe
         75ionI8wqQglnqiKsqPm+kq+bi800KaBgDk74QH832LmAWjX0YToBCXZaoK54Y/3dWzP
         W02K9sMunrIkPxBGupW2iJQ94D1gzTlLmS6N4GJ3NLEq4t+unkqcEhLxtnxkl/MiFoev
         X33swvYbMKDNbqiYqhvB75wq5QXFAXuLkgHFXAxLt7lx7KLEeDfqS2nFC6MxM7dbC4H/
         EAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065221; x=1776670021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=IxTeLQTP+zbOnUiJ7hP2lLnNkD/BG4KDajDjAgSYsaa8FxT2tR9ivqewCiRzIRhQJ9
         6qrgu/Gj3Luzg5IK/wguTYBrB8BkaO86UUMLhCsjtrvO2AfMsPjR8s+G75qtokXeUykF
         j7vMUL0spoA/qfw6feIFnFjHZf2M1YFSWqz4wnw9Agm0w15AXpAnXKPddE9uaQkWLWIx
         HuazllFdANOtlHEXUEjyYxITcKilp0V28hQ5PWMSFFTPvvRKSyXTXviJ777BAwDDBg2q
         GG/apttn1enndWmqMRiW1z+liYn5oWFQyUb3zLNR4icIg9l3LrNGMsHmv12udrT/Djii
         o90A==
X-Forwarded-Encrypted: i=1; AFNElJ+Wiaezr5I7t+gmu7lZczF4IfO1JDxeN+z/WcosyDe+AaLO8zzu9ttODyS01bTLF6FPwNTD2r/y8z4W@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkt3B8OTH5IsYtUq3M9PKQ6K9VQYAqUfZkjTcXJZebRlTq56U
	Ehl+6iIkJySXlk7JI9tqQK7NJHS1bSCb9Anokz1NHKAybdor5j2QRCrH
X-Gm-Gg: AeBDievjWV5d9s5lW2UyKOAk9lgTtZ4Snwm4coBsRjAiBb8NPalUDpuvuBp95VLsYwm
	uTyBlHTOk6jzAH12SzA+gH+DmLzfz4YWxpIzOEtx6yUo70qaeQIJOdmg6mdw1+reFB/Jw9DPZeo
	6ulJL8OqWtP0hSx0zewjCxknSegEGm02UMm6sTP9GyGkkWOPuZgquLBgUcImGO3eCZQSpM0LY2p
	QLlNYjxo3/Fm8KNogSQ7eoQoWbuEM76h4bQ/8ZKuCGXrBW0N6IMZF8hmtImO4timWBZTrb8RO23
	Pr/ipfTr6S175gYOmrmCPaSRAU5S6d47RsUrS+0Y9TneZgiguYwUdDCG8OsXR0BepcFyOOmACTA
	+R4g1d3YGCuQX73YsK4O8tm6Nrey3cf9/SnVFCc8D1tfyajEZiqRO7P30lbBUJbXeYD6pHrdWhz
	lmK1aLDO7UZMWcM526x79T0u5w84QCDgqSIxxW5trWeNIGL//Z9F8ARYNCQ7iDbvjE
X-Received: by 2002:a05:6000:3109:b0:43d:1c21:eb14 with SMTP id ffacd0b85a97d-43d6429bcbbmr18388161f8f.21.1776065221249;
        Mon, 13 Apr 2026 00:27:01 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm13045692f8f.13.2026.04.13.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v7 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:51 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-9-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..774a4640f065 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
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

