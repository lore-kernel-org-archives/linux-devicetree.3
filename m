Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139234E75E
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663803; cv=none; b=ryzPh4CJHlallpl83MOEU2FL6rDJyuVhjTnTxcQukZcMTQk0w4iGpaB2Co4v7Lmjl0Whg8qRGn1tG9GhJtHCdD4lNMZA+6jUx1MF/7XXREaWC0s40lUUs1dy/NPxQgzVBDGtbSp5AWtfzrMLkK+96uaVVCxJK1fHjC/oGgucKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663803; c=relaxed/simple;
	bh=uW/3K3UMjEvwTByyxHR7Fhx15GvNRE9uCTdeKnub7O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTBpU/qqrnKve+vSD04oX24G111mXLhRxqwUfME9xDYU0leG+fE58Zl1QVRdMjEOylPfqsLlbrAb4Wk+K7wZhcwfKmWDiT3+GQF0RxLcFEb+26F6iwh59uW5GhH/TmYdaovBnkF2/H23/NeqopljZFu9B9gqXI4xPX4cp1JD1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXgq126o; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXgq126o"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89f1e767f92so458186d6.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663801; x=1775268601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wJ27J4UnIhxs5w1VYO5h8hnetS3rFQPmJPMQB2sOXQ=;
        b=kXgq126ojvs944gyzr/zdrqBdN0g+WfOxXkz9MfWZA03mq1Cu2fly0uMGEyR5WDD4Z
         Aun8p0WurkO8RtwzTecjG8Uj+bmvZAhvIkyVG6dLgsd0dO1ngKfKQ2+Wqh+o1F69Ivm3
         8fUAnlzviy39BIrsI8yLioJI1OlJiz0pRgMryup8porp19xaZOk+78HwWS9+g3iCl1mo
         FnQ0ajaGn1HIx/fTzZR0pKTyOW6KFsHi0UKQVYb1ALDPTWUIXIfTIzCuPDeWJtChbsip
         PQm4xu8S+GUxYTtbKK3AGpuW5aZDbNy4sFdV1263aLY2DmUYq/f5TPKIKzdK72gpgzyj
         g/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663801; x=1775268601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wJ27J4UnIhxs5w1VYO5h8hnetS3rFQPmJPMQB2sOXQ=;
        b=BBKqRWitnr4xj1FqaM/7eR89et1uBTMbJTFShqoUxig6rBBAJTmzVOHGSnk7gqNoWD
         OPrfr/skFZI26cnhrIyn1D/BKQtCa+mgj14dQcb3foBWGV/CMFEWTGAjBqC+tefcmYFx
         Jg8CqxEJzJZ9DJW82wfnUmxmrEGowsCItnFdMtZaE2IGPP5UDk5tUEM+Qz+i/HB8dxWt
         Kjw4OwE66hnVQcwe4cu5gjrehj5saBfsFfHss7pOkqVrG0wZxgiZTWb6UMDIl48X33N3
         SZFecRH3p9DekEtfLRl3LOwLnW4DXoBHKvJkTP5NVLA8yr97wylgBQ3Njf0gQUeFZyQD
         zVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWg9w8FATmuX6L2EJe1GL3PaDmjr1FU3InXYAx97xRYS4iQwNW3eE5hb4dVGuAZrQgnRD620gUkc3Wi@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRhxcIuO7jNjuuaaNRo7b6ZoRVKUPzuK9icLTs82lSbz3S/CX
	Ie5vHypHJUt/rNl59BzgSvkpdRz3ix1OW5uqTS8ueHO0HIHJvPalypYSsYwk3A==
X-Gm-Gg: ATEYQzx/LpfFO1mWqTuAgid/RVqd/aFm25I2yGcqKAcBukL9kCQRIWjEUvAIlapOmLK
	Rwh6jfQAXh+1ICrgd+fMWLduDgRiewMVOVKoY5UUKDRYfM5m4By/6hM9xSteSB5a2rzjWiPCZo1
	tL9IWokzeMjp9q9NpcLbBWuF1aGbmNEjAe9aTR7KkKHOi/5AyDYD18jvQFTzrdnzYuInnmPZREl
	UtyRB55d/FK82jQSdw6L7ljSHPqkOKHZwDo3sZx9VfIyszyFwUcPB171sUyabSdlt6FvkqXRYOo
	ix2Vu4jDWtkj9PVs1T8I6BRjzoAohtFc2MC5/vcTwa82SK+Qpo9lC6Omg5B2JWean2q9xQOd1mo
	4ickWisBYm519EluaTVsNAbk8ALJTfo+8BgBSn+TsS5HYeyRRclSzUBwicWH+YyRo2x8mwm56r7
	BXLW3xfPpQhznnHnqzCIYkFfIV+0yjhCuD8REN
X-Received: by 2002:a05:6214:2425:b0:89c:dc57:326d with SMTP id 6a1803df08f44-89ce8ea0a31mr69749096d6.38.1774663801184;
        Fri, 27 Mar 2026 19:10:01 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf2820d8sm7937796d6.26.2026.03.27.19.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
Date: Fri, 27 Mar 2026 22:10:31 -0400
Message-ID: <20260328021036.85945-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

Dependencies:
- SDM670 Basic SoC thermal zones (devicetree nodes are touching)
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
- add minItems and maxItems (1/5)
- add review tags (2-5/5)

Changes since v1 (https://lore.kernel.org/r/20260210021109.11906-1-mailingradian@gmail.com):
- add LPASS in dt-bindings patch subject (2/5)
- change pin names (2/5, 3/5, 4/5)
- add reviewed-by from Krzysztof (2/5)
- specify gpio-reserved-ranges (1/5, 5/5)

Richard Acayan (5):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl
  arm64: dts: qcom: sdm670-google: add reserved lpi gpios

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   8 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0

