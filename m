Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796070;
	b=e+EEhe5Hn5OWbeNgaK5fmSh8URsQ2krXh3Tq61v2viSVDxgA9bHmbIyaj8Rq81Fbe2Zl
	 IHl/AvOzKo0uluaEVbyisl0RMhYBtXv1LV3EjZFpsYGqHnAr6YmvWX0TxeWQXBgEkbR+3
	 N3kJgbKQfEHjw6MYU73+uAg4k/cTmZ9yAPpnm5a8Ew4SqpeNrytNhv2cF9FRYfjtAMjnN
	 YrI+GAdt5quX3hIuquw3I185KoMkdrGlAiSYCEoQbQZ6ZRYY+JDiJRhZkggtLVsK2pFe/
	 CGTaJIpXH/mf41rr46+jVKnS/SzYPooSASNfArhYkOOR5uAMt98gPH/iOOYD3sXd5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
	b=pwXM4wXQPqcZdGjKTs4lPl81Io7CEdFG/764TEPDErwSy/Fdwneb0C5rXZ60hj93aN8t
	 L90LvhMqo0F7ghWy9ODF5OJMfJDDn32O3R2p6f065JaqM3obVBXevc/AiD4dEUYlSPS8r
	 mItYNP47JO7aOf4uMyh/hy1XSV2udtCFIeZy2ay2aqjGqMWBxWXL/cw0tXayR5VIGLSl3
	 ycmd+meuxq/DYutH2UFF6SSsO/l0lzSDnCX68oBMHInJ6yYTI0CBiRM7KW2T4pST3ITx3
	 o7/GeCQuqa4jq2DDXqHTL6tidWkQMdSu8jpH4AGhdH4GhK0pkdhjFAJAx2NfWwC2gsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nPrA/j3h";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F361D606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F361D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPrA/j3h
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4025585e9.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796068; x=1794400868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=nPrA/j3hW/O99kGx7s7SfheqzoTdHcd7g8W0JNdsUl00HXqTn8wSNxBLgNloX3FIyX
         YO7/f3D5E18Qlkt79cbst05LdOHDR1AS7pXXPq35ksVs9SsYj8NXcmqHvvlOAleTHGTu
         UC8fEr2kVQZS96YagjQZxneYbBb+do3+oaK1SEufyUS6kp0xBIFmLzNOEDZGwyHx91xR
         Lwq5mYGeo66/wTMaofcA4vh3sHp3wRFyQI25eoefUO1zLsJ7YjYDQrMLR289PvmRvLIq
         u/lgVyiFQb4CPuwsnhFgppKQLDDoRdfZZZ8teZ5djHsGe5TPjk34aWGZCNdLTF8QEomL
         6ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796068; x=1794400868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=okD5oE52GErFyxmQezrvdgdTesA3K6/E5KrgjBR3Y2GGsZATjN7Fy9og73jOu5d4KY
         S5KlAPlVmdojjND/CrdleXQUt+UcxLJKc6WUdK5AnOOlXkj8bGVmKusRCInR93htHh3P
         HpliJRiw7nNDLstF9Fj45/F4LdsuWZkn7E+LffP0LSDh031ODwHOHYPvl94eALYMZXl3
         inylbD+qBSAMaZY+Ol/mSm9p/khVeT/Voy5anTz6IQ3JMp1XPFYPvRtIsXDq/VaB9L5V
         L3iZUNW+XLKEu3PFk2wMwUycEwrWtQgG1WdJHBkJgmeSazSfkrpdwqfNLuNDMFw9vCcq
         kSQA==
X-Forwarded-Encrypted: i=1; AKwUvBxR91squahDzN+jHJ6ZOvKsTYMOXfjJ7GH8oQK0RtkGoeCGw1I2hfG/xv/RNUtlBhgZ4n7Xu9WQWVAZ@vger.kernel.org
X-Gm-Message-State: APuU4Z92Ae2HvD7irEQWXRj726TsqcHm2YxGHoyQ7xGzl1Lxx7gy9SpV
	8EPk+rNICO05AkcK090ULLb9FPDxGfqFbn8r2dnarM6WK6snGmOIcM0i
X-Gm-Gg: AYBFou2LKR5OMOZnhK+QhoGLxl4gRizE2LwEB/OwkoxJJByATgwLLec1JXX4Lx33ekd
	qXEMsyCQIwv2oN988TpvDZ/Wt1U+3QBpaSKzthPo11bEteClAbZxUpCMdpJ65KjBaNiVIrIK8pZ
	vyfAqnMY+88Mjf7e2EyDZzI0GTwz2zphaDWWFMKdD9DckGpNOizzEaGKg6uvbZokGAUO6BBRXle
	toWc3LpV2Or8tC85MxKljqo9ji+x4VSlGZjJS9LlM9TaYwUOCRq7BvH0eOSAkQFukWwpOVzZNOM
	s2zlmA9f9XiQnnmSw+mXRN3bUa4GhUGyV/XNmDZuMWDBDCizfCeuijOePF3C1HKT4AgUJYV9fyR
	u0qpoGUVo31lxL6T7QRVOlzAgj23Ig6b1XVvAF+KR/bG52BsmlHzy0Pu5J++nO49zH6JbXZjoGF
	MXg2vmF3CRQDo3ZJPBOaZXFrvlB/UWInCdYSsfZh18dULAdaXU3PcvkMif4uWGLNZsOvKS60sJ1
	bH3If3GzQptvKYkZSkzt3ni7zRe/wkYd9Up1yxSrkgjJh6dbSL5sXBiWUHFHw48NcQ8EZMVyUo2
	odb5B8oovbK9HHrHxiPErJAfWoWCMjZBRUVdh6P5IJnbdthhhiU=
X-Received: by 2002:a05:600c:3ba5:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ac16fa356cmr437727975e9.11.1793796068291;
        Wed, 04 Nov 2026 04:41:08 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Wed,  4 Nov 2026 14:40:50 +0200
Message-ID: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

---
- fix dai cells in wlf,wm8994
- fix commit message in maxim,max98088
---

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

