Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578233;
	b=aOiuex35Scs9hQn0J8p4Un6t63FfO068+haRNScaa+kaWGONu24kfuc5bI8xVbifoS+N
	 4p8mwHeW9fQmt3g/asDtVqLfST49z8Y/nwd7OMTtH48yT8eQ6wQnCZ7U24r6lx912kcL7
	 26askpoRRGjOCRPJ5444lcjQPIxTo6OG5MbxSnoVrE2lvR/mpYsHCLFbXDsJruZ15JDK0
	 MBqBKHOXRkGcpyrF8IWY2Z/4klwj0oV5o0jYKKm2rKSMmghO68hXml46fE6fGlx+a9PGU
	 HZPDb6DAr5+TK6LIzf+HH53i9Ewtu7I8D1ZjRacxwyS+6fNyQ6fHYNuJJQD0eMxsqsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
	b=G44SJBA15PttFzCPzot4e5Vh/7fz+J+wdxugLlNCv8rAFiYgInZ6+0wtgkH3TOVM47SJ
	 Zk4vz1mvn74jwwEC42FE40E1mRMB3FMREXD1qI2pnrDPf5C6Nz4kJCarZSU9wpA47hLdW
	 h5u7xchJvl0SlK+4gSgK25IWpNnlHQjjZ0R0WH83T56/CNXOe9W/wyOkmbUPjZpncIJua
	 /wQXGFNMcbIU1Ho/VEhKjnp+uPV1DFblwhvuQSndUXiFHsyoeqDT9Hoc6Qnj5Uq71WVOW
	 aXKKVXphmuTVsp2KyTQAMgu4xYlUk1dytt3FYdW/M2qDDjY/6o8v7o3vJgGaCcOi5kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3016606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3016606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so1692345e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578231; x=1796183031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=nk8tnEm8F0P2E1eehLNgHEIiXKzmAdnv1GtH/CF8tgRUFnMdxr5LS3wLsOby7S2Q1a
         cu5bhPH6llcMl0Bd4Ml3YCNlc2qzQVZYy64BU5JCXGdyxYTYIWgn76wItDfnowDbq+tj
         mBu/u2AoC4EQMLN4E5+BKngr2RQbPOWFa/jkefPtJmpcw6O8iLS9NHjTaOlxM5gw5aE1
         TTT1BHa+N0e/SyZxRABUIDdmTTKnn6jXzsMzYF1JRXep0cV+iS6lgDbG7uwfsTTzKX8i
         P7xAltyFkuPxXGNxubmztICD+yHtWeFb0K/WzvCEm/RQin7lrSfWUIrr7aelUKKa99i4
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578231; x=1796183031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=twpWVF7yQb7X9NVsFfMyFTXyUVHdRdkmVsC+vK30cR+aZtDwKA2sNJ6vcQkBsrjPZ0
         AUIwntiFpyM6/l7WbAcZYek5JYt/UNI+O5rDjU9tKNwRypvLRwUc2sFcTNP3fDT0Bh/R
         BgptKPbMfYH6CXkil6+FGN0+Bn6jwSz+hwynLToBtc7rLcXcCyuTE8B+GrCxrB2PX7Ep
         DGM7Vk5qRGoG+wsyiYP24s9n3BwxLamjksUeOOZx0ul8q4ZN0wOvDMZ1dJ6aziqEw/xy
         8KELSWuhSEWbABOqNzL7f15+q2gr4wytajn3g3jf3NiKKfjKyUyrNyrqa1YFvrGJ+IYn
         m/3w==
X-Forwarded-Encrypted: i=1; AL+hErGA1yfkFrru8bNeRdU2pG+aWu50PVyfuLlS7HdxlkCD/uO2ZMC372aJkXds8YrvgT9CDTPBc/l4O9QC@vger.kernel.org
X-Gm-Message-State: APuU4Z+rHCH0uaXpZB868f7TGVUeq+vrq9hLPyt9JGjN+P1wwXgQMquJ
	tSlC7szgzG0bXuhNARYJ0SgxzWigc6n/8UKk3X58VVCHJJ42RBfASTMR
X-Gm-Gg: AZFdTZe5wFSuVSjVft2wVweKf3ITMySr2/z/pduEjx/gzZoX9HHaAGwNJlQRTpAK0Zj
	qm/ni/5UiEDq9gvO+51bVsBHjrxSCTIVEkD5S+E/Y1Cfg51Bpe7f/lxTDuziUYVLIwD43AMPEg5
	zHSY1u9LnmWz/oCLR/EJYFf6vE7U/0dAslxFMmFQjCU4AwbdaYI2pbxAVzRaVx8GophcK1YfPTm
	vaE4kjI6QSI8OeCXlPVUIBguz9z6QGcSaiHN1TNO5oy3WjCA22VfFTVIE9LlbiiaVCZbrz3/1GK
	NAy1l/yL79e0nGk8tdghpjtheWkoKRr38+fHcwi4bjxbZZhZZyf1d0flrWYXNn8JO7HXKlqW+Ki
	+HObgOxgb+tYXH82nI91SuEzmsbFmaFPP+XjT9LnuDjvQ7jm30K8DFZPSLwXPWwyod6LCXxhXsA
	E91Pm5sNO6SwhyuNuv04f+SNEJFQwXM//uREhBIBMMnO+a9pSvi+hhzZCqfBYToSNfexD8T5YoC
	FyAtSFGqJ+YRq/V55oGyj+vfzXZR+y74zKKH1gZyHRQ42e9KZJ5gFhT9jhhyczhaf2qP6C3HwtV
	dWpdZRRmyLEprAnLx/5UjgiHeWnCiZsZxXThMg==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr298467665e9.3.1795578231386;
        Tue, 24 Nov 2026 19:43:51 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:50 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:00 +0000
Subject: [PATCH v3 04/14] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-4-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1362;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=rZ5xhc0Wj0SK9I/jsxkVVRd7EbEiuk5dcQZat95a7Og=;
 b=FzPufPd+aRuNJyTsxE9xMnhrwTERQ8Vq2nvn15hQVL6HtktHPs4XaCfbTVnTG1Tm3lVHQREl1
 vEmjvIE2KTICBxf0qc9edU3Nbke7+MDNmTz+aRTaj8sSAc1QRotZJxE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

