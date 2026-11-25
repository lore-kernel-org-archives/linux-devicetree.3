Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578238;
	b=YauFS9FHHwlIxYh0a9x5NPprLajBNsFr4irl89MrqboqiZZ/t8KVlec4HtyQRYBzydtT
	 EW9ArYC2ioHx80gMnC1G30qt3xx8vjAI9i2O8VF1p4mBNQnoimu6jo6fPiT83truVXW06
	 4kOq+4yFjzS68kbzcJkyP0NaUIbu7RdyIoIGRbtl4V6W1UvVrlq4DJnqdCxT9ETNn7wIJ
	 TN7kf1chFOd5Lea1d+PxYA3r04KtPQHwJyeNUShrQhpIRjkHnIF7vPE/EZnk7s/fzfzUu
	 OhafslJprlBCrgcARaeebsvjHzBAmH3axYcYRkmh4lueiQPOivOzyx+1uTDPIS4nRBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
	b=dHXQOBAICW1hPGFDoxnBLhckxvqkio2mVBhgnWjsecuFgi9BCfjpDyirSUUdapkkCxTi
	 Cjy2ZXgyRIOzlxmDIKuCxY78TUiKV+AJmNkU81nvvCPLEof/slBVvCspfyYs+YSUAzSRP
	 qyXorka0VVH5XlhHzzVox6XtFK25ZHHhvOCcHHN9asxvfVIVmOCxGoHkc5Pmpkqr+m9wD
	 O4xEgnDDmh4mrTEvvb3TXhhBwBUmrmYg/hoZLXxikgoSbZh7/2Qs3GrnEFPoti3WHzJxl
	 mroQk091C7VUzmdPmmF78J9upTWnE2XA6lZG6MhYDYoXla5l3zPnevM4MRhTkGdgSNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34E606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC34E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso64938395e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578236; x=1796183036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=dEBczsA7Csa4wYdE9zU2ZWCuv3c+lNyP1g6pcCOAtEbnMrJGhamzSdETIVfCY7ZagR
         kX09bl2bERUvo5yj+3/MV0BjBkSARjKlcB2IH+M8y1FiELtNsF7OrcBNCuj9GZ92sJUi
         Ool/Njo35MxX8MCXscU5+lEkX0wMN0iAE1HgqVRhGboodpHuVjgFtUR4qggu1dQycR3d
         L/JwWOYt+d4dZNxOcOHnHLEvjr49y4nklFPyI4Ia30AuczVcHnVqCD+J1JCrA6pb1nSw
         SknxbrCq9BsEdkeakbZLckjVjTdpyHmCg4R6qiYzmIYtSqlHBgi77W5p/Q+PWI0CCX4j
         TS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578236; x=1796183036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=o0UvVwu6B2AhfdFAyCJ97BSIUVfQ4FQedmdWlEt2xo7CwhP33LPPc+UtbQWje//rGu
         R0jezFnfkMKGiV0d1zibj7wJOf5TRofAklWzEmys53bIkARfcPHjDXJCbUR4h0/ot3Ir
         lzcUTJ6wEiJGXecmThuKtGKU0eEyLw07oDOGCus3kVwuSNiyHRkZivayBe8Pozjg17ZD
         ZO9Lp3fPZj1MuyPEHvABjbHxIU7bthvvi8MyWUS55OJo8BlR7ws5AWofx6ymWDFo5QsJ
         kOcI/FPMNoggNlrtoqkrmdl9cL54Vs3sGaAel4+n9FHAeUt/kc2ehLKgicsfxQJFWpG0
         jfOQ==
X-Forwarded-Encrypted: i=1; AL+hErEWjlO5roGHN+kdw6ThJvDrUSI0o9HuEUSAcEMETDmvpWUC4a65x/+jb32Mrq5ZTaFks8O8yMPKXPiS@vger.kernel.org
X-Gm-Message-State: APuU4Z94g0+oHYbyg92/ls4jJ1CZwh73jIUCLpaTa7yT6+iZ00Imh1PT
	nS41a2f70b9GZSopFvKSqLTbbnemC3GH/J/RpyBbZhoHcuAxp7S6tFNfWXBzJi5u4L8=
X-Gm-Gg: AZFdTZcihWbbpCbe2Y5FRdpbweLiDR979pIxnEFQ5+zXegodR+CeuGxqdgdR3Nyp0Cm
	Ozz59KuD1muN4PCl6ptSpUt1eiuRtCqef7zEbCCooxhHByWgGas9i3coVwvQUGtt99n+9b3agIY
	TWoBQJRsN9oI78hV6RFlZdc+z57J08ktmRyRU3uVrMFnPe0PlH2uMhpkJqkFZmwGwT8w2TuEAWg
	B1KSO4QBFe6ZpxYNWTvgyGJRZp3LlQR3gc6p9yZiY35Dta6z4dytCKFblGALewy3Lm43Gi6IUOe
	N7D1xHv8uGuMDqXzqcTkrj6ybI0Wd1bKvbF5hbVMBQ17ox+ZtuX4zI90nYpaV3oPhO6QJn60UG8
	l2P6WAhpTVnv/IdqGZ2X+ufzOJxTIbT4ctduZ3uZvEh8Gj9Je9aZH8hNFsA5Z1kmf+V0yZmz8RD
	UmOyxQu3kbTwzAx3e6tR8sj4Q/TAJn21mWdpSz4hVo/w6ZcAQuB6S6EzM1CWWjwS5eIMWawEh8H
	Wzp2s7O74k6gsogaBgpc6fN8jM4nQzhMavY8dg9kT4lXUdN7s/TasQfns+I2QBX8xAEIbDXwE9G
	52XGTfJIs4SWb0WXjKc3LfvZAfRNZgaxGzQbkA==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr352610575e9.19.1795578236299;
        Tue, 24 Nov 2026 19:43:56 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:55 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:01 +0000
Subject: [PATCH v3 05/14] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-5-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=961;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=vc+yCVm63yJiTEyLJCU/ghFkRJa2TidHkMEEWzw/3Gc=;
 b=Yg/VSr0scUN51i9KpRAWHfU1hj3WxUg4RAt781FW4PuuF2y193VAPyf14yap65FpsWKVde5Xo
 6se4dVNbdKnCzQeUFO8eyXXWtGTKy5TyIr8La1GZjrp2oxL2C8sTpHU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

