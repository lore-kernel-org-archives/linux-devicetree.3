Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDF481647
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492384; cv=none; b=L0m87SG3O9Kv1dvGVKDAuDd/DlM/svnhymE//mL2e64E/m+F3aYjQCxAns8gQJrsuxcHk6RL+zFTt/j+LKFrx7Wyku5fb//h2BUzbGnhhVwbHC2hZTTSbht0PgtkGOwSLMbH10AFevkZ11YYJgVRbJs9SBOS25+91lHy3TNbsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492384; c=relaxed/simple;
	bh=O17UYKeQwvGp7EMKn9kl2+p192HpPzciALyLUt8KEfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHYc+HTVU5GCnAcK6YNKSieJDjdcSCTH1oahDGxTyleoyQowvYXc18USMlvia4IeLP68OJ3oxm7nLVEBcJHfCYbaBLnTM+JkyM3zDiwmqs/PUxYOqr8AXLNNPhYNa8NU11TFdlIHm95Hwy7b0QyjLPsWZXzPd1PmX3Z0SijzorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9zZeWL+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9zZeWL+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46013161068so1776184f8f.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492378; x=1781097178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=f9zZeWL+PFCrO4ZiY1TTgX6x/0MfUOu4vGsszjHl9KjnOer7x0j3qLyoCv6D74OmRJ
         n0/bi9D4EmNKzUWfQa9ar7qDUOHRYaMfuLIq3RdhSQ1x2RfNnn8L6sJLf4VfubGg9+/a
         IsuFLFOJCvxHMA7feAgw8Pju12iepuGP0e1oIVJduBHkuqMGvL07l/FwG+KH9tuGn9XS
         dkuLQb1TsKTn7L/i0zYuHwE4CqS1xQcyZVfwn726/lK/VwYzlcg73Deg2upeQZbA7Uut
         YFTy8dFjK9sJpHWoP3UIziQnY6uOqsGtr1oMle/AfqeQM1n3+MoxhFLsYzOwscIg2C+p
         8ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492378; x=1781097178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=sYObEYNMA6CaBoQSzPJZ2zXV6WZnHQ3q/CoBzPvoZcFvJ6Noy/R4TaL7yMeQeaHok3
         2E+X5kDVBXd+iB7mR98L3LjsmAqljqjHGAWh6txu32YT5Btc8421JEUCFHdME7UPonrR
         zaBovqD/0FoFOWkDSvWLIbDEmaOpbQu3Cw6h7Gl1chtE2bNrnY+i8sBbz5WsKRIOfI7R
         77cKSCdnpcSRJUKEgxk5DuyBl/mgkJS0k75jLTYen43ZHuZBDLEI8z2pYjmwsTXo74P7
         rV7TUJ4DdxKG9NFc7e9+IVDqrN8ToAwt235HGEvTizzeFKcELgWjdbfiE14lQD2+zvB6
         A12g==
X-Forwarded-Encrypted: i=1; AFNElJ+/x3B6Pu1vnnq3IvgH7LDt9XBfqDnmYV1uT8ynuIryRKKwe3cQFW9C3XPwNNwi/DXXEpyw1NUWIv0B@vger.kernel.org
X-Gm-Message-State: AOJu0YxluFLeEmfQ6KnYpEKAJE4NIT+B/BaZ26lIzIBob0osf/lSACov
	9atTcXtQcNb9d7Vwxd68O1/pmtniYuPTO4ymPGnFYi0jjzqILh8ANrOa
X-Gm-Gg: Acq92OGdOAj1u4mTBLmgyWjgZ0f5wknKEZNquSvXnXnJhCX6BuREK4FE81HhlUmsoNn
	DuKIKXcOSDl/Juyxen0NAKlKnjfGqMObUyb57fh0OSD0fryQOI69+QSTxD4NOJc6QiYsp5T7TOr
	6qAT8U4FWCd3AHBCHKoMlYALGIvgT7U3wSWsSQ4QUG6PUQsitkYcr4F8oIYzvvFD2hSUn7ujrIy
	BAQVKN6Xzd86vPNIiXxmndzF3snqiN5iFhtLdAqrNTPip2UsQafnr0fLJDNq6re766fLtZlPqbS
	P2D5lwPoWvNUHQiI7hYWTyPYT3ebx0YJBGDTTQH28PtEd3iUAffF6e5RoCfdSPzyaa4yKHbbThO
	9RDznn/eJIzLkekoFfAVQ2a6yuMoe5bbORXWWD8GtrNKwsNWA2nENjWF4nNYlytMvAVLNE490eU
	/TcesCcq7h7QOMgsWOSVG+0BJK38/PvnJv/8P0VtlEEiscQnXjYIo+IsY6mw1pjvuIDpIQIJ7Qr
	Wf/cKOUW9v94fFGujMki4awshJ2gKy++NY9z1qOACH4n4c4
X-Received: by 2002:adf:f8c6:0:b0:45e:ed7e:f8fd with SMTP id ffacd0b85a97d-46021783b1dmr3363286f8f.2.1780492377877;
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
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
Subject: [PATCH v2 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 15:12:42 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

