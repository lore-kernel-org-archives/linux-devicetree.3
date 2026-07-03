Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDE388885
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061500; cv=none; b=c7t8+WJmvciep0MKl+afGCPF0rVql0P10K440adxhJ4nRZTlEgovSXm7YTTdJcNUa4nRqvEuN/MjeVce7pEDucw/ZdFPRlZ0kTuhLrEQ5Tb0wih6SuTMl5h0dHPZ7vNgqiAguSXN91C7mQxvos528Yq7eIAuQSaGSTIN99UpwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061500; c=relaxed/simple;
	bh=SRq4aV3Vv1KtanwaZu/HUbm5QTW8rISjxiq71Wm2JKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k76o0Bc0w+QHT1/uq5TNpFQlBDXau+/P+6JJwVPb8l3hK0gLpii1rSO5XSnJ+JermeZwsvepOJBg4R7Lz7NFo6mUjfZjaAQ1pBKVsFoVAhdjWLqN/w8fJwaa8BlEmFMGL+HKfl8rQDXep6kjYB0jKrVaLzhaL35FfMmxOJWCwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MuX48u2Y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MuX48u2Y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c125ba77577so15994566b.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061497; x=1783666297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=MuX48u2YK44rwe6SuORrEis0CAewctos87BO/vSCYWhdNiPMaus76fMZyNt6p6NnXX
         J61dOZkyN9eV41BvgVA+jXZUI4Wo8HTT4tm+LHHXNaz15mAFApOpj9bZrVQfGmmnUahJ
         wOEjcHiUweXCahuwrV/uxnNi+gLWoHrtn2rIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061497; x=1783666297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=rZkL98CxzHPhHc3up4bmsRGlgUuZ4VVy4JsdS1jxwibkKK9NvLNUgyjW7TZEKjIn/d
         ay5JxwEj0dVhMG0VU8JXhvnOcN7hyzVOmz3Jgng4VZqOsHhwsySxrmBoF9eCVhZk4E2i
         LBvORJ8BLzBZ8nX/Qe/sLHiAyfdHQVufWNd4lKT3EGLMu/+40YNN17/mkUooFjBLZ6nR
         Y0/nrOCRZDq7K3Opkifj+KeFSM+gWhxnaXfxfFze2absc7tFZLvvGSsNf0aee4EawJo5
         dhUp8iE5kPzy/ZvdGLVXz7b4qwlUVdBjEV64Qx46sYYwqiDl+IHNgGmWcn/3ERWP1rIW
         Q7Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rr/by8CNzaUBSQkeTenvml/GIrUpdiiZG6GYV/bLm2BitvYQ02GtvDUTGr5vTCXkq0H3N7uhFs0lLCm@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEtVRTGZwj8OoTJTw1ajZYd5YQGTj7Z2AuIfb4NnPRhT+D0tI
	4UhRDwh27z9xGsZxww6GiUttFnGWmcpzqJ6ZIXS6r1kdiJsUFvcMsua7IoERp9HjuBk=
X-Gm-Gg: AfdE7cmdYQ5pGvX2hQk+rZBz4xhfGNdquOCz7kBBx4Vdzz/WXS0gMJcepJoqlyJTI/M
	IT4KisomZPkfxnveFIvx4l2AF7kcc1xbzpaLSsfPUYLWmb7P7HZKQ+GoUG7smCxCkmD8+dAG7mH
	+IM7C8BIThFcgXMpfu3roLCG9Kz94PjH/BsAC8gVzKt33LjGfD/pZTIBUBjTUAgqA3vpfcgnmZT
	0ydXiDCm35boJ0SFIX3Iz9vsHrhZ+Tli6nuRS8SMNlvtyl3m3NMV8hYuX4OuBVtvrDszrKBRMT2
	TlF1Yekp+6JL5uMXRVhygKsKsQpyivHoq7N4by4fLmLM5Uw8tnSglsugzTYattZmoP2XGaGR7+i
	1ru62Ot4MpRLWJJM4n5dV2mB3+iloWhEFj5m0QZpp895aQF24m+S4hTuK4PSuXKKdebILRf3uaS
	6S1epyxlpKXSulHJXjTop55n9scvMsFZU0PZivIQGBM8HwX8loYGOWt9EMyVLp4VbZxVb2y2FQm
	t0UkNFLvatbUMxMh3ojcQ==
X-Received: by 2002:a17:906:2091:b0:c12:4c5b:f170 with SMTP id a640c23a62f3a-c12ae898b32mr296340666b.62.1783061497131;
        Thu, 02 Jul 2026 23:51:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Fri,  3 Jul 2026 08:48:53 +0200
Message-ID: <20260703065110.1433283-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

