Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E835AC10
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005973; cv=none; b=BvizW+327Fhhsfs9bxQf0Asi+JgFdb3bbWJpvHuqsQc0+iYQf6ENDjYYV9ywilBNVWB8zOwkmpofoasrxXbpZ9WrOL7L8tAAP1r8FUNgGPJLbWIgRNwqRRD+w5KptCKg7zm8yiACzTOHkLIOzKVmHFTjJpd1kNvmonmUC7uEeVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005973; c=relaxed/simple;
	bh=PU1U667y2KkiOIYg6ogzcCeA/B164C/gv/LWDFCZzMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6BEO7tsYr2Dx4Lcvf05LBqQY44+sCH/8uLXeb+w/GcFtDAQiZnyncPvquzdQEKRgBi8NK+YS7GMnmJ+IAtm9ael5c0Ic4sje73Z3c/N0zSmdlMqaO5KsYxxbcELRFCLmABX8qeHUOqpvHWqqOgk9a7TLo7Jb5/hmtoAV4fIrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu+JunRa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu+JunRa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so4379951f8f.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005970; x=1780610770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=bu+JunRa2eYLZ9zIwKOyOwE+C1rsvJEQ2Xvn5wQ514w+HR90lupH6qkmN81kZ8f6Id
         DHHzEaFAcSkfTu1XcaL/38uXG8bX07unz34MMHCN6SjJ2CgxTKPVIC2ihyOWCQ50TIkA
         j1Y4A3TpseNL5BKXfR+wYoWuKufQwogGCTfSdtUC8NioqB7UXmRLMHDaWqyjjGEfEUMA
         +Ye9fYLPipoLLF2SmdVTRbis24nn5NKJdU8SayqT11rKHfXESVtdnMiOhBz6035tcbZc
         RnUYpEMW1tx0hodZMwXPYXayfEKurDNAtV1mC9W3rvi6liR+iPQ2DAHXeMntvlxkAPNU
         SN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005970; x=1780610770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=sYPESU/yRkxqYZuBwvFXPeY0SK9Ps3Tf/KxNmFuZYn/gRpHpndQxf5b0DNIIO2Od72
         zU2i3s9Ndbv003Jt/NGbHsUka4q4r5kQnXR04MiGgXhH4FtWWP33nLopm04KXXjjQpES
         yGtYzdCPN9WiCKcKqXo8hp/rNWlKgOybzueV1jf68qXoV8SaloqEIBYrWhyLVKymLozt
         q+v9FK2zegayqWu1rhZvewraZf/xKXsaRo5tOW8wNUA+pdbuoSynYB+gs4QmZUAlB40c
         8DATnvCaJ65lrCKQZR3QYcJVDq3Ioz96jDQ/8LI5Uq20iJJkdkLpW9DH2DcvZLXCMJmK
         VV3w==
X-Forwarded-Encrypted: i=1; AFNElJ9e9TzSDy5EFItP9dwYGJ56qxifH8NFHPD8wg8B5LbNhf+jD7FzT0WIvqqW5aGjEfNlwpVM6s7wN5wd@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyI6w56Je/+NMVHR7/Mr4K7FPQE6wmEBKwSrygpTh2ufTc13c
	796DcOq1I1SvxyHyp4TbCQNrWZdjHQGQzeYfSBPIZtHjK06uqzDpp8fZ
X-Gm-Gg: Acq92OFTEsOe0O4wl0K0mXHeMu+nc/S39Nq/eBI9u2QCC/2Dvv8re/Nc9dECRQf/JeO
	NYc0c6g7TcyEw0uaRm+/p+lm5O9EKBHGennpaReF18fpmoY76bo9uZyapcMUnwCJoNpsaUhlNcq
	4G92rIX8O5GF4NsdQnXSgqyKPX1YHHoIcjm5AIA6mKQ/spOcic6/tk8Q6rIlQRs0iuLiAE89sDV
	hKK5lTqrXsb+lgGohLHu++4iOOIOalbpIZG9xj4Q7lnwl/xfoRVWAUKn/+JsfvG8KOahSh/Ayin
	HKdg0tnamI811N2qIkXHjXqUPiuKFLOyKYcHSJtR/ikQYrJetDDZTOBCoP9sCoqEeDccSXmUy8G
	oVmP9cISLPS/rPPONovhz6taPc7Ncy6y+z/bO5FqO9H9hzD2cjEXav+40lzSH64xk/9XT5cizze
	J1Kc6/EoBgmLYI1QtgA58orFdx4szWC91ux3qSeCOAnf733HJRpM8ll/n3phRBvkA0NgOJcphQT
	JzlBFtJH0WL5W40S5E/5oBTAeojF8fbaQ1sSnq/TfY7ZK4I
X-Received: by 2002:a05:600c:644:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-4909c07b4c7mr2974955e9.8.1780005969630;
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eec5eba06sm4911410f8f.22.2026.05.28.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
Date: Fri, 29 May 2026 00:05:50 +0200
Message-ID: <20260528220550.34891-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the reset GPIO for the TPM device on the Sonata carrier board and
label the node accordingly.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7985a42f5785..7a58ad38ffb4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -278,6 +278,8 @@ pca6408_2: gpio@21 {
 	st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.47.3

