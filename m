Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616621;
	b=3ekzkLolh9eD+VWGXEFAf48Djm2MqniZ7Jh1EUYVQmjXNbkm+W5nrPHu6sxVchic0If2
	 kuRFM2Lq2VTPd7ZbvsU/MzK+Cw5MwN02JWTm2TFZIL7q02CRwp4MtNTNxViu0A2P8MMjo
	 i/QVA+4w1PtF4aCeotWZVI4curudXOJ9+KRdZeQVYLkQBTzhlZ+QzwKRtbSFUV4JKLOxO
	 GPr3xY9GLnFuYofqiMaZdJRERUFKwsfqqCOJQuFVrTnVbJcBuD+zv5r5/zozLe/WYU7cz
	 uMCfyK7MxYVZY7CyHSeLUuaos6A/8zHKqVjsvL9dKJCeDFuxJ7n7jsxPDqbEvp70/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
	b=C5PoWyRK+hrm4gRbZ/A0dkr7wF+gXWjJ4tFZEYB45osS9Gd0LDNLB6Nus1Su1tglEtmk
	 EAkNmnCZd59HKo46aAGL2x+YsJLCTuRAuIJY5ZyKANlKTqOSS1M8gN2lNDZ1+0+KhNoEG
	 wDzjtp6+Ph4OCBRY1OOCUR+iSz9mZGmh/zBETRjnJRUTYBL9b7gMzCm0Fs8KEe/IxOiDJ
	 bZuavg+LZBRPK8tbtW8JeGzvDmm8If/Pu/DZMmVIidKHHEnI3XG2QbC+AYNjORHppnH7y
	 67A+mCKD7s5ZKsIamgQTSbrn7qEuwtLdiBMUMcPbcypv7tX0uFF1qm+MIIbQiHiHrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L1FwDLp3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFE606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CFE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L1FwDLp3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso55326535e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616620; x=1796221420; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=L1FwDLp3wHHSO7OHNJzAMqbMI3UzxX+e84R2IhF7FhA+JeTZBxBjUpwtiC4W1qd0jQ
         6/P62yQTbdXtRzJ/Chi1+ZzOPqKzPLTswybBmQtyQWMvqZrkX6njoV4qLwo/KuXFaPMV
         YP9bxcFGse8GqHNYMQfFAH8iONsqJ72HnCi9lmW8FWUD+rvAf/X4Kc3irkcnSyY+VfmW
         PCee0ToykhFaayyMrnwgg0VGw/RYfzR0BeM/9aHsX9CpVscUFq3rPcwoMAEjNhOFW8E6
         q793a99AUX52CWkhfNi2ZOiooz4UqjtVZHsdmGkJa72PfIVtOOYl20UWfx1uKGOzOjDL
         XKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616620; x=1796221420;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=EoOAYazqiiCofxiJO9Q1cOw3B0uptFxELKJhY/KbOas09P9Xe4IAxq2vwlCY9jQIVr
         FB1UUWv6ZzhkA7mnlhJECvjl1oX6a0F+HmsrtKNqh3QqP83JaqlV83DWV7A/MgeIFjoP
         vCEW9j8AzEfaQDBbvgPyEYJl/oQlO/UoEdO3/j65W+shxYlPME+F6D7vFmvH+DhqeEqy
         QemekkmFpWOLFV4Y/2zoTAes1wFKCoeXbmjngskk4PrZEQJzn6u9D3ViLPBgX+5r0js1
         dttdGp4GtSuwGA+lPT95ApFYr3NEoACwq2H+rvQdcp4TFCy9V3vUKR+gyaeTRFVeUJyT
         fuvA==
X-Forwarded-Encrypted: i=1; AL+hErEiq12jEO4xALZrO8lzr1yjQcgRJzrYT4p0INZMkNIkWPcSUzzPaQuLUwzT8Tz2SlfGFz4BeEIuxpDe@vger.kernel.org
X-Gm-Message-State: APuU4Z8cL4AWPkSQAXxB4rISNT8GbhaRzEfMBTc+nl38rALda39EKeSA
	K8xbWPeiLRZnW9BeKiN9qmKDVQcffoK/IyPU7nt+FdbRoTSsoXJa6Ny2s4TqHQtRqWQ=
