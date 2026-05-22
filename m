Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B12369990
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456044; cv=none; b=nqe6tn9RNLgiVUATvXIJyHx1XOaYC6gWOlzm5ybjuFx+juCuJP+kIPdjo5ltRplhhTjvZf9yyvq3gUOitvf5tjzUlrrVl6akExUpQUHEaAJsUpJ+ymwLpxS40tdYmKl0Ih7Hw6iDb4lLW4SJ8JZzJ4oNWRVMyU0xg5DWTHRyUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456044; c=relaxed/simple;
	bh=xChP0+PeorC5u7ydzAD9QaUHKklzoy+4vL9/vem4XhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4w8znLMj5/4Ukve3VSaKjnxWGtRJs2ZCYbcPpnkldNXBHcKWsmMwfUdRLrt02GddWT7SaiONo3WSwjemWfNNYlICqEAQ33zCjPHlxZL7HK5qlIYTeqdyS2YEBD1EMU6ehBOqjpsOJ+RDKE+ZtSYBoUCUAJDIe1FWZlHNBJB1WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+SkLsze; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+SkLsze"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64293025e9.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456040; x=1780060840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=K+SkLsze9NGUUYssjGtci2RCaTPwWHqENBSvWrCpeni2spPpT46JLhEWJYcVgTvzyk
         8a51OTq6fRiFDjvOeP6w3ieCwuM2iDcmucQKsVlH+XSYYbLI5eC7ClpIK6bsPUx5OdNn
         a7E4SxMmcdw3yCSTM5iFR0PDuQd09l2ypZ8cCUcFsrs7qdcz2fu29oAF2n+QqadqqoFL
         MeRauVZL9YifdgzahjoK8d5StpExH3p9Bpfy+KofGTG+qY2cStrBWb1r2QFnbKUp4sab
         Pw64XM/PTtOX/xKHCZfpR9Sy0rH5qtcA6py7KVr3kbXL3qLrKcV9UtM717Ioavw2iopf
         jnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456040; x=1780060840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=SJPul3Q7T8DICaYpywk/KZGylmHz7uAwsdzCu6hROhZUxUwkv+fMeoKLrCtCHiNC8Q
         t9QRZdHxDyRqlb9kASMfL+ll+0dTGn4JwG5DoG9x76NeXWFFQGXA5DX4IzebD9Ih9EzM
         ARp4oXagHN0fiYKOtbuT7mLqPOW6gcIvQnh2YoFVBi1NhuPaVKttKc9je6OOisqyyqHj
         tiYDjYJHVuRiefFkQeaaz1DtkubDKdYjVXIfPjytjwcM2ydCdiV5dhhFauBW3iGvwJna
         09fojNEFZsVtlZP6u7BjyFSuLl5/hLDWjI8pbvhM/HWq07AuHvQjcOpQMc+dnM7JzNIQ
         wHpw==
X-Forwarded-Encrypted: i=1; AFNElJ8o1uWEPh4b1g/GXeupYQgSIR2wA2M8BwnH55Y/I9d/KHS3wYD610KpkTV8rhWqkzSQ4qSuoZ1VwDgW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5C8dulaYiDXNWGxLWH/kjwzBCpyyB9VjQLBes4qoo8Hhi/48
	95n/yLcc7fud9cgUwsWiSS/X8kpjCV0JMqDJvr1OTax9woaLmE8iQPG+
X-Gm-Gg: Acq92OHz8r7R/Ymo/429uNe2pZRi1j/sFx7iqtFm4/yv035JirKmYWYZ02sgsxa+YCo
	bm+kW9iTzuHlmjgbh69huV6sFJhGj0FurrXbZAif2/LmN9xiIob4XEBeByeH9sJX+stsm1JgRO1
	UvJVWPuJYwaqd3D4lwn23aZs1rItZg6qBgvl98VyjU1C7L3h+YpAjHQ3bmY/JeBOejbWQ5iq1Wk
	phq+/RrCDukaTQ4tJEosF4UXN9040+TE5+Jiyhf7i/3MxD9nAgaJ1wv8tPSUcxJ+iieWc6l1mPe
	dF+hqFWN67c9k/Ng30uFaUzmv+5Wwsnxm/VdskPuobN7aofg90o8GAC+Ng53qVxQBJX4rFUxbMX
	2TdRm+95moTTYWd95eUHUBdRu+hjDl+mdCkAPQldLtqbkonX/XdwK9fww4PYdogPJCCwNLCORxb
	ikfFlXVL31M0SWvvgXip1l18vabl9eY9dv+l1Jn9C74A==
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-490426adf66mr39371215e9.13.1779456040467;
        Fri, 22 May 2026 06:20:40 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:39 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 03/11] dt-bindings: vendor-prefixes: Add Riverdi
Date: Fri, 22 May 2026 14:20:16 +0100
Message-ID: <20260522132014.226721-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0

