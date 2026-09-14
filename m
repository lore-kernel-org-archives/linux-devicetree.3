Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419634D4F9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405130; cv=none; b=lrm6ah2Rvsdp9/D+SFYVRVZGYcyFvw/ymo81sYlU7kHPYqgWcl2tepeB10aWE9uklV8tjz4pJuHq/fosckkUl2tBqt32rGrM6KZV3dk89KEaCAJqVTKKErX/NX4tozmkJ1dwmGHlFZMHlJSPJF8qfK21D3wt1BQN0hWJUopagiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405130; c=relaxed/simple;
	bh=wNp5wOIbM4OkByN3NWZoZARJH3K8Lw/flM4b8WOkfCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTbaCbexp3er2dZoGSurpNaFrkJ8pswg9DZrrDoYW0GbGQ3Q48WFyOcV6prviRQ4C5zymZNSJAXI5+/Qv+sScJXETqTgRO7j1pb3fxE2mbrd+YP8sabgxjoyqZAdxlczRqtFwOzcZB8zDyYGBslibOLZkL4iE+vNtKYlI3+dWzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9iQyV5x; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9iQyV5x"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482dd6ee390so2824647f8f.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=D9iQyV5xzPFeDkrW/AT+ttifLfPjTz4Cxi4BnfNUxGL+Xd4z1Y1E4Cb0189o7KtbGU
         eLl5LoVBfiASN6lMK7EkWEHKid2uJai7OUWXNOpLyiopZnnNNB2hBSZz6QYritU1eh78
         vpiMulNv//mkU3umTIFWeHnt/FbEevlrOVAtjU9yzbc9PDQXJsMLi5nuyeAB/GWo0nQW
         iGgGh4Lze9Vv7NXiAFIlVAvmJrQHj0souTaAejma0jp3INO1tPYu+ptII6NblV3e9V+J
         +5BXcw594teKlD/ebsQTVXI7ADBFhnpYOpMILmBRIRTwgixjnq3y62aONYCqUB3+BRg2
         ssxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405126; x=1790009926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=tHHCrQOTgVZAeiXhqs8LWpZ6/1G4Z5+e4niO1nFkykeITRjt5OmQwTP4J1U+PCa1f7
         naW0aFeQCXeiI2W9L+2UkV8kvfS1OvJE88QNTlM1wh7DvYkjQDl4irQ+XyWtbY8gNCW3
         V4l/2WQFDG8M0jqpWOSagSe6sg7BkbmpwXfnsLAqHCTV4KlKFEEGXQuPKjLP3Nx6OHbx
         ymAwcud9z81xoIECFhXZsvk0alcyzfBkJFbDmg1Foku5vYOFkcydkswORF45JGpjJcKu
         0e8YKPK7h+glLi77zps9d5M2unvV/toM98mqi5PSfY1mqlxth1EA8Q+bbWo7qkXM8wq5
         MK0g==
X-Forwarded-Encrypted: i=1; AKwUvBzITafLmmUGXl8zGSA5IK8Bf8UlYcLfUOZr5CZXBA4peA77tNK617xKsJg7DKwFIGP5bOMYa1OBTJY0@vger.kernel.org
X-Gm-Message-State: AFuF++ldJ7+Qrs05Rl+4W9ykT0PfduMUKltIgRUA6Dl+TIWwPB22nxgC
	+kCygt1AJSLzY73hf4j3v40G8yJI/zLnlY4lsHBee9zJJIswnKv8Lq3xJg+UNGfJAL8=
X-Gm-Gg: AYBFou19GdcHWiV/H37IatC7eaPd/fPXJr2AT5eAD9wHCix4oR/jEEogGhCPoNhLuxd
	7200UcRY9YrmLmKU6a2MnRa54OtbQsaDZzFG2cRoA8AXQ7Uy145Hpi2HEee5eFVv+do9J3TXomp
	CqOWVhKtz0b6p09cjPBPUP93rjMhYPsI4Qv94WFcQJ9/4mCdrUC40bw6/nDcKSS/Ed+1Iz25V86
	ZTzxhxFs3sBfNidycxWdAJjYgVeFjxD2R4jKDpjEs5Lywl0qHn9/QYebXZwkfSjs5vvpafVd0Ry
	qEwsyWngOkn24zGn2wA+nsdOPUM0ebpX4+1ayLr6c14Q87Tmx9MLArS9Tlu5eC9ZgjYXRAvLWJi
	NULsxuw+dtGDbWiXf9OshsbPSTS8HN6zRp0Z/Q3/uLgnWEHavYAVyaxf025wPVE+cfotOK4EYJ7
	32/cRrwi5/HETKmg+JwEv6Anvv+A35h2ycoibmjoel1Y976tEtAOp/chVygW3EGe3sj2OTWyW+4
	gAtfCbwkHzVt2X5zSisBMFh7l+4GKCII5GuoU5/Zd0Ow7Vi6yrVRJyr+PRrnJg=
X-Received: by 2002:a05:6000:2685:b0:484:4880:449d with SMTP id ffacd0b85a97d-48702aceed7mr5488987f8f.3.1789405126615;
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:44 +0100
Subject: [PATCH v4 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required, that is why "mmio-sram"
compatible can't be used for ACPM purposes because it requires child nodes
to be declared, which are not needed and make no sense in case of ACPM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

