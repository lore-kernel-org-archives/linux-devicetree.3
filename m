Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341E3E1D15
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501752; cv=none; b=eFA2rRPX/GGNtiZIFeKG01yHLWlxYDHwmht6hAL4KD2F2voxz3E1LZkOnlI17TKmy0uANZWLCIwHGxA8IoDmyTfSe0+B6o6P5iWcxIWDJoNorBuK2ZqJW9cNw4rOk0eSBsS3odgQtFVJTiNPZJ0CH8X0edCtKEWHjw7gWKYNUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501752; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4SoGgNm6zfilURJvOBaSYrr1EW4LlLQT4LtyQ4rCX2r1rUutvy9NeEQ5TRG0i41FLpBG9P6AeDp5xoJcNyP8hrrx9SY1SqshDwM9u96mz7UxT48Gp+sr6TtG+xGsQh1WFqZgIU64FOEZq13n5exglPzf+F1pSubOpCArDzAV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o95pM6xt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o95pM6xt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2300679f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501750; x=1781106550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=o95pM6xtY6vPEo24o9E6GJmBYR3iaf1uIW1wbwi8XilBsQbtrrvFDNB46JoVzydlo6
         b7vdSzUbR/IiE7xQwAzpIsGjP0nRtlMz9SgY/T1aGsR+FD71QxoBCvNKmKCu+qkUctep
         1oSeHwX6HAeQ6/yVhn8RC5HjgMuffPuJ7kUS0fBZwvaQJirIv1PMpOZWIfL/IHFKn5qy
         Cd3cVHI7wTalWdlnCXudseuxREY1UGfRnAaEzODNdDO1OMCiszqCV13HdazApuyqtlFs
         d2ctreF0SmJxT8cQQ1J2pNphk3m5uS0/fu6Xn6ZTTePfepVq15i5X0i6NoNkQOk5OeDX
         zHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501750; x=1781106550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=lbiNulVdlqDODG+i5HH/vp2cg70xuns3prFEB8RuP01ofbkxLJzZ1EuOl+VbHMA2PA
         KcrsDJqIw+EmovGqSIL1yNVk6toJasEr6xHL2gxgu+BM3PikdVqFrLk8BRPBFCKKGQ/Z
         47/xPftZnCv1lVvx20R30w+NQy9yLTUel4coUwj4j0s51HpY/4yDrA/SvHyprDmNrcf1
         evm7z9Zrr3g2QdvogHywkCrlzMTgQRMUEJSxAFTcaf/IZqS6fXob4WFjGGh1ONXHiCSn
         8oDbzunD2r8T5O4A18T0rdR8/6I+h1eUDNOGXQaTj/W2fUf5buGONnz/pMlqGEev1sKr
         vfnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VWZceb9Yw3alit+IFn1bMTFo92NpNRTtRgBj9m0C7xiZykzYjlYiuz+J3d9XfPlHaY6QTHivapcMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1TUCjYbMaoaOFyuI5mCAhH1j+Vcf71BnTwgGTwKC3KLJGJwT
	KPU+eiwLs0wLvPAUbXxVE2Xa9LSgZFEjJ0jh1dba33mnfpxwCPE1ZVkH
X-Gm-Gg: Acq92OETuZM2nS/1w+/xH2Nuqro5bFzJVkZRz63doie+LEYUSz2G3KXNlAoTv12bKjU
	F6BbtblkA8DuCq+/48z3G11SLCoNRG5atJW4blikh3nEuLZOkVMH0MTw3sJ15smhDvNbWL3sC5g
	A5Eqj8dB24DU6f+j7eaFPROOZ+Mj20yQkrIidQWLVanqtB6ejKMIwvQtI1Ez9IDOQWfy/c75UfJ
	QLQsrIrrfMHtJs5aU3hOGSyk5bhy699SQ119Zu38SR3erT6wd+up5AJRa5lYZyIs4Iwwk3MZAHX
	YkhwUZkGzjvsDDiAWY4dPBLSwbyLlr6REplRNJ4SV5BrAunz37L4GzyNydvqFcj8t8t9gSxvKPd
	NjIYX3pYY9kF5RkhWijof94blwRUh7lJdgKxmQR/mPoXPG6r+98zAon2Pn7D/aAOr1c1+l3kFKv
	R0PgekJCgn9DxLhI1hDcGKzpGLsSfcs1Q6FJHQHg==
X-Received: by 2002:a05:600c:528b:b0:490:b297:89b with SMTP id 5b1f17b1804b1-490b5ed6482mr79101105e9.21.1780501749614;
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 03 Jun 2026 18:48:21 +0300
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-yukon-eagle-v2-1-f86b440583f5@gmail.com>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
In-Reply-To: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

