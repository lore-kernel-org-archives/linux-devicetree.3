Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447676;
	b=VK8HEJ2jPYpoDdczcESPX+911JkN2SvCqRBUCVQbigdeG+Eip7L995jY/dHOyj740dPG
	 tdxMMg86DIAFdOHpKtsVCBJ/qI2USToGoQnbnKb5jFF0+phFOPxksAes+MZ/9X4ShQXUv
	 I3svPtGN8gIfz+8zzPGX8D7Iclf+Ttjee4BcivkSGNqHL4thtMAi2pE+tl71XlMT/TJ1F
	 ts8oehRpgj/l4+rpvegHDFRkIGpEyourqoxCJUKjhkPTlRIGkncjWfUB5iEoha3FrHNU5
	 V9736IcHOZezik4R020CTjpXOJER4kQ3sC/GDdhniOcot03E+ZtvccluJRZJEP3V2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
	b=lc7of0LHOYylVbglXrwaJcZovGAMC7waM3tHQTUQvkJdffJ3Z9XgunSPWhkOyki8hYO+
	 uHQedfOOrZnIHBLZDv65wNnMTb91qV6l/Bc58uAwbO45K1h5yetr15dehkQjXirxjvTnH
	 RQFCMcUMm3qjtAsY1XYE7OkHOkXO+1igmwSp3Xwehqx7Ac6PteyFuk36mCXfmJP2nz2cf
	 +q8m3ZojlemjQjiLRsFQkXSnoJcIrRO6jKaJpRi+LSdp2iTApfIVuZ7tfXSXIcdR/f7Wh
	 o9ZXtpyWTQvTgP6LQlTNoeQDytgknbtsxUXCUJN/Sz83/B1vVcmM350QumbwgFPFnjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579C606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1579C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38699cf08dfso3296892eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447674; x=1796052474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=cWUb1R2vJjz6q1bHmoPN/LqInvTMfkVUHJM4/GfA2TcN29DOBUjjq8PtpXn5jaj5AL
         93lxc+XMTCtIQ+iYvqkvAWdBYKVc7/OGn8+41OgyJowmRjEGLTX8UIqIv1s8UCJfmqYk
         AzomVOu58i73iY/MROCpGxPoHo9igrRfdDeNzrI7OKLGSbfrXrSHUTMziEfZCM9z8r+B
         VBQ1n3AmEHl3IwSJ1PcxhZuO78OiBdcDPoAv+SjwCWtQ/gu8RB9cWNYT75p2l7guU70D
         nCeDlvuXjJyXpdv3FcZFxsnRu6O3lmeDvcfcQmCKaOw/FgBK1982jNY60Awlp/F1GNiH
         cwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447674; x=1796052474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=T719+FI2JFGnD9T1AMQFiJKFT4ugsW6RMRNTjbFNnjPza0ftaWpjt8fZ6uz8TGRqsE
         zWoeliOJoMOUYYcURGSoSEB4YrK7fFy3LoD87LLlU0nXcByRSPQy1SE8bSlRD3CBRZAu
         LTZ/VFGH+perKlDMSrDtgPU7rjASM47JbeubEJ4c4rq0Nk9YdwVzDnxgnDoMsgaapAZK
         CIOlx1AHDawClGhCOLiQ5La5fP5K7U4+6Z/oVBu2/CexNUd9/3yItjwrbD5Fm926Xzvo
         vWiNte9dBSBGLefJ96btzaHWgg6NYAsoWtEvH1h7rtOAZUDUFSwUrS6tbtE6YK9xty5f
         mhlw==
X-Forwarded-Encrypted: i=1; AL+hErHi/AVElnyaXxKI5MRBVQ9TLGjpWXCmerPGzsle28kNtiXicWfypQWoqR7WDmi4hWpUXzlsLqDfmhVZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+rmOGSWjpUjXwGxERK+sOBX2/Cd708OfFIRY3uPVRkcY11HF5R
	IR93g68OJQBgz7NDBviFLzPK79J9L8DKt6+ENb66Lg8Ryu3lQ9KKAusFQ+LNV/UaM9I=
X-Gm-Gg: AZFdTZcCAwSSQgiolcG36o89HZHG8L6bLTYIFp86F6FtJ39URGsz2YBrSFgOiBs4qXb
	FRTYDQXdd5TKFzCkZmG2nUJAt36eYV4lQ5P5enZoep+bqHfuXxC3pahHsJ6UyDDs+6KAsuTQwLz
	NTEGBe4a7Fn97j7zZb5wZFQKwfEUvAQZin95io5SC4Wn+lvU/j3qynnyaHFfhx2xpIhIIlfaofG
	9xUUbQ9Z6wDLFnJ6gOt/ripmxlrnGNTHrMx84Ik9lyL2bonZIIynjX9ZhE/1GKHQWmw1oav/gGF
	uROehBdhCFG+y+2NMayMZEH2MxQtKIfHQfmnq9nK4BkAAN3BPHGmNzZtyu7hb/ageFgAb8OBdqy
	xA7LK7MwWBfojjoXa5vMukAWyLO6mbh0SFKat83UoyQU6GiOeXMREZZxQUr9a07HIpxh1zWJvji
	vli3MRzIvZX499OpCg2wDSwckJArvv3CAgiphaDvYGLrkbtu0hPLn7Wpkq6ZLpB1EHlJ4ewg+GA
	gjgGTdc2GSD7elYQFYPSuLUxbdc6K9afQmz7wvDh2QkMK7H5GITXTl3kFsP8awzE1PhrKQxStBh
	2KUbZg1m7h7Il9jJcjibSwHExiTmO3fluoFqHf1ZGIJA4g==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr12093640eec.29.1795447674020;
        Mon, 23 Nov 2026 07:27:54 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:53 -0800 (PST)
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
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:15 +0700
Message-ID: <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Changes in v3:
- Add Fixes trailer to clk: qcom: gcc-msm8953 commit.
- Fix $id and $schema URIs and switch MIPI CSI-2 data-lanes to 1-based.
- Replace deprecated pwdn-gpios with powerdown-gpios and model GPIO62 as
  a fixed regulator (vreg_cam_avdd) supplying avdd-supply.
- Drop unneeded <linux/mod_devicetable.h> includes from s5k5e8.c and
  ov12a10.c (suggested by Uwe Kleine-Koenig).
- Fix runtime PM ordering, pm_runtime_get_if_in_use() <= 0 checks, active
  state initialization (.init_state), v4l2_subdev_cleanup(), exposure range
  updates on VBLANK change, test pattern enable bit, and endpoint/clock checks.
- Drop undocumented interconnects from camss@1b00020 and sort nodes/pins.

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added MSM8953 SoC CAMSS node and MCLK pinctrl states to msm8953.dtsi.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 719 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 555 ++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

