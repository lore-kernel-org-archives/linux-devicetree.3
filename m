Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3620B80B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329991; cv=none; b=kFZOPJh++tFiUvSCvOgRKOgBT0xvC+FGVMBkUgdYMt6J09E3hGZJHeH0CpwKnxg5NghUqhvPMVLFbdnZm3hQL29vWtBdF4qg1XKe7+/hYTA9uJx6dnz6cihbt7IACLXnT4s+BfDlOFDbdWfpRaKYAGT1vHCb/J6moC39EeuTU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329991; c=relaxed/simple;
	bh=AlIbcBhxQY5tdoRA+xhInIDubeZASOSXqAsfI1siQbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7N7CfAymYpgslmzMap9ekuI9Wl1T831SoIaMeYmRI76YxdmDWOBAKPBmpFrCvV90p2ecZ0OGeXh6dSJqXdq/Yyg2MjX7P4Pz5zV464A6OWs+apIqT2owjNfqZvDsQbZ32fcB7tGKO5altTFUzOREtKdONVZ62jfyT7jONhEXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1UfGYn+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1UfGYn+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36da8439078so1253417a91.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329990; x=1780934790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=A1UfGYn++VqMO3kBhQUoCvk6/6MM2huO+kiGuvyO2lGZdSJ5yD6PPiphDtKCzEVORI
         8S2PP+gn0aPGpgVMwparvpTo2d8NqBwlLkbKcPzIk+c8r54RaX8+94Rxj37FJqTf5KNk
         jqOG3A9pfIg/TaupQuyBkWjie+egDZtWa8kWNTisYRilQfyDRH8IGoK53DwlKDqcoDUN
         B6uTAkQKLOurpQOEaIVocZAldl/3u4dqcGvTQvZR7TgWtaxmTTnuaaHp28ugqN1i3gvw
         2GzTGU7kMXPxbJmySSv+QO2InCOwGvAWguwBRHVT8IEMpsEGOX1/VUSsYY1ykKHl6Ydk
         FbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329990; x=1780934790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=AcGe4qkZ1ypB2ePk8SWbP9uTOi4QCd0HlN/J2uhLxWaO7htvtcDMr1kDj6bW9X0dM/
         zbXznBpijhoj4cUbcyLEFdiK04VxrJE5+0ZkeC1MSHsfw5bTyQp+6Gy2KOh0rGPAvqry
         hbbvnsKYzBiyyC24qnXj+zJvuhx61ZxSKWKSDHq//5k39l0eD/+TamBGQdi9fxkrCBvw
         RiIaaCIJ62lmu3/X/9AlEooNM+N/KrKWxDfl5DUv9456hLp+S+LNrTYy3CrTKR18OY/4
         MboH6EYZVWZAa7ltXHIaZ+7W3diHsXWRnPfm+QE6gPgVxxO9oi0Gjhc9aWSRIrrZLRed
         8HpA==
X-Forwarded-Encrypted: i=1; AFNElJ/oIOlESrRF0kHudGndz0Wsm7orKQNngNEx+utRUPD7IwVoh3Z9Q/dsre5bNC1/TSb3wYrf2lB+EJ8+@vger.kernel.org
X-Gm-Message-State: AOJu0YztfCZ0gg57ic9PE8saS+ywA25QfT+nYxgRiwTIJMP1BcEKrf6v
	yhnXVxuyeDH4Gj4Ay1P0suMl+d+kVO7CGnZrI4mIT3vRVqQvYP8whpDx
X-Gm-Gg: Acq92OFGYk38LfIIGDrdSWFilBsA3KkBtq0eqR7CR/qpV/H5566eUOiHLtBpwWp9ObP
	3F/T/LUcYh7FFs40ymEG4zFsUGgfCH59PUIIDPnc9/50fXFDD6iEpFAeVsBjHnbltckllpHqwcc
	4FYBzPecQpGNiJa4P5Uk0pkDUBYskSJFGg7/356L7F7+Pr0K5Zz5dUbbnQD+oOYoHD+cVzAk9Ck
	Y8eqMdq9qi+A2r7uS78Km5G4DBZVs6jvb0z6V5/W0EOjsvLMfOWNob6YdPQzhZVW1vMpKEPw7kl
	KPz+iWa/FwOFURYC1kYGfQ1RekZwXMT+NWfetxEWu4tvbmPtfXvwFRFk4/KzZdbi0IqR7Gf5oxK
	ZYrXCy5qC/lIw3iZKIv+qERI0ysU1Glfa3KolTaCoqLDx8KZfvqvvT1iR4ZXiJUrar61GM+AVRE
	gf0fbMnDULi0eh+MPkvPZ0djW05N0Atd1tirrY7fFd
X-Received: by 2002:a17:90b:17ce:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-36c4ff0b6edmr10563499a91.2.1780329989691;
        Mon, 01 Jun 2026 09:06:29 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:27 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 21:36:01 +0530
Message-ID: <20260601160603.167706-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601160603.167706-1-hrushirajg23@gmail.com>
References: <20260601160603.167706-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3

