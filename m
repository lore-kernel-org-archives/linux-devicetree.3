Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5481C3EE1DB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102308; cv=none; b=fp/Ofw60TG1olHRXLAN+GeDYDqD+wEJ6WhPDl5O7f39j+B+kLDkEJvIC3/E286UP7JuarfjVv+Ch+GZezheHGTeYW+X2VuaUFBwPeMmzcqRBhMHQg41tEk+femQ36QVvxv8IDuHuWg4k8dDS0I2GbAgr774Q+mVA92K4+f5YT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102308; c=relaxed/simple;
	bh=cVR6h3rkGrL9zNSGot5yOVYOujBEvnXGWmyJCWYxP7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUJSvzjTs16AbQ/8/Xnthz4WlF7VWlyi1uTAdbE4mOliHiHPVTLnG/9MvcLCoKafK5XfFjgk1/UtvJngMOFD65mnZlS9so9NSHI08XfXfyQ5bMqZXs6dCMI+tpcnxdzPhZbzOb22nBk4wkFkdNPFj/C8SILpCs2zlmFELsued/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKcWyuyC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKcWyuyC"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so1571956a12.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102304; x=1779707104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=VKcWyuyCtX19H0w6MIFAeGxoZjbXf2GzIS7I4qWQRF62g+qsZJvUPHWDTrDHBw2yZY
         krJ5nUQC0JA3NNFFLXZDzYjlIiT2HNSOB5/+kq8b+P2+T3UpKC/ZUJK3yw6ZI/SQl4rZ
         oq+S3gVMY4g0m4KrSSSdEkqiiPYUPUJGO64q/Ix+9JNmGNUqNX97WvRrrWGfVxpkfWP2
         ZN6F4UZ7OZoUTfQhVMjk95Qb2kPf9smYqvQVsqjv/IXwShsU9JB0KMs9HNRUawlGUtNI
         3H56zNR+03gUP9loIzHVTJRL7+GFCwUv1UyjyEh8d6Ekf7zGZtlUci03UwWu+CNg0UL6
         baMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102304; x=1779707104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=HNyF+M84b8evXxT7eUHOOuJt7JvbAsSY9HJOeNrO87Cqcxl+g48+iAJyBrMn1FPPKq
         gU8cZBKrfj+3ZQ26L4QcRM7cP3u/sI+yVjnm0TLdRgS+uOm+S8aK4IgsTdEgwwjtt34H
         pMlDbmLAwVaJMj9IWI2ggmu7vV0o6+dax3XvWNhCEkEBKvGEBiU6RJXyAuuQOTLWB100
         ut5D8o8SlfAPq767NAHYzAnq3BWVRlBYdkxet9/upBfQKtS4HaxxqgMO2F8qcbJThuPA
         IXl/gQUjptaYVqqBAVuQQNC5o2ERJ7SPEVK+M6JKf7ike9mSbylEB0bQ57VvReTFzlQA
         POAw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZyfaOkAbqjbMvfKsrjOAFkwO7DSI7AIj3F0VnRXJtTnAvPtU77GqLky34hTT5T7kcZItfsylanPWP@vger.kernel.org
X-Gm-Message-State: AOJu0YyXE199od16kmIdFXWv0TifoON1w96CIEKUFX5lpNnelGGrY+Me
	DgzDmoPdXowRNLrObGeNH3Ydjka03XduTlMG8sLWrFmngeo30k9it7rt
X-Gm-Gg: Acq92OHmwhWZSv+HzzulAcNTNZeJ4dTDsoINCp6rbnukTgOBRkoWktNT+pqitfnZXtc
	Wq/N8EXWAS4wqO+hSJSucDtjWxwv5vk875/wynNVv1vLkgz1eGeUbpFzCAtECy0bLlFPr72F1t+
	/GEaH+C/3HjlbtI2vF32o88bsu6Y7rK+tNoYl9E3rQvhS3FEtEmUyymJ7/5P9NauaBPWNn/Iin+
	MQipmflAVIrdh7pVMVhy51Y+gMHelGswO9F7a1AKko+Ghx8eHHuoqGT9WzntDU4hk2x/6E5cun9
	cCqbrrh42HbSg6o8epjzrklqjlnoPgh1/drPTg9DTofgG6eFhU44YffHAA69ZRR5AwFiszRvlKN
	ZcheV5scYEEzaA9PtRcy6jldmEoyIv5tI6SbRBiVSUWiovGY4wzBBNwMMWhWYcnc2bhmuMyPPw0
	SsWKERs8Ef54bOs3WARhflqw5czsIy3jOYq/J2Yg3GxvpmL01yAxaXOGDo2w==
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr14862573a91.17.1779102303755;
        Mon, 18 May 2026 04:05:03 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.04.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:05:03 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Mon, 18 May 2026 16:34:33 +0530
Message-ID: <20260518110435.16262-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)

