Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053297;
	b=FFYCO3Vryd8wBWQtGEj9c+OTnxsp44Dml0TOqWi3m41CuIM2kgmyUxA9EEdYS2YATcOG
	 Htx9ns9Gtf9dopEk7nwfk9mN5I4cVqW74WYCbsGxDN7uw+Sy45FaPTuk9uvrQCarAlllO
	 BE2RyhDA0Y2ZtsLary0VywXEOqZVtLFqZc+NJa2OpgvH2EjR4TkXy5Zl7RuxGRhYN0Y7N
	 Gr3WVOQjsl9cLQ/fGr93vHlRXuf392dwj+t4pSifaCqg8Wf+Jn1PNE2yolkLKwSqCcr5Z
	 DKWQf1jJF9STP1qPBcbnaN80D3CCA/i3hzQsfXcHIvEqHVZ4UYNGEUqTua2CHhccxzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
	b=JWYBBpcu9PhiaqOuoxEp/Uc6tl4c8SUQRHRsMDdo7ocppUETa7DNN2DvLdNTg6+ZvjmH
	 CIpxpTZDSHAHqK5VsuCmX9CC7NXZvkDaRmjx455NDPokITE83wbSu5Jt65ese94j9sVdB
	 Hv4+KIml1aGqYF1lUz0j1lU9oBZpfLvNzMuoS3laH3ar/aIY562ELda4d6lf9XK4/5FXm
	 GgM+7iCenIxjUQnNLxB3s1HqbvESSwUksLBg4B+ZY45xLBDN+Kumd2XADp+tvFLaYre2w
	 xlITdloKxKIpV5tzHivYH1+VqLdOTUA2IRxmANTF++Q083YNfk1chCHGLd5qFmyQH2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676760A2608
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E676760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso1160024a12.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053296; x=1795658096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=nltqhrd0MMDZ7546deiSsw2uwq42t4c3i4uOD0uXOHy2rm2POJCcz0TxFstDHvoHpM
         /7crJUPoUAefBTJsrcZgBfnDlE7lNpDD/qTTwId33wMljgUFI61lnGlVDcLB1YofRILd
         FQUNgnLEgmL3uaUgOIGiu24veyJztsWw/OMqkQbHz8X5G+bHP8OojWbSlR/cjnoU1va1
         4cXxRINSVIrjwcRrrdxFNK2+yD0MrGLpdL6QMQ4MqtQO6GuTvicIdWLHmnun1fGBX/b1
         aQHourZFOB3X7BBJZbioOFbRdaH/AxGZg7lUk+4G+UF4GQxmu5WqJa1nDWRqIOXzCj7q
         qcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053296; x=1795658096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=sHmmI6aOxCFYHYxUAOHBmJiR/lrOiIECB8ScEvN8iNOU7eCxBZswB9H26LXbrC9fTB
         GGRPw33soBjBn0Zoh9ob94SB/qvsH/MHkUhxYMfpY61lnxNdOvJX55tjBTBc+VofG7Uo
         zM3n3mShi3I3Q7QvqCqCZNPlfP3xF5BkTRmZTjpXUin+yEenm3g9688j3K32jWfP90cL
         BnP7NcJSEVgjd3uoLwMFs0bqzwtf41TMUIBmWTWtSeBkXWyTBWWtVkg/gXZx6S3n40qJ
         ziKn/QCASkRn88OOVQ5zU2mXlRs9qE4yR0Tku4fU5VRHBG2tkw3lONdZNP1DC6RDuv/y
         bxjg==
X-Forwarded-Encrypted: i=1; AL+hErF2s5taaqmbD8fI8tolfPaN+qjTeINiBR3iPbSvKiHv5wl3whvI3Kof6i4//+UAytOiPyTcO+pxPuAP@vger.kernel.org
X-Gm-Message-State: APuU4Z8r0W61cOVDt2/EVEAugXhlsv74YsR9EdJjzBV6P63DEkAf6Euv
	vrWJwzN7heRVRe4+utPhzg68soqcBeWHijl7Xa1rmtBlDlc/JbFZx0N4
X-Gm-Gg: AZFdTZf4an/vL9Zp0pxLsRaihRnsT/hM9oBbgBBixhYGud93CnM+7OgAf+otVlm56fw
	j99JclPAiVkhFzbFnoMDRF2kzTolOhfVjJ16z7P4G64U1ObxhTOOFZo1DuY5q+nJ2M+P1J10vAd
	lF69z5tcQAL6qIaOtqCE7n+i4QQJptb/w3cBV+zK89wrBpdpOhWtnU697HOpEVGvqaORCwi3RNs
	iQ8hwsYowejMuMqEC08tnIOll7hTRy9Rk95xeJ4nWW2n/aBlV5rnLjiOtlq76yJx/7cgKIw1r6/
	BhHMHFE7JTBXFjcXVCXHQXZZNuOJ+8lpGADR7nOzFLUBVndIixpvPKFn7IR3jeTvDjG+yQb386s
	6pIwwWVWfVolOZkS7IJrV15vvuo1msoMdfiATcgSaTzlfEmmJMQkLNXhnV5BTJUwUImFGqEZ/IC
	42mcVIk5q9Vmioyhqcxkp9dmjx8/C6fDKSGHNTd4VXQBKX4wDWB0gJxYR5hPITQYUybTjqccr+D
	SdH6tQ/Pw8lk7HB3iA8eLjyZ9WPlODtfVZbz05j0UDKfHyYzakDTojBfPMKNmznz4kIkrcC92eO
	SStLXkh58U35fpyC0v4bzPwFDDQjexlHTr84E8o2rCvxd1J6gqm+9nA8CJnhSjrff5mxffFJE0t
	rHCwVncqph9xoJ3uLSloTscJnlx7IjUOsKikM
X-Received: by 2002:a17:90b:2ec7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b3d07a85e6mr4560280a91.29.1795053296137;
        Wed, 18 Nov 2026 17:54:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:55 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Thu, 19 Nov 2026 09:54:45 +0800
Message-Id: <20261119015447.160470-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc3:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v3:
 - Use dma_alloc_coherent() for the hardware SG table instead of
   kzalloc() + dma_map_single(); defer descriptor free in terminate_all().
 - Rename ma35d1_desc_submit() to ma35d1_desc_prep_done(); prep() only
   prepares the descriptor.
 - Rewrite the IRQ handler: read and ack TDSTS/ABTSTS once, then iterate
   the set bits.
 - Address issue identified by Sashiko AI review:
   - Terminate the descriptor with vchan_terminate_vdesc() when a cyclic
     transfer is aborted, avoiding a use-after-free in vchan_complete().
 - Request the IRQ after the DMA device is registered.
 - Use devm_of_dma_controller_register() and
   dmaenginem_async_device_register(), and drop remove(); a devm action
   stops the hardware and kills the tasklets.

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 662 ++++++++++++++++++
 4 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

