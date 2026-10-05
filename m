Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1247AF57
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232131; cv=none; b=pAeJSvmm1eY+ITxn0QvSE146XTM+h35aUtbEd966uP02z6P9NVrlPLiLcM2vjHKmThyjlbufjevDduyPPw4Jo5Z3vIBFY9yGcou7enxbKUhoD0n7cw8ltCmMuO8aPCcv0n/wa7SEikD4bPwlwt+VqTc8zT/L7h4gcfq9sPyKf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232131; c=relaxed/simple;
	bh=WNhAk71Qu8BZ3KT8auXzJe4ZdBz0usxwjjmPf0EUGmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8vzrxd3NPzhzbhH/rqL3Zf2LqJG52aF2sR9PmrTzAy8WqlWKrnx9Fvi8C04nJ2eq9wpAFfy+YDlfw6+8crBMRTOY+aiSFGqEV6t0BpTlXrVOxM5+RkF9iyGrznybqjJC2oHBonq2nBZmNwwhGWvAEHP64hXAw875zrDjDTXGl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHCXlquM; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHCXlquM"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af85996a92so1597764a12.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232110; x=1791836910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=YHCXlquMz3Ai+DsnISfGOCMdumjGDiY8yQas1zGAMp1LLganXEU+Ds/GwxSrFZTvz7
         3FvDzyICkAocLkPYccgUY/x1K1QayJKk1d2e4g6mxbu0YQz3dEO6J0E9UmY92BAlhM1Q
         4t1CByQr7L8xOWGMoAQ6ibMNcK1rQ580xUX/unbDZQ9nnVo0xJGqcGOEfi+kGuQY800Q
         jcDPDktA/Wy6/C6A4lV9JZCP5uWDTV/8CD+ioxsWRtw0lDA/eAbWN9r1korPRGh7eHep
         296rePZ4XXXN8rDdAfSpzgYv6ZewJzNaIVjTv9nXnSVeDNF/32d3d4pe66dF/1VH71Hk
         Z6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232110; x=1791836910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=grBM6jF15fxLxtXCg3iXxgqcqvkXGP5IappKf3W5r3DqVtkAr6RMm8L46jR7IMt4+A
         pFKnVzABoWRjSr10f3Tgnc4zaEm1roQsXgRPZgQKOih+ewjtH+N2rTaCFlYjjhJGAw+E
         V6Rmr+XlKbq/1LC5BbiOnuUAwwSiht8Oz+1fR+i0WwK4/zbikh4hmfBY2HIL8fCDRnPn
         EgrBQKwROGVPzequ6HSttCXuvwS59JTyZ7Latvz2J8rENr75W1ruETyv1fCGHmVxEvcg
         AHHJH8a3lLslkohWa8HWqF7F0omYQrwnxC+WT3Ix0PiKEKikFfjU9rE4iWGhG8hTiXvs
         dKTw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4E7Vn2stanBLzu0Lg5BXvnFp/JTr88zoHEpNh1wesdLPLmtvRwk/ZM+TGEGC4Nauot6dacHoNTrH@vger.kernel.org
X-Gm-Message-State: AFq9FYIhr3Zu2DVqGV+91cx4SvnSUq8+sjlVBjiLwBRLyQbJXmYlOtHT
	Y277rn4M5iBtdlMg2C2XmCdO2IPKKkQiCbZv23FLZP+MXzrJ57z0a9B8
X-Gm-Gg: AYBFou0VeOrbi9l61kQqlXEy3G4WmC5LPq63EHtUeMX7CW133lWfLgEFODEHoaJ/x4a
	HkiQe3sEG2PPgl9030G0OJn2NsdMerWHj15/DQoEr4+YNDg6yHXZPZWXeHVE1S35OZx4B8HVBDv
	TP/Ngj7JUOzBMuYzthNh68tE/WCFB2r+ZBOINTQsT/VnSuQO+p00jmWDBigJ2aL7HpxxhkIcjc9
	k5oyLjWiPiHW+HifPYdHbAqctrPLjMA/o0qeL7VqElGLRwZVObzeRBkWGGTal5API30ahNPOI94
	XrUgeIOInsKoNC67uVenF1XXMUJ91x6LLKF05N6OKMoNahB515NQITJ4gMn4caGlgwePq8dnPZ0
	srwYg0rhXEIGwLpphy+ELN7kPquZn8kRKlf1jnWIy5SE4gl6NWpTp0Yxzma2tDy8/8AmJ1sbEAu
	m8Oqkd38t95vggEFvX+/LRY6J9Y2f50wFCTOVoiy5wejTgxzZ/LN//SQr99rjLQbMM3CzA5XhLr
	65C72lo+B89UU4XwIh/zXkp+f2N/KnA
X-Received: by 2002:a05:6402:21c4:b0:6ac:7d58:dbed with SMTP id 4fb4d7f45d1cf-6afd834a917mr673140a12.3.1791232110172;
        Mon, 05 Oct 2026 13:28:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:29 +0100
Message-ID: <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0

