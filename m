Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6113C42DA34
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301317; cv=none; b=XjBMvNFZ5qN+FBkjVPNLao8VvuQQhz2N4ps8wl80KSszvKMG3+fMdRH1j+KJx463P4I6w6ZMXkXFujDmQ8yQoxIG2rokR8hsjS0S17t5ieYMjWAZdQocCfWLtQJpSnPqrJMEvBYvHS58UIP+abJD2wDiatYw7ShZ/U1rpRGKLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301317; c=relaxed/simple;
	bh=3f9fi8llMSWN7QxaGs6wFgdfcIwE1sEh+eTmD56RMJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJPf6OZBgZ8lKsZHcrh4I1+ittFENzdT/Xwkg2TELvt7rBkIzRAsCWYsRmP4D7AV4wOS4VpbwvXLQUiSKfoA+ZOu71scAD9OoaCIhHBUrXxYfCxqIS9YkfYY4M21z6WPVkFW5bOO5IrlZ9UWYdxpoaRUzeP2n+7vSb18joirb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntjM8gwA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntjM8gwA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so5192203a12.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301314; x=1784906114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=ntjM8gwAszgUP9LXmUNo/iF3cII6v5tdV9i84Iomzuj2EvKNLzedV+HrPFH0rUEuAQ
         39CN751MfK2qDNa9LedgmEaxqr/kKqyzX7WGByNxBVXf42SRoDk56bfXR2/Z1dGu4jhO
         8AAEM2kLmLCvnLCVgcK5GdOqdu9J6myVat+Vcm2E04Dd4b27QmJr2HB0tik06Nmhpqr0
         f858PVWH39epfxX1/m+8/nP0SRQtJS0X+Q3cMTZ6Zv+djqEZq92fU1DrCeQX2BedFkbE
         XVcfgfjT+x9wGZSHB13g7KHo9MhazFO4KB1c36USCg7DoqkvfU5lXlqf7YMIXGQad64Z
         ENrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301314; x=1784906114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=SLbTwyAlxIR3nYUt4kD2rzul49TU6Km3ttk/0X+YR8YkhOjOzvd1AKeH1fmnpVhg9d
         oT0S3RrzTm6Rl0bjtE3W06eq6DJ+uXKUSjruze/R8K1jj/7/18FgyO5QPMKjGMv9R9mz
         VWHspgMOr/jdijcbM4lw3xiC+Jm6nz6+RZ6ev4ZNi+EdHBRbJhRqWIwpiibwUUah+mMv
         c+YjYA6WUjwcKBPabWAw6p7pwPM0IdGC9q4q+PpnlqAeQHms3rVDZZA83ZUsV60ap5BI
         EjMskUwBVp81s3GPNp4gHHJtz9cNY65iUaThRTAernHheXXLJnEJYhxfZIjV8PLyjavt
         Th6A==
X-Forwarded-Encrypted: i=1; AHgh+RpEMD5ve7hKpMVPb0+3+V2k98lg8wmCP89Xadgiq5Jssv2iq81zGktwJUwiVjsUofrO4OxJKZWdrMd2@vger.kernel.org
X-Gm-Message-State: AOJu0YwJw36jM1t0lMPAqpEGyrH6lZlcHPomSmxYgNW35vY5fOlXENVL
	p4alCOOB/aN5sa2vRWSnP2ONw54MDYRHIOooy+GMu3XhvbmjEPigusct
X-Gm-Gg: AfdE7ckCNTIR+D12JVIExMuBBpVkzH7JnDQl6s3DgWWjm2LJ6hmfPT+PKNKzfklsHbm
	NcMMVGL7kPG/9YYWO9yxJ57YCOEKonigdkiIin9VBIYHN38qSFeljDb5ckJM2jHdEN44bqyRzLg
	pjQZwJU6jZhntXOmnlryjtGDubAxZ1w36Whc2Tn2zdknc4m4tLvdA8u3kHQLqygF7mwUY6U5OfQ
	Rf+ZSVxYXDjSXLy0eACTezxpRgPaCB3HPv7i5j5GcVr+op+m0GJ6qkAVl8T65s41w7otVNjpZFV
	2m7XjwRNxIcF+HCV3YLb/sTRQLqRJqVG8UjYGAbly8ogwkXxqqRd/IdLOOu1yMpGJouW64ktHoX
	4CF87fcgqGyXjIbYJBNYNs5yAiDyKdADoWZp5BGZqBgI5xpaCjkqxj3nbt+0XJiSoNmRdSvX4Ng
	==
X-Received: by 2002:a05:6402:42c4:b0:69a:50f9:6048 with SMTP id 4fb4d7f45d1cf-69e652ee9eamr1278651a12.28.1784301313577;
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 17:11:13 +0200
Message-ID: <20260717151134.678839-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0

