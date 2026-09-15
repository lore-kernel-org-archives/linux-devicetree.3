Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4112C237C
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435888; cv=none; b=RArhagFdSFYChce9LzF6KljueIY51eCe/KgaS/qBBJ7+xBh+yG38IBXAljMXkdHLhqaexrDrvlBTFdpHVSl3nbylypesjiChIXUpsOCyFprtr0UrcR+Pe2igSgbNov6VpGI55OCnHGoTNDrFLC2Tk94UE0CIzdGoaMp/10bzFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435888; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtCKQP+SL4+RzWqtOwOdOATPeoMkDhS+kUsZwYpTX9HUgnrWviHosOAgouB1d8v56ptKHHeORSAPSBT3hTFX1hp8P2XSrkAkRxtrd4ojhyhHpjddsK+dhWf51CLt5FK+hs6Cy/G60dYRkxXRjKy7r02oLshoxek3fJr5SmR7e8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ7V7MWB; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ7V7MWB"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c6006e2428so2480476b6e.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435885; x=1790040685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=sZ7V7MWB/4BImsvkc1vj8TO8aAy5NXrsru1D/OLzWA5ifZGdxv/FP5LTfhK1UnlHqi
         mlA+0pYZzoezC6QSm4PZBs+cGOzllir5+e7jibnM3oBaVO0GCy9WLPpmSS0ccEzgMlBm
         iLiqTSRysLigy8XZalb5iUDkW81F50Juu/makSdXgA4ip0YtG7HNWkudsuWsDCkUEbUo
         tnDnRUH4B6inxReshvEi02S5SPwuwllt1syA/7a88QsDBXa2eThw6+jrxYp/QppoKBi2
         KAcgCe2O8UOZ2Ohc7aCsM/DKj2fL3WdLJWYm+rmfYp2Jpq827VSEuZQHz2KU7BJuM53S
         TeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435885; x=1790040685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=QtvGwHQ5sxYNQENMy9IzjdL9rO8NQV9geL9GWkwixWjlEX64COcrZhgrlRNfXvaJ68
         rb9nZV7nyDPh2HePjxeM865Gq7+F7WfOZ5kh/6brqIYH9xTRD0lzILkqwDEtG61WNAJu
         Bmd1V5KGS+A28roQxbRBfgYJXaAfk4TI4nguWg6Q4LhIemm5bAn5b7XPXqPWFyvA5j7h
         tO4MZOS4N9iIaGUYhr9/l68A7wd5HKgpiOm2qmMqJIVD1aQLfLjdqlVoPb4UcOQpz/za
         Ngk2a8+b3KJQOYviyj4uKhr4T/7WMVwRQ72Ex85ZbpTeaWJl+Y7S5cBicJG4JtCUjOY+
         Fhlg==
X-Forwarded-Encrypted: i=1; AKwUvBxJVPn9+JVoHMANmRZF/RaGpsmgULvC6ZUSanLaMy6l8joTlP9LTwIBTuo40wkN9hjTPAI7cG0zkaAd@vger.kernel.org
X-Gm-Message-State: AFuF++kVTXhagNDMKlV6xxq32vYKFXAvCKedqfxUdhjUfw5uqFHHW2o4
	XsRN6NN/J/u4qsk5+zyy0VeB2SUt1QKhw7YY+UyYMqny0FO7zh0Kjyf2
X-Gm-Gg: AYBFou2xpvX8iwHvYxXdqQzXrp9aNbOqlBn5FmdXURPuGXrY3so33uQFbM52eQlmQhZ
	ogCqJY6gCcUbuoAyNTBbCaKrKDjPppU4nap3uQtCnlkFKsri/j3RVdYb/qNkKPhAFUUcSd5gWux
	RHIBBT+omVEnXdwDXZ3hG9sgSTgbUwpUfvYDx0ieYVizQDv0gGiaDJ2yYVbCnFpvgVevbYZtZHa
	o2QwdamNwl15AKrv0pCrHMXPkQGQ54G1TkihEuCwl8MMvgPMbRTamF5ZRA4H0qIlrpGoBihRIO7
	JWuttqWqj4Kr0Nh9itdDlSmRD3DcQeEv4TB6sfudYnv33NCof9+clrx4efniEKt7xZAxsItE2xi
	/uZWaRBklwvywLnw7dBB23LOk8LvyzSBB/MjLKPYdV26tQBzXwk6Uf6c4G06klStScnX2KEPT0f
	cXx3ARBeKyhJG2Vi40U8j/47IUui4HNZBTsXADLAYnQ32cNwegya6FCmtQmE3TQYxFELIU2SIbd
	K//wScRZlnUzv/a
X-Received: by 2002:a05:6820:8119:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c543112b4amr3036635eaf.64.1789435885128;
        Mon, 14 Sep 2026 18:31:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:24 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 15 Sep 2026 07:01:09 +0530
Message-ID: <20260915013110.4780-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

