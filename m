Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF553E1688
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670376; cv=none; b=LIF34X4vQhJ651RuozFql4L+GsKjy9ebBXqzl4Cybm68WAY37E/I0IVeNpQiOEvdWgblc9bSO1dz8Ycom9vO/+B5B7V5+x4Gy8ytYR4N4fY12VbGTBaS7avetggX53bGw4yd5gCEWyKuGigGAcWKlK+T4ulJRYwpJ4fDdcwVHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670376; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvEHwwWn9OdGV2j1uRYO/aDlRp+2sjFAnZzeor03C7J32NaRBE60vDnBmIdmC4LIBQkcgo3mpCeNpOcNvo5JAc1S9gKsLuuSGkocMBPtMpaoEpTd+pgU4uI/5DqQWEpU9rIWgpIRsNDCx6icOcaa4kLdHnx+n0SGuaA5tDYv7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6TPHASn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6TPHASn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-380f3c1b087so89990a91.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670375; x=1784275175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=s6TPHASnJhzfpEgcr2qbjdolcT45jxfEU60u+wWWPdnOaUxFru9cdSlPqHyWoS/S9k
         fEgH6mrDUwF/YKDkJAcz0nnLUmpu1HF7D4X0O0v4BOhzNXurB1xLc2SjO4ESizSTHajf
         +mGzdLMs3h0E/uB/zgAJWioy5IUvUtli9Ixs6HkHMPQQl6zdlRhmX9JauR4e+TQv3W8X
         AxJXMITnvTnr/fJ5qczx1T+PHuIOBlGGaFTbjCWJUC3/hcZiHXI5qzHklGtAQCrDvmGM
         /j8F8HK0vNQJ0fAl4mYfe9CTv4R/4cq/no3/+u0X5Jy+vTgOVvklnA1CE6NG9zn4r8a7
         jC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670375; x=1784275175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=D3vERRw0TeXLomWYFYek5lZ0sFdlOkqz2apFE0Vikp/shyqjLPU6eVWUeyYfwuNGN6
         H9NACrzCpUVVyOqRNRL1xUX+H0xatgOhwGOD2uObbsdrholvkO9x24dtpieuL7Ln5nOG
         02R2h5zEZKOtQmg/CpOtwaslGuSWsoK+vyimtxPOCl3sNKKKUpuwAAsqhibjCJkdG0Tx
         jnxbf40IZYgCXiaTogz+a3F8w9Q/LcdsdjqY9NpWKjog1rHda1V+TV2kPSGYDsnwPraI
         /B6vPH1KRtTDU9/hWQ3iFujzhpZ5E9yo6r3ppgVUCOwOCQvw0X4ZGckJUhc7luPOd1h+
         IuAQ==
X-Forwarded-Encrypted: i=1; AHgh+RovZiHtenxac2VLLoEuv27ZICt8MGcJVSbuJvkADAOTv8k/w4YHTOM3jzZQkTH4f/KmdW+Yai2R74az@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+t4qT4coiuLuvCK4G+bpbpmsXSC0xIAAbuHa7dFDkJVokTh5
	S2aNLPfizvRo33+hJrgzTdJJkzd6nf5tPgGf0qsYb61M3bTOMz56NOko
X-Gm-Gg: AfdE7clpBY1XVd2VwjnFDzDfOJJdK1EgJDpKR+UaliyQP1Pi6+ZUtwho+rHgXCbEEar
	czSgcnjSOzd0LAegunVF7MYpC4WZDjwuloYpdCKKuyGO8wG21s5bbT8ki2Z7DlYa7ML2e/g/jdf
	EEJ9A1n2231BaJh8vdeD581ELY5VDhKZ8BxXyNEZw/GsUdGK/tqFh8K3AZZEVl5o0wQNtW8SdSB
	yqTciZ6nbSHtig8O+4P5nGtGc3wtbRckbZ2mEn/GFM3OQjHY+jxJbxn+DlmHa1K4MLQsaPaIzIa
	OZBLyY7MTw8dMksHOuhN1WvxaGvmwOE6qg9U5ygkq/PnUsba5y4aA1n6aqY2PnXXVq61EZ1uGVZ
	JJ/0GHLDzpmN9udcNvuzckcryYBDkPKdfFddAJIz/kXU4ZrTht1ajhjfh4mjbPD3oaiDjRWgVl9
	7uRoVW0RBdZW6iOTM=
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38a1c1b0a81mr5870558a91.0.1783670374731;
        Fri, 10 Jul 2026 00:59:34 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:33 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Fri, 10 Jul 2026 15:59:15 +0800
Message-ID: <20260710075917.159969-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

