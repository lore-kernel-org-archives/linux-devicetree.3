Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D948165C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629966; cv=none; b=PhosdnlTBesiWM4WP9EWPVoKPySB669+xru95FXM7TpgqOQO1Q+zl5jhobBhTUp8z59L6477cNK8nA0XkAj7JdYhqMM8SJPiboAQpwzxE89SJHF+7X2fFEasLkwhEU3AY8f/NI1ENezzFassGrrV3uwoqcDvgUko/PIfaDvtSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629966; c=relaxed/simple;
	bh=ah1cDBDIZ8iXgmzLNyPQB+ryhZ7bXr1UEe22NH6a8So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/sHjSq0BvJekJG8RsCGBK/j0Q/F297NirbyAMnG5UANZ4kv6Ma6mNsUBsAjefN9tlFowP9/feeGKU9VfgVgOVk4pmSP7xYqVl5Ff4CV01jzjqcjKxNWGKgaf8rs1dpaWgOFrTVRg0E6RGVYZhPdctWeA0q8wsuBI33WGPlMk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJS2nmFs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJS2nmFs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956242332dso19745585e9.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629962; x=1787234762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=KJS2nmFs0b/y8xNR5PAjLADxvlj69NL/F07G7wPlTjmTscLPw8fOmZnPUOj8/PgDAJ
         js7bqfQwfM0ijsKv26hwLLmGs1YSbz3oLFgOYu02BwxhsGpOPZIUsN33CoyflYXX3pbl
         Av7KO3TBGYprOGZBoVsDx1eD2ht/nfufJfk3+/56M4q4J1XDCMTo/0kQN1V+TuzbWurC
         uSrGTyIuFg+5K+kqIqokNtE+hLMrwc1JIjJVU6JKk+8uEGR05FV1ttrgphFyB1cTGuFA
         Y8QwL1uQzfZ6/yBSF/KjiKNP6sGnWHf09h7Ea3nt7wTcRyaTeUCwled+moxCK7eX0Z8q
         SwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629962; x=1787234762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=KjLJpEBzilv+IpKMM52pqb34nvgZS0xsh3vB0UUQwdes9XNAhScC6UTOMy6v0IDRgV
         5NwqhgZI1mM9QTqU3Hk1Ee9Sz0gcBZWTC2E+0JVLiGrXczT0hsuPbgW0kJB+xRLz0ziK
         iO8Cu0A3TDSGF8GE4DstbDOG+11oPy0losX+Q+prIUGFG8wxo+kXP5u5qi/satSWK+pG
         g3QiU0LCaWWhqYYvei8bNFw+4pgY2qNO/pdzusGajn2kHDR3PFfYStQulPMBPKn9MA47
         FbCu9AJZEFgcA1+j9SysYRqvM5/k/qZ1bgDLt7P+AiqStkKloHCX+lNhGtmEUbLyc+pr
         dgkA==
X-Forwarded-Encrypted: i=1; AHgh+RoF4+moSL3LBw0+Osin55HsTrwojonYja6bcZiTDTRyaK60ELnlkJSZlVqTlrOK5Dzwnd5KbuVLCQHU@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSU74YeWo3cwSVzA242y9d6DFfKpDDcG9xTYG7AmwRDeFnDSO
	Vhk3WM/xPMKGUZxEfFHJhlUCYNqYLAnScgaXRqH/vnWjY593FwOFOGIu
X-Gm-Gg: AR+sD11pJbxGvwZ6E9FpRVilp21PIUqELd5tv0Q5Dy1NZNoVbRcwZVQuUZQoHrhfsKn
	gfG2YhMgPj+oN/JHxYf8Cu7qiuxzEkUZQ5v6Z+okhvxGe0W9kJSdLRFXqqxBtHRzx4ExCziokgJ
	kXemYwsa73H58hueWdfFAS4Z0a3RyWjt/OBZ218hTlPkvpI0pQYO/IFy380x6gVcsTw6VgUSIIH
	asVD/pFWPKg9bR9mqFVXhQIFiTPPwqUdTHyYusMCMhUSnd5E5usihPY4RxY6Ay0+tmbRUF6hsc+
	InFvPeVxjj0lXYzZLV9GCiEXdsPX1khV9ahnbgCuI6IrFJQzoAu8OV5AkRAxuUiXxjBS1ZRJ/P/
	a8knRfaL9VDqKH6gmmHFmyN8+kAKXALh6EyHaQlZJYbgfVAEUSQUywQ6dCrTVpG+QDfrJ+KtVMg
	ikyfQavZ5gSlu99wwbC/6WiRlllIb20ACBulELUI/QIP/Pwx1W7IRQQrRtlRx1KYI5KA==
X-Received: by 2002:a05:600c:1c25:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499821d91d9mr57412055e9.19.1786629961887;
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:05:56 +0200
Message-ID: <20260813140600.1824949-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18:
Ethernet, USB host and OTG, all three UARTs, i2c with the carrier RTC,
SPI, the microSD slot and the RS232 transceiver hogs.

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
  instead of adding standalone entries
- use hyphens in the newly introduced compatibles
  (toradex,vf500-colibri-vf50-on-iris, toradex,vf610-colibri-vf61-on-iris)
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 308 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

