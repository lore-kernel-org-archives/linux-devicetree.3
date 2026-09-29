Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B3DB96B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651467; cv=none; b=T6taRjO1itwxaZbDBrHld7+J4EizU32MBLmpbyPbsYhVL7iM/Dw/ZvEKFWR9ZRqySOWJOnDbapIzcXD4E4M+L0phvVnmGJEmFhtkw198RurrL1lyGaqWQuJTV313tNannXmtFFKynCWtcnMDE1xtc/FOVwdkSytnx+wcoBUpgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651467; c=relaxed/simple;
	bh=Hgfr5cIDes5lF6RJSfHTZiD9fCb8BoSIwwoCRMm+R4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWAm7eR4I79FgllXcHy1up/Y6coqLmKYgy4nHiNmtq7q9ZWN+apEjUnW4Dnk4AAcH4rJxnE37+RJ3pKWlJ13ssHtDgFpASt844OvNkfxeH9t8Nw1xN0LZ5F7UA1wGGz5P5bNsQ8O+/4dTrA6ZYUzyOtDYw9Rb94FaG+QvjLiE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdMjPXn+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdMjPXn+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso12628395e9.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=bdMjPXn+VnYNgb3V/Hd80lVGYJkoyRqXGiXDBYr/7sfLWq8TVW4Cbn9BWjFjRWKtR1
         fnHR+5TD+EVwxhnQNGalH0tsmASfKQRNJDYTBINtxIWPwLuR2VNPdCFzEnWvb0tswotE
         OSR8gPBD/bznRPgS48FrVo0kIM1PM+m07jIdOteOQzEh5YRAXKnSH3SBapep5Kqn+ViH
         sOtXmByXA0JETiNyfLznUsSssDm03cFPG3JHfJeSkbYunR3Y3u+v6gHQDtSunJpPOjsF
         j3Lz7JWegoTZl9zfnXCmXGZDVl0SfYeM1HY9ATvYn5lFJDJ7VzPI0ksjjY+w7ySNhaeT
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=ruKKmYh7CjZWTA1vWRNQS++Xy0dqx5/mRwjh4TPgR/NzVcN+3fU8QX4XKAOcxyrNIs
         THrdOoPnyxWUvvwGirvYcpI++GkjXe9TkklbZ4juIuCmnQoVwAu2Fg+T1eRQKcQ1JCQP
         2SKg0OXHUfyEprM7XBGpF8AwMQ1TbvbSbIfe6vaQvnmqQFkb6mxJl5vFW+CVyydRbvAo
         eVJxArN1QnVhokY/cyqr3so2R/mssq7BcTnd+4h68QSKyV8+D+XabYPuCTGYg3WLQYZ8
         k2qCOI3oe3Pa6ngw5lK137hM6ZN3A1w09EBEoTujRPA24UuCx+s+EfuskpuZwdMiqolz
         yy+w==
X-Forwarded-Encrypted: i=1; AKwUvBz+9qR61QtvRyDfjAgM+tiKcU0yy0H0FoxLPdQOEC+DqkuZeXIlxBaQaTau7XnG0iXKyLCnhoSgsQty@vger.kernel.org
X-Gm-Message-State: AFuF++m5ksnzvPsFEUqZDBHOwfOh9U6tbSOD1j1iYEcD4lGv7s0llH1R
	N+2uqKxGY3I+rdOq1S2bUQVKjQsniCe1ImgTFA5j1A0giBkqTeHgs6OFXU5/4hRWMcQ=
X-Gm-Gg: AYBFou2nMaTZFBqPWaKos7O90lKf6hc7YKyvVlWQQ92cL5HcTro827MIJ4on69mEXw6
	WcWPEHT9yksnbVk3JSwxmlxx35/4VowIKCjPkrpbStLPiv8oEFw5muqOgkXsaNQoOMUgrxBTHds
	VIhOeEhOXvwTLblwZGLUKNR7onZDr+SfBdqeNGUEFIU6xfmTUS1RelN7AS0n32VbYFTb3+BD+ro
	TFHwUDXXYJnmtStRXlpsu5FwIA0ddL4hs2zYzZ8LEiAxvet4GTwXCBC8dEFB1dRdr7HDDj1zaB/
	3cL83Q6ETOaB49YWh7cQp2l07vIEu+fr9afNmNBeoqpPMYuOc1ZE4Bp6k2NnjFgF5hn8PUbXRIo
	wtwE5kf5RKF61YFrGPVJ8HxVCXRlrysS/vDnN95dp9TnvcZhGrUYIfzcwbTujkKfGG3p/3WoTtX
	6JjASpvzIJHMEBTMVtPSBEiq0AnaiRZMiC9dsu0V9haUHDzCiYJ+1mSkNKMIeKZeT1nSkEm+GAi
	/0/Hv/eMGlS1INC/X0SiUZmINPa5vjavakoqSitkqMuif/E0CjwOOhdDINCxaQ=
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr108686475e9.25.1790651460523;
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:47 +0100
Subject: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
protocol provides interface for all client drivers to actually use
features exposed by the APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..91c6cee8f483 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -11,6 +11,7 @@
  */
 
 #include <dt-bindings/clock/exynos850.h>
+#include <dt-bindings/clock/samsung,exynos850-acpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -170,6 +171,18 @@ timer: timer {
 		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "samsung,exynos850-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
+				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
+			clock-names = "cpucl0", "cpucl1";
+			#clock-cells = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.51.0

