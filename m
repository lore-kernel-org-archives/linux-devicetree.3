Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE5379EC6
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143024; cv=none; b=bBoNlBUUYupTvG3oUYbgS3nUw8LfsIf90hcGLYs56i11Sw/LAnCHze8G1px4ZOUBGxL6WXsWnrl1jN+mlAS0jlOrWJHM7SSSEJ6+kkLvYrwGD2LukFO9SFw/K+azgb2vz1z9jQ7L2jG+C5JfJyv3F9oQKphBg9k9NCldrdNX9kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143024; c=relaxed/simple;
	bh=QblJLYUxWFmFzazdWdnyTl6+OSvjApGOaFwY40TrSx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDxahK8bpmyyJrdaP05FwaQKPJ9v0YzKquFHK/gkOwZuzHD5kEN/NzpknpZcNlqPgLbIeFSTJ3EGZ5uO4EIkxHwbfpAlvha9HMnua22eP1jDiPNHNeVgufxgyi4OlMYkTFt8fAPKJq/YAdW7mKynLqby0v0VJ9vTEtwm/JROMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=ObKnWdsE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="ObKnWdsE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso5814565e9.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143015; x=1778747815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2GFJfRBDAiYvavg+mzcOx1RG8QRX7o2Aee/h+OWKfc=;
        b=ObKnWdsE2LrK0uuKGkwNbauCGzO7JS7xioGcDN6AJhnc4yW8FlEWGpIjC82XEASH1g
         eE/u6KpoJfQYctIuvCEadVBXMgOaTE3d+HKaY+uCt3XyD0/oXT9hK3eB5OpDvzJnDm+p
         3LMGArkSRnqRMYFO9Cm5hdQYw2Chvk5KUqKsQInXqUjLX1KwX4Emx1eN6qF54L8AYQ8O
         n4khypmUSJHb9d/96x/0o/qL7xN99pdiHVJRfHmRt2g4jo24AKgWfjSpY7uaGss8JwB8
         3Nbq/QILR/hPCCIR4mF1w3ias0ZDBBjFJq2vFMr7ahQ/HGDhtviDAWVR8YJf5kXR246h
         cxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143015; x=1778747815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2GFJfRBDAiYvavg+mzcOx1RG8QRX7o2Aee/h+OWKfc=;
        b=P3hPKrEYYZxIyq6RY5H/+a2XZEGDaovzLBtr13pQH89a4bbwTFovpcSpvFOLRSQcQh
         VYDDiFMeG83RpC7IOJ1Ggf8XuAOwwR2LjdebxnB9ADZTbcCEpSaLZbsVIVk9Ah6ARl8J
         7D4xdj6sCt2hLzTM8DBXZjEm7iUkkBBz2f8bHDtq7PMQYLc6uCLxKcySnTzc7sQLpqgy
         r1fsH2UyF3iKX2K44lC3v9TnjVwAv37OR0htYbqW0YIAH+vY+xp/B1fHyNPhHoC4YGH4
         6svdfn//tp/p92zVSd0qqlT91U71ET/XKDxcWlpoNfSpXiVHJYLk4ZTdtsdKBH/UdXVe
         PErg==
X-Gm-Message-State: AOJu0YzXd2Fj4zM/AEJWRBPVQA/GGvv1rUk/stw55IA4Fciu6hlNJHhL
	xz3W9tj4/TnDIUAKm6vkaJwBqG5S+gHa2uRaVOoLGYOiFD+iAFh4xOjfzo3N3hDYL2U=
X-Gm-Gg: AeBDievqseKXBrrFqIgVCFuWK24Gp2wXKxdqtgdVyS2LI0K/pdWT5ntdkA0TRzaVSB1
	YxnA02OiIQWU15vXcQzZUQMxE6BABUvq56Pd+RQKMhGharBiOWM4IgCX20I2Vw6ZwBoswNLDVQk
	+//PrpMjIzyMmIos9r13wYN/oIxet7S6CejVebnD7K+bGiQ2lQRa+NegiaMSpzZnOh9CDxyawBe
	VIQiVnbpkMto2izG6U9I2liKofaismYH5tN4yT7pcXMRPnhi01X8E1w4EegGBXlXbaA4Wf5mKPP
	7pKVnkQ7IptvbAMqcIeTa6IlhKswEUS4ryNLRKM4fXuGDlZB3b+sUNhpUkMXMYpMtl/FpwUrpvp
	zRJrzuloVFtTwSnclHiPHJWsmqRlIWkdB8PcwpBNO++o98iZAJM/2uyWmC/MACD4tX7lB2DZP1z
	gvXm+7bO8HnjRDYpE6Mi/O3RU/BYqm4z/AAij8F2AkDtMa0pCHI/DAFhQww4AOwzOxz1p2HRh29
	L92FLz1ESt1pP5izo4uTGoI4Am/nQDrmSExA5nDIV5rnQ==
X-Received: by 2002:a05:600c:34c8:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48e51f2ed22mr128679615e9.15.1778143014929;
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 07 May 2026 09:36:41 +0100
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-2-47d3d3372b33@imd-tec.com>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cc29b06621a9..97735d31f1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0

