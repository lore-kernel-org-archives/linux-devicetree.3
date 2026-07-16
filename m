Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD32E62A9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169240; cv=none; b=s8gsiRiXbe98aDc+dd2JEg0E02kupbwtDFMup8lJX3O3zKnGt5wyUZZ1VZxowQVE56qv586Ds3UxirAE2cEeckWnI4roNbme/IswZWvBaiclXaC8x/l3kKPULcm8Btd3m4qdRPfKElbKzudYZMdXQ+iz6kOE0GrvVihCLpo2+EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169240; c=relaxed/simple;
	bh=DcxIBTDfGFMcjuFLqAGUh8B8eNoT1j4rQhiygNTbZAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mOi/rNueK3WgyYBxM6sT8Tck3/8PmUOhzKkRxOdDgGAHQd2kwQJBMEDH9lu+nNVOKO7KlUMswqvosICNPRJBPWxu8oIWanUyjDEd4c5Fmc7H1+Eonn48cumG8jzm3mdYtAP2lxgmgVZpVCePFH3uGcsG8y1p0CRh0S3EPn2xODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+PKXmwG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+PKXmwG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc97653887so69960425ad.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784169237; x=1784774037; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ufvoepbkxBTccdbf849+Ndmklty3uX56AMakRenyADg=;
        b=N+PKXmwGBkgvxmEWT2eUNWfrRLb5YCm0ZZ/GhjBc1s8GqZibifUERAP4jdQeonGhTT
         h9NE89OGNNWc1VUtzPJxfe2D3RpehHABS69gWhU5WC5J0BRRFK5JTX1ZgkSNJ7wQISQq
         YmTMN5yL8Nj14U++X4h/9ie3FTdWQismgNRXo0Hearmup/XgQTkNP2yjZEmiYbIv70XK
         o8xcG/45Pec/8M7FnM6UFJb8fdvkWecEW99H5Y4Ea6s3NIf8YUSeClDiUDgwBcFylnlt
         ys3OKAxrru65Vhishcw0CnT6FnFWMvEh+ADfseF8wdeUbGHTGsTtFPde5/n5PwBt1xQ3
         XDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169237; x=1784774037;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ufvoepbkxBTccdbf849+Ndmklty3uX56AMakRenyADg=;
        b=bvWYPBUzqw9PLZ2q0jbjNNTFiZHSGyekrNc53xJ97h74ja66BTUKUc/N/CtINKNFT1
         JYdi2y18yLPKZCMKTrE4v67APms6u+EVD+E5qfM5BfGWg+17nnVczWbxA0jCbi3NzVR9
         6syBZqYvbm2LrencYEe0ayAlELN9VvFNoiEIF+OhXB1uMTIM84hW/EwDh6PmTD3h+znq
         O0TY9SuilXjbXYdywKIXOFgyMUd7oyCo1TTDsf0p2QmRC0B94n/hOon6f4n8JBDpCcDN
         H42khSgwKYzmUw+X0vPR+/nRq2nbR1LvSTUb9g14XGX14Uowft/MBc9UE9pTdNw+shUD
         pI2w==
X-Gm-Message-State: AOJu0YwXnfJVz+D8Xp9KdKmFpygkmYQVz/em/hnoKMN4VvsKoMsCUtTu
	UraMC7p3fUav25FxNbu/I2aPzgDgHDsHB/YN66ByGU4Bi1QyEuK2QALgbNwbuw==
X-Gm-Gg: AfdE7clFSsp8qPEm0ULXBFtWLcI6JkHJzKFGEL8Xd6B9Ne/C5/IkPAxTPStduWW2/H3
	i8hYxBEdpj8OjkQ4TspK0C4/X6HC51TSAELecDDaSx1ya1Qtb2c+vzzRDY4siTvVjaQbPahTx+i
	kgcui3No/0Xwm4sHPzu5OrbuxLfgWMJ3OwrS2DgrYo+emIhD9PVHMsJ9jjH1x69PCh3PwuhIKy4
	t5Zc7Pxfv2Fq3MB5L2bh/NiGcwQZARa4efrtWgwebE1CLCi5krwTyI6pQWnwMergT8xTI675sfa
	jmni8teVUbH50L6XhpQocVpc/Yph3XgfZQcBpq8QfI18WaLCzlSeRVzTrkDfhgZz/rkaOupQWiS
	4o2DP8UFmdc8U0TilFIHHVRZUvUmX3aKK5EPgRtpo6AywWhBELJRHClFouAVgu3+c/pY57XFBJx
	NEGnBlrtfNm9oHVvY/vTrtK/0Zp0gxWq/vLFMNWueSj1CrmvX45ZnniVU=
X-Received: by 2002:a17:902:ef0c:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2cf03da0b8dmr49619015ad.30.1784169237122;
        Wed, 15 Jul 2026 19:33:57 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm11540255ad.63.2026.07.15.19.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:33:56 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 16 Jul 2026 10:31:17 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: fix PWRGD_RMC_N active-low
 hog configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHRCWGoC/yXNQQrCMBCF4auUWTvQdBGDVxEXSTrGERPDTFOF0
 rsbdfnB438bKAmTwmnYQGhl5WfpMIcB4s2XRMhzN0zjZMejsdiqLkI+o/qSOTV64JXfWF+SZpQ
 csaBxFENwzk5koYeqUJ/8Ts6Xv7WFO8XlW4Z9/wCZYzsfhgAAAA==
X-Change-ID: 20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-18ecbb8862e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784169234; l=1357;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=DcxIBTDfGFMcjuFLqAGUh8B8eNoT1j4rQhiygNTbZAU=;
 b=AQKaX++ClRwxml6UKIVBauBZJ8nnK2N/HuEGZjzFOYDNDs1nhvSfaa7KcbzWT81FNH/I24l0P
 Z/PKYqJgPqvCg8F7vsL5rVg7sxRe2+PIyfIT7ci50DeBG3axZfL98LE
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

GPIO 14 on the fio_ioexp (pca9555) controller corresponds to the
PWRGD_RMC_N signal, which is active-low.

The pwrgd-rmc-hog node currently specifies output-low for this GPIO
with GPIO_ACTIVE_LOW flags. Under Linux gpiolib, configuring an
active-low GPIO hog with output-low sets the logical value to inactive
(0), causing the subsystem to drive the physical line high.

Correct the hog configuration to output-high, which sets the logical
value to active (1), driving the physical pin low on boot as intended.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..ba71f1f9768a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -592,7 +592,7 @@ fio_ioexp: gpio@20 {
 		pwrgd-rmc-hog {
 			gpio-hog;
 			gpios = <14 GPIO_ACTIVE_LOW>;
-			output-low;
+			output-high;
 		};
 	};
 

---
base-commit: bd22661baff3295747e864c8647003e8eba46dd9
change-id: 20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-18ecbb8862e6

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

