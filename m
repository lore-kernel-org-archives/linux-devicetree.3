Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616627;
	b=24Rz/O8WuLZ6tys1tgwh86cXxPIL2KhVuCs3jYtoldefT92xPfcitoX8+Q+TI0hfdPPO
	 s6JaFFApXAjbZ/mkXUda53H1p0omyGRuk2Bmgyt5D9qJO9a0Ap8sbRmFSAQp/GY/YCdot
	 /eiyKZN8y8ZVsZCxwM+Wl0Jf7OkJR7ooFsBHBV01tZHeHm7zLrseKQRn4GWR+XzZBUmgk
	 pIXU1aa6alGQkXP+DAiTRJSmGo6970H4HzWOLQw/XHuq8OfxxhbWOFTq7BO5kf/awmlkw
	 UBS+lshyFoKOO+E068Omdmt7U2vcBX/AWaJH6WIW+lWT6OwPc2lv/1WbPlIuQ023KOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
	b=WR6AVf7fQVViGB/ErWI2VI0JmcOmLTl5sOOSHxjgVeXS7N3KzO1SCsor1IbeRGDschAx
	 31GDH7BKZ6hQFGrCEmXpSbRbS28HQaH3s/DpUSJLZ0NPlYfHcFKB+ol2fchpFodY2dILo
	 utwLTq6dAGc1+nJx/iMtuXeFzH1NwPhlcik9hxoz7FxDVMOqvpiZiBFCgWmXH6HGixGVa
	 YZ1A5NXtVuQ3jZjCn3ZzGKYyQNLGwGE8Wl6idUTHB3lk1rgjpExyIbOxuRQGZixh9zZxZ
	 YSy7WukeDUGY2CS3rjmJgNJHhkEmyoLNjOLSfprvpnT3OJjUlJNHhhclKUkNQrMPDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A0sRnbpd;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397F606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0397F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A0sRnbpd
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3664161f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616624; x=1796221424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=A0sRnbpdEp9bRwWm7n1SKo07iYgVbG4yS+gCF3Kw3P53kdbbL10p7APEcPps4zUEkL
         AegJrjCRe+13LmBOZt1u2XpQFfogVQkHH6rnhfADXugUhZf3577Ny72g8tjqqOHMhBV1
         KymRC2cRCY6oHj/MrUXx/Oc3/+mKr0bindxjTz0TRFl9QBYJGjzJMTnaYBAAUVnuuKrq
         oHeYZKe0DG7bfX/5wfnFRLDpiyQQITqXoHWixZ1Dwj4K0LxUekBinW6xBWpa55kbVOux
         kkYhQ55BvBU9Q7nT8GzjvxhFPE5FsBsRBSJTmHrIwelPvNjWjsOo0pTE4LNDxKegTbY4
         q1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616624; x=1796221424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=IwEgim1DDJlO3sIMFShyyx8uG39cMZ+QD3GKojgpKXinSkq3Ey//+x1tjxlYQvQ7Od
         09m/Hw1JbnYuj96yo5sx+6MB+RgddqJQZ0W7MNKF1Vue07ERhEeU008If+vnAo7wuynE
         Eq6tDG0tgdC5gQsf97yVcq6MvhdsndskXAwt9X8hYLYMmiFhQcvQJqzihXmFsHrOwGkc
         JnmPiHFosQ/fWBBG3oZHIf3ZbXNNauSZhGwDsWNwxsQPpp22jOWcap67FIFog9J0a+Vj
         0YbQ/99UqDTHPWKYjuFmk7hK/0HzTCrih5ba+VWhpKZmBEF/LD+bUHOK9mD7XnFvZlW7
         xn8A==
X-Forwarded-Encrypted: i=1; AL+hErG3nzpQbJokAL0aKXGHrxZUYq5zfaz6/p1iw7c6o17Baih327bKFYVZ25wcieH4JozUEC+lwsZSbCCo@vger.kernel.org
X-Gm-Message-State: APuU4Z9oX1BwFEArPgtlbZZeJW8lBud7/iCy64WLJYL9XCUOpGuhKb+a
	L0oCX7xIR81pJAUpqRrt8+s5lW+caH3vaHztpxgUDcvhJ+8HFGuxpbLmPmOab1EyHAw=
X-Gm-Gg: AZFdTZfRv+Xny4ckQYH1xKMqD2+VCUaMz2BoHWeYoApYD/8pZ3ZNZSS4sIWn3CH/cls
	DSITJ42BqmvyXmV/coTHZzrnOVbicyHeHow1Twj59OrU1qK7cWSp+ff/Ylzba89BY0ymizNhkay
	DpNJkIhguJv+xWSjX0YZAnF/AI7DqVaHGNBE3A5DwQ8sJV8U9GaZy+s3C093Plji27fqpreC5Oo
	5zDtcSZLOospZy34U32uLkouY7kOlrsmR575BK4FDmm9SDThu1GyT9R3u5jwtuUxes3Tic+kXLM
	9omDIs7DUV8SkfFBbFQ+a6jnlGcGTrYrscn6DPF7iPVV9tAaYAxSkwDUYnSM8PtquzoPjLO/S8G
	EzNH05bhB2GXcyGm7/5aKDBN+6ues4rs7Pvi4v583PniXYKL9PyfcUhS2UHMHAB8297E25xyFEb
	cOd1cfAd1LhP2qzNAHuwjGJ4TqYl65oZRhb1DqBuEgH6xIzUdzFjeyWqRWWnObFc/v725aoScSs
	3Hqph7ZSi4XTQvEyz93PFVndIKKdNkCkTuilo/HjOXvogr2JRRMslXMB25SvNr/BAMx8ybZ5JXb
	r37rX8liEB+UiXg3ZeYrLpSakzy9v24ILcdEUkK5HUBD02J9wj4fFxUtmD4p0LNEY9Ba0ISew22
	T98bdxbq5IuXIA6HdNiljKlaTkNSe8AsBZ+vZlXVdVjc=
X-Received: by 2002:a05:6000:2401:b0:4b4:2ce4:6dc4 with SMTP id ffacd0b85a97d-4b42ce46e8amr17140435f8f.48.1795616624336;
        Wed, 25 Nov 2026 06:23:44 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:43 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:36 +0000
Subject: [PATCH v2 4/5] arm64: dts: exynos850: add ADC node
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
Message-Id: <20261125-exynos850_adc-v2-4-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index ace747fa80c4..feac3ebc4de9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -354,6 +354,17 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.53.0

