Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458403BFAE7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315239; cv=none; b=G5V0f6W7K/lhGAasNUpbjUHtVOtlnCO0y6JvUSHv6GRFzqZjP3QFNw2MaeF6BDuqsqW6bKdBkv62qiLYHUb7mDF07Z/mU4kyh5uNraEcKfvH37g9KspngPfFw4wbuJuc0xdRPlq/V81I4cQuDcGWRNTV8TqY8mIUyIwN91Wbx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315239; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+mZtPZhuEcbOGN21+7ZqxKFKdSDtlaNvNMRozdkwh9JvdmaxuFsiDKI3aN6bizw68OIzuccQ51WNthwJRNiXn4ukuLYZ4c5GeJJsmcF7czr/ehmFNiZdiPMgF6YuRB9TvBh/Woxq0y5949Mh32Pxqm9xLke97CMW6azHg40ngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH/9Tvh3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH/9Tvh3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so151976966b.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315233; x=1787920033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=XH/9Tvh3RWq8sKp5i+CXjg9SrCLI94lPXmaccvma2tqxjlMegRtSo3m/C96kzQ2SPZ
         V3Qs6EsR6zbj4v1OfNq0ZaUB3KFKjITxYzqX5z3KrZeuSh9lEmy0lnVRYGpm1JSvcyWV
         G2qmLWVRHCJDsID7iRbgAMMdZ55kgyjvy6XkhHSNxCwQEemw6PusaJr4gj6XUlmg9Jh0
         Aek1N/0A3itkQt1TOvMihV/x+ZqgLzA7IGCh3/BlvtNNW5wfhT7cwdaKhg9luHIqveJT
         LoCxeehDUiaYOYaTvxNiaiHSbqfDslFDDdajRjV8NInZpRluGiB58Rg53YXTENr/ItBa
         Eb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315233; x=1787920033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=ZO2NzkmMi7rc1P0iKvQVG9X5PWe/MysOFtZ+cm4Lubf21flORZBmeOzsLRv2lIz8J1
         8aRJw3b3PgBjyXgEK03paa5tsAQuEi/Z2GkoPRYpcSNmR7dX6/tgrxqMrJylZQqbzn9G
         djLzL9d4o8Bd+EOR+MMgqYQq8z3POaIiv+PmLZ3w56j++qpi9PihbAo61jXOvlPie00C
         31BYGBaW140dE5s237olei2Fii1ThV5N+8zx9CnoqF+tuviA2G5m50riSjCmOZhLO0XX
         NBe1Pa/8sBzeoTc/W0crrXP9L+jkyo2KSbEEbkB4phJd0tpQtpsyKcm7UA3mtevKdO0r
         iFww==
X-Forwarded-Encrypted: i=1; AHgh+RpSvks59fCWHIGwTr1o6RgdW2I2EZgUaKWG6+GZemfgAo3faT02+RWU6lsr2onC8mIcDpHgaC4SRocd@vger.kernel.org
X-Gm-Message-State: AFuF++mSjOwxwnrYC9o7x4UT+I+xVaiEGZDj5L1PecsS5BOx5YO2vrl4
	wN3QNyQfWeAyaSPYDcokVY6vW6EV7GS/pdOBkULPOjOajfkS9/DMe228
X-Gm-Gg: AR+sD13P1diQj+pBRPkCIuj6ISrUkPSxSJ2yYNwYqQn+HXaAMAlqkofeXneVSrsvajf
	zcete29tVvODAab1D48gRV76pCmQf2T+ViTkV0gHnGGW0I/EvnYwpreZYddt3+3emr9OqYD25Rh
	/t/iToETBXhsg0umaMWY0l+5MwzqxqkZhAGL9eRJHe76RVOVmsxHi1xwy21CORCH2EwllPiUhHe
	faSQbuJaKEiRXXXU8N5qDXGnFu5rCnxqig8PzqmYg4evjiucUqvvMuDp3rJ510eyblw0EeJa9A6
	3yzyL0xipDk/CXTeTXiT4PGQy6nswK938U56QY/q6LM0e51HEaid6bE1QClkq9kkTPuRTiazWvy
	DlvVbAYcE/pigHGSrgYkhgeH/Kp2CiQlYwNURlT556r5hM/i0/VK2oBgebuXdfTvggOsYxQx+gD
	asOrxsN+bmtgQCV5GI/T97K27UBQ7ekihQe5dD3It+CIsONb9DU1hKga3187sEF6Ms3PqsHKyZp
	fnT7BVXUkRITIe/tvBmbY3hubg=
X-Received: by 2002:a17:907:8dcf:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c246a3080c5mr730710566b.2.1787315232715;
        Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:03 +0200
Subject: [PATCH v5 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-4-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

