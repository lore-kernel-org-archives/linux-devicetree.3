Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E203E0C75
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244813; cv=none; b=dINm6JzuBCWjQuIVvTkf9Cgo54Sml/jbqmwMQFkCPea87eyAZoVcYF8NTSumhRmJl5KyQPNcbz/pnkCEGUY5U2k382krbjcDFqwxYx90TRWdhX0isIffGK9bFWM0gUWpKnQIiyU3rjCLrD6cOZoW2r5KuOAp3EVo99YJg8RCdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244813; c=relaxed/simple;
	bh=tIDX7JUVBtImT75drxZOT43afatjq2eglYC9uyAHIeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi4sNYBxAeKo5QCswoF5yu7RkkYNCNTVcAmI0ACeNMMHkrXHlBacLO6G0lNDvw+J61M5vyQiS0+bE2JLCzWVnxyB8DH31pC1c4xqnLqQ38Ncigi/fLANZrtVykAWCm0RGsFIjPTFpSg9s2UgP4+j3FazU/ihrhUPXG5fHksSyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cEcX/+L+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cEcX/+L+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b941762394aso340446266b.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244810; x=1778849610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iH/xL0hFptFpdB14N/xJEwQzcQQr4/b2TTbHc4T4Jhk=;
        b=cEcX/+L+g5ORSMeyQLW6lp1Ef/OqGNZsYt0zrqfPkq5DXVDyRlKfHLii4fwVuawRtv
         NxLwffnwWNa5OssvUelV6bhOnVj0DLL+N7hLWvVz5/8RKLv2ZyByO82NvUYVnYrWlcx2
         Pl18QswAYqEME8d4zn5FaFdYL5BiqhC+oJ08Pmawl35ma9+nx2hYRAg2i+3574B8zXt4
         hdLKCgfwzlT1scygv5/gFVqobxxPo8c5jHBhqkUV8CU0ILfQiH487w88/d59VhnSkvIu
         eOz3cVwtupsqIAgf0QKD/ucDUnbWo7gcBMt87Gx5bCtrTG5UvqK5YUi8HIYUibu5uk29
         hkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244810; x=1778849610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iH/xL0hFptFpdB14N/xJEwQzcQQr4/b2TTbHc4T4Jhk=;
        b=EaLgyNM0QmRqwJRUDT2w+NDsQP9+F9pFiKHSWCKJ6PXdWAUQFBJrsBuxZ7ccJdlrCH
         OeptGR1NYXz5JiRvhiflxthRkl8snjOa1/I0aCKK2hn8kZdXvx2rJGOS55mRwl22hLGT
         vU/WX68HEqkGcyKt1jY+RhVohD3LYvlmYLxybavbADRUvEJZQTNGN5g1iSYQuF8k5q6T
         kh+4nMhtKYFWZRHsu1rlRvVw/xbzx4lb48+7Hs87kFtKbHlIfrYY3+LoWHVZCTe4iRdi
         1sOrr251KjaT/v5FBPxG1h8Sz6G2j9lBDPeqvuf6x+TODwj+xX2UYNK8wQ8PuXU8XTDR
         Xgnw==
X-Forwarded-Encrypted: i=1; AFNElJ/f9pvWbQlIW/c64u+Js3+WGn/PmUnmO45kOZdOMvj9IaF4TzGGHfvzC7tZK4fZcDrRN5cw8Dk/9X0Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6AGZMAFuZQi1ixUmrmuuZKtQ3N9M07h8gjkfckDalbSXphVEA
	LiXYWXZj6cm5KddywO/qnjSHbJTr2oR+mN9c3xdfl1Q7OoZpNBlD8Eq0pgSiTqFnL50=
X-Gm-Gg: AeBDiet1kClEejzUdualy87ii6lc5SMU0zEEb6pEdaGmswe5ZF2DuAR6OBt6gkTP5jq
	BgMikKavhrkIXFwogGQFKGtb0vI95b2SbF/d4A1qDNDkeXZeO7XHK+fSgznmjTj+YuU20FQ/Mpl
	yadMGZlKEK+TR0NNGYKAhBdxVG+svS/l+mMtDd7QBgni8XXy1QfraT8CyMW7/sjfPHtJ0EEfb4C
	N6i7ZXmATWbHHDK7UGWqimB6ahrAP5lGFwiMZYa4Awp5q50y15ZIuFDqZAmKOabMlrf62Fp0if1
	ronOMV11PKz26nj8/7swkcRhYQqlrQkOn7DO6QK269PCVBVbhBykSXw47Q7e5MximrYSwbk1Kki
	iIOl6aCGybNmiYHbT6SNTrZ/khLRtueiD+T6pSz4Q/uv87VujRkXZZNvS82gYmzNJ+JlHSa5LOC
	b+iDHZYKcV/RSzzvUY++WnIDMRAsNAtTYXUzVYqoH4AKq4ZIHYJwgd1FZRK+1RklOC0GwcWGLKx
	xopwxHCbw==
X-Received: by 2002:a17:907:fd8a:b0:bba:3bd7:17c7 with SMTP id a640c23a62f3a-bc56ac3654amr669181666b.7.1778244809659;
        Fri, 08 May 2026 05:53:29 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:29 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:16 +0200
Subject: [PATCH RFC 4/4] arm64: dts: qcom: milos-fairphone-fp6: add supply
 for Hall Effect sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=1397;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=tIDX7JUVBtImT75drxZOT43afatjq2eglYC9uyAHIeQ=;
 b=KT7bF/QDdLpdfF7n1XKRTlGsLTboMP/ClM4Ln/rj5O8mk+AT0De3KpscYOUGknrVFyaVp40Vd
 MR0dqPY85ufC++wlLpRWg937MPDzmsW/GsazLjn2qSNoZCrgHWb1vNG
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add vdd-supply for the Hall Effect sensor in gpio-keys so that power for
the sensor will be enabled when it's in use.

With this, we can drop the regulator-always-on for vreg_l10b.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e714137d7849b3b043062fe8b05cc42..ae6900c3f75c64ea5b4feadf38df101abb43c1ea 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -32,13 +32,13 @@ gpio-keys {
 		pinctrl-0 = <&volume_up_default>, <&hall_sensor_default>;
 		pinctrl-names = "default";
 
-		/* Powered by the always-on vreg_l10b */
 		event-hall-sensor {
 			label = "Hall Effect Sensor";
 			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
+			vdd-supply = <&vreg_l10b>;
 			wakeup-source;
 		};
 
@@ -326,8 +326,6 @@ vreg_l10b: ldo10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			/* Hall sensor VDD */
-			regulator-always-on;
 		};
 
 		vreg_l11b: ldo11 {

-- 
2.43.0

