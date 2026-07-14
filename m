Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E36433026
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058464; cv=none; b=JMxT43xPLZX0sXeKf+HspHTpbooBemSlyRxHZ06inCUX1dw2uZM7KukZ2FBMBM5VSisoYpYWTSYfP/4JIZa5mQvmuAMzFs4Fz2wVC4REA369eL6xngV8o0hl2ekvNXAN1YVOg+snEsBXDaszAaW61k11MNciHpB5gSIzauypT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058464; c=relaxed/simple;
	bh=U2YoNQx/hGloZRC8McPJss1WdTnU2vgI7Fy7zmdhFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvwoQPx+ZbpWdQZoloHw3+rcu7E6efd/T+pwWEfFuFXphpY5k7eJGLFXg5ynrZkZoKS7b7yIG60z63UOO0LTGoy2cwdOTXPi6bsJQVaBvxVU7nWBe7IIdiqKtGlm5pcKkmkq//yTXgc9rxIWEeDiDlWE2P9pfUeb4S1AWjxQVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyZHSMzQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyZHSMzQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so4954228e87.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058460; x=1784663260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=pyZHSMzQyFI5idb/CwmpcPkmdtQ38fAmiCyxUHczWKhNCd4+iNoYFT+60lXFzBJejB
         QrB7GSJGcEC/Dwsi9rtTzbVG16ZxcvRIND4NcCxLyBcjYljpwTDYh8N15nOE3kp1JSem
         vqEBAXw7+k0gbFde1OmmoqyzarLycEJ/ViqgZvV2OjzGG5UUJExB5K2XQXD73l6GKY2/
         0xd5rRdxbmHnBRj1zZivmvuK2wAAaphwxghJGSeRfJpnyr5V6ZRR0DQSd42KeY+DIYP8
         I9D8HC1LEOkYigGQuk92cEQPJeILebkR5JwjqZVoGdsNnRcvgq9S1UEjxHaXw/eOw4Jw
         8hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058460; x=1784663260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=qNjGItTZPRPoDDLhyQEOQStGJPK7LreNQMWfuNZxc1ogByu3Rv0K/HNAO0WxvKPAEc
         SekloFn80dYuRoAXR25ljzJOSsa1oUtp/iOhl3czdBDoAW/vdfXYUmZq8p7p2owcKziy
         hnWb1+BIr//W2e5z6jIBo1sGTQvBhOBCRD6/+xi+NgYfxg2PNt0bFu1orChDlfs99KOJ
         miu5DSFnAfw1uC6x7eaFN2u3iUrZrzHHrSDLyaLKKpRLmFxGs63OoBRd2B8V8BrPnZbo
         AXpHQDFoFsGePKwjPcX26XertpnkzQLPW9Wu9aB1bHvbq8rLEpEWbt4PCkFjewjVffmf
         HxGQ==
X-Forwarded-Encrypted: i=1; AHgh+Roytcnx+jzrrUwk5V722qyNja0oPSjAgw6mjvXGgSqG6bHCzqLGsku8+P6SLbkMsbjDq4EtrHoi7G65@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHVMUx0Hi7xmklB+0DpK8pGYaad0dH0cs7eUyIcNFINvPgBow
	XUoHL1T649exoheNJnscEGDMSWR5XNMFP/hsOReZ0BxZbIOCA/yrA3vo
X-Gm-Gg: AfdE7cn13cWKztHBwp9oO99Xg5O2l0LnM8vnS3/Boq/z+7JffkFzR4t2PzQAmR6KN57
	D2tkAYclPovzvT6ILpD8U3uUJ06pgkQMXTp+zV3VwIGyrFlZkyPLMgMmQAgyu0AJNb+JnR7/+SG
	YLAEmR1HZed9jfNttG6eKo7Eu80EourwlhF9oc7M1fwO79kH015bOOkRFRKOQXLJtKlPXRCxFwT
	1nwfKqeizfAjww1cSl4bMAz4P5P6Te2+waFYoEfBOnaCXAyg5m+Ap1MjOUcJZiuQAHEsbiOXnNh
	LrW5IejjJf7Y64GKmaj5bZXzvR32if+bIfma8JEl8MiYrXa0I/GJXmTs64IsTv6xWpmqVXJA49f
	nbqRfYJ8xXIUv5wGyWkb/mMZWT2BfSanOa6QipLD6PRrCHcKCGH/EK20sBnpDhx9c8UPkYWIeRe
	3/OOrwIV/vfvtSwrRumNlPtTLLevwBFFzk51ctgHGCx68AM/E=
X-Received: by 2002:a05:6512:6185:b0:5b1:4fab:fbd4 with SMTP id 2adb3069b0e04-5b159b8bbf7mr716449e87.59.1784058460358;
        Tue, 14 Jul 2026 12:47:40 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:822e:374d:22e8:16cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca50a8esm3780287e87.28.2026.07.14.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:47:39 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 2/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Tue, 14 Jul 2026 21:47:16 +0200
Message-ID: <20260714194717.596193-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
References: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register layouts are the same as for ADS1100 but ADS1110 have different
data rates and have internal voltage reference that is always 2.048V.
Also correct order of ads so they will be sorted alphabetically.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1100.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
index 970ccab15e1e..28c5e2dd0ad6 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
+title: TI ADS1100 and similar single channel I2C Analog to Digital Converters
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
 
 description: |
-  Datasheet at: https://www.ti.com/lit/gpn/ads1100
+  Datasheets:
+    - https://www.ti.com/lit/gpn/ads1000
+    - https://www.ti.com/lit/gpn/ads1100
+    - https://www.ti.com/lit/gpn/ads1110
 
 properties:
   compatible:
     enum:
-      - ti,ads1100
       - ti,ads1000
+      - ti,ads1100
+      - ti,ads1110
 
   reg:
     maxItems: 1
-- 
2.47.3