X-Gm-Gg: AZFdTZdMNHqILsFH8kAvkQ5xzpIQk6kWJo56O/PxQ2WiwQ++cwyIB2Xx/pZsjFn6Vnd
	trvWliFEVaLNp8KG4Hlrb82C3W89Obcqcuo9K3JIpNGosQx6bGK/zef3sjum+CpT0sEXfr5SEQt
	mHcDsrjNlCAfpjltdqzlZpnnSo71ggbG1VYEVj/dsbx3iBLLVftPIO6QYcMQ9GjbvMlZEs5uE0N
	+ZZeiqJUmoABIru29ISE0k2wG3Ib8gny8kr2LtcvMZ8UMUYwwW00WxTaWmpD9xbKjKhwPNJjnIQ
	oFUMGIqJ1xxy+IKfbWBNTvRzEbDdqFktR7r9nypno1AeO7ue+g4TxqJNCvuJJCS+WKDv6XEnhCs
	QiDkrT/kSxXrr8rdLOvCUWSfFsGGJZvLcjIakxOD8qIE1k+vY5zQL/Q0GIQJMlk0iBALkkCUFLM
	aJfcNmyBstpSqa/S2+VY3tUML8x18TRnA1B7Q1shYH+iLFMkZnTCwpNheo2p5l7d5hOagWtK89O
	Zs1V43TTT9es3HHf9AHwPmOmmT8rrb77jl8IG3G6aqDpzdvTCC0yfgAau/N07xyVCZ6vWpqbd9K
	N9T9uzHZbub/6O1wCX8eRe7S2AbVmn5oB293PuCnZvY8HvnliQ7rUzo6VkQLCJ9u5k08aWQnk/f
	zZ/+AKYUbIFn5NVykbMqLdPs3EzwB5Xek6cv30ccalyM=
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr315204935e9.20.1795616619785;
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 14:23:32 +0000
Message-Id: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJuSscSarnqPIiUmow6URJIii
 uTuTe2uy//B+3ZIFJkS3KodIi2cOPgS9akCOxk/kmBXGmpZN4jYClo3H1Kr5NM4K7QdSDXaWNc
 aKJ850sDr4T260hOnd4jbwS/4XX+SlPgnLSikuGrsLwqbvtfu/mJvYjiHOEKXc/4AEKyE9qsAA
 AA=
X-Change-ID: 20261118-exynos850_adc-9cfe569acd8a
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Hi all,

This small series adds support for the ADC block found in the Samsung
Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
development board.

Exynos850 ADC is also called ADC v3 in downstream but my understanding is
that SoC names are more prefered.
It also relies on PMIC 1.8v regulator which currently represented as a
dummy one.

First commit adds compatible for device tree bindings, the next two add
the ->read_value() callback and Exynos850 support in the driver, and the
last two place things in device tree files for WinLink E850-96 board.

This was tested on mentioned above devboard by reading reported
temperatures from thermistor.

If dts patches should be split out as a separate series and should go
separately please let me know.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- split the Exynos850 support patch into two patches: the first one adds
  the ->read_value() callback and the second one adds Exynos850 support;
- added an empty line in adc node before status = "disabled";
- Link to v1: https://lore.kernel.org/r/20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org

---
Alexey Klimov (5):
      dt-bindings: iio: adc: samsung,exynos: Add Exynos850 compatible
      iio: adc: exynos_adc: add ->read_value() callback
      iio: adc: exynos_adc: add Exynos850 support
      arm64: dts: exynos850: add ADC node
      arm64: dts: exynos850-e850-96: add soc thermistor node

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 22 ++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 11 ++++
 drivers/iio/adc/exynos_adc.c                       | 66 +++++++++++++++++++++-
 4 files changed, 98 insertions(+), 2 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-exynos850_adc-9cfe569acd8a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

