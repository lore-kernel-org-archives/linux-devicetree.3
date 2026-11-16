Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864477;
	b=uEW19AsoSvxZUbPgFGZFtrlKImXGecCNaAcbKkgUMO5N4hPmMOQ8GixukvIqSp+kQxvt
	 W6vFq5MReSKRMlCwChDBJzSP9tMrZYWs9FnUxCq1hxte8Xm9PU/D2MCapa100wZIi1d5i
	 59WpO6CUz62fZrx2nX+2loMd3MRjUH1/+0T1idlEE3DJG2nt0kcrf5KR2AzowDQYvUKrY
	 HBI7TuLEjMxoNSqBBj+KPKtL3YjEkibU7LwL2+Rk3txPScNnCIExIPzU9y9XKJS6GRQBf
	 kHRHKm2OLFeq4S1VVlAXsb6+xC1hcN9OoeiEnxWik82VX9pXgUOQFv1QRofExNGfRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
	b=dp3AEpwV0ZQv1e0vHyxFZr6LsOLKS6f6eyZhtSOtYINEPuS17GxJwWsjQ0tqkJXY7KDR
	 YUS4ejZdMoNTnetNEQH/X23pSkJsFwm03fdOSdPYmQz9zLUTZ3rvTvEibt1o1RGU7anWV
	 fwbZrDHNHXKJmym5dq620BuE4a3SHIp1LnLrlPaUypX9fsVkVJlazFbk8TL+6FMCtR2de
	 mV8yZG3HO/zloFRU6JR+W99nS/O+L+PwhltRBUPlCabUoMMBX4epjl6q6EOfnDSFuZ9f9
	 Vqo60L+7jRMfdk9h4ySV2tDf0rO6rGc3P1xJb81U2wnRjjaxwmEGzyAHR9FISfgahkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56596606A337
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56596606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso194013f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=FPpD0dISyKSAsA/OfXo9aET02c5v7IUiKwrzM7OGBDFvjMvTZoNbDoYV4Ex3Y3uYhp
         Y6vCQ7xir6up1dfUVLJ23VAaalNZ4uISwqpeaXPNkJgGz301zcyyvNP+hYTj/McltQK2
         nHoILFZ40kLf7wxINR1Pp7egTSiFzWLEp0yKng4RRniW+DeMhQ4V0omBbBAyczu0GDB0
         pjCabrcA7S423UTuSJS/0gDXZklx8OB2tDXAufmuhZv6NgJh9UmOymUt4fRkyObYF2WD
         JPvPmLCEPG7sKQ2EBmwHpk+O5gd+zkO28V1bvTe+aAAB0Uos9QSDOxduGncYaIIXzqk2
         6qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=izpPrH3cbMBdoeyUHpjAMwn+F1a9chyEQZrfvoKID3HCkDFhwbOiXKRK6TOLMq+sHK
         xT3btxAt1G7DnJz0qn8JxbhS5e16qbUewsEZAyJ0ButBgDsswY3R4mi2Fle+FuXRr73j
         Nt6K/wt+6tTKfDVvf/UFIT0x8KEf1eZIgYbJdL/m0kNIkPylO8+evFBCrFgy5aKUN6Qr
         8LSZGQTvQpFoYLW6Apqhrle4Fymn3LpmrYLPGT5V+dW8F/7sUaF1FIwazA981Jpou2pT
         3VB9ElPP73JdgRALK1RmV8aLCr4VUt1UEWYcv5esJzocFV+4uTLoPAhC5Reuxmz4NCeB
         FZwQ==
X-Forwarded-Encrypted: i=1; AL+hErEBSj0PlI7D1XQd/YIvm3HyzmNzCnohZY0djPIbD848t2TDU4tY48cjb5n2oxYn5RHv2Ga2C+a60lXM@vger.kernel.org
X-Gm-Message-State: APuU4Z8IkGsX5msvjvS3XsCKWA1p/5bXO4wNQ6ccH9VH54AItVYBRCGX
	D5MbiZpj4+4PGtlaFprnDNYXIF5FsbbKntnzNjC3Bg7bSVlhDSTuAl94
X-Gm-Gg: AZFdTZcRsUYXFQMr3KR2HtANcRnU+EgkQrOiKoY6MRceOnS/rnXgwW/2UQJWMzXIYlh
	D1cW0iFJrZcqWF3iI0WJw6r3j101O65kilg7j3/ADw7NZpdchHxilh3n/bqgE9NB6loPqqvO9aX
	cktxnte+eo8O/kPxADoG6d0i1ZUEktGlKjX46rkjYlAS33PlNbt7OqDgkZ4iApdd4km2cTNw9s0
	nsvLZ9nSKYYvavk8MqNuYf676Py+tHJWgAMqUhWFczO+mcvHnV2VKkJGdLx0B8OT290ByvBzUpv
	GzJlzEgbciARwezO58UTvJ3epOCVJQNyPz4kdsmzOtCAVyHs/TXV5vOn6fj/5LXUIsKx7ntX+kg
	G2qTulbY6z7xwigphrhJIaz6SZkqQTdQ9asKPCJw0fTtmAaQ/7u29w610v+Y4/usyowVIYD5U5m
	LBv7HPzVYrg9W8bS9o7Jg4DBkxZHSJIUQ+QEaRW72PeID2UL2zIRBZYGo9Mly9i7g/JS0Ygmr4p
	i5wg3xM9CXx4upJHCEZ5qv6qCSdfhtaaMmfSuzL4X+cP/9TbIkddDFeDPSYu2ZPFHN1Z430fJ9B
	av0ui7qb40ErCXoabsHl2QM0MeflO4YUKYY5UqyuNuVtno7znHcVna0K0mqFnA==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
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
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

