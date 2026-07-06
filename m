Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D943E9FB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377401; cv=none; b=Ug1VIcrWPGYpWx7JhzoUWdTwv1vN4D8dduXoMbYwzyXHC0dYRjL29Pxq7rvWpJbwTiqh/Ym5OBXz8ZJtYe75PwfmXz9xCNKz5ccOCurG0siovbiKa8sckhK3yr9FynkqTBfEtejqHoYks23H8EhbrMJX6as9ZscACcsDV4NTP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377401; c=relaxed/simple;
	bh=3lEQOV9gLIocLyxFFO4qWO2gAmosjVOkhnDdhCdkh2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2c22DQwqAuFt6gygota0u3QJWkm45ZNMdHpxe81GAWPmXQ1ZzhgKNuChxtnG1e1u9VjIZY24gVNlNTIbBZiepPb0BY+SlSNjKph81khUrt9OKjJyyMBTrLEJwYyQKD1Me6FjfgQwps6JmE7hiu/3lbs332HejCdTstWOT4UQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V50kAaUf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V50kAaUf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so2344462f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377398; x=1783982198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqBkhvyelySc3loJx/J76CZgVdNYoTTPG8StLA3hSFU=;
        b=V50kAaUfSL+XK/GMa0hd8g0npeCpLmz1YDRVNIWWPAhXGLB9AMCT+dJg9mRrSrwSJa
         3YHPFxHWYXOCJIrOj/VN1rfDKi4vefBx8rcGUJgxDkwLdk3mJArX2ppycxTKCO4BxQ9f
         9TVtWd2FzKttmcNqkbRY3sznvJt2Pj3hfBpPNcEMxu1//voob6rypfDtXXa0mogmw35V
         TUBWApRECrqgkq33sAyE9DvQum85HK5ZW1ePCmmA9Mjt4Lj0ZRB3o5gZISPCWemDwyIp
         FxBML0HXB5pvpnoHx7kJHAn6Ffp0rDtwF2/gkXBhXATiqoDIPiweZlQfinCjHSvFKAfV
         Q0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377398; x=1783982198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqBkhvyelySc3loJx/J76CZgVdNYoTTPG8StLA3hSFU=;
        b=eIbqzj07I/CNCIXDfw/d40Uxa2yEOc+6fk19dP+zKn4gYpB0QjFUHVpmov382wAA0I
         ny+jVKnr1dU+IrA0OHmNd5kkVRfqc921I+DY1oGfW1TOoK4fOIPvj/zqZNkh2M/siF9z
         rfNtjSIH7TS4koG3ERLIN0gfcBTWhKa0hzavvIExeXYteeXNVJbRyTglwyU36Z5TIWw8
         eFg3H3zZ59+pXKO6njiH8TfAD2zD2Vqbpi0H8rXiZ2H6OeNEQt1ESKLoB9Uw6GSF8qu3
         WzKsEfP70Prce+RKp3JB7pQbkmii8pBWhilOrP1X1l0ruVNGeP0Gyz32PoiZlHn8jiFe
         ELow==
X-Forwarded-Encrypted: i=1; AHgh+Rr2uh9JUPAViIS9w3biBHEXm3ei0QGO5UQTqbmvYrK2n5SkW1Ow4Auqm9zuwS1m0UJsyeR3VULZaYSH@vger.kernel.org
X-Gm-Message-State: AOJu0YyO89Ubqivih/8UB1WjN1+bR9R00onLQDVrho7Q1vYup7FbL1og
	tdpg3ZMuyWej934dTTvPVrhgj0Y+c1kRCw1y9Nx8X2MytMXjfNZBF0eW
X-Gm-Gg: AfdE7cngxt0TO4CCpfCBcutAEUx9zl72EK99mA98zPB39DPCE6VgaAGj1giL2hrKxPe
	+JJHY6+eutAACEVbkZ7bxcRABcgYbGHDI2eBHM+nUP2beXd5Xs3OL/ywuwV8Sz1PcQRjFu/VRVi
	Ts8tJ1dqyM0UimD1UCydOa7Mv1znfBCe+xhsvMarlyPZMUIeC5PH+DdhtySUadNWCPI109n3AKL
	TP50PzFTCaxmNjaO0vQoTSr+sgAqkgF9daUkKN0Rg7qpuyY/5Peoftho/tnl0+tdzPwWGn/H9DT
	mLWs2KcPxqPvPRD6en4/eapJfEMMMVOUIM8qWhpsfP4RB/M7zHm+kxxG1SsLfBrUezxlYcQojqN
	6erqcFXDwQc5R0oI1Od9Ik8U+yAJUE4cIMqq9RQn3nYDxJGEWTbQ/FQz8fPVSQJ8aeOruKK6/zo
	UXOvIh4wZUCaRGvXjMpFKBuLQ1miePzDiADQc6tmKfDwtHHkLjnrbjPaY8ZI4KAw==
X-Received: by 2002:a5d:6382:0:b0:462:fdf2:3a50 with SMTP id ffacd0b85a97d-47de66a309emr1878338f8f.32.1783377398441;
        Mon, 06 Jul 2026 15:36:38 -0700 (PDT)
Received: from turbine.fritz.box (p5785b224.dip0.t-ipconnect.de. [87.133.178.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm27491387f8f.12.2026.07.06.15.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:36:37 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [RFC PATCH v1 2/2] arm64: dts: rockchip: fix gadget hot-plug on ODROID-M1S micro-USB
Date: Tue,  7 Jul 2026 00:36:27 +0200
Message-ID: <20260706223627.113814-3-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Referencing the vcc5v0_usb2_otg switch as phy-supply of the OTG port
makes the phy core enable it as soon as the USB controller powers the
PHY, so the board permanently drives its own 5 V onto the micro-USB
connector's VBUS pin. That blinds the PHY's session detection: VBUSDET
(fed from connector VBUS through the on-board 10k/15k divider) is
always high, no bvalid edge can ever occur on plug or unplug, and the
OTG state machine never wakes from its initial state. A USB gadget
only enumerates if the cable is already attached at power-on. It also
back-drives 5 V against the host port.

The inno-usb2 driver has no role-managed VBUS supply support, and the
practical use of this port is as the board's USB device/download port.
Separate Type-A ports are available for host functions.

Drop the phy-supply so the port never sources VBUS and pin the
controller to dr_mode="peripheral" to match that.

Fixes: 10dc64fe0f98 ("arm64: dts: rockchip: Add Hardkernel ODROID-M1S")
Signed-off-by: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
index 33bc5249d729..d9d4a31373a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
@@ -602,6 +602,7 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
@@ -627,7 +628,6 @@ &usb2phy0_host {
 };
 
 &usb2phy0_otg {
-	phy-supply = <&vcc5v0_usb2_otg>;
 	status = "okay";
 };
 
-- 
2.53.0

