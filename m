Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404980;
	b=CuiByt3QhYpuOs3ZddaGLpQzhyUbBiIRvqWY3izd2rdzCRlzw4gRK8mc+ZGeLl3tC07L
	 0bL+rF/wxUBLE6a8wipfpJ8ABnQ4kBAbuZ4u8nwOKI3kV3K0JO1T2wcDW3XInumKlypj+
	 M5ceXRQl0klBgsuCU/bjzA03KruL1f3zzSgpPtVHesbXSbh/EJ0dvv1BrTQkftLQj8j+E
	 QmnyRSy+SfOi6PahhF+xWS5nKXvnq3v7WARw3rI3QXUxyMYxpJezdkelUEP/HSeI2HWa4
	 O7zOS++NN03xwaj6ZiG6YFJM05wVpSmAgQh64sMpzHIJjlhD+POFYll1OpXlF8bUWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
	b=KiLcj1hJYIdsyYTTsm8GUo9o5rCj/7ozWqkUf3O/8wzJGy/B6Z9TyDTIsfhAjjzKdN3j
	 FtPdYn9exqhCCNl6FG/IhqAltkV4jdr3Kfo0okLltatFc/Emk19KhyNBRCHDndiOWdchN
	 i6UmsHoGo3PH1lSSFK9dkpcZh0bzWijzM3qx0ARqBbReq6ILG2qDiiH4kAo5joUHatwwp
	 gcLmNJi6QmBn4Rb7GAigJIHN91hX02+bjslRx0LwgsC9ELJrBoa/TFD56L6ddHkNAE36/
	 ulE+fYIZVo0KJOgfBXw9uGFhIDHCw8cTt8he5FQGAnvwvNgzJ++/H7qV9j9gjGp1RxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsHKBm9J;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277F606A32A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7277F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsHKBm9J
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b335ef6441so28308337b3.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404978; x=1795009778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=HsHKBm9JEplJMcjdhmBEkJfuTrK/Gp7f+8n+G6/rynjE06L8JUK5XidxqV+upoTZDG
         R5fNn0irMWI4kZ9NTQegjV0D/hYyxbWCKteJWrve8rPZmdXUrRcb4MsXP034+vSAvDHg
         q+2nVaQwN5Z8jZqE+uRs1oDNStA2PqtNZcB66yJITYDeGZDhBTt+9EPHANqY6QroYY9+
         B2mV4/ovdywH4YOXI7g6USndZ4GYC8K3DId1uOxPqmc9CnGqCirPX/oq/C2BWfdLObX6
         9UadiUAnW+kNC1GGqsb7GUpyq+T0KwQxp4knEXbFqK0OUngNSNWw6DB1MZ8Bd403xKJP
         GeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404978; x=1795009778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=aAP8uh2ObXYPfly0QY5HlfMP+4GCctsa28h4HhOFrslvN5kH+fa1qsCeo02piG0phI
         1ekVZdT69IZp7KkHtzYCbJcWdigwH9K3c+A8tjQqlaDC71hVQq/HDnB4JgJ/a2nOiSFw
         7Mbp12g5zW1P5AmIvhW6c09kaZ/iJzMybi6hCF72O9Xa/okSBuO8Bbw7f8a0X4mERl7L
         KDy6jtdE0dKBF4+B8lG5/cjVfRpn7Aof4e3OXS1KeForpqL7fv6L4esYG4HBN4LAuE7x
         IMBWr9DGd4dvVchoeP4MOBzoxSTsHIX2L7m91UDm4Ahx+2a3aedymyOqf8lRPzzCzZ7m
         xH/A==
X-Forwarded-Encrypted: i=1; AL+hErHJydS5wSmoiX0LtnVvNyNgP8HkTx6U+xIl/kh0QlkL476hwO8J+jvuPU5usC81rhWzu6AWW2TSNgQT@vger.kernel.org
X-Gm-Message-State: APuU4Z8bpgaZL6AEa97GxD70Qsjjvwm5ngAWcwDr17QvhyZ9H4H1jiOD
	oJ0AD2MV19QHNQ1c9bH6SLSXzaqUuc7uhipBJPfDzlqB5944hdPerYnE
X-Gm-Gg: AYBFou3wO2gGbN9oK6FtA8+a/IzeZLWT+CqHDp/9F3cUIU6Zy/GJyO2JUnyZT+p3PEt
	/GlEnAI25MmlCYt3UVN3xh2df9UsaUnF10L6TmDmrB8B87gIDal9aFcePrDkx1TnZa8JeNUeAxS
	wIW2Y8VCu8tELfqWcWsk3DzlcH3hPZ9ynle410KyrBhE0YErQEYT/SQ+ASCpJhfEhRfmw2uUf2+
	ek1e8YlmC4l1/sHd+7AJ9zT0FzPq6WZmclMuHOta0dxc59BUVoGXL/yZnpiRHiTU90Vce8mkYKN
	1rg7EauyUFm9OwFiZHW6Q5ct/WcxI7XLfkKvhAhM/Q/5SvwGhA4l1EeUJbVpw9zIUYKffRgL397
	ajAkvgt9Qn4pqedXrY8Jx5MeRxY3vycLXG+K66DYeQvISERQ7QIGk8/mO8chebHkhIVpLVSL/Ti
	yttjgXzJBj7t3awTqefc+NThBSKtMFWCf+Imkr714/41NszRhRwmrK6mQHQTlQ6ZouTIs+m59ZP
	A9h0k7qEUMJdBxTQiw5+1vmsm4GQvshEJR7zMQAQ2+n2UekfASTve5DPBY+/sgOHIFUp6+JtzFC
	5KfeZEEOIhyX5p4YBSjQArHM9E/HyDnRUDm4v3JNOVPk9IBzBCWbQpXRqlYYnWl0cy7/YBoAFn/
	rlfgAxXuDGKJDFOfYrMFMgLN1yuZaBSJYLZcISNBbS9QBG3mTPTnh/iKKIeVHBR2sdGmQD/0C5k
	k=
X-Received: by 2002:a05:690c:a081:20b0:8b1:9b4d:b121 with SMTP id 00721157ae682-8b3a7ffd0admr14988867b3.23.1794404978378;
        Wed, 11 Nov 2026 05:49:38 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:37 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Date: Wed, 11 Nov 2026 10:49:15 -0300
Message-ID: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7Z, an Allwinner A733-based board.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 37a7d713ac71..2b9e4d3b2fe7 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,cubie-a7s
           - const: allwinner,sun60i-a733
 
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.43.0

