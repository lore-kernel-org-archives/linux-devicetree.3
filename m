Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E93ED5A6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920150; cv=none; b=ITDL3OVn3aGnGhGWsfTPP2JU/tFzDdc7SAiZSiPiWWHMjDZkXpkMwz7EzYU0b5HZQjfZo0/SnhSBbShk7zjPyvqYWQjfEyVzJqDnubco8+wHLDAxvvIdJJUrh0bvWeHsXqAokO5Fx8BTlYtEo2/qUm5tej3vY1Gd/PWozY803Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920150; c=relaxed/simple;
	bh=tBuHJhzyR1hEsYiEvM9jD9sksOaD5cSYtrYtChto41o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iz3/DJ5fDc8elQuQ/KFsmuTs6bQecm3ZferqnhyrbT5jJ8VFHNOlebWfdmLA5d30vg/yFBhgkggOlEjzxBBP/q8xWyfD88gjgKjzP3XfYJV/sAzZUBndEh7OuqQwYqRQzSdjCDM2pkT4zJ7xHU7hMCdDNAEZVtBagAQ2d1wpCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtSTuQmn; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtSTuQmn"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so6189101fa.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920145; x=1786524945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H1aAxnj7afVZ3zqJ198w7ntS0lziu9NK3yGPDspD10=;
        b=EtSTuQmnos/6pYn9hqVY2iiCSq3mOmk2xzbekBsX2xX+ulUw5dQKP047q1kbtx0r/g
         Xop+L5x8X9txPLFCvTJ3JciioKIXET0hkgcT3osGau1xDTcBobfxruLej9a17IUPBP4w
         QbxTYi+9gCQrDQlY3bi7r8pWY9xGDbLaU8kFRcUtZdzJLf2gvBjwmNbAfIPi9D0qDgcc
         xx0rHlqafH/PmznNcMousCf3yrCECFtrmMe8KQJj84VYRpSLPkXqRv1BNZbamuM3s2mT
         nECbKWKVEoSZ9sVsZiz/FWcUKk0qpKPBlKQO3IMVFAejplzUbMCAczBdhTAj3NWtAlGX
         IRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920145; x=1786524945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1H1aAxnj7afVZ3zqJ198w7ntS0lziu9NK3yGPDspD10=;
        b=HnEw2+3qsr3n2Viie9LthrZ+ACGXrdawrbBaaCxr/FLyUq/YHlL93SYVOVlhPyPe3t
         xFxlD61FwWHMUkrFmMV61WWm8EnvpJfatpcAOBZNlAtwEUz3s+J7RVjsm9RFhlzQpvRN
         5MXrnwoIzMtyI6wUAa9g1+lgJ6O+q70UfQGVPr6sKB8yxC595vomhlLeUCvtZRIQpQEj
         +YYFr1Cr0jK7R0xmoBs9ghtTcWYxedTnaWjYdQWNsHpT10OqIRw8D4iuHh0gvDKPwfT0
         CxQghkx3DfE1QIjMDiAQkixqLX2dRMuFl+jvyzZqCPSMrfXFKUF/LDlWo7DZUWYFFXc7
         Tt/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqGwgBLRv18v6FBOWcovjXI81626M4gGU6Kk6doa8Ddb+IRgtJGxzFiMwshpXgVQG7jSabp6/ADCiMi@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpa+BYdtrzD62FGyVBhxM7/9am1esg3JoYWqzEqhGw6b5WQt2
	pR7Zii0m0XlV+gAPkzNq/5VNWCPK/v/OlfNhoyzpaAIRnrVLZe8ZHJ0F
X-Gm-Gg: AR+sD132uWT6gDbJu4+b7VFtJvMs9DWwkumXR8Xb5JzgQhDPvfz8E3Up0qp1kzr5eQN
	jclmC9xXs6jHEY+mGAgN5Ik5wvlQlNvnrZV7wvh3VojTTEtjEt0oTrWJ8lIXZWUr39W6WNg25Zq
	36m43llCHuVLK8IINhtToAIw6bIeL2lVp9quOJzp9ADPD6Vey0qEdvF3UpGG45bko2du0Z3+Pg1
	UflBtevHkekHtU1f6n1kxqJitnV3rTwtF1Q2fcZbu6UcPxtLhFjT6FcDDqUkGyndu8eWq4gRogB
	vk9Gha8QeyKxaWJiGfKgaMyhgI/CWxFARsIaKKzgzRhyEJ7mAWQC9eY1RfRJ+2kW2FQh3yILML5
	aPYk0JJD6rOJMhL6CZlybcJJYfyv9upo7mOlqnCyVGGHSZy/cJwab0PF1hsmzLrbNT+yC32SR2M
	70NFZFwKvIuSoUWsldM/BGqR05EJ9Zbm2b/oeF7Ry6I9BtUKm8jYTqRpTdLuOFLA==
X-Received: by 2002:a05:651c:1586:b0:39e:ea4f:4202 with SMTP id 38308e7fff4ca-39fbb262b33mr5974851fa.31.1785920145074;
        Wed, 05 Aug 2026 01:55:45 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a152aasm7470471fa.21.2026.08.05.01.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:55:44 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v6 1/3] dt-bindings: vendor-prefixes: add Guangdong Dapu Telecom Co., Ltd.
Date: Wed,  5 Aug 2026 11:55:38 +0300
Message-ID: <20260805085540.452260-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805085540.452260-1-a.shimko.dev@gmail.com>
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Guangdong Dapu Telecom Co., Ltd. [1], a manufacturer
of Ethernet PHYs, networking and other equipment.  The prefix will be
used in the DAP8211R(I) Gigabit Ethernet PHY binding.

[1] https://www.dptel.com/

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..f8efecb560b6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -457,6 +457,8 @@ patternProperties:
     description: Dongwoon Anatech
   "^dptechnics,.*":
     description: DPTechnics
+  "^dptel,.*":
+    description: Guangdong Dapu Telecom Co., Ltd.
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.43.0

