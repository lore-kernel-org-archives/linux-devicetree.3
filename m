Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945218;
	b=gGFmLfNTyCEgmzIKyCb94mpDalrtnTURK1pSceYnxuyR/TfMriifW68tOQPM+Kfq5E3J
	 /M8cEPKNQe2M1Rd5lmaI4KEJDwlmfTl0SVLiCA2QBSkNr2kHI3QS0zsJ/sfIQNZ2OrWlc
	 gVO33LaJbadA3DGsBZ5/dux4iFkSmKmHKQtd7pK9vcjP+axoSHqfDyxdUNU5KV2zCrxOw
	 ckIs7Qea93YF12rpTgXPUWGrfzDFdStSi0s1UxFTBWNKimAxY+irXNeaI1t0g59hRfJcl
	 CrAiCtxoAxQnPcKxujPMfx2jUGDuaP0eUpxsjqJzTXb3IAdVI0hIf0KjvKQz0xmktjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
	b=YPtrs9zzwz58zwjvTnipMZsT5/cC0murIu2uHTXYypIe6JL4vwC1rR+hEg4CVOt4NQdh
	 EK34Vwf8BiYWRl1DqE5nEJ+X8T3fMaQcEIOsMF0gfExFttHC2b7t+KpiltTm7s9mKRdOg
	 ARnINO9+/lHETm3HDaGy2B4CTIjZiLHE7l3xq+pNgpAivFl65PgLP3kSwF2ITOJIZOYWh
	 wJPblHhtYJaxftftiV/mPQjdkJST4cFJd+rt2Un2urMqEBDSbnmXT4aePOAGhWu4Wu3Cm
	 jluprM45DkaWLwv/79wLopQkM2b/xz2o+nsJqEx0OQqLl/2y9dBPZ+11TNbxab2ot3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bj2/h1dV";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83445606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83445606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bj2/h1dV
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so593598eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945218; x=1794550018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=Bj2/h1dVRmdU/7BaQU8t24ntY2qLAVJegIr4KYzGnzzycUX27g3gX+C5Txj+DeC84x
         qch6skHLZrHnw9ax5buB5oZcBA/E44nyPphxCeW2YWMJIdpRcdgiNkX0gUbJx0urdOfo
         LoDyme3iGaTP9yh8qRWQBBr/HkLej98uOqn/Jw+xjoWH3TPl6xyw0SerdUEGLg0saKZe
         7mIxd3thNUQ2Z3Q86kBGKSvZjeh72pOsVmUWIbhtLK/6S5aZAhduRhlmxo4lz6XaNY3p
         UmyeTN4GQb36QvqkJRgzwrpHEqzrY6cGkuHQ/HdHg+Noi0ffPCmXu/7xJoXsA3JgnE3R
         wusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945218; x=1794550018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=ui3QfI8fz/5a3Gak/Uyd4Mli0eYcr+nB/s4Kog2Zc3neumOMDm8IoY76hl8U1tMvnU
         dy7eCxWI+A60twQH9vpVMZhwYV6HZHJENqj/MgcVdGikaavhUcQSjajlfpvKVtUEuXUN
         IIB5htZ8vjYCqY9iLtja5/wYsFAItbkZl71ewi5kv10bgIDAb6BuKqn07X6cE2sUnUdi
         R5oj2PKj/lgq1p+hs1xj0sHwFNmdRAolT3J5GWrxEODm+0VaPpin2+O79FeXY6Z/HWaa
         hf2xTqnvkQ1firocj1taNZKyCEG/nxA8YsAxXzmytMFA6kylG5I5F/+S8Vm05UJAziop
         ymqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZdvgu68AUk97UTkm6GF+qZQD7X5cvUdNBC58gfVw5udI7g33305W12XEyeDv2GyBqfcsMoMvdQptv@vger.kernel.org
X-Gm-Message-State: APuU4Z/7HjmmgGXp5z5utRAO/3Xv+Ub3cjc1zl5OVHiFERKN046QyuPC
	xZ104J/LiOZDr2MEx24I+SuozoW2PRyQaS4+VcuMjF2ycqq5jGFP/ZELGSRGr76qTrYgqfnr
X-Gm-Gg: AYBFou2272biMnn23TDVMuXAkhYl+AJhVTEJPXPA7DdXkua1oRybNblNlynAtGJV2Vy
	aKBkDpvhW55D1SkCUGYWijNbtSn9n3rUk/qcuoO0/ZXNf54oWsGljH8wM9S3UcZbhmYxMqxsx0o
	3LwnBuah9B4f6riM+ItK4gnrVsBFLF17G86nfyoGuy2bKbrc1zs+67DAqm4PXEZj6c92KRgTERj
	17dgfOeYV8ZNQ6VxbMHFROmTJY27cwhhHGb7wDQ5EcD6SnymP9yWfz6tR3B3Vm9Ui7Fuvtzus9u
	wlGQgaED5miS513qsZkfHkTqVBuXTxPZ2NGULqv1186lav4Y6UD3bSAVkdZLUCfq8QEK3UcJdsh
	0x1kNpZuKU7K/6dB/9XRGTR5ed65kZSOXWosiad54UeOe8ZVT8mdQjdGiwAm2mzaaSNbC/GNvwB
	oLf0o7Y2MYzKcwWVjtIC87hlcr3HB725d6Nsk3IxSER3nkNHyMAXb50iByvmta5kmFDMthN4yi5
	IUPScAGF6ssrxtRcGSl80/3DdyC2pVcFw0Iaof4A2YMmZS2uG/EsDxJ10r2JAku3ysIkjjsJ530
	N+0h4yFDPZgu0P05Va5EMTaAXHmloy4rhg37AxTEsuxxQFrBGR6Z
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr1914086c88.47.1793945217607;
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 0/3] Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:22 +0800
Message-ID: <20261106060525.346873-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

The driver reads the shadow registers of bank 0 and bank 7 once during
initialization and keeps a copy in memory. Later NVMEM reads return data
from this copy without accessing the registers again. Reads outside the
two bank ranges return zeros.

Tested on a SpacemiT K3 COM260 Kit by reading both banks through the
NVMEM sysfs interface. The data was unchanged across a reset and a full
power cycle. Reads crossing a bank boundary returned the expected bank
bytes and zeros in the keepout region.

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  25 +++
 drivers/nvmem/Kconfig                         |  14 ++
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 151 ++++++++++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

