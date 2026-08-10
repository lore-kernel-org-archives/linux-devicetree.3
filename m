Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BF4314AE
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380974; cv=none; b=kVFxxmD3BxP8TvjszIXzEWW5MtMVtPyj1VrOyHtAeGfiv/yvuihUc1uB3vYNphxAd7ldslbHOTND8G4N+mrU9Khucl1JpAR86Ks4HwRlhj0zWv/+alLylakC9rsp+Q5a/ZItNXYUJMQWCo90EH/W9IFvByrAyMtLV6PiSo630Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380974; c=relaxed/simple;
	bh=1SYlMirSvskMxjieAuqurmagvIfN1UzuJsj9AZoY2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnifktF6UQq2qkRCWwSZiDTpFliINmEWLrtKGqGj65Ie/hRwfFzgX8pb2018OMg5utfObHcbRbmLTIa7fKrH/7KxvEasiJNnqcYM/GA99bx5q1hhDiyeD087BsxT4gvVvAYmFhuINWAsEn3D1sXGP/3+7FVYFC0N6goWKGe8cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAhrPJon; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAhrPJon"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso32971105e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380971; x=1786985771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oiq43xN/9r6N67wuOQuSc1w14BdYaHpgY6CuLp6gzE=;
        b=AAhrPJonA7OVSdn0eK3UyMAR0ckYyc+zpEnXuBx2l8/JqHgUrFbmH9cMqCok7/kd8h
         KFNj7n9Vi6cMoga2HmJDx7H3tOt+8VEn5pVEv8lLqzl+E0Cn1ovvAeuKCGrPrPTgcDgk
         VAeMjkhaHLzZ1b6a+sIK2486nkc/z4QlKcrx4XJI6zx4jn+BxkY9uyh5b4Y+Qsj1aYCs
         HVizKuViAEt80c4LFAPRktuFRi/xvI/5xZDxzISChzErFpvvezlMkxyy16SXOz7N3PZb
         B/ZW2R3/ISq2+3HuBIY/VKBnUIZYUFpSVyBLcu08UjQiFOA3Oie82FIXl0/MhOajG0ON
         Cg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380971; x=1786985771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oiq43xN/9r6N67wuOQuSc1w14BdYaHpgY6CuLp6gzE=;
        b=ZplCSIC+2lsmw4jt+PraPAAQItcg2GBl51eTT41bZKregroG0bSFBNihOM5UDt5pDx
         J+vzxFCoURz0oJMf7wIQ04f5By2zwSNXcRZNzjtalK+m+bsO1FqmplZmgbj91aCHKPLP
         IK4ZuMbdXTbb2oxMFiEnP3njnvwRAdiKTdTYr5NER55ZKyZPdSkSZn+FCAevk/+CaDKq
         /OdYJZjQ2nUabxiWWGb5V5WOTDBoM81sdT3pR5A07HxfeBsVKpQc0+MXNEdCNJ+uQJb9
         HjrA/MrnURq3ioD23xwJ/JnYPwRxoDO7n7Hix9UqRdh3ugE4fNOlj0TdfXCeiZBJ5eJq
         UBuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZiKXM44bVpOpC5vf3aKRC2iWxTMHyr61meA+jbhXf4dO0OACMYthDksaBiP4KU6+IykdpjC4/i2ko@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsRyDyC0lkR3KpUEnUea/LjMSM2a8YgAHhxOguH5kqh22P7Wm
	EvM5Nf+V2c1dzmAfXXbj9qe8Tkt013Qr4b5gXDUuSrW2urBaKbUgFFhU
X-Gm-Gg: AR+sD10rl210xBVWzxppJW1NeT3zDLbNcG17Ceq8u9MespxIUnS9FpZVy0kDrMvJC/N
	b8mrEdXxowxIvbZFIRX8XZdwJ1hW5UmyH2Aim4hxjkiBoywZzUr7pzgWQS4IglvjIA1I4r4YF0Y
	dJokNSFl+C3/OpkIQ4MiswBxBVdKF9hEfaBow11XffHwnLVk5wPXFmj3TNyydeknTOr8CXYIjRB
	sKcVxkIPRi2Jb2AS2Z/0uQco16CX0drL77AjLbUo/g8kqee0vzag+2hXphidrW++ysGKh4s0HIL
	F3KVXnjYOZfMjwIgHuCJdyGb5kRJIqk0cl1QBcu7kllROH5Tw3XwawPqLnU1MdtMeewMiJ9Vz2Z
	8ZiHvp5+R4YuPp/6ZVwVr1/Y+Gq9qDcLQ20UOiQRSkXBAuwvePmVsxm9xdeXRlgz5KzuSJVmyg2
	HcR1ASMb56ujvF4BFjAMdp1wejzKFSas08KquN6cTqG59VqT/C0uzmEqQDf9WPzB3nld2AZ1xhM
	5LKPEyUuDWQu/gQQdwebKGG
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr415589885e9.3.1786380971109;
        Mon, 10 Aug 2026 09:56:11 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:10 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:39 +0200
Subject: [PATCH 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-6-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
In-Reply-To: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

