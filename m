Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203592;
	b=4s1ukSl1xC6qnQq6wGG5svBtC9Nhp4xrMVIUwnlBd8o9OgOOyMFjjI68cdwvK171xebR
	 cdJ0mV7QfBrcvcNcbZ5zraU5dfuYpFk+5c0qY7LxXnvPQ17T3RKjPP10CA5dq1sDXAb9T
	 dT9A/doCOl9unw1bUMJGlliBWGqhrjIh7Ip1u9Tbbz4PknOLQQEUPA1nSmTIAy4ZKHboG
	 Hggqb7njbuZT3D/i0dpWJyoLdq+fzSwtuGj+xNRMMgtrHKk8/ulYjyw3njez6ZPmaU2gM
	 lVSbkUCmt9Kt/ME06NSbIOQ1o97vkxl6D4pmGMSsVsoxvB60PjfzFmsAD63sBnaPS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
	b=v38+bwNmBP+qu0ihrYqKqf5Pfy77QW3/uwStZw+uMd5DPU3gDvrmFujSEo9WXd3rZAoK
	 /rPbO43k0ZpAvVLPW5XRUi4VQGqEz46KBKQG/SxeWim1FGX46EjK9Bs8XtzWXQgPJIivj
	 9NwFrqZxOjaD7R/F4f7aOuEnLsRWRFyMol8HM2FMuoJYFVclf8CKgRYdWWyvULlUGOjgw
	 ky8kQw7VT2JgNAw8hV1Sq+u/NwAK7Jcu76NAvVj5nQ5NMFMJbNlmVcdaNMGIoT6K8aTu0
	 8w08mKBNfQDJ70yIsipVgG33b8MctMKD9H5GzYaiHp3kXd/lCobCVdRFe5ODLQJ4BQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mX2vO3FY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36860A2611
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B36860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mX2vO3FY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7755845e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203590; x=1793808390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=mX2vO3FYnHDZl/aSq8Rl1okNk3szjaAEGBAdFyXIfANi2eJ3tIOK0tRXggIUspgJmV
         DGF2iZxGghby2FdsmAp9SWkyCZgaWZmWtXdUzcimJBRO4UGioATMGetZwSFHZbQhWtuQ
         7XUrgcxi3JETJF4x64nCoR5+YQMJ2aN0FMTaAvYObBJJpLTadws9zGoihr7SODscq7b1
         LNXzxEh2RoYYwQNXNeZ9FSsursflhr8h1IKxZF1Cs7Re1P9KolYunddpyBkaPCRw9fvh
         TPkb0vPc0Z17qJdC7CiMntAUk0jinvtSb7LCDoIDqhokETAw6//mM2ESsqVXltNzCGq2
         uNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203590; x=1793808390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=Wdl2bM7c9Qv4YZF6enXddVn6NODjRjNibytuJjC0In9qwpZTonSpN9YexxxM1VeQ7r
         vXr5I8UzBWaMHj0NhKjdQBBD4jZms5WKftDXO4AazOyFoIzgPY39Vw5I4dSAokwBF1vi
         QVu8q2v5whXQNkxBa81w3dCMh5CfwGS+oSKwAHat9g1kQ3VpWKXuE5cK8S1IS2M3W3f0
         PH9Zb7GSnOnVLgEE6IGnbnKq6XXAmdcy510Di30g9c3SAyE84reELY6P3sXhxDg+UR/9
         t9PtkHB1AClOWHQKyRQCPDstQlVk922mtRcQmBvWTToyyVLmMR0ieJ7+ffkHjI1tOs7x
         8n+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBYu5VVTvd5rtDXvZeI+ggO7D9aDtuKwZpIdsfnbwLm1dCUpR4Ft22dauT+nALjyYx3hKzc3MAjp/X@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Po42JIYvL9wl6TOIjJvFphVXhAFHtSeQrbwVeU/43NcuriMC
	leIjLkzKOlTMhr9+kGOTgqAwshDTdwg/NuDGZdWFGPnB41IudRgvbwhRK6coXhIvbflmQ/xOnf4
	ZCMKLX+2qpA==
X-Gm-Gg: AYBFou0etvwd0WNK1EFrjzeXsNYo6UNJ4nai2slH3IKft9vMRB6vss8cf9sbecQ9TWx
	Q+QzxWMIaRw+1n4yPNYvMbcZgPQqSwgA5l1tT7/0GCRKY+7q7vP2Zlu7vhUF+7fCLDFgquM/VC2
	h94tLVSBkZohMFLzDDGwQQ3LE7dgzsdA7VieN3Qk8t67LJnxjgCpIGqGXIP9N+hED1OSiD8xGH5
	9ozWexcH4US9YUB+p92vFMcNbbwNx8RSEXNl1iB5p4GXaRU4i/N/EogV3SOGeBTUXbpC+vq0li1
	eui7+mVyZ47O/SasnS/UMakUzwTGHwbHIzV8Uz99MY5KIqyXFC1vmHgaVmI36gZjwAQ2tv8m/pE
	TS6kAokp+aOtOhrbFBDVFxblAh+9mNaJVMDeQV+k1iOD68OyaYjckJ6ebzWYu+W/MPovYKiGJi9
	Wk7Yv9MIhzlCF/lU8Aa6soB0yBSc+d/kigyfEP/5jfBaDQrpFU+ES9QzO41eDv0biOzQ7XKjLz7
	mRKbMfjrpFi/wFIYa0uNWAKFN3jBtf2mKPT9/qHEPcSuow45skYy5hBA2c75hpOup4ErRLsUmRl
	ETPiDlP9CnNxrZqCaAWvCBU4toTNjv21uqTMqhLA4jUjOD0VWMNaAJGgli/ex9+qoy8n8in7kvg
	Dr/gJlaoAfZWxhIGvMrM2JY9RyQ==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr41899385e9.16.1793203589613;
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:06 +0100
Subject: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for sysclk5
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=Ve5ogxnAtZbereXXv0mgHSa0OWS6nuHnMRIs7juPg0Xxqcdyy48+rKoPrzs7fTTee5kOME2TL
 uMCbLUMJEGsDSU0zMp4yL/ovJSLbJeyb30romwpOuisL69qnsLoYj5d
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0

