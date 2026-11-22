Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335081;
	b=jd8kl+APBRVyzqiQ/uxoHWrRs2A/mGBi03x+obouFuo8mXNSpsWKatiXngcX9fdw2bej
	 RKIPHTAerFOgNc+qON8FAos+r0ptaofz0uFEiIQr4BtroX9agSQ5cTD3KoY2o1nharqY6
	 WZ7TjgqGqxmsXZ4DZ7w1O5HKB3mor0ceU5gycKtTwpJCTUQHsTDJMdhRghC5iR4sJOlvd
	 y7CYWYBQeFiYRN7OMDoMScawja4cbpHP8LYgspZ01Ty7KoL20nttsb893DkAhzxz1+dno
	 XMxyHDV2uJYgpyNnJbb11SzNuZL7Mt2bynnIjou6Dvy0y68Ynyq6651yV2qeEZA/k6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7LQKFHuvOFPNMCnvLDkMXQ86A6lGIMolZPD7spZrCmg=;
	b=JFyB1nEz7K2unpDIwwqIxYaAESS5tPKnAVr8/rjg4LMKcXWc0anmQKTpD8lU6/OC+kwc
	 JSSS+b5FKtNirzaHLLZCGfKSOEuK3G61YvRrpJnNK4xomA++TS7z6IyH7s12ApqHhltdd
	 +ZFnszyde0wdEuPpGyi4lRrqDIAFdfYzYGkXqwsF0H+pb0WC0WqNdPNOFsgLzn8Dx2Hte
	 acp/mDGOVznQcBNIvbITz559Tm1ye63bobFHAC9B2s68Vlf39CWMqo3sYmTmN42dbMNlh
	 ZCcxzrBvP+vmRjAVfKexviEbx3bWQQOyYqONkGdd4uJeqzWfW7oLQOVkPzXRj3+xwyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oZwX/836";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB9606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEB9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZwX/836
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c515319dd89so231065366b.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335079; x=1795939879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7LQKFHuvOFPNMCnvLDkMXQ86A6lGIMolZPD7spZrCmg=;
        b=oZwX/836jpKkwmXyKQm2gtxEgzcHo1dgYkrA7jXR4jQMF1yPkum9RA6/9zUBSIAHF2
         qjaqvs5IcEc2p6grA9XhGOZgy6dHftV8EtcD/Ai8huCe1qJ/sacbhgBedTw0l/jvxOJu
         FB8r8Yzj64R96CvD+pKxfp8l1+luLjUp8SIw/WVIekUhOZLY+SjJxR6XSWue/+4Qdlcd
         gDNxqp8qTmuPWeyqD8+bkms9gaqO8/94Tzl8/t0XU7s8fZtLhtty7SIYCRBllnRzQWBv
         KpfoopyukdLmMj4rs8+ZAHCCvjyPXpsHh4AfRXQdeBpHU7sBRq6P/vzU44mCr8B4ye5v
         wMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335079; x=1795939879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LQKFHuvOFPNMCnvLDkMXQ86A6lGIMolZPD7spZrCmg=;
        b=viFye5G4j0Dr45ujf/fj8Exn4MNjxe+FkW+DGwP9ddacrs/45WKBCvmRip6auUGm/O
         yPxWIxH/S8/Lg25V2uHVry340G/36xrEPKClsL5g1L1uWIbVT4V18yZkmBoM9GR4QGlk
         xdF17LPZo3GudZ21PxFfPHbAA6MfMbJt11ztrBiQnhVlWh8Ik1I8oLA2VG+npd5++zWx
         vqs7tPXQOS1Rp1dpxsKopAclecYxX3lH/hM8Vdn9BhR/gEunzskCv40uqPfPrLvQsI3f
         DiDFb8VpfYLt7vV2c9GedALAoA1zjkodYgdmY1PIIhUgjL9pkLF+8qfcL8/87Z8dFVI4
         JJIQ==
X-Forwarded-Encrypted: i=1; AL+hErEQshk9Cr3GkTwVecaziC22vTrcBG72RB5CleIYRhneeDslSpmnLEcPPyMgqbWjS3OWuVU/xsJFKlPs@vger.kernel.org
X-Gm-Message-State: APuU4Z9csqhwbLmQPK2qH7bI/sDtRAWuq6LxRAPD3606MsLV8Cd+8TSa
	9UjQXOna8NGAMjmZfLbkvyx3M3yQW25nwAE2R2MDaMrAzICref0Gq4Ms
