Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D516463B6A
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986560; cv=none; b=OtFPjYembRJxm1/7/+KMKEZTNEYi+8092zvJv+cR/QVA0R4ufGIf/9cSKva0B9kR+ktkwsHwD5iR71U02JaNAmGrzsmk0YDY4QZ2Nfrco7MQU7pfIuVIkjl5Xs73LTZ6BhyQlwA8WgXAwTtyIMDEcVYauADZOvS98rITJ0VR+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986560; c=relaxed/simple;
	bh=yRmQjSr/b1n+2ZKNAqLdatA7z7rC3bcwWePK4c5tw0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtVuk4NoTDye+DWvMeZc03CHkRXFay2i+tv3/7WRVDyqEk3R6K83s3lrb/XNHrweQrOEEcAwpIroIXv23coCkE2MsBpFmdB4gsaFTjA6ID2e5KWg0f0kuRXCFwDlnJ8zG8rA0k0EO9mTPTgkYAJFyeR9MIU6C5v+OSV5MiAYDZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=2aFOtSc5; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="2aFOtSc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1786986552; x=1787245752;
	bh=soeIyYa5aMdUFjj2kbEEXj+tc74K06S6inGIFF/6l6Y=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=2aFOtSc5YMNiUt7wH6XfWAXafxQKOkS+phC17QZ9mPJXzPxT+o7190ynAJKHgcxDp
	 VWLHMgRikQxZKLkxW/buVOs36yPqS/wkuzdD0GS8dqFbJDR931dwe+j/vLvZo7xbx8
	 Om3GFtK454CLegIFuI85bKEcDJQYWOGaeKDdUT3pGI2TJF83HdYk1SHJAJBkJLxIhw
	 n395sEAL45mfdtbG60fnqFgJbGvRxFcKfUUl0MnYIti7SDuT/dIm8MqpQmj3j+vx44
	 QTLLW8DopfnWR4ccnCluqwEPSAVsFmB/Zezpe0BrhWQqe+JhF9P6lH2q468SBiP1zN
	 pnAFkGX2i26dg==
X-Pm-Submission-Id: 4hNzny3KVTz2Sd4C
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 17 Aug 2026 19:08:51 +0200
Subject: [PATCH v5 2/8] dt-bindings: iio: light: ltr501: Add missing ltr303
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-liteon-ltr329-v5-2-6f71ab2b0588@geanix.com>
References: <20260817-liteon-ltr329-v5-0-6f71ab2b0588@geanix.com>
In-Reply-To: <20260817-liteon-ltr329-v5-0-6f71ab2b0588@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
 Maslov Dmitry <maslovdmitry@seeed.cc>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Thomas Gleixner <tglx@kernel.org>, Pan Chuang <panchuang@vivo.com>, 
 Yangtao Li <frank.li@vivo.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786986543; l=986;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=yRmQjSr/b1n+2ZKNAqLdatA7z7rC3bcwWePK4c5tw0I=;
 b=CHr3gyRlALmWbQgLFDT/zXS1SsNp77yU61LOnGxfTmcb+v35jGrYMX47q9zwG+2oQIOEW7oSA
 NnZB693In6XA4ALZyGl/YkyXmbRCv8wSVUpEC7ipe5qMb1Mk06Op3dU
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

When support for ltr303 was back in 2021, the bindings documentation was
not updated accordingly.

Fixes: 7d71d289e1ba ("iio: light: ltr501: Added ltr303 driver support")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 480523ca3750..6234e2eaec2e 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - liteon,ltr301
+      - liteon,ltr303
       - liteon,ltr501
       - liteon,ltr559
 

-- 
2.55.0

