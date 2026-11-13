Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581852;
	b=umV7e/wcIvoAbea+h9yfYj4c0AKH0OWtdz4zJaa22XEFxesoKzN3V2xWMQoxwt49zKJZ
	 SeESV1fWoX0zD7PsdC6syZ1lqQYFJLBkNOsfjQgNfgqc3O9sIpyC1cm3lkmGotyPGukGQ
	 93euSJFgRQhb4/VPzjephrdqHZEcIzQ/GI57iJYgX916ucBG7/8CuAv7DOKr1C6NnLP6M
	 0j1noNKIySuOjlBn6a/p1aifwDm9ZehYR4mLlZ/wI9agGJkBlL5QA0syzCN0UR6SsCa5L
	 HMtJSTP8EwtM4o6bJY1zzzKPs4x2piS7eL0sUrkF/0s4W0X0DQVxYWSzdZy3CRw15aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
	b=NRTTsWm+oCHQCI/fHyurH0KJtARyCib3pYFeyps7EtCGm9Z7PfD7QvrvcnjPAPVEaPvx
	 H5a2jNj4wACNx8KZeaNng+QNoN8vQIUEA2A3JWILzliMO8pbXGtQ6uSz4wuvFIBV+g9Ng
	 39wkZRAyQ+pbLkUheb4+1cnsusQBA+sgKeIrEf0+KePjL4RIEd1653kSqrLOSSZ32FcVI
	 9QIQAGJihkqORjfaGHShGl/I6XhAvS3ouzmqJHTf/J3kQ1rEjRcnmrw59j5NIhbsuhUm6
	 fH/as9GAAuS2TISpnNi8mw+QTHYf1oTANEf8yO41yMUW7qO+7Zuf9GuSfjdbaqoYgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F91606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50aaad19fbso28217266b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581850; x=1795186650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=qSb2TeeOfqYxdl6INNgy9h3ub88SEOE+2AMeoT0Z55svj9LU059duuYDeDe/UJCXSv
         AFZgdxzysj61CAKRHItHwf+pGcSkwW68urD27vAfJgJZxQYaEWT0x5hE6VFZKuUzkjeE
         0AArkzF/A7J59tylHD2hVeJOQmmQQps2GdevNPBJylx2fQQlriEwbTam0MNTyZcZz+EF
         XEJ6CIlcm6NlB8CzxG9PksLd3PCERp16PL79CuBZ1rQD6261GUYJ6upd2nBt1at3XZsY
         OI56TTWG4+V/zEnpup1Ku2pmPCaSKGDBD4vSPqUZdqVGNpQ6j6iLzfSlC/eilQLhEA3V
         U6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581850; x=1795186650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=Z2ZbjKSXSvJ7yPCmOGjwZ8SG2biADJpND2ZyxhEo1LoMwOk4sNNg4FASe/VO9iVEVH
         iiN3FVxxYwWMrU+Sa/+FN+fBvkIj9rhWEmkS7+hml8gPPKUYthP7a2iKuV6rwJjO4BnZ
         9/UCGWtmaoYMmukcH80YD++uVBV8qPhFEueoqiaAbXkqZPT7NkjrKmWyD+/r3KodE8eB
         BXficX2ZPtZ80yS1h40KPLcr0l1Anz08wo5JiOXAiaWWsKNGN8P8sdEF9zn+Kit7h0t7
         0W3I+6Kn8nmQlGXR0sJULe/mTFPcOEXInCKZuQeM5odsNlYIN5z9SweXrNP2Jv0c/kgy
         2oGQ==
X-Forwarded-Encrypted: i=1; AL+hErEVVU9W6+a13p56sO/DrxerTdTMzA39o8pmjcqJfa5o2jzATrIvFKOT+a0qVqX7VAiXKUNWqFs47Fpi@vger.kernel.org
X-Gm-Message-State: APuU4Z/7i443vPq5KGran5uUcK4nzoNxT1UbjxB2eZy14wP8oUNSkjM6
	gy+oTS7EoZOfDDhciV6ZobFhk0iyqo38Z/NCnVdknU65E2SM+LEKnpf4
X-Gm-Gg: AYBFou1Zo2Mr90VZTwB2qyty2Y02rews0ABx/IVLzMU+M8M74NM3MWFR9PxYXcamTVh
	r8TaLJ8Z9fHlYSNsJ332yJ2i8cubdsELDyRFIDi6ZMONMRelm6e8+Cb6iXK573WSWrDoT+gIiYw
	1jH4gVmZ7z2t3XWpuOZsLH6L7blb6bOqOgJwuTID9TTqM5Wfh+odsZGP4uTi3V9vYTIZ5ayBU50
	8TiTEafNjSGawLTbl1HmWHGhRfgU91UYs4wGQiM4sAeeQfZ/O5Z8fIi0gRLXPk/WaAJLhUOAV7U
	d3JGVhjmb3gZPROoHFI03nCPNaEryE1roWQ1WFQuQ7Cw9ZqWZccqZIYDCB800VJKwimMLXNKOgD
	IC0Kw5InpapgEMp0p3zacgy6pjQAHLhuyFObQv2L/08Dn1xeoKpaec0rJtZV4wsdY8299uA6ZoJ
	eOBp+LuR+7QrbPIv7quaoBDsZfnm8AiP6LW43oALiGw3BNxVc9pcLes+bRWGZWWA6tRuReSBa43
	QUqhgGXQ9B1kUa/AHiqS8mrTY56Wc7qn/Y2tRtBlvg74bskZA1BTlJJfgJXH4s/FR5JGNa/b+FU
	mikI7h1F3RElsPTC1vz9lnlmYsU5DzAV5Jzg599Rb10SUi9ELs/JUmOqsqrmC3i/dpx5jo/qkkM
	XKyHveLbnDQ==
X-Received: by 2002:a17:906:9fc7:b0:c50:521f:13de with SMTP id a640c23a62f3a-c5096543e9amr251235466b.35.1794581849950;
        Fri, 13 Nov 2026 06:57:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Fri, 13 Nov 2026 16:57:07 +0200
Message-ID: <20261113145708.261530-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

