Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4A390981
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268615; cv=none; b=tkKSrE5syNFyMlFnZzw+BfrnR4PPIg0S631SSe1zV3yKDDz4B9PDiFsojFt595F8gIbYgvjIwLoMUEHlKfLX+usFhHp7epgaYvqm98iMRE86QgkLbCRvwA9b4E5WadgKH1sK54wFJCYsTQ1jBSj+XfgwIyqVUAQEn1Ug3ragWi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268615; c=relaxed/simple;
	bh=DehrlvGFJbgB6EByjRUCSsgYcA5AqtbttJ75nffiJL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KLhUzWWOuPj2+9PGXg3P7kNGMa0jbBfyK7+LOjdRkvARoiyeLD0ifPVetAEXQ/mpzh1lABglkUV29OKevlo+CcUAwy4nahg9+0Wg3watq/DIEMf7oKsjPa0/gxQNwiLgoYDGH+9KGC6+tnCNdTZAFNMvtx9gF+SokCGcjvBLWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dct/Emr8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dct/Emr8"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-872024e2b4eso158037b3a.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268612; x=1791873412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=Dct/Emr8TYxbWWRlwrxQ98zQoy2taOIntE1DT7W4M2qZf4d3amQ+lylqSnkxLClTKM
         n0eCRd8aSQyz2oXZhKDcW75A1GBbWXlIpC2SfTwZPB1GNfpofyj8vYQPVC9aG9ezqk91
         tJlqk9Adrdr1J8Slquo+sidBPe8z2+YG7nW/WjgvM3AE3ZL2IbJ/8m0PLlFGUsQZfOBp
         53rRGMSeQfPpNLZBLDABu9DURSRPyyI4TLCz8IWw8TzE6lhcs55tKwn3/xCXMHWfEUAp
         8l3z8eztgd4/N7nwSkuT9W5vyaAu6LQVmtSJonsRArdKpfoQDAlyKI4j3s/4SI8EBDh2
         FpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268612; x=1791873412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=yusZZZoOP8OoOUahXMJqNBa+lR3pdSi4GZxRkDGx1uH9D0n/yZYLMtY8Ewcsl2CTnh
         yYknGEry63rE9BtORTM76fxv8pfw5XKlqNosn3CG1HARqLV14cusJ2/TUb70pZu8MGEi
         AisZIOqQ0QXIchug+3Bhf1aKD7v1sjqOr4p3l6fkBz0VpZx2dk/BemZ8S+95vl13BOtG
         ZpnXQ2IbIojh3CBBJx4ouACt9cC/zMJTBlsO+UbaUZA/ReEyQTNJSYy+BPtqF9obNV3M
         /0vSE4/mwG4O4TEsBsE5SfNDHzmte5YYnIwfe9ZIFkFCY3PG0eztRig5bgGSIb/+Iu1n
         3TTw==
X-Forwarded-Encrypted: i=1; AKwUvBwPTxjwh0iioFN1GLMFi8IzdfRSy33maxfgkktBvCWflbTJRlQDg6hjfn/IakrKdMMjH1QZmI21BQOy@vger.kernel.org
X-Gm-Message-State: AFuF++kL5lfTmYRpMW9U/N3w7VTyA2Kfr8n05nTdg20/VO3KdvgVdaWi
	xWdJ0PUOlKUWDRAj/UWdGievqpYESq5zAxeEAhttWqTRhV/KUzbGEI+l
X-Gm-Gg: AYBFou2NfVqQRzqX6wHkblTqmhwbZvWx3JGNY7TV5/VjrTO33ujq38bZ3RUw/Xe2wtd
	ODoYWoQHZcUCM4RoboN+MuCBOzVEgfm2ht36VsvSVRe5PU/11vn6EIERJ88sWpUZt+YJGiQ0HM1
	ravuEt3aPa65wSK44SNXZ2vCuaTcow14vyHq1WrvFRMPrnS/s4mYQ/lrX5qOYJ4z3aKAnvS/wZ6
	5CNTb1kPSwymwKMDRMsdZN0r3U9D7esYYZ9vm8W4a9698TLwwP8DXQ1tDV9/KNyuz/2P1VVazTY
	8vkTkWRiySH77UcALaSV5TfQcORtYaVwojHVS2WSTZRVo18RtFwJGERXMCG1amMiv+pQDcawrgc
	hdHs4/Hsk5dH50jZfPacfjOk/TLDbUBqd/zYml5yOdBWsOBRe+CN5QjfGJaVVgP1EFcpywuGEDy
	BaYEHZm/yn5iKZZuPc4rVqjst4RpuNkFtIYM8gk3fJnPXdRUbVQP4Fj1Mc5NJ3rDGvIKCDAcrAE
	wNH3bpB0yFQNEbOEHYAbJ+CheGXrvWYivMRzDpyRT05V289XKZzN6L+uLmYDAdEK8/PwBwS
X-Received: by 2002:a05:6a00:3689:b0:878:6ee:672b with SMTP id d2e1a72fcca58-890deacd37bmr383696b3a.35.1791268611801;
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm4340790b3a.41.2026.10.05.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH] spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant SPI example
Date: Tue,  6 Oct 2026 14:36:43 +0800
Message-Id: <20261006063643.198830-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

The SPI and QSPI controllers use the same Devicetree node structure.
The additional SPI example only differs in property values and does not
demonstrate any binding-specific behavior.

Drop the redundant SPI example and keep the existing QSPI example.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 72f2e1e1219a..9ee61f8ac4d6 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -75,24 +75,4 @@ examples:
         };
     };
 
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
-    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        spi@40600000 {
-            compatible = "nuvoton,ma35d1-spi";
-            reg = <0 0x40600000 0 0x10000>;
-            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&clk SPI0_GATE>;
-            resets = <&sys MA35D1_RESET_SPI0>;
-
-            #address-cells = <1>;
-            #size-cells = <0>;
-        };
-    };
 ...

base-commit: 4825287f6d2346e9273f35a928d1ef40e68bc58b
-- 
2.25.1

