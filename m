Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378472;
	b=vOAj008p25z4kA8dItrI1x5CAPc+L58NHFLz3WkVvaLn8Z+71Hpdzr1Ws8BBHZb6TEII
	 K9YDJiwi9YX+ViIe8Wa7gwJqwNvSbN/DJzDhNbt3E31g6napNIqxe3J0OxuJhOPvtHGSl
	 UNgzTM3jzdhHw/W0TN2DZnrtnGtcPfnu6cR5jPqmqd0xSf46/Tr/0hw6AUzMH/KhJYO17
	 cqa6UY+yXznOJEnWVAQzg4+q/GCE6efyU8/sGTirW4ZBV53IC/S9Bv4d96q9rty/j1Jyf
	 JM39Ep1ZlkFr3JnsaLJyEDJc3PPBiCDQBhsHK8SWXMm9e7ZPNCoZzQcroMYS+re75Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
	b=0QA6XPBY+xCRvRVOwgqPa9MHPgyTUOw3X3AL+WhgeEw91dypZB8zblRAWnLzDoQj9PAe
	 iqdmZmoZuwQ1FPDD3GKRvzZwMK2f3snLEBxuc+qJr9B/rhQRjrZSpXxi0I5nJlKgg1shL
	 G2VBnrSGRDj4f7v522Sa/m9vSxPNGu6zA5Ft5D+cEymjV+yMhQHDOfBv+kuQnLACCoJt5
	 FypiN+Mgpa1LJRB8dNds66CzJDwvQxK36EgG2yQBNyeDtU5tLxRH/vjPj46ltCLfMNOiA
	 sWzyAr3EJBBUU8K6MhPNuF3k4UDdaW4A1rtTMrevLLVOmauwQrh1tP1SY4wAykK9iiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A167606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A167606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so3207339a12.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378471; x=1795983271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=pDgThwnlWfNp0X+IZJlpY9eY/oosSNsnD3BDUH3Ybk5y1roHWZirM1XA5N710J07zR
         LQFfSexCEO5f8nPezjvJ4kGHNB69Ge3PvLeb4Hh+jrWY92+Ir7rWwLGbBTkp+rfdKiwi
         UfiorIfpm3dEMY4t35Dj/Z+EaJdkQec5WxwBQXYwu6y0X5MPwNwBua2sCCiKrT32ftWt
         y7mYElmVxyP5CNb2Vus1Ydr6YBD1HtTJOfuE7QbMx0qwaLCRA7ic+MTp07lDERQLdkcs
         SXHJx3lcmJqgr+DylvvcqV3pDY553xlZ7v2QLHFsVuSRWAvhHApKPEI+VV0ClJpbCwTc
         Q1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378471; x=1795983271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=cwS6RoHnjXtk327LikVKj6+OYfHN2q607H+vXOcgBxhYsfbFtqYHo2/zY4Yd0xOQRX
         hWAFFYwOi83AnSdfvs9zz1rlP9brtoDsU0Uzb5oX3Wcoc8AXhOXnig8p1g4ywg73W0lI
         vbs6KWsSNB162z6YbF54Q94vGypGc1bKq7DztUIkw8zrAI8F81bSPiKiGX4rOKnAZukI
         vN+T/+Ko2qvmGaqVXK5be+6jEkG0ifCz6ThZXxhTlaBTFaiaUCxVXpZGeqk/gTHrE+hc
         8WrbnC8geU2kqFEnWPpDi2msj14GmAIHFpi1kQhyIMYThz2CPI4JaJFBLmzeDfwRSWow
         B2pw==
X-Gm-Message-State: APuU4Z+rLibFNDAZCO+UJfC6wvXJzs2Mf9WYrTfsGqcr189aQAhYAdWp
	NdAc9QFk7cHOgl4E3awUFejs+iZF3EK5iMxnwmWMbMYl8Iu8xz5iUJs1
X-Gm-Gg: AZFdTZdoXLXfRPIHZvug9O7OIHzJfvU/5uKDaFGJfDbvY5zMY0JBfmV5oLkz/kVUtGC
	XvCOq7TdkXwOGyBpdXVDixf1zrWsb8JPiUjoJZXYroudBqTnhnxVcY7L1Z4Oi3C+OV5/D7RlYVZ
	OBWRPkQnPkS9ewxdLLFTOJcxtzsUqCsPdYenbcIRgkksMEdtCP07I/a9OhNMnIBVWr0jIKkhzBF
	UlpoNLfaKTf4jaFSlA/K7MEy9b6Yd+E3uDiqKQjO+zNi2E7GwkU/EHfpayclnH39lOgltc1EEdW
	O9dqHyHIhtXLvPUOy0vGYoio1rA//1rM6V4DPg/Icv2wioJ/f/cTaJQkxj9VOceSVTStKWFe5Kg
	o2lY7cmVxAHWNRdKttW5jr9pSduIULTgpUEKfkJB9Cd77u7AyQCweGzC9qztWxFoXAePAEaXYTX
	NsscvozIb5KeLKK1elh93CbsRRLcJY4Oo1AYZS/1091xusIuEGVeU94g3bZRg52UBWGPL91xSLI
	82LtzzrEGaUuyey8korYIeipCYDZlWFLqhxzuvf/x2QUO/bx08jKFFuKmvNs8QgH4qB0LVhKXzQ
	7VZ0foRdSF+5Be5k9tUCL8Sqrkq+L0sUQLHNPCjCk4iCdEGJiZBVFT70It9qQv4pGRIWMfLp7c8
	WsgytOuQ94Q==
X-Received: by 2002:a05:6402:400d:b0:6b8:5b54:bb9d with SMTP id 4fb4d7f45d1cf-6ba37d62876mr6316804a12.10.1795378470876;
        Sun, 22 Nov 2026 12:14:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/18] dt-bindings: ARM: tegra: Document Tegra Note 7 variants
Date: Sun, 22 Nov 2026 22:13:50 +0200
Message-ID: <20261122201407.23742-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Tegra Note 7 has at least three known versions, two of which are
production (E1569 and P1640, along with P1988 — all classified as
"tegratab" by downstream sources), plus an LTE-supporting version
("tegranote7c", which has a separate board and tree downstream).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index e7545c8c2911a..dd123b0ab8ed7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -120,7 +120,12 @@ properties:
               - asus,tf701t
               - nvidia,dalmore
               - nvidia,roth
-              - nvidia,tn7
+          - const: nvidia,tegra114
+      - description: Nvidia Tegratab based Device family
+        items:
+          - enum:
+              - nvidia,tegratab
+              - nvidia,tegranote7c
           - const: nvidia,tegra114
       - items:
           - enum:
-- 
2.53.0

