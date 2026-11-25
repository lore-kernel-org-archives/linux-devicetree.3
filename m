Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578217;
	b=OpAyxnkZtjfYt1S18tRuIulDjkHe9Q2eBUUeuzTW1URfsdWebxnMFvAJj6UADbp+sNbQ
	 CVNmJWkRGHoDCU8XhPUTQcX/3T1A7VaIRw0Bz24fMp4jox9UG9CeRZAEicGpGxELm24yM
	 nJGljjMzq3ZXCIMcyHFwDLvL7lsxHzWXTiG6CVK5eOaDwHpaaRn4XTBaI08FRPBJnv4xj
	 ZMHDRlDy7IXo1xJV0ZB0C5dcvvf/ymMscb09BB/iWnfu+tb6MNWdGlvAq7trNLYYRJH9W
	 iMOcFp0aorcCFr7EeefE8vQOn60HjDaYhWkt2r1sqh6t9TJCdJKZaT87Ubkik82QV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
	b=VDEpeaguAZSw3IeI6kxrFgnLMlympFUooDWP5xx2gcF0TGIk0LguxqCw1BFRXN9vAWN6
	 0/NxrD3m304WIRFs9+x3PTE3EycBQIQInyjLB+FwmZnM94BCFNVofhj+YYLGzxYHwajuc
	 IohzujWjby89DwkJX1axELygPnS9JI5LnDQkZvJ0ti4I+KzYVEl+mN6eWOhMe0fT/v74i
	 HbliQ7munIyxL9KXGqNt9MnMaDhiJaNjHsETp4ZiK9ejE067pkC7wwOPgwsXEO+BCIRlW
	 4KHYaAoqm7hQLZgBN3vWK1khgfKSEACsRp3StoI2ZpNGYVMf8pBfeeHDZgUQVRFVipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHm56pzM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B830606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B830606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHm56pzM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so41996645e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578216; x=1796183016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=UHm56pzME5QuJjhiAlkwHOpYeDJa6yB0YSYI1bvu1L2C1K/b8c8JqZfqvQO604D27u
         kbijntCdsTmXmZuyEXTOb3UWjibtttn9sm4yIUhv5BWWR4I4ZkBHypc2EQoj8gClP2kH
         iWlUwFG+ksAX8PfuGzyqwgPWimGWoKbwCaHODUEXgT6GTXr7IYQf2wZ866+zITCViM9+
         cWdmBvAUOA0q46kcT5cB45N/Ty+c6kaDy9tabJMeqja7JP84/DXzhEmYtOJHcJix8lMn
         ap6y5YurBKaiszdHFCygN5ro1OeYnibVACzFSOUr4CNcobuqzEvh4D1LFkTgVWGuKHY/
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578216; x=1796183016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=KV6AUDZ01elXACEb/T82rNx2QZnjS8AlI4LolUOUrpg+OmmnDIzSyTATsXYNt/pNUN
         3oOLplZ1mMyQx/Firws60WmVcAeXRU8e8KroOKc3rlaQoldGZYB3hrKi6K0FjwNGTeC6
         dwdHW4H3zN0cDrabakq+LkKp9DMTcU+k2UOkcYbcG3AzpR5e7yBGL4gafJzfeHBHXnEo
         GFHC+1gOJPzD7K5EFYc2PHs/hOJJ6eGxsmrMuZWC7l1Z6ZKKTsu4r+9+VhnrxDjFsro1
         87M5quHpU6rVg0fp/BOb+9V9BjK5p4oaWd5YAUDI9FIP+p7xB00fSj1Y7eG06bqgS8JG
         AF8Q==
X-Forwarded-Encrypted: i=1; AL+hErEjQJFdTtEj8PS9+Pekytst0vkKPhqepBMBLEr5WvgB8Ct5LgNJiftcMZK5O8t9gnWrz85Im8qPVgy/@vger.kernel.org
X-Gm-Message-State: APuU4Z+NB6w4/LzrlkHTj1L92A6jIHjeow7jjcJSNbblh7d+aL2B5Mpm
	g6jN23qNLKRCeDVy1G2349ocZG0D4g4r0EBHnnd5UJztGUBHPZzBIDn0
X-Gm-Gg: AZFdTZdfrogBsnrVMimiIJiSIuO+IRRR20SHt/faslkos0Q79Hq+Aul3X2DoIl1Z4Lf
	QMezBFd0yQAe+i/g3p7s3lD/1RYKkRF81Ii2OJ6/8Crm4SjrdYyG6SsdglMpSBcoc3RykvS4PPV
	eVqqISVmWkYAtxSwYXPVj64y0P9te7M9jDBsU7P3NhfThfN2gzh5IcV+6aCwXxFmPgo01zg72mt
	RjqgAGy4v9es7J5ne2Nt5R8jpmDW+3gOstZAfdg92sqkWBHeuObK/GjzjPZLozAJxQdirf3eov9
	Ma7KDh8rg1PZG7+/sWG4as4kKwufcj21N2w1EkcH3ox9MJ3Xry8OA+N63CYp+qpdanVdkkpRkrn
	Fw03XBx4vxeDfCZM9tp5AriprKOr1moWVc7G3OqdNczXV0u+eFqhwcFDxefapY7Hqq1nh2YXWT/
	2es4kK7IEMOUHqUlAU6bcZ/vCuMRIXhPnmif4wUCz5FL3MignQSlLdops0DLmSvgbMLcBETIOHg
	KUKrwMsYTghxJofKhLmbEHuZbVQi2EPTL0GoJVy5ic2C0cQZzCVsJ/pcn41fGGrZYw7qG3ffbRU
	EcbpR/tYFo+lljnlBMpJfsgPA2vKIyqy8lxkUQ==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr346329005e9.34.1795578215688;
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:57 +0000
Subject: [PATCH v3 01/14] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261125-halliday-dts-v3-1-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=h6Yv22yIDPhl899/gQR/dzgzFCiAwokqygzx53AniCMssmz68nf3bAUZ4boIxRmClQQzRo206
 0Yy7j0zKrrDAxm4EozqJW8b/LA63zgVJosiVzUEWd1tTWYtwAKtrSzc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

