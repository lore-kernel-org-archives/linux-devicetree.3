Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432100;
	b=MPOMRrojkcVO6dmqDsP4cFgKHHWcrPSO2nhMjk2zuScMa/uCeVPyv5uPL4HMWBrLXMmt
	 ADzXvW8xzVlUl5nhp10vZJ5CSRTCmfDjrHJC5iVnE0JnlUUUGw0s+h+0cFfZr8Iyq2QZ1
	 qSkShXN2ZeOvQg2C12wd036O1mfjx5UcZnXcKpXW+42mSWPjSlWMTR3G2AAUVfskE2KgI
	 HFc3jHlV717CNhwUJcyjOqqWoM95U23c4+j4+TcBviKuscm90Gwa6mJweMdks1FHOiiQe
	 wBbdlLvRlrig9PaPm56eWlpJuwF82pZj/zbFi+aY5Z6j1LJZ6GDwp1r+ajLusJBj5qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
	b=d+D6ZSFD63MG70BxFuLvhMW6xi9VSulDLSia4JGb/zeV55esxFLNrgminWg05IikWOvc
	 Zup7uq3BlcR9auv1mzOApYzrzkj6zJpaXLx0VODLud24QfFAAhYL15vQcLV2Tnn/E/KAA
	 yrf0dy4T7CxfYP2qPW88yJnNNbCj1ybGKc68LkKaQxnR872P9yZD/cABXNJTawgNOwZUX
	 p3oKYpx8GkC7NPyQO4K9ooS6EbHBkrc+JWrsqg0hA+sKP5IA9b4alyJMobZ52FQ5bJtw0
	 eRroK5MrBdqwNBvho25Uqm6NH//DZC4ybhvQ3Jghd40apC0rMCOOztYJn2bXvKBBDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85887606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85887606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so3510955c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432100; x=1796036900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=ec3UFjGzf+Ax+mOyj+jbqDFmxv1s+/ilYTPPCkCGVgYuPO3q35DWB/+HRF/Oz2sLvL
         3aQyHI6tHe6HhGEfoUlt+RPLm8ZWtFcdQbDy9jO3MlFzg7xTHIVOcfPEQcIPxRIAVWzQ
         BZ5lRfv4aUhyVlfNm6x6F94Qj4rbgapEOVaNaU+0o+/9/9iRZAOfOBG6MpyGxIQUt3xO
         ALHIZuvHue22QtQ81fiHVBB+0KkjfYRpS44nsn1Fob4Ikd3/1INTRshst8/sQFb0hzRj
         MAVu9TNdZwo0izTaUC/5fX2acbHZrF7RzdRbrdJR8h5+MxGc+rwHlVjLyFEt2n4mkv6k
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432100; x=1796036900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=o5R/zeHwqZ3ZVLKWNGqb4I6HfWqWN6iR2Y3MUVcSYLDKd4Pij31uMJj4HV3UtZ59kY
         W8LXLSB9bp294Mr2DYxniO5FUG+VoGwaQ5uJCvNXHGOI2qfPJJW95XvfFECcmM5Q4j1u
         LHTeebUhgKm+P/Dnx89HoLu+rLdOrSBBe3EcN1wPLEFvBFJNiCT2rIKbj1ZFwPi4d0ZH
         Ekw6KGM6MfLeyB79hxYixiz1KaACxhITNJaI1Q7s/CjGevP+NX1iTql7dbBl2LEv7Uli
         7NUOvLQzYA3pw3mGMv8WD7rQk08KRrtqMCVOcxadhAbX12sLHJq83sM6vMtTXK8ksD/F
         +eKg==
X-Forwarded-Encrypted: i=1; AL+hErHXUmkn/NwXC8vtA3WfDRatbRXld9+O+Z4jfQjVamFlEE9DtjqWLWwwI6ry4Rimk8GDLbSAnOfdheTB@vger.kernel.org
X-Gm-Message-State: APuU4Z/HjZu7ckDxxNgZi18IcRjj5PH8DnAhQ2kPLIT8FOvEL7lFy+/n
	Vmq16eFfTkTvWqyvEgXkWQP2ZUaJEhHBgOcUb3bhgvu385JqxvC7fw5V
X-Gm-Gg: AZFdTZdhT8OxGifEyvYdKveAt0VXypq46ZFNoH9YPhZu2nWzq2AHvP45o9wdDWzjp/Q
	WhIliOS0QEAOmnbe5D2XeDDtxYrhhVHhRdtXOdv48NlFj6d2CPTPHI/hSm8cI2NIbjjbMgfPxh8
	A3SBjGIhWJhZaOdpf9dIdVjocMYxlOZsoWykcoqZEhZTHenkFIvb9INKkkONRby+iauvF3aiCGW
	pUdlkT2J1oHIiL16qgxa8MttUKZvL/UHpk+v1BQZ0SCBBAtzz0iI6RtHvBtr/P3oyb/ypfttrgn
	fNELUQYvSxGjEo+7zPNeBStP8+s5z6HJwFmnmt6PX3RxC/Es+ybPUW80Utr10bzvM6r9vQ4iFd+
	rYPRqcaxtTKYXneTywddMfk9rOpQASJo0eIrL8f8Fmy4r5nbYcRaHPWU3TWq/cqwD7dt3YuOnDx
	OLck0kGeBMNGtFbfXevJlymI0vIAK96BdMTW8hOTwzOubu+B2+r7sElTW66kh7SeKx69yyPrk7M
	MgjuNgnnK3+MOzMZH2MLQQ6OSLzpTWMt6NFHj1AxiwPHbp3TYsyVR3FMFa2naisD0J29KNOcMvU
	cgYEZHLDoVjzVUWKAnbVRi+gho0HAsQGvxjP8kHkgMH8Sw==
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b56f87ab60mr3863029c88.16.1795432099526;
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:07:59 +0700
Message-ID: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

This series enables both the front (Samsung S5K5E8) and rear (OmniVision
OV12A10) MIPI CSI-2 cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot):

- Fix the 100 MHz parent entry in ftbl_csi_phytimer_clk_src so
  gcc_camss_csi0phytimer_clk enables properly on MSM8953.
- Add Devicetree binding schemas and V4L2 subdev drivers for the Samsung
  S5K5E8 and OmniVision OV12A10 CMOS image sensors.
- Wire up CAMSS, CCI, CSIPHY0/CSIPHY2, and both camera sensors in
  msm8953-xiaomi-tissot.dts.

Tested on Xiaomi Mi A1 (tissot) using libcamera SimpleISP and GNOME Snapshot.

Hikmah Gumelar (6):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  26 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 8 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

