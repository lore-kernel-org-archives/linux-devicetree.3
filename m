Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303283F54B1
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114726; cv=none; b=abPKplMbwTwXYjM5xrMoy94fwb1ox88+vlxfix1Yj3JAYZBbcH+LyhkfswHEWz74BJYzVIICFge/8imz4QlnF0QM/3GsPCuziZGcockWJPwDTUGEpbVBhDap4vy/88/9DWaAdt7xlnfIgk8eqZvDmszluZfJSFX8R2rCYw8n1IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114726; c=relaxed/simple;
	bh=HVzHD+IF9w6Ls+sZG3tefX0bOnjd/9xlh6aF36AV/Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ub0V+368+Crm8i4DTRI8kfFTivZAMVsmrp1FaI3LgDQxjvZyrwEiON0lc74kBxX+oUVjudsYE5IIX3u4+JeiExd70j48lPoKWEjtDVM0AUVsogZdWBXCuwGWbmTBSIMA1+KnPSfHzlY/WdV3dW1V08fXLIzIF24Im0kj0qoUlHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JSDfldXn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JSDfldXn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so883081f8f.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114720; x=1779719520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4cUQj60Trdc2wuppwGbIuirXnqBXKiyXXPxr6xW8J8=;
        b=JSDfldXnbOYhD8e67iA8YOD9HMDYnErgIl8wZYtQAn6OioIdx7MbZFyPlJj9YEz7Ne
         WQdo/LH4Vs+qam766xbvK9IdP1jDAukhpTQjWlv5ZeSEGqtbz6T+yWQaQzoshPXuWwoc
         0pvIEA/jZ2ylqgzC+YeCGr6ywx2XNTi9J/RoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114720; x=1779719520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4cUQj60Trdc2wuppwGbIuirXnqBXKiyXXPxr6xW8J8=;
        b=iYzlm4o9GW+2DvHYFAgT7ulvg0p6r9IWEwIFiCMiHOYJxfskPQCfIcSBG4Xw/xJzZF
         fWR/0NxGbZa9xbrBcpczS7xH+QP0yxMwPam2tGDwHZzGl1g+8asgK3l9a88ITScDtrAS
         /bL75OKnW9TT+YHeIZnYyy2v1DESOMpkGQ/k2XHXaxM/70LEXpXB4YDmtUT384AAw5z4
         RyxPAC9nzgR3my+xKoixKair1hMrWcb+xeadjnPSXQ3iDcM47oqPoOaodXQDUiAZbHWe
         HKvTlkEk0L3LCN4OOpj4IWenkdrA7plsk9kGK2fe8eTcR0ZJmtyMSWBc4feV0uXm0W9m
         qkUg==
X-Forwarded-Encrypted: i=1; AFNElJ8esQ3YwLh+1SbkvQeHYyz05end0sTLFV+JvtHnAlnB+0x/Y/EuuJRfDjeCQIdoBXErmPdTZXieXkFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXALtu/2WP/z1cLnaePP5cHJ/aIeLmx1vpfw7bkAR9ZSeIRme
	YlRo3Gb9DDHf1+pSnXTvCkq07mU6BXZCxJsYI7u9+tntOlHR2gvnWKHNSm7cZEUIefo=
X-Gm-Gg: Acq92OF+hN307UMn86IvzUYpK4dx65Ri8nmuBNVNZtSI60IhsfbRvOqmmDltZh/38Sp
	MjUZAHgfadvWA9gGZBemOCkNcuapsWDkjgZteyxziwKVwvjTpPNNSUZWjqSjUniKYPf+3j+vtBv
	Pj/xAUCDeakRm6+LysuPxlRTTMKzNK1UETlWEnRZE4qUrz7TLj0UMU0O+6J8yDTRtkeVRGNtB6M
	Qr9s4DzbgPnIST2732bjvcgMV+43bra4GCFX+SbBvu89mNfJZxRXTIoOeLa7W/ciWePtlp7sdw4
	wZ4XCDkEd2IiOom07yiGsr6otaKu0ZYEZZIC7l8MAZN8qv3lvEl9a+ODup087HcX44OvzYajWeo
	ob/N7w488ukmsXcXlctslbvuaWWIk+h9u3FcwseqasuEZbSYNZveDGHZeEDZOIkHuullf5jZ2JI
	sOEzYu9gFTtHYF8qDBbUSkx1IfM3/DUf/G4I5Ee+mBdZmZZClJiQeDglKLDQhFujA2e/0EVTxEI
	CRpZH5rcSGGOsbHfTn155OP+HK82fQawQsMrfdEWZxPWBD8
X-Received: by 2002:a05:6000:1869:b0:43d:7946:bae5 with SMTP id ffacd0b85a97d-45e5c60d6d8mr25547861f8f.42.1779114719561;
        Mon, 18 May 2026 07:31:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:31:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 01/15] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon, 18 May 2026 16:31:16 +0200
Message-ID: <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

