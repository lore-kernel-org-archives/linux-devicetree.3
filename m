Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937263F1AB8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066052; cv=none; b=P9Zte4WVJS0G7dNEN9t53gowgsk3iQIdz+y9UlECu6eXZrH0oWhBSVTPU7xA4M5lNe1p5XTooenSwZOrg8UultjSVzIi6VbJMhmerCJBhQbl/M9r2Nx1VU6CRuCYAlU6NQl/+MW9fxfpB0jkTFpkm075xhG1VZ9OtsOgLKcXtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066052; c=relaxed/simple;
	bh=smK0LMyu8EXiOot7ocNTu7szAih1Fd4nfquSIb6ZAtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6ym8usTqHEMGlw1PxH0JDbCX9vp3t9cQhUYE3Jg+uGAOXw2OSFEWxxuE4B23L9yPR4ZMRITtLvP4Gj2YH2JkLGDhS6R6FQUQzPYLJGHGt5uDyeVNRPf2+61n0UbqyruAePYalIjWMLlfcjKNLQfnWz1y0fWTTiXzHrcF680h8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lFNta4/j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lFNta4/j"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49050bfe053so45947125e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066050; x=1780670850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=lFNta4/jQzwkidPW//c9LJGiGmC0vrX2ZXMKBXe6i1S3Yc6ijj7kiDOwtTcwlmlqXO
         Gp+3bWcm/ZSFF7nZ3SRyoWGsYfQKkSPTJTgbtlAF/gic9UISdbh2oNQtM+qHpubrUhPI
         pvEIaWX2wXNg/dTUz5c4w0HHr8M9+iRN5L56k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066050; x=1780670850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=a6OuiPrNyQuOriXsDdCtsjNuMtJTPtJpBCBFxNxkuPS1KP6CdYMTpys4BcEGyqWHnJ
         lDyI0MTstB8ew0vJ08BDKh24akCT7DkGPb1LujXtltlhu7F85XMKpRksaQHVUD/GA+DX
         EXg1KvKVKwkpPnJQhiVvYoVbd4Dr8yQE83g8I+mtD9xRxOGoth5wdz8sa/9ynzTNrPVn
         2+N0ynGJXlrLoQdj8c3dGfDhe9xfFELausR9OuQ+igS/1zDE2zPOHyJ4QqejcERafTu8
         S36uu4lV82lTnq6th6s+3YLCQ95dr/VAKVGeX41J3cdSEgIRb1ykjzTo9hz3ENTJVCJn
         sijg==
X-Forwarded-Encrypted: i=1; AFNElJ+Hbp+oGltGL7PNt2PEp5jNPw4sBigfsWeNj0xPOT6Jk6arOu1DoPZfQV0QxxwVN1eLGt+vibY6X+3b@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfLpRMGooZRQRBe6y34S8f9gNyJ8jNay3xgmO4IDPPEoPuWvu
	vhR5tWTBd7kYLLOoNgfEVfC1m8QQ15YA9ee+/XSIhZCh50xipoF8fX88UE3G8HXQLbo=
X-Gm-Gg: Acq92OHqhbyJmOXT5lyjNTyuPrzIoB2OCOfL+rRKJX98pHK8tTRjDKb0vy53MNVZQG0
	Mny7Osv4qYBHwy+sKQxSwA733mECCQ+36d3Kt4KddlOXkZdLcBLmw92XVSyGTBRe/uqt0RsMdkS
	FhnLleo0/GPTbP/rCjRdFj7ZKRIfu/wOBHnwKJr1X0yHE9E6Zvf0aFTzwiM3zWOrG6e5Fhh5yVp
	JaPVrrZTZeejvDQp7Dd7dI1FHsZtPAlJUhCjgB4Qa12Oiqda7AnrK48wW0klaWB94FQeTi95/Ah
	0WzE6kh86aunWN0qHQFyrPIQURvIaPMJTTWh2lz7rzOd+6/xGV8gsJiUUBtHGtCpj3D+HiZBrX/
	SPCGULAvoPtk4MMm0tictnk47Qmu8rGeH5GAAQMUs3JOcJ5AsHWS+ErQxYoa7Es2lMouHRTjI33
	VGixvHPoLYoZ/GH33f9e3CdlcHh1djUMVWxfOgAtbsEXKG5LqhbGGfkW6a0BfHHwsRNlTwi9Yoa
	wmT2lmCCbpd2M7egK8MwCqztR8JsE1S0yuk2STystWpiGmYiws3OGdG5OKB+ddOA4xlzA==
X-Received: by 2002:a05:600c:1d18:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-4909c0c7ad7mr58250095e9.27.1780066050002;
        Fri, 29 May 2026 07:47:30 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 08/15] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:22 +0200
Message-ID: <20260529144707.3931919-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index eab8ebe71660..ab1e62cf2bfc 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0

