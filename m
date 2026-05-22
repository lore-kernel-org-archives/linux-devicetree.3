Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE683C73D7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444223; cv=none; b=a0qPnwkrftTFc5r96SxZSnc16WnBQBnnHBQo3Cvx1J5K/apVdgXPuz9BsNOFDLyfILT5qIZ7s79yxQHK8XzfWtlVS/wPYtJA59SDwEa2IwIsUV1PBlsxTj+Tr2Lr9TVyLWiXDMaZrSKPomoGbKbYHiDN0pFROkFNKpY/xDVJ7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444223; c=relaxed/simple;
	bh=5IVRUpeRERkgnBnFFAUZRPR4vuOlaquMQ2M1F5gjZLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD7gL5SrTR/pKkjf1c9onZCj3KtgyDYgTYxrySEaje8+IhdJZUpjZSf/SZ78pE3rg4NbS2o3UJofzUHFnoNODzhATl34nGDixSxMxpOf4oWFc5fPHy+8Run2zTl9ZdL9esxPV3aHpJ3v6hJX+X3WYG1dCpAD+7WvJXrfJuCuByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeLQgG1J; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeLQgG1J"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4efedbeaso52510745ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444221; x=1780049021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=FeLQgG1JHsnqdqvZ22qtf9F2CAlxSoSlveQu3TB3+nS5LMHhGg2jDLyTy1cH7nvjPs
         6KkANarKJqbWVrw6BtjWZnSESZ7cF3drpC40T4FEHqZSfC9Pq0VdiVCzyWp9i7pCJQv3
         WUeE59NXPX3kRuaHZCnkmJg7fumQeCSZ4nrl3wHMtvVIZrzmRb8is1uFEW1jEAtMWd+D
         2jtej9jP05PQ7M1pUDvk1bmKMSam5a4QqSZR+jq4Fv6GGITfKwPGJ2G8I8UplpAozYB7
         incXhivilL9lHpGJeah92xtRLzqyFVDzBXTOjV/v2dWcgSw0RJ7bdn5pfsJyMyuGW1Br
         Zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444221; x=1780049021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=YxlhcrdH/yTdTuv5Zadriw+H483+UPKJopJx447wgpQpQfJxzFqu/9l01vFyBoxCnu
         7KTc+sW3yTzx05LuMeUK3siTgjL0kai2HTyDeRRbc2PtJgEJG1Na3WRuKVcgY+ks9eJn
         AQyUVV1b231Vv2zazwwXJGGT9n+/AuB1TwVRcLnQO16mhjF54YOsYgN+ndJvQsnWSCTX
         MbSm/mumCc/XwIyH6FnDpoQWVCBmzMEEANjd+FWNIORN0iV8Ap5m/djC7DVwShCi23nJ
         1YO2BcRGtDz47u9foYzjk7pbLtJfM6ZCiiFZwjYhrrL8UM4hTUoPZ5INsDPBDsj3RtjH
         0AXg==
X-Forwarded-Encrypted: i=1; AFNElJ9CScdKuNTTE+CQlNAnntnwDo3FoGVvN1W9rdfCWGREoqTVW8FhuDBJBLKoy2QChdLTYXTXpV/NqAQS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyq6FwG0S9mKOIhM3S2XVMw+DQGlmsTe4/llyG/tjcoSdin5BU
	Xei0N4HSQPsl3FOC0px6yFtxviV9WMjDmfKJRd9BF2MZqKwNSbcLAmmG
X-Gm-Gg: Acq92OHB4JE4TCuYO1MkRw0P4Azi/SjRNrPWXk7YgK9w5zgG7op4kzKyTD/mxRmaZJa
	N8ghaFQ1Q/M4DMrNxDxADyBg0aF3qVhlvUVp2GlkfHv4M4Dxopyb014Ozalbrc6pAMl0eAFnBRJ
	0icfk2C3k4L1INrb5KFOUwjKDUcIGNMzI0BnFIqbSW8CFIEgAPqi2ZLigemzO3GtZExg9ZoYh6X
	nE8zEWvzZ7hX4HjSLytpu29sYj1fvenM/mJvvqQ9unn2j+uypSxuDtzAAyiD2uHp78sWlMrdDed
	Ht2dMWbwP9bsB9FKkrPVWDTilgShcdcdsettNaChQV3BRmwIDrFLuEpdGuBlpQ/228X/QTf762u
	RAajdlcA/iyIHs0K+U5JXaiTUqgW0jN08qFlz//GOdLyF75huHbFDpQgOiso651Img/+8JyMICn
	1JRmOrTwFXzAuSxnseG5wgup+5ECXH+8X6o35+pXWe4Oy4rA8zD04zJQsBxg==
X-Received: by 2002:a17:902:ce92:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2beb06924e5mr33628175ad.29.1779444221237;
        Fri, 22 May 2026 03:03:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Fri, 22 May 2026 17:03:16 +0700
Message-ID: <20260522100318.73474-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The clock descriptions are currently swapped relative to the
clock names used by the driver.

Update the binding descriptions to match the actual clock
usage, where 'mclk' is the controller clock and 'hclk' is
the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 502907dd28b3..b174d7498029 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -45,8 +45,8 @@ properties:
 
   clocks:
     items:
-      - description: clock for SPDIF bus
       - description: clock for SPDIF controller
+      - description: clock for SPDIF bus
 
   clock-names:
     items:
-- 
2.43.0

