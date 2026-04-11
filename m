Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E22264D3
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 02:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875671; cv=none; b=iDAmZ8540DADYYD1kVxrW0pt3qm0YmSWcyLPwr0A5oRVlv4R++y37+f/t79ZV3gCnhVc3+BaRSj5+rdVX77iQdVuqvj1mjtFJ0tkX/zlyAx9WBbizXE/vpBiTKsGYzjXzumWqUXAD2xTAXynzFafuYW0nbDK34dNskPBZREtiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875671; c=relaxed/simple;
	bh=YOfFbIpwiNDmQQ6SnW9JqzlFwsdx7DsINX0gVz2lQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7a1u9u2fL09VQyjHxnc9yxSiiuC7eSzkNKmh0T33hfdkiVqUdyzmrdwNdTVBgzNImn5JOKGCbmDqn4Z0zdnvERXW4veP9EEiryn2TvxZfX9JFKNfdhjRjLAnkX/MYTH4sBguvjhqXbpVC3nLMduvNpbDHIaPvOKLw1/uR9oIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=QDogs1ms; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="QDogs1ms"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7dbba5076c8so1348852a34.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875669; x=1776480469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=QDogs1msm18Yh0L8JmBh7IMvjs7f1589Wq98sMzg1sl7iEfLclZI1Msg458nE3mD0T
         mhN7Ctz5XIiSY2HIbh1zHAVEN0xGdz3Uxie6yD3vSvOwL+sal1OhiHF21s8S+z2r8WM0
         aC+e2KObFTxEx898PrMigjbgdPzJlRhx81gOR9o4i+SIY0V5OrmnEkCHdRRa0IP/CmLg
         Agg7tisW8GB+n7Let8S+I3A2dxzPwdk/LAbS4rkqCIFLtSV6SaV3PsnnMYpN7WZlDKf2
         rq30QJfgAjlNFJHSVFXYvmPCzBK64/PpycqxCBOEUzerDHmdSCdx2u/4/aGN0GKHj8rI
         Fhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875669; x=1776480469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=Qm+fX37GwMenEbNEDkXvmr+TelCoP4MSp0ccD/G6UC8kHI0uwXGdKEmhW98itxJlP/
         Szj/FWT/fQ/XaDSmxJ/Xh1rXxeRDk4OU8mLpsnPt3nm5a8P8h7r3ywer2iwLJbPWNWyf
         hruF5HYPBAoostQ9z1m3npdXs+Vmq2VgGc6k3pOGETz9GMyf3ueU4iMMjwbkZoTqEOWQ
         ye4Bhfce+HFaEL5wGUUlsHwa+NOORR4TAIHtFXoO2lia8uELdPxD3WncmjCgbAfRfoxp
         qwXr9OpJ2izhsEP5DSVc3ObQTYm8Hs+Ogzqf3uZHbdjmVHqPg6s7q4+gDuADJfUA0Qf1
         jRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU42wsG+7PqU5JJKEKP7aSC/0BX9G2HF/6tvWekYz1Hli4vydTt7tbkoRE/jU6H/6eqlzoR71yRKwO7@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXjqS0m7V8KSULeXHUKopQog3g49IVuqvzKgWcZFVKj12+ztL
	rExd4hk9mjkImAe4YsadnD/e2kaW2svjS2+ivwYwGSWd/rWW+dw5fUjkVv1Z+RnWmeedp1rFrpT
	PSZrM3iv4M0obpI4JaP9Pemt/B28Vw9zmQ2cB
X-Gm-Gg: AeBDieuRS1E92uZckKp1ob2ZOaehykZAx5hNyBsZDX7jrzDvRgcFo2E27tSWSTR29p6
	zigZ6MdigPJ/Dni/eGaAs/DbIU19ZBasJ6WVRXvPvvJj6XpmWONE29VI6Lz9VYSZxEhLby4ARd1
	+kR62CAoqLUF1cntHc4eUlIMQxIiDxtt5X1ytBHb6Z5jK23FTctNEvh3b1PFZpGFUjKaEKJxg2Q
	U0PCtzsIPh4XdbkGrd/CGcf1qFk5Rax4zyzsN6J1zIJoORL5rwC6/56FoeuPMrQWNfNTcag2BQR
	ZLWsXPA+Aom+P8dZQq8nN3+ID6x+BBtMRsHMBz3h7iFGOExJPIhp721laXTtxueiHbUPhCrF68X
	lBJRE+dzyWbDKD4Dz0Vo/EzFg1wv01bQ/1/W141mCiyO4
X-Received: by 2002:a05:6870:75c5:b0:41c:4423:5f0 with SMTP id 586e51a60fabf-423e0e8bd76mr3635022fac.14.1775875668802;
        Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Fri, 10 Apr 2026 21:47:41 -0500
Message-ID: <20260411024743.195385-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024743.195385-1-dennis@ausil.us>
References: <20260411024743.195385-1-dennis@ausil.us>
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