X-Gm-Gg: AZFdTZcmFEUS1AxgKFeSvR3YU0LjALmVJ4VDtN7D7qFf9otE6pcpgzh8rqzKFUck8FV
	V828ls6TCK1lC8n6fdIKdSijFtdYyGX6IeZMee/80eKLewlPSJgastekllFHYJMmm9epc6wJn33
	kWzScvxSB2aWEArzmN4y0p0TRmIuwhZb6zc7TYOe9i7x9Cii2zZN2NxmsYzxLGQXiVJjN3HD8TZ
	Ow3FmZktqSnMnTJU5vgo3U82y+UOTMRCWqwGgQBz6ydsEQURES8pVQyIRRANnQYpFWfBDB15L5A
	VxFpFn4AFpDK4Bds7mwbSFNGz0X9n22AQZmAwjEpp0RT5mw9njZvB3ErZe3BovlNCN7tFq09wm8
	7zJrz+Xue6yjbCwqp6+mPiaOzFEK7wUG0b2yIQwwePQ+A1Ldch+4EBfHVV07RVNbxvFiZRe1tT1
	TSUi4+Knn7Z3lgZpNjZmugPhlyJzOGva8U1gKR6DgsW+0HkgPD+RHqp1A3IhtHS8+qqPF2lNAFc
	QQVqO0fK0ihOFg21L9xO2Xr3oOLJtSF4EKGlzjqhdji3jz8umB4VYZ2V0Z9DqaeuOSN9D+l3PUA
	2v9G4Ei5+Y3rtnWcAIMk9w0PVw==
X-Received: by 2002:a17:906:4fc7:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c513a88a001mr676115566b.19.1795335079208;
        Sun, 22 Nov 2026 00:11:19 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm286835966b.22.2026.11.22.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:11:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mateusz Majewski <m.majewski2@samsung.com>,
	Thomas Turner <tturner@lineageos.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
Date: Sun, 22 Nov 2026 11:11:14 +0300
Message-ID: <20261122081114.2979414-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Alexey,

On Wed, Nov 18, 2026 at 01:51:44PM +0000, Alexey Klimov wrote:
> Tested with:
>
> tmu_top: thermal-sensor@100a0000 {
> 	compatible = "samsung,exynos850-tmu-top";
> 	reg = <0x10070000 0x800>;

Nit: the unit address doesn't match reg, it should be
thermal-sensor@10070000.

I ran v2 on a retail Samsung Galaxy XCover5 (SM-G525F, Exynos850, stock
Samsung bootloader and ACPM firmware), as a data point next to the
E850-96. Base: v7.4-rc3 plus out-of-tree board support, Tudor's acpm-tmu
fixes as queued in thermal/linux-next, then this series. Christian's
threshold-7 fix doesn't apply on top of those fixes yet, so it isn't
included; it only touches the GS101 path anyway. DT node as above, with
the unit address fixed, and three interrupt-only zones (polling-delay = 0,
an active trip at 50C with 2C hysteresis, critical at 110C).

What works:

- The TMU is accessible from the AP on this production device, so the
  direct MMIO approach isn't blocked by the secure world there. The
  bootloader leaves the block configured: two-point calibration
  (CALIB_SEL=1; 25C/85C codes 288/346, 288/346, 287/346, 287/345 for
  probes 0-3), CONTROL=0x9503, CONTROL1=0x00030000, AVG_CONTROL=0x00010016,
  COUNTER_VALUE0/1=0x28a, TRIM0=0. exynos850_tmu_init() computes the same
  values.

- ACPM read_temp for groups 0/1/2 tracks the raw CURRENT_TEMP codes of
  probes 1/2/3 within 1-2C.

- Threshold interrupts work. The GPU zone got a rising update at 50C and
  a falling one at 45C. After the CPU zones crossed 50C, their registers
  were re-armed correctly (rise ~110C, fall ~47C, INTEN = RISE1|FALL1).
  An 8-core load up to 83C caused no spurious updates.

Two issues:

1) THERM_TRIP_EN is cleared in exynos850_tmu_init() and never set again.
   CONTROL went from 0x9503 to 0x8503 after probe. The bootloader leaves
   level 7 programmed at code 0x177 (about 115C) with the hardware trip
   enabled, so after probe the hardware thermal trip is off. Samsung's
   downstream driver for this SoC (exynos3830 in exynos_tmu_v2.c) sets
   TRIP_EN together with CORE_EN when it enables the core. Should the
   driver keep it, or set it again in tz_control()?

2) Runtime PM gates the TMU pclk (gout_busif_tmu_pclk) 100ms after each
   access, but the ACPM firmware on E850 reads the TMU through that clock
   too. An ACPM TMU read_temp sent while the pclk is gated hangs the SoC
   until it resets, with nothing in the log. I hit this through an
   out-of-tree ACPM consumer that calls read_temp without going through
   acpm-tmu's runtime PM, so this series on its own does not trigger it:
   acpm_tmu_get_temp() resumes the device before the IPC. It reproduced
   both times with the clock gated, and the same read always works with
   the device held active (power/control = on).

   It does mean the clock is shared with the firmware, and gating it is
   only safe if ACPM never touches the TMU on its own while the AP has it
   gated. I can't rule that out from here: the bootloader leaves RISE7
   enabled on probe 0. The downstream driver never gates this clock.
   Would it be safer to keep it enabled while the device is bound on E850?

Minor:

- NUM_PROBE is set from priv->num_sensors (3 thermal zones). That happens
  to match what the bootloader programs (3, covering probes 0-3; probe 3
  keeps updating), but they are different quantities. Downstream reads
  NUM_PROBE back from CONTROL1 instead.

- About sashiko's temp_error2 point: all four probes on this unit have
  non-zero 85C trims, so that fallback isn't exercised here.

I'm happy to retest the next version on this phone.

Thanks,
Adil
