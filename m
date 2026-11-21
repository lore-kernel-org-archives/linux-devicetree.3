Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262856;
	b=cXVL0h4iYwPwihcd+Uinh4wHkMkoDeMGooTdvesdBEvRM0u3UqdMskzN+EG52pN8/rNH
	 NcsCSg5zXlNZAUoB/dGGj8sdFollQhCFLnJ7K2lvcLWZ69Mxi2P5miICBL3Db8cE+UDOj
	 oS4g1WYpGKnVelsyJZCcA/piGZQMZcLoMVRKKvAJMyMUq69yfF9rz3rQG+DMOyl/E+8Xg
	 ubK0etXbFx/6UPoBaBl3ABGqpEVqr/PL1KnMM9K4mvIOsNXnbsUxD3p5aNtpIpBE031t4
	 88YV+daD22yyiwXygxlDSUc29tQ+iZ24TL6R/mWmW4OY3am2fkbQ68QQQFpY2ZeYfnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
	b=DfIiyjFu7rZMqBFj4zQnAxiuGqILOMYUBUYiEkVe4ICpHjht4BHwID6a5VjQniK3Oiik
	 jI/f6WHbiXWwAwvpmF/8ikKBv8LNrQik/iNmmFC6zPNdCx2XfmamuMiDn0FSQlCs9vYTR
	 869WMCpBjvRDJdrOrMUALx/xbIv0zktAc62JiV30oKsivGud2X0LRsvx+W+ZtlSUE964C
	 89FD8rwPwdCu/sXY85z73wwVR1h+jab8mlAXF1IedQ0Z2vMiC/YeoOL+QhVsd/flxXRRm
	 vGDQC9DikrAdFeEObBZcWM4yJpTwZsKHW3uGgrEo2QJBfxugDD4LMw5fegA9//QzivQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/iC/+u4";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58338606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 12:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58338606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/iC/+u4
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38644aedba1so2068386eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262855; x=1795867655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
        b=W/iC/+u4sbexX8u+LA+9NIN5buU7oIE+B0bubycTCbGmO73MWPoyvylZv/b0xVrOXo
         yss5JeU8VmYNeQYFG2Za5x25aM3a7cG5ckBd1H8SiUlEKMNC+8QsnE6gAvNFAzD2RaUO
         TQgBdS5HaWADSSNyFFjpi1MwUokycgQRzVsFOZUDCbREv6zxLdQ9RFXHm4+wG84kl+9B
         ht4ORATdX27zg/32a5PTwM0aG8faC4tSuKP6gfCiyvkYP5tnirIj2XmomoeNQB/TwsAM
         pqwzGFEllw/6ROGxnm5xTYRGpxH3TX4Hj8UEd20YgRynvZi+IfZ51pEtu/IrCtM8R5S2
         aC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262855; x=1795867655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
        b=HoVjQUJRP6IqSaL9WLzJ0GLPC07bCf1EwRsOdqxCMW66h1Nn/4TmGNA4QTYfvF/of6
         Z1ehAI9E4Cl8OmNqf0NEhDLvHbB1AS8hspGRTsw2dA3uy3quLwJSL26s8gNkHN/ZOlTD
         anzNEpWtPms2ALOVvSY7TLVY+mO02cQp6OTPm3Y5RppqXPAAO5sE9QQVg8PYxFk2M/X1
         Pvhu0B92ymPmZe4+Yvm++TlGifNfvEW6GCfCqFanusC9V95v0fP4ZsriUXOXs+IUBMo4
         jV1NHpXFRKE/q8nGhX5iPMqWgZp46qcW+PrQlbMBQg4V7nbn62UNGxikcx52R2GW5onn
         4gOw==
