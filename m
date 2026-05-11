Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6523EA89
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510515; cv=none; b=T5/jz2eOHF/lPVPcU+5PGAJi6CBMTrOCePtKWU9sw1zrSzlCxhD+NXG9PLnB8QaBbs45asO3mgLb6fmLw4rI3eVkBUFkgUuxbdOKsKyEiNUWc6SwOTS7nQMzMEtnOom2p1Ppitb3I03TudAUjBo3OL955WGH2uUoveFRKVOnaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510515; c=relaxed/simple;
	bh=Uj71YxMd7CP0/+rQajvUXPXNAzpKdvAdtZ6sztvIkfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niSvi3Te3qZbUyQ8cIrQf28KNyAHivgSKFbHM0IdubNzxGUvCw39z4W40lqu7AfXw967LoIYKfH11pik8sinp4RQAcpGLvRF2x/CnVraeYcRjfTKU+RE3kfeiAP5oeDqEGmZWhsUUyXyQu14okWX4RWOEjXjWHGpj4yvMUj3mAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiFbVF/d; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiFbVF/d"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1986768a12.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510513; x=1779115313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=WiFbVF/dLAo/F/CbBG3os0SHYlswQVJNCbl2BaLKx2lkscvK2j5gJlHuUQqAVWBx3z
         vXwGGARMR0X2oqfRY8uEnmFHY8mmEQjJKg9C5UQnLXTRV6T0+E12kc5vB5GUE5goxHUz
         nXF26ydrOa1jKXN6BqotyvbrKODd3/kK2FO/9Swb74QZl40dcg91Rl6ODfjM23j8YIBc
         Pp6fRVHVCtp4W/Q09UB5WCucvVKCq8NeXv0IfJRcdoleXL/LeVnzsRTV8u7ndQoosWj9
         LI90AQ+hT46Ao9MOp6JjcGtYK8Kezjk1JGpA9+TybArwbKcFo7oLodyW2hLbnacdh2Aq
         vcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510513; x=1779115313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=l+M+z/U3Sbq/4gnLg/Q0jRDMvF5u+k7nZMPWcf9sTF4TBTfiUhCSwOThwIAbtUet5P
         v4CkVvOTTqOb/ahVyuiwsvEqEcINKfo20SlV0rayJ6M8dtcQ4vqcbMjNvy/PjXDfChTB
         Tc+SvNpI7xgK8V3gdgpV/M81qHMTaRCPET6U1XmoJ0hS2JXo0rcKLYKZIv/ATS4zg/UJ
         A0kHykk0ItcaMmt0Hro9iiZqyYYYsSzraPyjIMh+HvPJAqhzzs3QqUdpt8rZvRLEmGXa
         dHWBi280xrX1/zRmUR3ggwohCfvogDCpk0jZ2qLFI5FW5zpFSXlm5Jmz3fBSLeJZ2Xpj
         xd2w==
X-Forwarded-Encrypted: i=1; AFNElJ/XKqYUxzQrh3wKEifieg+jtTmD+a0AFsD5viOerIeIbmg5km4d4i1V8kvW7vWMq1+byiWWJ41GenGS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3mONyl8ZOQCDNRTXEIKZuWHdOQIwOXAU9zBc3jswNsR+RP8Z
	1YhfDBfvb83PS/btUGTTHEQPnr+sDVkD4UuilH1/dSiu1ldrIzQMjKut
X-Gm-Gg: Acq92OEkEfFVQr1nq4nqVp+1qChztRkyJO9nwqaqHD+3Gh0c14UZO7J7NYQYo8j36cv
	ZRIAEIAvlVOKtAqjgWEe4sIfpU9VNjVEn5THsB/omUZhTqa3XAPTnI17R/WiWzIbs8v1QyzpsKg
	u1yu8A38m079iiEfYMQs0XlzClUgv0UWubuNHM6VB/FmYDRVSzRksNpb/hzBVD0f0JB/x1HLzeT
	A9amBz6Mm8fPtzXIL0lIdfUIfm6j4XZ0kixSUA5hTBsqeXagoZcZP99E+CuBqn4yA8bxpSCa3Wo
	KHNJmF8WhindqYl81nFR0BRR0zIO2ZtzR/Ya6guIjANOyh/XrsKuss3+Fbbpnj+b6zjaoh5URqC
	KglZ0koyVdCg2q6wyRvj04xi9zCrwgUM0WuMpfHNe3BmmtvaAHE78TtZxV9M1MFKjdMPR8Wd3kb
	5G9ErXYj4twx6316b98yWZy7EcP4OBwWU4kwUU5bG3f4bRPuSUSD9PV21EIFuHFPRWXmeuBXFnH
	EJIf10pSWzL/A==
X-Received: by 2002:a05:6a20:3d1d:b0:3a8:1364:2d28 with SMTP id adf61e73a8af0-3aa5a709ee6mr27247296637.16.1778510513082;
        Mon, 11 May 2026 07:41:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/8] dt-bindings: crypto: Add x1e80100 inline crypto
Date: Tue, 12 May 2026 00:40:51 +1000
Message-ID: <7630457220c3e10eaedaea6d53e1c9c9adf43739.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibility string for the x1e80100/x1p42100
inline crypto engine.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..a338c4a33e98 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
-- 
2.53.0

