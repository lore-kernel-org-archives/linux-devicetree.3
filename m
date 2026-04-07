Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373173A1E8C
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549878; cv=none; b=lMR2ZSZapD8QQKenz7qys0me0XmawN6qLoNjLoNx67f4nFNJak4QLFWjkL0tDDpb3LXNKy6QuhzuEsVwTFGvKEi3+zczmUcqCLLQb2OiCiszjltYTL/16ZCkWCqy0DMi+pdh83W6VrKp6e7Q9Lk5nOn9dqoYO7ItN4hIUUTMGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549878; c=relaxed/simple;
	bh=IPy+g8NnyuzxZwBLandNYCiGTrxmuX8xcum8AGEVp2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5I5VPuVr769F5Z5k6NCTy4sdP4NTRIFTYTTGzZ9yTQw6RyhU/Ka0ciq/54k1gM4FyT0IwRcnvddobj2X4tu3c8xxwuKgmBhHe8vBClkV/POakp2K0kRAiJYnyLKE0D7q67OsmYRPZe7XwyUgoiHzFD6Whdlym1nFIyd5rz1WmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyPNjxUd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyPNjxUd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso2726677a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549877; x=1776154677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=AyPNjxUdWnPtIep2e64fEx31/IaP/P+n+rAZ1VQDfwrNA/+cBVhpTFoCAVyK0p+Fr7
         4we1UYlS3l7KKR2uHi2KlOYEm5KEcNvXNg6qhaR10AN3dOWFbyPmau2C9iuB08Iz7Gk7
         bcfH6ULfpNCLkBzFJUEQhcp9eguoPpDOdEwn3RbGzHXjzi3OiFu6bGh0XbAWaSih/MKw
         Llpt4Zp/tcODLX1Af8cwyYYSU0WqLdvc5pva76NLSZSq/fh4LbZLYsMRlfMAbRMxvopM
         Bpn+O+bSrjgRui1yPPIg1+ygCQ9c2LTy/q25FROa0fCJNREW8crfQTWqN9yyChLQAaLg
         gUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549877; x=1776154677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=iR8VUeK1fgE2j+f6XeE1wYH30LBbHVyYC4FO24yNL0nWQQ9lFDVJiLEu9/x7dG2/rG
         GtsV0zo8XIooeEcEf8JQOu8rnKIAJ35x1UBZ/oe6FpDn1AkvMqAzAVpyqiOBn8bR4yfy
         dXKcfifn8pJUNVhiCwa/A6cfa8aIBRatOewJF4wJR88Rn31l+R5beTQKNyd/bexB/2hf
         1NYkz4MHavWZIEXzi2b3mfneWhkZs8i7zDjbfAbBZWIGgrlVrUlaIEP4DMXQmEggRYvc
         wFZFoCKZpbyOZ5yaJAaUsz3c/4T4X7fEu42Hrbh0a0Kh5GoIIGtGqNzwDbi4SMH1Jo5R
         5FpA==
X-Forwarded-Encrypted: i=1; AJvYcCVu2tnJ8bpXhp30M5a3WQXhJuD2fqICnYERDfbqbBIHDqTWBIY5TlO0XeqcIYB0CF8pdXDyuJbJYZwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ukLL2jAGYodSUeBlaYT86RxUvi095LsWQvLsbjnOYVrVJPW0
	vZY5H2Es9IrX31kkoAZLL3e+SjGzzyIWxnAb/8cTfYBqk4PeRrBNOnz7
X-Gm-Gg: AeBDietnIYLlhcj7as91U3QuYsgW9ZxWNQ7NFynvXM46pvbWN0S8c0J3a6uRmkG3ciK
	dvzXTlcCaj0Zx1dBUnB3zAxqsYCKcBRTrOypjWdDcC3Di8aMalamvFmTKWCD0LtyMzYXZugutfP
	CczgTFFWikiNbkaBTAu0HvUFSXyq5RQmFZO+iTmJWQ4MbXYesFOUumg79cl1vJXYWf2qx1NgeBK
	6s6eOJXAtRZW+ygjyWFQsPmHX4XgC68EPET+ym6oohjWY9LMIVOb/40TgT1GYkDuovYwlKt8/37
	PSNbKx/60O0WxtUJEK0w8tEhy5SozJRejBzxID0daUQt1ixk0okYiVSTcMOQAZLzhOjHOFYSkp6
	geJ3HdhMVEDIu8OVL8AMkwehXgRs5VAauNSS4Qi4VdeRtAqWF0OpZQwXvyhA+AAYIdveeLaqyZt
	NEOiR90cSeBmfEcWTKIkMjVR8JD0bRLm08xPrjpZv5WHoJD/wqT2SxDshcSutOPx+xQ1mXCvXmI
	cq0Ace34Flv
X-Received: by 2002:a17:90b:4b92:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35de678f2c8mr14931420a91.2.1775549876544;
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4592889a91.12.2026.04.07.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v13 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue,  7 Apr 2026 16:16:59 +0800
Message-ID: <20260407081700.2658011-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..afabfe22c8f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.43.0

