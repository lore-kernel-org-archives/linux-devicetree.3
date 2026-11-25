Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609953;
	b=aSA8rPeIvHdcuiDdRhx4n4K6C82TCaqYbbkuD24e6VV3JsCbAJqnlqLaY31cCZerhDXf
	 WO+C9y3Pz9EsAALleu4bG9CPc9/GASzbtfffB290PCNyt4R/3wEpEmSM3MhUVecr3Ge49
	 zdrIryHx71jcr5C+2B8fwLQqpDW+NTESVJ3MxhZgY+wcqiTsAB7667rSxWMVYKcdUiaHs
	 QVx4j31hMmM9YsdZeqwrtcfGJOVL6XAdnk6Sjxqp21s6kXivlf6Bv/ZL3firLormQhVgm
	 GVqzzCEDpJRJYyJHCldfkGYXmwEP0Vbl6oZA7tkzzKdJhntWn3ZpeCa4sJKq/2EbrRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
	b=pQGZHHm6k5E5f7s4COKmDNjPCnDZXc1Z/cFox92vd2BGNUvP+3Qdltv3s34GuFvyyhgt
	 7dMIvDsyU2TWKryJzWs8g6FYo7mXyJOMW8YC2ad3ShawXeN/dp5qXos4HH+9sU8F7bdW3
	 /jJ9NugmEwycCEGkYFsaJgBIm/1cK72OWfvM1NRIP5e11Y5RhPFm3UMSzK+DiD2QzLFwW
	 r18MeAsmQFA3exHkDAW3g80bR+QJpZpJ1TKhDemltaUgu7b9ue9YyVhZS0paSia7O8cy5
	 7VxD8o2WoxRF7J6l7a8wY3ENAKVxGB9I4em4Vv07uEzyFAqbzkgCQOUXZtddEmYXmww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ppjk/PHX";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33949606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33949606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ppjk/PHX
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2402255a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609952; x=1796214752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=Ppjk/PHXaFf2xFYnTBi2dflKcU0hPvBRvusUu56u+X6FH3/D7MWrpc2TAdElIndzie
         r5b5IFSr/FZecCaM4clvxCwNoPcyYCygW4Koc8jqu16fbHdPP5dNj+f2swgSkZUuugCS
         s/SADxoPwCg0kTSvzM+rCUdOzdhHnBwOs2YfOqthL3g5i8/CoSyc6hLmvarCkZTahFTm
         s2Qr3l1l67VnUTiVAahMxc9jHO4cyRjmiWlR6Rq7ZUl6A9f1iACWbpvHxkVIw4jnEEpg
         oJHTRzVHAKJ302EvQMbmkA1aqM49jXXVkKaOxNi2ML0YYdIPxip7PQknR2CUZFawOUun
         6ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609952; x=1796214752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=If8KCcGAFTIV2ShRGf/TSKsD0spWdjKE4nseS1SE/eGKgz+9YD/WE2fDSecGoGylYQ
         oNq/MkbMgrcilciXs1bU2kZx+3qv5eSX7w35fGvZQM5KeYoWUQpY9UFRSLEhuBpWGBfi
         YRO/+4OGIszWoVYka+FdZvol0zBmL9XAD8pCYPfHv1GMQhr+1u/b5cm2uZC+LpVlbIr7
         TQpSZAT37/qLozEzodZBrJNlIYFarixXGs1ngNkRO3srEUisEcrtjIOpSsubhKE4Gt0F
         4VddkGT7oYsa16bDCq/oYXC/QqLR43J1kZQedpsbLt/9U5Onu7BJEPst3rKyhgVZ/N69
         EDDg==
X-Forwarded-Encrypted: i=1; AL+hErH7lFFCudjiOBZ0FSKEDw8bk39bynNvgq6w2I2E2BmIiM1Kj/OEPeZ0Dv1QyZf1ZDUgOdBn2YmISQvu@vger.kernel.org
X-Gm-Message-State: APuU4Z+xPGcgT/0VBcjgE6lTu7h4AjLCH5qPEUqkh+C9iTnD48+wHLjy
	kNWTCjKIa+fS34zAQS1Hj6Fx7jWh7qy81303EaIs4IrgOKP6UeGwu4cU
X-Gm-Gg: AZFdTZeftWYE9/XrSgy+l3As9h8d2lB4KJDB/KQbsYyQng9WtpwST1ZpZs+WBdGaqRJ
	P1u0fEw2e9pyOURiKxjLddUE+MPvAZX7UYcgbe7Q9DYVwIrzDPx0F1lTF7NhU7+0XcdQg2M/nL8
	xh+i+DACSbj1pECG2TFAW0UIAkWwrgQ3HB9Iji+YI7twKo+35F3A7oSM5T1e90ekDKh4mdUCh0P
	9CBQVb6QGD3pzDIfWfj9GuHYDTPUXC18emKVaqvG7n2K1jcoNlD5Tnls51MfkpqDX6nlZIlRCxQ
	WhgJ3sEVIGGj1vOTokSr+0bPutPkzpGoBt01U82kenZlB1JlBBEdEdMxRWiZ5QSMxFzhF9FvBtx
	7LA+04L73c9iBiOXlfXUCvCmbdNJCgszE09Az/XbHj4FSeFKS7w04UPfjY0fBxgnpzOdMXo5JgN
	LbOjLdD2NlCERALMCXYr793z2jW1wvrF9B/4q8ZKMcnO1pZYfy1TwxYF9sfvVDL6UYR9poarWyv
	yDokLwiuI6w1++pE4NhzEFQUhwjYAG7cO1vqUOdVbKoo5BGj3Nk65E4bNlTMjJEyAQWMN4qGK9I
	SlWKdcPKQPNpOoIz/U7BK7fO6PDBs0bwjRsYl4PqItGJtl09
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr16172380a91.54.1795609952223;
        Wed, 25 Nov 2026 04:32:32 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:39 +0700
Message-ID: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v4:
- Wrap all commit descriptions at 72 characters (Konrad Dybcio) and fix
  all checkpatch style/alignment checks in s5k5e8 and ov12a10.
- Keep CAMSS CSIPHY0/CSIPHY2 data-lanes 0-based (<0 1 2 3> and <0 1>)
  to match legacy_phy lane_base = 0 in camss_parse_endpoint_node().
- Add vdd_l23-supply = <&pm8953_s3> under &rpm_requests for S5K5E8 DVDD,
  and specify assigned-clocks / assigned-clock-rates (<24000000>) on
  both sensor nodes.
- Request powerdown-gpios instead of pwdn-gpios in ov12a10_probe(), check
  IS_ERR() on powerdown_gpio, drop vana_gpio, implement .init_state,
  add v4l2_subdev_cleanup(), set BIT(7) on OV12A10 test pattern enable,
  report 12MP native/crop selection rectangles, and validate CSI-2 fwnode
  endpoint and xvclk rate.
- Use pm_runtime_get_if_active(), check __v4l2_ctrl_modify_range() return
  value, keep post-power-on delay unconditional on reset_gpio, populate
  full pad colorimetry, and reject active format changes while streaming.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  62 +-
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 760 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 9 files changed, 1821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

