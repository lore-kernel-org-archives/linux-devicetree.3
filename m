Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173319;
	b=RZ0zgXpWTmc71SY+z4FZmVnZWFqM6dY0iPVkQvVdBLluBMrmGpfCWC+THoyVN2MYWzGr
	 9J83Iv3rSDYlyf/tRIdf6z49/SktWA+jS70F7jrdgIK6kCDFukCrFQob5C1SYiEhfq2x8
	 UGyvd/h7N08xky45m9URsqMfIxSgqiR17gmzKSFQq+IpbXTHgKgBQ08NfsSB51+bZ9v4L
	 tQwxxfyVpS+0udLpKZ3RA2cUgBUtD4kAUkUFDcOyTJB2EQR2Cn3mUDnXZZfjxXN696I00
	 +M7Uu/jBP5XQ9oGuFlN2rg9VrSEHr/eJtZnWRFfANCyyfAfEFoT/zCAsYQK5PS2bubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
	b=v6s2bHHoFTORqklQ7E/W0x1dOl84nvE72UOanQgHlwMdWQ1IyFeGfbbRAEMNFuGSHkrc
	 G8xosaVx4vXq3fNiX2ZkLaKb5XqGZFXB8o7+LfkUaMhqz5gqfvh4IBdLbpW3jzqs7uvtF
	 EeRQuO0Z4kpkkhXvJY8KDhFV1n7SY4ZlJi7An4m0i3KPkLdMCIJHbENc502x/Qwtn3rxQ
	 nfqpD2XCs/aOxzsg4pubmoWhT7gywS1cO1qF9wcZw+NQXmB7UiWXSEJjVsbA6PB858HUm
	 MrCMYmDKscCVwFXYpDxdcNsaHKn7TfnGVZXnatnrhm29kU2r+uXka9ds+uRzNlul4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2AcM23z;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A555606A337
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A555606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2AcM23z
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so229589f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173317; x=1794778117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=v2AcM23z1BVOLFwTZKhszyXsOaKS2NgJhzLGOR/HKF+uWV+fg3Yigp9Q0rJrrRXRPF
         n600tkwCP2SlPXnvgldYU29T5mltCD7rwnIGDiSbyGMRfa6aH+R+VyTipdEhm8myFcYG
         GxFAOepF9tjJloagYmtXkLWrxssLrOcams4WZgVtYf0ScpMjAhL23j4cHPfAt27mRsWN
         AtwZv1QFbZ/eJdLPH+a3kH3ueIrXwdd5dlimK3KA8/msL/0dxBMEI2k3wqHacp3LSRQw
         BsnTiMABx/OVq/k9klM/27DhUTQ+6vQc/AtBeJeTpDqi48/u0X24BjADKHn+GKMZDxyV
         L1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173318; x=1794778118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=SwDXf0VRCkZKJ8dBO1/elgDutXM2eKsGjGyardJvRTbMZnYQ8KePi+ixqX8vuNnJOJ
         fZMgufvNrFwUtyWqyeLlSGSZ1zD7naGRjTU9mTldGN5lAlKGSZ5QqsgbH8GuQq343YTB
         0H9nnBFddHMETcoDu3zNONPiV1RTpWSKdrqhv1p0GLr5GLv4CT7JiHZNbYrvaMsug5AJ
         7DlGiwXrpRSM31v0mdi415BcYad/ze6lq5nElzv1RnqZ+nFuR2/BpVcf9UcKbHGBIq18
         mVp5lvjKb/YnZogyl5TqdZY7IrO7js8g2jH+a5GI2FN/lj1MtzcL8VEn8fFa2YC4aVA9
         gidg==
X-Forwarded-Encrypted: i=1; AL+hErGvrLtRslqNTVI7H1KKUOYT3a4bgnrVYFhRkGEPCENikPaESiTKuOfti5IfKqb4iHK7ZrspzWMT6vgU@vger.kernel.org
X-Gm-Message-State: APuU4Z8+pFnCzK5eC8nTapCY+/pmxW0uOcRwwNSjhflAeOkzydRdrrzx
	2NJG229X0Ycdwt/Mk5cixCeCVIXNDtBf9mOikIs/YNdP8zYdc74p64Q2
X-Gm-Gg: AYBFou3chhvLLUaVLK7dkmxyjkx1AAXLyi1cW8ZvjpGv8zWoFAJLJ+REXk1ODNPYf7h
	PjwrpxZ5OOUtRSVYO0G6/ruQRS1Vc0ECPYQAuMkCTpEkXakISnUvzIJ/kLD377OJtFPUnPu2BlK
	5+oZQ2wZOy46Z4moHhck+Ovn5o1M0FR8Pz0BpRg5Yf3er2Uqrnwxd41WmbGaI3Q8309sF501iUf
	Pxr95tQ16P+ZauW7VVCDigx1yLpnbPxx6WwqTHrr+y3E6P3Kgbn9oHPpgNeT2CjIBIdJvuQY8Kq
	L6rxfjxOA3l+FH8MuNy33X1BHUaQ93fiBogSSrA7r3MqpdhTemsSVKgragOKffsbooOWOErmW9d
	iqj5VOgV5IN8H2Crf9MxKl/57pC/z//57jPI6vat76jjvPF1ebZJvaiEFhpwmKOX2h2Cs4b9ApS
	vxjvOxHzrUkL8J/M2A5aUEwmKzRbryTR3tTckkKZ7d6d+xQFB6vTE4Va0z76m8GaoCBgZNHBqHb
	p0Nfhlb1x+IyeDTuyEocBi8kGmJwwF7Gzr8oeUdF9a+kA+hrzHa1SvZYXI7e5E2QAwgDzlfIq1S
	0qJaP6i2YroOvn74tRWiioXp3sA2QwWIsg==
X-Received: by 2002:a5d:5f50:0:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-4958b34c671mr4024764f8f.24.1794173317559;
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Sun,  8 Nov 2026 21:28:25 +0000
Message-ID: <20261108212826.15890-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0

