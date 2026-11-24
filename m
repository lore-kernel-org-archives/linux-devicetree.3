Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551748;
	b=iP2ywRCLH9+rdgYrhgX1Z920Z4usoxR1LelQo9pwqJC7FIaGD9CZM5n0Q1MqkQe0zSko
	 Vk5jcF4OqasYSP+vXfcvUMHmYy6EC1xGw06pOKIFW2JDaSpsKwE+U2qmQv1Lc1FcFI4d8
	 KAYkj0/fbeqBA8ngY4awtuD5HHJTKQiTMAbcFtn9BNpXdoEI8eiDLaamojGwUID50mRKJ
	 pFzJDs9qXsHq08gFjq2T4pyiuMV+zvi1NX2EyhgYQFPMVuUyl6wn2QDH9iJkbnJTlqKQR
	 dpp/1NMdZoSViqh/KyucMoVHSWfRHgtv559gOpICGXEgEat8YI1CZXzH0UTT34nzkRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=;
	b=4RRNQ+Jsz6GOz4b7ZAlkMSmaw71T9PDFPR+CaYcVa/HX6jFZocf7lqoaTCw3TzAcy+Rz
	 9Xnl+AM75hhxfcN2o/4YsxsODBKdzlik3wuvlFuWin9ZhFMFmGFwyEpkAlz+6JwE+DmQB
	 nNKW8VPu7fbgjfN5s7C4b5Js7U0He3s5+DTK/JkjqUToRFFddu6o2WFThF+jYf/DAVm06
	 vd9/20FJccS/JxOAE6896jKbPBgxk9PseAN0y11xTEixdu2RuIXg3bgQERIvLbfgmhDJc
	 VptsMww/sKUr7dV3cYw1NdgF9Tkh8iEHNi/UdlUipVKJZZVu9mb58uaM1OVAy/gZLFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QkmzviiU;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E55606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E55606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QkmzviiU
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2623106f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551746; x=1796156546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=;
        b=QkmzviiUMzmxjYNjShvRooQEisS3oaHHl7hmfxHKjsnewD+4ZnAEqLC77hPlZlwRxp
         kxd2lGnqF8Nvt5vc0rLYQA4teDKlmqVUlCNgSw0ceoPpNuwUC5xnIraz2sRE54q8TUHu
         URyX9bngJa5Ng1KQDzK/Fp0xro4FJYHDI2FNgQdGRvXELVMuuy/4KwDXQzrLcgOYARYT
         qEaQVNKKPvoCs2rz3RemC+U6A1VJKoaebI0zMuZJc3pGF2IIWUnmlFQ1QWzp2AlfM4q+
         33Ju/ldqUrtVj26BJ9GFJtHhGmCBlSuEFJ9q7k4mSzd77o15PgyY0kfwY72NNTPp0Pfu
         oxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551746; x=1796156546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=;
        b=XaLhpBRe7n/pB6EXPMeEfwHX7Mr7le6lnf+p8M4vL7Aywl+bGtJ7cVI1GdfF5Gle3A
         /kiQdMAHVikobd9ccXt+UQU9dPDst3KUgs5oHGTSAr6nPaWz1DNavbY+q1aBfb55P3hc
         RIPdWYZk51KCHMvQEfKLYGhqQVk0kLrqZr6vMKkOfYdr/HDI2XNYg6wUrRcec7TIWyAM
         2OKsB2xqsXm9/M6QjYGoLpvOfXROtkJtEJ+EZPUqWSvW6AHmvmEIMy5TPTv2mOS7s2zj
         07CfTmRQQKI8cCE3yMwJ9Z6PdL20VHOAXbmVKRTKaLfzhF8HZZwUcsm+Xn7gmgXpfxJi
         COEg==
