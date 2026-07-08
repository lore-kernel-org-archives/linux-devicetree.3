Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC342DA25
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525128; cv=none; b=DmkGKFF2JTdbFOPxXQcdKabaPxPjm4AEDwKCXKTl3tuQwojsQicIENupd59ySPQ7FMtKJa76UilBzTjiw0VM42SSGKS11s0qypOG6WHRo1Fo+OtW4B0MP4wD6g8ZSapkmYR+gJImGHeRJPz7eANyHCrrv69mdSZUxzlmKaIa2Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525128; c=relaxed/simple;
	bh=WhuQpxIJsHfJelMhpqFK9UR04PUwBIxESY/bbTEtu84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYDJMInvmvBhG7l+8nzdJDvsRLAxxzd7syD+8ulZ9xcYDNJSgos+fTaHesGQP/kGPNTYrS9lAZuAX9uSuQTinz+B7tNKCrq+SSZ4g4W3ehBKqXUaZ/LywzJKVcwPQX9RQddCWQfaniCgJZ1Ys4GrdQ7i85trNzQmxJvo/g6QBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=X4rxrjy+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="X4rxrjy+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47dec32798aso860377f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525125; x=1784129925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=X4rxrjy+0uNQYD8BxKSXRIjdWs9ySfXvMHsg+u6UHx69Wk+UJGoVtVKdjaFKoCpf9p
         r3u99/Y4OdLmN2PCxuXhJ898WvL2vHZF2zmcPyeWmXOYJ8R0hwAIwYgNVd+bOgsiNXyi
         sKXqggCL0ojmvFobYe+CPQrP4Mshw7XxeoKueebr/K6kr3LTVve0/hftqK2CK3J5ymXx
         o4s8PEMyHsCAki4C7di3xlGiFtwot9coVeXCUR2Gj3na1ETlQH72KC4Ff4oFTdWnU9Aq
         Fd/ShzElkunyVGa5jJOy19O9dX/zE+0yagrVw7rtZJEMdG81RBTraZun3D4MsqAnt4D/
         wz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525125; x=1784129925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=CF8c5sv2OLjB6Vnonojl9T9VWwrRWyi6bnQVYcXlneUuAK83+vPrAY0Cc6ZKZk5lZs
         Ml54yOVcez9MlZ0IKMLHL93UJx2M5hG5eF2MRHpgU1dIEYTA43HtpfIk8BIJ0siNjRDz
         3GfUpvWB6SET3rwBGzRnQ+aIxm+BhMbkBDcsN4cEDMtNOCzz4/+ZFw/1vh/gffuoCOia
         Tn3iM9+y1l/RiUq8PHw3Soga3cYVnNisPRIlXxwOkjeXLHuRP0EFoD3gAVFJBnNcJIGh
         5LB19BWMv9x/eVBw8GNlBNOF8Cglec4gQbLNi+X6xIFo692Plp/AyxXfRx9gfaX0wYo+
         cVVw==
X-Forwarded-Encrypted: i=1; AHgh+RqWzMWmF7a1OK6N3nrLyxp7MdjmvdlecDe8caxEk7OG+s8u9KLaAsaBRH+MfdM3c6NWLqgNPlhlUJlI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0mWtDips6ZEHZIPVp+NPIGYiWO0ph8yovyLq893vEntTsF3Mz
	zIKvdmbasAunmplIpFf/fTxdqInKjcIVt7RW9oVYy1qTjoh85gtP2KdFL8XXfh2cUHI=
X-Gm-Gg: AfdE7cnPXJgClSO3pjQMIif6PLwW+/MNghvyZqOVJQWAAvirNuq84Oc4YMrFxFGwKXa
	QQTbDfQwAbEyNGV2XQw3+Bx1OgvmffSKjVSdug4QyN7qpOweZoqUWao3wHNlmQtIc4t0M3wQiTO
	hp2T5Y4Ho6xwOJNQMjNDZIZyay3woI2XilWyIkwmqVQ4cIEXhMVk2BGeNvZm91KCIaq/k3egzqt
	J4ZxFQ7nf7yyRGbclQ5iYdO2ebT03lljAec/P6cW36dR4Sw1R9PbFNg6WcD/G6y8XLrccAlrBc/
	uH2nkcJ+5/egr8rK7hLKY9ot9DovcxGP5ZafaqgrI9Z0dDWYhQATj13PDILDmuALOzEIi4V9N51
	rMeIP19q/eMfInAh+8CzOKtaIeUxTWIloyTVWjJawAj8xVrVMUwbvCkEVDaDCokMi2K43G90p0+
	HlKYyllvZTN2oFnpEyQMVN20XCZT81WHNU19Dlh3T+eqzmVuTdlSvRBJaLuya9JbfZXVY4dSVOx
	+cvC3FUJC+s9updwg8+ro3I7jfJKSsd2ZHH6h8=
X-Received: by 2002:a05:6000:220c:b0:470:3edf:e28e with SMTP id ffacd0b85a97d-47df074e230mr4140001f8f.10.1783525125665;
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  8 Jul 2026 15:35:59 +0000
Message-ID: <39091b1d0c716da3502a691d0a0bdb7621693cf5.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..2b51749300f8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0

