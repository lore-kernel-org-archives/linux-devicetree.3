Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036918;
	b=CqGrAVGuzbCAO48B1wtBDY0IcVr8eV3MJg/UmOvHkpeErHHOw6scRMC8NrzK7DISd5YZ
	 vMzXglm6Gf8od3Pdb78xw2NGTYS9p5mk/Y+xUZG/DVgQRpiMW4oCi9G3oo0j4VcSEx9hE
	 ijBt7esBaahnPygMPnYMozKBlmQ+rExMcp59DLMdRft7XZl7Jmssjr9L6ZKpdUEv+DNBW
	 vsaOKniNmZ+WFK5TpNMM+IY1ipKbkDCcAvMQrmdyK6BcSiwlLbKJYBhgsK1PH3FXrBJhy
	 kCEjlF4kCoa5ZdP6hUodBvvlU6qHLopsjag4zF+VKi7cHo4DvbZEiQoUH3I+TtmUoew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hZ7yPLnsxhfMD/1GegWYSNSd6Og2H7HlUEBWqKkjyv0=;
	b=EizqoI+l3xCM3v1uDtmENl1UQ6uCzdNwCoX0d2O/OTZ9gEBJThfvUXGXsibJAYpStMLT
	 v3znsYCbJgzXKZR7ICkvzTKec3KWaZRFkTVUT8W9wyLHRJJt8EZdwT7xYwK9cuZeLkLFM
	 0dCtBcByYSslnDrcVD+fCxPPhF1j21bdyXVaBzBd/yxa828vDkWzBeWSzB+rfRtzaNbIq
	 /77HGs8fomUmUdNOn+RLCrwOS+QKYasmJM23zIKdzfrajTJOlDJxxXrWRZtyrtMl9/Z2P
	 W975EyMsPiTJ9QFGEzA54khL5sYc6cdViiiDh9ZFppSdkWR+ex3Ko9frvKYWBdpsa5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=luj5OyBl;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5F606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=luj5OyBl
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so1560940b6e.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036917; x=1793641717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZ7yPLnsxhfMD/1GegWYSNSd6Og2H7HlUEBWqKkjyv0=;
        b=luj5OyBlMjzI47kdwxhgM8mgrYKUhoBRUSg0hpxLNN6uQ9zCevu9POmM30b+XNOd6u
         JR/z4huFbN08fSZZhvslboiPFj4vTSup1htwNR1/1/cXm016iMFwVTBRMtE1fAyeBK8c
         iuNd5DaM75Nml1IR+ykUJtlAh7EkCBzhRr2yNdkjlDTPcoz9RLYuhPtpImB8j9dZcLL3
         o15opyBXotcESQ4kYYKqBY3d1wib0Zml8rWr1itSp/JhbEe03nmTU4AYQDRNEcvAetA+
         LCorGJ9RxcMH7WVCTQ+fRlKIjBU5ExdbHqY2MrgDsJo7XbwinyF8ahtZyDAUaZLZY477
         U4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036917; x=1793641717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZ7yPLnsxhfMD/1GegWYSNSd6Og2H7HlUEBWqKkjyv0=;
        b=LY8vHuc7yKcwz2T3dssyZaSMyl0dZNUs4B9QLyCoUvLFmCvODg2Z/J00I1AABvI8kf
         Jby+PyBoQDjWKZEAoUVz5hp/Q5oImskE1Zs1SfpxhqiSjTKzLHTgeWBXULFx0s5ZelFF
         958KqthcQZySSQTsdJb8/QkPzDL5cNe/L6+oxLElRr+YDtMWWC2iQZAWXWrZGEKYRuih
         nlM1vUjQr/b3GvAiAo/2B5mTtX/TQM6cs4g+FUpYpc4qbHVOxKWecVX9tlfu95ha3PPQ
         yzlI5TOu3XHBACveItLEka1eTfpgJPIn2+voloH95mZTbMRZ6sZkDRhQ4WXIzjZ8U8si
         C55w==
X-Forwarded-Encrypted: i=1; AKwUvByCd6QUgSA4jC5npkz8DjMKXwU1Cs2IzXtqUM/czgelP7K+e4zUAOG/+uhHA4Mgb61CBTDQiVXtkawN@vger.kernel.org
X-Gm-Message-State: AFq9FYLYqwGaYicfWF+NdPjovNqNgK5OO/LbdYruQp8m6mmW+QC1vdso
	cn1Bwx0ECQqdjHGwHtWWo/PRprHaMrZxqlbmNysStBkt0RPThECOmQqS
