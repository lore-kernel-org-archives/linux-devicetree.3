Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484CF478843
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842163; cv=none; b=YpiONUkSjXyc8zgin065gGgM4GkN3YQM5wsKdoLJgW4uVRlr+ESEbMlJCsVUIYJb3vPs2O4GsoGJF97wD9rGGoqnNvSJbJ/ztKxhT5quL1E4Fmi7VL4vWAjhkdngUZq3MFX8dof6QIu3qrnYwmT6ssgMmfyve4mBMxbnwGqeWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842163; c=relaxed/simple;
	bh=ljxUsigqx79h/ONm6GNMgplDs+bMqcAhgwy6ceKWN2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBlJBu7yn3+ICzh4rr2RNvhWgalyn9Tex8HlITiDlrankoHSXqjzWSmZFtYnXcZTCuUtnLWFfkWLj45dMDQkhMbxstBeo/uYbo5WhhYMZHrO1C0K+vrjocSb2IYLhivBW1LLdejymEensjj2AaBLr7sWNMVLyX9DWW5R6yp8kng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjmmgUI5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjmmgUI5"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-453903ee4adso7767632f8f.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842160; x=1779446960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=ZjmmgUI5aDUQEHHMnHbQ9Iqq3qrh/pd4hJW/Q1Zg1TlFQ/zyaSi+FbuQhsNpkQtPQW
         LmtXRFh3g7jlJbqINz1kmOM538lv3+Xo3pVkZvAXRn9eVTcukTwgso1a8LYRLczvAVWB
         UTwCgL4ILlAa6zHC3We6/pglOnVnL3dwFmSqwgPtaIe54Lf+VPjSHCwzXpLOSo66vtoG
         HpoOElViq3WIbGxO7UAvhRq9KGeHQdXrmBaFbHT0rObyVffjfYf0N5oPNbXSUyF4Xxba
         FiSergq2oxQabWLisjlL10LYMrSB6Xzyq+Lu6xAtnJjQuUspAXJ61gQXrZn4RIVkktsk
         3Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842160; x=1779446960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=PYCczhbgcy1HxonTtgo09Plui3DRNM4KKWcpFh+JXjZeFS7nz4jrjTa6Rn6ADgO5J1
         Zfic9sEYK3FvWCOCIs9Hi6yxT6Zm1vpsGqLcWqUMXXJozav8a25G14sNQVkSxloaUKne
         epPCZW7EoWDpKff4VZSs8TKdLJvJxN9J+Wxa8KTxAoKAd4jzYO+KbZvrX5B/e+2NB0iM
         ILm/Q2gHmnMjtaz7jV/rd6QsnlP/7wVbFsIpeMN91YqodsCkFna4IJWNTIqNxqUVfFan
         XvmA6GaN2DqMBZ/MkgTCZlmptBuMHo8/RjPoBtQ7ldQ8UTjZOIiKErg17eKl520EaVdO
         BSTA==
X-Forwarded-Encrypted: i=1; AFNElJ+Bp0tGBn9Y8Tz9hR6QtsBMwoHfkxm8at/DuAG+JucrPEbxay0AfAVeS3T9XtTVPaBwq6J1KEDLB5MD@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvFGe2PIDa34pLSNLr/4ncMOi4XtKINLezRlMBSZKIqHKojwl
	SmREA+6l07SN3aHDOle07SAvcxEd5Jr7kqqBqQvlbg58j6FtCffZG/+L
X-Gm-Gg: Acq92OFwFrK+4NT02KDsPy7Hz0QGo8BfU5UpcgqrJyugFf/vUV5UIda7mtbvFp3TuGY
	AxdHaHhsHMFs2iP0TvDCklDHm57Vc1EfhTiQMdBtTgm5q5IMrQm7MHZxLOzXtXBESMldJwyXED4
	5E6HRPHSwRFy75PVNdnUKp/TCRSajfjQsszhjFeplAK+EC9gv7StT3Aum1yIgp6zquupVgPzJ36
	MRI98Yj9hpAZc2YTp5rYhB8HcTW+d6pG/pH4yPqrUetKviSU6c0QcQM4mQ080IeviCiYpY2pUMk
	8Uo0Nq2Lv6YSv6nxkfKR4cTMs37VORQCrMc0PzoykDV3BsKOfGjh8tjF6Jgr6bOQIcrjVFFC6di
	toTdG+1PGahiDs+YiAYlxK/57CA4J89Gtr0KVqcg+TDp6lmav5Py3+sk66JLkhMuVlyEE12xyzF
	/s4iaZq4mAgpl6rxnQ81rEyWGBCtpgxnEWYtxP2C5y1eXy+ajF22gYmtDWD2ZSZL9lbg==
X-Received: by 2002:a5d:5d10:0:b0:44e:1984:5f3e with SMTP id ffacd0b85a97d-45e5c5951f9mr4409926f8f.31.1778842159282;
        Fri, 15 May 2026 03:49:19 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:18 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:01 +0200
Subject: [PATCH v10 3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-3-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Margherita Milani <margherita.milani@amarulasolutions.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW and internal pull-up
  support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..72f77e9edd63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,8 @@ aliases {
 		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -221,7 +223,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -242,7 +244,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -374,3 +376,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
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
2.54.0

