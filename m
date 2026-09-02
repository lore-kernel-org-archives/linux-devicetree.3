Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097E35C6B5
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 04:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321952; cv=none; b=fKWoG92+yhtm1kqg5k5WlkMnVVzi0aDJ8QRxlq3kHg5Mi4ebJUHdVyi5fHCyEUuIPJN0k7gyjGYd/yihfUqcMUA58v2hBpwgQC7XnOadccXQ/iX8PdEsderh6LDkYkoV7YJDS1NVk8qo+hi90LCtfNyG8rFMMj08RZelvNKHEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321952; c=relaxed/simple;
	bh=rYZ6f8ke4/CgAKpv47zNC1/8drck6P5HXuC4yvBfoRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2Vftg5NfHRoUkVvTz6aVFl/SEIF9k1lJBo+Eq27+oXirsO4WM6BNwH34DUQ2NmpuCyRBPuKgG3Ntdep7gtsZx+K6Jfkdof+MPqxbnwjaBVd0pdaWSz/ciwczkP/rqj4Kk8Mm6IfNY06kNMIPothpW+XeE5KXTPzid8/LXkM7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwBh/3s7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwBh/3s7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5205585e9.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 21:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321949; x=1788926749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=GwBh/3s7s615lKyOoW/do5WE1S2uLUZwqvI+cmeMsJegkdjSBK8x5jqPFEmH9cQN/Q
         yLLCU7PSKo5ClbHI1fm3Y8A9e3s1D33egu+LHsGGG+DDY4ihA3oJRapCMcb3kV37O6n8
         eSmYLXXs4Zp655AZKTRHxdkROOW6Df7nAB1BS99MiKEv0Eev5J2D1odHHGhGTemzp2Rg
         xaW72g2WlA0A9LPqsQjq1e2lomy22fd3AcGdyo+3gZW3O89ozhywMYkqxS+RZEqiI9UJ
         PVEB2jM0LPbkxqI9KiVXCXuDEb2GF0QViDsNy/U+cxX8x4GwF9+SLiHrhwwwv2tpc0OV
         kinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321949; x=1788926749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=o9YjMLp1KyFo6bGWgqIKvcfQP8531tLm93NpUW/uoqvYX9KjU+X7LLa2GyUlZ8Yxd4
         rU6BGjFv+ScG+xxOS3NZu+b/xd6i0e1DDWlDBbUNNrXSfvFBVZbNUf+wwwgd+fqrelWX
         POrm437WxB9lB+nrn0Ii7G5i8PXYgP5rixKAd48OZCsCSLqTG31oR1JrBnpyNJWj02+P
         fG0AkifcBPqyE+gJakxWH4MSrjx6JmXJ5+aS5gaGW91qVEc4wZiGNYYBKut7eKc/8LlM
         43Ltfv3CTLe9JpdtJQTy2mG34I2SqJ/p98Lv3wvf/uq7BIBiBiUo30qf1bquGC7FQ6/7
         HAjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9OhyeUMtg79UfapatrG/nlulEbnBbPIE03t5fXG2GpTOwh98GdqrJr65wnHxLPFE17v8h7c5U4nYA@vger.kernel.org
X-Gm-Message-State: AFuF++kaWimW55nyidNmsE57R8D59b2c38QPcNCYWn3Tl8NAAH/JJD2W
	pVJ4CuC2J6NJgT/HnbjKuQiBK0XX7GNFryo3o+aI68CKr1mlpBKBclAkx+SI01J+3sYG3OMRFjj
	2KpqZ
X-Gm-Gg: AR+sD10C/f+oh9rrS+qiU3wgs+WbAw+cZ5hvuOwlN7KgQTSGNM9U9jG38oNQ0lBcktA
	N3KPgQ+Lb6X6tc9W1rFtfgZV0S+6l9X4qWb0P81xe4Dyq+oPI44u1WyllBlpT0uGPFhc/GovE9J
	4Os5tSBiHsA1RnxQL8kOSDWEsHNFtBTDXLoil9Q5cG+pmnp5lNM4H3W2A71hHlrIyoLbCZhepar
	vo97aT69e9EnvJ2AwsHDNPGEcHRb8g+7R6A/H5nVCvNc+mICr7iuMLD0usRBLqmMXKM771MMsN8
	GstNax0QmLiQLpL4ebVu/CP67FjgBK2SyEmUZgiaa+DZAle9aFtKmXjddPZmw8UxbWowEMbcdOY
	u4BwSzjh9QCCdGdOtuHdln3lUvw1bRQ/Isd+1X3CAsK9Gw1ncES0zMLLtayRfXQep3cD/fxgeEC
	rHNaPpdffykV7Qut5d4WRTdzMwl23NSnOFSZyK69q66jqWr06+P6gf5Oc9NabEq5Lt5JIlV36Qs
	P8thcxGYJqoGv3beKSlnCPWsF4rFRTMcitab/y4bcNS8W5fim2U
X-Received: by 2002:a05:600c:3e10:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49ce57fe002mr33589265e9.4.1788321948081;
        Tue, 01 Sep 2026 21:05:48 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:39 +0100
Subject: [PATCH v6 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-2-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..7d58976dccc4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -196,6 +196,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       properties:
         reboot-mode:

-- 
2.51.0

