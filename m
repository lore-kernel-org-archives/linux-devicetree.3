Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627E3A6F0B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387603; cv=none; b=IuardmDNMkk+TpQwBwN620Ufij69VD2a2ZK174u8ueuVk4rXInrpaD3Edfe8t7Teheymyz2jjyCKHe8HglYzqfP8BuL8vUlP/KVH17Bz6vqZlFRn/z16bHxH4bnnHwHBkVevDCLEpvxA+Sj/n1XHlQCjHLO5QMek9JSHuQu8Kl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387603; c=relaxed/simple;
	bh=5yM8Fk7lVwHG26dyQQPy6vqq3BZBPgqEpGieeeRDIc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7Bn7dcDVuMY7BLQfXV9Nrs5ilVDptugZajhVncPXSjZ7bA+u1UWcmi7JreJ1rkCNhmOt3Il/mSviIj1N4MLhrbLrlups84zFJ1YhmYP8Kd32Fot50FrjOekLPXyYutHy+VuaNJj3n+OFrNr6MJWBSfqENIZnJkSAV3wWWA+3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWhfqkNW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWhfqkNW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so1919561a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387601; x=1785992401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtIjaQYzsHOvXBRyxq6T6K4m4xbtRsSOUHx5wlzsFJM=;
        b=lWhfqkNWO4JFYPnCDSUTTq8/EpgxiXaU1/dteZ0Iri5wGNijdQTGxSOY0U63X293b9
         d1Go7q/xWm94dqg4lCHDmQwGUv3rRSTjz3AnmQo3YdZNuZcwVi37h0bIU7GG9mRweLWd
         pOcwE52CDUdq7qh7O2CqR7cZzT0oY+o61eaa2Oh7hC5dmgtrHspwGxgKompnfszZKdpd
         7HsUSM0IgVYjQf4bM9jXY/cCRGWfX/DORQO0Vne4ZcbhVZFvdXYkoIdG02eEoq6iXQmz
         p1d+NX7YSb1taU0AuU0iKsLiQAL+60bFcEo6bQCF+paq6xBDzx/iteuFaRX3/7kbRyKH
         VESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387601; x=1785992401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtIjaQYzsHOvXBRyxq6T6K4m4xbtRsSOUHx5wlzsFJM=;
        b=HrAGZPRnjdZaN9f7+6qAt497E/XoBJECwmz5DBcBspc1Piw9f8iPrIbAIJguJwEi/f
         k0ckfz4IcvEmo9aBTFfrugnttdtTaz0vKRyD/ZrZSbFSLIXdGX0DIJ7RMBmxwxoMqXFR
         rf1qBXXHXsPppatnfAXmTxwEZRHhmXDNxHA293hhwExCScPkXTjjchHF3SQhytbe1/P6
         DDMLlRN6vWSLkDUbPRNKR35vm4h5M/i5Zo0gRMDCEi9LDxiZahK7C5Zo+kTKw9deTOPq
         kpqzzzjE0vdMcNDuapC6d0LnbxeYpJYPOGiRX2Kg/uSWkcSX1ercBTt7+FbxEPXbFx57
         +6yg==
X-Gm-Message-State: AOJu0YwyJd2hA/TuFH7L+m4me17gXZlMaAzjPn9SpWxkRawfikMPfBxK
	GRGszFNwVlmc9P10XCseX8L/50hcYXZgoLUcEQqnPy7N3qTrIMNzUcr1
X-Gm-Gg: AR+sD10fTsicdzxvCLywUsSLXNZfm5OhEpyBGaiTpiApufFb82T2xEwqq3DC11RSwMr
	BUlTDaBHR/z/31B9HC6/VPdd23BWv83UsTGwV1VqwvTI3qjGuXH754vlBFxMn35v75ijVin8OEL
	wFO04fVvWoC3w7pPaqPi/T4deo2OEDaKUGHWLwPhMsa6bzzZjHvdvJPBbxDVp4Kwm0DBiddCMi7
	t2xBywmXu6c/BusQpORLQUxeMr/Wm56h74PmiL7SjG71mGrKh81SPfdYb6cS4ZBWOqLRB91f1Tp
	EnuApSoYns7fQYt2BzbgbQPcEchhzySwNYfuWGj6fycnfx4G8MeKZGNMJLdqvLZbbjdJ5633L4C
	XZwyQfuUK7ktmGU4swHw2QFj0pTj7HsSvcW2l6xNBkBH1ZmBkOBZKLhpJ/oMXq2xsNgMwOvdVJU
	rSQds85gZdVwKnknfZBUVQeP1TSL4SLk1exxtT8zpoLtjC3AN0pmLU3E9S2XEOBQAJNla3DD9AW
	15a+WQ=
X-Received: by 2002:a17:90b:5687:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38f9bddef62mr1034829a91.14.1785387601561;
        Wed, 29 Jul 2026 22:00:01 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72556386sm14383898c88.0.2026.07.29.21.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 22:00:01 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Thu, 30 Jul 2026 10:29:46 +0530
Message-ID: <20260730045947.388660-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730045947.388660-1-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

