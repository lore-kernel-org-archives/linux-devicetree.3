Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66383F20E3
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371652; cv=none; b=bzLIPx5ARaD0a1byEJ5IdI8s7gypTnt8qx3otwj8nAXA33r2DsLqFc6HVRTv8f3mvLNyZPX3lHsqpSAcq9axVDVo8B7bo3kiafLStOpXRFDhDHh9c6djmnjK/MXRBu4oBNQ1n6VRk9yly9UQZisJ0YDli9cnh2vIbutk1G69YgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371652; c=relaxed/simple;
	bh=+yUD30ycHUwTl/oRnxls4RQuAguVYB7r1/ttCmM18NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8EL71xkiWqll8n4zvMC/3is2ummcXxXxaQn/kvWurHPZHiV8H6Fj/uwY/ziS91nRrk+LM9cW3OsP9a8vFPmXsfISxberiU8H2370/SMINj398JaU8zyfV0Rlsrc0D2lj/rdMWY8BUqkOZUE7xc8PFOu3/rpyAJ7jaRkvmpdHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/r1+cv8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/r1+cv8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17477965e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371649; x=1786976449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUgBklvY23mceUXTKtC3ytvOgEkznOjtPrROK/VGe9c=;
        b=j/r1+cv8Qefi7I8kEEbyqvB1GLHt6YlpL8c0PdyTAJ4bVq43DZYeMlWAku7JRD3ulm
         NMatkkh9S6x5JMPdaeUDigh2j/CGmWM33QvujA1GtOGEQvyWaCzWKDKT3ClsrlbfwWma
         UIbu/VKEXurTmHlPkoeAAYimQsrhhOIgnG+mFxQRsTaGozSg7tnTb4uvV2l6F1gwEZXw
         MyIdOyS6W7svTz3ieArDA1CplrYuxrVQ7FE92S0clsqbH/YaAQZpLIkdakTa490VjFB2
         VPH90VG4hrZ7se8c58lxoCehAcWLtlYV65EKFAJbgKStPpfOXYJDe/zrHTyC1QDOwl+C
         Jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371649; x=1786976449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUgBklvY23mceUXTKtC3ytvOgEkznOjtPrROK/VGe9c=;
        b=X0nhoiSBq9+BtcKHwetyL5Qu4m5FsclCJ5gGt5ymAQZ/cReovJLkj2G4RllKYXuink
         eV76ILqPCHqxq2eA01D4R/JQA1i8CR450bt7F3MoJR+4qYWPyVxmWViaoqDZTDcBebgI
         PWUneEEpNpEE1DeZ8xQWF8XrAG6A0tD7M4q6E0tmigC/DOw3vE/enMMiz+7sWdk/FXaj
         6IVqkuI+JwipUQB75rvvSH+V/f7b7yt9+SEpywVNRrl4LVJr9HIYBptVHlPn+oApbCgz
         E5GKIJ1TtJinPd8RT3IJiqC7Tw09R/QPg/6FdSOeceLlFRfLVIuw72IcqxwqFYptxQcp
         YGRA==
X-Forwarded-Encrypted: i=1; AHgh+RrcaQKaKDsCifaA5dln1V8MhsGc2GniN10QCRs2N6eN1lybDLfhxBi2pry1l215P0RWBgX7gFKq/+vA@vger.kernel.org
X-Gm-Message-State: AOJu0YxWL6T856bRaQqAIzSWBJnKYkqErSHLaNdaHo11e8rU+MkQ5ecc
	+u+ZxdD5oH5luNF5JJmsp5rUkq3sMg+zTzXb03hvn5l1n4DOYDRv99t3Oucnn7j9
X-Gm-Gg: AR+sD12xqjwkgiYAJiOMtT8fDsnXkiC2cFs/KBL0Z/+IhzBlm9NsGVi+WQXe+EWYnDC
	w0T6uenbVUwtpPNAsmhouwKqTGgAKba6XmvI0vKyaWhAVOVxYTaL/Nj7ly1ylAI5OFosia0VFpJ
	vBj1G123yFf9ebYQSGrYyiHOy2IeEA2jt6dmj+rh2GWgE9gq4b2yJRv+DPiv8wJY6ufWW/JSlNK
	K0IEAtnvdng+E8ErUGcTRPGxAHGM1xtyiA6PdmAZ4QVGlfIfCu7fiO/Y1I9H1tanDfRki+O4IO4
	txScWkqrQI6QI7b50AToWnmi5E/VlpYGd8IBEBXYOrOEjhaW2oo+2P4rptVINBebvZ50MYp2T4c
	dEnndRhJgu1SzO/P8bVdFzfR50FI/7KtMugk3kn2uTGk27FkmYR1bQOShN07FvaVIj0vVrvYUlI
	IZM4FM/Y5nupk9gt9IoOvfoN2EQAF8aiOC+HKdRLjLtI4ENXtv2Kl8eI+g259uo9n2ib4=
X-Received: by 2002:a05:600c:a202:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4994e7d01b1mr420429285e9.15.1786371649047;
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:20:43 +0200
Message-ID: <20260810142047.2811230-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Mainline carries Iris carrier board device trees for every i.MX Colibri
but none for the Vybrid ones, so a VF50 or VF61 on that carrier has
nothing to boot with except the eval board tree. This series adds the
carrier, and picks up two things on the module tree on the way.

All of it is tested on a Colibri VF50 on an Iris V1.1 running 6.18.44.

Changes in v2:
- Document the two new board compatibles in fsl.yaml, so dtbs_check stays
  quiet. New patch 3, pointed out by the Sashiko review bot.
- No change to the other three patches.

v1: https://lore.kernel.org/all/20260810140053.2793495-1-mehmet.fide@gmail.com/

Patch 1 applies the EXT_IO pin group, which is defined in the module dtsi
and referenced by nothing. It replaces a patch I sent on 2026-08-07 that
hogged the group on &iomuxc; hanging it off gpio2 instead avoids the
fw_devlink dependency cycle that a pin controller referencing its own
child produces.

Patch 2 names the SODIMM lines, as the i.MX Colibri trees already do.

Patch 3 documents the carrier, patch 4 adds it.

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 ++
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 6 files changed, 319 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

-- 
2.54.0

