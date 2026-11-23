Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437361;
	b=KicwQDU+DF7OHUEHpQ7A9/uPZsVpyUHJKmDEWcBbB2n6gud2RLIp/xbhbCX9kJX3F7//
	 yBqXVmUBTPXUX2aeW3hYncWYxCUZ8OhOQNGSaSAhUCGMDS2hQtK2Tt6QLHV/9Qyc3b0tF
	 /31D0XucU0NnG6cJIGwVWr3Dzo3s/5pt1GNObCEWA27kcG5Sxxyl+QRw2WB/9k51woOQI
	 Si+mAdO7Nb3CVUfqRQxxzwpTWeeuAaThm+0chVueXeNTL8qSZ6AEF8YMChjGY9oSWcfW1
	 9k9nk+TqPxPx19fQIgH6V4H+1vQW+zm8EFiuDwVWW8zztf09drpw6dZidWdyLImr22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
	b=ksr6uO/IPMscLTq9Q8T0tJS/V0iP7ab9+7TdWpvuyXi9EjCs/Ep+IDS1WvJy89xxX8qh
	 yYVs0MUFWA6xVPyUJXSkoR/Vwg/xG56Vt9o0UAyfaZH7LPRWCD9/WNxSg1owksyi/0lxg
	 eMEpXxNrqYC28hjcTZS/JdJFUZoVjSEVLPXxCuUO3jJAEdS/D57HzDsFcMZlwSt1u2t+V
	 zglvADxM18ozJIJLxwwA2Sla1k+77clg78zDHuq5q9WFKqEdhtBTzQOINbdxbhxGQkhlu
	 PgiPKOoMwMtZIWxZhv3IWE/eIKYFCY9nLSJkTxIfvZh/S/mSua8EcgavcphTWj0U1BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26562606A337
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26562606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382f4710a17so5494728eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437360; x=1796042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=QTqnQskKRIE1cgebk3mNS42vnXeE3k4W3M13JDorM8JvXmThQ7ACiYCLcu4VK+bQ9V
         g9layI4Geer0IOQZSMpwe9SmleQDj3GdZ0xBTxfRnNCZcIoDxaN4eMTAAQcEORsQ0/80
         tii9DA5HDOBumdveehsPOCePuj/xeFzr+6lGzKrTexMPx6iaf2QQaouV9oVfECfX4GbR
         tktf5MzOOMFFJmCl5KCqs0BusxJIYl022a8IDjATdmIUAL2jKzvhtbHQmBqgFV+QyZlp
         5QUGCEimTBcZ/hVaYWkKucKZXfSp2wPr67biq8Y4qw8gmMngKzfe9Z6+Nfv+VVPoYlOQ
         cPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437360; x=1796042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=kjuGwhrmByMYo0RSWOx4LcPy1bmPll31Tu0TobHAtS5zIrcDNeG0tBn7aIiSMr8+bx
         NGQs8VQjKW2C+yRX2vNt+mFgfeOZQeahAzN55vCsjI2t9R3wqH8n1kvx6ZPnwEZDPhST
         lPlXQdPJrKGE2jmYq6QlkVdGvB8+DnvuSiDdn9lhz/V19jwr7Z+tJ8WJ2mjpw0ss+hDN
         Y4tB2jwycjh3FtOjouL3jbl9P3KzvmjMDntzC08wBwXc2TdrKt/CJrYEP9zcUcA213nW
         pwy1nOGE0fY6ORh3wo04/WtcWb2WVXuETy650P9N4+mQ6ytsus04ko/hGYLyD39J4Ty9
         /xGg==
X-Forwarded-Encrypted: i=1; AL+hErFF0o9dNCmdbNP/0FzyaIzy5oUUtaI23ECQ6XLxazsSk/fmYi5FnHtLVpgdgwaaUT+JFm62oZm+WFaQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/qmopf4aBeIG9D8UR818WWO+GA4fTDVtEjExeo6O9Eowz0e5am
	KGN9iMco5YVOx9ZJ/XytBzNXRYs819itt0Nq3KzGqT5Eb6qxx2JuUMVJ
X-Gm-Gg: AZFdTZdq4UVcoJ+neyxuqmPmleqYGdx9rbAD7Mdo+WISWJwxQHc+cRX/c98V38IYaG7
	GFkY17G8LtczPoNIevkwI06s4FVkMWOAIaeP3lLJyfsUUl2s3SL1Vmc01RI9ZobX7/KmTiPYSqa
	Kj7SzIhqYqsyKzib4rf2je8DXklAXz21V0IT2nGbHA855vEZCJEXMy6vdo8tawn32blBwOWJDpt
	q26kg+TgWnNkw5O2PlhTok059MKTb96u3PmlqjGCSNAIj/RzZ2F6VYXoDeJm4+Z+l7JCkjJA+Rh
	7jMAwe4pCIcEeZOUR1S3TPrU19aqsPhYNHGr/leuWBwVcdOls2iOt1yUlrfPBKbjfmHAG9I7OoS
	ESUnWEqQN6aIOqIbMq2y1vcftTVg6WLsWIK6+Ea1ahImU/CcnDmjKx2ULGJnj5OhBBZVDcF6xEp
	WsqjckcnQLvZbHUpSZaQ7YdJ/peOuiIksx9WHI8uUbGOQe71aTi2ax1JWAZjoZrJ7ilFiVv3qJc
	vuuwhm466wBJ/Uv33uII8mpZ6TYAEneqGYpK3X7O6xnzDtaUN/naR6ERGItpAF+/1jeIb7dwkgB
	qB/tn77LVJ2GgFCvg8iqjh91cnO+d8c24W1ZKA9WyYlM/g==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr6531336eec.24.1795437360084;
        Mon, 23 Nov 2026 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:59 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:39 +0700
Message-ID: <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added the missing MSM8953 SoC CAMSS node and MCLK pinctrl states to
  msm8953.dtsi so the board DTB builds cleanly on upstream.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 155 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  18 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 9 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