X-Gm-Gg: AYBFou2XILv3YRAEYVlD3ubU+UkcQqT43MqFFHLqVsGDqsEoL4Je+pOvCu1NFGbnuVi
	emfRiuHQWIT4H4INSQ10dCoC/Ka6rSKtw77a2F+goeecLmUWRtL9TcSsPr/6BoN2QgC4ebeuzbU
	BH1h59G/2UJaVp2CKcEtiD3FA1U004EIk4buYOO92Ge4zp6XV/R2NLrbY0ALtLd+V+zeqdkYB7a
	e1suRm7iV7LsmvN+2wEgMolyINjJezHj0fWA0Sb9uf9oxZeUaFyexD2nkGEj0gX1PyE0vQc+T/1
	y9qbQr/kzHiT2NoI1XE9XNdFtKPn7g9XEKE+sCWpbSPHtUf2ZvNNsqNjf8/joSdeZDgdpwy1bm3
	o0ma1SuErOYPovj6KjkQSH5tYw37EQCmSyzjalNzJbtfSkmuyp4n1GhpLFhA0L6uO9lueSyESAQ
	n1iQLePT8L6wefKAw5J6GA3J1/hKvi9Z/qxYXzc8loaejKnJwPTOTQrgOEUaVPLOEjdiE/IXIvJ
	RlIBK8z28g89PUaPyeqJF/ojmS5TLErexg3aU7E+K6PhQhKSdPyoIoB/05yhSzis1D2oZ2XBHys
	DX/QeLMIQ/GgmgRCOnRQs4IJgfUXhg==
X-Received: by 2002:a05:6808:4f2b:b0:4f6:5279:5c89 with SMTP id 5614622812f47-55c0026b905mr4577266b6e.47.1793036917104;
        Mon, 26 Oct 2026 10:48:37 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89e33sm5034753fac.1.2026.10.26.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:48:36 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	maccraft123mc@gmail.com,
	zhangqing@rock-chips.com,
	zyw@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lee@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/5] Fix Incorrect State of Charge for RK817
Date: Mon, 26 Oct 2026 12:48:29 -0500
Message-ID: <20261026174834.1652309-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Users of the popular firmware RockNIX had identified a few bugs with
accurately displaying the correct state of charge for RK817 battery
devices. With the help of one user analyzing the code with Claude
they were able to identify a few potential bugs along with potential
solutions which I was then able to verify. These bugs are as follows:

1) Incorrectly clamping a value with a max of 10000 instead of 100000.
This bug caused the state of charge to sometimes read as 10% instead
of 100% as it should have.

2) Using the boot_voltage value to calibrate the battery in scenarios
where it could not be trusted. The boot_voltage register populates
immediately at power-on, and the driver would check if this value
was older than 30 minutes before using it. Unfortunately when combined
with the default behavior of the bootloader to turn the device off
when plugged in (requiring a user to explicitly power the device on)
the boot_voltage and boot_timer values were wrong. The boot voltage
would not account for any voltage added while the device was off,
and the boot_counter that tracks the time the device was off would
be reset. To fix this we adopted the same behavior as the BSP driver
which would typically (outside of first-boot scenarios) use a value
saved to NVRAM or the value from the coulomb counter directly and
then recalibrate with the OCV voltage once it was available.

3) A similar issue would happen during suspend, as values from the
coulomb counter could not be relied upon. So we add suspend specific
recalibration to the driver.

Included in this series is another fix that would cause the battery
to drain while the system was shut down. This patch replicates the
Rockchip BSP driver to set a shutdown register and provides a
device-tree parameter to override the behavior (though I am not aware
of any existing boards that need the override).

Chris Morgan (5):
  power: supply: rk817-charger: Fix NVRAM SoC Value
  power: supply: rk817-charger: Resolve boot state of charge from the
    coulomb counter
  power: supply: rk817-charger: Correct the gauge across system sleep
  dt-bindings: power: supply: rk817-charger: Add
    rockchip,gate-function-disable
  power: supply: rk817-charger: Clear SYS_CAN_SD register by default

 .../bindings/mfd/rockchip,rk817.yaml          |   7 +
 drivers/power/supply/rk817_charger.c          | 336 +++++++++++++++---
 include/linux/mfd/rk808.h                     |   3 +
 3 files changed, 290 insertions(+), 56 deletions(-)

-- 
2.53.0

