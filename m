Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787125;
	b=wXmSifA6Ms6Rsu3a0oC67tgGc2l5pTbAZMCrZNOiNcNRxuVgFp+v6Z6RRnnZamuhNBws
	 0uBaQQAal6bTMcC69ZfE/VPzsDM+GsOGiogpSmyC1yz7/FivzcVCgmdVPHUhttqRX84Xb
	 uFKWCsdkVHjJ3oWJlaRkWrqXfeF85ohq4FtDVgcup65aM/w5594Xr7WjxMYlPcC/SLcfh
	 S5flO4e/MKF6pQZes5o8LLe9uCkvLGTuGH00OujzAKiMiRsY0LRAhoS6GiroWE/u779mW
	 9LsZyvSffsCgDh7CeVogwhaSDBtaguFlfrEYDQkCHpA0LF6616xOPz0Qpt/zbC7M63Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
	b=yJM9N5J4thfTt7Fe9RNbyqStl9gucOMicLghKkc4lF0Eps24WniCWkuGbLXO1y95vQNe
	 /ukiMvieOaUh+Nnz5DxaSce/UN8BiOoXOIZg5hmjVE31hmJ1TtQLrce4WhRLuwFOEGuZ+
	 XpPyHBQ/bJjqiUWNCBRWBkUZXgYrlZ7811Y+cURc9HBmPtGRhBJ0/0CpoZ2qWHLfU5j7c
	 Oy0BXC0lwxFT2+7cOu6c0HnBLcaxuG7Xj4E1b/xRo84N26ixPaj01YW3OfNrdg5kUZ/L9
	 fFzEWaO+UZ5pJQRk5QSvhKrO+nYkz0DCRzHJ9sCT51HMGvgojlrxJVs/uLIaPL5h0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB1606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFEB1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f048476ab9so56662815ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787124; x=1796391924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=VRfcINcXZkGKJlamNcG7ibHTmkHDvq6tYYNhQjY8ADYHJWVBhMYpYMWxlRm2qkwme9
         lgTfSZBRZSLaG312p4Ohbr76U+E2prGbnT3tnj+y3hln2bc4Tgmktck+bQqd6qpQXR7O
         tOr3JiU5A4+HmQ28gVgxTLEnuDIjFyohxW7UNtSCDqueBxW5v+FxvDr5XEeH8NNks8j+
         eADDdfx9BNuutaS7srnsPUxi2rmFhSeD3tYDJMEhuZ8V/WVNs8+2dKZ8LuIOC1kFyAAB
         bPRwEn8AWHHS0vwm9zq8MrCkxzNPbmF6QFSZLGQDdcFsQMc0/v+H+D58OIk1vutYWRQA
         4dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787124; x=1796391924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=ho8trZ5J9nSqYkHkTOA0qJ4KBWsdz16S3sNZ5LCe6E5v02Zkd5NLbkkABBQazDL4aq
         mQ6pyDY7XKnlhlWpIpQnsWo8CQCUuxIY/cLk6oNrS4PUTO0kcHZ1jgMcT4V7jM+7BRS6
         SEHCvmyi0oy7MqhUX1XMDMgcO3d20dlAqtoA7NSJyw8fEQ5HA95AqlcjH68RdgcbeHMo
         w0b7gxzOgTr7BCqgf3RZ1tmrfvu5dBktrbMpn0hzP1gnsLoYL3txurXb1K/zg6uMyzJg
         fgvV35++VoW5KzFz1zeqeI85HyQ9EUMq7kebt2mKILCUThVawQtOlOkdvbDcE1/JjQRt
         EgHg==
X-Forwarded-Encrypted: i=1; AL+hErGfTAaSyk256dNpcU+ZYg11ukHxzeDQe8OiDeyZYRJwxYddAkNqcdehirKzP5KZj/NAns7rPAbm1Gri@vger.kernel.org
X-Gm-Message-State: APuU4Z9llxMyRf5u1s1G+qcJnNZge6dTroO0Me3dUejJQOEZ7QP66vUl
	EVISNsOH7AHrcR8TmK+GwLi8qE3MTSTsf7r3oTU3QvtBffL4Crfn/hAm
X-Gm-Gg: AZFdTZeomdJ/+pD7GH0dpPIdeNttwlZxEgiorBvxZPi4fNNTixrYx86CxZRyDacGjsj
	VJdopOKdsPYZYp7tC9B/nyCn6/DuFOLtKmqP52xDgUMvEeTVKlQzPmf/NeK2eRjBf02CftJAHdd
	1a+upO1McqHS2mIhZAZu5PP8KmNqd+jXHYuGnCgEuJumbD0bFLWaRv4imGdVw+tG0QSh66HYRm2
	NRvcr7UYd3PvGrKxv+9eNvV5ByloU9zd76IkpTZzyeb/xIsHb/OeIE6uSk+EFNpyROguQ2DngJR
	XKCoFMvHwbcqbgbmycYB/rXoCzou6XGdrey1gF4Vpb+QYpzJOWm2tdkPIEHMKIHNKqJIMg7vo21
	dHlvZUTUKqaShUr4VUcCq8p/XN0h73Wx3EV9nSXFm98SxHmQihuspq0h9S+HZwg+z3oV4cHGZ63
	DFvTDIVzKuZj/fkct5llG4RH0vKsvuNZyKKOTxKf+jjVShhKu48gIJzw46UF2inguKCURctl7sb
	33ITctP76nGUi8dnO4Xq8IYwW2g83rAti8wEyhqnEbGBq5KEn0yPrTRsxfuRlVXE3g1Vli5zCCR
	QgJNEcjPNuKnzsFXUB1QrbQVEsjnKt4IOLnz6Kj5kgtxJw==
X-Received: by 2002:a17:903:b4f:b0:2f0:3b8b:9145 with SMTP id d9443c01a7336-2f03f1851e2mr258565905ad.55.1795787123904;
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
Date: Fri, 27 Nov 2026 20:45:00 +0700
Message-ID: <20261127134507.125513-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
devicetree updates.

Changes in v5:
- Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
  entries in drivers/media/i2c/Kconfig.
- Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
  ov12a10 driver patch to preserve per-commit bisectability, and add
  MAINTAINERS entries for both bindings and drivers.
- ov12a10: Call pm_runtime_enable() before registering the async subdev, add
  v4l2_subdev_cleanup() in the probe error unwind path, update the active
  subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
  post-powerdown delay when reset_gpio is absent, and match the initial
  V4L2_CID_EXPOSURE maximum (3372) to the default mode.
- msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
  child node under `&rpm_requests`.
- Include base-commit metadata via git format-patch --base.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 MAINTAINERS                                   |  14 +
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  20 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 770 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 10 files changed, 1856 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c


base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.47.3

