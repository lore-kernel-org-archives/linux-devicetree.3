Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A23A5422
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282393; cv=none; b=Q+pU9J8Fe7aHiFW4Uz5oM2h+IZME3aRnv/6Y1DfFY8NHDsSUCYapClQF60WPsk2KrfBh28OslLJVo7/9q/g3d3i31hVmUnty4i0DHGyfR+bq4rZ/pCSRcM/z29XaeYECdmWybrtu9qevdbTDtcp9orUhzVeS0DIOjVabWh3ULY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282393; c=relaxed/simple;
	bh=MyyMxbHX/jzj54c8s808sA/jSnaAMjMXtqmmODzzfHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUvuyzqBscLDTmHS5QGT3eHgZbR+fNSve5XElUdwwvhKeg4CtobfC3G7MarSfHb8OvPz+QCiSsdnObnnavd311suMvcalvZHp/+6ObP8RbNnqyt6Mpsz0O33X0q/TtT/N4JvmapsH0g0cbSWDZBzNSalvC1haMZUW5IfxxkbRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQIKPF4i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQIKPF4i"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2748080f8f.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282387; x=1779887187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=hQIKPF4i5/HH7nsLP2MvQ8eGspI93jG1IuyWreET0ixhkTIHw2FDSKY+MqqpYaTXK+
         kHtDx58oUHxBzaq1L9HeocOVXh01O5z6jyDmrb/EUsfom5wL0LBA6mUanA+Kre39Gjbq
         zmzEOFlsSwWfhu6VvNQ/M+m8N3u2HG9RS2u4dhaBsOUdV8uIPVlPeAYJbjrm0B/T3FGn
         3+Vl13vCrWMNbR8aDtyIB+CMXafdSTH7eU6nHlaNw7ON5N/G2zbwFNW2UrfAlLG4yEnZ
         cYChv2YsU/GCNWYuuEaYjwnHvGspZjE3C34k3H3eNgPOI9U6Eapz/79Cc/4bEWv67uyt
         Gk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282387; x=1779887187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=mMVsuzao46C1PRfIXyTrGR6QRodHpOrZvn5v/SgblFjpdH3BXAfrKAVKm5IY/V23Hd
         Z9LHT5oRqPXzIGRKNw52Pwkjn83PyWHYddIYAsGwHpqmpgrSe1cmZcKkCPY28Hbmiz4T
         BrOrr+gxvTvO565NS9OvUpn7kwVQ1JCQQvfvQ0myggVawhLns4mM5xuInUk/J3XLhtY6
         1QJ/RQMezthjsw0UDbAcXe1ZwgTAdKlsWFa59ioacdxk+yLNRI2lHqthTb8WgQ7uhOWd
         458bKIhMUWxICuHBymcxpgsJ/4IZhmgfCu/JT+qCe0IkfC2SaHIoAxESRsOp0NDY40lS
         ctpw==
X-Forwarded-Encrypted: i=1; AFNElJ9i61O83ybQ3JXD5SGVSXoNgih+Tvfun+ZUw3fZQzyrshjMyJC8NHTePWhv2RrT6N6U7jEHLwNxrrmH@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcHXk3YTP/FVfaMRrVJKOAzlvvYNAkD3IsuFPGrfJnd315461
	itcW+1B5o9816Zaqhwb1fmgXgGPPygZyV9O6sFBlyeGbGlMQtP3CWVgj
X-Gm-Gg: Acq92OHQnGLIQMq8fXOlBbRCgkJ7pufvmN6eA89T9aRH9ICimL81t9OONd8TCSqYo//
	/XkZPqQztOYhFcT0yietT3P7YhQf3v2YmeWm/LHd/6R4Mizku5y8omkdmY47dYxQqv8OCSWWPPQ
	UO3QZPwNIyAbZaOEG0fnF4Nc5LZbCZgCROpQi8Ttmm5zHaf8ALYQFjkH6CjrNwRmV9m7TXxV853
	rPSb95vtbE9kzffRV2uRJ0fpeJ9fLFjbPJByi/Q1V+QrrXLyewTLoTYNgflnwC5mgTEmBLr1nuo
	kWkLbWvVZSc9ILyvVfX+bOYXfbKkOgDLnMCnaqrINjly9H6T+NKWa+BHEbb7W2F3VFEdLfAYiOP
	jzow6c1CSlxo6m0BkKXQl/isws1skX/EmEdx9sGGd+VtPZRlNK33wVR2ynrY15AVlbrCkyC1DMh
	FFHqhQ4XY5AU1fvjBXSn9ofDuUJl38fdE3sjmfZ8gY58bzEbTw5aov/dUBbDI55Rc1skCP
X-Received: by 2002:a05:6000:2c09:b0:45e:73b9:fdeb with SMTP id ffacd0b85a97d-45e73b9fe1amr25795817f8f.8.1779282386765;
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-141-216.net-htp.de. [89.182.141.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm55001966f8f.32.2026.05.20.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Wed, 20 May 2026 15:06:23 +0200
Message-ID: <20260520130624.1763487-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with internal pull-up support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Signed-off-by: Andre Heider <a.heider@gmail.com>
---

Hi,

this is just a rebase of Iker's v10 4/4 patch[0] on top of my merged
musepi-pro series[1].

[0] https://lore.kernel.org/all/20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com/
[1] https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/


 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 4aef287353cab..0d809e4ad3b1f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -19,6 +19,8 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -218,7 +220,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -384,3 +386,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.53.0

