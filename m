Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8740EE56A
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865097; cv=none; b=rtpPexst8+AmAZqYqpvzT2m/wp6cLC9KKewoT2AybpgEW3mhaCPddEJ3VcnruYGhkol5d9IPqT1wLYQcmDV6PF5c/hI5M6XOYp3n+wLl0USXKLcl2wqYSy1hs8HC+4LfsqHvdlEUhSZhpjDKUhtGt7B1y/hyMK0TaBduwOm3WDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865097; c=relaxed/simple;
	bh=RZJR00KmD2ZKfCUB3a3vis8Tf/GiYfiWkkYW3q3QoqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4vLSgb2QpeuUGD/JY9BJypM2RkLo4y1RtBo6Jbb3T3G21rHwK1Q3kWPVsZsTSkkKECjolhcZEeOjt4ALTZ+xYffF+dEU75hlyZEhik5wr7KL1OKWMvc83i+n6JazWKJiNS4hJFn0u7mqbjh9uQZ+a8VAPw9xqs51JDqTBx0K/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9lvL+U5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9lvL+U5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso15033855e9.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783865095; x=1784469895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7Wan3BpmnpABOkhMGTFpss7z1lqzP+pREkrztnqYrU=;
        b=A9lvL+U5+dJPDJQn3ynYhx8lVbbNKkEb72HtqU/Y1Vzm3YLe1QuhTSewcAFPubS9Ul
         9jDgWEkYEHWgZ7FriE7cX26xZ7aC5aM9aTPPgz3jPFw9PYQwe7pMumZvK/HX3xnYj3Zb
         c03O2GZcr0aGDGF0cYa9VVQ2YPQMqSoC847Dv3uKhKHKP52lEo4RtbkwhAX+yfq9Zs1J
         Tt1vh+KHw1DVwEr3O3Be2nOSSPJpBhqNJvPoficKg6vyD8kas8nfzj6utRu4kFdP9JKS
         TP6sxhwFp/Sk0TO0u/rT6DLnaakVeipgJaNdUrw9yG3LAHEIGJUmOkJ0d0pr31h1wRtE
         0Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865095; x=1784469895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7Wan3BpmnpABOkhMGTFpss7z1lqzP+pREkrztnqYrU=;
        b=SeyWSdgijekVj7xuDHFQx4sbUEz3/k6FttmfBkxSLwaimMbuQgf9K8L9W93MRiKPLq
         Lf4XfDcJiu/vFrqDdru7WTWNv3gtZzt1bileHyQ9LcI1SP1HhkqXP739T9fzDDEA48H4
         kPnTvupb76PZW4wmap953yUQ/oTP0qRV5xsA+HGWGqfxR3sLDA6eZzOwf/+QqxaNI+MN
         +FGAd60IBESlBD8ZxVeddupgxxjdSjEOIxasgbbai5I89HsXQOHJgSJbif0iEoO9PG+2
         S+piwfCNBJITrOr5H+jhP8FIcBX4U5GNpCY+sxvs7/WwO87F1N4wQAsEFciLqhusQqJa
         mIGg==
X-Forwarded-Encrypted: i=1; AHgh+RoE36Z6ohpXweHcK9vPEoeUdA50hTKP8W9WpMdrl8EZMVRsP2w4EoZyp2sWUxQDdNzo1O6CJ1h+cyXn@vger.kernel.org
X-Gm-Message-State: AOJu0YzvEXbiursECZEtF7FJlfXRWSn1WXUeYd3hds6r+HGbiN9YnkVF
	dZfdyACCxXK7EOCMkJEtYyE+KQcgPipRrcGXagR0c+sBWoL386JCp5Na
X-Gm-Gg: AfdE7cmmOrzgPAWbKdzdkXprzT49bzJZXm9Wr0/Q6E1uD1LI4RjgqZrQ/lA3WJEOQzq
	ukFe6532iihTf1/xD9PhSfynlw16kU9HOj9LHfAdpyvVs2nK+7QFJ4ZGEM37eYSUcwqx4O2JPF6
	pn2MKteNo0O7TQtLLHzyOGLRAvgOz+IQqMSd5do01pTQDup4I+u2KoeJjgzHOwCpQP4rrQkDsDq
	DtpWsnhrexgFeNWO/9dsB7pb+ATTjEzlLINihWP44bCnyO2TAXEq7ecxETau0wVd83LPIdYFLGS
	jVh81sMKQC7/hzfs7+n74ptEupzJ/g0xefk/e8M16WYI9V8EWbLRfWosmmp9miq9Tn1BjRgc0Yo
	mK9dd2cZcDKqIgyUIi8bvqwibbuOyGSnsq6npQvMK9UgDniEMu8GRkSOTI+pqqZOjjF5srHE766
	yZglCrSSCxBCRCLjsnIij43WpFXHrtaeAPTNFAD4j0KCOwhXjbsDfc/21awgT+jMEznHoFpkb0I
	YIZZOrn9pCUd1u+LxD9/NTt
X-Received: by 2002:a05:600c:55da:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-493f88390dbmr36351225e9.36.1783865094860;
        Sun, 12 Jul 2026 07:04:54 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm76330888f8f.14.2026.07.12.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:04:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Sun, 12 Jul 2026 16:04:47 +0200
Message-ID: <cover.1783864932.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix gpio expander interrupt

v2->v3:
 - Add audio_refclk1 clock
 - Removed pinctrl_vdd_mmc2
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 483 +++++++++++++++
 4 files changed, 1045 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3

