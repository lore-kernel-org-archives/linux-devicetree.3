Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA9626D4F9
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005636; cv=none; b=hjNy63KThUMSHPgi5s5RuJUjYR+PzxGFT59P60u6mhTTy/pn65GA4JqyFNuJ35S0LQaYtdBvnmvvXvQdiHrKxPMx09iotVz2g5GNMuzFU4J86HK8oERoaQ1X61YGQe3A1r/ZQp4YYzCkUiEHYToqXQ6IMAsOaUYqvfsP0/EUtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005636; c=relaxed/simple;
	bh=YOfFbIpwiNDmQQ6SnW9JqzlFwsdx7DsINX0gVz2lQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueeuOuO7Wr7hFNC4/T3lxTvpAJfa/EJv0Tmyg2akvLcfJxp1J6U74J+/0EKSbPK1+IyiEusR1T+uEJH2enVTBxpZgzrzJ0IwzXJJIUWPgW1ElNBWZsT9SweMoqTYCieh/5hotTzShE/NO275LUsPjLHD8CXdkCM0pucXew6mTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=OnxyZw4G; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="OnxyZw4G"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-50bc115f206so36983021cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775005633; x=1775610433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=OnxyZw4GNnXjdeeuPTAyfq0jECRuFr0n1HQEHu4lUSGZzEWQ4kdaSX/i2NZJY2uheZ
         aZ/tLBKGQ99zkuPiz9K7etxNygv7dLI4TYQXwwAPLmgEsZaS+XxLrpWrJgYXxCWR3EuR
         eeOB6vVFLvAB0TusUuRr4svW1ARsRhXKIxhgDkSMHEdck2KcQkVzyHk6Z7Z24MYEUcev
         iAD8UobkUZDoHn9YD9hMklFk2jWUHiWTHfsuQxBb5ZPOfeXcUpx3lftxtJQNALVLU85G
         fSBF4PqKvAfJEMr7YJSdyOymdGM41asgsSyuuGH/IPBrMOfmknsXLfAvyCGv+tA9cjan
         6D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005633; x=1775610433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=WtiL64XOf9dqasVRaaItlRtEkdRLF65VQ2fsWKLhPZ8lMZeAgEMMqX+DwMdEzyH9H7
         NhY6Su5La8SUGpNvrewwbudFd0jgWXGiuHIBwsoq518Kjv1onwB7GggeYvbc8IE4Ceyg
         nWMJ88ubsgRluanZ6HbjFuldNFc5OXfS4awHO0idGjz4HozcHVcRkJFYOZWPTlG+4vqW
         cvbI/eyqJwaewjG8pK1mV69uBnT80Pz2tFbDljDu2qA4s3vqNZqkIOYYpCvOWom7kifU
         wOMqZ2BqDpNpEH/P+Y0jFo1RbEw2sedUJkhblp1FRdZR1GBAoqC5Nv8B5XwBPGPqkibF
         DqUg==
X-Forwarded-Encrypted: i=1; AJvYcCWKrEAZTTvcOU/ugwnGHeeeyBT3TsTsSFrTZcpVoOwLwLysv9cTtdgV1zdZUoJe1l5UHlsdsvm0XihK@vger.kernel.org
X-Gm-Message-State: AOJu0YxfaYWERMphYQHsWjZUdz+EBWAfVHP1vB9mzMMbOZGk57ygA+ae
	7X7azDz6jPUHOPsDYs8XOFh8/dOIX96faPHGXOIY96n34F3SOe80MQI4glJIpAcUsDOOU8MhsSa
	UJXKiUuleXVvdBrZRIHWoxMklOroHVtnDvUXv
X-Gm-Gg: ATEYQzzyTroj9mXIQH8HhNypwyy8rkRXyldwblPAqFiL7FEo2PvUq3ZrFQdwtdIimoz
	nQOOdVmFdxNoe8sdu0RSaiu0j0JBzdJ0B7QIf0/WZ2+akJU7YDAtsN8Mms1Tfr5phFkDK9pYokF
	wZezUYZWOM19ZBo9pWZlbiypGn2RNzoQYUMIJ93k9LKGJLaPy4tVN9smLexcE3a8uXtrEZoFcG1
	wRdRqyZY5cTbsy9XjyybqqbbDqVwE+UkMXFTGKB8BqyS2cCPEm+i91MSzcNaOIjNT6uDLwwkdRi
	Z+JQOtaIQ9TiqyOfNdTUhZEPhzrBi1kREksbeCoCGXAzv/8Yb02by29dZsXUfsTHjvFtdSNbt8T
	lvKlb3HzFZOo5uvwnkk6MFi2n9Ocd6oupb8uHltVSq+T/
X-Received: by 2002:a05:622a:10c:b0:509:3f5d:4fb4 with SMTP id d75a77b69052e-50d3bc15895mr25873091cf.20.1775005633089;
        Tue, 31 Mar 2026 18:07:13 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89ecd72ecd5sm14105766d6.15.2026.03.31.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:07:13 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue, 31 Mar 2026 20:07:05 -0500
Message-ID: <20260401010707.2584962-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401010707.2584962-1-dennis@ausil.us>
References: <20260401010707.2584962-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dennis Gilmore <dennis@ausil.us>

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0

