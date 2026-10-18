Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683F49B5A1
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326773; cv=none; b=SG1LbtRbC8nWc85XS+qZp92tQ4pbTGjumGnwDrP8ZNdNSD3XWoDwroTK1QBninOnqHXoxA70qMch/B/JXtOXY2JHTGW3JbPIG44U8yTLWa+j1H7bYIydk/rxPkwbk7XdKS5ojhfCSYRwUKeDFp6JAer9Q0yRMzJjxPnARH0hmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326773; c=relaxed/simple;
	bh=zLxW7Bv3Ru3U7jHr0/eoztXfDcqq0fHfPDwR5r/Ud/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv8DjF9lUFYqU/1dl6Sd0/u30oW6eyIOEvdpvVL+bPdxU6MelnZMG/2FQjjYnFDEYDVdVc4UPFB1QIcmcmfwwNwlwdu3ZRL/m9jtpI7Y5i8ozrkTOGiDrFjOD13lScAAu6lyxU2YbLtVdk15b/A+D/Jv5HcnlPUKTezBjAPEB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNBI3zNh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNBI3zNh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so5140695e9.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326770; x=1792931570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=PNBI3zNhiPVrd9/ddmWKVYOutTjICv6ukxK4ptNw8+tOzRxoOR0wMCNnA6Zev0P8Ub
         gvgWxEGHYyb7DsZDjEYSA+9UDBRm/YJqUVXyd98Fk9Nfl/A/dJyyq5aJ+KPLx3UsUbqB
         0P0HOZ0k+x7Qb0so+8S8vKDDxE9j5yLSqRREAy1Qb3gl8k/74Qe/xYMKY8YumA2VSLYW
         wwFEb8kjgazgGOwniT4gcW/0+urDRtvcUXvaaXx5Jp1jdy0KahJLZBALwO23QEv5k8F7
         8bUDRVMk6dfdc56mwWn/RaJdky1TafjDKi2+Ge29c8D/e0q6Qw7IQ1HXq2nrsW0OxDJP
         7Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326770; x=1792931570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=bGol/S2hV75wkLWWajye6/m2HAoM41pET42PZ9zuwNK8KCHjKhGsWcbMbrw6n8tb8y
         snvCNFulgdxwWuqMayfHhWJrh47GagjS6CocvuOOzJQ1mFFX483bQR3RPJfQUkR5oqwn
         5j6KSefRShE/EzPfMSFmd40fjgG2nEiLeUGd0Ix3Vg2kWdqeafpYJWSItZb8bQnczyQu
         ygs06YEkoWng+gS2iVX2QDCGsZ2jfI8ybM5Rps6gFnGXfStWlMJcOYIKl+nvQpHaUt0A
         HK0gX/aCMWh+2Sxwl4TPES+W9UWHA8mKRlWVaRCDKMWZ5NoRbAVAyV5AuqU3x4Z7AKyG
         BO0A==
X-Forwarded-Encrypted: i=1; AKwUvBzpbImMxXNv1dzuotmZ8xfvgz0VGLmSJTgIWhbEvaudATNJdQIlvM7Ajfx4jdF4VZv+3eHWy2ldxKnh@vger.kernel.org
X-Gm-Message-State: AFq9FYKacHfZJRmndH1smtNRCCregPkWz9/bxkIRHpF/4zKX11iSbWV3
	8GV1HIMbdDdd4QcqLiogCnjGYwNlwR3QJ88EXT1xum6aNtYYn0AIJJ7evvLIcA==
X-Gm-Gg: AYBFou0evLHyBNMmnQMRAK04jJ1aOk0f+GOxRAn0+nOemfHsSewtBR7PLOU5oDZNDb2
	FZhoIhR5DPz5cuXX0NP1P7hIrUxdqOuxkWW9eM4AlR+KbP/opp3Z+e8dv+hf/VtlnrEbrRzowdK
	wazEv60wo4L44wVmCUgDmYFE/x9KbUnKPxVmR8LzaHlOuAAConUmMjJcPnWuiIHqk+n1+AFS9qP
	vu9hWj4sUeycgokqTI47/Wo8MgAtciLHoKKoZUjAptCddY+Kdy5WqJ6xtYNDFiJBDhiI7kULfsS
	ya5nslqJkNtlmPKFQoHqW6VIeFXROM1pGmXxcjxNuQUzwPJOAQtXHQRpEJmfiNfkWgLZ6qguxaM
	uqYCBFF+GBsIE9uH1yCB44jXSoQO+pbJPaphfRh2WPM18ewCGOheqGqHGeZUv8j66OHiMSLfaoz
	A5WTTR1+yxlzjHcVYm9FegwbAJgmFlshM44fukjV2ofV1Es4H3RVI/MKDyzqGG7F9aAkGdctvH5
	ein6zcqTHjTER1pdDTGmuBPzEJK2WcUqJ4rjynMxGAS9PwTW4wn7koRnhDMDU514cxnKUxltzkI
	gGcVODOQHIJRfQHsvu23ITY=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr75981735e9.4.1792326769990;
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:26 +0200
Message-ID: <775959bbb03ff0b5dd5c45b5c8793ab8945adca3.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 24063bf8183d..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -104,8 +104,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3

