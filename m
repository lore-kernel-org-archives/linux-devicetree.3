Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1746AF04
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572556; cv=none; b=lXBtAAS5q7BxYneSngoMJDEmL82v+ociCVY6dcLETY98oB1SgPgwANF7cd+JDKUFHRB4l/C/FBNyEHLNC1RqA90c4q6LcqVDk7u+Ukjv1xTq1pAkc2v6ZP2JZ7jJ7gkSkesMN6IVrw9hqZOVw1BMKIGVItH7pvAKv7ZgxTIy6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572556; c=relaxed/simple;
	bh=VXkbqPKO4qZPRHSbqS7kvLNOxopljNB7WO8rURb5MO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoQjKipFwELhm0xFtO2s05CAlyP6huw55FnnqBN4rvHi7M21rrAAw1v6jHxXNT56AbYyrby8v1S+ogePtYicV3eFtIOFzqrVty624cy+sJOws1cQHCV9teow18UMsiu37wkedKXcz6VGjayvgFjVGU45kjGit1k4eG0KcqpzDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBLrPH1y; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBLrPH1y"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ef5776530bso134357485a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572554; x=1778177354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=CBLrPH1y6hNXZixhhMQiRyAolRHarNmzJkfqUpHUJxLn2I3LPrH0JiXm50OdXSFXUL
         vefQLNZXxlhH6N+HoCG+fUu9UWDxvbjWY6L8FXR+s1oRiN0OgLb68ewqUXOMJTE7sBGd
         vqkpmdKnFaQ6VddkpFsLJpUxAmxhH8zgaj0aOFXo7/RkMvEGVVR9BcWtVEUmkxpSEGa2
         WdaQV0gIwMj4p9jLQMedrGuZ13Q9NN2PB4cRM2DXiLl/j0JZa+t+v7JnTtj7DFl++EJ7
         KnAUJrwkeXsuMor7LiGWF2l5RgPIrt2H9X3H2dAL4Gu4sZh10PrgOj6bJfehSf6duTYz
         yjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572554; x=1778177354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=byr6P+2EHjNaahptbBef2E8OfLNrKbTOw63OqwODNlqzpfUOsdovANWtr0tHoc9Q0I
         Bb5pm30o8XNklnMVsS+KubcQ5kSA6DLwURTG2dqKtS5IJaNzKeTJN5uTaZ4C/NDEtSaZ
         /hujyzWrdt83NF63VWt8zHjgumqdj2lMnqGfvzhI8avxL/w/veOlyUD3A7+Q+aFgDhKD
         ub0BhBD7qBRCTxhc9XPjxvg/bDOJXZHa9ETk13nd0csoakxJJbEbXjCSlid2hmMMrAuc
         xE0T8mYOM2LjI3J7mwyq2m6+CS6GnAlWzfA3ho/UaHH4zCFOI7i1s/20f1/ThdmiNDJH
         NdgA==
X-Forwarded-Encrypted: i=1; AFNElJ8PpqVgzsUPsXNZRA74rAzBOgchn/EGimExr/w0ZOuUiAUo0fpQeLkcEk0U2nnT8CWmhrn7myw7fnuK@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMrXu71LMg7m0MQru0CfB9i3o+9qC7o1/cW1oW05haAQc9zjl
	tVFW13EbCgioQA1dawqffif8wRd8QohfdpIZaYhdUJMjgXdZUXR2/acL
X-Gm-Gg: AeBDiesjSvH9s+tLeaIurJOoLqHQBwfK0C++/VdjnK5l1xlqdGxD1gFYWC7mfsytmyJ
	U5TpafSq/uMbKLC65RR+URZB4tUj0utNVNyPrh03ySiR5b27MMw5N1bf0o1JhW5gHrQ4HAG4fxH
	uSI4aACbNno7v8u8UW05KOUdQgTdVUgSkGFEmCmh/FUoVON5mwjIO7G13/oh8F/iBgu7hqs5SHp
	fOejTEbrFwyr2aLt/VoIsbNLB8LpQM4A5DWzpzqHgWyljrJMQhGcatrHJjJ8d0dpUFINJ6jMfF5
	/Q6JBcFGCcrek0AKZZ/74ddyXi5IpJ+RtRbuuVuok70FDUXnaJFJIctqHWARhlE6cdgPJU0M/dv
	dE+wEUFMXBVTnfSXVE12XHnwgMoNP/eJ9wen/Ii16Ldq3WFrDC7zHbCOXxUct2JIMzxChdiFGzr
	A8PhXcF8C1yqpYa6vzB0Z/BfHQAH9L9QMX3t4M8xZoY6BpmKKcjwhhNSHrhFxTpZ8UQDWhEQT3q
	WOAMPTDXF7+8uqE6jVQSDfDJg==
X-Received: by 2002:a05:620a:46a2:b0:8ec:9b8f:496a with SMTP id af79cd13be357-8fa8941ac26mr657960985a.51.1777572554197;
        Thu, 30 Apr 2026 11:09:14 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb4217728sm41887285a.40.2026.04.30.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Thu, 30 Apr 2026 14:09:58 -0400
Message-ID: <20260430181001.9256-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v12 (https://lore.kernel.org/r/20260331194437.41041-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
- mention 24 MHz in mclk2 comment (3/3)
- drop applied patches (previously 1-4/7)

Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
- add data-lanes to dts (everyone's review retained) (7/7)

Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes (4/7)

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (3):
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 +++++---
 2 files changed, 131 insertions(+), 15 deletions(-)

-- 
2.54.0

