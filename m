Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFC30D3E7
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796228; cv=none; b=Np9PZ4NmGI0LPrFigHo95IFQNilQnty9Mhwtd/bFc675g3WZIaR+kB4bCfkfvhkyLOEJwRkxl9VoAizsoNh8k4aO0wq4/MEm8fxzBKnqz2rsz/zdGiCdKhsTCfSw8xqy5sD8bjew9pgTtlycvj/UGv7UQUIpvHx+kltXf6w/WGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796228; c=relaxed/simple;
	bh=09w37F7G01jmNkwQJh2unBpO+oKrXGgQNCyjoitWlKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUKy4V80al9T2KeWT4l9seyUEK5jq1axzIqpAG3dBrUSxRnljnpv2TXGet5tScqqNNeOzxmQdqiYrzh/AmnvlTTDkYTCppDTuOJ9lrnHsDemO2jmoSwEmCjWL7UkIDDs9ZeUI1EQhCwr5S5uQpOwOjhmPSj4MJeZsTukUNqAz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMJ8mN1Q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMJ8mN1Q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso18100905e9.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783796225; x=1784401025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9tvHRB7bEupQJjf2HD4EouNWdI+ExQrix2Zn7FFOPs=;
        b=gMJ8mN1QvpYHjeUN9Fw0Fu9ylryD/ZnHE3cVrAtKHeFiCjZJYsbh3YW/ezVU2mDXmh
         p+2tXwF9F80/YU4ABx8MlJ9pCRCxaK1d214V0Au/tF538n9I+zLyD64RQxMXZLpuh0Wp
         qIQc1RwqxKJrHbXqHVSOdUReN+cx7d/edRyN+XqeGKT7xZ8t1Osm1AMTGFJqcvbSe52n
         DGux7JEhni+XuYqDCDvU1TrSFjQSJNCdStUTAa/eaJeQ3D8huF1fMNn5sDHwHF6fwVQB
         42reZfCpfKMr8Dl2WjrWL8yExyOBoyv5hqHPbm5q9Ok3j6WlAEak35ttEx5p0z1fPbR8
         pLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783796225; x=1784401025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9tvHRB7bEupQJjf2HD4EouNWdI+ExQrix2Zn7FFOPs=;
        b=VqudUDHq5Yxcldkg7UqYmWxP6fjfz/GQgemfkX5rtyqUYHJVc57oskTVLTnUbjCZES
         9Mj6alxzEpAsIo41Fkk0pLfDkW+25KXfPRxKiDPCAxKhZ5Ehj1BWBHsdBEKJEwB6P4oV
         eswjvG5Kie40DTDixy4W7sf+i1gWPTVdj3b5eFSjcCTMzn8fPybabu3AJh+hC0uNuIDt
         D2hwku/DqQeT8qdKIX5GFH/o5PaKSX22VVF0fSAG+xsQ4CoxMjjoHlLtOApUG2FzwX5M
         P8dnq3VvicSeC0VkWR4SGaA3kicfkW3HaTwcxZw7KbcgDNW2M2QzuX2QTjmgwP/gcOm2
         itkA==
X-Forwarded-Encrypted: i=1; AHgh+RoRba5P4TSWt6WSCK4ErgfoH2vEAMykSnIkcyefqCJnnHcJ0rSds6tXxnKNVSu61PaLoaGzccvQ3RX+@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgJeqAZ4fVh9XJlhTFZXKDOuiplCCeFuyvWKzaRRu7m65WjtJ
	Y+QyOjM3JQXtzXpu8ilXsVqThwPKazRkiDDpnckAbC/KSnbqP12tznZt
X-Gm-Gg: AfdE7cmXVTm1D8cWt9lpEIYcKAKtrjIX3chgaqAYjesEy0Yt7RRDJFyyBLhIoohNBvZ
	+FAuqp1rKiI7D/3vm2ne3nWo518wgA6zfP9ZcOEGNABnM0ESpv3Vl8l2HCqz9Y1ZGL6RaO/maJh
	po8tHXxuxUouols1xPGlCEm+TGn82G5cShKQzKFlkeB+ITvv/SOs2s0IJz1cxFaRZrMJ4YAKmfC
	6xPzLgv3LUQUAulPEnMv4FWtx9KySUyDiaBtXfPu8Gfv/kAu/6ir7D3/DE7aNhjFOU8EhD2ItuE
	wcN6bIEutzv8jaaJZUW5EW1U8gdzKIIoLNw2wx8btK0h8aKOD9ND4C7bzQAch+6pNvmRtY8v2Ju
	nhmIVSxjJqw+zBhYQi8U4Tdo9bjwqlV52tWfDgprvciK5ay1w6jFbAR5U9WpxA0ucSPOmiNbgYa
	Qtd6EEye2UrtUmijyd/VCP3blmimWJbQ==
X-Received: by 2002:a05:6000:1a86:b0:46f:f12b:e44b with SMTP id ffacd0b85a97d-47f2dcd7193mr4247369f8f.31.1783796225154;
        Sat, 11 Jul 2026 11:57:05 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm66905647f8f.19.2026.07.11.11.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:57:04 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Sat, 11 Jul 2026 20:49:33 +0200
Message-ID: <20260711184934.55701-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711184934.55701-1-oleksiionchul@gmail.com>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
which is based on the Qualcomm SM7325 SoC.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6e..21b8af509 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1054,6 +1054,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
           - const: qcom,sm7325
 
       - items:
-- 
2.55.0

