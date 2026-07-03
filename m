Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EB3CEB92
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079794; cv=none; b=iZYMKLZJmOZNTAlSxYqmtRATpQTL7TPx6HalMhaoruQf5dN++4Bha58cyc0kAFgnoS6sT1dHbSDKYqHOpp5Da0pKqhgGgXC6JRGUh6WOdYW3nwYA33MBHrYP2nXAyb/UcoGLbE+M4pLPrVZtA+idhqOg0+fb1DAB3rg7llDaGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079794; c=relaxed/simple;
	bh=Srk1RIAGXch5zh+F4rdikiS478Esg/UB/P4R5OTlkyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZF4prMfb0XHCSK3ql+frctYRViM14Hn+iRxytXZRkDKA6CvGYG3xXnrhGJJ/59T05d6V0fc//AvPINClnlr+EQoT+MGea0+H/VlCrsZtRInzgwVbYjvIHjpmWc/ZpaIxDoGidwPzAxYNTZULrnj6Wwndk3M6RQcs33AWaybuWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhaUknNh; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhaUknNh"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso328035a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079792; x=1783684592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=RhaUknNhY/y9nl8qyLVZdJAnaTYjPzHvtbrcsoDj5yviQkCIVXLdj3hzH6E4Swe3C+
         nVrx2rOK+2pO7s7z/IUJv2h+xW9e6nJhl3eet5f9injTbrki42e0WFHujQ40pRaC109k
         1/cRrl3NVJX4BBAwe6/Pm+XNDMiXPr4lygSgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079792; x=1783684592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=Vtw5upS5UmecrZlqN+ez+PGKIeep0OULNf0yHxIouVdWHAjqCGoYlYOFIPMCU75zNo
         eN2etWaXjdKBhpUUbAuQkh/omtGF3FBJIUpeQi8cC0qMo/lMvpNyUi8gSYJSw+oq4c87
         zfVlNcIDNw7MvEQq9RWjLSEYeuxVIBbbRsgbOqVUZlAvKTDgjwJaJ/CtOJp+eGCQv6bM
         j6t+K0NFRJZe51FhBCPMjKvONEvuD4cLxQkadqDryGTfT7ha//Pd6eW00iIKLHiH62Gv
         Dk3nvPyHplx5JRIqUP3Jm5EXVCXL4pmppHhL0B8v1dla+LGenBKSUmc3kjR2s5RfrXbf
         kQMw==
X-Forwarded-Encrypted: i=1; AFNElJ8lkJNr8bwZvFwFSXwsnVugRUy/PdywejKtyWLAXzundTDu/Ut4lD2e1maelrYcqQry2T9hiicnyequ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkxmEHCfij7gtXDcXgMAlPCUAVp2kh3JZJLBXCXg4ydIEs6LH
	GZyLuGiJQR5+S4MKOSyYTeSxlSlRukUkLK45y2sMBn0GuuVfmHGoyS8a+bccuQdQbA==
X-Gm-Gg: AfdE7cmalm9yYug0plwmdORrUMJQBmJapAY3ovY8/e5r9L9XlvwP3AfNbOw/pylFpGj
	jfwqqb9FKHjlziyzVvFYCRNa8z7enSbQeTj3y1gYMhj7RNMvdsi2eC7wdM+fgE+ggPFnxm+kJ8B
	a0hcMGtq/tThegn9jcetLtupkiylEmCAcNOKNCuLL4HvmFhWNfzqMkfwQanSDTT2WsCyazVmrT8
	4DSOjComLj0DSDO11eAKV40Zv24dUUgg0+tMvtYskOCM24CIfx88lx/YkH5fw7t8ocCFM5xLN1G
	AFUjBw6ZQR13K5S3IBiI7eg/xl5y4FJqedWPxqHGEjpURglTfYjEHBJR9yjd/nkgXkM/m9hQHsn
	6VYPzhQS3mp46DNNYaXqDu3hM76O8htYzBI3pmIHKos0r/l+mTAKfy5PdusbG/uLWT8KaslcLuA
	rDHQmZl6uIX/nDsQRT1qGYoOfZunM5O3e5KQyqz6Iw0iNcjTrNgIF1F4WS1i1F/KcV2khXfA==
X-Received: by 2002:a05:6a20:2d14:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3bfed1bf5c0mr13230564637.15.1783079791119;
        Fri, 03 Jul 2026 04:56:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Fri,  3 Jul 2026 19:55:59 +0800
Message-ID: <20260703115601.1323491-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.rc0.799.gd6f94ed593-goog

