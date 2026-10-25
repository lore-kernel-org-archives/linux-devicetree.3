Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936687;
	b=XEIGy58wVVFfF7s80PDMJ6VPYgZPL0oIUMR4I17+4vX1pMZlACRVz3Qoj3CN71X2GguT
	 wsB82ox/usHyw4b8mXym6oHlranumsjYMr0vdHc/XOumXiP9ez7ML34pBtlsz2yH9UBkp
	 0YWc8IpuAV3xjYV3kRx5kWu+sRYGc4usRL6eUYBgVxbVmf4xj11veGKfI4AR35dcjSq3p
	 Q+EH8sVt0QN6BZecNG5xqT0TxS/w1745W0HZawhMPMw5zTwTXjzYK5JD9UpfmQT2mTxWB
	 mntD2ByGXylDuI2iTfds6SYlWfRmEZNCj1xduMvPpiHUmmAP0BDgaWjtFp7CyA1j1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
	b=WQ067riLANUIuQ7nNO0FPWd1kf7uvO15ryhk1OIkvXM8MmDNTEGVk5wen99XEadMvdiw
	 akz4aKSLgL9asvcOljqCr1t82BDuw5ZWaRHpHvBDGeyE3qOBU31V7hCfgl6Y5kv0Vsv3+
	 sZxsJyTXulktl+pm30L1ok1GrYgiCfDMN015mU6i6nt7YeejlKGQttc7HvF+9UwtfMwd0
	 k0cSq2ScxO7n/O3UQhtrKCrLnbI8PYUqzpsIuGG/H7XExnSgygsvT8GX2Acv5xlJOELsG
	 IwM3Aw+DTXDv8CqRAJCp8daTwTKLYk8Ly+/GBTrqkAj6susZMxjL+hRmX/1IkzEwCgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF120606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF120606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2306121f8f.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936685; x=1793541485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=celnVUjzyZ8riqqT/ARqFvt9z4k/NHLK86xuATMVdPDr6kaLZTTT2r+GCU14BDWnHb
         3fJSaXpBZbkXX0G28U6S/4p/5X9QvkKAcOzdUBcAr9Xxjljg1cLKJlmysIUOrLDb+OsI
         UnMt8FmHp9GKNffFb08sp5UTcTtqZ6Dq8dvaEoLKM7duXoPq8/tzKwbpEfWyIctDGZYJ
         UX0niJD7GNp51iwmyJPaEL5wo5vlEFmIcgnabGuy6uJdKrGX3d0Ji06M1k4f4C6dG3zq
         UfsrphygzVrxpFvHut3PhBzATLc5HaiEV00ON/wK9KDTXJSxU2VDMpFzU7q3UAJqefvD
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936685; x=1793541485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=VDioN5ESaNQzIUd9phq+Mi/c3P3P3AsgExwgQkNK4O/i5E+OmdlKJDibRMl1T2Yh1H
         MDKare1BrzZSq8S9/sesjZK7xcRc3Dow1lTdPDNiSKtuQYwV+hBnH3PhdxF2GDwJJqT3
         uUJ1AepU2ozNjRDEf8BDGQmIP6sHwTAla5AGtyVOpC9O2/7w/T2k5dVDJUHEQXOup395
         YPYhBUmd+cGqVBPnSZoGllNGbYZ2bagIP95fwEylaLGpD9BMz++DI4WcnwDljq1OyWN+
         GeF60zjFQwDs5gS3xG2t8W7dq28VTdqOCeRHpPFfhi1xOrA9w/zh4z5qvsTfrRum0xUs
         0kmw==
X-Forwarded-Encrypted: i=1; AKwUvBxMu+eO0MSx0nX8CUwj1YjmINxZ3fOTYy9Zqj3bjuxOOnZqoT4I3LPjSt+L2QmSoKqHiZc6/dJIwXft@vger.kernel.org
X-Gm-Message-State: AFq9FYIw+F6aneVKMdbQ6eA8Gp+cyNZFAetVGDtqYKSOt0cuBBe9oz1i
	MNsdp8qUY2IwBRC41Hf7XfsqoO+zi4i64WV62oGU0lZV1PCwi59O9h0Z
X-Gm-Gg: AYBFou2njEQhQ+UoW4Y1uRrucbz52mCSErxpQ4gYYduwEruv76uGnqurKoxV4Nx+IIa
	SbUD/N2AkmTXAltwNg2hQeVp5mMy70O5blADulkd8q+bUdoUdagzWwD48GM9G776q5rzlqEnz39
	Lkzw9xnaktzh5JnWL7JQjx/JDDaU3o+CLAgY3ttkIs1kbybsmEMDLMp5rjDPk+dUg9ixQac6fEC
	bI3Y9gGFUBbPdIU6D0gEbi23qKfQKMdCZpOsEOZmHj8cU2sx37xxZ1zfK7asVT4vHT5lPr8nZhz
	aX74+I04GehAzOeDGYL345zsGjNOeMq7dKfJS8eg4wafOlBY0BMPezqJ1kOniww7DODVgvOco1e
	eRaZWu2MqelDkGdHHmc0NCvh44kvwhYPo6rp3OpsysQ4Lyv59mZTbc6nKczzrwEL3mxpdiY0sYH
	Zf/YyyNfNjEev82K3stINuRjMpwFFx31pU7YOy6p+QCy2vIth8BMHCb9RXFQLVWrTQ41y3Gi2K/
	lzXAyhqEcDWidPhPSDr5LIoQwKM1aQVNsDKhShh/TYxTsIbxkSrgKvH4KEe+ni6l9KuZCSctRUE
	zFbPgkA5DoJUZQ==
X-Received: by 2002:a5d:6308:0:b0:48e:20ed:ce67 with SMTP id ffacd0b85a97d-48e3eb8bf9cmr5477047f8f.23.1792936684892;
        Sun, 25 Oct 2026 06:58:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:03 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:42 +0000
Message-ID: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

