Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3324113D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928787; cv=none; b=I22uEos9/eTmacu1qpsjXGPRx6DnL1fREe4MWvuNeRj20KDHrMHTCclSMyizbxnbhnO1qqU0LRfaOc/YFi1GCvVJ0V4VTJ7NbZHtsWjbzZdRr09PnSz4rJq5FOsxgZ00VF7/2WQiF/ZZmNbr9pXP32huHfXWWIp9ERsq82Uspb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928787; c=relaxed/simple;
	bh=uZJrbkg7J99fCT2/aSoWztc3tcIfDWx56O7WqR7T4H8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gL9L9E2JndjMd+CWBIAzqeoRXEexp/JIM+YJ4x0M5kxoD5oS+xQjOMsJkiJtNPdvUyHHRxrMFwhW5UnGM4OOlk1bV61uzC7Qgf74QJ5hdenXHvZqeexEmMgGDj4IqI0n0TWpjsvtWno+EiPS6uB8X1BdFR5NFhB1bIhbdxK+2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkZqTAo/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkZqTAo/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so37576605ad.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928785; x=1784533585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glibjITTE+gwoAFMIgjUwWiYRTlSKwkyNuujoaJcwA8=;
        b=RkZqTAo/nQd/fIRr5c/d8dnOoHVHtJ+1socqMzBx5PkuR4Nx0p3Q62Oww6G18iMPcL
         EHgZ3b9fxF+hdg/xH2W+NP8qFV/nXoMsc5VOl03kOkw2CBlOCq6E+CaRun6ZO7u4Oisp
         KYMWZgWJZhf1Eo3F1GG4NEqK4ROjnY4I1xVsnychHVTlh0gBpBNYc84OZ585h1B4xNPT
         VzhsQiRJ12mv4sU6qdXzFI1+TfntJRIVYwnhuAdFyngOQuYmwDZCTsBbINLh4ocK26D9
         v26Bv6iMh7CyjYrHe4VnpejVpGKGRV7N89blXpxdcnxRedDzmSRSK6FYzxjhqmheKFRK
         zF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928785; x=1784533585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glibjITTE+gwoAFMIgjUwWiYRTlSKwkyNuujoaJcwA8=;
        b=Do0IVJvUpu8KK6DYtAmgyMKJChCztxs05D5MWNQSyE6izyUdfM8s3aaJ4dVy2EOHc2
         wPcM74f2QNuiDGM8aRuMJa3o0IPEpoq3ltg4Bl4ucW6kKzUSMu/zkh+iu0un0QPvIn1l
         CfXrWXRVyiT8RGTTcoUPmAF+OAM/2hJxN6J/hHunYu6lUtiJU72P0OIcvTenF/rQ7Esf
         G78OCtJMWLOUIl5SQ6IgRxSltCkyYues+l2Z4sxnyVSPDGghKP5QZRcYlvqm5GdPGlAF
         3Z1zraVitT1OTYg4hL0t/stPydjO7PMPXlT9e5XzOYPOuuwL04QgHJZTB0uDbYrSdHOD
         c0lg==
X-Forwarded-Encrypted: i=1; AHgh+RoL/whkK7H+2orSD43CNDsjf/wtI2R2HbAT125sy2v40+tTlto2TaLjprmnB/90HRgHaAhuxTQBD8MZ@vger.kernel.org
X-Gm-Message-State: AOJu0YygzX4DSu/EyvUUP8x5OSbITXVOs+SA5bUY+P/PPbeb/Xi68lnz
	ThG2FZkzXI5JwgRuUKu5sgb+HuXoNq2MUItOMw6k0GE5h2o5/KJBl9T+
X-Gm-Gg: AfdE7cnnq/nP4kdes8lOAMvbdvWSaMp9vNn8LC+y517bWB1XzKAO79br2iy1+f7OCah
	wcxtOV0inoemC7GBQPyNtufaeoDbQ5FiIZ8jA1JSylahtDlK7/zGsLg8Qgicju5WAmsiEvV1hum
	9ZUeNn4l8Vv2pQIjW95ho8H1lQyECJvwT3cElNeIPzzEv0w9EkeVFjyhEPP/MUx7UajDaNpD9Mq
	9WVvoKGyIBegEIiGEUmRxeB88DhcSiCsodjRQXnsD4joKEagAlO8YouqfNYnbSna/R8r+NsqqJG
	Hi4mGOMTCAg7F5uzhisB3pcOg0gIk/+A7FtjR3hPdm2MkBv2Wdnuaf0+e21hKRRTH0qqRt/F57x
	N6gSNCbS/vvoDrpOtNlcWPb5nHFDY+sLjRmUMa22Yk68T1z7GR8GCwadKIz2a8s2M/ZWJ3ROJlt
	wjaN1EKS3ZkkQNWMcfkdMUvQ==
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr75173525ad.27.1783928785568;
        Mon, 13 Jul 2026 00:46:25 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:25 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Mon, 13 Jul 2026 15:45:56 +0800
Message-Id: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..6793125d6cc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -692,6 +692,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1

