Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CE3A3E96
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226544; cv=none; b=PB6ThbBGvrLbseAR7CkjC++shOBBLtSAq+jv37U3CcMj1OPbQWWHBidakhKyGKL6GJ0kJrF+arAB+Nj7cMxvZ9zvdlFQTlHX9M2Qyx0S+MhIqh/IIzQmX+7Zh0SX46GqnroUc1kMguqZGTJ5hT2XMAqqsbISLnB7Vjd/Lw00YxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226544; c=relaxed/simple;
	bh=Nzx14HACRM0d0HjpzRQyGv4cu3F3Ed1W2tIIdEaeORY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqdEev8zNSbLmaFHN20vBMf+21CpXtQIO+32kwH1lHSWtj6eleS553BskncAdDZRUjq22LjScZynUPo7RNZ71kWIq7+VuaPgKhomFOsy6juBh1+DWcAfwcy3SRVlvT3lBEVKpqbVchliObGUg3c1Pk9fAAoBlFwSn48DL3Mne+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fz4Q0Yyn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fz4Q0Yyn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso19416435e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226541; x=1775831341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=;
        b=Fz4Q0Yyn6FO/m+VS7ye5rW6FILOj/ZSIZdyr7n+Kas6qiws+s56pKJuVpvqVZ1Z+dB
         VWd9Tofts8VZqg/m//1codfxwLZYE9H4cK+zeI5f9j7hMgeeEKUIET7kgeAdLXW3Q7+k
         8zRSUXb9v1ik+gpONMWAvownDdRcCBimoGE+IVLVLtMXLSOraBCDlcw52jD0GaIYIZ5m
         BkQVXstJ3C+y/7yj3BgcV15q0+vqtfqwOfTs2Om1w8oM4xGaRvtbzVl3K6AQr/pUia3V
         P1Ynz4Ph4IV5MdnpAZnRlM7VcpbMIAOppvDJtYpOYoO54j0GrXsduqHuD57XsDTy20dt
         XsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226541; x=1775831341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=;
        b=KB+0BGZDTX0dEPPXzJ7PRSCo1N6lh6bamvXyt8hKM/+ARlxQRMwwoVPRzEUqMjMYCG
         BRNSdplEMn/Lulf/OWMEedbouNhZ2eadYeLyClxP7bTatq5Y1qHcfQ0k/n6C4Ah5+0sw
         703LYWVQDXSbv9A+pktkHQsCiUg3tX+vb04vR0juRRLdsjIWvF7EpHdxWyZ6ZQXciVxd
         hjr1u9OkQlRSGQTi+xp2sl0ZEymaNDX+R72aGvxzC60Es5ftvxzKp+KRLom/ZwjOFN5a
         iFwsEoLveViYcmqBzZ0jmMU407Ljk71Ni6bxpI6ZLKbZ0FY9cCDmJdtYJM7hzCTE3fSl
         Q/DA==
X-Forwarded-Encrypted: i=1; AJvYcCUF+dwmuZpsXbv00sScoQn4SZDAAk3LtPXgbJ0KhTFCxG0sDlqhcM9QxAaHj5nPgHvxcqFdSlJhYsx3@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVE6fhjM9gjqt8Dq2wuFJj+QfELHmqQ2WHAETji+MbdwiRecV
	EAmcwwNODCJrDYyDBrhmof8dg38WGRMqdI1evSYHgnowahP76f9mB6E+aJlrufolHaU=
X-Gm-Gg: ATEYQzwRv4ftjQ6RmadJdRkticAohEVHrN/PxPbmhyjdSKtz9Vzd6Ng7KklGWu7Suld
	yQ7lew5f7Hp0Mqi8cEg06KWWv0H7HfZKJppAkUeEhcn/FLC5eqv4psbuJgTrV24p74asEezYCJq
	Y+NDhLm3rgs+qYt8no9Dkq8liayJmvvhKE6TPogGmrqbRK3WLbJaSMwW3FDMmIQUVKUJGu3Udlh
	5oGmUlwwIepcpCljrlpkchpzsF24k/mju1FOPqlC97T1zadz/F4F54rZZ7S+Vyos1GUp3eFMOcp
	SgG0z3ZnUePmyBgUcKtXdnKpIV5j0P0T9UUhBeYtogvaxdcgE9egeTzWKhtlGFXmdld7Zk/cpik
	HPXeR29WtWc0oboSg8Rv60y/c+9orGKMgJNdah5IhN7wcmNYPHvthCIiTx23nCabi9lIy+KXHzp
	aO7L81dbCosyuC1cY0NfV+X6rxyz8xvYEP/g7G4hOTUXk3pNwvFXh/zFx0SgSViHWoIis6qY4uv
	W8fVGo=
X-Received: by 2002:a05:600c:1394:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488994a7a76mr49414895e9.13.1775226540607;
        Fri, 03 Apr 2026 07:29:00 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a72baa8sm142747135e9.15.2026.04.03.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:29:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 3/3] arm64: dts: broadcom: rp1: Add PWM node
Date: Fri,  3 Apr 2026 16:31:56 +0200
Message-ID: <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775223441.git.andrea.porta@suse.com>
References: <cover.1775223441.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2856082814462..a4e5ba23bf536 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,12 +64,24 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
 };
 
+&rp1_pwm {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c3797945..7e78501e62b0c 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -56,6 +56,16 @@ rp1_eth: ethernet@40100000 {
 		#size-cells = <0>;
 	};
 
+	rp1_pwm: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	rp1_usb0: usb@40200000 {
 		compatible = "snps,dwc3";
 		reg = <0x00 0x40200000  0x0 0x100000>;
-- 
2.35.3

