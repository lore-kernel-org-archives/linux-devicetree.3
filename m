Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841382;
	b=NEuxof0B5Hs++0s8nGnOXLRW6uW9HpB7K2EMiK0MQkxTrZjkthZF4TUilqfua13FDRI7
	 00BSPfTbURcK4+9CwWUzCx28s/g80OAj01iZaM5axEguE/FKv9auwD8f0MFbwc2Cpa1/j
	 hh6hwIxz9RHew3V/qxrueDBtQGKeEzuDniaZQzbtWWV3vu5m2lVdpZ4Rja4o2Afxfv1lR
	 4HOIF2XKyDxOqNYjFN34vHNencj2jW6dY6tMy5767qif9BrTDP3Vtrk4UQvO8qOLKVohd
	 xcsu/uWU867SVO+u4k8RBHZ5ggh00SXZNr1erk+KoJvMUrlZggTVDGfspsf4griSTIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
	b=DEpPq34O0t2Rd5WtCzaKwJWl+PsQvdWeWONJ5kKXu854Ncn3JSZCaJx4c/ywk8HbHBvM
	 VSpXU4YXF+LKyWbVst5U5RcS1tEtjFHj0xfQxTmNylu95JDOdF7M6ZQTo3Y1sF9XiCkCV
	 ZmTe7wBW72pRXZehkXRMEYEgv4BJryH2j2Rp1ZQUN2mP4pF/8AcuygVBPnr9FYvojmYSl
	 /GL/bGd6X2mkrCu4vUR1xg4zdTG9dahPkxAYRtLmajjd7jmisbTOf+g85dounZVR/hZBG
	 akMjNCQyaekGD/FId95grvJwoEdWtSaBqHW1yUUFxmsRD9ld6UVIQpn3oMY6jCH09mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799DF606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799DF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cdc606b47so618414266b.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841381; x=1795446181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=TPfo0MX5/qR4L+XUpwvsAIulq5SLhgctltzs/MtnrLc94IsHZh9WyYogU/a5Fo090J
         P44VtWX2wvpxPaGAuNm8bNS0K2a6KFZy25TiIU4NwSEwwBebQhpe2WhBJ5xz30Nl5FMm
         BRteK9fkLxsQEf6pvhNlcw55G7ooH2VR2xkHw1vAhq40GhVQ/IxTBlowyywiAzzYG4Xv
         KdlImwY5zYQhTScNfcNar6QHZSXTorGI4hKl5c8sVSoPO5hISss3807MAe+ZTVjre4MJ
         lGMV9LJ//U6Cj3rlFVp3Z1JcaSYXBZhIbGnZcnFfB/ijGBgDMq6+2xZTkYxU5nur6IXW
         1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841381; x=1795446181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=KCoin6eV2kBR1bPn3RH+OV6AnE16GnyicEavpHwX40fenjkh4T+9m7y8cmt7gwflFM
         Nbts6UxJe3mPHO4Jg1nblF7NUs18iQeSGz7u87bX19WHMAWr1sirqAqZcakL1/pSxcWC
         KkbyZxHYlKwn80sGMccWFeZKg4rdFxoUC3VfTo0/cu93d10K1XNDwgIsOMxLoPjnCZn2
         fhrLKCdMfM+E0vv8ngl40F7NMGxPiCmGp4IHuvdHu5XXdZqtDHgfZ1iKl7nWm4WwTOoE
         cFFCl/iXwTt7qy70Q0CAUXdncp+Wwr2LUzbH+jy0ivqOowS0DlaOMQ1qbNpg7cKGPyml
         betQ==
X-Forwarded-Encrypted: i=1; AL+hErH1SKh14KIaz4GOD+CrpzTxW/GIbIHEgvpHIB8ZCEwSwDVq+LFspKfp+RcQbjVnAipg43DgXMFjwQlJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8lbWIOV4wfs6YNExQAp1BDREfwk0fZNr/46VUwW3FkZNNH71qB
	Py4Ec0SiZoJ9r4xjoxLAXAdm/b9WnnemMarEmz+A4XgoDzdIQKVIuqpk
X-Gm-Gg: AYBFou2DPuP39rVb0epwtQG+FhVDN5+jh9tpvK0MkNA8WMFtm3IeLcUQGITdhY1KvJL
	Uagz+Lh/8bXq46kYUiXuWDQdFQ5D+xAK4ALeSmPiKi5eFGXHAMPrVGjSRpGrnV8IxTt7d91M4xS
	EFolqi0cPztIN+fqRdfYYH5s2yr7N6kA5ee24CN2dTV/s4UVMcZ0dnE+NwuS32f61+eNr3YQklw
	HQ3uhfXykCzAXnc23ag2cMcAd4Gzu/FVeYHmVG6MVS+F+z28pWZOwruvsNGUm/LvRQXZ5tEL2HK
	Q1Z2y6uw3yx1//IyrNGuDkjJjWDGbROwX+6L5cZHpmSp2qerHb14cn8kc2R7xRJr42KnNh1fJ63
	/i9vSLNwmfwYhgRpP01h/drFGxhyz5o9KfddglP1EeoQOD+9zsl0gPRYXbqStXK/S44i5vK0tPp
	Fz0Rs+atcepNXkDxqAWIkxMZy39Hk+ydVvr+X9f5bI8CyH7Onkm6xAEs3GrrOSfhzleV04pRSTr
	dVLjneMl1xddCguwxR42Oobv7UuuqfN6LfiHxFRBsY2XyWWcs+cmK+g2DovcSHq/zNlJ/MCLZod
	Xk2q8xx8I3G+LMmZ1cE+6Q5BXGaerXm3cCnmPPyvm1lsmaIhzyrhfQ/EPZS6Q6fxTmwXTG21dgP
	AoKc7QMz6UHw2iR+CurgbZR9pGG4wnxI=
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr889831966b.25.1794841380793;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Mon, 16 Nov 2026 17:02:37 +0200
Message-ID: <20261116150239.264139-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

