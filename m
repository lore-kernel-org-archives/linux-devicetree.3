Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D956C642
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963201; cv=none; b=bC4LMDw1aOBBoYPoNWdWzEKoYnNTgxmmO6cN5SGV/oB932DAh+Dai7ScEjSHLgIeLl9Q7whLuLWNnnoPkh3U+VMxDtYB7OjBUC+la/TxJz4P2b/nrB2yZgoIe7gEOvqxC570gEPi2A9ycTekBTmzpuCd4pEitAeAGA6DitjxSp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963201; c=relaxed/simple;
	bh=gmFmfrJxoA7Nug84IXGdn2hbInOVt7EfY3z2c5RGPzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=db7ZrU3+VXI8JbkMLf4i6uBoOcb1Z52amS7jA2D7OezW6WgkydCz57HLHY9I4x8RLXySUOyDnVC593W9xNJSe33lLePH+H2/R38Ml4lECNt0IbAHVBdwP4rhTIn8IMIHPia4VE71ctDoTdtfPUJSneFttft88qN8owr5fm1kpu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hej+Qxsg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hej+Qxsg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485850cbac3so3858802f8f.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963198; x=1789567998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVGNbjOGRpPw3H08VWW1qB2tpMVtFhtvxOuvQrtYFmg=;
        b=Hej+QxsgaMjR8YUZQf1FayQskkaC3YcXIj/BSyVBk9HLGtfb4nCVVBOnUd7MD1lcr3
         b7AvvLeeDJKSagAFIVq1BwhEGQqmABXAR9CR5b3MzwHXH1477tsUmafPIC0zZ3lwepBo
         YWcbQe0a/U+WT4q0GcM0XS+rooJPm34LfDvABXFDDZWVgtf24A4gaJcrTbaH3UQfDfA2
         3dV8HFNrKMA8E/b4OssVO8ZAp9mf+iLDp5EKtcOME0nXpkS3CubjzsN6X3aNDit+xxYU
         LSvz9DvHYKj0DMHvvuRMO0rwgAfaOm35DMGAOHeTFddtPGe5WwJmaN2wWwNRGVwNrt5R
         hYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963198; x=1789567998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVGNbjOGRpPw3H08VWW1qB2tpMVtFhtvxOuvQrtYFmg=;
        b=jV8LuoY/T8EmIfSxDBBDRE3mOu8GvBamBlAIf9Rh7LsKh55r6+CMXwvq7kpQzwu2Pe
         N+xGjNI+c1HUVSpyPpAF+c//7R84wWZN/qhdTOM+zNgzdimzoIljIeKNfiYTp3s5oYyV
         mtS6j3d573HAbrgViVfb5bc1vOvH+L6vi6JCT9Yb9ke6oV6t0LG3ifl18PLviKVskywI
         AfM7th2qnB1J4mYhFKKo7tQ7A0BVy5fGLc2BL5ZvXco82pwO9cYEMvkhEl3VhlMjPYIP
         u7hXZAVPo06INYi+8eracekp0zzsubr3TzIK2Su6o9GzMYphjarPLag3/YbczeyjeNt2
         5Apg==
X-Forwarded-Encrypted: i=1; AKwUvBz4vCB6IWM2bcrujYgM2mHH3OHVHtnoAXw/H09oRXw6tND/DqN5G1jOrVCH046hkq3ehyqI5hJs7CY8@vger.kernel.org
X-Gm-Message-State: AFuF++kngc8HhO0g+kMa2UtBUYepNwVHEvi0jM3kZcJTNp7IAjeO+LD1
	oQZemWyVAysNfANTxXI0mKSihUBof41gVlA20q9WWuRELJrFBIhVE/Tq
X-Gm-Gg: AYBFou2KwWoVehPR+10qKbJXHVKkRI1ZUcQNThYutMp4gs4sUMvgjI91QApxqBK1jS9
	T0cU5JfFErCCmuHaVUtTokBLrpBken/Y/Q7eqaqun4YF7+YVcuOqndi3aHtrjQBGsqZObAMh6s+
	v0ySRdQdxIJbojDo3xXaUw7VUsqV0U8YbLcof5XMQKVbtaoxXF9hImIkRGcK2/JtfUCt88SgK+D
	7uSLW8WGAyps/b4iu9zX9kanTxMbhBiVA+ryxmHEAOST5cw+BB9p3o5MQvl6xjn4FBgYXmzktc8
	MopkhvYEV5act4oIRRNsE2ajCGgUoLU/9FC3FqyaAQRXfRHyscIrTL6wZ4TvOqwbbOe3DqSg7Ez
	zchloq01hOOcGyepVBGknoJ87pI7Yq6yFBTbtQ/vlYGZzUeaXpfDwi/mRDvgQe3yKa669SJilOi
	Rr9/Ts3bb0QWM1y+mByO62JgZ1CnkZPqJWy4RNWj/MiL/iTGC52iiQMPuV84o2mYMPon58ksA/c
	W9t/hKSo9Cy1wiD3lzthwmqrKbapdmA08DvmE57szs06lmG3M7b8BtR2A==
X-Received: by 2002:a05:6000:184f:b0:485:b148:aa13 with SMTP id ffacd0b85a97d-485b148acf3mr3046846f8f.40.1788963197769;
        Wed, 09 Sep 2026 07:13:17 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:17 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 0/3] Raspberry Pi 5 RTC driver
Date: Wed,  9 Sep 2026 16:12:57 +0200
Message-ID: <20260909141300.1368790-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC.
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C/SPI register interface).

This series adds:
  - a DT binding for the "raspberrypi,rpi-rtc" compatible
  - the RTC driver that talks to the firmware
  - the corresponding DT node for the Raspberry Pi 5 B

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a formal DT binding and moving the RTC node out of
the /soc node (it is not an MMIO device).

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via device-tree.

Testing
-------
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

Jonathan Bell (1):
  rtc: Add Raspberry Pi 5 RTC driver

Sander Speetjens (2):
  dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
  arm64: dts: broadcom: Add RTC to Raspberry Pi 5 B

 .../bindings/rtc/raspberrypi,rtc-rpi.yaml     |  48 +++
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   7 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rpi.c                         | 277 ++++++++++++++++++
 5 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
 create mode 100644 drivers/rtc/rtc-rpi.c

-- 
2.55.0

