Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090641B37A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462066; cv=none; b=TLnpF9rO/5FdVxPoRgbh3ft2zl3+V1lFaks5c2iwH3zngzznZUZHndDFNvdj2r5cdyzRoCXxa5at8m5mslOpzXx62Ks5kcliSjG33m4GYdt5qzdXZGtS0VrTUkWAoaZNzIOoSC6W2mARUoveg7dJkLC13HCShcH9/8352L3v6v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462066; c=relaxed/simple;
	bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgexM6WpF0zzLQd7iOq9TyCGvIM4CSZnWog/2EZPNPdtjLvBFWp4AWmKy6N/7V77L0QTDXYZKWyUOvi9l+5i8JP+ICX6DtLOtaXH+/6Vhbzd8fFnwh/2hhROk9PnHA0z6uBJea/rX0O7eWnfN7rPVWzj17pvaz1+goCyYomqfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHYIqblN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHYIqblN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad617d5b80so637285ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462061; x=1775066861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=tHYIqblNKibm5cLUS1Idiub9GVxPrqxSVVf1YfG+4c3zcQ651oYjnBA4CspMQAM2CW
         6/wfbGv/cBor2JhzvZTzC00XVL2n9GdeYFtcJO6THQunVkKlLCK82tfQpE9fFxMNhCjl
         vB9HT5aenL6QkixQmnbfOU3JEl/mvZzjCLHxyuQOvwy2wuLXFkB+sG7tWoXGr2vrBLSb
         32bnU59RYITv5/wPfN2Gs7LhPc3hko7HexqfRoDmJZy1yDGfPb0DDtv9T0Uoil28y1eE
         CF8imw/m6+yJESFyDc/GiSf03zfewaSiy/MJy5PWsV2wFW1oozWk9KifrFhzv7/KE5e9
         Dvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462061; x=1775066861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=g6HUgxAtQ5uwaKKnRzXn++cz4oY/D4xXKZ6vDJg+I6GgebEPqJilfbkCPp9B91zBXl
         +hVPICztWvuKyseCT7stft6kvwly9uL6Hy/QOUW8/gKkulloVyIOmUfDelKCfPeiCXm3
         NyUXAdSXdhyfDi3ZQKxCqzdrI+pz+cL0FeB3qVqXaVV+9rjl8x+7jaG9jDjgLF5nzFFz
         z62+3+azvLWd1rSk0NetjJ6B53SIZIdDDe+duHOz+iyDy2UqcahAy3S/0g3arBqPk3vb
         MQdlKvs+kNpYPChEhUEe/RZg8BAtZNsPqQJ1DK9YIQlikPg9lnoSmr5N0Qj/4aN1d2rm
         9jyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/zfDPcD1fH64CgWS9KsE5vqldBOeRqbg+FBE2UbvjYocJ4+GeA0kRs8iQayS+0NbIfRr7rO/nTKDS@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQ3AzsqbslFYQzF8ZYPmooGPU947OqU9FeNHUmsHDlEYmWTJL
	3wXmPEerv+iEQToebfsZ6abiP6UuwlxkcYQRgCO61KUQGxcHwGsOBEdf
X-Gm-Gg: ATEYQzy69B/j/WHO3Tvm0KndotzDbuEYMNnJ//LUU3xE6iSzKG4YdQwdiBtc5VAuXQz
	f9Uu0z/XaNzV08gX4OcqeZkqzrHd90/YJkn38aLQi8G7hMtZizWX0VvlW0NmzECsutVoPynu9rB
	W9AAE6ydIErgAw2pmwK0BGwYhYcnAXassC0cnGwB1P2R4189raLIgCtSLSlL367b3YgQ+O3AGIE
	HkvnoIGu5iM36LxOfFpB2674RHdHs64svA2hKo/zybQsxl+iCBjPQEvowZoPR3Ua6XMAAxh5eQg
	BWB4m9tb+ssNZrm6551RoQWz6/zGPNxmKKL9YYBQtMtSBcGO6a6jzSG4YNL9OzvBrv3JpErsWGL
	+mzj/1a6mmwflLMDltH7ixIndV/N3Kwl21b8vbPFVrnOofDMXcxJU8qn03DwuPG6RdcR7/su1tl
	g23W1pkVT5YF1/coQ1EYNJ0Gc5XOYw
X-Received: by 2002:a17:903:2c0c:b0:2b0:60b2:4dc with SMTP id d9443c01a7336-2b0b09cf4e1mr49434745ad.15.1774462061252;
        Wed, 25 Mar 2026 11:07:41 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:24 +0000
Subject: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=909;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
 b=/L75YqmElCivRnT3k1uY+DoU66iVUSy3psZfDffVjcwjfbXXx3kMslkg/jC4xSt8hIUlX+8px
 cr1phXGHRqIBjatTcmFRu41sIUd4E18nCR3eVSb9rAUz6oAxWXP1R+a
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc302..88691f1fa3a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0

