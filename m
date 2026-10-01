Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA53BFAD9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 03:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824162; cv=none; b=EVzFz+SDxs/+DWBYmDB0tIxw4V5ylSYQ+xm+oML4/BtpB//vkCsZT9+MGmdIWuE4hOf9WjAi2UPYGT7WpK4HxMhBN2+6A8jtTDTlMISBabyyv1kOfrTF20fiCiL5i+4ePZcrGOOmQs708Nn2G9rA/liwT9ZKWUtSvlXKBaX1Clo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824162; c=relaxed/simple;
	bh=dbTIwyw4CqN37M37uVMpgDifOVLC5NdD0oVKwYz46zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8jB3sY7OZ+PSIUZXvM3vcsp+NamRZym36p6pdS/FvEtk9ZBvx+VWmlhLfbVXes6HnAAF1Nsxi8PNkbCuswwZc4qM5vjCgTVPayMbcv5b9YrR8zsQhUgjXeL/EL8AoeR55x9cbxuey6D1H0/HaXlLYsTDqbwZ7qSXyT9t0gs31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2ZlDqnG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2ZlDqnG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso55177645e9.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824158; x=1791428958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=B2ZlDqnGyTATemKpXDAR2aiu1E5HapK+IPR/hkkZVHAHo4FxGYl+cdVNLwJ5dzwj7n
         fzSiKX4Fq0R86TZ+KrFCxSbTi6/V5g8JH31SJsJAvoIQC9BSooC9+nW2RBBJs7tPIQpZ
         MqqRDZVSR0p1f4z2OgIU0McLbeAlRqlx7oL7V7SXivrqV/osj+jnPp8Nm90B2VUSugGT
         lGj+wskFv3FGLEMqaEGJYT25dlfWKVH72hFy7wkySABPGnsamy8xlWRZNui0pfIUR1xK
         7lKuH9BAWShTHIT5xCBwA9nijBa3PVvMHYHaUAyYC+KEktruNJSbUFyZG2SvNaU2TKzB
         mZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824158; x=1791428958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=0ihqwbDa+zszCUIpRuG47iqpLpt0O00MDQMWZWVZXu74Y495aDPQ1HQXN9kR9Qu/2R
         sYFF/r0hh3o4+mxCOxJUxcq2FEjVsIhsAZ4tILnx0qSESsDxSNSDDbLIAQNCcYoZTDSs
         nX7WxNbzU8sYm08zXqyykInwWo3x8uoYseDdSfuG5BBeDdObOEAt9UmBqIk2Z8JlsySJ
         8GkcDuIIQNDMVCNuSrGN4r3m8T5+4V8f05fHKK4UpjNlw9PgnBQ+yFUu0FTwdybavMKz
         ABpgErcbdZ06YKHJB6Q+ZFqRJHZ9cluue2t76mlb1LlPMz2DDlDHRw2Zt9pfq87n2NNw
         iiTw==
X-Forwarded-Encrypted: i=1; AKwUvBx6YTfvmox4HmcjpWidNt1APO9p8fDwVeyoC3Enyv7Cw/W5d+s45pGiFO7T6WYXqwRtp9Ws6bCeuJh1@vger.kernel.org
X-Gm-Message-State: AFuF++mHliCXm2BMQBr63Tblbw/xzuURwd5pfweByGnUtqp9oV4cwxgf
	Etts4dJKS+zr0AtnnoQH81hSgj1Bqk9wJWxTGUyVMngGAZWPpPcI2v56ZbBxVcWlsuA=
X-Gm-Gg: AYBFou1kYrrSuy4sAH0zZT41bgsepcldQUJv2563a7mBCUP8WvqBS+77F2rjT/XDpMX
	H4fRFdAtqbRNWmHYM53ykku4BA0TjLEN0y/Hfj5sFf9yFWQP3kV5NxUIFpnlApEaSk9Qr23TfLJ
	Eg4hDEipL7PdR7lnmitVuh3mPDwO1FRP1kwTa9XcTRhbM48vc1zBWy328WH+5fRDHCn54W0fT2M
	h8C63zZ8/mya3Jq0Aw/fCq7YIS/aaEui9JZ5kRVPAJouKQjzAoUO5+Se4QWS84mcO1DMAnfbTWd
	O0PDTdZD8tgDIMNJZR7fDpjppX6+gFq6MhcxYL6HpkRyow9aksCgC5FWHD+nrP2ZESk7rBSW+og
	zE01yR4vtRP8JXz7pXnHTZzQjCrpuqF0CgfBDli7lxMlO7pgJHoHofb49wW8Zgg5jIYJsSVVScu
	+Avkt9K4HNl4cqeMlqscpqFLWVdvRXCx6VPaONWBYpAYVsn7aYuP2nSmxzRLCd+ohNMQrWQfRd4
	mZq59mWQUGX+pWXECQkbEbGq1RDjbFO5T9Fr8r9z5xBuSde8Lq0sinKdxbyvQ==
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr52694045e9.4.1790824158363;
        Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:14 +0100
Subject: [PATCH 3/4] arm64: dts: exynos850: add ADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..eb87225a756b 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.51.0

