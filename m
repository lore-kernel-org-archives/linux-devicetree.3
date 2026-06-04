Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817B13B293
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584053; cv=none; b=Gkl8tf8cfesTCjVIXbX2hdxS13yxQw4tn+l2pE03LUWK1jTIJlGnrY+fQbZyZVMA20jp7xZoQgfeKc5YJSoZUCzQlfRUg3UCsqjGOSyi+zdDy6+XamXHo+HJpnAZ2LFPWRhrDRt07wzJg8eeKDeTsXHrew/qkYklyJmsml2Yu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584053; c=relaxed/simple;
	bh=cCQQTR9BQTegjjCAlHWxg4CufTI52gL9cLg5/LUcxPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaAvEj1LLALZa/MLm+hfehSPqbniT6vQbL77mPs93WCSvfQYNYP6VfxXpKR9e/3tSSLxHbwtRR/ohv7wy6oG5gKMp/QpwKUiYTwp+8yVl3L/Wa+wEt6ZkGvAXqBQe9t4CgX53ToNHDF54kYDX2voG9uoQEk9dzEbQhAO5ebny0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZwPJ4KO; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZwPJ4KO"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so632443a12.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584051; x=1781188851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MYjvVyEwufg+Sp1o9wIFatQQ1kTSx89J6iGBCB8C5c8=;
        b=MZwPJ4KOS1VbjpTBCRDkIM70Ek7VEDqWv3wwPJ5EzaScLcGeqcUyZGLxTE7Btp7OWP
         3CuQRO4Bg1BCexQn3/CPe+gzwLIIaR9WAWxtPdek+HZb8b5g5ap5XMtjN+sr3ebzO0VL
         7hwmiIFXpj134f4AOX//rOYdyG36BDRSxGgRy9srKoTvklLi8Y8RM/1axZowIoYq8y3v
         5GUpE88pGNo1jttNAENZAm5fLvJzmlhE8TuBBoOXg9Rli0F2C+j268tdPraij48lgWRa
         uaSZRUeKn4f5XYcFk4ieHRX4aWv6u8VeNHfNxpHyHdeAfVRZaY1BeYu/fAmbzRT5K5e4
         GPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584051; x=1781188851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYjvVyEwufg+Sp1o9wIFatQQ1kTSx89J6iGBCB8C5c8=;
        b=gaMI/sDxbGt3OH9KQAha28W+JXcyGig9RV8zbygdVYaVohTJmBMgvIagezt6Qz/pwx
         E7SAVqekMiN0e3HYkv2lUM7gFB/b44GxLcEx3nua54Y57KCcBHW16XRLch2Be73dl82p
         4NhlymBLTSLTVN5hNQT2elNdMaEJMbzfilaYxDCaXVne4AxJzUzkpHiif8sacTzDZv13
         bYOGVIRIiYEU1oPP4WyUgKJWzUlDj2Hl0aYMmJvJY9CjIyXiBnP2nfdfsi8N0AMuQXFz
         tTulfSOFkIgcuALyQ2QVEOQhNyJ7SMoOGO7nfKIHHvhwfb2Ii0vIDkULp7S9hZgZoPLJ
         TxCA==
X-Forwarded-Encrypted: i=1; AFNElJ85SZTaeylhre2pv+zhl3w0TV7rjnMwD6hTmn6t1sP6/+v5lIWvGAu7JACozDIsqLEmE+RDu2jrIHIk@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIlrEZMGANyz/apMJ51eYAUEDBdNaLBqrLBIjjFGpCG+SMWZn
	lyVD2hGn/Er9uyFJ9ZIqIzzjCY7UAAxGXgB3Ctaw64C+wTAuwPSSiuCA
X-Gm-Gg: Acq92OFPz8VTB6rB3dzESSuR1x5gbilAp+AMiELYfrQ8T/fCW0kNKEaS3cD32ib3c40
	WHMzM7LjnJ/NhLQmuWDZ8Y/c2pU+N5L9Bf9cGHTBTawDw8sgIq8Z34bzbH0Ehyloml+uHI47DSb
	XqXMFkfYWriq99+WBsrVHZUXOX4zQ77KDAeKBsP9vAcIg0jYvwL5Azi0SFoGC6yR+VG7frIEMyq
	TsiuBOIIeJJZdZuewx5z//SXlYEfQym4hj8de9waHQMmt/cvqchbuSG7+bvURSouR+YXwVHx22t
	gytvLzDXA3RYNqARvuuII9Xk3yhFiJmdytqnPV3ldd8NElTHuMafjmZA6IKFnsQdZ8K+sNey30b
	A5rYqKb4CGhG6ykdTFUECVzD1UUpOBLbfeecgItyTjLrmPmCIUef82nmWknqzelJIEh2Zd8yIzX
	9tkxKC6FE/NjpoAtrNu/bCoH9sdEQUivNdDJ0nWIpKqQGdhUUuQURxxB9a1i4qT+Cw0zepRLdK/
	8Qp8Z4GeNhJFckbWmGc/pjnucGv8ltg7JOVJJueNuqQ9Y/x8uP0Z47XPIOWUqc/
X-Received: by 2002:a05:6a00:4fc1:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-84284a8c87fmr7952955b3a.0.1780584050963;
        Thu, 04 Jun 2026 07:40:50 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:40:50 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] riscv: dts: tenstorrent: Add Atlantis platform 
Date: Fri,  5 Jun 2026 00:09:46 +0930
Message-ID: <20260604143957.668047-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART. This will be replaced in time with a full
featured machine once details are available.

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a new binding document for the aclint timer device.

The series has been boot tested on QEMU[1] and internal development
platforms.

[1] https://lore.kernel.org/qemu-riscv/20260603065859.592063-1-joel@jms.id.au/

Thanks to Anup and Connor for the reviews on v1.

v1:
https://lore.kernel.org/linux-riscv/20260603074222.593243-1-joel@jms.id.au/

Changes since v1:
- Rework mtimer bindings, fix reg property, update compatible and use
  priv spec as reference
- Drop Drew's sob from bindings patches I wrote
- Add Drew's co-developed-by to dts patch
- Correct aplic num-sources

Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  56 +++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  33 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 471 ++++++++++++++++++
 10 files changed, 579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3

