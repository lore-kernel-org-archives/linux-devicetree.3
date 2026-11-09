Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184422;
	b=mrCqs1P4hCfQEzhWwJqfqR8f18R96aEHZGJh9vmOzUO5LEzd23kWmM1g0ng/DmrMo8II
	 Jjz8sxDtKOO6aZN6Y8k4sm0o+n5Lw16eNzLrbT2+sQR/EDfNtmHcWVWR+D6F5eGeIqK7O
	 MJxwTBUvO5DbbTn994PSwkFR3H5p/JnRPLgJ62rT53lAuGHeFe0GVfm1cV9BijM5ChmG1
	 S+ooeANllwcL6SogOqsiX/ukaOfUtNY4G8UK0gZZ7c8F+Nl64g9S34YxZzTC0RF/byLUe
	 hb5GCLVe9oqJyVFg4mFCQiyWD/03weKbFfqnDFY3T2HxbUX8soHZ6DDaLikZbry/P/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
	b=dylGLtabJbKkmFbcGM6Gn3/t3Tcr6U706g9X2/oO9PgXr1YbLhjGkY9igA0+2/YP3PNC
	 JdBvByUBgm2TKXM7tn25OURihr721QlWKPPy9lVcN64bDzvGU+Kj7RIiysh4k0dFnS5Yv
	 ag9h7RZ4VGWsByK4OdSX9LAtjkSQsM/zAvKT1kFRGyPaIu/m8wtSEeSxPVHTFZPUbTOiu
	 2NSb2eF9YCDasvGsxoRqVGTc3rWpUqulgYyZPkYp5fyVpZZtAcaIxB/9JrRE2aMcAIBS+
	 gRId/GGvTENcFgWD+bylBG1UDdzoSnTVyqLjfguYfiin5lMO/AfxTUFUnx44JmxpDyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uD/fC9fw";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5641606D816
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5641606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uD/fC9fw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3337935e9.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184420; x=1794789220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=uD/fC9fwd35e4pRCBo6Ir49OZrB2lX+E5PGdQnHcUkYxiqu2ZiGRETZ2zJmW8sZlTd
         A5/c2Xw6hipV3YiwOTPc6CN0uAO33PQjgwXUPiZreZzu4FdcrszHSfLcFtjRZOPT3itQ
         xle2xxFDmZmDqyMCWSs93UsfOpeLxSN6ue7xOrrEm/NzYT0xzZK/eCHB+h5f9jiXpkxi
         ypgX50w+AjK0hyhr8W1Y5z3Zeklf121xyaUU04Mnsch0HJVE6Dc9AjOAXq0dywq2opUJ
         SUXNk4QGfcfXnyUDSGqSEEHPKlnphwjmf7JR4/7BbHKuz3djlAWOEVbyJKz8FiaAylH2
         4tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184420; x=1794789220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=WBPKE1FQDCPZvGiNnlwpcHiGXsYFIbq2HuCjCy0CyWucSjecXa4G+GfSVa90p7h+4G
         Volx+QKCVKGaoMxE+KCSPgeFRTTV55pI2tj/4Bsj3X6mhZ44u5SWZ1pKfdzZQKEo9hMV
         sKVQvkiWD2gwBXxOUUvdP6Clkg19rQIkLA7Q5CSRSW+80KzvIVh+AiryPesl0qwvfEPT
         PQkbv1zGeha1dLHfbtdOPernReW1IRaV+tSTBB5t02bBPPFsQ7vN0mirDLmmZiXEgBlM
         3QMqhgOWQql9UyOf8MlnxeZ8awqq6e2asfr68AS1mzHZuGMhcRFaMurDHx8twoKF0k92
         RVzQ==
X-Forwarded-Encrypted: i=1; AL+hErEm0gTOd5fsMmuzzighl1awsU7KpYHn6yjjtocn7G26CMC6uVUUjzOUWSdRxnPCI9JrecjnJRc30/la@vger.kernel.org
X-Gm-Message-State: APuU4Z+7eaz3CCzLH+H4N/oTU9oPmbNR/Y7RseKLdo86LqbywVCAmN/J
	D0d/V0jkPllVUome2mzFIgsi1y+utL+dus03J87/+i4Pbl/ob2648Y6n
X-Gm-Gg: AYBFou3QoAOaH7gcFWNfF3L8WZvs+IR6kJ+AzeunwNWrZ67ISYdFYkEIXRJOmTblfwM
	zLaZM9qG2tK2NKdKwlXFmHGY1vqJ8aJDcbyAIG854JHCfxy1Ghqd/WH+F95hk4QYdeP+956IIH5
	H19+GfGJstNs2UG7NiWinVwCUA044O8abAPhqjV8xqy/jqf67EE95uDAdDy5PjltmN74l+j8Rln
	GpuZaNKRkoVlxFp/euD2zR6yrmOydBFrS9goB6iuFoXzV9kvUODzjTZV0Td9nRddPTT8SS9Ihuq
	2/JBmrHHUdBX1enlJSm2Xz9eD/czRCFNO2EjXbQOSE9QhR+jvmxdn4XS45qhu4AQeiMuuszvo1y
	eHsvSd6si8eW8+T9gFtrMVrokuuZhEw1FtmYaRigv7A4ryngUAEZiE45Dt1CcUJjlYq1SKOlSAA
	tLJX8Jy8fpb3W6/9reT/MliGg2AgEwuU6JZVY3z5EOtZOGDrqLHK+prSBXLN8l67j6XMUnzwddP
	bNEAud3M4Pc5YgHUu3qx5fjJiI53XUPlEeh1OMRGxje/iy8oeWaSA/StjFczk2apjup+0nV7C+O
	SqG01JocT9ZWrvt34JnYV2L0YPeGxQ9jjb5/zK4wn49gnlHUKOvpQ/f22SiKJw==
X-Received: by 2002:a05:600c:5253:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4b94d762eb6mr47593435e9.3.1794184420329;
        Sun, 08 Nov 2026 16:33:40 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:15 +0000
Subject: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
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
Message-Id: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=840;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4hUtXzlXhIrBYYJFfDKQPQ3vEIzggE85cdjdS9WjQ78=;
 b=/Hr74fQlfTdpftwl6fj+vsUmb0ZD+laYeVxlhFK0akfSM/Zr+bIuUmQJNpniQW71Vw0S+OnBe
 X7HjWxQRJOhA4SO/MxeQgQ2JNwAjEDgqTYH/3IGyH4DzNXVVHXtyQib
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

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