X-Forwarded-Encrypted: i=1; AL+hErHykbmzTiSf1qrAdB+0Kiljd1MkipoZmEXb3PBo6tAW6+vDTAP6uv0T60pc1A8MpEhCaV5rzduaNY74@vger.kernel.org
X-Gm-Message-State: APuU4Z9x322PRSGEAB49m3PBKdE4OD8Py4rkS6jKCnPfFrh/PpGcJPA5
	FhRi7x0aoJjsakkn+/lAo5NwY7ffSRThJhRNpX1mR9gxxAFzBnainvjnkKhnI/iC/lw=
X-Gm-Gg: AZFdTZfHUndluOHstmuaT5KdmEldMZOOMW7jMubPzbTDXlxJ5BHmacpFBezJKS3uw/N
	SLbbqol3ntrBmp3FvS7bNbMvCsmTIY6c9AZ9U+kgIoun0kgMslWAA43Z4F/He6p4GvzLDxm4kIO
	W3v5A/3Qb4Gmw43K9YzBIaoExJkCHRC7Qvq1/MMCdS/gPGpuqDoL/OLJ6sYUXg9yXRQ5wo49r+e
	/PJ8FM6/Sm5yN7fSODfd+5PT1zfSeDVjXO1VY2tYdRgPnFt/kfcilgZCSXz0VnBIsBfGZ1Gr5vz
	Bc2z2xmp9nQxGkfVJNOIHGNa7fr9ZnTg8+Zy8KskDT5IgbSkntdH5Yl0SpBoYB60q7f+5iiPPSA
	TwtO+OYRvYjj9QNjR8BBb5Lg76HKSHpu9cntwCBAQ6qTV33TSCAJtfRvQccQ/llQBydlWkZG+3s
	HrMnwPy8X11Cl2dsPzOf1nzLJtjyQ/4mEMIWmAPQe9ugJrjI01fX+rAYMrACTvwMInR2Zc1nQzz
	RiMxeJdgTPCM9NTFeO7+wg2CizhBBno23xBkrAIe1tL+J0M3EYOQ7IaysaL6zSny+UFUmtrwNK/
	uw+HHFkG6UdUkNgHuHBghN3yZkdqXKZEIevfXQbv1U+Rhs6OW6p+ylfr33NOc3qeNJtUQezEPLr
	kGkTINY6KATM=
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr23117524f8f.29.1795551746271;
        Tue, 24 Nov 2026 12:22:26 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:26 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: st,stm32-adc: add temperature sensor calibration cells
Date: Tue, 24 Nov 2026 21:22:19 +0100
Message-ID: <20261124202220.23721-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124202220.23721-1-gerard@teslabs.com>
References: <20261124202220.23721-1-gerard@teslabs.com>
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

The internal temperature sensor of STM32 ADCs is calibrated in the
factory at two temperatures, and its calibration data (TS_CAL1 and
TS_CAL2) is stored in a read-only area, along with the internal voltage
reference calibration (VREFINT_CAL). On STM32H7, the temperature sensor
is connected to ADC3.

Only the vrefint calibration can be passed to an ADC today. Allow the
two temperature sensor calibration points to be passed as nvmem cells as
well, so the ADC the temperature sensor is connected to can convert its
readings.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../devicetree/bindings/iio/adc/st,stm32-adc.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index c4c4575d3fa9..9fe41b89982e 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -337,12 +337,22 @@ patternProperties:
         deprecated: true
 
       nvmem-cells:
+        minItems: 1
         items:
           - description: Phandle to the calibration vrefint data provided by otp
+          - description:
+              Temperature sensor calibration data at the first calibration
+              temperature (TS_CAL1)
+          - description:
+              Temperature sensor calibration data at the second calibration
+              temperature (TS_CAL2)
 
       nvmem-cell-names:
+        minItems: 1
         items:
           - const: vrefint
+          - const: ts-cal1
+          - const: ts-cal2
 
     patternProperties:
       "^channel@([0-9]|1[0-9])$":
-- 
2.45.2

