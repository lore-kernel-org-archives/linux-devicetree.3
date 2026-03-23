Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39E38CFEF
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261183; cv=none; b=qG0N7rORvniURl7e7n0l982vokI16NY03qDk6cWE6FY2aK6C1LngeeiPy64gj4A3l//cKK97N7ojRP0B2kowpSJ0n2OcrWejBqltzKr9yhTj1Sd8NF6OeqOwH462uBvTrSk9tnVzgupnekbZoL2n4gFigd8++P2DS7rSUPzKRPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261183; c=relaxed/simple;
	bh=0EFZ53q2XAEQCbsr9UzobauZinI9NCe/+PQ0fxu05PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0fa1ZuIU8NaMKNmfzNl33kaL2W7AFDHyAZtacAghd8CKdCX72l/AMeo8EtDCUMwObuvhrvOcqLwIFFVwpkfpEA3qlmPj2dT8zoMxVpo/PqKAu5KHvJWASxzGuDQjWWhGnZEUWc2DzLljRLK1S0CO+rxab345M27mCVKvCOwe6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwu0s2ZY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwu0s2ZY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4870206f73bso14550125e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261179; x=1774865979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=Nwu0s2ZY/knPKoV2DbY2Ix0Z2HfVDabyX1TIpnJM9RHD1pztUSRKMtgHj2GMO/yqQy
         OrKzUbvxfk8RuFv91Loth6yTguuPNpADyxzOtocdIkOgU3WFKRHlfbm483GBJyY7Zvg8
         mUOaALGPj+4aeFyBSyD0A3c76+UDEGQFe4dIMfN4CM7JxKDvXS1bZVsvbRbWkdxVma2h
         8rvd2zGuylzT2OHBQ/GxBVacr++346pUCFTrusbxPDXIuvGPR9dOddY0Ik2GNqtHzYiB
         XqOZlZmoPdBuTzfemz7EbBnakbLIUXQwcRYxgRGw1lYBuMBIOhS3oHlDzLZ6wle9NGM6
         ieJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261179; x=1774865979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=R2NCyx+Zi+hi7ch/JeJ3m8Es9RBoiZjbVcoabr7wiRx3H1zqkld9JuhPUfLlW9d1cV
         /mYIjct64jZfLgcTPuEstMXAIWC3A9k1scxfmvpK9a1oeZGcO2aUgjriP+tVOO4yOkCi
         E7oEPcUUtoMkvlVyH9Y4F5FmvrvKMr1Zd4EGG/Tx0SV4LFMaj2udxqCvr0Y5iEuwJNm9
         +WvSJoz9NMPNYtMIza8VLa4synrUJFXJUbAbsYU7xAdmdhCEL8fRqZ6KoBAT9UVBBqku
         7fRSUKDd21+DWtuY7Qfd3+BRSz57qFxwBaIEIiZLIyBJFy6ncR+nl+dcfwk9cRuobiXH
         lMsA==
X-Forwarded-Encrypted: i=1; AJvYcCU4UwzXgNhdliO0d5F10HnOAIKSKMTvKDdwJeK+gqQzuwo2V78UbbfD1NUBeTSuWq1Jx7KZnG47rc9u@vger.kernel.org
X-Gm-Message-State: AOJu0YwkebTz80OE8ZKFFZhx/5Q7vDOQWMsUrLm5dg7XR8Wcn8Y1CMa7
	THYeHOxKg3QHozLvAvbqY9hcdR+/AyRdcXL1Wepkp2t7gkWX6i2Vzai0gRQeOg==
X-Gm-Gg: ATEYQzxAJ0tmC1uRfBF+0D+2mhfjPcXjfMBBxTSktzaYlo3Q2YLh2IOl/8Fj4hl7dDo
	7djwOMa9VYcP7ZyWwbciygWlf5RnC9EAAXdhRZj0VofXEYy7d+1AQoO1D9w7vHpN04Unj2rkpwh
	uuL0/pzaQte1YE8jeECUxkkgJZlWJDZqwNITkqwqnVaiKEmQ2Oo31G8NRKr+3xniZa2mdmeNBn7
	UQisGwkE+ugTftsD3ScgAawToKiW9qjTvbTT03X0c5Wl0yDcMxxab4viqJGwFs2cj68hu5gIaYe
	YE+7uX252F1uC3HgF8hQEZiQwU6cJjSEEJ14vSHLT0imhxk7NG8YpvZSOPyEMw7FHaqVWHstl6w
	Rt1aHwYF1vl7x6ljzCCElt3fSpUqhBlWHXmqWEkuzJDYpClZ8s+P8ZRjaxKpSFqknBVBOJezjjc
	c6fLMGE4mQS640JXKJmnLo7F1V9sZ5TOK8FawFkwc0zPS7rBA0+ZT4iRBUniGRgr6uHdN8XNX8w
	Ik=
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr153371395e9.5.1774261179356;
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:09 +0100
Subject: [PATCH v4 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-6-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6bad6e60617cf8d5400ca079588726..5f823611c969eb0e15546862228ae4f65375675a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

