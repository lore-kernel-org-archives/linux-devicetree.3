Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDE53E122E
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244812; cv=none; b=DDUzul0Ul5m5bCDO3yjtEMfEkRJPrbQ70WCo4FEMk4jpuMaA5kqE5Xj1+YYylOclrG4URKETwxw7XSIK5mEbmm5I01xZ+PlYOYRMSLOsVilyqlX1H466vmgMpB2y2LDSQ7toWCX3PtyE+jL25qOBGkLhgLQszQZVAb/qprQmUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244812; c=relaxed/simple;
	bh=mBgePVtH8KP/YKm5cr3Eyl6uZOeX81yQ6wflLgUtcGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCyy6PLuvdr+Qitf3jDomB83mJcnfdizmeGm98dMSvdh3SIBeJGLQl+3qErt9i4tjZBQ20QKQQTHjCI/43RHooJWibA1fV2TznKF+3bvKf3r2LQQxird1mUN5MsG0hUjVCUc0ePtGcOzdbIi8wxn3z/jZeWneF8PWJPIxPPJZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mbwRNt+Y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mbwRNt+Y"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2394058a12.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244808; x=1778849608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tjmcAcW5PrkABseVYIXfoZIwvpSsM/t14LO/QfHcsY=;
        b=mbwRNt+YM2cROsdr40YPiyuI9t+Z2lPvmqRVQptuo7vVCVGxwP2gZpWK9kLw9KpwXn
         SRNeaPbVh88tP6MP7LnrVADSDW3RsQRCcERwk9xODzWi+sxuRQ96PsBNyJVfqsNhHAol
         wmqT67drVkF2XEBMLRijIQp3m05B3wsiRiMwAtfF2At84jLCwivZOekGBBlm7KERcv0v
         QL/3sA+7Vck6fget1FNpBasQa3K/bEOM5xZ0BlJA28QohZhOfZctQnNiu9HpbMiK3sec
         H56/XsGCeCHOpeGZT3uZyFokjNSwjGKTGbIrmmd/hEjYG3BCwJBB2/800a9hJbLKLtJG
         ssbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244808; x=1778849608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tjmcAcW5PrkABseVYIXfoZIwvpSsM/t14LO/QfHcsY=;
        b=eF44vgYwFNKlsW08Z5aUqtn5ceYO1hHk3w8EZ1lGYR93pLV/1+zRyYiz3kfaeHqcW9
         9lCCpFgU0YkBH3rfMI25weQl0OKJUpJPaHx71ywQxZdo3Walcggi6zh7R2uuNawdEFcH
         +NrKqrUvMiGwivbyI6bkHN0hNovUsFz8Ksmui32SpfKLM4inMKj3UnmqvolnVE3mYU0I
         W93QWYrj812WQcuY4ivfi8ijsTHytObpaMAFsaXoTBFBfV/epSlFSTO9aDvH8/giX9J5
         XxFpvn2Sh8NEeKt78jP86/MZmOF+szZrArWhyulQIOiB6/LpdOmWYmgY1XPdCx1lXTn1
         o/dA==
X-Forwarded-Encrypted: i=1; AFNElJ+S0KQQG6P51HGm5F4RKTIGppWSS6UfmYFEq/E492WTNIg11vJiJ5MZvy0tlUgMB4TR793YGrcdoJo1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6stVtqAX1eSfZCUtneQ9VvMezZswL+rDPvpvEUq+uBG5jjhp
	OtaVK7xFT9sTMtujDvHWEh9XzcXK4RK4TT5vQnBZ9xQhWTLkkJ2ztLZQwpa6eDTNnkY=
X-Gm-Gg: AeBDieukrVAm0/ZsCJIhftIEjIsl/Uw7uFDlN+dRm5Zt3ixvyYwYSUaGmQorQC/fcPP
	CYGJ0738XL1JEwQWEdrizbpkGYZQJhJNOGb0vFSqB0AvWmiYACr3Q65C5Xgp51K5+2/QMFJHUcG
	Pdw/IgcgXu4PM92r3KkYVT4gARBobgUS4mY2QTAN5gC+vQTIPSIHAoooXjzA6QfHa+YfLtek7wm
	wOt7Vc2xtnsfIB8mddEPTt+Thp3PVrb408zbnK76M+QvM1/U0H1X3l9kBE5D3V8Yi/T9NOF7mUo
	X7ctvcVLjSYyrzv9R5C87pHX2PvuqnUrB+HUwVYfjChh9XWkFcmyHVzsdRuxJhzsF46Jz6b2I5I
	3ZD/Te5ZS9Lqset2CgWn5PHRN9QMu7HPkEWAsYrlV4Mxs/OB0p0WCksF5InsWLRaB+0+UvxYEXv
	E1p+vrnIK121mHSrbas03tG8zHHdwjNOHhPKg5ZGB0EyXKoPBltMvobW2NcYCrIaSYYprEcFFgK
	T3wj8Jung==
X-Received: by 2002:a17:907:1b0e:b0:bc5:113c:1b55 with SMTP id a640c23a62f3a-bc56af25895mr720284866b.8.1778244806334;
        Fri, 08 May 2026 05:53:26 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:14 +0200
Subject: [PATCH RFC 2/4] dt-bindings: input: gpio-keys: Add vdd-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-2-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=957;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mBgePVtH8KP/YKm5cr3Eyl6uZOeX81yQ6wflLgUtcGM=;
 b=WddPCLUCCtWRzxnRp+iKtWZQgqxMpRDewJw5kUnR+eMEezJiWtPHBRZUNrMrmNDpdneL2eVIb
 j7idWog00kqBtVZd1Kg4LjLn4llJmw/T24cMRtVmL5m+JHAwt4miMGq
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Allow the use of vdd-supply regulators for gpio-keys. For example, the
Fairphone Gen. 6 Hall effect sensor requires this functionality.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index cc78c2152921308fe0cad3e29ca78a5fad08f066..9c5ec1e7d0fc7ea236c161c7bd5a041aafdd07a1 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -102,6 +102,10 @@ patternProperties:
           which can be disabled to suppress events from the button.
         type: boolean
 
+      vdd-supply:
+        description:
+          Regulator that provides a VDD power supply.
+
     required:
       - linux,code
 

-- 
2.43.0

