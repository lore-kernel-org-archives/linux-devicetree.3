Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C682A2FFDD6
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777430863; cv=none; b=oOw9vPzC4YomAc2m8oQKkTshzG4rIJ50wTEt0etohjGY5ZtAQX3Ck1dzAv6dpvnGlFZz8DWvqc/78uyuBIn+4Xdrq1br++JQ8HHu5Xm6x5LX+wKXQliU4NaprCQq+Jripqgh9uKjPk0uS5F36Fg6NaXc9/Jxeyh/4uzjMZ0CFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777430863; c=relaxed/simple;
	bh=zJ39uAJoSBW0uMQsIOlUyhDXKamg+kliqnyzBdMjWWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8VNxKLroAx421prqEaCtAoaoQw+noedylzN9ua22fC4tIrcAOlHik/aVKCajY6g9u3UAU/nbLLqDTgUlBU9sFyPD3mBvaAGxPG01OR0IjFfgFpFdIW4z8BhYqOfW0W5ztuMfwdBR9CAjwLtL/77lf3V2J1fFvEEg1SrKLZW0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=H/oQWj2j; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="H/oQWj2j"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7d55b97f358so7944602a34.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777430861; x=1778035661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=H/oQWj2jxa3kSvUXaJTJqK8FirP7Q4Eia3c5DEB+mHkSicolIxblCScY6ere1OWh+V
         UE+Wv5CHI+9cWQ6AfCrOLBtXgWAIzbxMDqHNGyqAWxgUhOK0GqyJZrrO3oUURD5MfClc
         kjxiH2nZihckNKhpJGHgd7LStu3VY8DIaNzTNRCRcK1SIECzKrKnXcM1u424PmcwN31L
         TnqhECvxjC6o17WTFH+1XoRws0V3fPmGpT9ZW71GIJnanGD8g9QAcXWKFWGXLWMUMTH6
         znz+rx24IPJUvz7SrJrFPtadBzlebx2I9FjxFMGhUDFkv4T4SDRkzmLWYqxoACr1g7K8
         XSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777430861; x=1778035661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=d56TYdOfzJdes6mhQuBy2BX6kLss4LmCJtjP19QdxejVTVz4FNv8/kYR2LDHCX47ie
         cS/bdA6abflTSCTk/wJT6GIndv9nqeXtUUpM02RF5/ArTienE5I41ermKDr65JKfRE5P
         j4N4v1Uf6rvysp9FjylHRCQNajk5qAM6dlayOQjWoQZMxWfdd+Lr85x2pIix5vsKp8JS
         rQqPc947APQAOl51a3xEVGVnWyuJbSdck/B9+2JZHCfe3z2FS0NNI+Y8f3WVM1u2U09y
         MUGMk4C/TR2ULg3pRs3/o1Ph6M+GkGG5MXWOQ6jIBnk4F48b7b3yzhaSkdWKifJU5ZZJ
         FYGw==
X-Forwarded-Encrypted: i=1; AFNElJ/IsWsq17uPy8ZN3hqR7nJu6s5rYwxq3FbIQi8bEznDydd1p1/STa+bb2FZUPZDmdJEmRjhpjeJgAIK@vger.kernel.org
X-Gm-Message-State: AOJu0YxQbWKqucYpkhbOs7mq9QOW8dKxlaeTd0fYFXQqxE2J+T6+CH7q
	7poMVibgYcEAfBq2L/c2Un0VFlPm34yklU8n+dwLOWrtxfkxDx76pyBDeKvkqBcRbC14l4Yocct
	z22197ENrbGYwGU94i/dSdddBFcssclJ7smKz
X-Gm-Gg: AeBDievTqGvYDmciOQF9mi4Hol8fk6zRqubtUOMXVmjSDCOLrGyuIc8Ep7MDd7JPSOH
	C4dAR5UD0Sb/GIxmLe/fUyq3IdJMVwFkFZb861YWTvJxP3RieJBJQkNkbou/CLwl5z1027yrtmL
	J6rBosYwy9L0zAjluVa4lmbjfkjDXnuntj8/zBjThx/QYnMVEHbYfDRnNQbrLixousxkgj5FkZL
	QLxVDfx20eMoX/bQYuzwyoK4lS85svQW/lMEW8+36byWJ1giaDmBEMchyAWkb6qugybOoDV3Q4y
	W8kSgxzWwrkgVDUWnIS7ZBS1RZTTCr1s97IG/WePgW+uj6JcLjNZ4rrDgJ+qt3NE6rauAq5W5+7
	mmxQnbYFCFYhwHDHETSHevYa4e5oM/zPW8tWloXcoZo9IAZP0PDMAcbE=
X-Received: by 2002:a05:6820:1989:b0:696:25d4:1e62 with SMTP id 006d021491bc7-6966838808amr1245717eaf.2.1777430860769;
        Tue, 28 Apr 2026 19:47:40 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4340e711c00sm110958fac.5.2026.04.28.19.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:47:40 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue, 28 Apr 2026 21:47:32 -0500
Message-ID: <20260429024737.544813-2-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429024737.544813-1-dennis@ausil.us>
References: <20260429024737.544813-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ec1303140600 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1338,6 +1338,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.54.0

