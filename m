Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B77F4A138B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533559; cv=none; b=Z8InUuIabBBgqngKMAsQCXqOHf9TfPvMPUywOm/9ZmZdVUJtvod3l2CoRJL2m4wkyg3dQiwO8uOHHvsCMVpfH+8FEwi5wt4Y6wwCNl9zYnIzuaGfYw24nCLHotu3TlOhSzRiSzxNJ8j9uWFxc0/7A4m7vt/zpTKp/MPD+f6LlKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533559; c=relaxed/simple;
	bh=g0zBm/HT/JX8+0Ve2noPh/XhrvlAOxSKonPdGSV7PAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KraETYkpOlWZVFybNnCJLSStvx4+oSkY8Ylngfey39Q8iaS2AoTGm34ndXZNEJYXd4n/wjbxUcEjrVtgkjwLanyCfZD9Fq+GB11SWPeaNWqi4YC3T9LyGyaghtNyNVTVCpucSqr7rCXZsNE15TP7Nk8SINpEO/ye0QufDgC30HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTUPiprO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTUPiprO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1276f8414bso118538766b.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533555; x=1784138355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3RbPrXYdQbVWUvs+F9bureO/gAjNoSjgQ1E6c4QgBI=;
        b=HTUPiprOuzgdZnrc0eX8kY55b194o0cAPFEbqczJQ+cxhsdwf9tVdkoZ1GdapfWfK7
         FlMnBf9AV8J9zM9QfeXGZzMmc7tBB13liJgTwx83Nm6lTDVg+lDWRYQONI3PvpziBPUV
         pFR4vDE1pqS24Hy+GQGUrf6xF0ioj1zvqaZ6eccK1vRkJbUDkMaXwNtGlyiD3didMm2u
         HrJlQZz0XNzw/6/c0jRZ4tbSIIqP4R3oa/XKUBvd/wk0D/tS3JefJTRkV8hGMTyaIxSC
         kgaMZloiBUVTJ1IOSZB5pv55Is1MV0i0MZSMeiSlikQWpsi6MseRIlsrT1CLEP38kAvq
         n68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533555; x=1784138355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3RbPrXYdQbVWUvs+F9bureO/gAjNoSjgQ1E6c4QgBI=;
        b=e+XE1sEmpA5EAEjg9GeTWtJTyFznbgKyLxtbusYgtOd+cuycSnVaLr0ZLbKisspA7M
         95I70yOQHmTO9ngktp5TuXcjmjtjZrfzHZyFNjzspVHEJwSR4DTPfBRZxWfc4VKcrym5
         wFdheRFXH4ZJ238fzM9MTms1to6cdCxtJRuxFY9ytKZgHNWNcTLSRThOAYWx+CwfiLNY
         JUupu8vIUn8Szv+O5QkaoHehI8KIcGvYswMIhco+ez02RwIBJ4kmNzMVG9c8yTwVFnMZ
         mV2RffUVf/QSu/887EMda/uixj6yqlDod8w88zVR39bRcz/I1jTBqkRqp4mi/TS4lB3h
         4wfA==
X-Forwarded-Encrypted: i=1; AHgh+RqnYwCqAUOjJMSW3Y+KTWuaSDnyFN503zw28ULXwq+XbcIxp2m554nsfjxCwlNAJqW4sXj37K8bgm6i@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxuxc4pXx+lHiUKsGJ8WNjUPcWdqUNmhPSOdjUQObM0HO3wsw
	7W4rYG95dTQYCK3s1rKwHRX9GIWR6K9sqYAQuCDT0nk24zBV3n4KLvIG
X-Gm-Gg: AfdE7clQesXJs2JTojLDysl7h6e2SHLNO4TR11LjUTxTcr0nBkmQ24V4xGU9CwNn48j
	ThzduEXuvsE8Om9LU1HfV7ZRXZRqgVN5xgfhk87n3potH9yWllAPREHrK6UcJb1Cmzvvtg86Tw5
	jY2DRKy5imhyOYMWPygY4iGO/P4gfK4jCyCzl0knAiqo5ARNRM/428UE+HgPfJX1dt0Uwlrydjc
	hcbnZwDucJtGGQlEKecR5yRo2FvL5p1l/pZ4NQBJyL+d2aU18cYaEAVreTtU0ymozwf5Q7n8B0m
	ofp3Zeg02mrX4zQYSfmJumySnlXGFj9f2HBaq+90ru/3lvXQ9Zc3qs3oyMmWCr/se+VnFHqqeWG
	14wtx9ER2OwtLAUh031X34loQJGHDZrIlJk3lvOplqthRzfVbgBoQAxsVyKQ10KMRN51+DGWhDD
	Qfd8YQDSAXzEpJqaIe
X-Received: by 2002:a17:907:3f18:b0:c11:f4d6:48fc with SMTP id a640c23a62f3a-c15ce1c331cmr188941466b.45.1783533555363;
        Wed, 08 Jul 2026 10:59:15 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:59:14 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Wed,  8 Jul 2026 18:58:25 +0100
Message-ID: <20260708175837.1718437-5-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the V2 cryptographic hardware accelerator
on RK3588.

On RK3588 the crypto IP sits inside the secure domain controlled by
SECURECRU, a register bank that is exclusively accessible to the
TrustZone firmware (TF-A). Linux must therefore obtain its clocks and
reset line through the ARM SCMI interface provided by the firmware
rather than mapping the CRU registers directly. Attempting direct MMIO
access to SECURECRU from the non-secure world triggers an asynchronous
bus fault.

The interrupt uses the four-cell GICv3 format as required by the RK3588
GIC node definition (the fourth cell is the CPU affinity/partition
specifier; 0 means no affinity constraint).

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..a7560b09aeb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2447,6 +2447,18 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+		status = "disabled";
+	};
+
 	rng@fe378000 {
 		compatible = "rockchip,rk3588-rng";
 		reg = <0x0 0xfe378000 0x0 0x200>;
-- 
2.47.3