X-Forwarded-Encrypted: i=1; AL+hErHQ3ytC69ReEgWOwH5rPUFxinI7I1aFlPDoZoRe8ZhQWIh2QvuYox50wYLLNf+6WoZQ4N75rjL+iHg1@vger.kernel.org
X-Gm-Message-State: APuU4Z/XBqs9x4/pIasgdK83EuF+NYkL66C0+/Kmy80G8P2RMzpdtfIU
	SLw8SVPznv+DwsOz2qQ4EB4ju6NTJduEskAd2d7pMvPqWbhDiLxxtMMM
X-Gm-Gg: AZFdTZehR2kuWsgim1GWN9HWByq10wRMfHNgsMdCVhRmp+9z1pceWAOKS2eVQDZTx6c
	WJT5SJMZE3ySjW39iOk2hqll3tipKCvtWVjh0P8/vkVyIBab6iLvZxEqD1w9GrLgsZlPR8Qrmg5
	JbEF7rc/m6CyVWdWRLcXdUTBRgIOmRSsSZDcX3YAK9HlgKlk7Y47j3O8EMulINSDp5CmKs0Du0R
	0dg4pBGqiOxxxjdcgYr0Bl+quzmCoRRHPBQSTjbmFwRxRtzCg1cm3xYRBwqZChOyMDpmLyQq1K6
	N55Qet1PtVUfcsPeVLg0PLbdudb+XDR/SmXNHu+RrEpzlBwDGYNmykHDUjPpfwpYzuCP+nMKo60
	YXnu3u+mRFHgsgLqyrg9LCMuj0q6pZhz0MbsEwbBr4Y9n2eFK0yQIahcqksGkalvYvHAK21WzCL
	KZnbbd1VC8UQb5SaMP4PYJh1juOE/ozzJm/neHMRfTjRJ+S/QwSwfG7YyChhugHV1GJ+Ud2FV6x
	OqDR4mO1n55HjN/raByMQhpIQO/0aCGTyqssmvNW1zvLfGFrRcxSdzCDokZxyovqAOUFGZODRtH
	SOBWIdC4Vw0bR9evJRNPXfdH/WhsJ4dmmUgkzRQwmXSR2Oq1LXKtXn+dU9jb9+GaNzTGoWfgbbE
	BcOo1rRIMTX+By0u2xRQ=
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr1648589eec.28.1795262855152;
        Sat, 21 Nov 2026 04:07:35 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm7465314eec.1.2026.11.21.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:07:34 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v2 0/2] media: i2c: Add Samsung S5K5E8YX camera sensor driver
Date: Sat, 21 Nov 2026 19:07:29 +0700
Message-ID: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
References: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
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

Add Device Tree bindings and a V4L2 subdev driver for the Samsung S5K5E8YX
5MP RAW10 CMOS image sensor.

Based on initial work by Andrii Cherniavskyi, updated with standby GPIO
handling, crop selection rectangles, MAINTAINERS entry, and tested on
Xiaomi Redmi Note 4X (msm8953 / mido) using libcamera SoftISP.

Changes in v2:
- Rebase series onto linux-media/media-committers next branch so Kconfig,
  Makefile, and MAINTAINERS apply cleanly in Media CI.
- Update .set_fmt and .get_selection signatures for
  const struct v4l2_subdev_client_info *ci in media-next.
- Convert PM ops to DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr().
- Fix subdev finalize error message and remaining checkpatch --strict
  parenthesis line-break style checks.
- Place DT binding MAINTAINERS entry in patch 1/2 so each patch passes
  checkpatch --strict independently.

Andrii Cherniavskyi (2):
  dt-bindings: media: i2c: Add Samsung S5K5E8YX image sensor
  media: i2c: Add Samsung S5K5E8YX camera sensor driver

 .../bindings/media/i2c/samsung,s5k5e8yx.yaml  | 102 ++
 MAINTAINERS                                   |   9 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/s5k5e8yx.c                  | 972 ++++++++++++++++++
 5 files changed, 1094 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
 create mode 100644 drivers/media/i2c/s5k5e8yx.c

-- 
2.43.0

