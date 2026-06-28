Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02E2E1C4E
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666432; cv=none; b=CJGWqBGq/Oa3cOrr+hBEn2cyLpZ/M6qHtlHl0OG0XcrlivhcUbGDq/+nQ4waG37Ydm0L7UJBqMt3U9Uf5XWlBrAtVlti7ClBkH/rpeoYQGU7A+7eoebtqJSrW4Cwd5F6GVbk5Bgi8jMuMqHRDJrGdzOd21DnLi5KRVDLgbK7oHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666432; c=relaxed/simple;
	bh=SPcpaAcyXMo/tXJoksDECaRG5+ZGY0ehHVh5F081S0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLvm2DnA7tK+sGRQ4uJvsi95DEzRiXTpxUEBNWgXvxKuQXz91XkxLa/Qm03bOVS0BgYEu52/0lpmVOPo5pgihbzwR0CDdvdG7j0BxcRmb8G1fcn7YYWWeffUdLD708tA7f7Fc2Xf6kPek84/AIOmgSxxjqa65lAm904SQy8OjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCHznQDz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCHznQDz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4936e85e0deso6200165e9.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666425; x=1783271225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcI4RF/85Hhir6hatnhEodVMpREEtgWBRDdJx84jUwU=;
        b=eCHznQDzNFeFeltRY44+B+HkG8gzZmEhWOlC5BGdlAAtUqGdYXB2+4IjxZLW2VE3Pd
         A4QGOHZyKtP9djc8bvVks8qEFCMh83seDLzaEpwtvHh07fARuF1pS1ymMbFC9QHrRVpf
         nnwrL/3u7fzb6nhZ6ptDweB+HaBRvC0PXBh7NTmhhDI3eOLE3fHS6FUJ/12n3OEgObSY
         /e0GSvORQ766OcQpal6Snv77B3I1uJetjv8mDfA9JQn69osy16d/Agu6exDgMsQf6HRg
         gr+IQ6A4wOP6cNEP7TC/mQ0ejM/iKa4IH8JHiNY8YqLjZS+mjtNwFXmIFU/QiLdACurC
         rHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666425; x=1783271225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcI4RF/85Hhir6hatnhEodVMpREEtgWBRDdJx84jUwU=;
        b=awdbFm3lIFUeG4ClQ5E6bHPNqVam0SurN9RHtJb/ib0jtz46LOow76/szUxJ51VhQJ
         zvwP5XcF0Jc6xIhXQ5Ycqd5EZ3Oqf4p6PDksNxQgbO6lL0/ajiZT8+n00wTkdYRammTI
         eqC+rwwXJj1tGupkbS95D8RMolCfk2HlpFSCC69sX+XCkAcrzzvOPPaRJ+v+MdZ7ZXqx
         WD1WutYyMXmUJ/R+XzSdLgwUHLDrvVags6k+n+YhC70qAOGUOMJBgI6emm5hKIy0sOqY
         9tasrGDRQuhHADUMDByaJLPRdXPXPxo7+BXhpJeYMb5eLvUF/aC/ZCtExAWXk4BDxQje
         oFXg==
X-Forwarded-Encrypted: i=1; AFNElJ+c2lOgyReoXSoxF4CFgMstf/GVOqTcbdsUmr0abdKgOAdEtxgRZDktletWXdDKDeIP7KXwCQZA9HBT@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHQV/wuLQ/o14UHUa/6fnqGt/GO66zFg4I5RTIwKKrCtztpdW
	HhSjiq92/WhVWksYlW+nA13EXNWm79nakRAgw/KPISbr1gdqgub2mVAp
X-Gm-Gg: AfdE7clYLUWPG8nCnx4XGYReOcpb7QuzyDAN6EzRRbdmpV3nEM9so8UJj35Bqi/208y
	GhsImhYeNeOorbfXf6XDtGj16fTPfkWyTrWShkgahYQyhG9qT3oW7CNmj0NHbimIWLVHNwG9Ndf
	H/TVDz8xxD27ZwX1qJMAomLwE7KKc1LJ2onJQbicNdEI1vCMexQXldUxOtIVCcAS/b+9CqFMqxj
	LKm/bUEeik657PXBD0R2hPQDth7oNn7bkT+R2KVRh+6OOKwkq9G9t6Prad7EcyVXrLCoKTbIZ/T
	kvOXUHCBwCOGUkyFHDhjvz5DR1+u5zuB4yVDmbvjRYKAYiMhvH9vJI74BMiriGiR509WNLd59nH
	i0/uEWv8Xs/DgRSdmjNWASBRAs4EOqWUl3Z+i0Igo7jmiiXxiKwhcQsGCYzc7b3V5q8YCyWgn0A
	AkVuhsACfdMJ8SFopmR2ic+jaAOGrgC8PKSK0LnkAn7ZwL+2VKrF9OHxlwQHhCZ+kX17FWgDcCH
	+Y7846fPU3s9Lkq+Sh8hfQq7A==
X-Received: by 2002:a05:600c:3b13:b0:492:450c:57cf with SMTP id 5b1f17b1804b1-492668ad60fmr219184025e9.31.1782666424789;
        Sun, 28 Jun 2026 10:07:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 4/4] arm64: dts: am62p5-var-som-symphony: add TPM support
Date: Sun, 28 Jun 2026 19:06:49 +0200
Message-ID: <1cc8986ca13373082e93fa390e4003385a2d5638.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset signal is driven through a PCAL6408 GPIO expander, so add
the corresponding GPIO expander node. Configure the RGB_SEL board signal
through a GPIO hog to keep the board in the expected configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5c41647ff43f..8fe8ec903d3d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,28 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		label = "tpm";
+		reg = <0x2e>;
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

