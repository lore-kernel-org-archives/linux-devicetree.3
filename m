Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C9C486B9A
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637467; cv=none; b=Wf1hH0X/YCccs1eBjgU/4qRzdlfGkf3bpd58AEOiU4AAGXP8w18gfLj8zf0746SdhQRfJv+FbZxDMpcTTh/NcJvW4jjfZ/RKUjWyN/xAjt5Q76/J2TD0lWP+BC6ggvGQ6BAbYnhzEvmGKgOt29CBAfb6uL/wfotW5tTqvYeOBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637467; c=relaxed/simple;
	bh=1Dp5lap9lrpf8yBi562e4hhl5LXAXrcbzfj+AqT4nyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjqXFRgQGVKTGJhIPVP+XNUZFn7drq18DJCL7XoUIywAiEMTTsUpAZo0+gXySmC2qKLGmwmCgJztVyDY0+osa8D3BT9jWmEoBAUzP8ONP7xNXflJJ6J150xf//XupXvdKKGNYgwqvpRm06mNJSAz4ULfXWL9Nf8tkw9cs6nEqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjqeR/W7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjqeR/W7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-471eeac43bfso792537f8f.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637463; x=1787242263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=FjqeR/W7fY62rB2aIQpLIfahnBzJ4+AHEXj/GZhOedDh5WNKr70d3sHgUAI7XMUdxk
         3MePuQ+kIhreL/5ujhg/CKaKlgvecDn6Kz6Deg7VbICJAT28VxkBH5/w3gAQAygKglO9
         Xtc1mZ+T5fUAuNUqbLFkrXqMkQXpp7R/ueAUwke4sxb5BDuydkNnoOdq4jpSELBuMyKd
         YZqSW7QpEpfzTzm13n5k+Zuei8OYy2/1Y9U+74eQwzJmzrtNFukZWJZQgz6ioAsqM2/q
         cY8+bFJ2SshhOBTZB/qAyH1RXRfmuVOD42u5g21RnBFihdfJ0SYa9Q96RLFqzwMpkqZh
         agLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637463; x=1787242263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=KTZxMQ6yJDzTHWyTxJ1pczhBCBVaFj69jhGzJpmpIzUvoFcJStYoI9Y6UM7RKYwTki
         isNsOQK/DUm/4iAoHQERZIKPC1kE5M2co2mZJmrRCT9iM2WMGE32wUDZwEkOJQn7XDa8
         LqReZbESeL+TCjW8/xu0jSukz/ZYEGYLZWyAgTBRx6eXLkBVHkzjRhCqIC+BJbIocCkJ
         vK7MhucdoOgKIC+VX4+4eH2Gx8n5CQ6A92nHyN/BCfyvzAz0IspfpwirZv+WljM3spUo
         3Sxr6YWLdocqWgNYj388Vn1bRZJezgDk66fDK4oFnWWpY7ZZ5OtOGmsLIOABzKpFkICQ
         4zqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+royfizkw6x+YYoiJP70UqREJp4pPmU7U60mxGqQHyB5Io1PcIMY19DunORCtiGAjOsFuf2RLwor7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cPXgj19xlt6QokbFPpCSDtCOBTiJS9A50/aMDf6KSIHWFlDs
	YK4yDkvBmJb3ktNzFid9LJcNyUUy374kbeh43DnfsKVrA1wzAw99Ojzg
X-Gm-Gg: AR+sD10ph4+Z2pMWfI/p7ooR8Ejdts1izB30VZbhgx/9IfDF2tdbZBe1C3/RdcFTHfx
	xrIkk+MD3j70eTM86bUwOE5h7xRjN1wwHVkdPaeN+1R0PBFqFBebxtvgPtI3ccRleZLz8vVAWDi
	Z79xStGPsxThNPzFnsdsLLyZ5Knd0v2GQg5ul2ujHJ78scwobgsN2qShjvf+3qp7+P5UFXN1dxo
	AztxQXYd8+XpX2eQn4cvHSzYaFchZR7b+9W1QcGUV+k7r/MO6zG65qN236Nu/5mRLy39qQt8Axo
	GJvYQakEc7ZCgRom2t1nSVCa0y98fyOu95+miek4dKQmhcJOuDnaYo86PSI9GmiOLEWy+cazrD8
	oKHoNtm8FBx9+AJiZmNZo7yh0jVcdLD/p4AgF2WYEFGMS7I1BOgDPNNb6cIHLE2860p6fbs5NfS
	x3qKKHF8wK8MkxBj3XqzdV4e0AXtiuoJaaUSGGO6uGFWTd+JgtEE5XSMoJLH3dQSKSgSg3Q6mo9
	dsd
X-Received: by 2002:a5d:5f56:0:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-4815a0414f0mr9891561f8f.26.1786637463204;
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:10:57 +0200
Message-ID: <20260813161101.2274327-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does, so the dts matches
  the commit message; both chips register on hardware (Sashiko review)
- the compatibles keep their hyphens; Krzysztof asked for hyphens in
  every newly introduced compatible in the v2 review

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
- use hyphens in the newly introduced compatibles
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      |  56 ++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

