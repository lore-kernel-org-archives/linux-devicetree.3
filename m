Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC8218821
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759705; cv=none; b=k+fUvmc3z/ZCeN3Xi89OjJU8fN7l4v+yhlUwRlzsFAeSAHaEKVdzu3QngafSW7uVV8e91B6UtHoxALasqgNMUUqZRZVL6y8J4FDiWAzqbfWlzKXpMPjbq9vRWw1vAGHn/bVw17ACK+AcUTbbe3q6+yZyyfGard+Q9ZmMEkibQsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759705; c=relaxed/simple;
	bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdeSx/YMIlBtLiAugGGIL3qPo84ZiEXtI78+Dc93jLNnganxixQBdaqbw8M5LFpyuL4xZXCUZsDYbT169/hloiN5Vu5Gnm7M7ajiK2Fpu/gMDyW0M65mEs4pamYYlNjoRJUKyIbgOBFGUbHlowqBq2/jRqsvBtvW9MuoS9JihxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq7ix4KJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq7ix4KJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82c2239140aso1365837b3a.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759702; x=1775364502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=sq7ix4KJart/CWYnJhyDwYoVpDzWUjMRMO/U/nxVlFxHmlPLSI53aEhBveCE1QIEv6
         9k4lPmuXLwHiwleXnp6loWNQT/fpWkQSfTyJM3QJVjsEJswuaWjljhfx3HxqGfR7WGLM
         ViXuTEW2fXWL1C/RBV0MW1xQLFC/L+Y5pbY6JSqwZPap+nBMOYsTgafWARCWsL/cXUYS
         sMbt0KLVdl3VfXCvSGthr2BLGDxX3ytVdm+gHws50PtSjw3Hq2zWfOiSIqt89kE7uD69
         iq69nE4uvOFQTgTKPOXBu4eN5o5G6thsoqH4bWctHYStvof7q6xGPsuVWmSFR8HnKuVz
         XJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759702; x=1775364502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=S5SZ83AXEB5v2uMHSBCssncb5Ee8a8h/0et1zXq4VXgtWp3elOUO3rPoRkIFieouH6
         K74GpPtWj9E94JanblgOvhh+4Waie2bloQUXcVMWDBD7TlnZuyNA9zTjEgQebLF15FWi
         BCoV3+5+qtHNPJF5BMt4cEFHvJnoMRcYjMLo2j/rBaBoYlezRRfi8en3s84zab4JFs5I
         VuJHIIgFspYFlYgbSV8nB+YhB00c48kbwuqPNgnvZSUvDOxL5pRp1UP+A3cKydont14g
         DaH+NsVFTHr6e5sTXgygI2z2AybkduF687EOcXKHboBskuYCIcSCasdlvAXyy7jQRPEb
         KCLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7noJO2RqK0f2qiUva8hy9jljEoo6usyneiERLk8C0eelcuqCVrHk5W2U2wpGJglVVZVcG+0mcydR/@vger.kernel.org
X-Gm-Message-State: AOJu0YweGoWDzDmA91GaW2K/xyXTTAB5h/bj6iP+GBRoEp/C9+qlLvUv
	iN8/i2CKXnnaY05S+PQFaJg61hb5QYm3BG25xsxEjiOwiSEpyHQYSm2+
X-Gm-Gg: ATEYQzwn4flqdSjwQtb1Ey2XhMztYYQTD0evpN7+5eJsCDS5sApvDwLKxQhMp/Vw5fB
	Dn78hLiJaybtlatwbepwaNQXbYOhYRd6el71172Nganr7b/lEaxZKVRYO+0bLLrOsa2GlWMSX8r
	oG+b3R4HHnFft1eiQqtPEnIYSna0M+pOpqGp6i6+aKt5sKZ/k3a1a2jlCw1fzIem8oNQRjfvFTp
	gT1QULLI9UIE3oenqL7/ChdvyFZSquCIDPQvdJVTKu/YhNvTtFgdQDVnGICQiDAEIc5954kx1Pa
	LESQEsxVtMUR9aGGc6hI37BijhwtI7SyhfQ+UERT29tVsT5e0qEm1LwIzc5H50czvghsZOutrKj
	VE5P6SM9gcCQgSDhD6fwpP0cWqDxc17dv9izw+YGJKOWO6Yuq/H+Ul6yBMQIeQkCLDinxfqBzag
	cbqDC+jG2/ngs0eUzAT4mdyhAkIB6WDHO2mV2KJ00=
X-Received: by 2002:a05:6a20:2586:b0:398:9c2b:c92c with SMTP id adf61e73a8af0-39c87958b2cmr8139178637.27.1774759702273;
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:57 +0000
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-2-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
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
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=994;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
 b=Gerql4KQotDpznTNfzs2aU5gnMJpoN1rt7sSLUq+cuKe30nRjNFQr75AqDCx2jLHmcs9nNTXy
 2ISOqyWJi3sAHnAPmupVbSjeKV6GV/pqFOoo2Bxq8JaMIWcuY4TAgEk
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..0d467c1f30ed 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0

