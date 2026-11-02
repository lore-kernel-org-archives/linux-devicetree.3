Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649216;
	b=p2+V2X20n3lrSsFygxuoCCTlKVr0BliUjiz3WsVVvFUEDzr/qniMhWw7f4EQpMjF1fwV
	 /elOuG5gDd9/EkAt3lnLtFDDey1FUt8iUmK9Qvyi53rvasEs2aN2a4k1KiZZcbxz42SWC
	 L+k3X/8sP6aCLyy5RiTjKupj37G1dwFpGPQhTVNpW13vyqZCqttD5x0aoDuoVVlkDMU5U
	 mXrtgT5AJAb98i5KYIFUGsyh23QP7UfEJ15atVqozbIeA/hT6wRUyQGRm8A4WEpDSXdAS
	 1vGqsLuvtulGySi5PlB1H2NNrl+7SAtJD87ex35EiLYTT0VJtPm6RTkKzBzHZWiANgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
	b=jVsd36X/AdC1/TvyOvMW9P8VfWcuh/2EjEferKeixa42iqoOtf5+Uhc/9p61erZsTEjg
	 NRZMYP4eVtJYqGTHENKE/zzQGH9oNPmIaA+1J9022/QNUUhBSIPHMN21P6WB+o7WqD6lu
	 E9yROkITJPY0Y27R7/rMUQnC67SlVIA4YPhMw4JeNJvpQ2Qd7caBUlkwqYmIKyqtKq09X
	 cq1rk9eR1VOODqiOXGc8k2JutAZpCatHkpXhfpM4TNSEJV9wJRCEbfEAtsvjx1wx1m2Tu
	 wDFbGlXknZq+MMJ2jFvbA7iTqFG+Ea5O9lNfYzJNrr8XVi+Ea5+jSacJxRRA0D5pVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FoCqqck0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1237606D837
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1237606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FoCqqck0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17182095e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649214; x=1794254014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=FoCqqck0/dIk0nU084gpT85Js5tHZSIV1oXLpFmipeZ0Rpn5fP4jLpFezanr70Ucpu
         T/aAGutYE5cAuhSnbawxfCU1njLQRYd9Kq6+Yw4yE18Z5co/FYN9ENntj/JHwI8mBZ31
         9DUCuUWcv9y52j8Bg4bEnlcCRornP77F8Qo2AtCtEEhSr2jsb2t/jyDJ7KFjBksIz3co
         8CXAXV08RiAYZQPPkCMT+tsXP2uoj7ccnV1otmxxbyFq7+5/ZRhofZqV/zPscBUJO3iv
         W//V/Dqq5Dpx9j9UKmcAU7j/wVadte72HBx14no7EzCGtSmQ2ZSPwLKWt5ZRL/KDzET+
         XerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649214; x=1794254014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=Fy3flRUq96dGDWczteNd7hR+rWsW6Atko+HexUZlb5jZ2KM5AMHj7RblqlXzrpOq8y
         iu+iaQT53hwZTNnhrqTeZo+GvbGB2/hIOBI2e98Iw5vWDeZIIcKmPFKE1WkPjkAlN6mu
         l30Neu8Dn1IBUgk1hI04qJyNlUixpA6FcJ1vxGeVWKRIDrIvQs+QrTLQ4DI1VcRMs/v9
         cVEdgYmRStxBmMgSzwVWGWAgbTKqUuQHN6yWLNpY1wjqPJWqDt1UZQEF0PcGUQ+bcZPX
         qHIOtUkqKR2JrWkvGAP7SHyHtZ1jKp1lW3ga1O3+LYN8vRX6bcy74Y2rNpTa/dBB24vc
         +5Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzT14D+uMp2m3Z/RvDcwCUqWLBcXlLtn+2BJB/LGZ/LNgZ232iHeRMCI/pyro+YrTdnVNNBkQTAgxs9@vger.kernel.org
X-Gm-Message-State: AFq9FYITmlr5aP1bOHRWZVg+reDY63PaZo2dpCyluNmVl9+1x89hXets
	voYAHdVFekQRnYRyx5MJYqMuOpbk2LBOeOywH+Fov98m30DHj5p4XVdmXZkCGgQA/DQ=
X-Gm-Gg: AYBFou0d7aTTDRf/BfB6WTj80OKO/ztrQln70a4Ygdhh/K4JH4srLXYqZTiTqfKrftW
	3uwRk9ClyKjzFXG4AvgxSxgRxSujMdALOh/hRsh39CiSXbnpSi/qeIfQehPQNqix9noniJy37hY
	NazuQofEwFtJVPScBjo0u3zzrB7C6h3cGHzd3OSAzXFFCcp9xQ9RYD8r+TsE2+RnmPITN2cpc68
	SBcbgVhZsxslTr8G0TJcRpdhyC2HftGC+KYR6OhD7YH/OZfK8NeuwMAp3frjz+MlmUoyQ4zYm0w
	8bCD/alrWDIvHs7UxIWE9Vm4qCPkO8K4sao+1n45yT+e40RiXAU8X7Zn0T+9u86LboNVG0Eo5hQ
	TrYW56Y0EkzQ9bHHPE7UU/sz9X3SV7fviO/83v92rIqbvRhGt6mBLY/bAfe96rL9zhC3TRqMvPN
	YkMSVEgMcZwsTOAoyiBL95f5hSc/ssJ4dgwmiSS99AgeTBqHyUnK1/FEHOdamlwqlBn1b1TB7ky
	MHWolcczvOjGJysqUodeJsJKz6m6qxXwbXNfR/4Sy8F435nOqy1YSstIe/yh0sxRh/XaSzwmVQq
	n6+AYu1185p4/nRlA4fwXH14AnrL94OsKl7hPzvrlRRQOqcxGcoeFVQzngB29HBD/P+ZN4ITkVD
	HObrQNf0g6LMhUI3z1KDcjmTat7c=
X-Received: by 2002:a05:600c:1f96:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ac185bd363mr252112485e9.35.1793649214314;
        Mon, 02 Nov 2026 11:53:34 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:33 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:50 +0100
Subject: [PATCH v3 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-4-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1985;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=5OVt9RjfkAFqWjQ3y/ErVKQtmPA4J8c1AJHBN4H3pf4=;
 b=AtG3GnlBQFbMH1PqTI381XfB9i4KjV0cI4wKuxJY5/nlIHUOkkQSmKRvpDLY3ROqT8xei72e3
 IwrjiwzwAOnC35m2raB40VjsNgf1dswgTA6Jx6kpswL9jPVXjmTUIhd
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes. Also removing deprecated MMC `ti,hwmods` property in favour of
ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..1e8d225dfb2c 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,33 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
-			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0

