Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C134156D0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158629; cv=none; b=qxiBWlEzlbflkZZtB2bCcsfhCitOkgS6nnX3GrbW5Y5Vu+eCk/eB1MAj5hWgwm1pbvWNwNv9l2Rbc73tW5RnkQxRnNk1ckGEXvcCcRr5i0qYqBwh2roDFx9PDtP8bYcHrWpuXjQBhBUdsOLCGk5wxIunA0Fp/AhcGCOP76wETtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158629; c=relaxed/simple;
	bh=QAqNaSc1EDJn35zx5q//in4SCGncZ9UeqeQhov+Gstk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7/Yzb378t2ZB/48bDOwkotiidEpdAbI4AgqdoforPX+hZPFXMQqqCwASsqtdhirlNog5xTt5wrb/8SavRYIBBYxILWrWxNLBXmuTAslFTy+diWyGJFXex82rfDrhLlx/ErXDqiOb30/6U0p+ujSq0BtG1o42klefD/H1X/LeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMvBq0HI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMvBq0HI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955de8797cso16654255e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158626; x=1785763426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=GMvBq0HIXE0VUDMD+UnZTkQYKNv2/vI6YY+i/MHcDGrx0gf+NMEv/Ml4SEnGG8L71S
         08i0B4Z+3NgVTAk6LqnBQ0SbdZm0lE8NwzRyJKiPpPKV//NWpJ4ZlV17ATuDjt+lvOr/
         2bRUKuExW76nPol/xnmeQ36PdGndbVsS/c3BN8/SmXlWmokEZv372EfyyM85ofjHeffs
         g7/2GOcEeOg99HTsr07mt0ySJDXDyTNr4NCl18bMfUNM/bm292YFHGuqOyYDkj6CW+S2
         kSSpkuhbs0Of6+KGbv4IRuvq2kQgft+v7xAd469bzSPNDqAFUoImM9lwLf+9C/ispurc
         4C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158626; x=1785763426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=jffOczgnldSgcMApcTjU3YpblvWWn5ECULeDsLJ2sJg5870IZ/f/JBTq4GG7SvOT47
         hgynHaIHMaSqaqVm50UPHjTZOsoyG5WtFqO9m68TphCtt45GQXE+jdZyyj1QSfsxmc8U
         zMzZnmAHpJQXNWfoXzN41w25IVombNo5bLwb8XoBO7TmfbahIZx1hjzASPxVMJTML0hr
         G1o3kVmqIQhsS5IqCkZ8k4rCYqGA8wXdOyZNLXyFEmnqSrXa0d8kJVSUxEaqpJbGtsRp
         NKRZBAyr5r8UatWqJjKdaDdoiLPcpwa1bIy35RgCw/jtGWAvbkJpJF0vK8yAQr/lASeL
         eGWA==
X-Forwarded-Encrypted: i=1; AHgh+RpwojBnJYdPuUL6QRDT9oZ1LbGF5eoHr6uUJIjUVVkVvLWtMBJorvsFjO/6uO/IGKv0eAPKLVyzPZjI@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWMjhRd+m6wUMggFhVLswl3I66/2hjJYpACjhdXnttzss5ciB
	JiZYFRQt5WMR+G5kM1mmAj2Vu1VE9D/ufr2G9nv906D/tF2R/VvU/5CVCQIrCstHM7o=
X-Gm-Gg: AR+sD129x0cYJ33btL0L6EC4MKCOlXDn0Mu8kmSFa1uTtb/Yxi+ltMK64mNJSIDvthw
	lRNW5G1OSHnOZUbGicG81GqjFa49mVwim5O2PF0XH54TfshpO2DPM0WjSnk5E7kEcOR8SIApidk
	nlW9ykocjNOMb5GODh49ttlaY0T04xSuRcHpGxfJIPlpS+yxRY9U+BI9Tit+Oux+foRSguHZZt5
	mw/7/CCh09om8J7DiNnGhw8rjSnCal4ElhjS8wHQPIycHP+70AKxVYMdD2k7L3TuNNz8IKrbSD4
	la2akvh3hxAPdmgbe8H1jBPYL2V1k6vsVcmjnGkRxGlxp+79JygD9PJ33dCpdrUCHi9uyLl1Hr1
	9AuJrEC02HdDs18qYjF/y40LwbdCkmdaSuxM8NRl3LnnYpQGOayMudLPFhkaNYZUFkY4HGzhITp
	in+DlTdm8kdaccy25X6BqZHsGfq8CJAl704AHrpRZ4CIBWTDDAz2UK2JvwTUttyydMOQ==
X-Received: by 2002:a05:600c:4295:b0:495:7990:a1d0 with SMTP id 5b1f17b1804b1-496b571a0c6mr69990155e9.19.1785158625718;
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:27 +0100
Subject: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..0b614caa411c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -163,6 +163,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x40000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0

