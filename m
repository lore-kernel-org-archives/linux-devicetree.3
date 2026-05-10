Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9D30F938
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444213; cv=none; b=ZLOm68fAJXrtu0xHHFkPEc0+7ntbjNqa63RcigTCDnskjSjjJIzNuWsCIo0nazqh07HvUI91oXcWzTYQYJcf0wOCWKYWTP7a0Wbz355tbiOk+9m8s/GMQBkt97JgFav7DPk4gkmODbbmxY7s1aSonzNxR0B+D8JGI3rM+Qqf8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444213; c=relaxed/simple;
	bh=hqQ8ah5uFEWJ7YrNd8GjM0Dh1+dBzkUDyqXlw3sqBJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0dewO/HAJMqpNjkPZLQZXk0MdHd0A4kv1V3iD06w6iNqgi8ZP4b3zguBQIrLzjlNH5LO9bYOSnnyX+DzAByKOA+qXQmIH2G0xkqnfVkjGgDR4VWQu+ML7zhTCUYgb8C2AgmTWLKuazwm+qbd4QbVLibfcCkTcGDlIm9hMmotZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0Fb9XJa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0Fb9XJa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so31726035e9.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444211; x=1779049011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=n0Fb9XJag3m0PLMa+zaul9pFUrsYl6X1Gg8zTkHA3rdVIC6HgtJFk0C6Suevh88E4p
         3Q2pcbNmototCXPAGD4N2P3yX5TI/mkqh78uI5udPJK+wf00e+vbtFVyjbzWCc9q7v1A
         1tOWqZQ0L/ojidP5yEeFY5t8Ia4wkr3aEctFvrBwo2GqEd7PFOkwuLseiIT8b5tHrwYK
         oScVX2VuJ3RmMDaMJLeAflFDZWJuD9PfN1K8DIibkptk0QXFK7phmVUmHJpCiOjBKxWj
         MvTbkVD7fwmxA+wm9zQYOVXQ1e0x8sQlINazje6+4HMdeWOssckWyaLHpr34EOBG85U9
         ld9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444211; x=1779049011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=pbP157J+8Za8EQCOi1R9Zis/R8D2ReylgRDcAbHckKePSGf4AzIPHomCk3trZK8tiQ
         Vw/DftBsSe921IIvmPytZFuzOo4JX2aHvHwGKYuC3I6Q3clAsUdn2BCjNqBiTvhIsmSf
         mtCgvj3mQhBkCM2/YXaYDFS+qeCUrxTR3bVI/hzNEIPfliHlZo0Gw0jSdEqxrSBXEsb/
         n5C5Spzd10+7Eo/SvueZYjtCTTQWn+D2O6jGbBZD9wiZIvOsOw7MKlLq7H/xW/qJJdBx
         CpujuCTKjq3NGTlvXaKvSp1NmYTbmp/E/lnQMG6bK57RbmW7LKRPI6e7miKoHH+fHm1h
         solw==
X-Forwarded-Encrypted: i=1; AFNElJ/lJzf2YDinI1P7Cwi1sbpkx/wcDmVXMDZ3L9kBeqJlpHZBLnk4BAiBKgL2LZ1zBPOUAfg1vDgsCE6X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9ihskk1ozIoUX3/Fr+McEUTDKCLN3CxQSrETyPdaVBMnL162
	pIYS1bwoMAkabYbRrm4PHdFkyQZS6CaAw17tCaUEpbYoB30jlB3kQkoA
X-Gm-Gg: Acq92OEqANdrILPMjdUmwd0EAOtfAQTejsyiTZ48mpBcpkLJmLQwuuq8qDm0Zz3jGFS
	4xZjYtIyk2qzjA+oUcbLvGuDOe1miO9EB4G5Q64InMXLhKowo3e7bKMOYg4ubRhWgMcMs7HZjP0
	T7i7fqWXq37nC1i1Z2x9MG8hb56m19t/Zb2pTEg7Q7m5zs3nvYoKlYRbDUiXzHgdM7xt6hnTVy4
	cnowPfLPwKYuqTk2G09GLv9961b4OCQCZcYMg1CiodnWYL6eI/j4F4I3P7VGdLvN+R2vBQP7xJb
	/yO9e6zbcvZly2DJNR7YnJTvOVXKIru37ZoUgAbQWfib37anc1lwqoMjf3csdQrDU8z8eaGwqJU
	v94uNsztKQYe3y9OnYMZSHAz06dp0pPacQkxEPmGT8f2yerR5IWRYUnoLyDsdrNU4drDIXTKEsz
	L4wB0riAIuhM/zePcdUhH7G4oWIhTIlPOhXBntS64VZ+GW3DZUxiFY
X-Received: by 2002:a05:600c:3548:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48e51e0a6a2mr320516385e9.4.1778444210848;
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Sun, 10 May 2026 22:16:39 +0200
Message-ID: <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..d7b9dec81165 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,17 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
+      - description: HelperBoardA133 Core
+        items:
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

